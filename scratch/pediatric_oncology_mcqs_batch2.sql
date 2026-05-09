-- Batch 2: 30 Pediatric Oncology MCQs (Questions 31-60)
-- Note: Replace (SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1) with the actual topic_id for Pediatric Oncology Essentials

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-year-old girl is diagnosed with a Craniopharyngioma. Which of the following classic visual field defects is most commonly associated with this tumor due to its anatomical location?', 
'["Homonymous hemianopsia", "Bitemporal hemianopsia", "Central scotoma", "Enlarged blind spot"]'::jsonb, 
1, 
'Craniopharyngiomas are benign but locally aggressive supratentorial tumors derived from remnants of Rathke''s pouch. They characteristically arise in the suprasellar region. Due to this location, they frequently compress the optic chiasm from below, disrupting the crossing nasal retinal fibers and leading to a classic bitemporal hemianopsia (loss of peripheral vision in both eyes). They can also compress the pituitary stalk, causing endocrinopathies like diabetes insipidus or growth failure.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 6-year-old boy presents with clumsiness, frequent falls, and a head tilt. MRI shows a cystic mass with an enhancing mural nodule in the cerebellar hemisphere. Biopsy shows Rosenthal fibers (eosinophilic, corkscrew-shaped inclusions). What is the diagnosis?', 
'["Medulloblastoma", "Ependymoma", "Pilocytic Astrocytoma", "Glioblastoma Multiforme"]'::jsonb, 
2, 
'Pilocytic Astrocytoma is the most common benign brain tumor in children. It typically occurs in the cerebellum and presents with signs of cerebellar dysfunction (ataxia, clumsiness, head tilt). The classic MRI appearance is a cystic lesion with an enhancing mural nodule. The histological hallmark is the presence of Rosenthal fibers (thick, eosinophilic, corkscrew-shaped proteinaceous inclusions) and spindle cells with hair-like glial processes.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 15-year-old male presents with bone pain that awakens him at night. The pain is remarkably relieved by aspirin. X-ray of the femur shows a small (<2 cm) radiolucent nidus surrounded by thick sclerotic bone. What is the most likely diagnosis?', 
'["Osteosarcoma", "Ewing Sarcoma", "Osteochondroma", "Osteoid Osteoma"]'::jsonb, 
3, 
'Osteoid Osteoma is a benign, bone-forming tumor that primarily affects males in the second decade of life. The classic presentation is dull bone pain that is characteristically worse at night and rapidly relieved by NSAIDs or aspirin. This is because the tumor nidus produces high levels of prostaglandins. X-rays show a small, radiolucent nidus surrounded by dense, reactive sclerotic bone.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old boy notices a painless, bony mass near his knee. It has not grown significantly and does not cause pain at night. X-ray shows a bony exostosis projecting away from the joint space, with a cartilage cap. What is the diagnosis?', 
'["Osteosarcoma", "Osteochondroma", "Giant Cell Tumor", "Chondrosarcoma"]'::jsonb, 
1, 
'Osteochondroma is the most common benign bone tumor in children and adolescents. It is characterized by an outgrowth (exostosis) of bone covered by a cartilage cap, typically occurring at the metaphysis of long bones (like the distal femur or proximal tibia) and growing away from the joint. It is generally asymptomatic unless it compresses a nearby nerve or blood vessel. Malignant transformation to chondrosarcoma is rare (<1%).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'An 18-month-old infant presents with "raccoon eyes" (periorbital ecchymoses), abdominal distension, and opsoclonus-myoclonus syndrome ("dancing eyes, dancing feet"). Which of the following tumors is most strongly associated with this paraneoplastic presentation?', 
'["Retinoblastoma", "Wilms Tumor", "Neuroblastoma", "Hepatoblastoma"]'::jsonb, 
2, 
'Neuroblastoma can present with striking paraneoplastic and metastatic signs. "Raccoon eyes" occur due to tumor metastases to the periorbital bones. Opsoclonus-myoclonus syndrome (OMS) is a rare but classic paraneoplastic syndrome of neuroblastoma, characterized by rapid, chaotic eye movements ("dancing eyes") and myoclonic jerks ("dancing feet"). It is thought to be immune-mediated.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 2-year-old child with a unilateral Wilms tumor is scheduled for surgical resection. During the preoperative evaluation, the surgeon cautions the team to handle the tumor with extreme care to avoid rupture. Spontaneous or surgical rupture of a Wilms tumor specifically increases the risk of which of the following?', 
'["Immediate cardiac arrest", "Diffuse peritoneal seeding and tumor upstaging", "Massive release of catecholamines leading to hypertensive crisis", "Development of bilateral disease"]'::jsonb, 
1, 
'Wilms tumor (Nephroblastoma) is a fragile, encapsulated tumor. If the capsule is breached or the tumor ruptures before or during surgical excision, tumor cells can spill into the peritoneal cavity. This peritoneal seeding significantly worsens the prognosis, automatically upstaging the patient to Stage III disease and necessitating the addition of whole-abdomen radiation and more intensive chemotherapy.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 4-year-old boy presents with a firm, painless mass in the right testicle. He is diagnosed with a yolk sac tumor (endodermal sinus tumor). Which serum tumor marker is characteristically elevated and useful for monitoring treatment response in this patient?', 
'["Beta-hCG", "Alpha-fetoprotein (AFP)", "Lactate Dehydrogenase (LDH)", "Carcinoembryonic Antigen (CEA)"]'::jsonb, 
1, 
'Yolk sac tumors are the most common testicular tumor in children under 3 years of age. They are non-seminomatous germ cell tumors. The classic and highly sensitive serum tumor marker for yolk sac tumors is Alpha-fetoprotein (AFP). A classic histological finding (though not always present) is the Schiller-Duval body, which resembles a primitive glomerulus. Beta-hCG is typically elevated in choriocarcinomas.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 1-year-old child presents with seborrheic dermatitis-like eruptions on the scalp, lytic bone lesions in the skull, and diabetes insipidus. Biopsy of a skin lesion reveals cells with characteristic "tennis racket" shaped Birbeck granules on electron microscopy. What is the diagnosis?', 
'["Histiocytosis X (Langerhans Cell Histiocytosis)", "Neuroblastoma", "Leukemic infiltration", "Osteopetrosis"]'::jsonb, 
0, 
'Langerhans Cell Histiocytosis (LCH) is a clonal proliferation of Langerhans cells (specialized dendritic cells). The classic triad (Hand-Schüller-Christian disease) includes lytic skull defects, diabetes insipidus (from pituitary stalk infiltration), and exophthalmos. Infants can present with a severe, disseminated form featuring a seborrheic rash and hepatosplenomegaly (Letterer-Siwe disease). The pathognomonic finding on electron microscopy is the presence of Birbeck granules, which resemble tennis rackets. The cells are CD1a+ and S100+.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 13-year-old female presents with a rapidly enlarging, painless mass in her anterior neck. Ultrasound reveals a solid thyroid nodule with microcalcifications. Fine-needle aspiration shows cells with "Orphan Annie eye" nuclei and psammoma bodies. What is the most likely diagnosis?', 
'["Follicular thyroid carcinoma", "Medullary thyroid carcinoma", "Papillary thyroid carcinoma", "Anaplastic thyroid carcinoma"]'::jsonb, 
2, 
'Papillary thyroid carcinoma is the most common pediatric thyroid malignancy. It often presents as an asymptomatic thyroid nodule, sometimes with cervical lymphadenopathy. The histological hallmarks are diagnostic: cells with empty-appearing, optically clear nuclei ("Orphan Annie eyes"), nuclear grooves, and psammoma bodies (concentric, laminated calcifications). It typically has an excellent prognosis.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A child treated for acute lymphoblastic leukemia with prophylactic cranial radiation 10 years ago now presents with headaches and a new-onset seizure. MRI reveals a well-circumscribed, extra-axial mass attached to the dura mater. What is the most likely diagnosis of this secondary malignancy?', 
'["Glioblastoma Multiforme", "Meningioma", "Schwannoma", "Metastatic leukemia"]'::jsonb, 
1, 
'Survivors of childhood cancer treated with cranial radiation have a significantly increased risk of developing secondary central nervous system tumors later in life. Meningiomas are common radiation-induced secondary tumors. They are classically benign, slow-growing, extra-axial tumors (outside the brain parenchyma) arising from the arachnoid cap cells and attached to the dura (often showing a "dural tail" on MRI).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 6-year-old girl is brought to the ER with fever, jaw pain, and swelling. A complete blood count reveals a WBC count of 150,000/mm³ with 85% blasts. While waiting for admission, she becomes confused and develops left-sided weakness. What is the most likely cause of her acute neurological deterioration?', 
'["Tumor lysis syndrome causing severe hypocalcemia", "Leukostasis resulting in cerebral hypoperfusion/infarction", "Meningitis secondary to neutropenia", "Hyperuricemia causing uric acid nephropathy"]'::jsonb, 
1, 
'This patient has hyperleukocytosis (WBC > 100,000/mm³), which significantly increases blood viscosity. This can lead to leukostasis, a life-threatening oncologic emergency where leukemic blasts plug the microvasculature, causing tissue hypoxia and infarction. The brain (confusion, stroke-like symptoms, coma) and lungs (hypoxia, respiratory distress) are the most commonly affected organs. Management involves aggressive hydration, cytoreduction (hydroxyurea or leukapheresis), and definitive chemotherapy.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 2-year-old male presents with a painless mass in his right abdomen. His mother notes that his right eye appears a different color than his left eye. Physical examination reveals right-sided aniridia (absence of the iris). He is at high risk for which of the following tumors?', 
'["Neuroblastoma", "Wilms Tumor", "Hepatoblastoma", "Pheochromocytoma"]'::jsonb, 
1, 
'This child likely has WAGR syndrome, characterized by Wilms tumor, Aniridia, Genitourinary anomalies, and mental Retardation. It is caused by a contiguous deletion on chromosome 11p13 involving the WT1 and PAX6 genes. Any child presenting with sporadic aniridia must be screened regularly with renal ultrasounds for the development of Wilms tumor.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 16-year-old male with a history of treated Hodgkin lymphoma presents to the clinic for a routine follow-up. He received mantle-field radiation therapy to his chest at age 10. Based on his treatment history, he requires rigorous lifelong screening for which of the following late effects?', 
'["Testicular cancer", "Breast cancer and Hypothyroidism", "Hepatocellular carcinoma", "Renal cell carcinoma"]'::jsonb, 
1, 
'Mantle-field radiation (which includes the neck, chest, and axilla) was historically used for Hodgkin lymphoma. Survivors have a profoundly increased risk of developing secondary solid tumors within the radiation field. Females are at very high risk for secondary breast cancer (screening with mammography/MRI starts early, usually age 25 or 8 years post-therapy). Both sexes are at high risk for thyroid disease (hypothyroidism, thyroid nodules, and thyroid cancer) due to radiation exposure to the neck.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A pediatric patient with Acute Lymphoblastic Leukemia is undergoing consolidation therapy that includes high-dose Methotrexate. Which of the following agents must be administered specifically to rescue normal host cells from the lethal toxicity of this drug?', 
'["Mesna", "Dexrazoxane", "Leucovorin (Folinic acid)", "Filgrastim (G-CSF)"]'::jsonb, 
2, 
'Methotrexate is a potent inhibitor of dihydrofolate reductase (DHFR), starving cells of tetrahydrofolate, which is essential for DNA synthesis. High-dose methotrexate can cause severe, fatal myelosuppression and mucositis. Leucovorin (folinic acid) is an active, reduced form of folate that does not require DHFR to be utilized. Administering leucovorin "rescues" normal cells from methotrexate toxicity by bypassing the enzymatic blockade.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old boy presents with a rapidly enlarging, painless, firm mass in his right cheek and jaw. A biopsy reveals a small round blue cell tumor. Immunohistochemistry is strongly positive for Desmin and Myogenin. What is the most likely diagnosis?', 
'["Ewing Sarcoma", "Rhabdomyosarcoma", "Neuroblastoma", "Burkitt Lymphoma"]'::jsonb, 
1, 
'Rhabdomyosarcoma is the most common soft tissue sarcoma in children. It arises from primitive skeletal muscle cells (rhabdomyoblasts). It frequently occurs in the head and neck region (e.g., orbit, nasopharynx, jaw) or the genitourinary tract. The histological diagnosis of skeletal muscle origin is confirmed by positive staining for muscle-specific markers such as Desmin, Myogenin, and MyoD1.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-month-old infant presents with a progressively enlarging abdomen. Ultrasound shows a large, solid mass in the right lobe of the liver. Serum Alpha-fetoprotein (AFP) is markedly elevated (over 100,000 ng/mL). What is the most likely primary diagnosis?', 
'["Hepatocellular carcinoma", "Hepatoblastoma", "Metastatic neuroblastoma", "Hepatic hemangioma"]'::jsonb, 
1, 
'Hepatoblastoma is the most common primary liver tumor in children, almost exclusively occurring in infants and children under 3 years of age. It presents as an asymptomatic abdominal mass. A massive elevation in serum Alpha-fetoprotein (AFP) is the classic laboratory hallmark and is used to monitor response to therapy. Hepatocellular carcinoma is rare in young children unless they have underlying liver disease (e.g., Hepatitis B, tyrosinemia).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old girl is undergoing treatment for Osteosarcoma with a regimen including Cisplatin. Which of the following is the most significant, irreversible dose-limiting toxicity associated with this chemotherapeutic agent?', 
'["Dilated cardiomyopathy", "Hemorrhagic cystitis", "Sensorineural hearing loss", "Pulmonary fibrosis"]'::jsonb, 
2, 
'Cisplatin is a platinum-based alkylating-like agent heavily used in pediatric solid tumors (osteosarcoma, neuroblastoma, germ cell tumors). Its major, often irreversible, dose-limiting toxicities are nephrotoxicity and ototoxicity (high-frequency sensorineural hearing loss). Audiograms are routinely performed before and during therapy to monitor for hearing damage. Amifostine is sometimes used to protect the kidneys.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 7-year-old patient with leukemia develops a severe, systemic varicella-zoster (chickenpox) infection. The patient is profoundly immunosuppressed. Which antiviral medication is the most appropriate treatment to initiate immediately?', 
'["Acyclovir", "Oseltamivir", "Ribavirin", "Foscarnet"]'::jsonb, 
0, 
'Immunocompromised children (such as those receiving chemotherapy for leukemia) are at high risk for severe, disseminated, and potentially fatal varicella-zoster virus (VZV) infections (including varicella pneumonia or encephalitis). Prompt administration of intravenous Acyclovir is the standard of care to inhibit viral DNA polymerase and halt viral replication.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 9-year-old boy with sickle cell disease presents with fever, bone pain, and swelling over his right tibia. Blood cultures are drawn, and MRI is consistent with osteomyelitis. While Staphylococcus aureus is the most common overall cause of osteomyelitis, this patient has an increased risk for osteomyelitis caused by which specific organism?', 
'["Pseudomonas aeruginosa", "Salmonella species", "Escherichia coli", "Streptococcus pneumoniae"]'::jsonb, 
1, 
'Patients with sickle cell disease suffer from functional asplenia due to repeated splenic infarctions. While Staphylococcus aureus remains the most common cause of osteomyelitis in all children, patients with sickle cell disease have a unique and significantly increased susceptibility to osteomyelitis caused by Salmonella species (encapsulated Gram-negative bacilli). Empiric antibiotic therapy in these patients must cover both organisms.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 3-year-old girl is diagnosed with a vaginal mass resembling a "bunch of grapes" protruding from the introitus. Biopsy confirms it is a sarcoma. This specific presentation is classic for which subtype of soft tissue sarcoma?', 
'["Alveolar rhabdomyosarcoma", "Embryonal rhabdomyosarcoma (sarcoma botryoides)", "Synovial sarcoma", "Clear cell sarcoma"]'::jsonb, 
1, 
'Sarcoma botryoides is a specific morphologic variant of embryonal rhabdomyosarcoma that arises beneath the mucosal surfaces of hollow organs. It most classically presents in the vagina of young girls as a polypoid, grape-like ("botryoid") mass protruding from the introitus. It can also occur in the bladder or biliary tract.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'During the diagnostic workup for a pediatric brain tumor, lumbar puncture is often performed to check for cerebrospinal fluid (CSF) dissemination of the tumor cells. In which of the following scenarios is a lumbar puncture strictly contraindicated?', 
'["The patient has a known allergy to local anesthetics", "MRI demonstrates a large posterior fossa mass causing severe obstructive hydrocephalus and midline shift", "The patient has a mild, non-blanching petechial rash", "The patient has a history of febrile seizures"]'::jsonb, 
1, 
'A lumbar puncture is absolutely contraindicated in the presence of significantly increased intracranial pressure (ICP) due to a mass lesion (e.g., a large posterior fossa tumor causing obstructive hydrocephalus and midline shift). Performing an LP in this setting removes CSF from the spinal column, creating a pressure gradient that can precipitate lethal downward brain herniation (uncal or cerebellar tonsillar herniation) through the foramen magnum.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A pediatric patient with High-Risk Neuroblastoma undergoes an autologous hematopoietic stem cell transplant. What is the primary purpose of this procedure in the treatment algorithm for solid tumors?', 
'["To provide a graft-versus-tumor immune effect to destroy residual cancer cells", "To replace genetically defective bone marrow with healthy cells", "To rescue the patient''s bone marrow after administration of myeloablative, ultra-high-dose chemotherapy", "To stimulate the rapid production of tumor-specific antibodies"]'::jsonb, 
2, 
'In solid tumors like high-risk neuroblastoma, an autologous stem cell transplant uses the patient''s own previously collected stem cells. It does not provide a graft-versus-tumor effect (which relies on donor T cells in allogeneic transplants). Instead, it serves as a "rescue." It allows the oncologist to deliver lethal, myeloablative doses of chemotherapy to eradicate resistant tumor cells. Without the autologous stem cell infusion to repopulate the marrow, the patient would die from permanent bone marrow failure.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 12-year-old boy presents with a solid, painless mass on the right side of his neck. Biopsy confirms Hodgkin Lymphoma, nodular sclerosing subtype. Staging imaging shows involvement of cervical and supraclavicular lymph nodes on the right side only, with no involvement below the diaphragm. What is his Ann Arbor stage?', 
'["Stage I", "Stage II", "Stage III", "Stage IV"]'::jsonb, 
1, 
'The Ann Arbor staging system is used for Hodgkin Lymphoma. Stage I involves a single lymph node region. Stage II involves two or more lymph node regions on the *same side* of the diaphragm (e.g., right cervical and right supraclavicular). Stage III involves lymph node regions on *both sides* of the diaphragm. Stage IV involves widespread, disseminated extralymphatic disease (e.g., liver, bone marrow involvement).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 4-year-old boy treated with cranial radiation and chemotherapy for a medulloblastoma presents 3 years later. His parents are concerned because he is the shortest child in his class and has stopped outgrowing his clothes. Which endocrine deficiency is the most common late effect of cranial radiation?', 
'["Hypothyroidism", "Growth hormone deficiency", "Central diabetes insipidus", "Adrenal insufficiency"]'::jsonb, 
1, 
'The hypothalamic-pituitary axis is highly sensitive to radiation damage. Growth hormone (GH) deficiency is the most common and earliest endocrine abnormality seen in survivors of childhood brain tumors treated with cranial radiation. It presents with growth deceleration and short stature. Thyroid-stimulating hormone (TSH), gonadotropins (FSH/LH), and ACTH deficiencies can occur at higher radiation doses.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A child with a brain tumor experiences severe, early morning headaches accompanied by projectile vomiting without nausea. These symptoms are a classic manifestation of which physiological derangement?', 
'["Increased intracranial pressure (ICP)", "Meningeal irritation", "Vestibular dysfunction", "Cerebral hypoperfusion"]'::jsonb, 
0, 
'Early morning headaches and projectile vomiting are hallmark signs of increased intracranial pressure (ICP). During sleep in a supine position, venous drainage from the head decreases, and partial pressure of CO2 rises (causing cerebral vasodilation). In a child with a brain tumor, the cranium cannot accommodate this slight increase in volume, leading to a spike in ICP that manifests upon waking.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 15-year-old female presents with fatigue and a large mediastinal mass. A biopsy confirms Hodgkin lymphoma. Which virus is strongly associated with the pathogenesis of certain subtypes of Hodgkin Lymphoma, often found within the Reed-Sternberg cells?', 
'["Cytomegalovirus (CMV)", "Human Herpesvirus 6 (HHV-6)", "Epstein-Barr Virus (EBV)", "Human Papillomavirus (HPV)"]'::jsonb, 
2, 
'Epstein-Barr Virus (EBV) is strongly associated with the pathogenesis of classical Hodgkin Lymphoma (particularly the mixed cellularity and lymphocyte-depleted subtypes) as well as endemic Burkitt Lymphoma. The viral genome can frequently be detected within the malignant Reed-Sternberg cells, where viral proteins (like LMP1) drive cell survival and proliferation.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 2-year-old girl is diagnosed with a primitive neuroectodermal tumor (PNET). The pathology report describes the presence of "Homer-Wright rosettes." This histological feature consists of tumor cells arranged radially around a central core containing what substance?', 
'["A central blood vessel", "A central core of neuropil (fibrillary neuroglial processes)", "A calcified psammoma body", "A central area of necrosis"]'::jsonb, 
1, 
'Homer-Wright rosettes are a classic histological finding in embryonal tumors of neuroectodermal origin, particularly Neuroblastoma and Medulloblastoma (a type of PNET). They consist of a halo of tumor cells surrounding a central core filled with pink, fibrillary neuropil (tangled neurites and glial processes). In contrast, perivascular pseudorosettes (seen in ependymomas) are arranged around a central blood vessel.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A patient is receiving Cyclophosphamide. To prevent a known, severe toxicity of this drug, the patient is advised to aggressively hydrate. What is the specific toxicity being prevented?', 
'["Pulmonary fibrosis", "Hemorrhagic cystitis", "Cardiomyopathy", "Peripheral neuropathy"]'::jsonb, 
1, 
'Cyclophosphamide is an alkylating agent metabolized into acrolein. Acrolein accumulates in the bladder and is extremely toxic to the urothelium, causing hemorrhagic cystitis. Aggressive hydration (to dilute the urine) and the administration of Mesna (which binds and neutralizes acrolein) are standard preventative measures.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old boy presents with pallor, fever, and bone pain. Blood smear shows 40% lymphoblasts. A bone marrow biopsy confirms Acute Lymphoblastic Leukemia. To determine if the patient has "High-Risk" vs "Standard-Risk" B-ALL, which two initial clinical parameters are most critical?', 
'["Age and Initial WBC count", "Gender and Initial platelet count", "Presence of hepatomegaly and CNS involvement", "LDH level and degree of anemia"]'::jsonb, 
0, 
'In pediatric B-cell ALL, the two most important initial clinical parameters for risk stratification (NCI criteria) are Age and Initial White Blood Cell (WBC) count. Standard risk is defined as age between 1 and 9.99 years AND an initial WBC count < 50,000/mm³. High risk includes age < 1 year or ≥ 10 years, OR an initial WBC count ≥ 50,000/mm³. High-risk patients require more intensive chemotherapy regimens.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which of the following chemotherapeutic agents, commonly used in pediatric oncology, acts specifically during the S-phase of the cell cycle by inhibiting dihydrofolate reductase?', 
'["Vincristine", "Cyclophosphamide", "Methotrexate", "Doxorubicin"]'::jsonb, 
2, 
'Methotrexate is a structural analog of folic acid. It acts as an antimetabolite by competitively inhibiting dihydrofolate reductase (DHFR). This prevents the regeneration of tetrahydrofolate, blocking the synthesis of thymidine and purines, thereby halting DNA synthesis. Because it targets DNA synthesis, it is cell-cycle specific, acting primarily during the S-phase.')

;
