-- Batch 8: 31 Pediatric Nephrology & Endo MCQs (Questions 218-248)
-- Topic: Thyroid Disorders
-- Slug: peds-nephro-endo

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common cause of congenital hypothyroidism worldwide?', 
'["Autoimmune destruction", "Thyroid dysgenesis (ectopy, hypoplasia, or agenesis)", "Iodine deficiency", "Pituitary failure"]'::jsonb, 
1, 
'In iodine-sufficient regions (like the US), thyroid dysgenesis (failure of the gland to develop or migrate correctly) is the most common cause (85%). Worldwide, iodine deficiency is the leading cause. Ectopic thyroid tissue at the base of the tongue (lingual thyroid) is the most common form of dysgenesis.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 2-week-old infant is found to have an elevated TSH on a newborn screening test. The infant appears normal on exam. What is the most appropriate next step?', 
'["Wait and re-check in 1 month", "Immediately obtain a confirmatory serum TSH and free T4", "Start levothyroxine based on the screen alone", "Order a thyroid ultrasound"]'::jsonb, 
1, 
'Newborn screening is a screening tool. All abnormal results must be confirmed with a venous serum sample (TSH and free T4) immediately. Treatment must not be delayed once confirmed.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Why is it critical to start levothyroxine treatment for congenital hypothyroidism within the first 2 weeks of life?', 
'["To prevent heart failure", "To prevent permanent intellectual disability (cretinism)", "To stop the infant from crying", "To prevent obesity"]'::jsonb, 
1, 
'Thyroid hormone is essential for early brain development and myelination. Delay in treatment beyond the first few weeks leads to irreversible neurological damage and intellectual disability (formerly called cretinism).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 1-month-old infant with untreated congenital hypothyroidism is likely to exhibit which of the following physical findings?', 
'["Tachycardia and hyperreflexia", "Hypotonia, large tongue (macroglossia), and an umbilical hernia", "Premature closure of fontanelles", "Microcephaly"]'::jsonb, 
1, 
'Classic signs of untreated CH include: prolonged neonatal jaundice, hypotonia ("floppy" baby), macroglossia, umbilical hernia, thick skin, a large posterior fontanelle, and a hoarse cry.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common cause of *acquired* hypothyroidism in children and adolescents?', 
'["Iodine deficiency", "Hashimoto thyroiditis (Chronic lymphocytic thyroiditis)", "Graves disease", "Subacute thyroiditis"]'::jsonb, 
1, 
'Hashimoto thyroiditis is an autoimmune condition and is the leading cause of acquired hypothyroidism in the pediatric population, especially in females and children with other autoimmune conditions like T1DM or Down syndrome.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which antibody is most characteristically elevated in a patient with Hashimoto thyroiditis?', 
'["Thyroid-stimulating immunoglobulin (TSI)", "Anti-thyroid peroxidase (TPO) and Anti-thyroglobulin antibodies", "Anti-insulin antibodies", "Antinuclear antibody (ANA)"]'::jsonb, 
1, 
'Anti-TPO antibodies are present in > 90% of patients with Hashimoto thyroiditis. TSI is specific for Graves disease.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 12-year-old girl presents with a firm, non-tender goiter (enlarged thyroid). She has no other symptoms. Laboratory results show a normal TSH and normal free T4. What is the most likely diagnosis?', 
'["Graves disease", "Euthyroid Hashimoto thyroiditis", "Thyroid cancer", "Iodine deficiency"]'::jsonb, 
1, 
'Many children with Hashimoto thyroiditis initially present as "euthyroid" (normal labs) with an asymptomatic firm goiter. They may eventually progress to hypothyroidism.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 15-year-old girl presents with weight loss, heat intolerance, palpitations, and a fine tremor. On exam, she has a diffuse, smooth, non-tender goiter and mild "exophthalmos" (bulging eyes). What is the diagnosis?', 
'["Hashimoto thyroiditis", "Graves disease", "Toxic multinodular goiter", "Anorexia nervosa"]'::jsonb, 
1, 
'Graves disease is the most common cause of pediatric hyperthyroidism. It is caused by thyroid-stimulating immunoglobulins (TSI) that bind to and activate the TSH receptor.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following lab profiles is diagnostic for primary hyperthyroidism?', 
'["Low TSH, High Free T4", "High TSH, High Free T4", "High TSH, Low Free T4", "Normal TSH, Normal Free T4"]'::jsonb, 
0, 
'In primary hyperthyroidism (Graves), the excess thyroid hormone suppresses the pituitary, leading to a suppressed (very low) TSH and elevated free T4.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the preferred first-line medication for the treatment of Graves disease in children and adolescents?', 
'["Propylthiouracil (PTU)", "Methimazole", "Radioactive Iodine", "Levothyroxine"]'::jsonb, 
1, 
'Methimazole is the preferred antithyroid drug because it has a longer half-life and much lower risk of severe liver toxicity compared to PTU. PTU is generally avoided in children.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with Graves disease is started on Methimazole. One week later, they develop a high fever and a severe sore throat. What is the most critical complication to rule out?', 
'["Methimazole-induced hepatitis", "Agranulocytosis", "Streptococcal pharyngitis", "Thyroid storm"]'::jsonb, 
1, 
'Agranulocytosis (severe drop in WBCs) is a rare but life-threatening side effect of methimazole. Patients must be warned to stop the medication and seek immediate medical care for fever or sore throat to have a CBC checked.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A neonate is born to a mother with a history of Graves disease. The infant is tachycardic, irritable, and has poor weight gain. What is the diagnosis?', 
'["Congenital hypothyroidism", "Neonatal Graves disease (Transplacental passage of maternal TSI)", "Congenital heart disease", "Neonatal abstinence syndrome"]'::jsonb, 
1, 
'Neonatal Graves is caused by the transplacental transfer of maternal TSI antibodies. It is temporary (resolves as antibodies clear by 3-4 months) but can be life-threatening if untreated.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following is true regarding "thyroid nodules" in children compared to adults?', 
'["They are much more common in children", "A nodule in a child has a higher risk of being malignant (~25%) compared to an adult", "Thyroid nodules in children are never cancerous", "None"]'::jsonb, 
1, 
'Thyroid nodules are less common in children than adults, but a solitary nodule in a child has a significantly higher chance (approx. 25%) of being malignant (most commonly papillary thyroid cancer).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the initial diagnostic procedure of choice for a solitary thyroid nodule in a child?', 
'["Thyroid scan (scintigraphy)", "Fine-needle aspiration (FNA) biopsy", "Total thyroidectomy", "Watch and wait"]'::jsonb, 
1, 
'FNA is the "gold standard" for evaluating the risk of malignancy in a thyroid nodule. Ultrasound is often used to guide the biopsy.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child has a "cold" nodule on a technetium thyroid scan. What does this mean?', 
'["The nodule is producing too much thyroid hormone", "The nodule does not take up the tracer, increasing the suspicion for malignancy", "The child has a fever", "The nodule is a benign cyst"]'::jsonb, 
1, 
'A "cold" nodule does not take up the radioactive tracer, indicating it is not functioning thyroid tissue. Cold nodules carry a higher risk of cancer than "hot" (hyperfunctioning) nodules.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with a history of radiation therapy for Hodgkin lymphoma is at significantly increased risk for which endocrine condition?', 
'["Type 1 Diabetes", "Thyroid carcinoma", "Adrenal insufficiency", "Precocious puberty"]'::jsonb, 
1, 
'Radiation exposure to the neck is a major risk factor for the development of thyroid cancer later in life.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 12-year-old child with a TSH of 15 mIU/L (high) and a normal free T4 is diagnosed with "Subclinical Hypothyroidism." What is the general recommendation for treatment?', 
'["Start high-dose levothyroxine immediately", "Monitor TSH/Free T4 and only treat if TSH > 10, the child is symptomatic, or has a goiter", "Ignore it; it is normal in puberty", "Perform a thyroid biopsy"]'::jsonb, 
1, 
'Subclinical hypothyroidism involves a mildly elevated TSH with normal free T4. Many cases are transient or don''t progress. Treatment is individualized based on symptoms and the degree of TSH elevation.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In congenital hypothyroidism, what is the significance of the "posterior fontanelle"?', 
'["It is typically closed at birth", "It is often abnormally large (> 0.5 cm) and remains open, serving as an early clinical clue", "It is always small", "It is irrelevant"]'::jsonb, 
1, 
'An unusually large posterior fontanelle is a classic early sign of the delayed skeletal maturation caused by hypothyroidism in utero.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Thyroid hormone therapy (Levothyroxine) is best administered in which of the following ways?', 
'["With a large meal containing dairy", "On an empty stomach, at least 30-60 minutes before eating", "Mixed with soy-based formula", "Along with iron and calcium supplements"]'::jsonb, 
1, 
'Absorption of levothyroxine is inhibited by food, soy, iron, calcium, and fiber. It should ideally be taken on an empty stomach.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with Grave''s disease is being treated with Methimazole. His TSH remains suppressed (< 0.01) but his Free T4 is now in the low-normal range. What is the appropriate adjustment?', 
'["Increase the methimazole dose", "Decrease the methimazole dose", "Stop the methimazole", "None"]'::jsonb, 
1, 
'The goal is to maintain the Free T4 in the normal range. The TSH can remain suppressed for weeks or even months after the patient becomes euthyroid; the dose should be adjusted based on the Free T4 during this period.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following describes "Subacute Thyroiditis" (De Quervain thyroiditis)?', 
'["Chronic autoimmune destruction", "Painful enlargement of the thyroid, often following a viral infection, causing transient hyperthyroidism followed by hypothyroidism", "A congenital anomaly", "A bacterial infection requiring antibiotics"]'::jsonb, 
1, 
'Subacute thyroiditis is characterized by a tender, painful goiter and is thought to be post-viral. It is usually self-limiting and treated with NSAIDs.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which syndrome is characterized by the association of Medullary Thyroid Cancer, Pheochromocytoma, and a Marfanoid habitus?', 
'["Multiple Endocrine Neoplasia Type 1 (MEN 1)", "Multiple Endocrine Neoplasia Type 2B (MEN 2B)", "Neurofibromatosis Type 1", "Von Hippel-Lindau"]'::jsonb, 
1, 
'MEN 2B is a rare autosomal dominant syndrome. The discovery of mucosal neuromas or a marfanoid habitus in a child should prompt screening for medullary thyroid cancer (via RET gene testing).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common type of thyroid cancer in the pediatric population?', 
'["Follicular carcinoma", "Papillary carcinoma", "Medullary carcinoma", "Anaplastic carcinoma"]'::jsonb, 
1, 
'Papillary thyroid carcinoma (PTC) is the most common form in children. It generally has an excellent prognosis with surgical treatment (total thyroidectomy) and radioactive iodine ablation.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following medications can interfere with thyroid function and cause either hypo- or hyperthyroidism?', 
'["Amoxicillin", "Amiodarone", "Ibuprofen", "Albuterol"]'::jsonb, 
1, 
'Amiodarone has a very high iodine content and can cause thyroid dysfunction via the Wolff-Chaikoff effect or Jod-Basedow phenomenon.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with Pendred syndrome presents with goiter and which other characteristic clinical feature?', 
'["Short stature", "Sensorineural hearing loss", "Obesity", "Precocious puberty"]'::jsonb, 
1, 
'Pendred syndrome is an autosomal recessive disorder involving a defect in iodine transport (pendrin protein), leading to goiter and congenital hearing loss.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In a patient with hyperthyroidism, which medication is used to provide rapid relief of symptoms like tachycardia and tremors?', 
'["Levothyroxine", "Beta-blockers (e.g., Propranolol)", "Antibiotics", "Aspirin"]'::jsonb, 
1, 
'Beta-blockers provide immediate symptomatic relief of the adrenergic symptoms of hyperthyroidism while waiting for antithyroid drugs or other treatments to take effect.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'The "Wolff-Chaikoff effect" refers to:', 
'["Increased thyroid hormone production after iodine exposure", "Temporary inhibition of thyroid hormone synthesis following a large load of iodine", "Autoimmune destruction of the thyroid", "Hyperthyroidism caused by a pituitary tumor"]'::jsonb, 
1, 
'This is a normal physiological auto-regulatory mechanism to prevent the thyroid from producing too much hormone when exposed to high iodine levels.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 10-year-old child with Down syndrome should have which endocrine screening test performed annually?', 
'["HbA1c", "Serum TSH", "Growth hormone level", "Cortisol"]'::jsonb, 
1, 
'Children with Down syndrome have a high prevalence of autoimmune thyroid disease (Hashimoto) and should be screened annually with a TSH level.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'True or False: Most cases of congenital hypothyroidism are permanent and require lifelong levothyroxine.', 
'["True", "False", "Only in males", "Only in the first year of life"]'::jsonb, 
0, 
'True. While some cases of "transient" hypothyroidism occur (e.g., from maternal antibodies), the vast majority are due to dysgenesis or dyshormonogenesis and require lifelong replacement therapy.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most sensitive lab test for the diagnosis of *primary* hypothyroidism?', 
'["Free T4", "Total T3", "Serum TSH", "Thyroglobulin"]'::jsonb, 
2, 
'TSH is the most sensitive test. Even a small drop in Free T4 will cause a significant, amplified rise in TSH by the pituitary gland.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 14-year-old boy presents with a midline, cystic mass in the neck that moves upward when he sticks out his tongue. What is the most likely diagnosis?', 
'["Thyroid nodule", "Thyroglossal duct cyst", "Branchial cleft cyst", "Dermoid cyst"]'::jsonb, 
1, 
'A thyroglossal duct cyst is a remnant of the thyroid''s descent from the base of the tongue. It is characteristically in the midline and moves with swallowing or tongue protrusion.')

;
