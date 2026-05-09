-- Batch 1: 30 Pediatric Oncology MCQs (Topic: Leukemias - ALL & AML)
-- Note: Replace 'YOUR_TOPIC_ID_HERE' with the actual topic_id for Pediatric Oncology Essentials

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

('YOUR_TOPIC_ID_HERE', 
'A 4-year-old boy presents with pallor, fatigue, and bone pain for the past 2 weeks. Physical examination reveals petechiae on his legs and hepatosplenomegaly. A complete blood count shows anemia, thrombocytopenia, and leukocytosis with circulating blasts. A bone marrow biopsy reveals >25% lymphoblasts that are TdT positive and PAS positive. What is the most likely diagnosis?', 
'["Acute Myeloid Leukemia (AML)", "Acute Lymphoblastic Leukemia (ALL)", "Juvenile Myelomonocytic Leukemia (JMML)", "Burkitt Lymphoma"]'::jsonb, 
1, 
'Acute Lymphoblastic Leukemia (ALL) is the most common childhood malignancy, peaking between ages 2 and 5. Classic presentation includes bone marrow failure (anemia, thrombocytopenia causing petechiae) and bone pain due to marrow expansion. Lymphoblasts in B-ALL (the most common type) are typically positive for Terminal deoxynucleotidyl transferase (TdT), PAS (Periodic Acid-Schiff), and CD10 (CALLA).'),

('YOUR_TOPIC_ID_HERE', 
'A 5-year-old girl with recently diagnosed B-cell Acute Lymphoblastic Leukemia (ALL) begins induction chemotherapy. Which of the following cytogenetic abnormalities is associated with a favorable prognosis in this patient?', 
'["t(9;22) (Philadelphia chromosome)", "t(4;11)", "Hyperdiploidy (>50 chromosomes)", "Hypodiploidy (<44 chromosomes)"]'::jsonb, 
2, 
'In pediatric B-ALL, cytogenetics play a massive role in risk stratification. Favorable prognostic factors include hyperdiploidy (having more than 50 chromosomes) and the t(12;21) translocation (ETV6-RUNX1 fusion). Poor prognostic factors include hypodiploidy, t(9;22) (Philadelphia chromosome, though prognosis has improved with TKIs), t(4;11) (MLL rearrangement, common in infants), and age <1 or >10 years.'),

('YOUR_TOPIC_ID_HERE', 
'A 14-year-old boy presents with respiratory distress, cough, and facial swelling. A chest X-ray reveals a large anterior mediastinal mass causing tracheal deviation. Peripheral blood smear shows circulating blasts that are CD3+, CD4+, and CD8+. Which of the following is the most likely diagnosis?', 
'["B-cell Acute Lymphoblastic Leukemia (B-ALL)", "T-cell Acute Lymphoblastic Leukemia (T-ALL)", "Hodgkin Lymphoma", "Neuroblastoma"]'::jsonb, 
1, 
'T-cell ALL often presents in adolescent males as a large anterior mediastinal mass, which can cause superior vena cava (SVC) syndrome, tracheal compression, and respiratory distress. The blasts are of T-cell lineage and express T-cell markers such as CD2, CD3, CD4, CD5, CD7, and CD8. Unlike B-ALL, T-ALL is less likely to present with isolated cytopenias and more likely to present with a rapidly growing mass.'),

('YOUR_TOPIC_ID_HERE', 
'A 2-year-old boy with Down syndrome presents with fever, lethargy, and bleeding gums. Blood tests show pancytopenia and circulating blasts. Bone marrow aspirate reveals blasts with prominent cytoplasmic granules and Auer rods. They are MPO (myeloperoxidase) positive. What is the most likely diagnosis?', 
'["Acute Lymphoblastic Leukemia (ALL)", "Acute Promyelocytic Leukemia (APL)", "Acute Megakaryoblastic Leukemia (AMKL)", "Acute Myeloid Leukemia (AML)"]'::jsonb, 
3, 
'This patient has Acute Myeloid Leukemia (AML). The presence of Auer rods (needle-like cytoplasmic inclusions) and MPO positivity strongly distinguish myeloblasts from lymphoblasts. While children with Down syndrome have a dramatically increased risk of Acute Megakaryoblastic Leukemia (AMKL) before age 5, AMKL blasts are typically MPO negative and lack Auer rods. Since these are MPO positive with Auer rods, this is a standard AML presentation.'),

