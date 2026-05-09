-- Batch 6: 30 Pediatric Oncology MCQs (Questions 151-180)
-- Note: Replace (SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1) with the actual topic_id for Pediatric Oncology Essentials

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 1-year-old child presents with a retroperitoneal mass. A biopsy confirms a localized neuroblastoma. The tumor cells lack MYCN amplification but have hyperdiploidy (abnormal DNA index > 1). The tumor is completely excised surgically. What is the standard postoperative management for this infant?', 
'["High-dose chemotherapy and autologous stem cell transplant", "Abdominal radiation therapy", "Observation without cytotoxic therapy", "Lifelong administration of isotretinoin"]'::jsonb, 
2, 
'In infants (<18 months old), localized neuroblastoma (Stage 1 or 2) with favorable biological features (no MYCN amplification, hyperdiploidy) has an extraordinarily high cure rate (>95%) with surgical resection alone. These tumors have a strong tendency to mature or spontaneously regress. Standard of care is careful observation without the need for toxic postoperative chemotherapy or radiation.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old female presents to the clinic with persistent bone pain in her right distal femur. X-ray shows a sclerotic, bone-forming lesion with an aggressive sunburst periosteal reaction. She is diagnosed with Osteosarcoma. The oncologist explains that her treatment will involve neoadjuvant chemotherapy. What is the primary rationale for using neoadjuvant (preoperative) chemotherapy in osteosarcoma?', 
'["To prevent the development of a secondary leukemia", "To allow time for a custom metallic endoprosthesis to be manufactured", "To eradicate micrometastatic disease early and shrink the primary tumor to facilitate a limb-salvage surgery", "To determine if the patient has a germline TP53 mutation"]'::jsonb, 
2, 
'Historically, osteosarcoma was treated with immediate amputation, but >80% of patients still died of pulmonary metastases, proving that microscopic metastases are almost universally present at diagnosis. Neoadjuvant (upfront) chemotherapy attacks these micrometastases immediately, significantly improving survival. It also shrinks the primary tumor, making limb-salvage surgery (rather than amputation) possible in the vast majority of patients. Finally, it allows the pathologist to assess the tumor''s response to the drugs (percent necrosis).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 6-year-old boy presents with progressive clumsiness, a wide-based gait, and bilateral papilledema on fundoscopic exam. An MRI reveals a solid, enhancing mass in the midline of the cerebellum (vermis) filling the fourth ventricle. Which of the following is the most likely diagnosis?', 
'["Pilocytic Astrocytoma", "Medulloblastoma", "Glioblastoma Multiforme", "Craniopharyngioma"]'::jsonb, 
1, 
'Medulloblastoma is the most common malignant pediatric brain tumor. It classically arises from the cerebellar vermis (midline), causing severe truncal ataxia and wide-based gait. Due to its location, it rapidly compresses and fills the 4th ventricle, causing obstructive hydrocephalus and signs of increased intracranial pressure (headache, vomiting, papilledema). Pilocytic astrocytomas typically occur in the cerebellar hemispheres and are cystic with a mural nodule.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 4-year-old girl is diagnosed with a standard-risk Acute Lymphoblastic Leukemia (ALL). She achieves a complete remission after induction chemotherapy. During the consolidation phase, she receives high-dose Methotrexate. What must be monitored meticulously in her urine to ensure the safe excretion of this drug and prevent nephrotoxicity?', 
'["Urine specific gravity", "Urine pH", "Urine protein levels", "Urine ketones"]'::jsonb, 
1, 
'High-dose methotrexate is excreted almost entirely by the kidneys. It is poorly soluble in acidic environments. If the urine pH drops, methotrexate and its metabolites will rapidly precipitate in the renal tubules, causing acute tubular necrosis and renal failure. If the kidneys fail, the drug cannot be cleared, leading to lethal systemic toxicity. Therefore, patients receive massive IV hydration containing sodium bicarbonate to strictly maintain a urinary pH > 7.0 until the drug is fully cleared.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 12-year-old boy presents with a firm, enlarging mass in his right bicep muscle. A biopsy reveals Alveolar Rhabdomyosarcoma. This specific subtype of rhabdomyosarcoma is characterized by which of the following genetic translocations?', 
'["t(8;14)", "t(9;22)", "t(11;22)", "t(2;13) or t(1;13)"]'::jsonb, 
3, 
'Alveolar Rhabdomyosarcoma is a highly aggressive subtype of rhabdomyosarcoma that most commonly occurs in the extremities of adolescents (unlike the embryonal subtype, which occurs in younger children in the head/neck/GU tract). The alveolar subtype is driven by a pathognomonic chromosomal translocation, most commonly t(2;13) or t(1;13), which fuses the PAX3 or PAX7 gene with the FOXO1 (FKHR) gene, creating a potent oncogenic transcription factor.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 7-year-old child with relapsed ALL receives a Hematopoietic Stem Cell Transplant (HSCT) from a matched unrelated donor. To prevent Graft-Versus-Host Disease (GVHD), he is placed on Cyclosporine. What is the mechanism of action of Cyclosporine?', 
'["It acts as a purine analog to inhibit DNA synthesis in T cells", "It binds to cyclophilin to inhibit calcineurin, thereby preventing the transcription of IL-2", "It is an alkylating agent that cross-links T cell DNA", "It selectively depletes CD20+ B cells"]'::jsonb, 
1, 
'Cyclosporine is a potent immunosuppressant critical for preventing organ rejection and GVHD. It works by entering the T cell and binding to an intracellular protein called cyclophilin. The cyclosporine-cyclophilin complex then binds to and inhibits calcineurin (a phosphatase). Without calcineurin activity, the transcription factor NFAT cannot enter the nucleus, and the T cell fails to produce IL-2, halting T cell activation and proliferation.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which of the following physical exam findings is a classic, virtually pathognomonic sign of an Optic Pathway Glioma in a young child?', 
'["Loss of the red reflex (Leukocoria)", "Bilateral ptosis that worsens in the evening", "Painless, progressive unilateral proptosis and visual loss", "Opsoclonus-myoclonus syndrome"]'::jsonb, 
2, 
'Optic Pathway Gliomas (most commonly Pilocytic Astrocytomas) arise from the optic nerve or optic chiasm. Because they grow within the confined space of the orbit, they push the eyeball forward, causing a painless, progressive, and typically unilateral proptosis (exophthalmos), along with decreased visual acuity or visual field defects. They are highly associated with Neurofibromatosis Type 1 (NF1). Leukocoria is a sign of retinoblastoma.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A pediatric patient is diagnosed with a brain tumor. Histological analysis reveals a highly cellular tumor consisting of small, uniform, round blue cells forming Homer-Wright rosettes. The tumor is located in the cerebellum. What is the most likely diagnosis?', 
'["Ependymoma", "Pilocytic Astrocytoma", "Medulloblastoma", "Oligodendroglioma"]'::jsonb, 
2, 
'Medulloblastomas are primitive neuroectodermal tumors (PNETs) of the cerebellum. Histologically, they are classic "small round blue cell" tumors. A hallmark (though not present in every case) is the Homer-Wright rosette, where the malignant cells arrange themselves radially around a central core of pink fibrillary neuropil. Ependymomas feature perivascular pseudorosettes. Pilocytic astrocytomas feature Rosenthal fibers.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-year-old girl is receiving intensive chemotherapy for AML. She develops a severe, febrile illness with blood cultures positive for Candida krusei. Her oncologist prescribes Voriconazole. Which unique, transient side effect is classic and highly specific to Voriconazole therapy?', 
'["Red-orange discoloration of urine and tears", "Visual disturbances (photopsia, altered color vision)", "Gingival hyperplasia", "Hemorrhagic cystitis"]'::jsonb, 
1, 
'Voriconazole is a broad-spectrum triazole antifungal used for severe invasive fungal infections (especially Aspergillus and Candida species resistant to fluconazole). A unique, common, and transient side effect is visual disturbances. About 30% of patients experience altered color vision, photophobia, blurred vision, or photopsia (seeing flashes of light) shortly after receiving the dose. This effect is temporary and resolves without permanent damage. Red-orange urine is seen with Rifampin.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 3-year-old child presents with a large, smooth abdominal mass. Ultrasound shows it is intrarenal. A CT scan of the chest reveals multiple small pulmonary nodules. The diagnosis is Stage IV Wilms Tumor (Nephroblastoma). Which chemotherapeutic agent must be added to the standard regimen (Vincristine + Dactinomycin) to treat this advanced stage?', 
'["Methotrexate", "Doxorubicin (Adriamycin)", "Imatinib", "Cytarabine"]'::jsonb, 
1, 
'For early-stage (Stage I/II) favorable histology Wilms tumor, Vincristine and Dactinomycin are sufficient. However, for Stage III (abdominal spread/positive nodes) or Stage IV (distant metastasis, usually to the lungs), a third agent is mandatory to achieve high cure rates. Doxorubicin (an anthracycline) is added to the regimen. Radiation therapy is also typically directed to the tumor bed and to the lungs (whole lung radiation) for pulmonary metastases.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old boy presents with a firm mass in his distal femur. Biopsy reveals Osteosarcoma. The oncologist discusses the prognosis with the family. Which of the following is the single most important clinical factor predicting the overall survival of a patient with newly diagnosed osteosarcoma?', 
'["The specific histological subtype (e.g., osteoblastic vs. chondroblastic)", "The patient''s age at diagnosis", "The presence or absence of detectable macroscopic metastatic disease at diagnosis", "The exact size of the primary tumor"]'::jsonb, 
2, 
'In Osteosarcoma (and most solid tumors), the presence of detectable metastatic disease at presentation (usually in the lungs or other bones) is the single most powerful adverse prognostic factor. Patients presenting with localized disease have a long-term survival rate of roughly 70-75%, whereas those presenting with macroscopic pulmonary metastases have a survival rate of less than 30%. Response to neoadjuvant chemotherapy is the second most important factor.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A child treated with high-dose Cyclophosphamide for a solid tumor presents with severe gross hematuria and dysuria. Mesna was administered, but the patient was poorly hydrated. The patient is diagnosed with severe hemorrhagic cystitis. Which virus should be ruled out as it can cause a clinically identical presentation in immunosuppressed patients?', 
'["Epstein-Barr Virus (EBV)", "BK Virus (Polyomavirus)", "Parvovirus B19", "Hepatitis C Virus"]'::jsonb, 
1, 
'While Cyclophosphamide/Ifosfamide chemically cause hemorrhagic cystitis (via acrolein), viral reactivation can cause the exact same syndrome in heavily immunosuppressed patients. The BK virus (a polyomavirus) is notorious for reactivating in the urothelium of immunocompromised patients (especially post-bone marrow or kidney transplant), causing severe, sometimes intractable hemorrhagic cystitis. Adenovirus can also cause this. PCR of the urine confirms the viral etiology.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 2-year-old boy presents with a rapidly expanding, firm mass in his jaw. Biopsy shows a small round blue cell tumor. The cells are positive for MyoD1 and Desmin. He is diagnosed with Embryonal Rhabdomyosarcoma. Where does embryonal rhabdomyosarcoma most commonly arise?', 
'["In the diaphysis of long bones", "In the head and neck region (e.g., orbit, nasopharynx) and the genitourinary tract", "Exclusively in the central nervous system", "In the deep muscles of the thigh"]'::jsonb, 
1, 
'Embryonal Rhabdomyosarcoma (the most common soft tissue sarcoma in young children) classically arises in the head and neck region (particularly the orbit, leading to proptosis, or the nasopharynx/jaw) and the genitourinary tract (bladder, prostate, vagina/sarcoma botryoides). The Alveolar subtype tends to occur more often in the extremities of older adolescents.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 15-year-old girl is diagnosed with classical Hodgkin Lymphoma. A PET-CT scan reveals involvement of lymph nodes in the right neck, right axilla, and mediastinum. There is no disease below the diaphragm or in the organs. What is her Ann Arbor Stage?', 
'["Stage I", "Stage II", "Stage III", "Stage IV"]'::jsonb, 
1, 
'This patient has disease in multiple distinct lymph node regions (cervical, axillary, mediastinal), but all of the involved regions are located on the SAME SIDE of the diaphragm (above it). According to the Ann Arbor staging system, this defines Stage II disease. If the disease crossed the diaphragm (e.g., involved inguinal nodes as well), it would be Stage III.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A pediatric patient with acute lymphoblastic leukemia (ALL) receives maintenance therapy. She is found to have a genetic deficiency in the enzyme Thiopurine Methyltransferase (TPMT). Which medication must be drastically reduced in dose or avoided to prevent severe, lethal myelosuppression?', 
'["Methotrexate", "Vincristine", "6-Mercaptopurine", "Dexamethasone"]'::jsonb, 
2, 
'Thiopurine Methyltransferase (TPMT) is the primary enzyme responsible for inactivating the thiopurine drugs 6-Mercaptopurine (6-MP) and Azathioprine. If a patient is homozygous or heterozygous for a TPMT deficiency, they cannot clear the drug from their system. A standard dose will result in a massive, toxic accumulation of active metabolites, leading to profound, life-threatening bone marrow failure. Pharmacogenomic testing is standard before initiation.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 4-month-old infant presents with a massive, firm liver. Serum Alpha-fetoprotein (AFP) is highly elevated. A biopsy confirms Hepatoblastoma. Which of the following genetic overgrowth syndromes is strongly associated with an increased risk of developing hepatoblastoma?', 
'["Down Syndrome (Trisomy 21)", "Beckwith-Wiedemann Syndrome", "Neurofibromatosis Type 1", "Turner Syndrome"]'::jsonb, 
1, 
'Beckwith-Wiedemann Syndrome (BWS) is an overgrowth syndrome (macroglossia, macrosomia, omphalocele, hemihypertrophy) caused by imprinting abnormalities on chromosome 11p15. Children with BWS have a significantly increased risk of developing embryonal tumors in early childhood, most notably Wilms tumor and Hepatoblastoma. They require rigorous routine screening with abdominal ultrasounds and serum AFP levels until age 7.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old boy with a history of Ewing Sarcoma of the pelvis was treated with intense pelvic radiation and systemic chemotherapy. Five years later, he presents with blood in his stool. A colonoscopy reveals a malignant tumor in his rectum. What is the most likely etiology of this new malignancy?', 
'["It is a late relapse of the Ewing Sarcoma", "It is a primary, sporadic colon cancer, unrelated to his prior history", "It is a radiation-induced secondary solid tumor", "It is caused by an underlying, undiagnosed familial adenomatous polyposis (FAP)"]'::jsonb, 
2, 
'Survivors of childhood cancer treated with radiation therapy have a highly elevated risk of developing secondary solid tumors directly within the previous radiation field. Pelvic radiation significantly increases the long-term risk of developing colorectal cancer, bladder cancer, and gynecological cancers. These secondary radiation-induced tumors typically arise 10-20 years after the initial exposure and require specialized, early cancer screening protocols for survivors.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which class of chemotherapeutic agents, frequently used in pediatric leukemia and lymphoma protocols, exerts its cytotoxic effect by depriving malignant cells of an essential amino acid, leading to inhibition of protein synthesis and apoptosis?', 
'["Anthracyclines", "Asparaginase", "Vinca alkaloids", "Antimetabolites"]'::jsonb, 
1, 
'L-Asparaginase (or its pegylated form, PEG-asparaginase) is an enzyme that catalyzes the hydrolysis of the amino acid asparagine into aspartic acid and ammonia in the bloodstream. Normal human cells can synthesize their own asparagine. However, leukemic lymphoblasts lack the enzyme asparagine synthetase and are entirely dependent on circulating asparagine for survival. By destroying the circulating supply, asparaginase effectively starves the leukemic cells to death.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old child with a brain tumor presents with severe morning vomiting, papilledema, and a heart rate of 50 bpm with a blood pressure of 140/90 mmHg. The tumor is located in the posterior fossa. The combination of bradycardia, hypertension, and irregular respirations in this setting is known as:', 
'["Horner''s Syndrome", "Cushing''s Triad", "Beck''s Triad", "Virchow''s Triad"]'::jsonb, 
1, 
'Cushing''s Triad (hypertension, bradycardia, and irregular respirations) is a classic, late, and ominous physiological response to severely increased intracranial pressure (ICP), often predicting imminent brain herniation. The increased ICP forces the sympathetic nervous system to massively increase blood pressure to maintain cerebral perfusion. This hypertension triggers a reflex parasympathetic response via the vagus nerve, causing profound bradycardia. The pressure on the brainstem disrupts the respiratory centers.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 1-year-old child presents with a white pupillary reflex (leukocoria). The diagnosis is bilateral Retinoblastoma. Genetic testing reveals a germline mutation in the RB1 gene. Because this patient has the inherited form of the disease, they are at an exceptionally high risk of developing which secondary malignancy in their teenage years?', 
'["Leukemia", "Osteosarcoma", "Neuroblastoma", "Hepatocellular carcinoma"]'::jsonb, 
1, 
'Patients with hereditary (germline) RB1 mutations have a massively increased lifetime risk of developing secondary malignancies, even independent of radiation therapy. The most common and classic secondary malignancy in these patients is Osteosarcoma. The RB1 gene is a critical tumor suppressor for bone cells as well; lacking one functional copy in every cell makes the development of osteosarcoma highly probable during the rapid bone growth of adolescence.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 16-year-old female is diagnosed with Acute Promyelocytic Leukemia (APL). She is started on All-Trans Retinoic Acid (ATRA). A few days later, she develops sudden onset dyspnea, fever, weight gain, and pulmonary infiltrates on a chest X-ray. What is this severe complication, and how is it treated?', 
'["Tumor Lysis Syndrome; treated with Rasburicase", "Differentiation Syndrome (Retinoic Acid Syndrome); treated with Dexamethasone", "Disseminated Intravascular Coagulation (DIC); treated with fresh frozen plasma", "Pulmonary embolism; treated with Heparin"]'::jsonb, 
1, 
'Differentiation Syndrome (formerly Retinoic Acid Syndrome) is a life-threatening complication of treating APL with ATRA (or arsenic trioxide). ATRA forces the malignant promyelocytes to rapidly mature into functional neutrophils. This massive wave of differentiating neutrophils releases a storm of cytokines and infiltrates the lungs and other organs, causing capillary leak, pulmonary infiltrates, fever, and acute respiratory distress. The treatment is immediate administration of high-dose corticosteroids (Dexamethasone) and temporary cessation of ATRA.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 4-year-old boy presents with a firm mass in his abdomen. A biopsy reveals a Wilms tumor. The histology is reported as "favorable." What specific microscopic feature is ABSENT in favorable histology Wilms tumor, making it highly responsive to standard chemotherapy?', 
'["Blastemal cells", "Anaplasia (extreme nuclear pleomorphism and bizarre mitotic figures)", "Epithelial tubules", "Stromal spindle cells"]'::jsonb, 
1, 
'Favorable histology in Wilms tumor means the cells, while malignant, retain a somewhat orderly, embryonal appearance (the classic triphasic pattern of blastema, stroma, and epithelium). "Unfavorable" histology is defined exclusively by the presence of Anaplasia. Anaplasia is characterized by cells with massive, hyperchromatic nuclei, extreme pleomorphism, and bizarre, multipolar mitotic figures. Anaplasia signifies a biologically aggressive tumor that is highly resistant to standard chemotherapy and requires a much more intense regimen.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-year-old child treated for ALL presents to the ER with a temperature of 38.5°C and an ANC of 200/mm³. She has a Hickman line in place. Blood cultures are drawn. Which empiric antibiotic monotherapy is most appropriate to initiate immediately to cover the most lethal threat in neutropenic patients?', 
'["Vancomycin", "Cefepime (or Piperacillin-tazobactam)", "Metronidazole", "Fluconazole"]'::jsonb, 
1, 
'In febrile neutropenia, the immediate, most life-threatening risk is overwhelming sepsis from Gram-negative bacteria, particularly Pseudomonas aeruginosa, which can kill a neutropenic patient in hours. Therefore, the absolute standard of care is immediate empiric administration of a broad-spectrum, antipseudomonal beta-lactam antibiotic, such as Cefepime, Piperacillin-tazobactam, or Meropenem. Vancomycin is added only if there is a specific suspicion for a severe Gram-positive infection (e.g., obvious severe catheter-site infection or hemodynamic instability).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which pediatric brain tumor is classified as a primitive neuroectodermal tumor (PNET), arises exclusively in the cerebellum, and frequently spreads via the cerebrospinal fluid (drop metastases)?', 
'["Craniopharyngioma", "Pilocytic Astrocytoma", "Medulloblastoma", "Ependymoma"]'::jsonb, 
2, 
'Medulloblastoma is the classic pediatric PNET. It arises exclusively in the cerebellum (usually the midline vermis in children). Because it is a highly aggressive embryonal tumor growing adjacent to the 4th ventricle, it easily sheds cells into the cerebrospinal fluid, leading to leptomeningeal spread down the spinal cord or over the cerebral convexities ("drop metastases"). This necessitates imaging the entire neural axis (brain and spine MRI) for staging.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 12-year-old boy with a history of Osteosarcoma treated with Doxorubicin presents to the clinic 5 years later with fatigue, orthopnea, and bilateral pedal edema. An echocardiogram shows a dilated left ventricle with an ejection fraction of 30%. This irreversible complication is mediated by:', 
'["Direct viral infection of the myocardium", "Free radical damage to the myocardium caused by the anthracycline", "Autoimmune destruction of cardiac valves", "Radiation-induced accelerated coronary artery atherosclerosis"]'::jsonb, 
1, 
'Anthracyclines (like Doxorubicin and Daunorubicin) cause dose-dependent, cumulative, and irreversible dilated cardiomyopathy. The mechanism involves the drug generating reactive oxygen species (free radicals) within the myocardial cells. Because cardiac tissue has very low levels of antioxidant enzymes (like catalase), it is highly susceptible to this oxidative damage, leading to myofibril destruction and heart failure. Dexrazoxane (an iron chelator) is sometimes given prophylactically to reduce this free radical formation.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 3-year-old child presents with a retroperitoneal mass. Urine catecholamines are elevated. A biopsy confirms Neuroblastoma. Which of the following paraneoplastic syndromes is uniquely associated with neuroblastoma and is characterized by watery diarrhea and hypokalemia?', 
'["Opsoclonus-Myoclonus Syndrome", "Syndrome of Inappropriate Antidiuretic Hormone (SIADH)", "VIPoma syndrome (secretion of Vasoactive Intestinal Peptide)", "Cushing Syndrome"]'::jsonb, 
2, 
'While Opsoclonus-Myoclonus is a well-known neurological paraneoplastic syndrome of neuroblastoma, another important paraneoplastic presentation is the autonomous secretion of Vasoactive Intestinal Peptide (VIP) by the tumor cells. This causes WDHA syndrome (Watery Diarrhea, Hypokalemia, and Achlorhydria), leading to profound, intractable secretory diarrhea and severe electrolyte imbalances. The diarrhea resolves when the tumor is resected.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old boy is diagnosed with T-cell ALL. He receives a chemotherapy regimen containing Vincristine. He complains of constipation and severe pain in his jaw. Physical exam reveals a loss of the Achilles tendon reflex. These symptoms are caused by Vincristine''s effect on:', 
'["Microtubules in neuronal axons", "Topoisomerase II in DNA", "Calcium channels in smooth muscle", "Myelin sheaths produced by Schwann cells"]'::jsonb, 
0, 
'Vincristine is a vinca alkaloid that binds to tubulin and prevents the formation of microtubules. Microtubules are not only essential for cell division (the mitotic spindle) but are also the absolute structural basis for axonal transport in neurons. By destroying microtubules, vincristine halts axonal transport, leading to severe peripheral neuropathy (loss of deep tendon reflexes, foot drop), cranial neuropathy (jaw pain, vocal cord paralysis), and autonomic neuropathy (severe constipation/paralytic ileus).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 6-year-old boy presents with pallor, fatigue, and bone pain. A bone marrow aspirate shows 60% blasts. Flow cytometry shows the blasts are positive for CD13, CD33, and Myeloperoxidase (MPO), and negative for TdT and CD10. What is the diagnosis?', 
'["B-cell Acute Lymphoblastic Leukemia (B-ALL)", "T-cell Acute Lymphoblastic Leukemia (T-ALL)", "Acute Myeloid Leukemia (AML)", "Burkitt Lymphoma"]'::jsonb, 
2, 
'This flow cytometry profile is definitive for Acute Myeloid Leukemia (AML). The blasts are of myeloid lineage, confirmed by the presence of the myeloid surface antigens CD13 and CD33, and the critical intracellular enzyme Myeloperoxidase (MPO). They lack the lymphoid markers Terminal deoxynucleotidyl transferase (TdT) and CD10 (CALLA), which rules out ALL.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A pediatric patient with a newly diagnosed brain tumor requires surgical resection. The tumor is located in the posterior fossa. Following surgery, the patient develops "Cerebellar Mutism Syndrome." This syndrome is characterized by which of the following?', 
'["Permanent loss of the ability to form memories", "A delayed onset of transient, profound inability to speak, accompanied by emotional lability and ataxia", "Immediate, permanent vocal cord paralysis", "Uncontrollable, continuous vocalizations and tics"]'::jsonb, 
1, 
'Cerebellar mutism syndrome (also known as Posterior Fossa Syndrome) is a highly specific, distressing complication that occurs in up to 25% of children following resection of a large midline posterior fossa tumor (most commonly Medulloblastoma). It is uniquely characterized by a delayed onset (usually 1-2 days after a successful surgery). The child becomes completely mute (unable to speak), emotionally labile, and profoundly ataxic. Fortunately, it is usually transient, and speech slowly recovers over weeks to months, though mild deficits often remain.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 15-year-old female with Ewing Sarcoma is treated with intensive chemotherapy and local radiation. Five years later, she presents with fatigue and easy bruising. A bone marrow biopsy reveals myelodysplastic syndrome (MDS) with a complex karyotype involving abnormalities of chromosomes 5 and 7. This secondary malignancy is most likely a late complication of which class of drugs used in her initial treatment?', 
'["Vinca alkaloids (Vincristine)", "Alkylating agents (Cyclophosphamide, Ifosfamide)", "Antimetabolites (Methotrexate)", "Corticosteroids (Dexamethasone)"]'::jsonb, 
1, 
'Alkylating agents (like Cyclophosphamide, Ifosfamide, and Melphalan) directly damage DNA by causing cross-links. A severe, devastating late effect of these drugs is the development of therapy-related Myelodysplastic Syndrome (t-MDS) or secondary Acute Myeloid Leukemia (t-AML). Unlike topoisomerase II-induced secondary AML (which occurs quickly within 2-3 years and involves 11q23), alkylator-induced secondary leukemia typically occurs 5-10 years post-treatment, is often preceded by a myelodysplastic phase, and classically involves the loss or deletion of chromosomes 5 or 7. The prognosis for this secondary leukemia is exceedingly poor.')

;
