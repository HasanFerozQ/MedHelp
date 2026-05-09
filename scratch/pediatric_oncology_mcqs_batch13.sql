-- Batch 13: 10 Pediatric Oncology MCQs (Questions 361-370)
-- Note: Replace (SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1) with the actual topic_id for Pediatric Oncology Essentials

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old child with standard-risk ALL is in the maintenance phase of therapy, receiving weekly oral Methotrexate. Routine lab work reveals significantly elevated liver transaminases (AST/ALT) and mild hepatomegaly. The physician suspects methotrexate-induced hepatotoxicity. What is the most appropriate management?', 
'["Perform a liver biopsy immediately to assess for cirrhosis", "Stop the Methotrexate permanently and switch to Cyclophosphamide", "Temporarily withhold the Methotrexate until the liver enzymes normalize, then restart at a lower dose or adjust the schedule", "Administer high-dose Leucovorin rescue"]'::jsonb, 
2, 
'Chronic oral methotrexate therapy frequently causes a transient, reversible elevation in liver transaminases (transaminitis). If the elevation is significant (e.g., >5 to 10 times the upper limit of normal), the standard protocol is to temporarily hold the drug. The liver enzymes almost always recover fully once the drug is stopped. The methotrexate can then be cautiously restarted.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 4-year-old boy presents with a firm abdominal mass. A biopsy confirms a Wilms tumor. Histological analysis reveals diffuse Anaplasia. Why does the presence of diffuse anaplasia significantly worsen the prognosis of Wilms tumor?', 
'["It indicates the tumor has already metastasized to the brain", "It makes the tumor highly resistant to standard cytotoxic chemotherapy and radiation", "It causes the tumor to secrete lethal levels of catecholamines", "It means the tumor cannot be surgically removed"]'::jsonb, 
1, 
'Diffuse anaplasia (characterized by massive hyperchromatic nuclei and abnormal, multipolar mitotic figures) is the hallmark of "unfavorable histology" in Wilms tumor. It is strongly correlated with mutations in the TP53 gene. Anaplastic cells are biologically highly resistant to the DNA damage caused by standard chemotherapy and radiation, drastically higher the risk of relapse.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 16-year-old female presents with a swelling in her distal femur. X-ray shows a lytic lesion with a "Codman triangle." Biopsy confirms Osteosarcoma. The patient asks why the tumor occurred in her knee. The oncologist explains that osteosarcoma is linked to rapid bone growth. During which physiological event does the incidence of osteosarcoma sharply peak?', 
'["During fetal development in utero", "During the toddler years (ages 1-3)", "During the adolescent growth spurt", "During the third trimester of pregnancy"]'::jsonb, 
2, 
'The incidence of primary Osteosarcoma has a distinct bimodal age distribution. The first and largest peak occurs strictly during the adolescent growth spurt. During this time, the epiphyseal growth plates at the metaphyses of the long bones are undergoing massive, rapid cellular proliferation and bone turnover, drastically increasing the statistical chance of a malignant mutation occurring in an osteoblast.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 7-year-old child is undergoing radiation therapy for a brain tumor. To prevent permanent damage to a critical endocrine organ that is highly sensitive to radiation, the radiation oncologist carefully shields the neck. Which organ is being protected?', 
'["The thymus", "The thyroid gland", "The parathyroid glands", "The pituitary gland"]'::jsonb, 
1, 
'The thyroid gland is exceptionally sensitive to ionizing radiation. Radiation exposure to the neck significantly increases the risk of developing hypothyroidism (often years later) and greatly increases the long-term risk of developing secondary thyroid cancer (especially papillary thyroid carcinoma). Whenever possible, the thyroid is shielded during radiation therapy to the head or upper body.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 3-year-old girl presents with a firm mass in her right flank. Ultrasound shows a large, homogeneous mass originating from the kidney. No other masses are found. The surgeon performs a radical nephrectomy. During the surgery, the tumor is removed completely intact, without any spillage. The renal capsule is pristine. What must the pathologist confirm microscopically to definitively assign this patient as Stage I?', 
'["The presence of anaplasia", "That the surgical margins are negative for tumor cells and the renal sinus vessels are not invaded", "That the tumor cells secrete renin", "That the tumor contains all three triphasic elements"]'::jsonb, 
1, 
'To officially be designated as Stage I Wilms tumor, the tumor must not only be completely excised and macroscopically intact, but the pathologist must confirm under the microscope that the surgical margins (the edges of the resected tissue) are completely free of tumor cells. Furthermore, there must be no microscopic evidence of tumor invading into the vessels of the renal sinus or penetrating through the renal capsule.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which of the following classes of chemotherapy drugs acts by inhibiting the enzyme ribonucleotide reductase, thereby depleting the cell of the deoxynucleotides required for DNA synthesis, and is frequently used to rapidly lower exceptionally high white blood cell counts (leukapheresis alternative)?', 
'["Hydroxyurea", "Methotrexate", "Cytarabine", "Mercaptopurine"]'::jsonb, 
0, 
'Hydroxyurea is an antimetabolite that specifically inhibits the enzyme ribonucleotide reductase. This enzyme is crucial for converting ribonucleotides into deoxyribonucleotides. Because it acts very quickly, it is often used in oncologic emergencies to rapidly cytoreduce (lower) massive white blood cell counts in patients with hyperleukocytosis to prevent leukostasis.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-month-old infant presents with a massive liver. Biopsy confirms Hepatoblastoma. The tumor is deemed unresectable due to its size and involvement of major hepatic vessels. The patient receives neoadjuvant chemotherapy. What is the primary goal of this chemotherapy?', 
'["To cure the patient without surgery", "To shrink the tumor to make it amenable to complete surgical resection", "To palliate the patient''s pain", "To prevent the development of a secondary leukemia"]'::jsonb, 
1, 
'For pediatric solid tumors like Hepatoblastoma, Wilms tumor, and Osteosarcoma, complete surgical resection is absolutely required for a cure. If a tumor is initially deemed unresectable (too large, invading critical structures), neoadjuvant (pre-surgical) chemotherapy is administered. The primary, critical goal is to shrink the tumor mass and pull it away from vital structures, converting an "unresectable" tumor into a "resectable" one.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 2-year-old child is diagnosed with Embryonal Rhabdomyosarcoma of the bladder. The tumor is localized. After induction chemotherapy, the tumor shrinks significantly. The next step is local control. Why might radiation therapy be preferred over radical surgical excision (e.g., radical cystoprostatectomy) in this specific scenario?', 
'["Radiation is more effective at killing rhabdomyosarcoma cells than surgery", "To preserve the anatomical structure and function of the bladder (organ preservation)", "Surgery is contraindicated in children under 5 years old", "Rhabdomyosarcomas always recur after surgery"]'::jsonb, 
1, 
'In the treatment of pediatric solid tumors (especially rhabdomyosarcoma and bone tumors), a major goal of modern protocols is organ and function preservation. A radical surgical excision of a bladder/prostate tumor in a 2-year-old would leave the child with a permanent urostomy and severe lifelong morbidity. Because embryonal rhabdomyosarcoma is highly radiosensitive, local control can often be achieved with targeted radiation therapy, sparing the organ.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old boy presents with a rapidly growing mass in his jaw. Biopsy confirms Endemic Burkitt Lymphoma. The tumor cells are driven by a massive overproduction of the c-myc protein. What is the normal physiological function of the c-myc protein?', 
'["It is a cell surface receptor that binds growth factors", "It is an intracellular tyrosine kinase that phosphorylates downstream targets", "It is a nuclear transcription factor that strongly promotes cell cycle progression from G1 to S phase", "It is a tumor suppressor that triggers apoptosis when DNA damage is detected"]'::jsonb, 
2, 
'The c-myc gene (located on chromosome 8) is a powerful proto-oncogene. Its protein product is a nuclear transcription factor. When a cell needs to divide, c-myc binds to DNA and massively upregulates the transcription of numerous genes required for the cell to transition from the resting (G1) phase into the DNA synthesis (S) phase. In Burkitt Lymphoma, the t(8;14) translocation places c-myc under the control of the highly active immunoglobulin heavy chain promoter.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-year-old child presents with a headache and progressive visual loss. An MRI reveals a calcified, cystic mass in the suprasellar region. The child also complains of constant thirst and frequent urination. The tumor is diagnosed as a Craniopharyngioma. The excessive thirst and urination are a result of the tumor compressing which anatomical structure?', 
'["The optic chiasm", "The pineal gland", "The pituitary stalk (infundibulum) or hypothalamus", "The fourth ventricle"]'::jsonb, 
2, 
'Craniopharyngiomas grow in the suprasellar space. As they enlarge, they frequently compress the overlying hypothalamus and the pituitary stalk (infundibulum). This compression disrupts the transport of Antidiuretic Hormone (ADH, vasopressin) from the hypothalamus down to the posterior pituitary gland. The resulting lack of ADH secretion causes Central Diabetes Insipidus, characterized by the inability to concentrate urine, leading to massive polyuria and polydipsia.')

;
