-- Batch 4: 30 Pediatric Oncology MCQs (Questions 91-120)
-- Note: Replace (SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1) with the actual topic_id for Pediatric Oncology Essentials

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old boy presents with pallor, bruising, and bone pain. A bone marrow biopsy confirms B-cell Acute Lymphoblastic Leukemia (B-ALL). The blast cells are tested for various surface markers. Which of the following markers is most consistently positive in B-ALL and is considered the classic "Common ALL Antigen"?', 
'["CD3", "CD10 (CALLA)", "CD33", "CD56"]'::jsonb, 
1, 
'CD10, also known as the Common Acute Lymphoblastic Leukemia Antigen (CALLA), is a cell surface metalloprotease. It is highly characteristic of early B-cell development and is expressed on the surface of blasts in the vast majority (>80%) of pediatric B-cell ALL cases. CD3 is a T-cell marker. CD33 is a myeloid marker (seen in AML). CD56 is an NK-cell marker.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 15-year-old female presents with a painless, enlarged lymph node in her neck. A biopsy reveals classical Hodgkin Lymphoma. Which of the following describes the typical pattern of spread for this disease?', 
'["Random, hematogenous spread to distant organs early in the disease", "Contiguous, predictable spread to adjacent lymph node chains", "Early, massive spread to the central nervous system", "Direct invasion into surrounding bone and muscle"]'::jsonb, 
1, 
'A key clinical feature of classical Hodgkin Lymphoma is its highly predictable, contiguous pattern of spread. It typically begins in a single lymph node or chain (usually cervical or mediastinal) and spreads systematically to the next immediately adjacent lymph node group via lymphatic channels. This predictable spread allows for highly targeted, localized radiation therapy in early-stage disease. Non-Hodgkin Lymphomas, conversely, often spread randomly and hematogenously.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 3-year-old girl is brought to the clinic because her mother noticed a white reflex in her right eye (leukocoria). She is diagnosed with Retinoblastoma. If her disease is caused by a sporadic, non-inherited mutation, what is the most likely clinical presentation compared to the inherited form?', 
'["Unilateral disease, older age of onset, no increased risk of secondary sarcomas", "Bilateral disease, younger age of onset, very high risk of secondary osteosarcoma", "Bilateral disease, older age of onset, high risk of leukemia", "Unilateral disease, younger age of onset, high risk of secondary sarcomas"]'::jsonb, 
0, 
'Retinoblastoma is caused by mutations in the RB1 tumor suppressor gene. In the sporadic (non-inherited) form, the child is born with two normal RB1 alleles and must acquire two separate somatic mutations ("two hits") in the exact same retinal cell. This is statistically rare, so it usually happens later in early childhood, results in a single (unilateral) tumor, and because the mutation is not in the germline, the child does not have an increased risk of developing other primary cancers (like osteosarcoma).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 7-year-old boy with a history of recurrent ear infections presents with a chronic, draining ear, a skin rash resembling seborrhea, and increased thirst/urination (polyuria). Skull X-rays show "punched-out" lytic bone lesions. A biopsy of a bone lesion will most likely show infiltration by cells positive for which marker?', 
'["CD1a", "CD3", "CD20", "Myeloperoxidase"]'::jsonb, 
0, 
'This patient has Langerhans Cell Histiocytosis (LCH), presenting with the classic triad of lytic skull lesions, diabetes insipidus (causing polyuria/polydipsia due to pituitary stalk infiltration), and a seborrheic rash. The disease is driven by the clonal proliferation of abnormal Langerhans cells (dendritic cells). These cells are characteristically positive for the surface marker CD1a and the intracellular marker S100. They also contain Birbeck granules on electron microscopy.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 12-year-old girl is receiving maintenance chemotherapy for ALL, which includes daily oral 6-mercaptopurine (6-MP). She develops a severe, systemic varicella infection and is admitted to the hospital. Which of the following describes the mechanism of action of 6-MP?', 
'["It inhibits dihydrofolate reductase", "It acts as a false purine base, inhibiting de novo purine synthesis and getting incorporated into DNA", "It cross-links DNA strands", "It inhibits the polymerization of microtubules"]'::jsonb, 
1, 
'6-Mercaptopurine (6-MP) is an antimetabolite and a purine analog. It is converted intracellularly into active thio-guanine nucleotides (TGNs). These TGNs act as "false purines" that block the enzymes required for de novo purine synthesis (like PRPP amidotransferase). Furthermore, they are falsely incorporated into DNA and RNA during the S-phase, halting replication and leading to apoptosis of the rapidly dividing leukemic cells.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 4-year-old boy presents with an abdominal mass that crosses the midline. He has periorbital ecchymoses and severe bone pain. His urine HVA/VMA levels are highly elevated. A bone marrow biopsy reveals sheets of small round blue cells. The primary tumor is most likely derived from which embryologic structure?', 
'["Metanephric mesenchyme", "Neural crest cells", "Endoderm of the foregut", "Paraxial mesoderm"]'::jsonb, 
1, 
'The diagnosis is Neuroblastoma. It typically presents as a firm abdominal mass crossing the midline, with metastases to bone (pain) and periorbital tissues ("raccoon eyes"). Neuroblastoma is an embryonal malignancy of the sympathetic nervous system. It originates from migrating neural crest cells, most commonly arising in the adrenal medulla or along the sympathetic chain ganglia.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 16-year-old boy with Osteosarcoma of the distal femur undergoes a limb-salvage surgical resection. Which area of the bone does Osteosarcoma classically arise from, where the growth plate is located and bone turnover is highest?', 
'["Epiphysis", "Metaphysis", "Diaphysis", "Articular cartilage"]'::jsonb, 
1, 
'Osteosarcoma typically arises in the metaphysis of long bones (most commonly the distal femur, proximal tibia, or proximal humerus). The metaphysis is the rapidly growing area of the bone adjacent to the epiphyseal growth plate, where osteoblastic activity and cellular turnover are at their highest during the adolescent growth spurt, providing a fertile ground for malignant transformation.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 2-year-old girl is diagnosed with a Wilms tumor. During the discussion of the treatment plan, the oncologist mentions that certain genetic syndromes increase the risk of this tumor. Which of the following syndromes is characterized by Wilms tumor, macroglossia, omphalocele, and hemihypertrophy?', 
'["WAGR syndrome", "Denys-Drash syndrome", "Beckwith-Wiedemann syndrome", "Li-Fraumeni syndrome"]'::jsonb, 
2, 
'Beckwith-Wiedemann syndrome (BWS) is an overgrowth disorder caused by epigenetic imprinting abnormalities on chromosome 11p15. Classic features include macroglossia (large tongue), macrosomia (large body size), hemihypertrophy (one side of the body is larger than the other), and abdominal wall defects (omphalocele or umbilical hernia). Children with BWS have a significantly increased risk of developing embryonal tumors, most notably Wilms tumor and Hepatoblastoma.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old male presents with a massive anterior mediastinal mass causing severe respiratory distress. A biopsy reveals T-cell Lymphoblastic Lymphoma. This tumor is essentially the solid tissue equivalent of which type of leukemia?', 
'["Acute Myeloid Leukemia (AML)", "T-cell Acute Lymphoblastic Leukemia (T-ALL)", "B-cell Acute Lymphoblastic Leukemia (B-ALL)", "Chronic Myeloid Leukemia (CML)"]'::jsonb, 
1, 
'T-cell Lymphoblastic Lymphoma and T-cell Acute Lymphoblastic Leukemia (T-ALL) are considered different points on the spectrum of the same underlying disease process (a malignancy of precursor T-lymphoblasts). The distinction is purely clinical: if the disease presents primarily as a solid mass (typically in the mediastinum) with less than 25% blasts in the bone marrow, it is classified as a Lymphoma. If there is extensive bone marrow involvement (>25% blasts), it is classified as Leukemia.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which of the following chemotherapy agents, commonly used to treat pediatric brain tumors, is highly lipid-soluble and can therefore easily cross the blood-brain barrier?', 
'["Vincristine", "Carmustine (BCNU) / Lomustine (CCNU)", "Doxorubicin", "Bleomycin"]'::jsonb, 
1, 
'Carmustine (BCNU) and Lomustine (CCNU) belong to a class of alkylating agents called nitrosoureas. Their defining pharmacological characteristic is their high lipid solubility (lipophilicity). This allows them to easily cross the blood-brain barrier and penetrate the central nervous system, making them highly effective and frequently used in the treatment of primary brain tumors (e.g., Medulloblastoma, Glioblastoma).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old child undergoing induction chemotherapy for ALL develops severe Tumor Lysis Syndrome. Despite aggressive hydration and allopurinol, his uric acid levels remain critically high. Rasburicase is ordered. Before administering Rasburicase, it is critical to ensure the patient does not have which of the following genetic deficiencies?', 
'["Glucose-6-Phosphate Dehydrogenase (G6PD) deficiency", "Thiopurine Methyltransferase (TPMT) deficiency", "Alpha-1 Antitrypsin deficiency", "Adenosine Deaminase (ADA) deficiency"]'::jsonb, 
0, 
'Rasburicase acts by oxidizing uric acid into allantoin. A byproduct of this specific enzymatic reaction is hydrogen peroxide (a potent oxidant). Patients with Glucose-6-Phosphate Dehydrogenase (G6PD) deficiency lack the ability to generate sufficient NADPH to protect their red blood cells from oxidative stress. If given rasburicase, the massive load of hydrogen peroxide will cause severe, life-threatening hemolytic anemia and methemoglobinemia. Therefore, G6PD deficiency is an absolute contraindication for rasburicase.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 9-year-old girl is treated with high-dose methotrexate for osteosarcoma. She requires Leucovorin rescue to prevent severe toxicity. How does Leucovorin work?', 
'["It competes with methotrexate for binding to dihydrofolate reductase (DHFR)", "It is a fully reduced, active form of folate that bypasses the DHFR enzyme block", "It actively pumps methotrexate out of normal cells via an efflux pump", "It binds to methotrexate in the serum and rapidly excretes it in the urine"]'::jsonb, 
1, 
'Methotrexate is a potent inhibitor of dihydrofolate reductase (DHFR). DHFR is required to reduce folic acid into its active form, tetrahydrofolate (THF), which is essential for DNA synthesis. Leucovorin (folinic acid) is an active, fully reduced derivative of folic acid. Because it is already reduced, it does not require DHFR for its metabolism. Administering leucovorin provides cells with the necessary active folate, completely bypassing the enzymatic blockade caused by methotrexate and rescuing normal cells from death.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-year-old boy presents with ataxia, vomiting, and a morning headache. MRI reveals a mass in the 4th ventricle. Pathology demonstrates an Ependymoma. From which normal cellular layer do these tumors originate?', 
'["The meninges covering the brain", "The myelin-producing oligodendrocytes", "The ciliated epithelial cells lining the ventricular system and central canal", "The astrocytes of the blood-brain barrier"]'::jsonb, 
2, 
'Ependymomas arise from the ependymal cells. Ependymal cells are ciliated, simple cuboidal or columnar glial cells that line the entire ventricular system of the brain and the central canal of the spinal cord. Their primary function is to circulate and produce cerebrospinal fluid (CSF). Because of this location, ependymomas frequently grow into the ventricular space (most commonly the 4th ventricle in children), blocking CSF flow and causing hydrocephalus.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 16-year-old male with Ewing Sarcoma has a chest CT that reveals multiple bilateral pulmonary nodules consistent with metastatic disease. The lungs are the most common site of metastasis for both Ewing Sarcoma and Osteosarcoma. How do these bone tumors primarily spread to the lungs?', 
'["Direct extension through the diaphragm", "Lymphatic spread through the thoracic duct", "Hematogenous (blood-borne) spread via the venous system", "Spread via the cerebrospinal fluid"]'::jsonb, 
2, 
'Sarcomas (malignancies of mesenchymal origin, including bone and soft tissue sarcomas) characteristically metastasize via the hematogenous (blood-borne) route, invading the venous system. Because the entire venous output of the body ultimately returns to the right side of the heart and is pumped directly into the pulmonary capillary bed, the lungs are the first "filter" the tumor cells encounter, making the lungs the most common site for distant metastasis in pediatric sarcomas. Carcinomas (epithelial origin) typically spread via lymphatics first.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 3-year-old child presents with a firm, smooth abdominal mass. Biopsy confirms Wilms tumor (Nephroblastoma). The histological appearance of classic Wilms tumor is described as "triphasic." Which three cellular components make up this triphasic pattern?', 
'["Blastemal, Stromal, and Epithelial cells", "Squamous, Glandular, and Neural cells", "Lymphoid, Myeloid, and Erythroid cells", "Osteoid, Chondroid, and Myxoid cells"]'::jsonb, 
0, 
'Classic Wilms tumor is an embryonal malignancy that attempts to mimic normal kidney development. The characteristic "triphasic" histology consists of three distinct components: (1) Blastema (sheets of primitive, small round blue cells), (2) Stroma (spindle cells, fibromyxoid tissue, sometimes skeletal muscle or cartilage), and (3) Epithelium (forming primitive tubules or abortive glomeruli). The presence of all three confirms the diagnosis.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 6-year-old boy treated for ALL with a regimen containing high-dose Dexamethasone presents to the clinic complaining of severe pain in his left hip and a noticeable limp. X-rays of the hip are initially normal, but an MRI shows edema and subchondral collapse of the femoral head. What is the most likely diagnosis?', 
'["Relapse of ALL in the joint space", "Septic arthritis", "Avascular necrosis (Osteonecrosis) of the femoral head", "Slipped capital femoral epiphysis"]'::jsonb, 
2, 
'Avascular necrosis (AVN), or osteonecrosis, is a well-known, debilitating, and often permanent complication of high-dose corticosteroid therapy (like dexamethasone or prednisone used in ALL treatment). It most commonly affects weight-bearing joints, especially the femoral head. Corticosteroids are thought to cause fat emboli, venous stasis, or increased intraosseous pressure, cutting off the blood supply to the bone and leading to bone death and eventual joint collapse. Early X-rays are often normal; MRI is the most sensitive diagnostic tool.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 13-year-old girl is undergoing treatment for Hodgkin Lymphoma. She presents with severe nausea and vomiting refractory to standard antiemetics. The oncologist adds Aprepitant to her regimen. What is the mechanism of action of Aprepitant?', 
'["It is a 5-HT3 (Serotonin) receptor antagonist", "It is a D2 (Dopamine) receptor antagonist", "It is an NK1 (Neurokinin-1) receptor antagonist, blocking Substance P", "It is a cannabinoid receptor agonist"]'::jsonb, 
2, 
'Aprepitant is a highly effective antiemetic used specifically for the prevention of acute and delayed chemotherapy-induced nausea and vomiting (CINV), especially with highly emetogenic regimens. It works by acting as a selective antagonist at the Neurokinin-1 (NK1) receptor in the brainstem vomiting center, thereby blocking the binding of Substance P, a neuropeptide that powerfully triggers vomiting. Ondansetron is a 5-HT3 antagonist. Metoclopramide is a D2 antagonist.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 1-year-old male infant presents with a rapidly growing, painless mass in the scrotum. Ultrasound shows a solid intratesticular lesion. Serum Alpha-fetoprotein (AFP) is significantly elevated. Radical orchiectomy is performed. What is the expected prognosis for this patient after complete surgical resection?', 
'["Very poor, usually fatal within 6 months", "Excellent, surgical resection alone is often curative for stage I disease", "Moderate, requires aggressive whole-body radiation", "Poor, highly resistant to all known chemotherapies"]'::jsonb, 
1, 
'This patient has a Yolk Sac Tumor (Endodermal Sinus Tumor), the most common testicular tumor in prepubertal children (typically under age 3). It secretes AFP. Unlike testicular tumors in young adults, prepubertal yolk sac tumors behave much less aggressively. They are usually diagnosed at Stage I (confined to the testicle). For Stage I disease, radical inguinal orchiectomy alone is often curative, and patients are placed on active surveillance (monitoring AFP levels) rather than receiving immediate chemotherapy.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old girl with neuroblastoma undergoes a biopsy. The tumor is classified as "High-Risk." In addition to MYCN amplification, which of the following cytogenetic findings is strongly associated with a poor prognosis in neuroblastoma?', 
'["Chromosome 1p deletion", "t(11;22) translocation", "Hyperdiploidy (>50 chromosomes)", "t(9;22) Philadelphia chromosome"]'::jsonb, 
0, 
'In Neuroblastoma, several genetic markers dictate risk. Poor prognostic indicators include MYCN amplification (the most critical), deletion of the short arm of chromosome 1 (1p deletion, or loss of heterozygosity at 1p36), and deletion of chromosome 11q. Conversely, hyperdiploidy (having more than 50 chromosomes) is associated with a more favorable prognosis, especially in infants. The t(11;22) is seen in Ewing Sarcoma.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 15-year-old female is diagnosed with Osteosarcoma. The medical team explains that after her initial chemotherapy, she will undergo surgery. Which of the following defines a "limb-salvage" procedure compared to an amputation?', 
'["Removing only the tumor mass and leaving all surrounding bone intact", "Resecting the tumor with wide margins and replacing the bone with a metallic endoprosthesis or bone graft, preserving the extremity", "Amputating the leg below the knee and attaching a robotic limb", "Using focused radiation to destroy the tumor without any incisions"]'::jsonb, 
1, 
'Limb-salvage (or limb-sparing) surgery is the standard of care for most osteosarcomas today. It involves removing the entire tumor block along with a "wide margin" of normal surrounding tissue (to ensure no cancer cells are left behind), but preserving the nerves and blood vessels of the limb. The missing bone and joint are then reconstructed using a metallic endoprosthesis, an allograft (cadaver bone), or a vascularized fibula graft, allowing the patient to keep and use their own limb.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A patient treated with Bleomycin for Hodgkin Lymphoma develops severe pulmonary toxicity. Which physiological factor makes the lungs uniquely susceptible to Bleomycin-induced free radical damage?', 
'["The lungs have a very low concentration of the enzyme bleomycin hydrolase", "Bleomycin is actively pumped into pneumocytes by a specific transporter", "The high oxygen tension in the alveoli directly activates the drug", "Bleomycin specifically targets surfactant-producing Type II pneumocytes"]'::jsonb, 
0, 
'Bleomycin exerts its cytotoxic effect by binding to DNA and iron, then reacting with oxygen to produce superoxide and hydroxyl free radicals that cause massive DNA single- and double-strand breaks. The drug is naturally inactivated in the body by the enzyme bleomycin hydrolase. The lungs (and the skin) have extremely low endogenous levels of bleomycin hydrolase. Therefore, the active drug accumulates in these tissues, causing severe local free radical damage, inflammation, and eventual pulmonary fibrosis.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 7-year-old child presents with a large abdominal mass. A biopsy confirms Burkitt Lymphoma. This tumor is characterized by an extraordinarily high proliferative rate. Which cellular marker of proliferation is typically near 100% in Burkitt Lymphoma?', 
'["p53", "Ki-67", "Bcl-2", "CD34"]'::jsonb, 
1, 
'Burkitt Lymphoma is one of the fastest-growing human tumors, with a doubling time of roughly 24 hours. Ki-67 is a cellular marker for proliferation; it is a nuclear protein that is expressed exclusively in actively dividing cells (G1, S, G2, and M phases) but is absent in resting cells (G0). Because virtually all cells in a Burkitt Lymphoma are actively dividing, the Ki-67 proliferation index is characteristically near 100%. Bcl-2 is an anti-apoptotic protein (typically negative in Burkitt, positive in follicular lymphoma).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 2-year-old child presents with a painless, smooth abdominal mass. Ultrasound reveals it is intrarenal. A biopsy is planned to confirm the suspected diagnosis of Wilms tumor. However, the surgeon decides against a preoperative percutaneous core needle biopsy. What is the primary rationale for this decision in a patient with a suspected localized Wilms tumor?', 
'["The biopsy will not yield enough tissue to distinguish it from neuroblastoma", "Needle biopsy carries a high risk of rupturing the tumor capsule, causing peritoneal seeding and upstaging the tumor", "Wilms tumors are highly vascular and will hemorrhage uncontrollably", "The diagnosis can be made definitively by measuring serum AFP and Beta-hCG"]'::jsonb, 
1, 
'For a suspected localized Wilms tumor, the standard of care in North America (Children''s Oncology Group protocols) is to proceed directly to an upfront radical nephrectomy without a prior percutaneous biopsy. Wilms tumors have a delicate capsule. Piercing this capsule with a needle can cause tumor cells to spill into the peritoneal cavity (tumor spillage). This immediately upstages the patient from Stage I or II to Stage III, significantly worsening the prognosis and necessitating the addition of abdominal radiation and more toxic chemotherapy.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old male with ALL is receiving L-Asparaginase as part of his induction therapy. He suddenly develops severe, acute mid-epigastric abdominal pain radiating to his back, accompanied by vomiting. Which of the following is the most likely diagnosis?', 
'["Acute appendicitis", "Tumor lysis syndrome", "Acute pancreatitis", "Hemorrhagic cystitis"]'::jsonb, 
2, 
'L-Asparaginase is an enzyme that degrades circulating asparagine, starving leukemic blasts. It has several unique, severe toxicities. It commonly causes allergic reactions/anaphylaxis, coagulopathy (by decreasing hepatic synthesis of clotting factors and antithrombin III, leading to thrombosis or bleeding), and Acute Pancreatitis. Acute pancreatitis presents with sudden, severe epigastric pain radiating to the back. If this occurs, L-Asparaginase must be permanently discontinued.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 6-month-old infant is diagnosed with Neuroblastoma. The tumor is localized to the adrenal gland, but the infant also has widespread metastases to the liver, skin (producing blue nodules known as "blueberry muffin" spots), and bone marrow. Remarkably, the tumor cells lack MYCN amplification. What is the most appropriate treatment for this specific presentation?', 
'["Immediate high-dose chemotherapy and autologous stem cell transplant", "Radical surgical excision of all metastatic lesions", "Observation and supportive care only, as this tumor often spontaneously regresses", "Whole-body radiation therapy"]'::jsonb, 
2, 
'This describes Stage 4S (S for "Special") Neuroblastoma. It occurs only in infants under 12-18 months of age with a localized primary tumor and metastases limited specifically to the liver, skin ("blueberry muffin" baby), and/or bone marrow (with <10% marrow involvement). Crucially, the tumor must lack MYCN amplification. Despite the widespread metastases, Stage 4S is a unique, highly favorable entity that frequently undergoes spontaneous, complete regression without any cytotoxic therapy. Observation is the standard of care.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 12-year-old girl is diagnosed with a brain tumor. Biopsy reveals a Pilocytic Astrocytoma. These tumors are classified as WHO Grade 1. What does this grading imply about the tumor''s biological behavior?', 
'["It is highly malignant and rapidly fatal", "It is benign, slow-growing, and well-circumscribed, often curable with complete surgical resection", "It frequently metastasizes to the spinal cord", "It is heavily infiltrative into surrounding brain tissue, making surgery impossible"]'::jsonb, 
1, 
'The World Health Organization (WHO) grading system for CNS tumors ranges from Grade 1 to 4. Grade 1 tumors (like Pilocytic Astrocytoma) are biologically benign, slow-growing, and circumscribed (non-infiltrative). If they occur in an accessible location (like the cerebellar hemisphere), complete surgical resection is often curative without the need for radiation or chemotherapy. Grade 4 tumors (like Glioblastoma) are highly malignant, rapidly fatal, and widely infiltrative.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 16-year-old male receives a bone marrow transplant. As part of his conditioning regimen, he receives Total Body Irradiation (TBI) and high-dose cyclophosphamide. A month later, he develops rapid weight gain, severe right upper quadrant abdominal pain, hepatomegaly, and jaundice. Ultrasound shows reversed flow in the portal vein. What is the diagnosis?', 
'["Acute Graft-Versus-Host Disease of the liver", "Veno-Occlusive Disease (VOD) / Sinusoidal Obstruction Syndrome (SOS) of the liver", "Cytomegalovirus hepatitis", "Tumor lysis syndrome"]'::jsonb, 
1, 
'Veno-Occlusive Disease (VOD), now known as Sinusoidal Obstruction Syndrome (SOS), is a severe complication following the intense conditioning regimens (chemo/radiation) used before a hematopoietic stem cell transplant. The toxic conditioning causes the endothelial cells lining the hepatic sinusoids to slough off and form microthrombi. This obstructs the small hepatic veins, leading to severe post-sinusoidal portal hypertension. It presents classically within the first 30 days post-transplant with weight gain (fluid retention/ascites), painful hepatomegaly, and jaundice. Defibrotide is the specific treatment.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which of the following classes of chemotherapy drugs, derived from the periwinkle plant, functions by binding to tubulin and preventing the assembly of microtubules, thereby arresting the cell cycle in metaphase?', 
'["Anthracyclines (e.g., Doxorubicin)", "Taxanes (e.g., Paclitaxel)", "Vinca alkaloids (e.g., Vincristine)", "Alkylating agents (e.g., Cyclophosphamide)"]'::jsonb, 
2, 
'Vinca alkaloids (Vincristine, Vinblastine) are cell-cycle specific agents that halt cell division in the M phase (Mitosis). They do this by binding to tubulin dimers and preventing them from polymerizing into microtubules. Without microtubules, the mitotic spindle cannot form, and the chromosomes cannot be pulled apart during metaphase, triggering apoptosis. Taxanes (Paclitaxel) also target microtubules but work by preventing their *disassembly*, locking the spindle in place.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old boy presents with a solid abdominal mass. A biopsy confirms Burkitt Lymphoma. Which prominent infectious agent is a well-known risk factor for the endemic form of this disease, commonly found in equatorial Africa?', 
'["Human Immunodeficiency Virus (HIV)", "Epstein-Barr Virus (EBV)", "Hepatitis C Virus (HCV)", "Human T-Lymphotropic Virus 1 (HTLV-1)"]'::jsonb, 
1, 
'Endemic Burkitt Lymphoma (found primarily in equatorial Africa) is strongly associated with the Epstein-Barr Virus (EBV), with the viral genome present in nearly 100% of cases. The virus infects B cells and promotes their survival and proliferation, serving as a critical "first hit" before the characteristic c-myc translocation [t(8;14)] occurs. The sporadic form (seen in the US/Europe) is EBV-positive in only about 15-20% of cases.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old girl is diagnosed with Osteosarcoma. Her tumor shows poor response to neoadjuvant chemotherapy, and pulmonary metastases are detected. She is evaluated for targeted immunotherapy. Which surface antigen, frequently highly expressed on osteosarcoma cells, is the target for monoclonal antibodies like Dinutuximab (though primarily used in neuroblastoma, it is under investigation here)?', 
'["CD20", "GD2 (Disialoganglioside)", "HER2/neu", "CD30"]'::jsonb, 
1, 
'GD2 is a disialoganglioside that is highly expressed on the surface of tumors of neuroectodermal and mesenchymal origin, most notably Neuroblastoma, but also Osteosarcoma, Melanoma, and some sarcomas. In normal tissues, its expression is largely restricted to neurons and peripheral nerve fibers. Dinutuximab is an anti-GD2 monoclonal antibody that is an FDA-approved, standard-of-care immunotherapy for high-risk neuroblastoma, working primarily via Antibody-Dependent Cellular Cytotoxicity (ADCC). CD20 is targeted by Rituximab (for B-cell lymphomas).')

;
