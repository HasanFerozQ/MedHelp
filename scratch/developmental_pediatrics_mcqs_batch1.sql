-- Batch 1: 30 Developmental Pediatrics MCQs (Questions 1-30)
-- Note: Replace (SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1) with the actual topic_id if needed

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A mother brings her infant to the clinic for a routine well-child check. The infant is able to lift his head and chest when prone, tracks objects past the midline, coos, and smiles responsively. However, he does not yet roll over or reach for objects. Based on these developmental milestones, what is the most likely age of this infant?', 
'["1 month", "2 months", "4 months", "6 months"]'::jsonb, 
1, 
'These milestones are classic for a 2-month-old infant. At 2 months, infants can lift their head and chest when prone (gross motor), track past the midline (fine motor/vision), coo (language), and exhibit a social smile (social). Rolling over and reaching for objects typically emerge around 4 months of age.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'During a 4-month well-child visit, which of the following gross motor milestones should a typically developing infant be expected to achieve?', 
'["Sitting alone momentarily without support", "Rolling from front to back", "Crawling on hands and knees", "Pulling to a stand"]'::jsonb, 
1, 
'At 4 months, a key gross motor milestone is rolling over, typically from front to back first (though some roll back to front). They also have no head lag when pulled to sit. Sitting alone momentarily occurs around 6 months, crawling around 9 months, and pulling to a stand around 9-10 months.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 6-month-old infant is evaluated in the clinic. The parents ask what new skills they should expect their child to start demonstrating. Which of the following fine motor skills is most appropriate for a 6-month-old?', 
'["Using a mature pincer grasp", "Transferring objects from one hand to the other", "Building a tower of 2 cubes", "Turning pages of a book"]'::jsonb, 
1, 
'At 6 months, an infant can typically transfer objects from one hand to the other and uses a raking grasp. The mature pincer grasp (using the tips of the thumb and index finger) develops later, around 9-12 months. Building a tower of 2 cubes is a 15-month milestone, and turning pages is typically seen around 18-24 months.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'At what age does a typically developing child start to exhibit stranger anxiety?', 
'["2-4 months", "6-9 months", "12-15 months", "18-24 months"]'::jsonb, 
1, 
'Stranger anxiety typically begins to develop between 6 and 9 months of age. This coincides with the cognitive development of object permanence and the ability to differentiate familiar caregivers from unfamiliar people. Separation anxiety, which is related, usually peaks slightly later, around 12-15 months.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 9-month-old child is brought to the pediatrician. Which of the following language milestones is considered normal for this age?', 
'["Speaking 3-5 distinct words", "Combining two words into simple phrases", "Babbling non-specifically (e.g., \"ba-ba\", \"da-da\")", "Following two-step commands"]'::jsonb, 
2, 
'At 9 months, infants typically engage in non-specific babbling (e.g., saying \"ma-ma\" or \"da-da\" but not necessarily directing it specifically at the parents). By 12 months, they use \"mama\" and \"dada\" specifically and may have 1-2 other words. Speaking 3-5 words is a 12-15 month milestone. Combining two words is a 24-month milestone.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'Which of the following is a normal gross motor milestone for a 12-month-old (1-year-old) child?', 
'["Walking independently and steadily", "Cruising along furniture and taking a few independent steps", "Running stiffly", "Jumping with both feet"]'::jsonb, 
1, 
'At 12 months, the typical gross motor milestone is standing well alone, cruising (walking while holding onto furniture), and often taking their first few independent steps. Steady, independent walking is generally achieved by 15 months. Running stiffly is an 18-month milestone, and jumping is a 2-year milestone.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A mother is concerned because her 18-month-old toddler does not yet speak in sentences. Upon evaluation, the child has a vocabulary of about 15 words and can point to three body parts. What is the most appropriate advice for this mother?', 
'["Reassure the mother that this is normal development for an 18-month-old", "Refer the child for immediate audiological testing", "Refer the child for a speech-language pathology evaluation", "Evaluate the child for Autism Spectrum Disorder"]'::jsonb, 
0, 
'This child is demonstrating normal language development for an 18-month-old. At 18 months, a child typically has a vocabulary of 10-25 words and can point to several body parts. Speaking in two-word sentences/phrases is not expected until 24 months of age (2 years). Reassurance is the correct action.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'During a 2-year well-child check, the pediatrician evaluates the child''s fine motor skills. Which of the following tasks should a 2-year-old be able to perform?', 
'["Copy a circle", "Draw a recognizable person with 3 parts", "Build a tower of 6 cubes", "Cut with scissors"]'::jsonb, 
2, 
'At 2 years of age, a child should be able to build a tower of 6 cubes. Copying a circle is a 3-year milestone. Drawing a person with 3 parts is a 4-year milestone. Using scissors effectively typically begins around 3 to 4 years of age.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 3-year-old child is expected to achieve which of the following language and social milestones?', 
'["Speech is 100% intelligible to strangers", "Knows their own age and gender", "Can define 5 words", "Engages in cooperative play with strict rules"]'::jsonb, 
1, 
'At 3 years old, a child typically knows their name, age, and gender. Their speech is about 75% intelligible to strangers (100% intelligibility is expected by age 4). They engage in parallel play or associative play, but cooperative play with rules is a milestone for older children (ages 4-5). Defining words is a 5-year milestone.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'When evaluating a 4-year-old child, which gross motor skill demonstrates normal development?', 
'["Riding a tricycle", "Hopping on one foot", "Skipping with alternating feet", "Walking up stairs holding the rail with two feet per step"]'::jsonb, 
1, 
'A 4-year-old is typically able to hop on one foot and balance on one foot for about 2 seconds. Riding a tricycle is a classic 3-year milestone. Skipping with alternating feet is a 5-year milestone. Walking up stairs with two feet per step is a 2-year milestone, while a 3-year-old can alternate feet going up.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'At what age should a child normally be able to copy a square and draw a person with 6 parts?', 
'["3 years", "4 years", "5 years", "6 years"]'::jsonb, 
2, 
'At 5 years of age, children develop the fine motor control to copy a square and draw a person with at least 6 distinct body parts. (Rule of thumb for copying shapes: Line at 2, Circle at 3, Cross at 4, Square at 5, Triangle at 6).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A newborn infant exhibits a reflex where sudden extension of the head causes symmetric extension and abduction of the arms, followed by flexion and adduction. This is known as the Moro reflex. At what age does this primitive reflex typically disappear?', 
'["1-2 months", "4-6 months", "9-12 months", "It persists into adulthood"]'::jsonb, 
1, 
'The Moro reflex is a primitive startle reflex present at birth. It typically disappears by 4 to 6 months of age as the central nervous system matures. Persistence beyond 6 months can indicate underlying neurological pathology (e.g., cerebral palsy).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'The Asymmetric Tonic Neck Reflex (ATNR), often called the "fencing posture," typically emerges around 2-4 weeks of age. When should this reflex completely disappear to allow the infant to roll over effectively?', 
'["2 months", "6 months", "9 months", "12 months"]'::jsonb, 
1, 
'The ATNR (fencing posture) is present in early infancy but must disappear by about 6 months of age. If it persists, it physically prevents the infant from bringing their hands to the midline and makes rolling over extremely difficult, serving as a red flag for motor dysfunction.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'Regarding normal infant growth parameters, a healthy, full-term infant is expected to double their birth weight by what age?', 
'["2-3 months", "4-5 months", "9-10 months", "12 months"]'::jsonb, 
1, 
'As a general rule of thumb for healthy, full-term infants: they regain their birth weight by 2 weeks, double their birth weight by 4-5 months, and triple their birth weight by 1 year (12 months) of age.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A healthy full-term infant is born with a length of 50 cm. Approximately what should this child''s length be at 1 year of age?', 
'["60 cm", "75 cm", "90 cm", "100 cm"]'::jsonb, 
1, 
'Infants typically grow about 25 cm (10 inches) in their first year of life. Therefore, an infant born at 50 cm will be approximately 75 cm long at 1 year of age, representing a 50% increase in length. They typically double their birth length by age 4.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'The anterior fontanelle is a diamond-shaped soft spot on the top of the infant''s head. At what age does the anterior fontanelle typically close?', 
'["2-3 months", "6-8 months", "12-18 months", "24-36 months"]'::jsonb, 
2, 
'The anterior fontanelle typically closes between 12 and 18 months of age. In contrast, the smaller, triangular posterior fontanelle closes much earlier, usually by 2 to 3 months of age. Premature or delayed closure can indicate underlying pathology (e.g., craniosynostosis or congenital hypothyroidism).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A parents ask about tooth eruption in their infant. Which teeth are typically the first to erupt, and at what approximate age?', 
'["Maxillary central incisors at 6 months", "Mandibular central incisors at 6 months", "Mandibular first molars at 12 months", "Maxillary canines at 18 months"]'::jsonb, 
1, 
'The lower central incisors (mandibular central incisors) are classically the first primary teeth to erupt, typically doing so around 6 months of age. They are followed closely by the upper central incisors (maxillary central incisors) around 8 months. Complete primary dentition (20 teeth) is usually achieved by 2.5 to 3 years.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 2-and-a-half-year-old child is brought in by her parents to discuss toilet training. Which of the following is considered a prerequisite sign of readiness for toilet training?', 
'["The child is 18 months old", "The child can communicate the need to go and stays dry for at least 2 hours", "The child can independently wipe themselves perfectly", "The child can pull down tight jeans with buttons"]'::jsonb, 
1, 
'Toilet training readiness is developmental, not strictly age-based, though it usually occurs between 18 and 30 months. Key signs of readiness include: awareness of a wet/soiled diaper, the ability to communicate the urge to void/defecate, staying dry for 2+ hours (indicating bladder capacity/control), and the gross motor ability to walk to the potty and pull down simple clothing.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'According to Piaget''s stages of cognitive development, the "Sensorimotor Stage" occurs from birth to approximately 2 years. Which concept is the hallmark achievement of the late sensorimotor stage?', 
'["Abstract logical reasoning", "Conservation of mass", "Object permanence", "Theory of mind"]'::jsonb, 
2, 
'Object permanence—the understanding that objects continue to exist even when they cannot be seen, heard, or touched—is the critical cognitive milestone achieved during the later part of the sensorimotor stage (typically developing between 8 and 12 months). This allows the child to search for hidden objects.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'An 18-month-old boy does not respond to his name, avoids eye contact, does not point to show interest, and has no words. He frequently lines up his toy cars and becomes highly distressed if the line is disturbed. What is the most appropriate next step in management?', 
'["Reassure the parents that boys talk later than girls", "Schedule a follow-up in 6 months to re-evaluate", "Refer immediately for a comprehensive developmental and autism evaluation", "Perform an EEG to rule out absence seizures"]'::jsonb, 
2, 
'This child displays multiple red flags for Autism Spectrum Disorder (ASD): lack of response to name, poor eye contact, absence of joint attention (pointing), delayed language, and restricted/repetitive behaviors (lining up toys). Any child with red flags for ASD requires immediate referral for a comprehensive developmental evaluation and early intervention services; watchful waiting is inappropriate.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'Which of the following is considered an absolute "red flag" requiring immediate developmental referral at the specified age?', 
'["Inability to roll over at 3 months", "Inability to sit independently at 9 months", "Inability to walk independently at 12 months", "Inability to speak in sentences at 18 months"]'::jsonb, 
1, 
'While rolling occurs around 4 months and walking around 12-15 months, an absolute red flag for motor development is the inability to sit independently by 9 months. Normal sitting occurs around 6 months. Failure to achieve this by 9 months warrants prompt neurological and developmental evaluation for conditions like cerebral palsy.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A healthy 15-month-old child is expected to have which of the following expressive language abilities?', 
'["Uses 3 to 5 specific words (other than mama/dada)", "Speaks in 2-word sentences", "Uses pronouns correctly (I, me, you)", "Has a vocabulary of 50 words"]'::jsonb, 
0, 
'At 15 months, a child typically uses 3 to 5 words specifically and correctly (in addition to "mama" and "dada"), and can point to 1 body part. A 50-word vocabulary and 2-word sentences are expectations for a 24-month-old (2 years). Pronouns are typically mastered around age 3.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'During play, a 2-year-old child sits next to another child in the sandbox. They are both playing with their own buckets and shovels but do not interact with each other or share toys. What type of play is this?', 
'["Solitary play", "Parallel play", "Associative play", "Cooperative play"]'::jsonb, 
1, 
'Parallel play is characteristic of toddlers (around 2 years old). Children play adjacent to each other with similar toys but do not try to influence each other''s behavior. Solitary play is seen in infants. Associative play (interacting but without a common goal) emerges around 3 years, and cooperative play (working together toward a goal with rules) emerges around 4-5 years.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 3-year-old boy is brought to the clinic. His parents note he frequently stutters, repeating the first syllables of words when he is excited. He does not seem frustrated by it. His language development is otherwise normal. What is the most appropriate management?', 
'["Immediate referral to a speech-language pathologist", "Reassure parents that this is likely developmental dysfluency and advise them to listen patiently without interrupting", "Prescribe a low-dose anxiolytic", "Recommend that the parents correct him every time he stutters"]'::jsonb, 
1, 
'Developmental dysfluency (stuttering) is very common in 3 to 4-year-old children as their expressive language demands outpace their motor speech abilities. If the child is not frustrated, does not have secondary tics, and the dysfluency consists of whole-word or syllable repetitions, it is benign and typically resolves spontaneously. Parents should be counseled to listen patiently and avoid interrupting or correcting.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'Which primitive reflex is elicited by firmly stroking the lateral aspect of the sole of the foot, resulting in extension (dorsiflexion) of the great toe and fanning of the other toes, and is considered a normal finding up to 1-2 years of age?', 
'["Moro reflex", "Plantar grasp reflex", "Babinski reflex", "Galant reflex"]'::jsonb, 
2, 
'The Babinski reflex is normal in infants due to incomplete myelination of the corticospinal tracts. It typically disappears by 12 to 24 months of age as the child begins to bear weight and walk, transitioning to the adult response (downward flexion of the toes). An upgoing Babinski in a child older than 2 years is pathological and indicates an upper motor neuron lesion.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 4-month-old infant is placed in the prone position. When the physician strokes the paraspinal muscles on the right side of the infant''s back, the infant laterally flexes his trunk towards the right side. What is this reflex called?', 
'["Galant reflex", "Parachute reflex", "Landau reflex", "Symmetric tonic neck reflex"]'::jsonb, 
0, 
'This describes the Galant reflex (trunk incurvation reflex). It is present at birth and helps the fetus descend through the birth canal. It typically disappears by 2 to 6 months of age. The Landau reflex is when an infant suspended horizontally in prone extension raises their head and arches their back (appears around 3-4 months).'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'At what age should a child reliably be able to ride a tricycle, alternate feet when going up stairs, and know their own age and sex?', 
'["2 years", "3 years", "4 years", "5 years"]'::jsonb, 
1, 
'These are all classic hallmark milestones for a 3-year-old. A 3-year-old rides a tricycle (3 wheels for 3 years), alternates feet going UP stairs (but still puts 2 feet per step going down), knows their age and sex, and speaks in 3-word sentences.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'The "Parachute reflex" is a protective response where an infant extends their arms forward when suddenly thrust headfirst toward the ground. When does this reflex typically appear, and when does it disappear?', 
'["Appears at birth, disappears at 6 months", "Appears at 4 months, disappears at 12 months", "Appears at 8-9 months, never disappears", "Appears at 2 years, never disappears"]'::jsonb, 
2, 
'The parachute reflex is a postural/protective reflex that emerges around 8 to 9 months of age, just as the child is learning to pull to a stand and walk. Because it is a necessary protective mechanism to prevent head injury during a fall, it persists throughout life and never disappears.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A 5-year-old child is expected to have mastered which of the following personal-social skills?', 
'["Using a spoon with minimal spilling", "Dressing and undressing completely without assistance", "Tying their shoelaces", "Washing and drying their hands independently"]'::jsonb, 
1, 
'At 5 years old, a child should be completely independent in dressing and undressing themselves (excluding difficult fasteners or tight clothing). Tying shoelaces is a more complex fine motor skill that usually develops around age 6. Using a spoon is a 15-18 month milestone, and washing hands is a 3-year milestone.'),

((SELECT id FROM topics WHERE slug = 'peds-developmental' LIMIT 1), 
'A healthy newborn fails the automated auditory brainstem response (AABR) newborn hearing screen in both ears prior to discharge. What is the most appropriate next step?', 
'["Reassure the parents that fluid in the ears is common and no follow-up is needed", "Prescribe prophylactic amoxicillin for presumed otitis media", "Schedule a repeat hearing screening within 1 month, and if failed, comprehensive audiological evaluation by 3 months", "Schedule a cochlear implant surgery consultation immediately"]'::jsonb, 
2, 
'According to the Joint Committee on Infant Hearing (JCIH) 1-3-6 guidelines: all infants should be screened by 1 month of age. If they fail, they must have a diagnostic audiological evaluation by 3 months of age. If hearing loss is confirmed, they must be enrolled in early intervention services by 6 months of age to maximize language development.')

;