('YOUR_TOPIC_ID_HERE', 
'A 7-year-old boy with Acute Lymphoblastic Leukemia (ALL) is receiving maintenance chemotherapy. He presents with a 2-day history of right testicular swelling and pain. Ultrasound confirms a solid mass in the right testicle. What does this finding most likely represent?', 
'["Primary testicular germ cell tumor", "Extramedullary relapse of ALL", "Testicular torsion", "Epididymitis"]'::jsonb, 
1, 
'The testes and the central nervous system (CNS) are classic "sanctuary sites" for leukemic cells in ALL because systemic chemotherapy often does not penetrate these areas effectively (due to the blood-brain and blood-testis barriers). A painless or painful testicular enlargement in a boy being treated for ALL strongly suggests extramedullary relapse.'),

('YOUR_TOPIC_ID_HERE', 
'During induction chemotherapy for Acute Myeloid Leukemia (AML), a patient rapidly develops elevated serum potassium, elevated uric acid, elevated phosphorus, and decreased calcium. Which of the following interventions is the most appropriate initial prophylactic step prior to starting chemotherapy to prevent the severe complications of this condition?', 
'["Administration of calcium gluconate", "Aggressive IV hydration and Allopurinol", "Administration of Kayexalate", "Initiation of hemodialysis"]'::jsonb, 
1, 
'This patient is experiencing Tumor Lysis Syndrome (TLS), a life-threatening oncologic emergency caused by the massive breakdown of tumor cells and release of intracellular contents. Prevention is paramount and includes aggressive IV hyperhydration (to flush the kidneys) and allopurinol (a xanthine oxidase inhibitor to decrease uric acid production). Rasburicase (recombinant urate oxidase) may be used for high-risk patients to degrade existing uric acid.'),

('YOUR_TOPIC_ID_HERE', 
'A 12-year-old girl is diagnosed with Acute Promyelocytic Leukemia (APL), characterized by the t(15;17) translocation. She suddenly develops diffuse petechiae, oozing from her IV site, and gross hematuria. Laboratory tests show prolonged PT/PTT, low fibrinogen, and elevated D-dimer. Which specific therapy is crucial for inducing differentiation of the blasts and resolving this bleeding diathesis?', 
'["Imatinib", "All-trans retinoic acid (ATRA)", "Rituximab", "Methotrexate"]'::jsonb, 
1, 
'APL (AML subtype M3) is driven by the t(15;17) translocation, creating the PML-RARA fusion protein, which blocks myeloid differentiation. APL is uniquely associated with a high risk of life-threatening Disseminated Intravascular Coagulation (DIC) due to the release of procoagulant granules from the promyelocytes. All-trans retinoic acid (ATRA) forces the malignant promyelocytes to mature, clearing the blasts and rapidly resolving the DIC.'),

('YOUR_TOPIC_ID_HERE', 
'A 3-year-old girl is undergoing workup for suspected leukemia. A bone marrow aspirate shows complete replacement by blasts. Flow cytometry of the blasts demonstrates positivity for CD10, CD19, and CD22, and negativity for surface immunoglobulin. What is the diagnosis?', 
'["T-cell ALL", "Pre-B-cell ALL", "Mature B-cell ALL (Burkitt type)", "Acute Myeloid Leukemia"]'::jsonb, 
1, 
'This flow cytometry profile is classic for Precursor B-cell (Pre-B) ALL. The blasts express B-cell lineage markers like CD19 and CD22, and they typically express CD10 (CALLA - Common Acute Lymphoblastic Leukemia Antigen). Because they are precursors, they have not yet developed mature surface immunoglobulins (which would be characteristic of mature B-cell ALL / Burkitt leukemia). T-ALL would express CD3, CD7. AML would express CD13, CD33.'),

