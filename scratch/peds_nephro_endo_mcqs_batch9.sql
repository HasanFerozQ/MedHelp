-- Batch 9: 31 Pediatric Nephrology & Endo MCQs (Questions 249-279)
-- Topic: Adrenal Disorders
-- Slug: peds-nephro-endo

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common enzyme deficiency in Congenital Adrenal Hyperplasia (CAH), accounting for > 90% of cases?', 
'["11-beta-hydroxylase", "21-hydroxylase", "17-alpha-hydroxylase", "3-beta-hydroxysteroid dehydrogenase"]'::jsonb, 
1, 
'21-hydroxylase deficiency is the most common cause of CAH. It leads to impaired synthesis of both cortisol and aldosterone, with a buildup of androgen precursors.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A newborn girl is born with ambiguous genitalia (clitoromegaly and fused labia) but a normal uterus and ovaries on ultrasound. What is the most likely diagnosis?', 
'["Turner syndrome", "Congenital Adrenal Hyperplasia (21-hydroxylase deficiency)", "Androgen insensitivity syndrome", "Mullerian agenesis"]'::jsonb, 
1, 
'In female infants with 21-hydroxylase deficiency, the excess androgens produced in utero cause virilization of the external genitalia. The internal female structures (uterus, ovaries) are normal because they are not androgen-dependent.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 2-week-old male infant presents with severe vomiting, dehydration, and a weight loss of 15% from birth weight. Lab results: Sodium 122 mEq/L (low), Potassium 7.8 mEq/L (high). What is the most likely diagnosis?', 
'["Pyloric stenosis", "Salt-wasting CAH (21-hydroxylase deficiency)", "Gastroenteritis", "Diabetes Insipidus"]'::jsonb, 
1, 
'This is the classic "salt-wasting" crisis of CAH. The lack of aldosterone leads to hyponatremia and hyperkalemia. Male infants do not have ambiguous genitalia, so they often present later with life-threatening shock.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the key diagnostic laboratory marker for 21-hydroxylase deficiency CAH?', 
'["Elevated 11-deoxycortisol", "Elevated 17-hydroxyprogesterone (17-OHP)", "Low Testosterone", "High Aldosterone"]'::jsonb, 
1, 
'17-OHP is the substrate for 21-hydroxylase. When the enzyme is deficient, 17-OHP levels rise significantly. This is the basis for the newborn screening test for CAH.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In a patient with "11-beta-hydroxylase" deficiency, how does the clinical presentation differ from 21-hydroxylase deficiency?', 
'["They have low blood pressure", "They typically have hypertension and hypokalemia", "They are not virilized", "They have low 17-OHP"]'::jsonb, 
1, 
'11-beta-hydroxylase deficiency leads to the buildup of 11-deoxycorticosterone (DOC), which has mineralocorticoid activity. This causes sodium retention, hypertension, and hypokalemia, along with virilization.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 4-year-old boy presents with early pubic hair growth, an enlarged penis, but small prepubertal testes. His bone age is 7 years. What is the most likely diagnosis?', 
'["Central precocious puberty", "Non-classic (late-onset) CAH", "Leydig cell tumor", "Exogenous testosterone exposure"]'::jsonb, 
1, 
'Non-classic CAH presents later in childhood with signs of androgen excess (premature adrenarche, advanced bone age) but without salt wasting. Small testes in the setting of virilization indicate a "peripheral" source of androgens.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the long-term maintenance treatment for a child with salt-wasting 21-hydroxylase deficiency?', 
'["Hydrocortisone and Fludrocortisone", "Prednisone only", "Testosterone", "Growth hormone"]'::jsonb, 
0, 
'Hydrocortisone replaces the missing cortisol (and suppresses ACTH to reduce androgen production), while fludrocortisone replaces the missing mineralocorticoid (aldosterone).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with CAH is ill with a high fever and vomiting. What is the most important adjustment to their medication?', 
'["Double the fludrocortisone dose", "Triple the hydrocortisone dose (Stress Dosing)", "Skip the dose until they stop vomiting", "Start insulin"]'::jsonb, 
1, 
'During periods of physiological stress (fever, surgery, trauma), the body requires higher levels of cortisol. Patients with adrenal insufficiency or CAH must be given "stress doses" of glucocorticoids to prevent an adrenal crisis.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following is a classic clinical finding in "Acute Adrenal Crisis"?', 
'["Hypertension", "Refractory hypotension and shock", "Hyperglycemia", "Hypokalemia"]'::jsonb, 
1, 
'Adrenal crisis is a medical emergency characterized by severe shock that is often unresponsive to fluid boluses and vasopressors until glucocorticoids are administered.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 6-year-old child with meningococcemia suddenly develops circulatory collapse and purpura fulminans. Autopsy reveals bilateral hemorrhage into the adrenal glands. What is this condition called?', 
'["Cushing syndrome", "Waterhouse-Friderichsen syndrome", "Addison disease", "Schmidt syndrome"]'::jsonb, 
1, 
'Waterhouse-Friderichsen syndrome is acute adrenal insufficiency caused by massive hemorrhage into the adrenals, typically associated with severe bacterial septicemia (most commonly Neisseria meningitidis).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the pathophysiology of "Addison Disease" (Primary Adrenal Insufficiency)?', 
'["Destruction of the adrenal cortex, leading to deficiency of all adrenal steroids", "A pituitary tumor secreting too much ACTH", "A defect in the hypothalamus", "Excessive salt intake"]'::jsonb, 
0, 
'Addison disease is the autoimmune or infectious destruction of the entire adrenal cortex, resulting in low cortisol, low aldosterone, and low androgens.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 10-year-old girl with Addison disease has noticeable "hyperpigmentation" of her skin, especially in the palmar creases and over the knuckles. Why does this occur?', 
'["Due to high levels of cortisol", "High ACTH levels lead to increased production of Melanocyte-Stimulating Hormone (MSH) precursors", "Poor hygiene", "It is a sign of iron overload"]'::jsonb, 
1, 
'In primary adrenal insufficiency, the lack of feedback leads to very high ACTH. ACTH is derived from POMC, which also produces MSH. High POMC/ACTH levels stimulate melanocytes, causing hyperpigmentation. This is *not* seen in secondary (pituitary) adrenal insufficiency.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In a patient with suspected adrenal insufficiency, a "Short ACTH Stimulation Test" (Cosyntropin test) is performed. What result is diagnostic of *primary* adrenal insufficiency?', 
'["A rapid rise in serum cortisol", "A failure of the serum cortisol to rise (typically < 18 mcg/dL)", "A rise in blood glucose", "A drop in TSH"]'::jsonb, 
1, 
'In primary adrenal insufficiency (Addison''s), the adrenal glands are damaged and cannot respond even to a high dose of exogenous ACTH. Thus, cortisol levels remain low.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common cause of *secondary* (central) adrenal insufficiency in children?', 
'["Pituitary tumor", "Chronic use of high-dose exogenous corticosteroids (e.g., for asthma or nephrotic syndrome)", "Head trauma", "Infection"]'::jsonb, 
1, 
'Chronic exogenous steroid use suppresses the CRH-ACTH axis. If the steroids are stopped abruptly, the suppressed pituitary and adrenals cannot produce enough cortisol, leading to secondary adrenal insufficiency.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with secondary adrenal insufficiency (e.g., from a pituitary tumor) will typically have normal levels of which adrenal steroid?', 
'["Cortisol", "Aldosterone", "Androgens", "DHEA"]'::jsonb, 
1, 
'Aldosterone secretion is primarily regulated by the Renin-Angiotensin system and serum potassium, not by ACTH. Therefore, mineralocorticoid function is usually preserved in central (pituitary) adrenal insufficiency.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Cushing *Syndrome* refers to any cause of excess cortisol. Cushing *Disease* specifically refers to:', 
'["An adrenal tumor", "An ACTH-secreting pituitary adenoma", "Exogenous steroid use", "Ectopic ACTH production"]'::jsonb, 
1, 
'Cushing Disease is the most common endogenous cause of Cushing syndrome in children over age 7 and is due to a pituitary adenoma.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following physical findings is a hallmark of Cushing syndrome in children?', 
'["Excessive height", "Weight gain accompanied by a *decrease* in linear growth velocity", "Profound weight loss", "Precocious puberty with a growth spurt"]'::jsonb, 
1, 
'A key feature distinguishing simple obesity from Cushing syndrome is growth. Children with simple obesity are often tall for their age; children with Cushing syndrome are short and have poor growth velocity due to the inhibitory effects of cortisol on the growth plate.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the best initial screening test for suspected Cushing syndrome?', 
'["Random morning cortisol", "24-hour urinary free cortisol or late-night salivary cortisol", "ACTH level", "Abdominal CT"]'::jsonb, 
1, 
'Random cortisol is not useful due to diurnal variation. The 24-hour urine or late-night saliva tests assess the loss of the normal diurnal rhythm (cortisol should be at its lowest at night).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child has high cortisol and a *low* (suppressed) ACTH level. Where is the most likely location of the problem?', 
'["Pituitary gland", "Adrenal gland (e.g., adrenal adenoma)", "Hypothalamus", "Lungs"]'::jsonb, 
1, 
'Low ACTH indicates that the excess cortisol is suppressing the pituitary. The source of the cortisol must be independent of ACTH, most commonly an adrenal tumor or exogenous steroids.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the "Dexamethasone Suppression Test" used for?', 
'["To diagnose Diabetes Insipidus", "To confirm the diagnosis of Cushing syndrome and help determine the source", "To treat adrenal crisis", "To screen for Turner syndrome"]'::jsonb, 
1, 
'Dexamethasone is a potent glucocorticoid. In a healthy person, even a low dose should suppress ACTH and cortisol. Failure to suppress indicates Cushing syndrome.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which rare genetic syndrome is characterized by adrenal tumors, pituitary tumors, and primary hyperparathyroidism?', 
'["MEN 1", "MEN 2A", "Von Hippel-Lindau", "McCune-Albright syndrome"]'::jsonb, 
0, 
'MEN 1 (Multiple Endocrine Neoplasia Type 1) involves the "3 Ps": Parathyroid, Pancreas, and Pituitary.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with McCune-Albright syndrome presents with precocious puberty, "cafe-au-lait" spots with irregular borders, and what skeletal finding?', 
'["Osteosarcoma", "Polyostotic fibrous dysplasia", "Rickets", "Achondroplasia"]'::jsonb, 
1, 
'McCune-Albright is caused by an activating G-protein mutation. It presents with the triad of fibrous dysplasia (bone cysts), cafe-au-lait spots ("coast of Maine" borders), and autonomous endocrine hyperfunction (most commonly precocious puberty).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common cause of *primary* hyperaldosteronism (Conn syndrome)?', 
'["An aldosterone-secreting adrenal adenoma", "Renal artery stenosis", "Dehydration", "High potassium intake"]'::jsonb, 
0, 
'While rare in children, Conn syndrome is typically due to a unilateral adrenal adenoma secreting excessive aldosterone, leading to hypertension and hypokalemia.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child is born with "Beckwith-Wiedemann Syndrome." He has macrosomia, macroglossia, and hemihypertrophy. He is at high risk for which adrenal tumor?', 
'["Pheochromocytoma", "Adrenocortical carcinoma", "Neuroblastoma", "Insulinoma"]'::jsonb, 
1, 
'Children with Beckwith-Wiedemann syndrome have an increased risk for embryonic tumors, particularly Wilms tumor, hepatoblastoma, and adrenocortical carcinoma.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What electrolyte abnormality is characteristic of "primary" hyperaldosteronism?', 
'["Hyponatremia", "Hypokalemia", "Hypercalcemia", "Low bicarbonate"]'::jsonb, 
1, 
'Aldosterone promotes Na+ reabsorption and K+ excretion. Excess aldosterone leads to hypertension (Na+ retention) and hypokalemia.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with adrenal insufficiency presents with a serum sodium of 125 mEq/L and a potassium of 6.2 mEq/L. Which adrenal steroid deficiency is primarily responsible for these electrolyte changes?', 
'["Cortisol", "Aldosterone", "Testosterone", "Epinephrine"]'::jsonb, 
1, 
'Aldosterone deficiency (seen in primary adrenal insufficiency and salt-wasting CAH) leads to "salt-wasting" (low Na+) and K+ retention (high K+).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'True or False: Most children with 21-hydroxylase deficiency CAH will have a *low* blood pressure if untreated.', 
'["True", "False", "Only the females", "None"]'::jsonb, 
0, 
'True. Lack of aldosterone and cortisol leads to volume depletion and hypotension, eventually progressing to shock.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A teenage girl with CAH has significant hirsutism (excessive hair growth) and irregular periods. What is the goal of her medical management?', 
'["To increase her testosterone", "To suppress her high ACTH levels using glucocorticoids", "To give her estrogen", "To perform surgery"]'::jsonb, 
1, 
'By giving enough hydrocortisone (or other glucocorticoids) to provide negative feedback on the pituitary, ACTH levels fall. This reduces the stimulus to the adrenal cortex to produce androgen precursors, thereby improving hirsutism.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In the diagnosis of CAH, which test is most often used during the *prenatal* period?', 
'["Maternal blood glucose", "Amniocentesis or Chorionic Villus Sampling for genetic analysis or 17-OHP levels", "Fetal MRI", "Newborn screen"]'::jsonb, 
1, 
'In families with a known history of CAH, prenatal diagnosis can be made via genetic testing of fetal cells obtained by CVS or amniocentesis.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which common pediatric antibiotic should be used with caution in a child with hyperkalemic (Type 4) RTA or adrenal insufficiency due to its risk of further increasing potassium?', 
'["Amoxicillin", "Trimethoprim-Sulfamethoxazole (TMP-SMX)", "Cephalexin", "Azithromycin"]'::jsonb, 
1, 
'Trimethoprim acts like a potassium-sparing diuretic (similar to amiloride) in the distal tubule and can cause or worsen hyperkalemia, especially in patients with existing renal or adrenal disease.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with Addison disease is going to have a minor surgery (dental extraction). What is the appropriate "stress dose" for this level of stress?', 
'["Double the usual oral dose of hydrocortisone", "Triple the usual oral dose of hydrocortisone", "Give intravenous dexamethasone", "No stress dose is needed for minor procedures"]'::jsonb, 
1, 
'Standard "minor" stress dosing is usually 2 to 3 times the maintenance dose. For "major" stress (general anesthesia, severe trauma), IV hydrocortisone (50-100 mg/m2) is required.')

;
