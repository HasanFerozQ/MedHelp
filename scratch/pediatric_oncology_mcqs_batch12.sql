-- Batch 12: 30 Pediatric Oncology MCQs (Questions 331-360)
-- Note: Replace (SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1) with the actual topic_id for Pediatric Oncology Essentials

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 2-year-old child presents with a painless abdominal mass. An ultrasound confirms a solid tumor in the right kidney. The surgeon performs a radical nephrectomy. The pathology report describes the tumor as a "Mesoblastic Nephroma." What is the expected clinical behavior and standard treatment for this specific tumor type?', 
'["Highly malignant, requiring intensive chemotherapy and radiation", "Benign, surgical resection alone is almost always curative", "Pre-malignant, requiring prophylactic chemotherapy to prevent transformation to Wilms tumor", "Associated with severe paraneoplastic hypertension requiring lifelong ACE inhibitors"]'::jsonb, 
1, 
'Congenital Mesoblastic Nephroma is the most common renal tumor in infants under 6 months of age (and often diagnosed prenatally or shortly after birth). Despite presenting similarly to a Wilms tumor, it is a benign mesenchymal tumor (a hamartoma). It does not metastasize. The standard of care is complete surgical resection (nephrectomy).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 13-year-old boy with a history of sickle cell disease presents with an enlarging, painful mass in his left jaw. A biopsy reveals Burkitt Lymphoma. In patients with severe underlying immunodeficiency or chronic hemolytic anemias (like sickle cell or malaria), which infectious agent is almost universally the driving force behind the development of Burkitt Lymphoma?', 
'["Human Immunodeficiency Virus (HIV)", "Hepatitis B Virus (HBV)", "Epstein-Barr Virus (EBV)", "Human Herpesvirus 8 (HHV-8)"]'::jsonb, 
2, 
'Endemic Burkitt Lymphoma and Burkitt Lymphoma occurring in immunodeficient patients are both strongly associated with the Epstein-Barr Virus (EBV). The chronic immune stimulation or immunosuppression (e.g., from chronic malaria or sickle cell disease) allows EBV to latently infect B cells and drive their immortalization, serving as the first crucial step before the defining c-myc translocation occurs.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old girl is diagnosed with standard-risk Acute Lymphoblastic Leukemia (ALL). She is admitted to the hospital to begin her induction chemotherapy regimen. What is the primary, overarching goal of the "Induction" phase of ALL treatment?', 
'["To completely cure the patient of the disease", "To eradicate all microscopic residual disease in the central nervous system", "To rapidly reduce the leukemic burden to undetectable levels in the bone marrow (<5% blasts) and restore normal hematopoiesis", "To prepare the patient''s bone marrow for a stem cell transplant"]'::jsonb, 
2, 
'The treatment of ALL is divided into phases (Induction, Consolidation, Maintenance). The primary goal of the initial "Induction" phase (usually lasting 4 weeks and utilizing 3 or 4 heavy drugs) is to achieve a "Complete Remission" (CR). A CR is defined clinically and morphologically as having less than 5% blasts remaining in the bone marrow, the absence of circulating blasts in the blood, and the recovery of normal bone marrow function.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 16-year-old female presents with a painless mass in her left breast. Ultrasound shows a well-circumscribed, solid, oval mass. A biopsy reveals a Fibroadenoma. While this is benign, the patient asks about her risk for breast cancer. The oncologist explains that her risk would be significantly elevated if she had previously received radiation therapy to the chest. At what age does the risk of secondary breast cancer sharply begin to rise after childhood chest radiation?', 
'["Immediately (within 1-2 years)", "Approximately 5 years after exposure", "Typically 10 to 15 years after exposure, or around age 25", "Only after menopause"]'::jsonb, 
2, 
'Secondary solid tumors induced by radiation therapy have a long latency period. For females treated with chest or mantle-field radiation (e.g., for Hodgkin Lymphoma) during childhood or adolescence, the risk of developing secondary breast cancer begins to rise significantly about 10 to 15 years after the radiation exposure.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 9-year-old boy presents with progressive clumsiness and a wide-based gait. An MRI reveals a cystic mass with an enhancing mural nodule in the right cerebellar hemisphere. The tumor is completely resected. Pathology confirms a Pilocytic Astrocytoma. What is the expected 10-year overall survival rate for this specific tumor after complete surgical resection?', 
'["< 10%", "Around 30%", "Around 60%", "> 90%"]'::jsonb, 
3, 
'Pilocytic Astrocytoma (WHO Grade 1) is a biologically benign, circumscribed tumor. When it occurs in a surgically accessible location (like the cerebellar hemispheres) and can be completely excised, the prognosis is universally excellent. The 10-year overall survival rate exceeds 90-95%.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old girl is diagnosed with Osteosarcoma of the distal femur. She completes neoadjuvant chemotherapy, undergoes a limb-salvage resection, and is now receiving adjuvant (post-operative) chemotherapy. What is the primary purpose of this adjuvant chemotherapy?', 
'["To prevent the development of a secondary leukemia", "To eradicate any remaining microscopic metastatic disease (micrometastases) that survived the initial treatment", "To suppress the immune system so the prosthetic limb is not rejected", "To stimulate bone healing around the surgical site"]'::jsonb, 
1, 
'Even after the primary tumor is completely removed and the patient appears "cancer-free" on imaging, microscopic cancer cells (micrometastases) almost certainly exist elsewhere in the body (usually the lungs). If left untreated, these cells will grow into lethal macroscopic tumors. The sole purpose of adjuvant (post-operative) chemotherapy is to circulate systemically and eradicate this invisible microscopic disease.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 4-year-old boy with a history of recurrent urinary tract infections presents with a large abdominal mass. A CT scan reveals a tumor originating from the bladder wall, growing into the lumen in a polypoid, grape-like cluster. Biopsy confirms Embryonal Rhabdomyosarcoma (Sarcoma Botryoides). Which immunohistochemical marker will be strongly positive in these tumor cells?', 
'["Cytokeratin", "Myogenin (and Desmin)", "S100", "CD45 (LCA)"]'::jsonb, 
1, 
'Sarcoma Botryoides is a subtype of Embryonal Rhabdomyosarcoma that grows beneath the mucosal surface of hollow organs (bladder, vagina, biliary tract). Because rhabdomyosarcomas derive from primitive skeletal muscle cells, they definitively express skeletal muscle-specific proteins. Myogenin, MyoD1, and Desmin will be strongly positive on immunohistochemistry.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 16-year-old male is receiving multi-agent chemotherapy for a high-grade sarcoma. He presents to the clinic with profound fatigue, easy bruising, and a fever. His CBC shows a WBC of 1,200/mm³, Hemoglobin of 7.5 g/dL, and Platelets of 15,000/mm³. This pancytopenia is the expected result of which direct effect of the cytotoxic chemotherapy?', 
'["Autoimmune destruction of circulating blood cells", "Direct toxicity to the spleen, causing sequestration", "Inhibition of DNA synthesis in the rapidly dividing hematopoietic stem cells in the bone marrow", "Bleeding into the gastrointestinal tract"]'::jsonb, 
2, 
'Cytotoxic chemotherapy drugs target rapidly dividing cells. The most rapidly dividing normal cells in the human body are the hematopoietic stem cells and progenitor cells in the bone marrow. Therefore, a universal, expected, and dose-limiting side effect of most traditional chemotherapy is severe bone marrow suppression (myelosuppression), leading to the simultaneous drop in all three blood cell lines (pancytopenia).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old girl presents with a firm abdominal mass. Ultrasound shows it is intrarenal. A biopsy is planned but delayed due to a holiday weekend. During this time, the child falls while playing and sustains blunt trauma to her abdomen. She suddenly develops severe abdominal pain, a rapidly distending abdomen, and hypotension. What catastrophic event has likely occurred?', 
'["Acute appendicitis", "Tumor rupture leading to massive intraperitoneal hemorrhage and tumor spillage", "Intussusception", "Renal artery thrombosis"]'::jsonb, 
1, 
'Wilms tumors (and some large neuroblastomas) are highly vascular, fragile, and often encapsulated under high pressure. Blunt abdominal trauma can easily cause the tumor capsule to rupture. This results in two catastrophic events: (1) massive, life-threatening hemorrhage into the peritoneal cavity causing hemorrhagic shock (hypotension), and (2) massive spillage of tumor cells throughout the abdomen, which significantly worsens the prognosis.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-year-old boy with Acute Lymphoblastic Leukemia (ALL) is receiving maintenance therapy with daily oral 6-Mercaptopurine. The drug is metabolized by Thiopurine Methyltransferase (TPMT). If the patient has a genetic polymorphism resulting in exceptionally HIGH TPMT enzyme activity (a rapid metabolizer), what is the most likely clinical consequence?', 
'["Severe, life-threatening myelosuppression", "Increased risk of developing a secondary brain tumor", "The drug will be cleared too rapidly, leading to sub-therapeutic drug levels and an increased risk of leukemia relapse", "Hemorrhagic cystitis"]'::jsonb, 
2, 
'While low or absent TPMT activity leads to massive, toxic accumulation of 6-MP, patients with exceptionally HIGH TPMT activity ("rapid metabolizers") clear the drug much faster than normal. If they receive a standard dose, they will have sub-therapeutic levels of the active drug in their system. This inadequate drug exposure significantly increases their risk of leukemia relapse. Their dose of 6-MP must be increased to maintain therapeutic levels.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 1-year-old child presents with a white pupillary reflex (leukocoria). She is diagnosed with bilateral Retinoblastoma. The tumor is caused by the loss of the RB1 tumor suppressor gene. According to Knudson''s "Two-Hit Hypothesis," how did this child develop bilateral disease?', 
'["She acquired two separate sporadic mutations in a single retinal cell after birth", "She inherited one mutated RB1 allele from a parent (the first hit in all cells), and a second somatic mutation (the second hit) occurred independently in multiple retinal cells", "A virus inserted an oncogene into her retinal cells", "She inherited two mutated RB1 alleles, one from each parent"]'::jsonb, 
1, 
'Knudson''s Two-Hit Hypothesis explains hereditary cancers. In bilateral (hereditary) retinoblastoma, the child inherits one defective RB1 allele in the germline. This means every single cell in her body already has "one hit." Because there are millions of retinal cells, it is a statistical certainty that during early childhood, at least one cell in each eye will suffer a spontaneous mutation (the "second hit") in the remaining good allele, leading to multiple bilateral tumors.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old boy presents with progressive right knee pain and swelling. X-ray shows a destructive lesion in the distal femur with a "sunburst" pattern and a Codman triangle. A biopsy confirms Osteosarcoma. Which of the following blood tests is frequently elevated in osteosarcoma and can serve as a marker for tumor burden and prognosis?', 
'["Alpha-fetoprotein (AFP)", "Lactate Dehydrogenase (LDH) and Alkaline Phosphatase (ALP)", "Beta-hCG", "Carcinoembryonic Antigen (CEA)"]'::jsonb, 
1, 
'Osteosarcoma cells are malignant osteoblasts that actively lay down disorganized bone matrix (osteoid). Because they are hyperactive osteoblasts, they secrete high levels of Alkaline Phosphatase (ALP) into the blood. Additionally, because the tumor is rapidly growing and turning over, Lactate Dehydrogenase (LDH) is also frequently elevated. Elevated levels of LDH and ALP at diagnosis correlate with a higher tumor burden and a poorer prognosis.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 7-year-old girl is diagnosed with a Diffuse Intrinsic Pontine Glioma (DIPG). The parents ask the oncologist about the standard treatment plan and the expected outcome. What is the standard of care, and what is the prognosis for this specific tumor?', 
'["Complete surgical resection; excellent prognosis (>90% cure rate)", "Radiation therapy to the brainstem for temporary symptom palliation; universally fatal prognosis (median survival <1 year)", "High-dose chemotherapy with stem cell rescue; moderate prognosis (50% cure rate)", "Observation only; the tumor spontaneously regresses"]'::jsonb, 
1, 
'Diffuse Intrinsic Pontine Glioma (DIPG) is one of the most devastating pediatric cancers. It aggressively infiltrates the pons (brainstem), making surgical resection absolutely impossible without killing the patient. It is notoriously resistant to all known chemotherapies. The only standard treatment is focal radiation therapy, which temporarily shrinks the tumor and palliates symptoms for a few months. The disease is universally fatal, with a median survival of less than 1 year.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 3-year-old boy presents with an enlarging, painless abdominal mass. His blood pressure is normal. An ultrasound reveals the mass is located in the adrenal gland but displaces the kidney downward without invading it. Urine VMA and HVA are elevated. What is the most likely diagnosis?', 
'["Wilms Tumor (Nephroblastoma)", "Neuroblastoma", "Pheochromocytoma", "Hepatoblastoma"]'::jsonb, 
1, 
'This is a classic presentation of Neuroblastoma. It most commonly arises in the adrenal medulla (above the kidney) or along the sympathetic chain. Because it arises outside the kidney, it typically displaces the kidney downward on imaging. This is a key radiographic distinction from Wilms tumor, which originates inside the kidney and distorts the internal renal architecture.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 16-year-old male with Ewing Sarcoma is receiving a chemotherapy regimen containing Doxorubicin (an anthracycline). Before starting the first dose, he must undergo an essential screening test to establish a baseline. Which test is required?', 
'["Audiogram (hearing test)", "Pulmonary function test (PFT)", "Echocardiogram or MUGA scan", "Bone density scan (DEXA)"]'::jsonb, 
2, 
'Anthracyclines (Doxorubicin, Daunorubicin) are famously cardiotoxic, causing dose-dependent, irreversible dilated cardiomyopathy. Because the damage is cumulative over the patient''s lifetime, it is absolutely essential to establish a baseline measurement of the heart''s pumping function (Ejection Fraction) before the very first dose is given. This is done via an Echocardiogram or a MUGA (Multiple Gated Acquisition) scan.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A pediatric patient with relapsed ALL receives a CD19-directed CAR-T cell infusion. Five days later, she is recovering from a severe bout of Cytokine Release Syndrome. The nurse notices she is now confused, unable to write her name, and her speech is slurred. An MRI of the brain is normal. What specific, reversible neurological complication of CAR-T therapy is she experiencing?', 
'["Posterior Reversible Encephalopathy Syndrome (PRES)", "Immune Effector Cell-Associated Neurotoxicity Syndrome (ICANS)", "Progressive Multifocal Leukoencephalopathy (PML)", "Acute stroke"]'::jsonb, 
1, 
'Immune Effector Cell-Associated Neurotoxicity Syndrome (ICANS) is a unique, often severe, but generally reversible neurological complication that occurs following CAR-T cell therapy. It typically presents days to weeks after the infusion, often following or overlapping with Cytokine Release Syndrome (CRS). Symptoms range from mild confusion and expressive aphasia to severe seizures and coma. The primary treatment is high-dose corticosteroids.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old girl presents with fatigue, bruising, and bone pain. A bone marrow aspirate reveals 80% lymphoblasts. She is diagnosed with B-cell ALL. Cytogenetic analysis of her blasts reveals hyperdiploidy (she has 55 chromosomes per blast cell). How does this specific cytogenetic finding affect her prognosis and treatment?', 
'["It is a highly unfavorable finding, requiring immediate stem cell transplant", "It is a highly favorable prognostic factor, indicating a very high likelihood of cure with standard chemotherapy", "It indicates she has underlying Down syndrome", "It indicates she will not respond to methotrexate"]'::jsonb, 
1, 
'In pediatric B-cell ALL, the number of chromosomes in the leukemic blasts (ploidy) is a powerful prognostic factor. Hyperdiploidy (having more than 50 chromosomes, typically 51-65) is one of the most favorable genetic markers. Patients with hyperdiploid ALL are highly sensitive to standard chemotherapy and have an excellent overall survival rate (>90%).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 12-year-old boy is diagnosed with a solid tumor. The biopsy reveals sheets of uniform, small, round blue cells. Immunohistochemistry is strongly positive for CD99. Cytogenetics confirms a t(11;22) translocation. This specific genetic translocation creates the EWS-FLI1 fusion protein. What type of protein is EWS-FLI1?', 
'["A transmembrane tyrosine kinase receptor", "A structurally defective cytoskeletal protein", "An aberrant transcription factor that drives continuous gene expression", "An inactive tumor suppressor"]'::jsonb, 
2, 
'The t(11;22) translocation pathognomonic for Ewing Sarcoma fuses the EWS gene to the FLI1 gene. The resulting EWS-FLI1 fusion protein acts as a potent, aberrant transcription factor. It localizes to the nucleus, binds to DNA, and forcefully upregulates the transcription of numerous target genes that promote cell survival, proliferation, and angiogenesis.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 4-year-old boy with a history of an abdominal mass is diagnosed with Burkitt Lymphoma. He is started on an intense, rapid-acting chemotherapy regimen. Twelve hours later, his urine output drops significantly. Lab work shows high potassium, high uric acid, and high phosphorus. What is the primary mechanism causing his acute kidney injury in this scenario?', 
'["Direct nephrotoxicity from the chemotherapy drugs acting on the proximal tubule", "Autoimmune destruction of the glomeruli", "Precipitation of uric acid and calcium phosphate crystals in the renal tubules, causing mechanical obstruction", "Hypovolemia due to severe vomiting"]'::jsonb, 
2, 
'This patient is experiencing severe Tumor Lysis Syndrome (TLS). The rapid destruction of tumor cells releases massive amounts of intracellular nucleic acids (converted to uric acid) and phosphorus. In the acidic environment of the distal renal tubules, uric acid rapidly crystallizes. Furthermore, the high phosphorus binds to serum calcium, and calcium phosphate also precipitates in the tubules. These crystals physically block the nephrons.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 15-year-old female treated for Hodgkin Lymphoma with mantle field radiation therapy at age 10 presents to the clinic. She complains of fatigue, weight gain, constipation, and feeling cold all the time. Her TSH is highly elevated, and her free T4 is low. What is the most likely cause of her symptoms?', 
'["Secondary pituitary adenoma", "Autoimmune Hashimoto''s thyroiditis", "Radiation-induced primary hypothyroidism", "Recurrence of Hodgkin lymphoma in the thyroid gland"]'::jsonb, 
2, 
'The thyroid gland is highly sensitive to radiation. Mantle field radiation (used for chest/neck lymphomas) invariably exposes the thyroid gland to significant scatter radiation. This causes progressive, irreversible damage and fibrosis of the thyroid tissue. A very common late effect (often occurring years after treatment) is primary hypothyroidism.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 1-year-old infant is diagnosed with a massive, localized neuroblastoma. The tumor is surgically removed. Pathology shows favorable histology. Genetic testing reveals the tumor lacks MYCN amplification. What is the expected 5-year survival rate for this patient with surgery alone?', 
'["Less than 20%", "Approximately 50%", "Approximately 75%", "Greater than 95%"]'::jsonb, 
3, 
'Age and MYCN status are the two most critical prognostic factors in Neuroblastoma. Infants (under 18 months of age) with localized disease (Stage 1 or 2) and favorable biology (specifically, the absence of MYCN amplification) have an extraordinarily high cure rate. The 5-year overall survival rate for this specific low-risk group exceeds 95% with surgical resection alone.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 13-year-old girl is diagnosed with Osteosarcoma of the right distal femur. She completes neoadjuvant chemotherapy, undergoes a limb-salvage resection, and completes adjuvant chemotherapy. Three years later, she presents with a persistent, non-productive cough. A chest CT reveals three small nodules in her right lung. A biopsy confirms metastatic osteosarcoma. What is the most important component of the curative treatment plan for this relapse?', 
'["High-dose radiation therapy to the right lung", "Complete surgical resection (metastasectomy) of the pulmonary nodules", "Initiation of a completely new chemotherapy regimen (e.g., Ifosfamide/Etoposide) without surgery", "Palliative care, as relapsed osteosarcoma is invariably fatal"]'::jsonb, 
1, 
'Osteosarcoma is notoriously resistant to radiation therapy, and chemotherapy alone cannot cure macroscopic metastatic disease. The absolute cornerstone of curative therapy for an isolated pulmonary relapse in osteosarcoma is the complete surgical resection (metastasectomy or wedge resection) of every visible lung nodule.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old boy with ALL is receiving L-Asparaginase as part of his induction therapy. Which of the following is a known, potentially life-threatening complication of L-Asparaginase that requires immediate discontinuation of the drug and typically presents with severe, radiating abdominal pain?', 
'["Acute pancreatitis", "Hemorrhagic cystitis", "Pulmonary fibrosis", "Cardiomyopathy"]'::jsonb, 
0, 
'L-Asparaginase severely impairs hepatic protein synthesis, leading to several unique toxicities. One of the most feared and well-known complications is severe Acute Pancreatitis (occurring in up to 10% of patients). It presents with severe epigastric pain radiating to the back, nausea, and vomiting. If a patient develops clinical pancreatitis, L-Asparaginase must be permanently discontinued.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old male receives a bone marrow transplant for relapsed leukemia. Two months later, he develops a severe, diffuse interstitial pneumonia. Bronchoalveolar lavage is positive for Cytomegalovirus (CMV). Which antiviral medication is the standard first-line treatment for invasive CMV infections in transplant patients?', 
'["Acyclovir", "Ganciclovir (or Valganciclovir)", "Oseltamivir", "Ribavirin"]'::jsonb, 
1, 
'While Acyclovir is effective against HSV and VZV, it has very weak activity against Cytomegalovirus (CMV). The standard, highly effective first-line treatment for invasive CMV infections (like pneumonitis or retinitis) is Ganciclovir (IV) or its oral prodrug Valganciclovir. These drugs act as potent DNA polymerase inhibitors. A major side effect of ganciclovir is severe bone marrow suppression.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 3-year-old girl is diagnosed with a Wilms tumor. The tumor is completely resected. Pathology reveals it is a Stage I tumor with favorable histology. However, the pathologist notes the presence of "nephrogenic rests" in the adjacent, normal-appearing kidney tissue. What is the clinical significance of finding nephrogenic rests?', 
'["It indicates the tumor has already metastasized to the lungs", "It represents pre-malignant embryonal tissue, placing the child at a significantly higher risk for developing a second Wilms tumor in the contralateral kidney", "It confirms the diagnosis of a benign mesoblastic nephroma", "It indicates the tumor is highly resistant to chemotherapy"]'::jsonb, 
1, 
'Nephrogenic rests are foci of abnormally retained, primitive embryonic kidney tissue (metanephric blastema) that failed to mature. They are considered precursor (pre-malignant) lesions to Wilms tumor. Finding nephrogenic rests in the kidney adjacent to a Wilms tumor (a condition called nephroblastomatosis) strongly implies a field defect in kidney development, placing the child at a significantly increased risk of developing a subsequent Wilms tumor.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-year-old boy is diagnosed with a Medulloblastoma. He undergoes complete surgical resection of the tumor from the posterior fossa. Which of the following adjuvant therapies is standard and mandatory for all patients over the age of 3 with Medulloblastoma to prevent the most common pattern of relapse?', 
'["Craniospinal irradiation (CSI)", "High-dose Methotrexate monotherapy", "Placement of an Ommaya reservoir for daily intrathecal therapy", "Targeted therapy with Imatinib"]'::jsonb, 
0, 
'Medulloblastoma has a profound propensity to shed cells into the cerebrospinal fluid (CSF), leading to leptomeningeal dissemination ("drop metastases") throughout the entire neuroaxis. Even if the primary tumor in the cerebellum is completely removed and the CSF appears clear, microscopic seeding is presumed. Therefore, the standard of care for all children over age 3 is Craniospinal Irradiation (CSI)—radiating the entire brain and spinal cord—followed by systemic chemotherapy.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 16-year-old female treated for Hodgkin Lymphoma receives mantle field radiation. Which of the following is the most effective and recommended screening modality for detecting secondary breast cancer in this high-risk patient population, starting at age 25?', 
'["Annual breast self-examination only", "Annual mammography only", "Annual breast MRI in addition to mammography", "Prophylactic bilateral mastectomy at age 25"]'::jsonb, 
2, 
'Females treated with mantle field radiation have a risk of breast cancer approaching that of women with BRCA mutations. Because this screening begins at age 25, the breast tissue is very dense, making standard mammography less sensitive. The standard of care for these high-risk survivors is intensive, dual-modality screening: an annual Breast MRI (which is highly sensitive in dense breasts) alternating with or alongside an annual Mammography, starting 8 years post-radiation or at age 25.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old child with ALL develops severe Tumor Lysis Syndrome (TLS). Which of the following is the most immediate, life-threatening metabolic derangement associated with TLS that must be corrected urgently to prevent cardiac arrest?', 
'["Hyperuricemia", "Hyperphosphatemia", "Hyperkalemia", "Hypocalcemia"]'::jsonb, 
2, 
'While hyperuricemia and hyperphosphatemia cause acute kidney injury, the most immediate and acutely life-threatening derangement in Tumor Lysis Syndrome is Hyperkalemia. Massive tumor cell breakdown releases intracellular potassium into the bloodstream. High serum potassium rapidly disrupts the electrical conduction system of the heart, leading to fatal arrhythmias such as ventricular fibrillation or asystole.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 2-year-old boy presents with a firm, smooth abdominal mass. Ultrasound reveals it is intrarenal. The surgeon performs a radical nephrectomy without a prior biopsy. Why is a preoperative needle biopsy of a suspected localized Wilms tumor generally contraindicated in North American protocols?', 
'["It cannot distinguish Wilms tumor from a simple renal cyst", "Needle biopsy carries a high risk of rupturing the tumor capsule, causing peritoneal seeding and upstaging the tumor from Stage I/II to Stage III", "It causes massive, uncontrollable hemorrhage", "Wilms tumors do not have identifiable histological features on biopsy"]'::jsonb, 
1, 
'Wilms tumors are often surrounded by a delicate pseudocapsule. The Children''s Oncology Group (COG) standard of care for a suspected localized Wilms tumor is upfront complete surgical excision. Performing a percutaneous needle biopsy risks puncturing this capsule, which can seed tumor cells into the peritoneal cavity. This "tumor spillage" automatically upstages the patient to Stage III.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 15-year-old male receives a bone marrow transplant for relapsed leukemia. Three weeks later, his neutrophil count recovers, but he develops a severe, peeling skin rash, copious green diarrhea, and jaundice. He is diagnosed with acute Graft-Versus-Host Disease (GVHD). Which class of medications is the first-line, standard-of-care therapy to treat acute GVHD?', 
'["High-dose systemic corticosteroids (e.g., Methylprednisolone)", "Monoclonal antibodies against CD20 (Rituximab)", "Antiviral therapy (Ganciclovir)", "Chemotherapy (Methotrexate)"]'::jsonb, 
0, 
'Acute GVHD is an intense, destructive immune response mediated by donor T cells attacking the host. The immediate, first-line therapy to rapidly suppress this T-cell-mediated attack and halt the inflammation is the administration of high-dose systemic corticosteroids (like IV Methylprednisolone). If the GVHD is steroid-refractory, second-line agents like Ruxolitinib or anti-thymocyte globulin (ATG) are utilized.')

;