('YOUR_TOPIC_ID_HERE', 
'A child with ALL develops a fever of 39.5°C (103.1°F). His Absolute Neutrophil Count (ANC) is 200/mm³. He appears well and has no localizing signs of infection. What is the most appropriate immediate management?', 
'["Discharge home with oral amoxicillin", "Admit, obtain blood and urine cultures, and start broad-spectrum intravenous antibiotics", "Administer G-CSF (Filgrastim) and observe in the clinic", "Wait for culture results before starting antibiotics"]'::jsonb, 
1, 
'This patient has neutropenic fever (temperature ≥ 38.3°C or sustained ≥ 38.0°C for 1 hr, with an ANC < 500/mm³). This is an oncologic emergency because neutropenic patients lack the ability to mount an inflammatory response, and infections can rapidly progress to overwhelming sepsis and death. The standard of care is immediate admission, obtaining cultures, and prompt initiation of empiric broad-spectrum IV antibiotics (e.g., Cefepime) covering Pseudomonas.'),

('YOUR_TOPIC_ID_HERE', 
'A 10-year-old girl with a history of leukemia receives a hematopoietic stem cell transplant. Three weeks later, she develops a maculopapular rash on her palms, jaundice with elevated direct bilirubin, and severe watery diarrhea. These symptoms are caused by the activation of which of the following?', 
'["Donor T lymphocytes against recipient HLA antigens", "Recipient T lymphocytes against donor HLA antigens", "Cytomegalovirus (CMV) reactivation", "Epstein-Barr virus (EBV) driven lymphoproliferation"]'::jsonb, 
0, 
'This is acute Graft-Versus-Host Disease (GVHD), which occurs when immunocompetent donor T cells (within the stem cell graft) recognize the recipient''s tissue antigens as foreign and initiate an immune attack. The classic triad of acute GVHD involves the skin (maculopapular rash often starting on palms/soles), liver (cholestatic jaundice), and gastrointestinal tract (profuse diarrhea).'),

('YOUR_TOPIC_ID_HERE', 
'A 4-year-old boy presents with severe bone pain, limp, and refusal to walk. X-rays of the lower extremities show radiolucent metaphyseal bands. CBC reveals anemia and thrombocytopenia. What is the most likely underlying cause of his bone pain?', 
'["Osteosarcoma", "Osteomyelitis", "Expansion of the marrow cavity by leukemic blasts", "Ewing Sarcoma"]'::jsonb, 
2, 
'Bone pain and limp are frequent, sometimes presenting, symptoms of Acute Lymphoblastic Leukemia (ALL) in children. The pain is caused by the massive proliferation and expansion of leukemic blasts within the inextensible bone marrow cavity, increasing intramedullary pressure. Plain radiographs may show periosteal elevation, osteopenia, or characteristic radiolucent metaphyseal bands (leukemic lines) caused by abnormal bone growth and marrow expansion.'),

('YOUR_TOPIC_ID_HERE', 
'Which central nervous system (CNS) prophylaxis strategy is a standard component of almost all pediatric Acute Lymphoblastic Leukemia (ALL) treatment protocols to prevent CNS relapse?', 
'["Whole brain radiation therapy", "Intrathecal chemotherapy (e.g., Methotrexate)", "High-dose intravenous Cytarabine", "Oral dexamethasone alone"]'::jsonb, 
1, 
'Because the CNS is a sanctuary site that systemic chemotherapy penetrates poorly, prophylactic treatment of the CNS is mandatory in ALL to prevent relapse. Intrathecal (IT) chemotherapy, most commonly with Methotrexate (sometimes with cytarabine and hydrocortisone, known as "triple IT therapy"), is the standard of care. Cranial radiation is now largely avoided in prophylactic settings due to severe long-term neurocognitive and endocrine sequelae in young children.'),

