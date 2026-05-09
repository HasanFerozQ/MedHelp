-- Batch 10: 30 Pediatric Oncology MCQs (Questions 271-300)
-- Note: Replace (SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1) with the actual topic_id for Pediatric Oncology Essentials

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old child with ALL develops severe Tumor Lysis Syndrome (TLS). Which of the following is the most immediate, life-threatening metabolic derangement associated with TLS that must be corrected urgently to prevent cardiac arrest?', 
'["Hyperuricemia", "Hyperphosphatemia", "Hyperkalemia", "Hypocalcemia"]'::jsonb, 
2, 
'While hyperuricemia and hyperphosphatemia cause acute kidney injury, the most immediate and acutely life-threatening derangement in Tumor Lysis Syndrome is Hyperkalemia. Massive tumor cell breakdown releases intracellular potassium into the bloodstream. High serum potassium rapidly disrupts the electrical conduction system of the heart, leading to fatal arrhythmias such as ventricular fibrillation or asystole. This requires immediate intervention (e.g., calcium gluconate to stabilize the myocardium, insulin/glucose, albuterol, and eventually dialysis if refractory).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 12-year-old girl is diagnosed with a high-grade Osteosarcoma. She receives high-dose Methotrexate. Which of the following statements about Methotrexate toxicity and its management is correct?', 
'["Methotrexate toxicity is primarily managed with Mesna", "Leucovorin rescue must be started 24 hours after the Methotrexate infusion begins, not before, to allow the Methotrexate time to kill the tumor cells", "Methotrexate requires urinary acidification to prevent precipitation", "Methotrexate cardiotoxicity is cumulative and irreversible"]'::jsonb, 
1, 
'High-dose Methotrexate is lethally toxic to normal cells. To "rescue" the normal cells (bone marrow, GI mucosa), Leucovorin (active folate) is given. However, the timing is critical. If given too early or concurrently, it rescues the tumor cells as well. The standard protocol dictates starting Leucovorin exactly 24 hours after the start of the Methotrexate infusion, allowing the MTX a specific window to exert its cytotoxic effect on the malignant osteoblasts before the rescue begins.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 2-year-old boy presents with a firm, smooth abdominal mass. Ultrasound reveals it is intrarenal. The surgeon performs a radical nephrectomy without a prior biopsy. Why is a preoperative needle biopsy of a suspected localized Wilms tumor generally contraindicated in North American protocols?', 
'["It cannot distinguish Wilms tumor from a simple renal cyst", "Needle biopsy carries a high risk of rupturing the tumor capsule, causing peritoneal seeding and upstaging the tumor from Stage I/II to Stage III", "It causes massive, uncontrollable hemorrhage", "Wilms tumors do not have identifiable histological features on biopsy"]'::jsonb, 
1, 
'Wilms tumors are often surrounded by a delicate pseudocapsule. The Children''s Oncology Group (COG) standard of care for a suspected localized Wilms tumor is upfront complete surgical excision (radical nephrectomy). Performing a percutaneous needle biopsy risks puncturing this capsule, which can seed tumor cells into the peritoneal cavity. This "tumor spillage" automatically upstages the patient to Stage III, requiring the addition of abdominal radiation and more intense chemotherapy.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 15-year-old female presents with a painless, enlarging mass in her distal femur. X-ray shows a lytic lesion with a "sunburst" pattern of periosteal reaction. Biopsy confirms Osteosarcoma. The genetic pathogenesis of most sporadic osteosarcomas frequently involves acquired somatic mutations in which two critical tumor suppressor genes?', 
'["BRCA1 and BRCA2", "RB1 and TP53", "WT1 and WT2", "APC and MLH1"]'::jsonb, 
1, 
'The pathogenesis of Osteosarcoma is strongly driven by the loss of normal cell cycle regulation. The two most critical and frequently mutated tumor suppressor genes in sporadic osteosarcomas are RB1 (the retinoblastoma gene) and TP53 (the p53 gene). Loss of both of these master regulators removes the "brakes" on the cell cycle and impairs apoptosis, allowing the malignant osteoblasts to proliferate uncontrollably.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-year-old boy receives an allogeneic hematopoietic stem cell transplant for relapsed ALL. He is placed on Tacrolimus and Methotrexate for GVHD prophylaxis. Two months later, he develops fever, neutropenia, and a diffuse interstitial pneumonia. Bronchoalveolar lavage is positive for Cytomegalovirus (CMV). Which aspect of his immune system is primarily impaired, making him susceptible to this viral reactivation?', 
'["Humoral immunity (B cells)", "Innate immunity (Neutrophils)", "Cell-mediated immunity (T cells)", "The complement system"]'::jsonb, 
2, 
'Cytomegalovirus (CMV) is a herpesvirus that establishes lifelong latency after primary infection. It is kept in check primarily by cell-mediated immunity (specifically CD8+ cytotoxic T cells). Following an allogeneic stem cell transplant, patients receive intense immunosuppressive drugs (like Tacrolimus) that profoundly inhibit T cell function to prevent Graft-Versus-Host Disease (GVHD). This severe T-cell defect allows latent viruses like CMV to reactivate.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A pediatric patient with relapsed Neuroblastoma is treated with I-131 MIBG (Metaiodobenzylguanidine) therapy. What is the mechanism of action of this highly targeted radiopharmaceutical?', 
'["It is an antibody that binds to the GD2 receptor on the cell surface", "It is an analog of norepinephrine that is actively taken up by the norepinephrine transporter (NET) into the tumor cells, delivering targeted radiation", "It is a radioactive glucose analog that accumulates in highly metabolic cells", "It is a targeted inhibitor of the MYCN transcription factor"]'::jsonb, 
1, 
'Neuroblastoma cells, derived from the sympathetic nervous system, possess the Norepinephrine Transporter (NET) on their surface. MIBG (Metaiodobenzylguanidine) is a structural analog of norepinephrine. When injected, MIBG is actively pumped into the neuroblastoma cells via the NET. By attaching a radioactive Iodine-131 isotope to the MIBG molecule, the drug delivers a lethal dose of targeted, internal radiation directly and selectively to the neuroblastoma cells.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which pediatric malignancy classically presents with a lytic bone lesion surrounded by a multi-layered, "onion-skin" periosteal reaction on X-ray, and is histologically characterized by sheets of uniform small round blue cells expressing CD99?', 
'["Osteosarcoma", "Ewing Sarcoma", "Chondrosarcoma", "Osteoid Osteoma"]'::jsonb, 
1, 
'The "onion-skin" periosteal reaction is a radiographic hallmark of Ewing Sarcoma. This occurs because the aggressive tumor breaks through the bone cortex, lifting the periosteum. The periosteum attempts to lay down new bone to contain the tumor, but the tumor grows past it, forcing the periosteum to lift and lay down another layer, creating multiple concentric layers resembling an onion skin. Strong membranous CD99 expression and the t(11;22) translocation confirm the diagnosis.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old male with Acute Myeloid Leukemia (AML) requires a hematopoietic stem cell transplant. He does not have a matched sibling. The registry finds an unrelated donor who is a 10/10 match at the HLA-A, B, C, DRB1, and DQB1 loci. Despite this perfect match, the patient is still at significant risk for Graft-Versus-Host Disease (GVHD). What is the primary immunological reason for this?', 
'["The donor T cells react to Minor Histocompatibility Antigens present on the recipient''s cells", "The HLA matching process is inherently inaccurate", "The recipient''s T cells attack the donor stem cells", "The patient''s immune system recognizes the donor''s blood type as foreign"]'::jsonb, 
0, 
'Even with a perfect 10/10 match at the Major Histocompatibility Complex (MHC/HLA) loci, patients receiving allogeneic transplants are still at high risk for GVHD. This is because the donor''s T cells can recognize and attack Minor Histocompatibility Antigens (mHAs). These are small polymorphic peptides derived from normal cellular proteins that differ slightly between individuals due to normal genetic variation. The donor T cells recognize these subtle differences on the recipient''s tissues as foreign.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 6-year-old boy with ALL develops severe, localized pain and swelling at the site of her peripheral IV immediately after the nurse administers Daunorubicin. The skin around the IV site appears red and blistered. What has occurred, and what is the classification of Daunorubicin in this context?', 
'["Anaphylaxis; Daunorubicin is an allergen", "Extravasation; Daunorubicin is a vesicant", "Phlebitis; Daunorubicin is an irritant", "Infection; Daunorubicin is immunosuppressive"]'::jsonb, 
1, 
'This is a classic presentation of Extravasation, which occurs when a drug leaks out of the vein into the surrounding subcutaneous tissue. Daunorubicin (and all anthracyclines, as well as vinca alkaloids) are classified as Vesicants. A vesicant is a highly caustic chemical that causes severe, irreversible tissue necrosis, blistering, and sloughing if it escapes the vein.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 12-year-old boy presents with a headache and visual disturbances. MRI reveals a mass in the pineal gland. Tumor markers are drawn from the serum and CSF. The markers show significantly elevated Beta-hCG and normal AFP. What is the most likely diagnosis for this pineal region tumor?', 
'["Germinoma", "Pineoblastoma", "Choriocarcinoma", "Yolk sac tumor"]'::jsonb, 
2, 
'The pineal gland is a common site for extragonadal germ cell tumors in the brain. The tumor markers are diagnostic. A Germinoma (the most common pineal tumor) typically has normal or mildly elevated beta-hCG and normal AFP. A Yolk Sac Tumor has elevated AFP and normal beta-hCG. A Choriocarcinoma is a highly malignant tumor that exclusively secretes massive amounts of Beta-hCG.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 16-year-old female treated for Hodgkin Lymphoma receives mantle field radiation. Because this radiation field includes the heart, she is at lifelong risk for cardiovascular complications. Which of the following is the most common *pericardial* complication associated with high-dose mediastinal radiation?', 
'["Acute purulent pericarditis", "Chronic constrictive pericarditis", "Cardiac tamponade", "Myxomatous degeneration of the mitral valve"]'::jsonb, 
1, 
'Radiation therapy to the chest causes chronic inflammation and progressive fibrosis of the tissues in the field. The pericardium is particularly susceptible. Years to decades after treatment, the pericardium can become heavily thickened, fibrotic, and rigid, leading to Chronic Constrictive Pericarditis. This rigid sac prevents the heart from expanding properly during diastole, causing right heart failure symptoms.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-month-old infant presents with a massive, firm liver and a highly elevated serum Alpha-fetoprotein (AFP). A biopsy confirms Hepatoblastoma. In addition to Beckwith-Wiedemann syndrome, which of the following familial cancer syndromes carries a significantly increased risk for developing hepatoblastoma in childhood?', 
'["Familial Adenomatous Polyposis (FAP)", "Multiple Endocrine Neoplasia Type 1 (MEN1)", "Von Hippel-Lindau (VHL) disease", "Peutz-Jeghers syndrome"]'::jsonb, 
0, 
'Children with Familial Adenomatous Polyposis (FAP), caused by a germline mutation in the APC tumor suppressor gene, have a significantly increased risk of developing Hepatoblastoma (about an 800-fold increased risk compared to the general population), usually before the age of 5. The APC mutation leads to aberrant Wnt/beta-catenin signaling, driving the tumor growth.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old girl is diagnosed with Osteosarcoma of the proximal tibia. She receives neoadjuvant chemotherapy, undergoes a successful limb-salvage surgery, and completes adjuvant chemotherapy. Two years later, a routine surveillance chest CT shows two new, small (1 cm) nodules in her right lung. There is no other evidence of disease. What is the most appropriate next step in management?', 
'["Initiate palliative care, as recurrent osteosarcoma is incurable", "Surgical wedge resection of the pulmonary nodules", "Whole lung irradiation", "High-dose Methotrexate monotherapy"]'::jsonb, 
1, 
'Unlike many other tumors where metastatic relapse indicates an incurable state, patients with Osteosarcoma who develop isolated pulmonary metastases can still be cured, provided the metastases can be completely surgically resected. The standard of care for isolated, resectable pulmonary relapses in osteosarcoma is aggressive surgical excision (wedge resection or lobectomy).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old boy presents with a solid abdominal mass. He is diagnosed with Neuroblastoma. Which of the following urine tests is the most sensitive and specific screening and diagnostic marker for this tumor?', 
'["5-HIAA (5-Hydroxyindoleacetic acid)", "VMA (Vanillylmandelic acid) and HVA (Homovanillic acid)", "Metanephrines", "Bence Jones proteins"]'::jsonb, 
1, 
'Neuroblastomas are derived from sympathetic neural crest cells and actively synthesize catecholamines (dopamine, norepinephrine, epinephrine). These are metabolized into Homovanillic acid (HVA) and Vanillylmandelic acid (VMA), respectively, which are excreted in the urine. Elevated urine VMA and HVA levels are found in over 90% of neuroblastoma patients and are critical for diagnosis and monitoring response to therapy.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 7-year-old child presents with a headache and vomiting. MRI reveals a mass in the fourth ventricle. Pathology confirms an Ependymoma. Following complete surgical resection, what is the standard next step in therapy for this localized tumor?', 
'["Observation with serial MRIs", "Intrathecal chemotherapy only", "Focal radiation therapy to the tumor bed", "Systemic high-dose chemotherapy with autologous stem cell rescue"]'::jsonb, 
2, 
'Ependymomas are notoriously resistant to standard systemic chemotherapy. The cornerstone of curative treatment is maximal, safe surgical resection (gross total resection). Because these tumors have a high rate of local recurrence even after apparent complete resection, the standard of care is to follow surgery with focal (localized) radiation therapy directed specifically at the tumor bed (the surgical cavity).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 12-year-old boy is diagnosed with T-cell Acute Lymphoblastic Leukemia (T-ALL) presenting with a large mediastinal mass. During his induction chemotherapy, he develops severe, colicky abdominal pain and cannot pass gas or stool. An abdominal X-ray shows dilated loops of bowel without a mechanical transition point. Which chemotherapy agent is the most likely cause of this severe paralytic ileus?', 
'["Daunorubicin", "Vincristine", "L-Asparaginase", "Dexamethasone"]'::jsonb, 
1, 
'Vincristine (a microtubule inhibitor) causes severe autonomic neuropathy. The enteric nervous system relies heavily on microtubules for axonal transport to maintain normal peristalsis. Vincristine toxicity profoundly disrupts this, leading to decreased bowel motility, severe constipation, and in severe cases, a complete paralytic ileus (bowel obstruction without a physical blockage).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 4-year-old girl with favorable histology Wilms Tumor (Stage II) is treated with Vincristine and Dactinomycin (Actinomycin D). What is the mechanism of action of Dactinomycin?', 
'["It inhibits dihydrofolate reductase", "It intercalates into the minor groove of the DNA double helix, blocking RNA polymerase and inhibiting transcription", "It cross-links DNA strands by alkylating guanine bases", "It inhibits the assembly of microtubules"]'::jsonb, 
1, 
'Dactinomycin (Actinomycin D) is an antitumor antibiotic. It exerts its cytotoxic effect by tightly intercalating (inserting itself) into the minor groove of the DNA double helix, specifically between adjacent guanine-cytosine base pairs. This physical block prevents RNA polymerase from advancing along the DNA strand, thereby potently inhibiting DNA-directed RNA synthesis (transcription).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 15-year-old female presents with a painless, enlarged cervical lymph node. Biopsy confirms Hodgkin Lymphoma. She asks the oncologist if her siblings are at risk. The oncologist explains that while Hodgkin lymphoma is mostly sporadic, there is a known association with a previous infection by which virus?', 
'["Human T-Lymphotropic Virus 1 (HTLV-1)", "Epstein-Barr Virus (EBV)", "Human Papillomavirus (HPV)", "Cytomegalovirus (CMV)"]'::jsonb, 
1, 
'Epstein-Barr Virus (EBV) has a strong epidemiological and molecular link to classical Hodgkin Lymphoma. Patients with a history of infectious mononucleosis (caused by EBV) have a roughly 3-fold increased risk of developing Hodgkin lymphoma later in life. Furthermore, the EBV genome can be detected directly within the malignant Reed-Sternberg cells in a significant proportion of cases.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 6-month-old infant is diagnosed with an Atypical Teratoid/Rhabdoid Tumor (ATRT) of the brain. The tumor is driven by the loss of the INI1 (SMARCB1) protein. This protein is a critical component of which cellular machinery?', 
'["The spliceosome, responsible for processing mRNA", "The SWI/SNF chromatin remodeling complex, responsible for modifying DNA accessibility", "The proteasome, responsible for degrading cellular proteins", "The mitotic spindle, responsible for chromosome segregation"]'::jsonb, 
1, 
'The INI1 (SMARCB1) protein is a core subunit of the SWI/SNF chromatin remodeling complex. This complex physically moves nucleosomes along the DNA, opening up regions of chromatin to allow transcription factors to access tumor suppressor genes. Loss of INI1 function cripples this complex, preventing the expression of crucial genes that halt the cell cycle.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-year-old boy with Acute Myeloid Leukemia (AML) requires a bone marrow aspirate to assess his response to induction chemotherapy. The aspirate is evaluated by flow cytometry. Which cluster of differentiation (CD) marker is classically expressed on normal hematopoietic stem cells and AML blasts, but is lost as the cells mature?', 
'["CD34", "CD3", "CD19", "CD20"]'::jsonb, 
0, 
'CD34 is a transmembrane phosphoglycoprotein and is the classic surface marker identifying primitive, multipotent hematopoietic stem cells (HSCs) in the bone marrow. As these stem cells differentiate into mature myeloid or lymphoid lineages, they lose CD34 expression. Because Acute Myeloid Leukemia (AML) represents an arrest in early myeloid development, the leukemic blasts frequently retain strong CD34 expression.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 3-year-old boy presents with a firm abdominal mass and right-sided aniridia. Genetic testing confirms WAGR syndrome (deletion 11p13). What is the primary function of the WT1 gene, which is deleted in this syndrome?', 
'["It is an oncogene that drives cell cycle progression", "It is a transcription factor critical for normal kidney and gonadal development", "It is a DNA repair enzyme", "It is a cell surface receptor for growth factors"]'::jsonb, 
1, 
'The WT1 (Wilms Tumor 1) gene is a classic tumor suppressor gene located on chromosome 11p13. Its protein product acts as a zinc-finger transcription factor. It is absolutely essential for the normal embryonic development of the kidneys (specifically the metanephric mesenchyme) and the gonads. Loss of WT1 function leads to Wilms tumor and severe genitourinary anomalies.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old girl is receiving high-dose Methotrexate for Osteosarcoma. Her urine is being continuously alkalinized with sodium bicarbonate. What is the target urine pH that must be maintained to prevent methotrexate crystallization in the renal tubules?', 
'["pH > 5.0", "pH > 6.0", "pH > 7.0", "pH > 8.5"]'::jsonb, 
2, 
'Methotrexate and its major metabolites are weak acids that are highly insoluble in an acidic environment. If the urine pH drops below 7.0, the drug will rapidly precipitate, causing acute tubular necrosis and renal failure. The strict, standard protocol during high-dose methotrexate infusion is to administer continuous IV fluids containing sodium bicarbonate to maintain the urine pH strictly greater than 7.0.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old boy presents with severe bone pain, pallor, and hepatosplenomegaly. A bone marrow biopsy confirms B-cell ALL. A lumbar puncture is performed, and the CSF contains leukemic blasts. The patient is diagnosed with CNS-positive ALL. What is the most likely additional therapy required for this patient compared to a CNS-negative patient?', 
'["Cranial radiation therapy", "More frequent and intensive intrathecal chemotherapy (e.g., twice weekly)", "Placement of an Ommaya reservoir for daily chemotherapy", "Intravenous administration of Carmustine (BCNU)"]'::jsonb, 
1, 
'All patients with ALL receive prophylactic CNS treatment (usually intrathecal methotrexate). However, if a patient presents with established CNS disease (blasts in the CSF), prophylactic therapy is insufficient. The standard of care involves significantly increasing the frequency and intensity of intrathecal chemotherapy (often using "triple IT" therapy: methotrexate, cytarabine, and hydrocortisone) until the CSF is clear.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 2-year-old child presents with a large abdominal mass. Biopsy reveals Neuroblastoma. The tumor is evaluated for the MYCN oncogene. By what mechanism does the MYCN gene drive the aggressive nature of this tumor?', 
'["It acts as a transmembrane tyrosine kinase receptor, constantly signaling for growth", "It acts as a transcription factor, binding to DNA and upregulating genes involved in cell proliferation and survival", "It inhibits the p53 tumor suppressor protein", "It prevents the shortening of telomeres"]'::jsonb, 
1, 
'The MYCN gene encodes a nuclear transcription factor. When the gene is amplified (multiple copies present), massive amounts of the MYCN protein are produced. This protein binds to specific DNA sequences (E-boxes) and globally upregulates the transcription of numerous target genes that drive the cell cycle forward, promote survival, and inhibit differentiation, leading to highly aggressive, rapid tumor growth.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 15-year-old male receives a bone marrow transplant for relapsed leukemia. Three months later, he presents with a dry, intensely itchy skin rash, dry eyes, a dry mouth, and increasing shortness of breath. Pulmonary function tests show a severe obstructive defect. What is the most likely diagnosis?', 
'["Acute Graft-Versus-Host Disease", "Chronic Graft-Versus-Host Disease", "Cytomegalovirus pneumonitis", "Radiation-induced pulmonary fibrosis"]'::jsonb, 
1, 
'This is a classic presentation of Chronic Graft-Versus-Host Disease (cGVHD). While acute GVHD occurs early and presents with maculopapular rash, secretory diarrhea, and jaundice, chronic GVHD typically resembles an autoimmune collagen vascular disease (like scleroderma or Sjögren syndrome). It is characterized by severe dryness (sicca syndrome), sclerodermatous skin changes, and a devastating, progressive obstructive lung disease called Bronchiolitis Obliterans.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which pediatric malignancy classically presents with a lytic bone lesion surrounded by a multi-layered, "onion-skin" periosteal reaction on X-ray, and is histologically characterized by sheets of uniform small round blue cells expressing CD99?', 
'["Osteosarcoma", "Ewing Sarcoma", "Chondrosarcoma", "Osteoid Osteoma"]'::jsonb, 
1, 
'The "onion-skin" periosteal reaction is a radiographic hallmark of Ewing Sarcoma. This occurs because the aggressive tumor breaks through the bone cortex, lifting the periosteum. The periosteum attempts to lay down new bone to contain the tumor, but the tumor grows past it, forcing the periosteum to lift and lay down another layer, creating multiple concentric layers resembling an onion skin.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 6-year-old boy is diagnosed with a standard-risk ALL. He receives L-Asparaginase during induction. Two weeks later, he presents with sudden onset weakness of his right arm and leg and difficulty speaking. An MRI of the brain confirms an ischemic stroke. What is the mechanism by which L-Asparaginase caused this severe complication?', 
'["It causes severe hypertension leading to hypertensive encephalopathy", "It dramatically increases the platelet count, causing hyperviscosity", "It inhibits the hepatic synthesis of antithrombin III and other clotting factors, leading to a prothrombotic state", "It directly damages the endothelial lining of cerebral blood vessels"]'::jsonb, 
2, 
'L-Asparaginase works by depleting circulating asparagine. Because the liver requires massive amounts of amino acids to synthesize plasma proteins, the depletion of asparagine severely impairs hepatic protein synthesis. This includes a critical drop in the production of Antithrombin III. The loss of these endogenous anticoagulants (especially Antithrombin III) tips the hemostatic balance, causing a severe prothrombotic state, placing the child at high risk for deep vein thromboses and devastating central nervous system strokes.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 1-year-old infant presents with a massive, firm liver. Serum AFP is very high. Biopsy confirms Hepatoblastoma. The tumor is deemed completely resectable. Which chemotherapeutic agent forms the absolute backbone of the adjuvant therapy required to cure this disease?', 
'["Methotrexate", "Cisplatin", "Vincristine", "Dexamethasone"]'::jsonb, 
1, 
'Hepatoblastoma is uniquely and profoundly sensitive to platinum-based chemotherapy. Cisplatin forms the absolute backbone of all modern treatment protocols for hepatoblastoma. Even if a tumor is completely resected upfront, adjuvant chemotherapy containing cisplatin is mandatory to eradicate micrometastases and achieve the high cure rates (>80%) seen today.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old girl with a history of Osteosarcoma treated with Doxorubicin presents to the emergency room with severe shortness of breath, orthopnea, and pink, frothy sputum. She is in acute congestive heart failure. What is the fundamental pathological change in her heart caused by the anthracycline toxicity?', 
'["Severe thickening and restriction of the pericardium", "Massive hypertrophy of the left ventricular wall", "Dilatation of the ventricular chambers with a profound decrease in contractility (systolic dysfunction)", "Aortic valve stenosis"]'::jsonb, 
2, 
'Anthracycline (Doxorubicin) cardiotoxicity typically manifests as a Dilated Cardiomyopathy. The free radical damage destroys the myocardial muscle fibers (myofibrillar loss and vacuolization). The heart muscle becomes thin, weak, and "flabby." The ventricular chambers dilate (enlarge) significantly, and the heart loses its ability to pump effectively, leading to a profound decrease in the ejection fraction (systolic dysfunction) and classic symptoms of congestive heart failure.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 3-year-old child presents with a retroperitoneal mass. A biopsy reveals a tumor with cells that have small, dark nuclei and scant cytoplasm, forming Homer-Wright rosettes. Which of the following immunochemical stains would be most helpful in confirming the diagnosis of Neuroblastoma and distinguishing it from other small round blue cell tumors?', 
'["Desmin", "CD99", "Neuron-Specific Enolase (NSE)", "Myeloperoxidase (MPO)"]'::jsonb, 
2, 
'Neuroblastoma originates from primitive neural crest cells. To distinguish it from other small round blue cell tumors (like Ewing sarcoma, rhabdomyosarcoma, or lymphoma), pathologists use immunohistochemical stains specific to neural tissue. Neuron-Specific Enolase (NSE), Synaptophysin, and Chromogranin A are strongly positive in neuroblastoma.')

;
