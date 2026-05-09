-- Batch 8: 30 Pediatric Oncology MCQs (Questions 211-240)
-- Note: Replace (SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1) with the actual topic_id for Pediatric Oncology Essentials

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-month-old infant presents with a massive, firm liver and a highly elevated serum Alpha-fetoprotein (AFP). A biopsy confirms Hepatoblastoma. In addition to Beckwith-Wiedemann syndrome, which of the following familial cancer syndromes carries a significantly increased risk for developing hepatoblastoma in childhood?', 
'["Familial Adenomatous Polyposis (FAP)", "Multiple Endocrine Neoplasia Type 1 (MEN1)", "Von Hippel-Lindau (VHL) disease", "Peutz-Jeghers syndrome"]'::jsonb, 
0, 
'Children with Familial Adenomatous Polyposis (FAP), caused by a germline mutation in the APC tumor suppressor gene, have a significantly increased risk of developing Hepatoblastoma (about an 800-fold increased risk compared to the general population), usually before the age of 5. For this reason, infants born into families with known FAP undergo routine screening with liver ultrasounds and serum AFP levels. The APC mutation leads to aberrant Wnt/beta-catenin signaling, driving the tumor growth.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old girl is diagnosed with Osteosarcoma of the proximal tibia. She receives neoadjuvant chemotherapy, undergoes a successful limb-salvage surgery, and completes adjuvant chemotherapy. Two years later, a routine surveillance chest CT shows two new, small (1 cm) nodules in her right lung. There is no other evidence of disease. What is the most appropriate next step in management?', 
'["Initiate palliative care, as recurrent osteosarcoma is incurable", "Surgical wedge resection of the pulmonary nodules", "Whole lung irradiation", "High-dose Methotrexate monotherapy"]'::jsonb, 
1, 
'Unlike many other tumors where metastatic relapse indicates an incurable state, patients with Osteosarcoma who develop isolated pulmonary metastases can still be cured, provided the metastases can be completely surgically resected. The standard of care for isolated, resectable pulmonary relapses in osteosarcoma is aggressive surgical excision (wedge resection or lobectomy). Chemotherapy may be added, but surgical removal is the absolute cornerstone of salvage therapy.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old boy presents with a solid abdominal mass. He is diagnosed with Neuroblastoma. Which of the following urine tests is the most sensitive and specific screening and diagnostic marker for this tumor?', 
'["5-HIAA (5-Hydroxyindoleacetic acid)", "VMA (Vanillylmandelic acid) and HVA (Homovanillic acid)", "Metanephrines", "Bence Jones proteins"]'::jsonb, 
1, 
'Neuroblastomas are derived from sympathetic neural crest cells and actively synthesize catecholamines (dopamine, norepinephrine, epinephrine). These are metabolized into Homovanillic acid (HVA) and Vanillylmandelic acid (VMA), respectively, which are excreted in the urine. Elevated urine VMA and HVA levels are found in over 90% of neuroblastoma patients and are critical for diagnosis and monitoring response to therapy. 5-HIAA is a marker for carcinoid tumors (serotonin breakdown).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 7-year-old child presents with a headache and vomiting. MRI reveals a mass in the fourth ventricle. Pathology confirms an Ependymoma. Following complete surgical resection, what is the standard next step in therapy for this localized tumor?', 
'["Observation with serial MRIs", "Intrathecal chemotherapy only", "Focal radiation therapy to the tumor bed", "Systemic high-dose chemotherapy with autologous stem cell rescue"]'::jsonb, 
2, 
'Ependymomas are notoriously resistant to standard systemic chemotherapy. The cornerstone of curative treatment is maximal, safe surgical resection (gross total resection). Because these tumors have a high rate of local recurrence even after apparent complete resection, the standard of care is to follow surgery with focal (localized) radiation therapy directed specifically at the tumor bed (the surgical cavity). Craniospinal irradiation is not routinely used unless there is evidence of CSF spread.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 12-year-old boy is diagnosed with T-cell Acute Lymphoblastic Leukemia (T-ALL) presenting with a large mediastinal mass. During his induction chemotherapy, he develops severe, colicky abdominal pain and cannot pass gas or stool. An abdominal X-ray shows dilated loops of bowel without a mechanical transition point. Which chemotherapy agent is the most likely cause of this severe paralytic ileus?', 
'["Daunorubicin", "Vincristine", "L-Asparaginase", "Dexamethasone"]'::jsonb, 
1, 
'Vincristine (a microtubule inhibitor) causes severe autonomic neuropathy. The enteric nervous system relies heavily on microtubules for axonal transport to maintain normal peristalsis. Vincristine toxicity profoundly disrupts this, leading to decreased bowel motility, severe constipation, and in severe cases, a complete paralytic ileus (bowel obstruction without a physical blockage). Management involves aggressive use of laxatives (like polyethylene glycol) prophylactically.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 4-year-old girl with favorable histology Wilms Tumor (Stage II) is treated with Vincristine and Dactinomycin (Actinomycin D). What is the mechanism of action of Dactinomycin?', 
'["It inhibits dihydrofolate reductase", "It intercalates into the minor groove of the DNA double helix, blocking RNA polymerase and inhibiting transcription", "It cross-links DNA strands by alkylating guanine bases", "It inhibits the assembly of microtubules"]'::jsonb, 
1, 
'Dactinomycin (Actinomycin D) is an antitumor antibiotic. It exerts its cytotoxic effect by tightly intercalating (inserting itself) into the minor groove of the DNA double helix, specifically between adjacent guanine-cytosine base pairs. This physical block prevents RNA polymerase from advancing along the DNA strand, thereby potently inhibiting DNA-directed RNA synthesis (transcription). It is highly effective in Wilms tumor and rhabdomyosarcoma.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 15-year-old female presents with a painless, enlarged cervical lymph node. Biopsy confirms Hodgkin Lymphoma. She asks the oncologist if her siblings are at risk. The oncologist explains that while Hodgkin lymphoma is mostly sporadic, there is a known association with a previous infection by which virus?', 
'["Human T-Lymphotropic Virus 1 (HTLV-1)", "Epstein-Barr Virus (EBV)", "Human Papillomavirus (HPV)", "Cytomegalovirus (CMV)"]'::jsonb, 
1, 
'Epstein-Barr Virus (EBV) has a strong epidemiological and molecular link to classical Hodgkin Lymphoma. Patients with a history of infectious mononucleosis (caused by EBV) have a roughly 3-fold increased risk of developing Hodgkin lymphoma later in life. Furthermore, the EBV genome can be detected directly within the malignant Reed-Sternberg cells in a significant proportion of cases (especially the mixed cellularity subtype), where viral proteins drive the oncogenic process.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 6-month-old infant is diagnosed with an Atypical Teratoid/Rhabdoid Tumor (ATRT) of the brain. The tumor is driven by the loss of the INI1 (SMARCB1) protein. This protein is a critical component of which cellular machinery?', 
'["The spliceosome, responsible for processing mRNA", "The SWI/SNF chromatin remodeling complex, responsible for modifying DNA accessibility", "The proteasome, responsible for degrading cellular proteins", "The mitotic spindle, responsible for chromosome segregation"]'::jsonb, 
1, 
'The INI1 (SMARCB1) protein is a core subunit of the SWI/SNF chromatin remodeling complex. This complex physically moves nucleosomes along the DNA, opening up regions of chromatin to allow transcription factors to access tumor suppressor genes. Loss of INI1 function (due to mutation or deletion) cripples this complex, preventing the expression of crucial genes that halt the cell cycle, leading to the highly aggressive, unregulated growth characteristic of ATRT.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-year-old boy with Acute Myeloid Leukemia (AML) requires a bone marrow aspirate to assess his response to induction chemotherapy. The aspirate is evaluated by flow cytometry. Which cluster of differentiation (CD) marker is classically expressed on normal hematopoietic stem cells and AML blasts, but is lost as the cells mature?', 
'["CD34", "CD3", "CD19", "CD20"]'::jsonb, 
0, 
'CD34 is a transmembrane phosphoglycoprotein and is the classic surface marker identifying primitive, multipotent hematopoietic stem cells (HSCs) in the bone marrow. As these stem cells differentiate into mature myeloid or lymphoid lineages, they lose CD34 expression. Because Acute Myeloid Leukemia (AML) represents an arrest in early myeloid development, the leukemic blasts frequently retain strong CD34 expression, which is used diagnostically in flow cytometry.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 3-year-old boy presents with a firm abdominal mass and right-sided aniridia. Genetic testing confirms WAGR syndrome (deletion 11p13). What is the primary function of the WT1 gene, which is deleted in this syndrome?', 
'["It is an oncogene that drives cell cycle progression", "It is a transcription factor critical for normal kidney and gonadal development", "It is a DNA repair enzyme", "It is a cell surface receptor for growth factors"]'::jsonb, 
1, 
'The WT1 (Wilms Tumor 1) gene is a classic tumor suppressor gene located on chromosome 11p13. Its protein product acts as a zinc-finger transcription factor. It is absolutely essential for the normal embryonic development of the kidneys (specifically the metanephric mesenchyme) and the gonads. Loss of WT1 function not only leads to the development of Wilms tumor but also explains the severe genitourinary anomalies (e.g., ambiguous genitalia, hypospadias) seen in syndromes like WAGR and Denys-Drash.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old girl is receiving high-dose Methotrexate for Osteosarcoma. Her urine is being continuously alkalinized with sodium bicarbonate. What is the target urine pH that must be maintained to prevent methotrexate crystallization in the renal tubules?', 
'["pH > 5.0", "pH > 6.0", "pH > 7.0", "pH > 8.5"]'::jsonb, 
2, 
'Methotrexate and its major metabolites are weak acids that are highly insoluble in an acidic environment. If the urine pH drops below 7.0, the drug will rapidly precipitate, causing acute tubular necrosis and renal failure. The strict, standard protocol during high-dose methotrexate infusion is to administer continuous IV fluids containing sodium bicarbonate to maintain the urine pH strictly greater than 7.0 (often targeting 7.5 to 8.0) until the serum methotrexate level falls below a safe threshold.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old boy presents with severe bone pain, pallor, and hepatosplenomegaly. A bone marrow biopsy confirms B-cell ALL. A lumbar puncture is performed, and the CSF contains leukemic blasts. The patient is diagnosed with CNS-positive ALL. What is the most likely additional therapy required for this patient compared to a CNS-negative patient?', 
'["Cranial radiation therapy", "More frequent and intensive intrathecal chemotherapy (e.g., twice weekly)", "Placement of an Ommaya reservoir for daily chemotherapy", "Intravenous administration of Carmustine (BCNU)"]'::jsonb, 
1, 
'All patients with ALL receive prophylactic CNS treatment (usually intrathecal methotrexate). However, if a patient presents with established CNS disease (blasts in the CSF, known as CNS3 status), prophylactic therapy is insufficient. They require intensive therapeutic intervention. The standard of care involves significantly increasing the frequency and intensity of intrathecal chemotherapy (often using "triple IT" therapy: methotrexate, cytarabine, and hydrocortisone) until the CSF is clear, often followed by cranial radiation therapy in some protocols to ensure eradication.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 2-year-old child presents with a large abdominal mass. Biopsy reveals Neuroblastoma. The tumor is evaluated for the MYCN oncogene. By what mechanism does the MYCN gene drive the aggressive nature of this tumor?', 
'["It acts as a transmembrane tyrosine kinase receptor, constantly signaling for growth", "It acts as a transcription factor, binding to DNA and upregulating genes involved in cell proliferation and survival", "It inhibits the p53 tumor suppressor protein", "It prevents the shortening of telomeres"]'::jsonb, 
1, 
'The MYCN gene (like other members of the MYC family, such as c-MYC) encodes a nuclear transcription factor. When the gene is amplified (multiple copies present), massive amounts of the MYCN protein are produced. This protein binds to specific DNA sequences (E-boxes) and globally upregulates the transcription of numerous target genes that drive the cell cycle forward, promote survival, and inhibit differentiation, leading to highly aggressive, rapid tumor growth.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 15-year-old male receives a bone marrow transplant for relapsed leukemia. Three months later, he presents with a dry, intensely itchy skin rash, dry eyes, a dry mouth, and increasing shortness of breath. Pulmonary function tests show a severe obstructive defect. What is the most likely diagnosis?', 
'["Acute Graft-Versus-Host Disease", "Chronic Graft-Versus-Host Disease", "Cytomegalovirus pneumonitis", "Radiation-induced pulmonary fibrosis"]'::jsonb, 
1, 
'This is a classic presentation of Chronic Graft-Versus-Host Disease (cGVHD). While acute GVHD (occurring <100 days post-transplant) presents with maculopapular rash, secretory diarrhea, and jaundice, chronic GVHD (typically >100 days) resembles an autoimmune collagen vascular disease (like scleroderma or Sjögren syndrome). It is characterized by severe dryness (sicca syndrome), sclerodermatous skin changes, and a devastating, progressive obstructive lung disease called Bronchiolitis Obliterans.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which pediatric malignancy classically presents with a lytic bone lesion surrounded by a multi-layered, "onion-skin" periosteal reaction on X-ray, and is histologically characterized by sheets of uniform small round blue cells expressing CD99?', 
'["Osteosarcoma", "Ewing Sarcoma", "Chondrosarcoma", "Osteoid Osteoma"]'::jsonb, 
1, 
'The "onion-skin" periosteal reaction is a radiographic hallmark of Ewing Sarcoma. This occurs because the aggressive tumor breaks through the bone cortex, lifting the periosteum. The periosteum attempts to lay down new bone to contain the tumor, but the tumor grows past it, forcing the periosteum to lift and lay down another layer, creating multiple concentric layers resembling an onion skin. Strong membranous CD99 expression and the t(11;22) translocation confirm the diagnosis.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 6-year-old boy is diagnosed with a standard-risk ALL. He receives L-Asparaginase during induction. Two weeks later, he presents with sudden onset weakness of his right arm and leg and difficulty speaking. An MRI of the brain confirms an ischemic stroke. What is the mechanism by which L-Asparaginase caused this severe complication?', 
'["It causes severe hypertension leading to hypertensive encephalopathy", "It dramatically increases the platelet count, causing hyperviscosity", "It inhibits the hepatic synthesis of antithrombin III and other clotting factors, leading to a prothrombotic state", "It directly damages the endothelial lining of cerebral blood vessels"]'::jsonb, 
2, 
'L-Asparaginase works by depleting circulating asparagine. Because the liver requires massive amounts of amino acids to synthesize plasma proteins, the depletion of asparagine severely impairs hepatic protein synthesis. This includes a critical drop in the production of Antithrombin III, Protein C, Protein S, and fibrinogen. The loss of these endogenous anticoagulants (especially Antithrombin III) tips the hemostatic balance, causing a severe prothrombotic state, placing the child at high risk for deep vein thromboses and devastating central nervous system strokes or sagittal sinus thromboses.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 1-year-old infant presents with a massive, firm liver. Serum AFP is very high. Biopsy confirms Hepatoblastoma. The tumor is deemed completely resectable. Which chemotherapeutic agent forms the absolute backbone of the adjuvant therapy required to cure this disease?', 
'["Methotrexate", "Cisplatin", "Vincristine", "Dexamethasone"]'::jsonb, 
1, 
'Hepatoblastoma is uniquely and profoundly sensitive to platinum-based chemotherapy. Cisplatin forms the absolute backbone of all modern treatment protocols for hepatoblastoma. Even if a tumor is completely resected upfront, adjuvant chemotherapy containing cisplatin (often combined with 5-fluorouracil and vincristine, or doxorubicin) is mandatory to eradicate micrometastases and achieve the high cure rates (>80%) seen today.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old girl with a history of Osteosarcoma treated with Doxorubicin presents to the emergency room with severe shortness of breath, orthopnea, and pink, frothy sputum. She is in acute congestive heart failure. What is the fundamental pathological change in her heart caused by the anthracycline toxicity?', 
'["Severe thickening and restriction of the pericardium", "Massive hypertrophy of the left ventricular wall", "Dilatation of the ventricular chambers with a profound decrease in contractility (systolic dysfunction)", "Aortic valve stenosis"]'::jsonb, 
2, 
'Anthracycline (Doxorubicin) cardiotoxicity typically manifests as a Dilated Cardiomyopathy. The free radical damage destroys the myocardial muscle fibers (myofibrillar loss and vacuolization). The heart muscle becomes thin, weak, and "flabby." The ventricular chambers dilate (enlarge) significantly, and the heart loses its ability to pump effectively, leading to a profound decrease in the ejection fraction (systolic dysfunction) and classic symptoms of congestive heart failure.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 3-year-old child presents with a retroperitoneal mass. A biopsy reveals a tumor with cells that have small, dark nuclei and scant cytoplasm, forming Homer-Wright rosettes. Which of the following immunochemical stains would be most helpful in confirming the diagnosis of Neuroblastoma and distinguishing it from other small round blue cell tumors?', 
'["Desmin", "CD99", "Neuron-Specific Enolase (NSE)", "Myeloperoxidase (MPO)"]'::jsonb, 
2, 
'Neuroblastoma originates from primitive neural crest cells. To distinguish it from other small round blue cell tumors (like Ewing sarcoma, rhabdomyosarcoma, or lymphoma), pathologists use immunohistochemical stains specific to neural tissue. Neuron-Specific Enolase (NSE), Synaptophysin, and Chromogranin A are strongly positive in neuroblastoma. Desmin is positive in Rhabdomyosarcoma. CD99 is positive in Ewing Sarcoma. MPO is positive in AML.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-year-old boy receives an allogeneic stem cell transplant. He requires a medication to prevent viral reactivation. He is placed on Acyclovir. What is the mechanism of action of Acyclovir against the Herpes Simplex Virus (HSV)?', 
'["It inhibits viral entry into the host cell", "It inhibits the viral protease enzyme", "It acts as a guanosine analog, causing premature DNA chain termination during viral replication", "It prevents the assembly and release of viral particles from the host cell"]'::jsonb, 
2, 
'Acyclovir is an antiviral drug specific for herpesviruses (HSV, VZV). It is a prodrug (a guanosine analog) that must first be phosphorylated by a specific viral enzyme called Thymidine Kinase. Because it relies on a viral enzyme for its initial activation, it is highly selective for infected cells. Once fully phosphorylated into a triphosphate form, it is incorporated into the growing viral DNA chain by the viral DNA polymerase. Because acyclovir lacks the 3''-hydroxyl group needed to attach the next nucleotide, it causes immediate DNA chain termination, halting viral replication.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old girl is diagnosed with a low-grade Pilocytic Astrocytoma of the optic nerve. She also has multiple café-au-lait macules. The diagnosis is Neurofibromatosis Type 1 (NF1). In addition to optic pathway gliomas, patients with NF1 have a significantly increased risk of developing which highly malignant peripheral nerve sheath tumor?', 
'["Malignant Peripheral Nerve Sheath Tumor (MPNST)", "Ewing Sarcoma", "Osteosarcoma", "Burkitt Lymphoma"]'::jsonb, 
0, 
'Patients with NF1 develop numerous benign neurofibromas (tumors of the peripheral nerve sheaths) throughout their lives. The most feared complication is the malignant transformation of a pre-existing plexiform neurofibroma into a Malignant Peripheral Nerve Sheath Tumor (MPNST). This is a highly aggressive, rapidly growing sarcoma that is notoriously resistant to chemotherapy and radiation, making it a leading cause of mortality in adult NF1 patients.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 16-year-old male with Ewing Sarcoma is treated with a regimen including Cyclophosphamide. To prevent a known, severe toxicity, the patient receives vigorous IV hydration and a drug called Mesna. How does Mesna specifically protect the bladder?', 
'["It coats the bladder wall with a protective lipid layer", "It acts as an osmotic diuretic, flushing the bladder rapidly", "Its free sulfhydryl group binds to and detoxifies acrolein in the urine", "It competitively inhibits the reabsorption of cyclophosphamide in the renal tubules"]'::jsonb, 
2, 
'Cyclophosphamide is metabolized in the liver to form the active alkylating agent (phosphoramide mustard) and a toxic byproduct, Acrolein. Acrolein accumulates in the bladder and causes severe hemorrhagic cystitis. Mesna (2-mercaptoethane sulfonate sodium) is administered intravenously. It does not interfere with the active chemotherapy. Instead, it is rapidly excreted into the urine, where its free sulfhydryl group binds directly to the toxic double bond of acrolein, forming a stable, non-toxic thioether compound that is safely voided.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 4-year-old boy presents with a massive, firm, right-sided abdominal mass. Ultrasound shows it is intrarenal. A radical nephrectomy is performed. Pathology confirms Wilms tumor. The tumor was completely excised, but the surgeon noted that the tumor capsule was accidentally nicked and a small amount of tumor content spilled into the right flank. What is the new stage of this tumor based on this event?', 
'["Stage I", "Stage II", "Stage III", "Stage IV"]'::jsonb, 
2, 
'This scenario describes intraoperative tumor spillage. Even if the tumor was localized and completely removed, the act of spilling tumor contents (even a tiny amount) contaminates the peritoneal cavity with malignant cells. According to the National Wilms Tumor Study staging system, any tumor spillage (spontaneous or surgical) automatically designates the patient as Stage III. This is critical because Stage III patients require the addition of whole-abdomen radiation therapy to sterilize the peritoneal cavity and prevent recurrence.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A pediatric patient with relapsed ALL is scheduled for a hematopoietic stem cell transplant. The conditioning regimen includes Total Body Irradiation (TBI). Which of the following organs is most acutely sensitive to radiation damage, often presenting with severe mucositis and diarrhea within the first week of therapy?', 
'["The heart", "The brain", "The gastrointestinal tract epithelium", "The kidneys"]'::jsonb, 
2, 
'Radiation therapy exerts its most profound cytotoxic effects on rapidly dividing cells. The epithelial lining of the gastrointestinal tract (from the mouth to the anus) has one of the highest cellular turnover rates in the human body. Therefore, the GI tract is acutely and exquisitely sensitive to radiation. Total Body Irradiation (TBI) predictably causes severe mucosal damage, resulting in painful oral mucositis, massive secretory diarrhea, and malabsorption within days of exposure.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 12-year-old boy with a history of Osteosarcoma presents to the clinic for a routine follow-up. He completed treatment 2 years ago. He is currently asymptomatic. Which imaging modality is the standard of care for routine surveillance to detect the most common site of osteosarcoma relapse?', 
'["Whole-body PET scan", "MRI of the original tumor site", "Bone scan", "CT scan of the chest without contrast"]'::jsonb, 
3, 
'Osteosarcoma almost exclusively metastasizes to the lungs via hematogenous spread. Because early detection of isolated pulmonary metastases is crucial (as they can be surgically cured), the gold standard for routine surveillance is a high-resolution CT scan of the chest without contrast. While an MRI of the primary site is also done to check for local recurrence, the lungs are the most critical area to monitor. Routine whole-body PET scans are generally not recommended for standard surveillance due to high false-positive rates and radiation exposure.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which of the following chemotherapeutic agents, frequently used in the treatment of pediatric brain tumors and lymphomas, acts as an alkylating agent, is highly emetogenic, and uniquely causes significant myelosuppression (particularly thrombocytopenia) that is delayed, often occurring 4-6 weeks after administration?', 
'["Carmustine (BCNU) / Lomustine (CCNU)", "Vincristine", "Methotrexate", "Bleomycin"]'::jsonb, 
0, 
'Carmustine (BCNU) and Lomustine (CCNU) are nitrosoureas. They are highly lipid-soluble, allowing them to cross the blood-brain barrier. A unique and defining clinical characteristic of nitrosoureas is their profound and delayed myelosuppression. Unlike most chemotherapy drugs that cause a nadir (lowest blood count) at 10-14 days, nitrosoureas typically cause a severe drop in platelets and white blood cells that does not occur until 4 to 6 weeks after the dose is given.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old girl is diagnosed with a giant cell tumor of the bone located in the distal femur. While giant cell tumors are generally considered benign, they are locally aggressive. What is the characteristic radiographic appearance of this tumor?', 
'["A sunburst pattern with periosteal elevation", "An onion-skin periosteal reaction", "A well-defined, radiolucent (lytic) lesion located in the epiphysis, extending to the articular surface", "A small sclerotic nidus surrounded by thick bone"]'::jsonb, 
2, 
'Giant Cell Tumor of Bone (Osteoclastoma) is a locally aggressive, usually benign tumor that typically arises after the growth plates have closed (late adolescence/young adulthood). Its classic radiographic location is absolutely definitive: it arises in the epiphysis (the very end of the bone) and grows right up to, but rarely crosses, the articular cartilage. It appears as a "soap bubble" or purely lytic, well-defined radiolucency. Osteosarcoma and Ewing sarcoma typically arise in the metaphysis and diaphysis, respectively.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old boy presents with a rapidly growing mass in his jaw. Biopsy confirms Endemic Burkitt Lymphoma. The tumor cells are driven by a massive overproduction of the c-myc protein. What is the normal physiological function of the c-myc protein?', 
'["It is a cell surface receptor that binds growth factors", "It is an intracellular tyrosine kinase that phosphorylates downstream targets", "It is a nuclear transcription factor that strongly promotes cell cycle progression from G1 to S phase", "It is a tumor suppressor that triggers apoptosis when DNA damage is detected"]'::jsonb, 
2, 
'The c-myc gene (located on chromosome 8) is a powerful proto-oncogene. Its protein product is a nuclear transcription factor. When a cell needs to divide, c-myc binds to DNA and massively upregulates the transcription of numerous genes required for the cell to transition from the resting (G1) phase into the DNA synthesis (S) phase. In Burkitt Lymphoma, the t(8;14) translocation places c-myc under the control of the highly active immunoglobulin heavy chain promoter, leading to constant, unregulated c-myc production and an explosive rate of cellular proliferation.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A pediatric patient with a high-risk neuroblastoma completes intensive chemotherapy, surgery, and radiation. The patient then undergoes an autologous stem cell transplant. Following recovery, the final phase of therapy involves the administration of Dinutuximab, GM-CSF, and IL-2. What is the mechanism by which Dinutuximab targets the residual neuroblastoma cells?', 
'["It acts as a radioactive isotope to deliver localized radiation", "It forces the tumor cells to differentiate into mature ganglion cells", "It is a monoclonal antibody that binds to the GD2 antigen on the tumor surface, triggering antibody-dependent cellular cytotoxicity (ADCC)", "It inhibits the MYCN transcription factor directly"]'::jsonb, 
2, 
'Dinutuximab is a chimeric monoclonal antibody. Its specific target is GD2, a disialoganglioside highly expressed on the surface of neuroblastoma cells. When Dinutuximab binds to GD2 on the tumor cell, it acts as a "flag" for the patient''s immune system. It strongly activates Natural Killer (NK) cells and macrophages (often boosted by the co-administration of GM-CSF and IL-2) to attack and destroy the tumor cell via Antibody-Dependent Cellular Cytotoxicity (ADCC) and complement-dependent cytotoxicity. It is highly effective at eradicating minimal residual disease.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-year-old child presents with a headache and progressive visual loss. An MRI reveals a calcified, cystic mass in the suprasellar region. The child also complains of constant thirst and frequent urination. The tumor is diagnosed as a Craniopharyngioma. The excessive thirst and urination are a result of the tumor compressing which anatomical structure?', 
'["The optic chiasm", "The pineal gland", "The pituitary stalk (infundibulum) or hypothalamus", "The fourth ventricle"]'::jsonb, 
2, 
'Craniopharyngiomas grow in the suprasellar space. As they enlarge, they frequently compress the overlying hypothalamus and the pituitary stalk (infundibulum). This compression disrupts the transport of Antidiuretic Hormone (ADH, vasopressin) from the hypothalamus down to the posterior pituitary gland. The resulting lack of ADH secretion causes Central Diabetes Insipidus, characterized by the inability to concentrate urine, leading to massive polyuria (frequent urination) and compensatory polydipsia (excessive thirst).')

;