('YOUR_TOPIC_ID_HERE', 
'A 1-year-old infant with Down syndrome presents with pallor and hepatosplenomegaly. Blood smear shows large, pleomorphic blasts with cytoplasmic blebs. Flow cytometry shows the blasts are positive for CD41 and CD61. Which type of leukemia does this infant most likely have?', 
'["Acute Lymphoblastic Leukemia (ALL)", "Acute Promyelocytic Leukemia (APL)", "Acute Megakaryoblastic Leukemia (AMKL)", "Juvenile Myelomonocytic Leukemia (JMML)"]'::jsonb, 
2, 
'Children with Down syndrome (Trisomy 21) have a unique 500-fold increased risk of developing Acute Megakaryoblastic Leukemia (AMKL), a rare subtype of AML (M7), usually before the age of 4. The blasts are derived from the megakaryocyte lineage, which is confirmed by flow cytometry positivity for platelet glycoproteins CD41 and CD61. Despite being AML, AMKL in Down syndrome patients typically has a highly favorable prognosis with standard chemotherapy.'),

('YOUR_TOPIC_ID_HERE', 
'A 16-year-old male with Acute Myeloid Leukemia (AML) requires prolonged prophylactic treatment against invasive fungal infections. He is placed on posaconazole. What is the primary mechanism of action of this antifungal drug?', 
'["Inhibition of squalene epoxidase", "Inhibition of ergosterol synthesis via 14-alpha-demethylase", "Binding to ergosterol to form pores in the fungal membrane", "Inhibition of beta-(1,3)-D-glucan synthase"]'::jsonb, 
1, 
'Posaconazole is an azole antifungal. All azoles (fluconazole, voriconazole, posaconazole) work by inhibiting the fungal cytochrome P450 enzyme 14-alpha-demethylase (lanosterol 14-alpha-demethylase). This enzyme is required to convert lanosterol to ergosterol, a vital component of the fungal cell membrane. Depletion of ergosterol alters membrane fluidity and leads to fungal cell death. Echinocandins (caspofungin) inhibit beta-glucan synthase.'),

('YOUR_TOPIC_ID_HERE', 
'A patient receiving intensive multi-agent chemotherapy for leukemia develops hemorrhagic cystitis. Which specific chemotherapy agent is most notorious for causing this complication, and what is the appropriate prophylactic agent?', 
'["Vincristine; Leucovorin", "Methotrexate; Mesna", "Cyclophosphamide; Mesna", "Doxorubicin; Dexrazoxane"]'::jsonb, 
2, 
'Cyclophosphamide and Ifosfamide are alkylating agents that are metabolized in the liver to form acrolein. Acrolein is a toxic metabolite that is excreted in the urine and causes severe chemical irritation of the bladder mucosa, resulting in hemorrhagic cystitis. Mesna (2-mercaptoethane sulfonate sodium) is administered prophylactically; it binds to and detoxifies acrolein in the bladder, preventing this complication. Aggressive IV hydration is also required.'),

('YOUR_TOPIC_ID_HERE', 
'A 6-year-old with ALL is treated with induction chemotherapy, including Vincristine. One month later, he presents with foot drop, difficulty walking, and absent deep tendon reflexes in the lower extremities. This toxicity is mediated by Vincristine''s effect on which cellular structure?', 
'["DNA topoisomerase II", "Ribosomes", "Microtubules", "Mitochondrial electron transport chain"]'::jsonb, 
2, 
'Vincristine is a vinca alkaloid that acts by binding to tubulin, inhibiting the polymerization of microtubules. This arrests the cell cycle in metaphase (M phase). Because microtubules are also essential for axonal transport in neurons, the primary dose-limiting toxicity of vincristine is severe peripheral neuropathy (presenting as areflexia, peripheral paresthesias, foot drop, and autonomic neuropathy like constipation).'),

('YOUR_TOPIC_ID_HERE', 
'A patient undergoing treatment for leukemia is found to have a severe deficiency in the enzyme Thiopurine Methyltransferase (TPMT). This patient is at high risk for life-threatening myelosuppression if treated with which of the following medications?', 
'["Cytarabine", "6-Mercaptopurine (6-MP)", "Methotrexate", "L-Asparaginase"]'::jsonb, 
1, 
'6-Mercaptopurine (6-MP) is a purine analog widely used in the maintenance phase of ALL therapy. It is metabolized and inactivated primarily by the enzyme Thiopurine Methyltransferase (TPMT). Patients with a genetic deficiency or mutation in TPMT cannot efficiently inactivate the drug. If given a standard dose, toxic active metabolites rapidly accumulate, leading to severe, potentially fatal hematopoietic toxicity (myelosuppression). Pharmacogenomic testing for TPMT is standard before starting 6-MP.'),

