-- Batch 10: 31 Pediatric Nephrology & Endo MCQs (Questions 280-310)
-- Topic: Puberty and Tanner Staging
-- Slug: peds-nephro-endo

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the first physical sign of puberty in the vast majority of girls?', 
'["Pubic hair development (Pubarche)", "Breast bud development (Thelarche)", "Menarche", "Growth spurt"]'::jsonb, 
1, 
'Thelarche (breast budding) is usually the first sign of puberty in girls, typically occurring between ages 8 and 13. Pubarche (pubic hair) may occasionally precede breast development.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the first physical sign of puberty in boys?', 
'["Appearance of facial hair", "Deepening of the voice", "Testicular enlargement (volume >= 4 mL or length >= 2.5 cm)", "Pubic hair development"]'::jsonb, 
2, 
'Testicular enlargement is the first sign of puberty in boys, typically occurring between ages 9 and 14. This is due to the stimulation of the seminiferous tubules by FSH.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Tanner Stage 2 breast development in a girl is characterized by:', 
'["A small mound of breast tissue with no projection of the papilla", "Breast budding (thelarche) with a small area of surrounding glandular tissue and slight elevation of the nipple/areola", "Elevation of the areola and papilla to form a secondary mound", "No breast tissue"]'::jsonb, 
1, 
'Tanner Stage 2 is defined by the "breast bud." The areola widens, and a small amount of glandular tissue is palpable under the nipple.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which Tanner Stage is characterized by the elevation of the areola and papilla to form a "secondary mound" above the level of the breast?', 
'["Stage 2", "Stage 3", "Stage 4", "Stage 5"]'::jsonb, 
2, 
'Tanner Stage 4 is the stage of the "secondary mound." By Stage 5 (adult), the secondary mound disappears and only the papilla projects from the breast.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Precocious puberty is defined as the onset of secondary sexual characteristics before what age in girls and boys?', 
'["Age 6 in girls; Age 8 in boys", "Age 8 in girls; Age 9 in boys", "Age 10 in both", "Age 12 in both"]'::jsonb, 
1, 
'Puberty starting before age 8 in girls and before age 9 in boys is considered precocious and requires investigation.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 7-year-old girl presents with breast development and pubic hair. Her bone age is 10 years. An LHRH (GnRH) stimulation test shows a "pubertal" response (high LH). What is the most likely diagnosis?', 
'["Peripheral Precocious Puberty", "Central Precocious Puberty (CPP)", "McCune-Albright Syndrome", "Premature Thelarche"]'::jsonb, 
1, 
'Central Precocious Puberty is GnRH-dependent. It involves premature activation of the hypothalamic-pituitary-gonadal (HPG) axis. The high LH response to GnRH stimulation is diagnostic. CPP is much more common in girls and is often idiopathic.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 4-year-old girl presents with breast development and vaginal bleeding. She has several large "cafe-au-lait" spots with irregular borders. Her LH level is low and does not respond to GnRH. What is the most likely diagnosis?', 
'["Central Precocious Puberty", "McCune-Albright Syndrome", "Granulosa cell tumor", "Exogenous estrogen"]'::jsonb, 
1, 
'McCune-Albright is a form of Peripheral (GnRH-independent) Precocious Puberty. It is caused by autonomous ovarian activity (G-protein mutation). The combination of precocious puberty, cafe-au-lait spots, and fibrous dysplasia is classic.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the treatment of choice for a child with Central Precocious Puberty to prevent premature epiphyseal closure and short adult height?', 
'["Surgical removal of the pituitary", "Long-acting GnRH agonists (e.g., Leuprolide)", "Estrogen patches", "Testosterone"]'::jsonb, 
1, 
'Continuous (rather than pulsatile) administration of GnRH agonists down-regulates the GnRH receptors on the pituitary, effectively "turning off" the HPG axis and halting pubertal progression.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 2-year-old girl is found to have isolated breast development with no other signs of puberty (no pubic hair, normal growth velocity, normal bone age). What is the diagnosis?', 
'["Central Precocious Puberty", "Premature Thelarche", "Premature Adrenarche", "Ovarian cyst"]'::jsonb, 
1, 
'Premature thelarche is a benign variant of normal development, most common in girls under age 3. It does not require treatment but should be monitored to ensure it doesn''t progress to true precocious puberty.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 7-year-old boy presents with pubic hair and adult body odor. His testes are small and prepubertal (< 3 mL). What is the most likely source of the excess androgens?', 
'["Pituitary gland", "Adrenal glands (e.g., non-classic CAH or adrenal tumor)", "Testes", "Hypothalamus"]'::jsonb, 
1, 
'Pubic hair development (pubarche) without testicular enlargement indicates "premature adrenarche"—the early secretion of androgens from the adrenal glands. This is "peripheral" to the HPG axis.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Delayed puberty is defined as the lack of any pubertal signs by what age in girls and boys?', 
'["Age 10 in girls; Age 11 in boys", "Age 13 in girls; Age 14 in boys", "Age 15 in girls; Age 16 in boys", "Age 12 in both"]'::jsonb, 
1, 
'Puberty is considered delayed if there is no breast development by age 13 in girls or no testicular enlargement by age 14 in boys.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common cause of delayed puberty in both boys and girls?', 
'["Turner syndrome", "Constitutional Delay of Growth and Puberty (CDGP)", "Kallmann syndrome", "Anorexia nervosa"]'::jsonb, 
1, 
'CDGP (the "late bloomer") is a normal variant and is the most common cause of delayed puberty. There is often a family history of being a "late bloomer."'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 16-year-old boy with delayed puberty is found to have a *high* FSH and *high* LH level. This indicates:', 
'["Hypogonadotropic hypogonadism (Central problem)", "Hypergonadotropic hypogonadism (Primary gonadal failure)", "Constitutional delay", "Pituitary tumor"]'::jsonb, 
1, 
'High gonadotropins (FSH/LH) indicate that the pituitary is trying to stimulate the gonads, but they are not responding (primary failure). Examples include Klinefelter syndrome in boys and Turner syndrome in girls.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 15-year-old girl has not yet started puberty. She is also noted to have a lack of sense of smell (anosmia). What is the most likely diagnosis?', 
'["Turner syndrome", "Kallmann syndrome", "Anorexia nervosa", "Pituitary prolactinoma"]'::jsonb, 
1, 
'Kallmann syndrome is a form of hypogonadotropic hypogonadism caused by the failure of GnRH-secreting neurons to migrate from the olfactory placode to the hypothalamus. Anosmia is the key diagnostic clue.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common cause of primary amenorrhea and hypergonadotropic hypogonadism in girls?', 
'["Polycystic ovary syndrome", "Turner syndrome", "Androgen insensitivity", "Pregnancy"]'::jsonb, 
1, 
'Turner syndrome (45,X) leads to "streak ovaries" (gonadal dysgenesis) and a lack of estrogen production, resulting in high FSH/LH levels.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 14-year-old boy presents with a 2 cm, firm, slightly tender disk of tissue under his nipple. He is currently in Tanner Stage 3 of puberty. What is the most likely diagnosis?', 
'["Breast cancer", "Pubertal Gynecomastia", "Prolactinoma", "Klinefelter syndrome"]'::jsonb, 
1, 
'Pubertal gynecomastia (benign breast enlargement) is very common, affecting up to 50% of boys during mid-puberty (Tanner 2-3). It is due to a temporary imbalance in the estrogen/androgen ratio. It usually resolves spontaneously within 1-2 years.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following is true regarding "Menarche" in girls?', 
'["It is usually the first sign of puberty", "It typically occurs about 2-2.5 years after the onset of breast development", "It occurs during the peak of the growth spurt", "It indicates the start of the growth spurt"]'::jsonb, 
1, 
'Menarche is a late event in puberty, usually occurring at Tanner Stage 4, after the peak height velocity has already passed.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 16-year-old girl presents with primary amenorrhea. She has normal breast development but *no* pubic or axillary hair. What is the most likely diagnosis?', 
'["Turner syndrome", "Complete Androgen Insensitivity Syndrome (CAIS)", "Mullerian agenesis", "Kallmann syndrome"]'::jsonb, 
1, 
'In CAIS, the patient is genetically 46,XY but has a complete resistance to androgens. They develop breasts (due to peripheral conversion of testosterone to estrogen) but lack pubic hair (which is androgen-dependent). They have internal testes and a blind-ending vagina.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 16-year-old girl with primary amenorrhea has normal breast development and normal pubic hair. An ultrasound shows she is missing her uterus and the upper part of her vagina. Her karyotype is 46,XX. What is the diagnosis?', 
'["Turner syndrome", "Mullerian Agenesis (Mayer-Rokitansky-Küster-Hauser syndrome)", "Androgen insensitivity", "Polycystic ovary syndrome"]'::jsonb, 
1, 
'Mullerian agenesis involves the congenital absence of the structures derived from the Mullerian ducts (uterus, tubes, upper vagina) in an otherwise normal female with functioning ovaries.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Testicular volume is most accurately measured in the clinic using which tool?', 
'["A ruler", "A Prader Orchidometer", "Ultrasound", "A weighing scale"]'::jsonb, 
1, 
'A Prader orchidometer is a string of beads of different volumes used for comparison with the patient''s testes.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following describes "Tanner Stage 3" pubic hair?', 
'["Sparse growth of long, slightly pigmented hair at the base of the penis/labia", "Considerably darker, coarser, and curlier hair spreading over the junction of the pubis", "Adult-type hair but covering a smaller area than in adults", "Hair spreading to the medial thighs"]'::jsonb, 
1, 
'Tanner Stage 2 is sparse and straight. Tanner Stage 3 is darker, curlier, and begins to spread across the pubis. Tanner Stage 4 is adult-like but limited in area. Tanner Stage 5 spreads to the thighs.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In boys, what is the term for the spontaneous discharge of semen during sleep that often occurs around Tanner Stage 3?', 
'["Spermarche", "Pubarche", "Adrenarche", "Gonadarche"]'::jsonb, 
0, 
'Spermarche is the male equivalent of menarche, signifying the onset of sperm production.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Adrenarche (the rise in adrenal androgens) typically occurs at what age, often *before* the visible signs of puberty?', 
'["Age 4-5", "Age 6-8", "Age 10-12", "Age 14"]'::jsonb, 
1, 
'Adrenarche involves the maturation of the zona reticularis and typically occurs around age 6-8, leading to the development of adult body odor and occasionally sparse pubic hair before "true" puberty (gonadarche) begins.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with delayed puberty, short stature, and a midline defect (e.g., cleft lip/palate or a single central incisor) is likely to have which condition?', 
'["Turner syndrome", "Hypopituitarism (Septo-optic dysplasia)", "Celiac disease", "Hashimoto thyroiditis"]'::jsonb, 
1, 
'Midline facial defects are frequently associated with midline brain defects, including pituitary deficiencies (GHD, TSH deficiency, GnRH deficiency).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which common chronic illness is frequently associated with a functional *delay* in puberty due to chronic inflammation and poor nutrition?', 
'["Diabetes Mellitus", "Inflammatory Bowel Disease (Crohn Disease)", "Asthma", "Eczema"]'::jsonb, 
1, 
'IBD (especially Crohn disease) is a classic cause of delayed puberty and growth failure. The delayed puberty is "hypogonadotropic" (functional) due to the body''s suppression of the HPG axis during chronic illness.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 13-year-old girl has not had a period but presents with cyclical, monthly abdominal pain. On exam, a bluish, bulging membrane is seen at the vaginal opening. What is the diagnosis?', 
'["Turner syndrome", "Imperforate hymen", "Vaginal agenesis", "Pregnancy"]'::jsonb, 
1, 
'Imperforate hymen leads to "hematocolpos" (buildup of menstrual blood in the vagina). It presents as primary amenorrhea with cyclic pain and a palpable or visible vaginal mass.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which hormone is primarily responsible for the "growth spurt" in both boys and girls during puberty?', 
'["Growth hormone alone", "Testosterone alone", "The synergistic effect of Growth Hormone and Estrogen", "Progesterone"]'::jsonb, 
2, 
'While GH is essential, the pubertal growth spurt is driven by the rise in sex steroids (estrogen in both sexes) which stimulates the secretion of GH and acts directly on the growth plate.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child has "Premature Adrenarche." What is the long-term risk associated with this finding, especially in girls?', 
'["Short stature", "Increased risk for Polycystic Ovary Syndrome (PCOS) and metabolic syndrome later in life", "Infertility", "Brain tumor"]'::jsonb, 
1, 
'Premature adrenarche is associated with insulin resistance and carries an increased risk of developing PCOS in adolescence.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most likely diagnosis for an 18-year-old male with small testes, gynecomastia, and a 47,XXY karyotype?', 
'["Klinefelter syndrome", "Turner syndrome", "Noonan syndrome", "Marfan syndrome"]'::jsonb, 
0, 
'Klinefelter syndrome is a primary cause of hypergonadotropic hypogonadism and delayed/incomplete puberty in males.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the standard first-line imaging test to evaluate "Bone Age"?', 
'["Left hand/wrist X-ray", "Pelvic X-ray", "Head CT", "Chest X-ray"]'::jsonb, 
0, 
'The left hand and wrist X-ray is the standard for determining bone age, which is essential in the workup of both precocious and delayed puberty.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'An 8-year-old boy presents with pubic hair and advanced bone age. His testes are 8 mL (enlarged). This indicates:', 
'["Central Precocious Puberty (HPG axis activation)", "Peripheral Precocious Puberty (Adrenal source)", "Premature Adrenarche", "Normal development"]'::jsonb, 
0, 
'The enlargement of the testes (which requires FSH/LH) confirms that the precocious puberty is "central" (GnRH-dependent). If the testes were small, the source would be peripheral (adrenal or HCG-secreting tumor).')

;
