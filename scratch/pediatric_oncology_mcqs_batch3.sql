-- Batch 3: 30 Pediatric Oncology MCQs (Questions 61-90)
-- Note: Replace (SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1) with the actual topic_id for Pediatric Oncology Essentials

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 12-year-old girl is receiving multi-agent chemotherapy for a high-risk sarcoma. She is admitted with neutropenic fever. 48 hours after starting empiric Cefepime, she remains febrile (39.5°C) and her Absolute Neutrophil Count (ANC) is zero. Blood cultures are negative. What is the next most appropriate step in her empiric management?', 
'["Continue Cefepime and wait for count recovery", "Switch Cefepime to Vancomycin", "Add an antifungal agent, such as Caspofungin or Amphotericin B", "Start prophylactic acyclovir"]'::jsonb, 
2, 
'In a patient with profound, prolonged neutropenia (ANC < 500/mm³) who remains febrile for 4-7 days despite broad-spectrum empiric antibacterial therapy (like Cefepime or Piperacillin-tazobactam), an invasive fungal infection (e.g., Candida or Aspergillus) must be suspected. The standard of care is to empirically add systemic antifungal therapy (such as an echinocandin, liposomal amphotericin B, or voriconazole) while continuing antibacterial coverage.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 2-year-old child presents with an abdominal mass. Biopsy reveals a Neuroblastoma. Molecular analysis of the tumor tissue shows amplification of the N-myc (MYCN) oncogene. What is the clinical significance of this finding?', 
'["It indicates a highly favorable prognosis and allows for observation only", "It is associated with rapid tumor progression and a poor prognosis, mandating high-risk aggressive therapy", "It makes the tumor susceptible to treatment with Imatinib", "It indicates that the tumor is actually a Wilms tumor"]'::jsonb, 
1, 
'N-myc (MYCN) gene amplification is one of the most powerful and critical prognostic factors in Neuroblastoma. Amplification (defined as >10 copies of the gene) correlates strongly with rapid tumor progression, advanced disease stage, and poor survival. Even if a child has localized disease, the presence of MYCN amplification automatically shifts them into a "High-Risk" treatment category requiring intense multimodal therapy.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old boy treated for Hodgkin Lymphoma receives mantle field radiation therapy. The radiation oncologist carefully designs the radiation field to minimize exposure to surrounding healthy tissues. However, the patient must be monitored for years afterward for the development of which restrictive lung disease?', 
'["Asthma", "Radiation pneumonitis and subsequent pulmonary fibrosis", "Bronchiectasis", "Emphysema"]'::jsonb, 
1, 
'Radiation therapy directed at the chest or mediastinum (such as mantle field radiation for Hodgkin Lymphoma) can cause dose-dependent, delayed damage to the lung parenchyma. This manifests initially as acute radiation pneumonitis (months after therapy) and progresses to chronic, irreversible pulmonary fibrosis. Patients present with dyspnea, dry cough, and a restrictive pattern on pulmonary function tests (decreased TLC and FVC, with a preserved FEV1/FVC ratio).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which of the following chemotherapeutic agents exerts its cytotoxic effect by stabilizing the topoisomerase II-DNA cleavable complex, causing double-strand DNA breaks, and is notorious for causing secondary acute myeloid leukemia (AML) with an 11q23 (MLL) abnormality years later?', 
'["Etoposide", "Vincristine", "Methotrexate", "Bleomycin"]'::jsonb, 
0, 
'Etoposide and Teniposide are epipodophyllotoxins that inhibit Topoisomerase II. They stabilize the transient DNA breaks that Topo II makes, leading to permanent double-strand breaks and cell death. A severe, specific late effect of Etoposide therapy is the development of a secondary Acute Myeloid Leukemia (AML). This secondary AML typically occurs 2-3 years after treatment, lacks a myelodysplastic phase, and classically involves translocations of the MLL gene on chromosome 11q23.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-year-old boy presents with right upper quadrant pain, jaundice, and a palpable abdominal mass. Laboratory testing reveals a massive elevation of serum Alpha-fetoprotein (AFP). A liver biopsy confirms Hepatoblastoma. Which histologic subtype of Hepatoblastoma carries the best prognosis?', 
'["Pure fetal histology", "Embryonal histology", "Small cell undifferentiated histology", "Macrotrabecular histology"]'::jsonb, 
0, 
'Hepatoblastoma is an embryonal tumor of the liver. The histological subtype strongly predicts the clinical outcome. The "pure fetal" histological pattern (well-differentiated cells resembling fetal hepatocytes) carries the best prognosis and is sometimes treated with surgery alone if completely resected. The "small cell undifferentiated" subtype carries the worst prognosis and is highly aggressive.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 16-year-old male with Ewing sarcoma of the femur is scheduled to begin chemotherapy. Because the tumor cells characteristically express high levels of the surface receptor CD99 (MIC2), which of the following diagnostic tools utilizes this marker?', 
'["Targeted radiotherapy with I-131", "Immunohistochemical (IHC) staining to confirm the tissue diagnosis", "Flow cytometry of peripheral blood to monitor minimal residual disease", "Serum ELISA to detect circulating tumor antigens"]'::jsonb, 
1, 
'Ewing sarcoma is a small round blue cell tumor. It can be difficult to distinguish from other similar tumors (like neuroblastoma, rhabdomyosarcoma, or lymphoma) on standard H&E staining. A hallmark of Ewing sarcoma is the strong, diffuse membranous expression of the CD99 (MIC2) glycoprotein. Immunohistochemical (IHC) staining for CD99 is routinely used by pathologists as a highly sensitive diagnostic marker to confirm Ewing sarcoma.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A patient with a brain tumor is experiencing symptoms of significantly increased intracranial pressure (severe headache, vomiting, lethargy). The physician prescribes Dexamethasone. What is the primary mechanism by which dexamethasone reduces intracranial pressure in this setting?', 
'["It induces apoptosis of the tumor cells", "It acts as an osmotic diuretic, drawing water out of the brain parenchyma", "It decreases the production of cerebrospinal fluid by the choroid plexus", "It reduces peritumoral vasogenic edema by decreasing capillary permeability"]'::jsonb, 
3, 
'Brain tumors disrupt the blood-brain barrier, leading to the leakage of plasma fluid into the surrounding brain tissue (vasogenic edema). This edema often causes more mass effect and increased ICP than the tumor itself. High-dose corticosteroids, particularly Dexamethasone, are extremely effective at stabilizing the disrupted blood-brain barrier, rapidly reducing capillary permeability and resolving the vasogenic edema.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old child presents with a firm, smooth, painless abdominal mass. The parents noticed it while bathing him. An ultrasound reveals a large mass arising from the left kidney. Urinalysis shows microscopic hematuria. Blood pressure is 135/85 mmHg. The patient''s hypertension is most likely caused by tumor secretion of which substance?', 
'["Catecholamines", "Cortisol", "Renin", "Aldosterone"]'::jsonb, 
2, 
'This is a classic presentation of Wilms Tumor (Nephroblastoma). While mostly asymptomatic, up to 25% of children with Wilms tumor present with hypertension. This occurs because the tumor cells can autonomously secrete Renin, or the tumor can compress the renal artery, activating the Renin-Angiotensin-Aldosterone System (RAAS) and leading to secondary hypertension. Pheochromocytomas and Neuroblastomas secrete catecholamines.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 12-year-old girl is undergoing treatment for a brain tumor. Which of the following pediatric brain tumors typically arises in the cerebral hemispheres (supratentorial), frequently presents with seizures, and on histology exhibits Rosenthal fibers?', 
'["Medulloblastoma", "Ependymoma", "Pilocytic Astrocytoma", "Craniopharyngioma"]'::jsonb, 
2, 
'While Pilocytic Astrocytoma (WHO Grade 1) is most commonly found in the cerebellum (infratentorial) in children, it can also arise in the cerebral hemispheres, optic nerves (especially in Neurofibromatosis Type 1), and brainstem. When supratentorial, they frequently present with seizures. The definitive histological finding of Rosenthal fibers (eosinophilic, corkscrew-shaped inclusions) confirms the diagnosis.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old male with acute lymphoblastic leukemia (ALL) is placed on maintenance chemotherapy consisting of daily oral 6-mercaptopurine and weekly oral methotrexate. He develops severe, unexpected myelosuppression. A review of his medications reveals he was recently prescribed a drug for hyperuricemia. Which drug interacts dangerously with 6-mercaptopurine?', 
'["Allopurinol", "Rasburicase", "Probenecid", "Colchicine"]'::jsonb, 
0, 
'6-Mercaptopurine (6-MP) is degraded into inactive metabolites by the enzyme Xanthine Oxidase. Allopurinol is a potent inhibitor of Xanthine Oxidase. If a patient is taking allopurinol, the degradation of 6-MP is blocked, leading to a massive, toxic accumulation of active 6-MP metabolites. This causes severe, life-threatening bone marrow suppression. If both drugs must be used, the dose of 6-MP must be reduced by 75%.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 4-year-old girl is diagnosed with a massive, unresectable Neuroblastoma. She is treated with intensive chemotherapy, surgery, and radiation. Following this, she is given Isotretinoin (13-cis-retinoic acid) as maintenance therapy. What is the primary purpose of isotretinoin in the treatment of high-risk neuroblastoma?', 
'["To induce apoptosis of actively dividing tumor cells", "To stimulate the immune system to recognize tumor antigens", "To induce terminal differentiation of residual neuroblastoma cells into mature, benign ganglion cells", "To prevent radiation-induced skin toxicity"]'::jsonb, 
2, 
'Neuroblastoma arises from primitive neural crest cells. Isotretinoin (a retinoid) is not a traditional cytotoxic chemotherapy agent. Instead, it acts as a differentiating agent. In the maintenance phase of high-risk neuroblastoma, it forces any microscopic, residual primitive neuroblastoma cells to mature (differentiate) into benign, non-dividing ganglion cells, significantly reducing the rate of relapse and improving survival.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which pediatric malignancy is classically associated with the t(11;22)(q24;q12) chromosomal translocation, resulting in the EWS-FLI1 fusion protein?', 
'["Osteosarcoma", "Ewing Sarcoma", "Burkitt Lymphoma", "Alveolar Rhabdomyosarcoma"]'::jsonb, 
1, 
'The t(11;22)(q24;q12) translocation is the pathognomonic genetic hallmark of Ewing Sarcoma. It occurs in over 85% of cases. This translocation fuses the EWS gene on chromosome 22 with the FLI1 gene on chromosome 11. The resulting EWS-FLI1 fusion protein acts as an aberrant transcription factor that drives unrestricted cell growth and tumor formation.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 6-year-old boy presents with unilateral proptosis (bulging eye). MRI reveals a mass originating from the optic nerve. He also has multiple café-au-lait spots and axillary freckling. What is the most likely tumor?', 
'["Retinoblastoma", "Optic Nerve Glioma (Pilocytic Astrocytoma)", "Rhabdomyosarcoma", "Neuroblastoma metastasis"]'::jsonb, 
1, 
'This patient has the classic cutaneous stigmata of Neurofibromatosis Type 1 (NF1): café-au-lait macules and axillary freckling. NF1 is an autosomal dominant tumor predisposition syndrome caused by a mutation in the NF1 tumor suppressor gene (neurofibromin). Children with NF1 are at a highly increased risk for developing Optic Pathway Gliomas, which are almost always low-grade Pilocytic Astrocytomas (WHO Grade 1) that can cause proptosis and vision loss.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 13-year-old girl treated for Hodgkin lymphoma with ABVD chemotherapy presents years later with a chronic dry cough and progressive shortness of breath. Pulmonary function tests show a restrictive pattern and a decreased DLCO. Which chemotherapeutic agent is the most likely cause of this toxicity?', 
'["Doxorubicin", "Bleomycin", "Vinblastine", "Dacarbazine"]'::jsonb, 
1, 
'The ABVD regimen includes Adriamycin (Doxorubicin), Bleomycin, Vinblastine, and Dacarbazine. Bleomycin acts by generating free radicals that cause DNA strand breaks. Because the lungs (and skin) have very low levels of the enzyme bleomycin hydrolase, the drug accumulates in these tissues. Bleomycin toxicity classically causes dose-dependent, progressive pulmonary fibrosis, presenting with dyspnea, dry cough, and a restrictive PFT pattern.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 3-year-old boy with Acute Lymphoblastic Leukemia (ALL) is brought to the emergency department with a 2-day history of fever and severe, rapidly spreading, black necrotic skin lesions on his perineum and buttocks. His ANC is 50/mm³. What is the most likely infectious organism causing this specific dermatologic finding (ecthyma gangrenosum)?', 
'["Staphylococcus aureus", "Streptococcus pyogenes", "Pseudomonas aeruginosa", "Candida albicans"]'::jsonb, 
2, 
'Ecthyma gangrenosum is a classic, rapidly progressive necrotic skin lesion that occurs almost exclusively in profoundly neutropenic or immunocompromised patients. It begins as an erythematous macule, becomes a hemorrhagic bulla, and ruptures to form a painless ulcer with a black necrotic eschar and surrounding erythema. It is the pathognomonic cutaneous manifestation of Pseudomonas aeruginosa bacteremia and requires immediate empiric antipseudomonal antibiotics.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 7-year-old girl is diagnosed with a brainstem glioma. Given its location, the tumor is deemed surgically unresectable. Which cranial nerves are most commonly affected early in the course of a Diffuse Intrinsic Pontine Glioma (DIPG), leading to the classic presentation of facial asymmetry and diplopia?', 
'["CN III and IV", "CN V and XII", "CN VI and VII", "CN IX and X"]'::jsonb, 
2, 
'Diffuse Intrinsic Pontine Glioma (DIPG) is a highly aggressive, universally fatal tumor that infiltrates the pons. Because it grows within the brainstem, surgical resection is impossible. The nuclei of cranial nerves VI (Abducens) and VII (Facial) reside in the pons. Therefore, patients classically present with a 6th nerve palsy (inward deviation of the eye causing diplopia) and a 7th nerve palsy (facial droop or asymmetry), along with ataxia and long tract signs.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 15-year-old male receives a bone marrow transplant for relapsed leukemia. Two months later, he develops fever, gross hematuria, and severe dysuria. Urine culture is negative for bacteria, but PCR of the urine is positive for a viral pathogen known to cause hemorrhagic cystitis in transplant patients. What is the virus?', 
'["Cytomegalovirus (CMV)", "BK Virus", "Epstein-Barr Virus (EBV)", "Adenovirus"]'::jsonb, 
1, 
'The BK virus is a polyomavirus that remains latent in the kidneys of most of the population. In severely immunosuppressed patients (particularly those undergoing hematopoietic stem cell or kidney transplantation), the virus can reactivate and aggressively replicate in the urothelium. This leads to a severe, sterile hemorrhagic cystitis (gross hematuria without bacterial infection). Treatment involves reducing immunosuppression and supportive care.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A pediatric patient with a large Burkitt lymphoma begins intensive chemotherapy. Within 12 hours, lab results show K+ 6.5 mEq/L, Uric Acid 12 mg/dL, Phosphorus 8.0 mg/dL, and Calcium 6.5 mg/dL. The patient is at highest immediate risk for which of the following complications?', 
'["Acute hemorrhagic stroke", "Cardiac arrhythmias", "Severe gastrointestinal bleeding", "Pathologic bone fractures"]'::jsonb, 
1, 
'This patient has severe Tumor Lysis Syndrome (TLS). The rapid breakdown of massive numbers of tumor cells releases intracellular contents into the bloodstream. The most immediately life-threatening abnormality is hyperkalemia (K+ 6.5), which can rapidly induce lethal cardiac arrhythmias (e.g., ventricular fibrillation, asystole). Hypocalcemia (caused by calcium binding to the released phosphorus) can also cause arrhythmias and tetany. Immediate treatment with hydration, rasburicase, and hyperkalemia management is critical.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which of the following classes of chemotherapy drugs acts by cross-linking DNA strands, preventing DNA replication and transcription, and includes agents such as Cyclophosphamide, Ifosfamide, and Melphalan?', 
'["Antimetabolites", "Alkylating agents", "Topoisomerase inhibitors", "Microtubule inhibitors"]'::jsonb, 
1, 
'Alkylating agents are cell-cycle nonspecific drugs. They work by adding an alkyl group to the guanine base of the DNA molecule. This causes the formation of intra-strand and inter-strand cross-links. These cross-links physically prevent the DNA double helix from unzipping, thereby halting DNA replication and transcription, leading to cell death. Because they damage DNA directly, they carry a high risk of causing secondary malignancies (especially leukemias) years later.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-year-old boy presents with a painless, swollen testicle. Ultrasound reveals a solid mass. Radical inguinal orchiectomy is performed, and pathology confirms a testicular tumor. Which of the following statements regarding the biopsy of a suspected testicular malignancy is true?', 
'["A trans-scrotal needle biopsy should be performed immediately to confirm the diagnosis before surgery", "A trans-scrotal biopsy is absolutely contraindicated due to the risk of tumor seeding", "A fine-needle aspiration is preferred over a core biopsy", "Biopsy is unnecessary as ultrasound is 100% diagnostic"]'::jsonb, 
1, 
'Any solid testicular mass is presumed malignant until proven otherwise. A trans-scrotal biopsy or fine-needle aspiration is strictly contraindicated. The lymphatic drainage of the testes goes to the retroperitoneal lymph nodes, while the scrotum drains to the superficial inguinal nodes. Piercing the scrotum with a needle can seed tumor cells into the scrotal sac, altering the lymphatic drainage and potentially causing a localized tumor to spread to a new lymphatic basin. The correct approach is a radical inguinal orchiectomy (removing the testicle and cord through an incision in the groin).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A child is diagnosed with familial retinoblastoma. Genetic testing confirms a germline mutation in one allele of the RB1 gene. The RB1 protein is a tumor suppressor. What is the normal physiological function of the unphosphorylated, active RB protein?', 
'["It binds and inhibits the E2F transcription factor, preventing the cell from entering the S phase", "It phosphorylates p53, triggering apoptosis", "It repairs double-strand DNA breaks", "It acts as a tyrosine kinase to stimulate cell proliferation"]'::jsonb, 
0, 
'The RB (Retinoblastoma) protein is the master regulator of the cell cycle''s G1-to-S phase transition. In its active, hypophosphorylated state, RB binds tightly to the E2F transcription factor, sequestering it and preventing it from turning on the genes needed for DNA replication (S phase). When a cell is stimulated to divide, cyclin-dependent kinases (CDKs) phosphorylate RB, causing it to release E2F, allowing the cell cycle to proceed. Loss of both RB alleles removes this brake, leading to uncontrolled proliferation.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 4-year-old girl with neuroblastoma presents with hypertension, sweating, and palpitations. Her urine is positive for elevated VMA (Vanillylmandelic acid) and HVA (Homovanillic acid). These metabolites are the breakdown products of which endogenous substances?', 
'["Serotonin", "Histamine", "Catecholamines (Epinephrine, Norepinephrine, Dopamine)", "Cortisol"]'::jsonb, 
2, 
'Neuroblastoma arises from neural crest cells that form the sympathetic nervous system. Like pheochromocytomas, neuroblastomas frequently secrete excess catecholamines (dopamine, norepinephrine, epinephrine). These are metabolized by MAO and COMT into Homovanillic acid (HVA, from dopamine) and Vanillylmandelic acid (VMA, from epi/norepi). Elevated VMA and HVA in the urine are highly sensitive diagnostic markers for neuroblastoma.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 16-year-old female presents with a painless, enlarging mass in her left supraclavicular lymph node. Excisional biopsy shows nodular sclerosis Hodgkin Lymphoma. She is treated with the ABVD regimen. Which drug in this regimen is most highly associated with dose-dependent cardiotoxicity?', 
'["Adriamycin (Doxorubicin)", "Bleomycin", "Vinblastine", "Dacarbazine"]'::jsonb, 
0, 
'The ABVD regimen stands for Adriamycin, Bleomycin, Vinblastine, and Dacarbazine. Adriamycin is the trade name for Doxorubicin, an anthracycline. Anthracyclines are notorious for causing dose-dependent, cumulative, and irreversible dilated cardiomyopathy due to the generation of free radicals in the myocardium. Bleomycin causes pulmonary fibrosis, Vinblastine causes peripheral neuropathy/myelosuppression, and Dacarbazine causes severe emesis and myelosuppression.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A patient treated with extensive abdominal radiation for a pediatric solid tumor is evaluated 15 years later for fatigue, microcytic anemia, and guaiac-positive stools. Endoscopy reveals a mass in the colon. The risk of developing this secondary malignancy is directly related to the radiation fields used during childhood. Radiation induces cancer primarily by causing:', 
'["Inhibition of Topoisomerase II", "Direct DNA double-strand breaks and subsequent faulty repair", "Cross-linking of guanine bases", "Inhibition of the mitotic spindle"]'::jsonb, 
1, 
'Ionizing radiation (used in cancer therapy) works by generating reactive oxygen species (ROS) and directly ionizing DNA, leading to single- and double-strand DNA breaks. While this kills rapidly dividing tumor cells, it also damages the DNA of surrounding normal tissue. If the cell survives and the DNA is repaired faultily (e.g., via non-homologous end joining), mutations accumulate. Over years or decades, this can result in the development of secondary solid tumors (like colon cancer, breast cancer, or sarcomas) directly within the previous radiation field.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old child presents with an abdominal mass. Pathology confirms a Wilms tumor. Histological examination reveals "anaplasia" (cells with large, hyperchromatic, multipolar nuclei and atypical mitotic figures). The presence of anaplasia in a Wilms tumor is a marker of:', 
'["Favorable prognosis and high sensitivity to standard chemotherapy", "A benign variant of Wilms tumor (mesoblastic nephroma)", "Unfavorable prognosis and resistance to standard chemotherapy", "Syndromic association (e.g., WAGR syndrome)"]'::jsonb, 
2, 
'In Wilms tumor, the histology is broadly divided into "favorable" and "unfavorable" (anaplastic). Anaplasia is characterized by extreme nuclear pleomorphism, hyperchromasia, and bizarre, multipolar mitotic figures. It is often associated with mutations in the p53 tumor suppressor gene. The presence of anaplasia (even if focal, but especially if diffuse) indicates resistance to standard chemotherapy, a much higher risk of relapse, and a significantly poorer overall prognosis, requiring far more aggressive treatment.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 1-year-old child with Langerhans Cell Histiocytosis (LCH) is found to have a somatic mutation in the BRAF gene (specifically the BRAF V600E mutation) in the histiocytic cells. This mutation causes continuous, unregulated activation of which intracellular signaling pathway?', 
'["JAK/STAT pathway", "PI3K/AKT/mTOR pathway", "MAPK (Mitogen-Activated Protein Kinase) pathway", "Wnt/beta-catenin pathway"]'::jsonb, 
2, 
'Over 50% of patients with Langerhans Cell Histiocytosis (LCH) harbor the BRAF V600E somatic mutation in the clonal dendritic cells. BRAF is a serine/threonine kinase that is a critical component of the MAPK/ERK signaling pathway. This pathway normally regulates cell growth and survival. The V600E mutation locks the BRAF kinase in an "always-on" state, driving continuous, uncontrolled cellular proliferation. This discovery has led to the successful use of targeted BRAF inhibitors (like vemurafenib) in severe, refractory LCH.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old girl is diagnosed with Osteosarcoma of the proximal tibia. Neoadjuvant (preoperative) chemotherapy is administered for 10 weeks before surgical resection. What is the primary purpose of examining the resected tumor tissue post-operatively in this protocol?', 
'["To determine the exact genetic subtype of the tumor", "To assess the percentage of tumor necrosis, which is the most powerful predictor of overall survival", "To harvest live tumor cells to create a personalized cancer vaccine", "To confirm that the surgical margins are positive"]'::jsonb, 
1, 
'In the standard treatment of Osteosarcoma, neoadjuvant (pre-surgical) chemotherapy is given to shrink the primary tumor and eradicate micrometastases. When the tumor is surgically resected, the pathologist examines the entire specimen to calculate the percentage of tumor necrosis (the proportion of tumor cells killed by the chemotherapy). A "good response" (e.g., >90% necrosis) is the single most powerful prognostic indicator for long-term survival. A poor response may prompt a change in the postoperative chemotherapy regimen.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 3-year-old boy presents with a firm, immobile mass in his right cheek. Imaging shows destruction of the maxilla. Biopsy confirms Embryonal Rhabdomyosarcoma. The tumor cells are positive for desmin. Which normal cellular structure is primarily composed of desmin?', 
'["Microtubules", "Intermediate filaments", "Microfilaments (Actin)", "The nuclear envelope"]'::jsonb, 
1, 
'Desmin is an intermediate filament protein. Intermediate filaments provide structural support and shape to cells. Desmin is specifically expressed in all three types of muscle tissue (skeletal, cardiac, and smooth muscle). Because Rhabdomyosarcoma is a malignancy derived from primitive skeletal muscle precursors (rhabdomyoblasts), the cells characteristically express desmin. Staining positive for desmin (along with myogenin and MyoD1) confirms the diagnosis of a muscle-derived tumor.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which of the following interventions is routinely administered alongside high-dose Cyclophosphamide to prevent the development of hemorrhagic cystitis?', 
'["Leucovorin", "Dexrazoxane", "Mesna", "Amifostine"]'::jsonb, 
2, 
'Cyclophosphamide and Ifosfamide (alkylating agents) are metabolized in the liver to yield the active alkylating compound and a toxic byproduct called acrolein. Acrolein concentrates in the urine and aggressively attacks the bladder epithelium, causing severe, painful hemorrhagic cystitis. Mesna (2-mercaptoethane sulfonate sodium) is administered intravenously alongside the chemotherapy. It concentrates in the urine, where its sulfhydryl group binds to and neutralizes the double bond of acrolein, rendering it harmless.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-year-old boy receives an allogeneic hematopoietic stem cell transplant for relapsed ALL. He is placed on Tacrolimus and Methotrexate for GVHD prophylaxis. Two months later, he develops fever, neutropenia, and a diffuse interstitial pneumonia. Bronchoalveolar lavage is positive for Cytomegalovirus (CMV). Which aspect of his immune system is primarily impaired, making him susceptible to this viral reactivation?', 
'["Humoral immunity (B cells)", "Innate immunity (Neutrophils)", "Cell-mediated immunity (T cells)", "The complement system"]'::jsonb, 
2, 
'Cytomegalovirus (CMV) is a herpesvirus that establishes lifelong latency after primary infection. It is kept in check primarily by cell-mediated immunity (specifically CD8+ cytotoxic T cells). Following an allogeneic stem cell transplant, patients receive intense immunosuppressive drugs (like Tacrolimus) that profoundly inhibit T cell function to prevent Graft-Versus-Host Disease (GVHD). This severe T-cell defect allows latent viruses like CMV to reactivate, leading to severe, life-threatening complications such as CMV pneumonitis, colitis, or retinitis.')

;