('YOUR_TOPIC_ID_HERE', 
'A 9-year-old boy presents with painless cervical lymphadenopathy, fever, night sweats, and unintentional weight loss. Lymph node biopsy reveals large, multinucleated cells with prominent nucleoli resembling "owl eyes" surrounded by an inflammatory infiltrate of eosinophils, macrophages, and lymphocytes. These malignant cells are positive for CD15 and CD30. What is the diagnosis?', 
'["Burkitt Lymphoma", "Diffuse Large B-Cell Lymphoma", "Hodgkin Lymphoma", "Anaplastic Large Cell Lymphoma"]'::jsonb, 
2, 
'This is the classic presentation of Hodgkin Lymphoma. The "B symptoms" include fever, night sweats, and weight loss. The pathognomonic finding on biopsy is the Reed-Sternberg cell, described as a large, often binucleated cell with prominent eosinophilic nucleoli resembling "owl eyes." In classical Hodgkin Lymphoma, these cells are characteristically positive for the surface markers CD15 and CD30, and negative for CD45 and CD20.'),

('YOUR_TOPIC_ID_HERE', 
'A 5-year-old boy from central Africa presents with a rapidly growing mass involving his jaw. Biopsy shows sheets of medium-sized lymphoid cells with numerous tangible-body macrophages giving a "starry sky" appearance. Which genetic translocation is most characteristic of this malignancy?', 
'["t(8;14)", "t(9;22)", "t(11;14)", "t(14;18)"]'::jsonb, 
0, 
'This describes endemic Burkitt Lymphoma, which frequently presents as a jaw or facial bone mass in African children and is heavily associated with Epstein-Barr Virus (EBV). The classic histological pattern is a "starry sky" (macrophages clearing apoptotic debris amidst rapidly dividing tumor cells). The defining genetic lesion is the t(8;14) translocation, which moves the c-myc oncogene on chromosome 8 next to the highly active immunoglobulin heavy chain promoter on chromosome 14, driving massive proliferation.'),

('YOUR_TOPIC_ID_HERE', 
'A child with T-cell ALL develops superior vena cava (SVC) syndrome due to a massive mediastinal mass. Before initiating emergent radiation or chemotherapy, the patient receives rasburicase. What is the precise mechanism of action of rasburicase?', 
'["It competitively inhibits xanthine oxidase to prevent uric acid formation", "It converts existing uric acid into allantoin, a highly soluble, easily excreted compound", "It binds to phosphate in the gut to prevent hyperphosphatemia", "It acts as a loop diuretic to force renal excretion of potassium"]'::jsonb, 
1, 
'Rasburicase is a recombinant urate oxidase enzyme. While allopurinol inhibits the formation of *new* uric acid, rasburicase actively breaks down *existing* uric acid by catalyzing its oxidation into allantoin. Allantoin is 5 to 10 times more water-soluble than uric acid and is easily excreted by the kidneys. This makes rasburicase a highly effective, rapid treatment for severe hyperuricemia in Tumor Lysis Syndrome.'),

('YOUR_TOPIC_ID_HERE', 
'Which of the following chemotherapy agents, commonly used in the treatment of ALL, works by depleting the blood of an amino acid essential for leukemic cell survival but non-essential for normal host cells?', 
'["Dexamethasone", "L-Asparaginase", "Daunorubicin", "Cytarabine"]'::jsonb, 
1, 
'L-Asparaginase is an enzyme that catalyzes the breakdown of the amino acid asparagine into aspartic acid and ammonia in the bloodstream. Normal host cells can synthesize their own asparagine using asparagine synthetase. However, leukemic lymphoblasts lack this enzyme and rely entirely on circulating asparagine from the blood. L-Asparaginase severely depletes this supply, starving the leukemic cells and causing their death. Notable side effects include pancreatitis and coagulopathy.'),

