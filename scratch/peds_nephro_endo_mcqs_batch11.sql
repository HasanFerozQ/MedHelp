-- Batch 11: 31 Pediatric Nephrology & Endo MCQs (Questions 311-341)
-- Topic: Calcium, Phosphorus, and Rickets
-- Slug: peds-nephro-endo

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the primary physiological role of Vitamin D in calcium metabolism?', 
'["To inhibit calcium absorption in the gut", "To increase intestinal absorption of both calcium and phosphorus", "To promote calcium excretion in the kidneys", "To inhibit parathyroid hormone"]'::jsonb, 
1, 
'Active Vitamin D (1,25-dihydroxyvitamin D) primarily acts on the small intestine to increase the absorption of dietary calcium and phosphorus, which are essential for bone mineralization.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 12-month-old dark-skinned infant who is exclusively breastfed and has not received any supplements presents with bowed legs and a "rachitic rosary" (palpable enlargement of the costochondral junctions). What is the most likely diagnosis?', 
'["Osteogenesis imperfecta", "Nutritional Vitamin D deficiency Rickets", "Hypophosphatemic Rickets", "Achondroplasia"]'::jsonb, 
1, 
'Exclusively breastfed infants, especially those with dark skin (which reduces Vitamin D synthesis from sunlight), are at high risk for nutritional Vitamin D deficiency if not supplemented. Breast milk is naturally low in Vitamin D.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the hallmark radiological finding of Rickets on an X-ray of the long bones (e.g., at the wrist or knee)?', 
'["Fractures at different stages of healing", "Cupping, fraying, and widening of the metaphyses", "Increased bone density", "Thinning of the cortex with no other changes"]'::jsonb, 
1, 
'The lack of mineralization in rickets leads to the characteristic widening, "cupping," and "fraying" of the metaphysis where new bone is attempting to form.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following lab profiles is classic for early nutritional Vitamin D deficiency rickets?', 
'["Low Calcium, Low Phosphorus, High PTH, Low 25-OH Vitamin D", "High Calcium, High Phosphorus, Low PTH", "Normal Calcium, Low Phosphorus, High PTH, Low 25-OH Vitamin D", "Low Calcium, High Phosphorus, Low PTH"]'::jsonb, 
2, 
'Initially, low Vitamin D leads to low calcium, which triggers an increase in PTH (Secondary Hyperparathyroidism). PTH helps normalize the calcium by pulling it from bones, but it causes the kidneys to waste phosphorus, leading to a characteristically low phosphorus level.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In nutritional rickets, which lab value is almost always *elevated* and serves as a useful marker for disease activity and response to treatment?', 
'["Serum creatinine", "Alkaline phosphatase (ALP)", "Serum sodium", "Hemoglobin"]'::jsonb, 
1, 
'Serum ALP is an indicator of osteoblast activity. In rickets, ALP is significantly elevated due to the increased (but ineffective) bone turnover. It falls as the bones begin to heal with treatment.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the recommended daily Vitamin D supplement dose for all exclusively breastfed infants starting in the first few days of life?', 
'["100 IU", "400 IU", "1000 IU", "5000 IU"]'::jsonb, 
1, 
'The AAP recommends that all breastfed infants receive 400 IU of Vitamin D daily until they are weaned to at least 1 liter of Vitamin D-fortified formula or milk per day.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 3-year-old child presents with rickets that has not responded to standard Vitamin D therapy. His labs show: Low Phosphorus, Normal Calcium, Normal PTH, and a *low* 1,25-OH Vitamin D. What is the most likely diagnosis?', 
'["Nutritional Rickets", "X-linked Hypophosphatemic Rickets (XLH)", "Vitamin D-dependent Rickets Type 1", "Hypoparathyroidism"]'::jsonb, 
1, 
'XLH is the most common form of heritable rickets. It is caused by a defect in the PHEX gene leading to high levels of FGF23. FGF23 causes renal phosphate wasting and inhibits the activation of Vitamin D.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the primary treatment for X-linked Hypophosphatemic Rickets?', 
'["High-dose Vitamin D alone", "Oral phosphorus supplements and active Vitamin D (Calcitriol)", "Calcium supplements only", "Low-protein diet"]'::jsonb, 
1, 
'Treatment of XLH requires replacing the lost phosphate (multiple times a day) and providing calcitriol to overcome the inhibition of the 1-alpha-hydroxylase enzyme. Recently, Burosumab (an anti-FGF23 antibody) has become a major therapeutic option.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which form of rickets is caused by a genetic deficiency of the 1-alpha-hydroxylase enzyme, preventing the conversion of 25-OH Vitamin D to its active 1,25-OH form?', 
'["Nutritional Rickets", "Vitamin D-dependent Rickets Type 1 (VDDR1)", "Vitamin D-dependent Rickets Type 2 (VDDR2)", "XLH"]'::jsonb, 
1, 
'VDDR1 involves a failure to *activate* Vitamin D. These children have low 1,25-OH levels but normal 25-OH levels. VDDR2 involves a defect in the Vitamin D *receptor* (resistance).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with Vitamin D-dependent Rickets Type 2 (VDDR2) often has which unique physical finding?', 
'["Cleft palate", "Alopecia (hair loss)", "Blue sclera", "Deafness"]'::jsonb, 
1, 
'VDDR2 (Vitamin D receptor resistance) is frequently associated with alopecia totalis, which distinguishes it from other forms of rickets.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A newborn infant has a seizure on day 2 of life. Lab results show severe hypocalcemia. The infant also has a murmur of a conotruncal heart defect (Interrupted Aortic Arch) and a small jaw. What is the most likely diagnosis?', 
'["Trisomy 21", "DiGeorge Syndrome (22q11.2 deletion)", "Turner syndrome", "Congenital hypothyroidism"]'::jsonb, 
1, 
'DiGeorge syndrome involves a failure of the 3rd and 4th pharyngeal pouches to develop. This leads to the "CATCH-22" mnemonic: Cardiac defects, Abnormal facies, Thymic hypoplasia (immune deficiency), Cleft palate, and Hypocalcemia (due to parathyroid agenesis).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Hypocalcemia leads to increased neuromuscular irritability. Which of the following is a classic sign where tapping on the facial nerve elicits a twitch of the lip/nose?', 
'["Trousseau sign", "Chvostek sign", "Babinski sign", "Kernig sign"]'::jsonb, 
1, 
'Chvostek sign is the facial twitch. Trousseau sign is carpal spasm induced by inflating a blood pressure cuff above the systolic pressure for 3 minutes.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child has hypocalcemia, *high* serum phosphorus, and a *low* PTH level. What is the diagnosis?', 
'["Vitamin D deficiency", "Hypoparathyroidism", "Pseudohypoparathyroidism", "Renal failure"]'::jsonb, 
1, 
'Primary hypoparathyroidism (e.g., from DiGeorge or autoimmune destruction) leads to low PTH. Since PTH normally increases calcium and decreases phosphorus, its absence results in the opposite: low calcium and high phosphorus.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child has the same lab findings as hypoparathyroidism (Low Ca, High Phos) but their PTH level is extremely *high*. They have short stature, a round face, and short 4th and 5th metacarpals. What is the diagnosis?', 
'["DiGeorge syndrome", "Pseudohypoparathyroidism (Albright Hereditary Osteodystrophy)", "Rickets", "Graves disease"]'::jsonb, 
1, 
'Pseudohypoparathyroidism is a condition of end-organ resistance to PTH. The body makes plenty of PTH, but the kidneys and bones don''t respond to it.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the treatment for acute, symptomatic hypocalcemia (e.g., tetany or seizures)?', 
'["Oral calcium carbonate", "Intravenous Calcium Gluconate", "Vitamin D", "Phosphate binders"]'::jsonb, 
1, 
'Symptomatic hypocalcemia is a medical emergency and is treated with slow IV infusion of calcium gluconate under cardiac monitoring.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A 5-year-old child presents with "hypercalcemia" (Calcium 12.5 mg/dL). He also has a "cocktail party" personality (highly social), a hoarse voice, and supravalvular aortic stenosis. What is the diagnosis?', 
'["DiGeorge syndrome", "Williams syndrome", "Noonan syndrome", "MEN 1"]'::jsonb, 
1, 
'Williams syndrome is caused by a microdeletion on chromosome 7 (including the elastin gene). It is associated with idiopathic hypercalcemia in infancy, characteristic "elfin" facies, and heart defects.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is the most common cause of "hyperparathyroidism" in the pediatric population?', 
'["Parathyroid adenoma", "Parathyroid hyperplasia as part of MEN 1 or 2A", "Chronic Kidney Disease (Secondary hyperparathyroidism)", "Vitamin D overdose"]'::jsonb, 
2, 
'Secondary hyperparathyroidism due to CKD is very common in pediatric nephrology. Primary hyperparathyroidism (adenoma) is rare in children compared to adults.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In a patient with hypercalcemia, what is the most important initial management step to help the kidneys excrete the excess calcium?', 
'["Start a thiazide diuretic", "Aggressive intravenous hydration with Normal Saline", "Give oral phosphate", "Low-calcium diet alone"]'::jsonb, 
1, 
'Hydration with saline increases sodium and calcium delivery to the distal tubule and promotes calciuresis. Thiazides should be avoided as they *increase* calcium reabsorption.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with rickets has a "bowing" deformity of the legs. This is known as:', 
'["Genu valgum (knock-knees)", "Genu varum (bow-legs)", "Tibial torsion", "Hip dysplasia"]'::jsonb, 
1, 
'Genu varum is the classic bowing seen in rickets due to the inability of the unmineralized bone to support the child''s weight.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'What is "Craniotabes" and what is its significance?', 
'["Softening of the skull bones, which can be indented like a ping-pong ball; an early sign of rickets", "A large head circumference", "Premature fusion of the skull", "A sign of brain tumor"]'::jsonb, 
0, 
'Craniotabes is one of the earliest signs of rickets in infants, though it can occasionally be a normal finding in newborns.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with severe, untreated rickets develops "Harrison''s groove." What is this?', 
'["A deformity of the feet", "A horizontal groove along the lower border of the thorax where the diaphragm pulls on the softened ribs", "A type of heart murmur", "A skull fracture"]'::jsonb, 
1, 
'Harrison''s groove (or sulcus) is a classic skeletal sign of long-standing rickets.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Hypervitaminosis D (Vitamin D toxicity) leads to which lab abnormality?', 
'["Hypocalcemia", "Hypercalcemia and hypercalciuria", "Low phosphorus", "High TSH"]'::jsonb, 
1, 
'Excessive Vitamin D leads to high calcium levels and high calcium in the urine, which can cause nephrocalcinosis and kidney stones.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with hypocalcemia has a "prolonged" interval on their ECG. Which one?', 
'["PR interval", "QT interval", "QRS complex", "ST segment"]'::jsonb, 
1, 
'Hypocalcemia characteristically causes prolongation of the QTc interval, which can predispose to arrhythmias. Hypercalcemia causes a shortened QTc.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A mother is concerned that her 2-year-old is "bow-legged." On exam, the bowing is symmetric and mild, and the child''s growth is normal. X-rays show no cupping or fraying. What is the diagnosis?', 
'["Nutritional Rickets", "Physiologic bowing", "Blount disease", "Skeletal dysplasia"]'::jsonb, 
1, 
'Physiologic bowing (genu varum) is common in toddlers and usually resolves by age 2-3 without treatment. The absence of radiological signs of rickets and normal growth are key.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'In contrast to physiologic bowing, "Blount Disease" (tibia vara) is characterized by:', 
'["Symmetric resolution by age 4", "Progressive, often asymmetric bowing due to abnormal growth of the proximal medial tibial epiphysis", "Low Vitamin D", "Blue sclera"]'::jsonb, 
1, 
'Blount disease is a pathological condition of the growth plate and often requires bracing or surgery. It is more common in early walkers and obese children.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which of the following is an *inhibitor* of bone resorption and is used to treat severe hypercalcemia or osteoporosis (rarely in children)?', 
'["Parathyroid hormone", "Calcitonin or Bisphosphonates", "Vitamin D", "Thyroid hormone"]'::jsonb, 
1, 
'Calcitonin (produced by the thyroid C-cells) and bisphosphonates inhibit osteoclast activity, lowering serum calcium.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with rickets has "hypophosphatemia." Why is phosphorus so important for bone?', 
'["It is needed for the heart to pump", "It combines with calcium to form hydroxyapatite, the primary mineral in bone", "It stimulates growth hormone", "It prevents fractures"]'::jsonb, 
1, 
'Hydroxyapatite crystals [Ca10(PO4)6(OH)2] provide the structural rigidity of the bone matrix.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Which form of "Vitamin D" is measured in the blood to assess a patient''s overall Vitamin D *status* (stores)?', 
'["1,25-dihydroxyvitamin D (Calcitriol)", "25-hydroxyvitamin D (Calcidiol)", "Vitamin D3 (Cholecalciferol)", "7-dehydrocholesterol"]'::jsonb, 
1, 
'25-OH Vitamin D has a much longer half-life and reflects the total body stores from both diet and sun exposure. 1,25-OH Vitamin D is the active form but is tightly regulated and may be normal or even high in nutritional rickets.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'A child with "Osteogenesis Imperfecta" (brittle bone disease) presents with multiple fractures and blue sclera. What is the underlying defect?', 
'["Vitamin D deficiency", "Defect in Type 1 collagen synthesis", "PTH resistance", "Growth hormone deficiency"]'::jsonb, 
1, 
'OI is most commonly an autosomal dominant disorder of Type 1 collagen, leading to bone fragility, blue sclera, hearing loss, and dental issues (dentinogenesis imperfecta).'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'True or False: Most cases of Vitamin D deficiency rickets in the US are now seen in adolescents who have low sun exposure and poor diet.', 
'["True", "False", "Only in the summer", "None"]'::jsonb, 
0, 
'True. While infant rickets is well-known, there is a rising prevalence of Vitamin D deficiency in "indoor" adolescents, which can present as vague bone pain or muscle weakness.'),

((SELECT id FROM topics WHERE slug = 'peds-nephro-endo' LIMIT 1), 
'Magnesium is necessary for which step in parathyroid function?', 
'["PTH synthesis", "Both the secretion of PTH and the end-organ response to PTH", "Calcium absorption", "Vitamin D activation"]'::jsonb, 
1, 
'Severe hypomagnesemia can lead to functional hypoparathyroidism because magnesium is a cofactor for PTH release and action. Hypocalcemia often cannot be corrected until magnesium is normalized.')

;
