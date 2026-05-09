-- Batch 5: 30 Pediatric Oncology MCQs (Questions 121-150)
-- Note: Replace (SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1) with the actual topic_id for Pediatric Oncology Essentials

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 13-year-old boy treated with Bleomycin for Hodgkin Lymphoma presents with dry cough, progressive shortness of breath, and fine inspiratory crackles on lung auscultation. A chest X-ray shows bilateral interstitial infiltrates. The physician suspects bleomycin-induced pulmonary toxicity. Which pulmonary function test (PFT) parameter is typically the most sensitive and earliest indicator of this specific drug toxicity?', 
'["FEV1/FVC ratio", "Diffusing capacity for carbon monoxide (DLCO)", "Total Lung Capacity (TLC)", "Residual Volume (RV)"]'::jsonb, 
1, 
'Bleomycin causes progressive pulmonary fibrosis by generating free radicals. The fibrotic thickening of the alveolar-capillary membrane impairs gas exchange before significant changes in lung volume (TLC) occur. Therefore, a decrease in the Diffusing capacity for carbon monoxide (DLCO) is the most sensitive and earliest indicator of bleomycin-induced lung injury. Patients receiving bleomycin must have serial PFTs (specifically DLCO) monitored closely. If it drops significantly, the drug is discontinued.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 15-year-old girl is receiving intensive chemotherapy for AML. On day 10, she develops a fever of 39.0°C. Her absolute neutrophil count (ANC) is 100/mm³. She has a central venous catheter (Port-a-Cath) in place. The skin around the catheter exit site is red, warm, and tender. Blood cultures are drawn. Which class of organism is the most likely culprit for this specific catheter-related bloodstream infection?', 
'["Gram-negative bacilli (e.g., E. coli)", "Fungi (e.g., Candida)", "Gram-positive cocci (e.g., Coagulase-negative Staphylococci)", "Anaerobic bacteria (e.g., Bacteroides)"]'::jsonb, 
2, 
'In neutropenic patients with indwelling central venous catheters (like a Port-a-Cath or Hickman line), the most common organisms causing catheter-related bloodstream infections are Gram-positive cocci that normally colonize the skin. Coagulase-negative Staphylococci (like S. epidermidis) and Staphylococcus aureus are the leading causes. While Gram-negative organisms (from the gut) cause more rapidly fatal sepsis, the catheter itself is a highway for skin flora.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 2-year-old boy presents with a firm, smooth abdominal mass that does not cross the midline. An ultrasound reveals it originates from the right kidney. The mass is resected, and pathology confirms a Wilms tumor (Nephroblastoma) with favorable histology. The tumor was completely encapsulated, totally resected, and there was no evidence of rupture or spillage during surgery. The lymph nodes are negative. What is the Ann Arbor Stage equivalent (National Wilms Tumor Study staging) for this tumor?', 
'["Stage I", "Stage II", "Stage III", "Stage IV"]'::jsonb, 
0, 
'In the staging of Wilms tumor, Stage I indicates a tumor limited entirely to the kidney that is completely excised with intact margins. The renal capsule is intact, there is no tumor rupture/spillage, and no lymph node involvement. Stage II means the tumor extends beyond the kidney (e.g., penetrating the capsule or into renal vessels) but is still completely excised. Stage III involves residual non-hematogenous tumor confined to the abdomen (e.g., positive lymph nodes, incomplete resection, or tumor spillage during surgery). Stage IV involves hematogenous metastases (lungs, liver).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 6-year-old girl is undergoing induction chemotherapy for ALL. She presents to the emergency room with severe headache, vomiting, and a new-onset generalized tonic-clonic seizure. Her blood pressure is 150/100 mmHg. She is currently taking high-dose dexamethasone, vincristine, PEG-asparaginase, and daunorubicin. What is the most likely diagnosis, often triggered by severe hypertension or specific chemotherapies like asparaginase?', 
'["Leukemic meningitis", "Posterior Reversible Encephalopathy Syndrome (PRES)", "Cytomegalovirus encephalitis", "Acute stroke secondary to leukostasis"]'::jsonb, 
1, 
'Posterior Reversible Encephalopathy Syndrome (PRES) is a clinical-radiographic syndrome characterized by headache, seizures, altered mental status, and visual loss, alongside white matter edema classically affecting the posterior parietal and occipital lobes on MRI. It is strongly associated with severe hypertension (often secondary to high-dose corticosteroids) and the use of certain cytotoxic drugs (like calcineurin inhibitors and L-asparaginase). Management involves rapid blood pressure control and holding the offending agent.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A pediatric patient with a newly diagnosed brain tumor requires a biopsy. The MRI shows a heterogeneously enhancing mass in the cerebral cortex. The biopsy reveals an anaplastic astrocytoma (WHO Grade 3). Which of the following histological features distinguishes a Grade 3 anaplastic astrocytoma from a Grade 4 Glioblastoma Multiforme (GBM)?', 
'["The presence of Rosenthal fibers", "The presence of frequent mitotic figures", "The presence of microvascular proliferation and/or necrosis", "The presence of nuclear atypia"]'::jsonb, 
2, 
'The WHO grading of astrocytomas is based on specific histological criteria. A Grade 2 (diffuse) astrocytoma has nuclear atypia. A Grade 3 (anaplastic) astrocytoma has nuclear atypia PLUS significantly increased mitotic activity (frequent mitoses). A Grade 4 astrocytoma (Glioblastoma Multiforme, GBM) has atypia, mitoses, PLUS the critical presence of microvascular (endothelial) proliferation AND/OR necrosis (often "pseudopalisading" necrosis). The presence of either necrosis or microvascular proliferation automatically upgrades the tumor to the highly lethal Grade 4.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 4-year-old boy presents with a painless, hard mass in the right testis. His serum Alpha-fetoprotein (AFP) is normal, but his serum Beta-human chorionic gonadotropin (beta-hCG) is markedly elevated. A radical orchiectomy is performed. Which testicular tumor is characterized by elevated beta-hCG, normal AFP, and early hematogenous spread?', 
'["Yolk sac tumor", "Choriocarcinoma", "Seminoma", "Teratoma"]'::jsonb, 
1, 
'Choriocarcinomas are highly aggressive non-seminomatous germ cell tumors. They are composed of cytotrophoblasts and syncytiotrophoblasts (mimicking placental tissue) and therefore secrete massive amounts of beta-hCG. They famously do NOT secrete AFP (unlike yolk sac tumors). They are unique among testicular tumors because they have a strong propensity for early, aggressive hematogenous spread, especially to the lungs and brain, often bypassing the retroperitoneal lymph nodes.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 13-year-old girl is diagnosed with a bone tumor in the proximal humerus. Biopsy confirms Osteosarcoma. Her treatment plan includes high-dose Methotrexate. She receives the infusion over 4 hours. Which critical supportive care measure MUST be initiated 24 hours after the start of the methotrexate infusion to prevent lethal toxicity?', 
'["Mesna administration", "Dexrazoxane administration", "Leucovorin rescue", "Granulocyte colony-stimulating factor (G-CSF) administration"]'::jsonb, 
2, 
'High-dose methotrexate (HD-MTX) is a cornerstone of osteosarcoma therapy. The doses used are massively lethal to all dividing cells. Exactly 24 hours after the MTX infusion begins, "Leucovorin rescue" (folinic acid) must be initiated. Leucovorin bypasses the MTX-induced blockade of dihydrofolate reductase (DHFR), providing active folate to rescue the normal cells (like bone marrow and GI mucosa) from death. Serum MTX levels must be strictly monitored until they fall below a toxic threshold to determine when Leucovorin can be stopped.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old boy with Acute Lymphoblastic Leukemia (ALL) is in remission and receiving maintenance chemotherapy (daily 6-MP and weekly methotrexate). During a routine clinic visit, he is found to have an Absolute Neutrophil Count (ANC) of 400/mm³ but no fever or signs of infection. What is the most appropriate management regarding his chemotherapy?', 
'["Continue chemotherapy at the current dose and administer G-CSF", "Admit the patient for IV broad-spectrum antibiotics", "Hold the oral chemotherapy until the ANC recovers above 500-1000/mm³", "Reduce the dose of 6-MP by 50% permanently"]'::jsonb, 
2, 
'Maintenance chemotherapy for ALL is titrated to keep the patient mildly myelosuppressed (ANC usually between 1000-1500/mm³) to ensure adequate drug delivery to prevent relapse. However, if the ANC drops too low (typically < 500/mm³ or < 750/mm³ depending on protocol), even in the absence of fever, the standard procedure is to temporarily hold the oral chemotherapy (6-MP and MTX) to allow the bone marrow to recover, preventing severe, life-threatening neutropenia. Once recovered, the drugs are restarted, sometimes at slightly reduced doses.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 15-year-old female presents with a painless mass in her left supraclavicular region. A biopsy reveals Nodular Sclerosing Hodgkin Lymphoma. This is the most common subtype of Hodgkin lymphoma. Which histological feature is the defining characteristic of the Nodular Sclerosing subtype?', 
'["Sheets of uniform lymphocytes with a ''starry sky'' pattern", "A massive infiltrate of eosinophils without fibrosis", "Thick bands of collagen separating the lymph node into nodules, and ''lacunar'' variant Reed-Sternberg cells", "Complete depletion of all background lymphocytes"]'::jsonb, 
2, 
'Nodular Sclerosing Hodgkin Lymphoma is the most common subtype, typically affecting young adults and adolescents, often presenting as a mediastinal or lower cervical/supraclavicular mass. It is characterized histologically by thick, intersecting bands of sclerosis (collagen) that divide the lymph node tissue into distinct nodules. Furthermore, the Reed-Sternberg cells in this subtype frequently sit in clear spaces, giving them the name "lacunar cells."'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-year-old boy is diagnosed with T-cell Acute Lymphoblastic Leukemia (T-ALL) presenting with a massive anterior mediastinal mass. He develops orthopnea, facial plethora, and distended neck veins. This constellation of symptoms is an oncologic emergency known as:', 
'["Tumor Lysis Syndrome", "Spinal Cord Compression", "Superior Vena Cava (SVC) Syndrome", "Cardiac Tamponade"]'::jsonb, 
2, 
'Superior Vena Cava (SVC) syndrome occurs when a large mediastinal mass (commonly T-ALL or Non-Hodgkin Lymphoma) externally compresses the thin-walled superior vena cava, impeding venous return from the head, neck, and upper extremities. This causes facial swelling (plethora), distended neck veins, conjunctival edema, and respiratory distress (orthopnea) due to accompanying tracheal compression (Superior Mediastinal Syndrome). It requires emergent treatment with corticosteroids and often radiation or chemotherapy to shrink the mass.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 2-year-old child presents with a retroperitoneal mass. Biopsy reveals a Neuroblastoma. The tumor cells are positive for neuron-specific enolase (NSE) and synaptophysin. Under electron microscopy, what characteristic ultrastructural feature would you expect to see in these cells, confirming their neural crest/sympathetic origin?', 
'["Dense-core neurosecretory granules", "Birbeck granules", "Weibel-Palade bodies", "Auer rods"]'::jsonb, 
0, 
'Neuroblastoma cells derive from the sympathetic nervous system and actively synthesize and store catecholamines. Because of this, electron microscopy of neuroblastoma cells characteristically reveals numerous membrane-bound, electron-dense "dense-core" neurosecretory granules in the cytoplasm, which contain the catecholamines. Birbeck granules (tennis rackets) are seen in Langerhans Cell Histiocytosis. Weibel-Palade bodies are in endothelial cells. Auer rods are in AML blasts.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 6-year-old boy is undergoing treatment for a brain tumor (Medulloblastoma) with craniospinal irradiation (CSI). The entire brain and spinal cord must be irradiated because Medulloblastoma has a high propensity to spread via the CSF ("drop metastases"). Which of the following is an acute, expected side effect of irradiating the spinal cord?', 
'["Significant myelosuppression (anemia, neutropenia, thrombocytopenia)", "Acute renal failure", "Hemorrhagic cystitis", "Cardiomyopathy"]'::jsonb, 
0, 
'The spinal cord is housed within the vertebral bodies. In children, the vertebral bodies contain a significant portion of the body''s active, blood-producing red bone marrow. Craniospinal irradiation involves delivering a high dose of radiation to the entire spinal column. Consequently, the bone marrow within the vertebrae is severely damaged, leading to acute, expected, and often profound myelosuppression (drops in WBCs, RBCs, and platelets).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 4-year-old girl with a localized Wilms tumor (Stage I) undergoes a radical nephrectomy. The tumor shows favorable histology. The standard postoperative chemotherapy regimen for Stage I favorable histology Wilms tumor typically consists of which two agents?', 
'["Vincristine and Dactinomycin (Actinomycin D)", "Doxorubicin and Cyclophosphamide", "Methotrexate and 6-Mercaptopurine", "Cisplatin and Etoposide"]'::jsonb, 
0, 
'The standard, highly effective regimen for early-stage (Stage I and II) Wilms tumor with favorable histology is a two-drug combination of Vincristine and Dactinomycin (Actinomycin D). This regimen has an excellent cure rate (approaching 90-95%) with minimal long-term toxicity compared to heavier regimens. Doxorubicin is added for Stage III or IV disease. Radiation is added for Stage III/IV or unfavorable histology.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old male with Ewing Sarcoma is treated with a regimen including Ifosfamide. Ifosfamide, like Cyclophosphamide, is an alkylating agent that requires activation by the hepatic cytochrome P450 system. In addition to hemorrhagic cystitis, high-dose Ifosfamide is uniquely associated with which specific toxicity not commonly seen with Cyclophosphamide?', 
'["Pulmonary fibrosis", "Encephalopathy (neurotoxicity)", "Cardiomyopathy", "Ototoxicity"]'::jsonb, 
1, 
'While both Cyclophosphamide and Ifosfamide cause hemorrhagic cystitis (preventable with Mesna), Ifosfamide is uniquely associated with severe, potentially fatal central nervous system toxicity (Ifosfamide-induced encephalopathy). This is thought to be caused by the accumulation of a toxic metabolite, chloroacetaldehyde, which crosses the blood-brain barrier. Symptoms range from confusion and ataxia to seizures and coma. Methylene blue is sometimes used as a treatment/antidote.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 1-year-old infant presents with Opsoclonus-Myoclonus syndrome. A CT scan reveals a small, calcified mass in the right adrenal gland. Biopsy confirms Neuroblastoma. Despite the presence of this paraneoplastic syndrome, what is the generally expected prognosis for an infant (<18 months old) with a small, localized neuroblastoma lacking MYCN amplification?', 
'["Very poor, requiring immediate bone marrow transplant", "Excellent, surgical resection alone is often curative", "Moderate, requiring aggressive radiation therapy", "Poor, as opsoclonus-myoclonus indicates widespread brain metastasis"]'::jsonb, 
1, 
'Age is a massive prognostic factor in Neuroblastoma. Infants under 18 months of age with localized disease (and no MYCN amplification) have an excellent prognosis, with overall survival rates exceeding 95%. Surgical resection alone is often completely curative. Interestingly, while Opsoclonus-Myoclonus Syndrome is a severe neurological complication (requiring immunosuppression like steroids/IVIG/Rituximab), its presence in neuroblastoma is paradoxically associated with a more mature, biologically favorable tumor and a better overall oncologic outcome.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which of the following pediatric solid tumors is most strongly associated with a germline mutation in the TP53 tumor suppressor gene, a condition known as Li-Fraumeni syndrome?', 
'["Retinoblastoma", "Adrenocortical carcinoma and Osteosarcoma", "Neuroblastoma", "Wilms tumor"]'::jsonb, 
1, 
'Li-Fraumeni syndrome is a rare, autosomal dominant cancer predisposition syndrome caused by a germline mutation in the TP53 gene. Because p53 is the "guardian of the genome," lacking a functional copy puts these patients at extraordinary risk for developing multiple early-onset malignancies. The classic tumors associated with Li-Fraumeni include Osteosarcomas, Soft tissue sarcomas, early-onset Breast cancer, Brain tumors, Leukemia, and the exceedingly rare pediatric Adrenocortical carcinoma.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 9-year-old boy with Acute Lymphoblastic Leukemia (ALL) is admitted for severe hyperuricemia and acute kidney injury prior to starting chemotherapy. The uric acid crystals precipitate in the renal tubules, causing obstruction. In which part of the nephron does uric acid preferentially precipitate due to its low pH?', 
'["Proximal convoluted tubule", "Thick ascending limb of the loop of Henle", "Distal convoluted tubule and Collecting duct", "Bowman''s capsule"]'::jsonb, 
2, 
'Uric acid is poorly soluble in acidic environments. As the glomerular filtrate travels through the nephron, it becomes progressively more concentrated and more acidic. The lowest pH is reached in the distal convoluted tubule and the collecting ducts. In Tumor Lysis Syndrome, the massive load of uric acid precipitates into sharp crystals in these acidic distal segments, causing acute mechanical obstruction and acute kidney injury (uric acid nephropathy). This is why urinary alkalinization (historically used) was aimed at keeping uric acid soluble in these segments.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 12-year-old girl receives mantle radiation therapy for Hodgkin lymphoma. Which late cardiovascular complication is she at highest risk for developing 10-20 years after this specific type of radiation exposure?', 
'["Premature coronary artery disease and myocardial infarction", "Aortic aneurysm", "Hypertrophic obstructive cardiomyopathy", "Ventricular septal defect"]'::jsonb, 
0, 
'Mantle field radiation covers the chest and mediastinum, exposing the heart and great vessels to ionizing radiation. This causes chronic endothelial damage, accelerating atherosclerosis. Survivors of Hodgkin lymphoma treated with chest radiation have a profoundly increased risk of premature coronary artery disease, leading to early myocardial infarction (often in their 30s or 40s). They are also at high risk for radiation-induced restrictive pericarditis and valvular disease. Rigorous cardiovascular screening is mandatory.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 4-year-old child presents with a right-sided abdominal mass, hematuria, and hypertension. A CT scan confirms a mass originating from the right kidney. The surgeon suspects Wilms tumor but notices the tumor extends directly into the lumen of the renal vein and up into the inferior vena cava (IVC). Does this finding preclude surgical resection?', 
'["Yes, intravascular extension makes the tumor unresectable; only chemotherapy can be used.", "Yes, it indicates metastatic disease requiring upfront bone marrow transplant.", "No, Wilms tumors frequently exhibit intravascular extension, and complete surgical excision of the primary tumor and the tumor thrombus is the standard approach.", "No, but the kidney must be left in place and only the thrombus removed."]'::jsonb, 
2, 
'A unique and classic feature of Wilms tumor is its propensity to grow directly into the renal vein and extend as a solid tumor thrombus into the inferior vena cava (IVC), sometimes reaching all the way into the right atrium. Despite this dramatic intravascular extension, it is NOT a contraindication to surgery. The standard approach is to perform a radical nephrectomy while simultaneously opening the IVC (often requiring cardiopulmonary bypass if it reaches the heart) to completely extract the tumor thrombus en bloc.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which of the following chemotherapy agents, commonly used in induction protocols for ALL, is a corticosteroid that acts by inducing apoptosis in lymphoid cells and crossing the blood-brain barrier more effectively than prednisone?', 
'["Dexamethasone", "Hydrocortisone", "Fludrocortisone", "Methylprednisolone"]'::jsonb, 
0, 
'Corticosteroids are heavily lymphotoxic (inducing apoptosis in lymphocytes) and form the backbone of ALL induction therapy. While prednisone is frequently used, Dexamethasone is often preferred in modern protocols for pediatric ALL. Dexamethasone has a longer half-life, lacks mineralocorticoid activity, and crucially, penetrates the cerebrospinal fluid (blood-brain barrier) significantly better than prednisone, aiding in the prevention and treatment of CNS leukemia. However, it carries a higher risk of avascular necrosis and neurobehavioral side effects.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 15-year-old female presents with a painless, enlarging mass in her distal femur. X-ray shows a lytic lesion with a "sunburst" pattern of periosteal reaction. Biopsy confirms Osteosarcoma. The genetic pathogenesis of most sporadic osteosarcomas frequently involves acquired somatic mutations in which two critical tumor suppressor genes?', 
'["BRCA1 and BRCA2", "RB1 and TP53", "WT1 and WT2", "APC and MLH1"]'::jsonb, 
1, 
'The pathogenesis of Osteosarcoma is strongly driven by the loss of normal cell cycle regulation. The two most critical and frequently mutated tumor suppressor genes in sporadic osteosarcomas are RB1 (the retinoblastoma gene) and TP53 (the p53 gene). Loss of both of these master regulators removes the "brakes" on the cell cycle and impairs apoptosis, allowing the malignant osteoblasts to proliferate uncontrollably. (This also explains why patients with familial retinoblastoma or Li-Fraumeni syndrome are at extraordinarily high risk for osteosarcoma).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 7-year-old boy treated for a brain tumor presents to the clinic with severe, unremitting nausea and vomiting that begins 3 days *after* receiving his chemotherapy cycle. He is currently taking Ondansetron, but it is not working. This "delayed" chemotherapy-induced nausea and vomiting (CINV) is primarily mediated by which neurotransmitter pathway?', 
'["Serotonin (5-HT3) pathway in the gut", "Dopamine (D2) pathway in the chemoreceptor trigger zone", "Substance P / Neurokinin-1 (NK1) pathway in the brainstem", "Histamine (H1) pathway in the vestibular system"]'::jsonb, 
2, 
'Chemotherapy-induced nausea and vomiting (CINV) occurs in phases. *Acute* CINV (within the first 24 hours) is primarily driven by Serotonin release from the gut stimulating 5-HT3 receptors (effectively blocked by Ondansetron). *Delayed* CINV (occurring days 2-5 post-chemo) is primarily mediated centrally in the brainstem by the release of Substance P binding to Neurokinin-1 (NK1) receptors. Therefore, 5-HT3 antagonists are less effective for delayed CINV; NK1 antagonists (like Aprepitant) and corticosteroids (Dexamethasone) are required.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 2-year-old girl presents with a large abdominal mass. A biopsy reveals a tumor composed of primitive, small round blue cells with Homer-Wright rosettes. MYCN amplification is negative. The tumor is completely excised surgically. Histology shows a high mitotic-karyorrhectic index (MKI). What diagnosis does this represent?', 
'["Wilms Tumor", "Neuroblastoma", "Hepatoblastoma", "Ewing Sarcoma"]'::jsonb, 
1, 
'This is a Neuroblastoma. The classic histology is small round blue cells forming Homer-Wright rosettes (tumor cells surrounding a core of fibrillary neuropil). The Mitotic-Karyorrhectic Index (MKI) is a measure of cell turnover (mitosis and cell death) and is a key component of the International Neuroblastoma Pathology Classification (INPC) system used to determine favorable versus unfavorable histology, guiding treatment intensity.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-year-old child with relapsed ALL is scheduled to receive a CD19-directed Chimeric Antigen Receptor (CAR) T-cell therapy (Tisagenlecleucel). The patient must be closely monitored in the ICU following infusion for the development of which unique, potentially lethal toxicity associated with massive in vivo T-cell expansion?', 
'["Severe hemorrhagic cystitis", "Cytokine Release Syndrome (CRS)", "Veno-occlusive disease of the liver", "Cardiomyopathy"]'::jsonb, 
1, 
'CAR T-cell therapy involves engineering the patient''s own T cells to recognize the CD19 antigen on the surface of B-ALL blasts. When these engineered T cells are infused back into the patient, they encounter the leukemia cells, rapidly activate, and undergo massive expansion. This triggers the massive, systemic release of inflammatory cytokines (especially IL-6), leading to Cytokine Release Syndrome (CRS). CRS presents with high fever, severe hypotension, capillary leak, and multiorgan failure. It is treated with Tocilizumab (an IL-6 receptor antagonist).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which of the following chemotherapy agents acts as a topoisomerase I inhibitor, causing DNA single-strand breaks, and is frequently used in the treatment of relapsed pediatric solid tumors like neuroblastoma and rhabdomyosarcoma, often presenting with severe diarrhea as a dose-limiting toxicity?', 
'["Etoposide", "Irinotecan", "Doxorubicin", "Vincristine"]'::jsonb, 
1, 
'Irinotecan and Topotecan (camptothecin derivatives) are specific inhibitors of Topoisomerase I. By inhibiting this enzyme, they prevent the repair of DNA single-strand breaks created during normal DNA unwinding for replication, leading to lethal double-strand breaks during the S-phase. Irinotecan is highly effective in recurrent pediatric solid tumors. Its most notorious toxicity is severe, sometimes life-threatening diarrhea (which can be acute cholinergic diarrhea or delayed secretory diarrhea), managed with atropine or loperamide respectively.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old boy presents with severe pain in his left tibia. X-ray reveals a destructive lesion with an "onion-skin" periosteal reaction. Biopsy confirms Ewing Sarcoma. He receives neo-adjuvant chemotherapy followed by surgical resection. The tumor tissue is examined by a pathologist to determine the "percent necrosis." A high percent necrosis (>90%) indicates:', 
'["The tumor is highly aggressive and resistant to chemotherapy", "A favorable response to chemotherapy, predicting better overall survival", "The tumor is actually osteomyelitis, not a sarcoma", "The tumor is driven by the MYCN oncogene"]'::jsonb, 
1, 
'In both Osteosarcoma and Ewing Sarcoma, evaluating the resected tumor for the extent of necrosis induced by the neo-adjuvant (pre-surgical) chemotherapy is the single most important prognostic factor. A "good histologic response" is typically defined as ≥90% or ≥95% tumor necrosis (meaning the chemotherapy effectively killed almost all the tumor cells). This strongly predicts a lower risk of relapse and a significantly better long-term survival rate.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 3-year-old child with ALL presents with neutropenia and a high fever. Blood cultures are drawn, and broad-spectrum antibiotics (Cefepime) are started. 24 hours later, the blood culture grows a Gram-negative bacillus that is lactose-fermenting and indole-positive. What is the most likely organism?', 
'["Pseudomonas aeruginosa", "Escherichia coli", "Klebsiella pneumoniae", "Acinetobacter baumannii"]'::jsonb, 
1, 
'In a neutropenic patient, Gram-negative bacteremia is a medical emergency due to the risk of rapid septic shock. The description of a Gram-negative bacillus that is lactose-fermenting (rules out Pseudomonas and Acinetobacter) and indole-positive (distinguishes it from Klebsiella, which is indole-negative) points strongly to Escherichia coli, a common gut flora organism that frequently translocates across the damaged gastrointestinal mucosa (mucositis) in chemotherapy patients.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which of the following is the most common primary site of metastasis for a child diagnosed with a high-risk Medulloblastoma?', 
'["Lungs", "Liver", "Spinal cord (leptomeningeal spread)", "Bone marrow"]'::jsonb, 
2, 
'Medulloblastoma is a highly malignant primitive neuroectodermal tumor arising in the cerebellum. Because it grows in the posterior fossa near the 4th ventricle, the tumor cells have direct access to the cerebrospinal fluid (CSF). The most common and classic pattern of metastasis for medulloblastoma is "drop metastasis" via the CSF, seeding the leptomeninges of the spinal cord (and other areas of the brain/ventricles). For this reason, craniospinal irradiation (treating the entire brain and spinal cord) is a required component of therapy for older children.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 16-year-old girl treated for Hodgkin Lymphoma with mantle field radiation therapy at age 10 presents to the clinic. Given her history, which of the following screening protocols MUST be initiated when she turns 25 years old?', 
'["Annual colonoscopy", "Annual MRI and mammography of the breasts", "Bi-annual bone marrow biopsies", "Annual chest CT scans for lung cancer"]'::jsonb, 
1, 
'Females treated with mantle field radiation (which covers the chest and axilla) during childhood or adolescence have a profoundly increased risk of developing secondary breast cancer, with the risk rising sharply 10-15 years after treatment. Current guidelines mandate that breast cancer screening (typically using both breast MRI and mammography) must begin at age 25, or 8 years after the completion of radiation therapy, whichever occurs last.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A pediatric patient with a large abdominal Burkitt Lymphoma is at high risk for Tumor Lysis Syndrome (TLS). The medical team initiates aggressive intravenous hydration and Allopurinol. By what mechanism does Allopurinol prevent hyperuricemia?', 
'["It oxidizes uric acid into water-soluble allantoin", "It competitively inhibits xanthine oxidase, preventing the conversion of hypoxanthine and xanthine into uric acid", "It binds to uric acid in the blood and forces its excretion in the bile", "It acts as a loop diuretic to increase urine flow and wash out uric acid crystals"]'::jsonb, 
1, 
'Allopurinol is a purine analog that acts as a competitive inhibitor of Xanthine Oxidase, the enzyme responsible for the final steps of purine degradation (converting hypoxanthine to xanthine, and xanthine to uric acid). By blocking this enzyme, allopurinol prevents the *formation* of new uric acid, causing the buildup of the precursors hypoxanthine and xanthine, which are significantly more water-soluble and easily excreted by the kidneys. It does NOT break down existing uric acid (that is the mechanism of Rasburicase).')

;