('YOUR_TOPIC_ID_HERE', 
'A 13-year-old girl with AML is treated with an anthracycline (Daunorubicin). Years later, she presents with shortness of breath, orthopnea, and lower extremity edema. Echocardiogram reveals a severely reduced ejection fraction. What is the mechanism of this late anthracycline toxicity?', 
'["Induction of pulmonary fibrosis", "Generation of free radicals causing dose-dependent, cumulative myocardial damage", "Direct immune-mediated destruction of cardiac valves", "Vasospasm of the coronary arteries"]'::jsonb, 
1, 
'Anthracyclines (like doxorubicin and daunorubicin) are notorious for causing dose-dependent, cumulative, and largely irreversible dilated cardiomyopathy. The mechanism is believed to involve the generation of reactive oxygen species (free radicals) that damage the myocardium, as cardiac tissue has relatively low levels of protective antioxidant enzymes (like catalase). Dexrazoxane, an iron chelator, can sometimes be used to prevent this toxicity.'),

('YOUR_TOPIC_ID_HERE', 
'A 6-year-old boy presents with abdominal distension. Imaging reveals a massive, unilateral abdominal mass that crosses the midline. Urinary catecholamines (HVA and VMA) are significantly elevated. A biopsy shows small round blue cells forming Homer-Wright rosettes. What is the diagnosis?', 
'["Wilms Tumor", "Neuroblastoma", "Hepatoblastoma", "Burkitt Lymphoma"]'::jsonb, 
1, 
'This is a classic presentation of Neuroblastoma, the most common extracranial solid tumor in children. It originates from neural crest cells (sympathetic nervous system), commonly arising in the adrenal medulla. It classically presents as a firm, irregular abdominal mass that crosses the midline (unlike Wilms tumor, which is usually smooth and unilateral). Secretion of catecholamines (detected as HVA/VMA in urine) is a hallmark. Histology shows Homer-Wright rosettes.'),

('YOUR_TOPIC_ID_HERE', 
'A 3-year-old healthy boy is brought to the pediatrician because his mother noticed his abdomen is swollen on one side while bathing him. Examination reveals a smooth, firm, unilateral flank mass that does not cross the midline. The child is normotensive and urinalysis shows microscopic hematuria. What is the most likely diagnosis?', 
'["Neuroblastoma", "Wilms Tumor (Nephroblastoma)", "Polycystic Kidney Disease", "Pheochromocytoma"]'::jsonb, 
1, 
'Wilms Tumor (Nephroblastoma) is the most common primary renal malignancy in children, typically presenting between 2 and 5 years of age. It presents most commonly as an asymptomatic, smooth, firm abdominal mass discovered incidentally. Crucially, it typically does not cross the midline (unlike neuroblastoma). It may be associated with microscopic hematuria or hypertension (due to renin secretion).'),

('YOUR_TOPIC_ID_HERE', 
'Which of the following genetic syndromes is associated with a significantly increased risk of developing Wilms tumor, along with aniridia, genitourinary anomalies, and intellectual disability?', 
'["WAGR syndrome", "Beckwith-Wiedemann syndrome", "Li-Fraumeni syndrome", "Neurofibromatosis type 1"]'::jsonb, 
0, 
'WAGR syndrome is caused by a contiguous gene deletion on chromosome 11p13, which removes both the WT1 gene (causing Wilms tumor and genitourinary anomalies) and the PAX6 gene (causing aniridia - absence of the iris). The acronym stands for Wilms tumor, Aniridia, Genitourinary anomalies, and mental Retardation (intellectual disability). Beckwith-Wiedemann also predisposes to Wilms tumor but presents with macroglossia, macrosomia, and omphalocele.'),

