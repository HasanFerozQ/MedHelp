-- Batch 7: 31 Pediatric Nephrology & Endo MCQs (Questions 187-217)
-- Topic: Growth Disorders and Bone Age
-- Slug: peds-nephro-endo

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 14-year-old boy is concerned that he is the shortest in his class and has not yet started puberty. His height is below the 3rd percentile, but his growth velocity is normal (5 cm/year). His bone age is 11 years. Both parents are of average height. What is the most likely diagnosis?', 
'["Familial short stature", "Constitutional delay of growth and puberty (CDGP)", "Growth hormone deficiency", "Turner syndrome"]'::jsonb, 
1, 
'CDGP (the "late bloomer") is characterized by short stature in childhood, a delayed bone age (at least 2 years behind chronological age), and delayed onset of puberty. These children have a normal growth velocity and eventually reach a normal adult height within their target range.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 10-year-old girl is at the 3rd percentile for height. Her growth velocity is normal (5 cm/year), and her bone age is 10 years (consistent with her chronological age). Her father is 5''4" and her mother is 4''11". What is the most likely diagnosis?', 
'["Constitutional delay", "Familial short stature", "Growth hormone deficiency", "Hypothyroidism"]'::jsonb, 
1, 
'Familial short stature is characterized by a height below the 5th percentile, a normal growth velocity, and a bone age that is consistent with chronological age. The child''s height is appropriate for their mid-parental (genetic) target.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following is the most sensitive indicator of a pathological growth disorder?', 
'["A single height measurement at the 5th percentile", "A decrease in growth velocity (crossing percentiles) over time", "A bone age that is 6 months behind", "Weight at the 50th percentile"]'::jsonb, 
1, 
'Growth velocity is the change in height over time. A child who is "crossing percentiles" downwards on the growth chart (e.g., dropping from the 50th to the 10th percentile) is much more concerning for an underlying disorder than a child who is consistently at the 3rd percentile.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 12-year-old boy has a height at the 1st percentile. His growth velocity has slowed to 2 cm/year. His bone age is 8 years. On physical exam, he has a prominent forehead, midface hypoplasia, and increased truncal fat. What is the most likely diagnosis?', 
'["Constitutional delay", "Growth Hormone Deficiency (GHD)", "Achondroplasia", "Klinefelter syndrome"]'::jsonb, 
1, 
'Pathological short stature (GHD) is suggested by a significantly delayed bone age, poor growth velocity (< 4 cm/year after age 3), and characteristic facial/body features like midface hypoplasia and "doll-like" facies.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the standard initial screening test for suspected Growth Hormone Deficiency?', 
'["Measurement of a single random growth hormone level", "Measurement of Serum Insulin-like Growth Factor-1 (IGF-1) and IGFBP-3", "GH stimulation test with insulin or arginine", "Head MRI"]'::jsonb, 
1, 
'Growth hormone is secreted in pulses (mostly at night), so a single random level is useless. IGF-1 and its binding protein (IGFBP-3) are more stable throughout the day and reflect overall GH production, making them the best initial screening tests.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with short stature has low IGF-1 and IGFBP-3 levels. What is the definitive test required to diagnose Growth Hormone Deficiency?', 
'["Sleep study to measure nighttime GH", "GH stimulation test (using agents like clonidine, arginine, or glucagon)", "Karyotype", "TSH level"]'::jsonb, 
1, 
'The definitive diagnosis of GHD requires demonstrating an inadequate GH response (typically < 10 ng/mL) to at least two different pharmacological stimuli.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'How is the "Mid-parental height" (target height) calculated for a boy?', 
'["(Mother''s height + Father''s height) / 2", "[(Mother''s height + 13 cm) + Father''s height] / 2", "[(Father''s height - 13 cm) + Mother''s height] / 2", "Mother''s height + 10 cm"]'::jsonb, 
1, 
'For a boy: [Mother''s height + 13 cm (or 5 inches) + Father''s height] / 2. For a girl: [Father''s height - 13 cm (or 5 inches) + Mother''s height] / 2.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 13-year-old girl presents with short stature (height < 1st percentile), a webbed neck, and a broad "shield" chest with widely spaced nipples. She has not yet started puberty. What is the most likely diagnosis?', 
'["Noonan syndrome", "Turner syndrome (45,X)", "Silver-Russell syndrome", "Prader-Willi syndrome"]'::jsonb, 
1, 
'Turner syndrome is a common cause of short stature and primary amenorrhea in girls. Classic features include a webbed neck (pterygium colli), shield chest, cubitus valgus, and lymphedema of the hands/feet in infancy.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 12-year-old boy presents with short stature, a webbed neck, pectus excavatum, and a pulmonic stenosis murmur. He has a normal 46,XY karyotype. What is the most likely diagnosis?', 
'["Turner syndrome", "Noonan syndrome", "Silver-Russell syndrome", "Marfan syndrome"]'::jsonb, 
1, 
'Noonan syndrome is often called the "male Turner syndrome" because of clinical similarities (short stature, webbed neck), but it affects both sexes and is an autosomal dominant disorder. It is characteristically associated with right-sided heart defects (pulmonic stenosis) and hypertrophic cardiomyopathy.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with short stature, a small "triangular" face, and significant "asymmetry" of the limbs is most likely to have which syndrome?', 
'["Noonan syndrome", "Silver-Russell syndrome", "Prader-Willi syndrome", "Achondroplasia"]'::jsonb, 
1, 
'Silver-Russell syndrome is a form of primordial short stature. Key features include intrauterine growth restriction (IUGR), triangular facies, macrocephaly (relative), and hemihypertrophy/limb asymmetry.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with short stature, obesity, almond-shaped eyes, and small hands/feet was found to have neonatal hypotonia and a "weak cry" in infancy. What is the diagnosis?', 
'["Down syndrome", "Prader-Willi syndrome", "Cushing syndrome", "Beckwith-Wiedemann syndrome"]'::jsonb, 
1, 
'Prader-Willi syndrome is caused by a loss of paternal expression on chromosome 15. The hallmark is the transition from neonatal hypotonia and feeding difficulties to "hyperphagia" and morbid obesity in early childhood.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common cause of "disproportionate" short stature (where the limbs are short compared to the trunk)?', 
'["Growth hormone deficiency", "Achondroplasia", "Hypothyroidism", "Celiac disease"]'::jsonb, 
1, 
'Achondroplasia is the most common skeletal dysplasia. It is an autosomal dominant condition (often de novo) caused by a mutation in the FGFR3 gene, leading to rhizomelic (proximal) limb shortening, macrocephaly, and midface hypoplasia.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In Achondroplasia, which of the following skeletal findings is characteristic?', 
'["Long, thin fingers", "Trident hand (wide space between 3rd and 4th fingers)", "Missing clavicles", "Polydactyly"]'::jsonb, 
1, 
'The "trident hand" (three-pronged appearance of the fingers) is a classic physical finding in achondroplasia.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which systemic disease is a very common "silent" cause of short stature and growth failure in children, even without classic GI symptoms?', 
'["Diabetes mellitus", "Celiac disease", "Cystic fibrosis", "Juvenile idiopathic arthritis"]'::jsonb, 
1, 
'Celiac disease can present solely as growth failure and delayed puberty. Screening with tTG-IgA antibodies should be considered in any child with unexplained short stature.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 9-year-old child presents with a sudden drop in growth velocity. He also complains of constipation, dry skin, and cold intolerance. What is the most likely cause of his growth failure?', 
'["Growth hormone deficiency", "Acquired Hypothyroidism (e.g., Hashimoto thyroiditis)", "Cushing syndrome", "Nutritional deficiency"]'::jsonb, 
1, 
'Acquired hypothyroidism in childhood characteristically causes a "plateau" in growth velocity. Unlike many other causes of short stature, these children often have an *increase* in BMI because weight is not affected as much as height.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'How does the "Bone Age" typically compare to "Chronological Age" in a child with Hypothyroidism?', 
'["Bone age is advanced", "Bone age is consistent with chronological age", "Bone age is significantly delayed", "None"]'::jsonb, 
2, 
'Thyroid hormone is essential for bone maturation. In hypothyroidism, the bone age is significantly delayed, often matching the "height age" of the child.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 10-year-old boy has been on high-dose oral corticosteroids for severe asthma for the past year. He has become obese and his growth has stopped. What is the diagnosis?', 
'["Iatrogenic Cushing syndrome", "Growth hormone deficiency", "Diabetes mellitus", "Addison disease"]'::jsonb, 
0, 
'Exogenous glucocorticoids are a potent inhibitor of growth in children. They cause a characteristic combination of poor linear growth and weight gain (obesity).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the primary radiological tool used to assess "Bone Age"?', 
'["X-ray of the knees", "X-ray of the left hand and wrist", "X-ray of the skull", "Full body DEXA scan"]'::jsonb, 
1, 
'The standard for bone age assessment is an X-ray of the left hand and wrist, which is compared to a reference atlas (Greulich and Pyle) to determine the degree of epiphyseal maturation.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'An infant is born "Small for Gestational Age" (SGA). Approximately what percentage of SGA infants will "catch up" to a normal height by age 2?', 
'["10%", "50%", "90%", "Nearly 100%"]'::jsonb, 
2, 
'About 90% of children born SGA catch up by age 2. If an SGA child has not reached the normal growth curve by age 2-3, they are eligible for growth hormone therapy to improve their final height.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 4-year-old boy presents with failure to thrive and short stature. His growth chart shows that his *weight* began to drop first, followed months later by a drop in *height*. What is the most likely general cause?', 
'["Endocrine disorder (e.g., GHD)", "Nutritional or systemic disease", "Constitutional delay", "Achondroplasia"]'::jsonb, 
1, 
'In nutritional or systemic illness (like IBD or Celiac), weight is affected before height. In most endocrine disorders (like GHD or Hypothyroidism), height is affected more than weight (children are often "pudgy" but short).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'True or False: Growth hormone therapy is recommended for children with Constitutional Delay of Growth and Puberty (CDGP).', 
'["True", "False", "Only if they are under the 3rd percentile", "Only for girls"]'::jsonb, 
1, 
'False. CDGP is a normal variant. These children will reach their genetic potential without treatment. Occasionally, a short course of testosterone (for boys) may be used to "jumpstart" puberty if the delay is causing psychological distress.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with short stature is found to have "Psychosocial Short Stature" (Maternal Deprivation Syndrome). What is the expected outcome once the child is removed from the stressful environment?', 
'["Permanent short stature", "Rapid catch-up growth and normalization of GH secretion", "They will need lifelong GH shots", "None"]'::jsonb, 
1, 
'Psychosocial short stature is a unique condition where extreme emotional stress/neglect leads to a reversible state of functional GHD. Once placed in a nurturing environment, growth velocity increases dramatically.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which genetic syndrome is associated with short stature, pulmonary stenosis, and a characteristic "down-slanting" palpebral fissures?', 
'["Turner", "Noonan", "Marfan", "Williams"]'::jsonb, 
1, 
'Noonan syndrome has a distinct facial phenotype: low-set ears, ptosis, and down-slanting palpebral fissures, along with right-sided cardiac lesions.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Laron syndrome is a rare form of short stature caused by:', 
'["A pituitary tumor", "Growth hormone receptor insensitivity", "Hypothyroidism", "Vitamin D deficiency"]'::jsonb, 
1, 
'Laron syndrome involves a mutation in the GH receptor. These patients have *high* GH levels but extremely *low* IGF-1 because the GH cannot signal the liver to produce it. They are treated with recombinant IGF-1.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child''s growth velocity is 3 cm per year between ages 4 and 10. Is this normal?', 
'["Yes", "No, it should be at least 5 cm/year", "Yes, only for girls", "None"]'::jsonb, 
1, 
'The prepubertal growth velocity is relatively constant, typically between 5 and 7 cm per year. A velocity < 4 cm/year is always a red flag.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'When does the "peak height velocity" (growth spurt) typically occur in girls relative to boys?', 
'["Girls spurt 2 years EARLIER than boys (typically at Tanner Stage 2-3)", "Boys spurt earlier than girls", "They spurt at the same time", "Girls spurt after menarche"]'::jsonb, 
0, 
'Girls typically begin their growth spurt early in puberty (Tanner 2-3), whereas boys spurt later (Tanner 4). This is why girls are often taller than boys in early middle school.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common cause of "excessive" linear growth (tall stature) in an adolescent male?', 
'["Gigantism (GH-secreting tumor)", "Constitutional tall stature (Familial)", "Marfan syndrome", "Klinefelter syndrome"]'::jsonb, 
1, 
'Just as in short stature, "Familial Tall Stature" (having tall parents) is the most common cause of tall stature.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 15-year-old tall adolescent male has very long limbs (dolichostenomelia), joint hyperlaxity, and pectus excavatum. He is at high risk for which cardiovascular complication?', 
'["Pulmonary stenosis", "Aortic root dilation and dissection", "Coarctation of the aorta", "Patent ductus arteriosus"]'::jsonb, 
1, 
'Marfan syndrome (Fibrillin-1 mutation) is characterized by tall stature and arachnodactyly. Aortic root dilation is the most critical feature and requires regular monitoring with echocardiography.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which tall stature syndrome is characterized by a 47,XXY karyotype, small firm testes, and gynecomastia?', 
'["Marfan", "Klinefelter", "Homocystinuria", "Sotos syndrome"]'::jsonb, 
1, 
'Klinefelter syndrome is the most common sex chromosome abnormality in males. They are often tall with long legs and have hypergonadotropic hypogonadism.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In Homocystinuria (which mimics Marfan syndrome features), what is the characteristic direction of "ectopia lentis" (lens dislocation)?', 
'["Upward", "Downward", "Inward", "None"]'::jsonb, 
1, 
'Marfan syndrome lenses typically dislocate UPWARD. Homocystinuria (an amino acid disorder) lenses typically dislocate DOWNWARD.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What happens to growth velocity *after* the epiphyses of the long bones fuse?', 
'["It increases", "Linear growth stops permanently", "It slows down for 5 years", "Linear growth continues in the spine only"]'::jsonb, 
1, 
'Once the growth plates (epiphyses) fuse, no further linear growth is possible. Fusion is driven by sex steroids (estrogen in both sexes) at the end of puberty.')

;