('YOUR_TOPIC_ID_HERE', 
'A 12-year-old boy presents with increasing pain and swelling around his right knee over the last 2 months. X-ray of the distal femur shows a sunburst pattern of bone formation and elevation of the periosteum (Codman triangle). Biopsy confirms malignant spindle cells producing osteoid matrix. What is the diagnosis?', 
'["Ewing Sarcoma", "Osteosarcoma", "Osteochondroma", "Chondrosarcoma"]'::jsonb, 
1, 
'This is the classic presentation of Osteosarcoma, the most common primary malignant bone tumor in children and adolescents. It classically occurs in the metaphysis of long bones (most commonly around the knee: distal femur or proximal tibia). Radiographic hallmarks include the "sunburst" pattern (due to aggressive bone formation) and Codman triangle (periosteal elevation). Histology definitively shows malignant cells producing unmineralized bone (osteoid).'),

('YOUR_TOPIC_ID_HERE', 
'A 14-year-old boy presents with pain and swelling in his mid-thigh. X-ray of the femoral diaphysis shows a permeative, lytic destructive lesion with a layered, "onion-skin" periosteal reaction. Biopsy shows sheets of uniform small round blue cells. The cells possess a t(11;22) translocation. What is the diagnosis?', 
'["Osteosarcoma", "Ewing Sarcoma", "Osteoid Osteoma", "Giant Cell Tumor of Bone"]'::jsonb, 
1, 
'Ewing Sarcoma is an aggressive primary bone tumor that classically occurs in the diaphysis (shaft) of long bones (like the femur) or the pelvis. It is a "small round blue cell" tumor of neuroectodermal origin. The radiographic hallmark is an "onion-skin" periosteal reaction (multi-layered new bone formation). It is highly associated with the t(11;22) translocation, which creates the EWS-FLI1 fusion protein.'),

('YOUR_TOPIC_ID_HERE', 
'A 6-month-old infant is brought to the eye doctor because the parents notice a "white reflection" in the child''s left pupil in photographs, instead of the normal red reflex. This condition (leukocoria) is most highly suspicious for which pediatric malignancy?', 
'["Medulloblastoma", "Retinoblastoma", "Neuroblastoma", "Optic nerve glioma"]'::jsonb, 
1, 
'Leukocoria, or a white pupillary reflex, is the classic presenting sign of Retinoblastoma. It is a malignant tumor of the retina occurring in young children. It is caused by mutations in the RB1 tumor suppressor gene (located on chromosome 13q14). In the inherited form, patients have a germline mutation in one RB1 allele and suffer a somatic "second hit" in the other, leading to bilateral tumors and a high risk of future osteosarcomas.'),

('YOUR_TOPIC_ID_HERE', 
'A 7-year-old boy presents with morning vomiting, headaches that are worse upon waking, and a broad-based, unsteady gait (ataxia). An MRI of the brain reveals a solid mass in the cerebellar vermis causing obstructive hydrocephalus. What is the most likely diagnosis?', 
'["Medulloblastoma", "Craniopharyngioma", "Pilocytic Astrocytoma", "Ependymoma"]'::jsonb, 
0, 
'Medulloblastoma is the most common malignant pediatric brain tumor. It classically arises in the cerebellar vermis, causing truncal ataxia and gait disturbances. Because of its location in the posterior fossa, it frequently compresses the 4th ventricle, leading to non-communicating hydrocephalus and signs of increased intracranial pressure (morning headaches, vomiting). It is a highly aggressive "small round blue cell" tumor that can "drop metastasize" down the spinal cord.'),

('YOUR_TOPIC_ID_HERE', 
'A 5-year-old child is undergoing evaluation for a brain tumor. MRI shows a solid and cystic mass residing within the 4th ventricle. Biopsy reveals uniform cells forming perivascular pseudorosettes. What is the most likely diagnosis?', 
'["Medulloblastoma", "Ependymoma", "Pilocytic Astrocytoma", "Glioblastoma Multiforme"]'::jsonb, 
1, 
'Ependymomas arise from the ependymal cells lining the ventricles. In children, they most commonly occur in the posterior fossa, specifically growing *within* the 4th ventricle, where they can cause obstructive hydrocephalus. A classic histological hallmark of ependymoma is the presence of perivascular pseudorosettes (tumor cells arranged radially around a central blood vessel).')

;
