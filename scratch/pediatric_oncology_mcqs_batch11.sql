-- Batch 11: 30 Pediatric Oncology MCQs (Questions 301-330)
-- Note: Replace (SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1) with the actual topic_id for Pediatric Oncology Essentials

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-year-old boy receives an allogeneic stem cell transplant. He requires a medication to prevent viral reactivation. He is placed on Acyclovir. What is the mechanism of action of Acyclovir against the Herpes Simplex Virus (HSV)?', 
'["It inhibits viral entry into the host cell", "It inhibits the viral protease enzyme", "It acts as a guanosine analog, causing premature DNA chain termination during viral replication", "It prevents the assembly and release of viral particles from the host cell"]'::jsonb, 
2, 
'Acyclovir is an antiviral drug specific for herpesviruses (HSV, VZV). It is a prodrug (a guanosine analog) that must first be phosphorylated by a specific viral enzyme called Thymidine Kinase. Because it relies on a viral enzyme for its initial activation, it is highly selective for infected cells. Once fully phosphorylated into a triphosphate form, it is incorporated into the growing viral DNA chain by the viral DNA polymerase. Because acyclovir lacks the 3''-hydroxyl group needed to attach the next nucleotide, it causes immediate DNA chain termination.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old girl is diagnosed with a low-grade Pilocytic Astrocytoma of the optic nerve. She also has multiple café-au-lait macules. The diagnosis is Neurofibromatosis Type 1 (NF1). In addition to optic pathway gliomas, patients with NF1 have a significantly increased risk of developing which highly malignant peripheral nerve sheath tumor?', 
'["Malignant Peripheral Nerve Sheath Tumor (MPNST)", "Ewing Sarcoma", "Osteosarcoma", "Burkitt Lymphoma"]'::jsonb, 
0, 
'Patients with NF1 develop numerous benign neurofibromas (tumors of the peripheral nerve sheaths) throughout their lives. The most feared complication is the malignant transformation of a pre-existing plexiform neurofibroma into a Malignant Peripheral Nerve Sheath Tumor (MPNST). This is a highly aggressive, rapidly growing sarcoma that is notoriously resistant to chemotherapy and radiation.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 16-year-old male with Ewing Sarcoma is treated with a regimen including Cyclophosphamide. To prevent a known, severe toxicity, the patient receives vigorous IV hydration and a drug called Mesna. How does Mesna specifically protect the bladder?', 
'["It coats the bladder wall with a protective lipid layer", "It acts as an osmotic diuretic, flushing the bladder rapidly", "Its free sulfhydryl group binds to and detoxifies acrolein in the urine", "It competitively inhibits the reabsorption of cyclophosphamide in the renal tubules"]'::jsonb, 
2, 
'Cyclophosphamide is metabolized in the liver to form the active alkylating agent and a toxic byproduct, Acrolein. Acrolein accumulates in the bladder and causes severe hemorrhagic cystitis. Mesna (2-mercaptoethane sulfonate sodium) is rapidly excreted into the urine, where its free sulfhydryl group binds directly to the toxic double bond of acrolein, forming a stable, non-toxic compound that is safely voided.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 4-year-old boy presents with a massive, firm, right-sided abdominal mass. Ultrasound shows it is intrarenal. A radical nephrectomy is performed. Pathology confirms Wilms tumor. The tumor was completely excised, but the surgeon noted that the tumor capsule was accidentally nicked and a small amount of tumor content spilled into the right flank. What is the new stage of this tumor based on this event?', 
'["Stage I", "Stage II", "Stage III", "Stage IV"]'::jsonb, 
2, 
'This scenario describes intraoperative tumor spillage. Even if the tumor was localized and completely removed, the act of spilling tumor contents (even a tiny amount) contaminates the peritoneal cavity with malignant cells. According to the National Wilms Tumor Study staging system, any tumor spillage (spontaneous or surgical) automatically designates the patient as Stage III, requiring the addition of abdominal radiation.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A pediatric patient with relapsed ALL is scheduled for a hematopoietic stem cell transplant. The conditioning regimen includes Total Body Irradiation (TBI). Which of the following organs is most acutely sensitive to radiation damage, often presenting with severe mucositis and diarrhea within the first week of therapy?', 
'["The heart", "The brain", "The gastrointestinal tract epithelium", "The kidneys"]'::jsonb, 
2, 
'Radiation therapy exerts its most profound cytotoxic effects on rapidly dividing cells. The epithelial lining of the gastrointestinal tract (from the mouth to the anus) has one of the highest cellular turnover rates in the human body. Therefore, the GI tract is acutely and exquisitely sensitive to radiation. Total Body Irradiation (TBI) predictably causes severe mucosal damage, resulting in painful oral mucositis, massive secretory diarrhea, and malabsorption within days.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 12-year-old boy with a history of Osteosarcoma presents to the clinic for a routine follow-up. He completed treatment 2 years ago. He is currently asymptomatic. Which imaging modality is the standard of care for routine surveillance to detect the most common site of osteosarcoma relapse?', 
'["Whole-body PET scan", "MRI of the original tumor site", "Bone scan", "CT scan of the chest without contrast"]'::jsonb, 
3, 
'Osteosarcoma almost exclusively metastasizes to the lungs via hematogenous spread. Because early detection of isolated pulmonary metastases is crucial (as they can be surgically cured), the gold standard for routine surveillance is a high-resolution CT scan of the chest without contrast. While an MRI of the primary site is also done, the lungs are the most critical area to monitor.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which of the following chemotherapeutic agents, frequently used in the treatment of pediatric brain tumors and lymphomas, acts as an alkylating agent, is highly emetogenic, and uniquely causes significant myelosuppression (particularly thrombocytopenia) that is delayed, often occurring 4-6 weeks after administration?', 
'["Carmustine (BCNU) / Lomustine (CCNU)", "Vincristine", "Methotrexate", "Bleomycin"]'::jsonb, 
0, 
'Carmustine (BCNU) and Lomustine (CCNU) are nitrosoureas. They are highly lipid-soluble, allowing them to cross the blood-brain barrier. A unique and defining clinical characteristic of nitrosoureas is their profound and delayed myelosuppression. Unlike most chemotherapy drugs that cause a nadir at 10-14 days, nitrosoureas typically cause a severe drop in platelets and white blood cells that does not occur until 4 to 6 weeks after the dose is given.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old girl is diagnosed with a giant cell tumor of the bone located in the distal femur. While giant cell tumors are generally considered benign, they are locally aggressive. What is the characteristic radiographic appearance of this tumor?', 
'["A sunburst pattern with periosteal elevation", "An onion-skin periosteal reaction", "A well-defined, radiolucent (lytic) lesion located in the epiphysis, extending to the articular surface", "A small sclerotic nidus surrounded by thick bone"]'::jsonb, 
2, 
'Giant Cell Tumor of Bone (Osteoclastoma) is a locally aggressive, usually benign tumor that typically arises after the growth plates have closed. Its classic radiographic location is absolutely definitive: it arises in the epiphysis (the very end of the bone) and grows right up to the articular cartilage. It appears as a "soap bubble" or purely lytic, well-defined radiolucency.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old boy presents with a rapidly growing mass in his jaw. Biopsy confirms Endemic Burkitt Lymphoma. The tumor cells are driven by a massive overproduction of the c-myc protein. What is the normal physiological function of the c-myc protein?', 
'["It is a cell surface receptor that binds growth factors", "It is an intracellular tyrosine kinase that phosphorylates downstream targets", "It is a nuclear transcription factor that strongly promotes cell cycle progression from G1 to S phase", "It is a tumor suppressor that triggers apoptosis when DNA damage is detected"]'::jsonb, 
2, 
'The c-myc gene (located on chromosome 8) is a powerful proto-oncogene. Its protein product is a nuclear transcription factor. When a cell needs to divide, c-myc binds to DNA and massively upregulates the transcription of numerous genes required for the cell to transition from the resting (G1) phase into the DNA synthesis (S) phase. In Burkitt Lymphoma, the t(8;14) translocation leads to constant, unregulated c-myc production.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A pediatric patient with a high-risk neuroblastoma completes intensive chemotherapy, surgery, and radiation. The patient then undergoes an autologous stem cell transplant. Following recovery, the final phase of therapy involves the administration of Dinutuximab, GM-CSF, and IL-2. What is the mechanism by which Dinutuximab targets the residual neuroblastoma cells?', 
'["It acts as a radioactive isotope to deliver localized radiation", "It forces the tumor cells to differentiate into mature ganglion cells", "It is a monoclonal antibody that binds to the GD2 antigen on the tumor surface, triggering antibody-dependent cellular cytotoxicity (ADCC)", "It inhibits the MYCN transcription factor directly"]'::jsonb, 
2, 
'Dinutuximab is a chimeric monoclonal antibody. Its specific target is GD2, a disialoganglioside highly expressed on the surface of neuroblastoma cells. When Dinutuximab binds to GD2 on the tumor cell, it acts as a "flag" for the patient''s immune system. It strongly activates Natural Killer (NK) cells and macrophages to attack and destroy the tumor cell via Antibody-Dependent Cellular Cytotoxicity (ADCC).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-year-old child presents with a headache and progressive visual loss. An MRI reveals a calcified, cystic mass in the suprasellar region. The child also complains of constant thirst and frequent urination. The tumor is diagnosed as a Craniopharyngioma. The excessive thirst and urination are a result of the tumor compressing which anatomical structure?', 
'["The optic chiasm", "The pineal gland", "The pituitary stalk (infundibulum) or hypothalamus", "The fourth ventricle"]'::jsonb, 
2, 
'Craniopharyngiomas grow in the suprasellar space. As they enlarge, they frequently compress the overlying hypothalamus and the pituitary stalk (infundibulum). This compression disrupts the transport of Antidiuretic Hormone (ADH, vasopressin) from the hypothalamus down to the posterior pituitary gland. The resulting lack of ADH secretion causes Central Diabetes Insipidus, characterized by massive polyuria and polydipsia.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 6-year-old girl is diagnosed with a standard-risk ALL. She receives L-Asparaginase during induction. Two weeks later, she presents with sudden onset weakness of her right arm and leg and difficulty speaking. An MRI of the brain confirms an ischemic stroke. What is the mechanism by which L-Asparaginase caused this severe complication?', 
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
'Neuroblastoma originates from primitive neural crest cells. To distinguish it from other small round blue cell tumors (like Ewing sarcoma, rhabdomyosarcoma, or lymphoma), pathologists use immunohistochemical stains specific to neural tissue. Neuron-Specific Enolase (NSE), Synaptophysin, and Chromogranin A are strongly positive in neuroblastoma.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old boy is brought to the clinic for persistent morning headaches and recurrent vomiting that is worse when waking up. He also has a new-onset head tilt. An MRI reveals a mass in the posterior fossa, specifically located in the cerebellar hemisphere, not the midline. The tumor appears largely cystic with a solid mural nodule. What is the most likely diagnosis?', 
'["Medulloblastoma", "Pilocytic Astrocytoma", "Ependymoma", "Atypical Teratoid/Rhabdoid Tumor (ATRT)"]'::jsonb, 
1, 
'Pilocytic Astrocytoma is the most common pediatric brain tumor. While Medulloblastomas typically arise in the midline cerebellar vermis and are solid, Pilocytic Astrocytomas most frequently arise in the cerebellar hemispheres. The classic radiographic appearance is a large cyst containing a solid, enhancing mural nodule. They are WHO Grade 1 (benign) tumors, and complete surgical resection of the nodule is usually curative.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 16-year-old male with classical Hodgkin Lymphoma is started on the ABVD regimen. He asks the oncologist about the long-term risk of infertility. The oncologist explains that while ABVD can cause temporary oligospermia, it is much less gonadotoxic than older regimens. Which older, highly effective chemotherapy regimen for Hodgkin Lymphoma was notorious for causing permanent sterility (azoospermia) in nearly 100% of male patients?', 
'["MOPP (Mechlorethamine, Oncovin/Vincristine, Procarbazine, Prednisone)", "CHOP (Cyclophosphamide, Doxorubicin, Vincristine, Prednisone)", "BEACOPP (Bleomycin, Etoposide, Adriamycin, Cyclophosphamide, Oncovin, Procarbazine, Prednisone)", "COPP (Cyclophosphamide, Oncovin, Procarbazine, Prednisone)"]'::jsonb, 
0, 
'The MOPP regimen was the first highly successful combination chemotherapy for Hodgkin Lymphoma. However, because it contained heavily alkylating agents (Mechlorethamine and Procarbazine), it was profoundly gonadotoxic. It caused permanent, irreversible sterility (azoospermia) in virtually 100% of adult males treated with it. ABVD was developed specifically to be less toxic, largely preserving long-term fertility, and replaced MOPP as the standard of care.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 4-year-old girl is receiving multi-agent chemotherapy for a Wilms tumor. She suddenly develops a high fever and a rapidly spreading, painful, erythematous rash over her face and trunk. The rash progresses to form flaccid bullae, and her skin begins to slough off in large sheets (positive Nikolsky sign), involving the mucous membranes. Which of the following is the most likely diagnosis?', 
'["Staphylococcal Scalded Skin Syndrome", "Steven-Johnson Syndrome (SJS) / Toxic Epidermal Necrolysis (TEN)", "Radiation recall dermatitis", "Graft-Versus-Host Disease (GVHD)"]'::jsonb, 
1, 
'Steven-Johnson Syndrome (SJS) and its more severe form, Toxic Epidermal Necrolysis (TEN), are severe, life-threatening, immune-mediated hypersensitivity reactions, most commonly triggered by medications. In pediatric oncology, common culprits include certain chemotherapies (like methotrexate or thiopurines), antibiotics (sulfamethoxazole/trimethoprim, penicillins), and allopurinol. It presents with a prodrome of fever followed by a widespread blistering rash, mucosal ulceration, and full-thickness epidermal necrosis and detachment.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old boy presents with a firm mass in his right thigh. Biopsy confirms an Alveolar Soft Part Sarcoma (ASPS). This is a rare, indolent but highly metastatic soft tissue sarcoma. Unlike most other soft tissue sarcomas which metastasize primarily to the lungs, ASPS has a very high propensity for metastasizing to which unique location?', 
'["The bone marrow", "The brain", "The regional lymph nodes", "The skin"]'::jsonb, 
1, 
'Alveolar Soft Part Sarcoma (ASPS) is unique among soft tissue sarcomas. While it grows slowly (indolent primary tumor), it is highly vascular and metastasizes early. A hallmark clinical feature of ASPS is its remarkably high rate of metastasis to the brain. In many cases, the patient presents first with neurological symptoms from brain metastases before the primary thigh tumor is even noticed. Routine brain MRI is mandatory for staging and surveillance of ASPS.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 7-year-old child with relapsed ALL undergoes a bone marrow transplant. Thirty days post-transplant, he presents with fever, jaundice, and a painful, enlarged liver. Laboratory tests show elevated bilirubin and transaminases. Ultrasound shows reversed portal venous flow. He is diagnosed with Sinusoidal Obstruction Syndrome (SOS), formerly known as Veno-Occlusive Disease (VOD). What is the FDA-approved specific medical treatment for severe SOS?', 
'["High-dose Corticosteroids", "Tissue Plasminogen Activator (tPA)", "Defibrotide", "Ursodeoxycholic acid"]'::jsonb, 
2, 
'Sinusoidal Obstruction Syndrome (SOS/VOD) is caused by toxic damage to the hepatic sinusoidal endothelial cells from high-dose conditioning chemotherapy or radiation. The cells slough off and form microthrombi, blocking hepatic venous outflow. The specific, FDA-approved treatment for severe SOS with multi-organ dysfunction is Defibrotide. Defibrotide is a polydeoxyribonucleotide that protects endothelial cells, enhances local fibrinolysis (without causing systemic bleeding), and reduces inflammation, restoring patency to the sinusoids.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 12-year-old girl is diagnosed with a malignant ovarian germ cell tumor. She is treated with the standard BEP regimen. The BEP regimen consists of Bleomycin, Etoposide, and which third highly active agent?', 
'["Paclitaxel", "Cisplatin", "Vincristine", "Doxorubicin"]'::jsonb, 
1, 
'The BEP regimen is the gold-standard, highly curative chemotherapy protocol for both ovarian and testicular malignant germ cell tumors (like yolk sac tumors, dysgerminomas/seminomas, and embryonal carcinomas). It consists of Bleomycin, Etoposide, and Cisplatin. Cisplatin is the core active agent in this regimen, responsible for the massive improvement in survival rates for germ cell tumors since its introduction in the 1970s.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which of the following is a classic clinical presentation of an olfactory neuroblastoma (Esthesioneuroblastoma), a rare tumor arising from the olfactory epithelium in the nasal cavity?', 
'["Painless, unilateral proptosis", "Unilateral nasal obstruction, epistaxis (nosebleeds), and anosmia (loss of smell)", "Progressive hearing loss and tinnitus", "Seizures and personality changes"]'::jsonb, 
1, 
'Esthesioneuroblastoma (olfactory neuroblastoma) is a rare malignant tumor of neural crest origin that arises strictly from the specialized olfactory epithelium at the roof of the nasal cavity (the cribriform plate). Because of its location, it classically presents with unilateral nasal obstruction, frequent epistaxis (nosebleeds), and anosmia (loss of the sense of smell). As it grows, it can invade through the cribriform plate into the anterior cranial fossa or orbit.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old boy is diagnosed with standard-risk ALL. He receives L-Asparaginase. The nurse monitors him closely for the first hour of the infusion. What is the most common, acute, potentially life-threatening complication that can occur within minutes of administering L-Asparaginase (especially non-pegylated forms derived from E. coli)?', 
'["Acute Pancreatitis", "Hypersensitivity reaction / Anaphylaxis", "Ischemic stroke", "Hemorrhagic cystitis"]'::jsonb, 
1, 
'L-Asparaginase is a large, foreign protein derived from bacteria (Escherichia coli or Erwinia chrysanthemi). Because it is a foreign protein, it is highly immunogenic. The most common acute, life-threatening complication is a severe hypersensitivity reaction or frank anaphylaxis, occurring in up to 10-20% of patients. It typically presents with urticaria, wheezing, hypotension, and respiratory distress shortly after the infusion begins. Patients are premedicated, and epinephrine must be readily available.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 15-year-old male with a history of intensive pelvic radiation for Ewing Sarcoma is evaluated 10 years later. He is found to have a new primary tumor in his bladder. This secondary solid tumor is most likely what histological type, which is strongly associated with prior radiation therapy?', 
'["Transitional cell carcinoma (Urothelial carcinoma)", "Squamous cell carcinoma", "Adenocarcinoma", "Rhabdomyosarcoma"]'::jsonb, 
0, 
'Radiation therapy to the pelvis significantly increases the risk of developing secondary bladder cancer later in life. The most common histological type of radiation-induced bladder cancer is Transitional Cell Carcinoma (now called Urothelial Carcinoma), which is the same histology as the most common primary bladder cancer in adults. This risk is further magnified if the patient also received Cyclophosphamide (which damages the bladder epithelium via acrolein).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 3-year-old child presents with a retroperitoneal mass. A biopsy confirms a localized neuroblastoma. The tumor cells lack MYCN amplification but have hyperdiploidy (abnormal DNA index > 1). The tumor is completely excised surgically. What is the standard postoperative management for this infant?', 
'["High-dose chemotherapy and autologous stem cell transplant", "Abdominal radiation therapy", "Observation without cytotoxic therapy", "Lifelong administration of isotretinoin"]'::jsonb, 
2, 
'In infants (<18 months old), localized neuroblastoma (Stage 1 or 2) with favorable biological features (no MYCN amplification, hyperdiploidy) has an extraordinarily high cure rate (>95%) with surgical resection alone. These tumors have a strong tendency to mature or spontaneously regress. Standard of care is careful observation without the need for toxic postoperative chemotherapy or radiation.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 12-year-old girl is diagnosed with a high-grade Osteosarcoma. She receives high-dose Methotrexate. Which of the following statements about Methotrexate toxicity and its management is correct?', 
'["Methotrexate toxicity is primarily managed with Mesna", "Leucovorin rescue must be started 24 hours after the Methotrexate infusion begins, not before, to allow the Methotrexate time to kill the tumor cells", "Methotrexate requires urinary acidification to prevent precipitation", "Methotrexate cardiotoxicity is cumulative and irreversible"]'::jsonb, 
1, 
'High-dose Methotrexate is lethally toxic to normal cells. To "rescue" the normal cells (bone marrow, GI mucosa), Leucovorin (active folate) is given. However, the timing is critical. If given too early or concurrently, it rescues the tumor cells as well. The standard protocol dictates starting Leucovorin exactly 24 hours after the start of the Methotrexate infusion.'),

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
'Cerebellar mutism syndrome (also known as Posterior Fossa Syndrome) is a highly specific, distressing complication that occurs in up to 25% of children following resection of a large midline posterior fossa tumor (most commonly Medulloblastoma). It is uniquely characterized by a delayed onset (usually 1-2 days after a successful surgery). The child becomes completely mute (unable to speak), emotionally labile, and profoundly ataxic.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 15-year-old female with Ewing Sarcoma is treated with intensive chemotherapy and local radiation. Five years later, she presents with fatigue and easy bruising. A bone marrow biopsy reveals myelodysplastic syndrome (MDS) with a complex karyotype involving abnormalities of chromosomes 5 and 7. This secondary malignancy is most likely a late complication of which class of drugs used in her initial treatment?', 
'["Vinca alkaloids (Vincristine)", "Alkylating agents (Cyclophosphamide, Ifosfamide)", "Antimetabolites (Methotrexate)", "Corticosteroids (Dexamethasone)"]'::jsonb, 
1, 
'Alkylating agents (like Cyclophosphamide, Ifosfamide, and Melphalan) directly damage DNA by causing cross-links. A severe, devastating late effect of these drugs is the development of therapy-related Myelodysplastic Syndrome (t-MDS) or secondary Acute Myeloid Leukemia (t-AML). Unlike topoisomerase II-induced secondary AML, alkylator-induced secondary leukemia typically occurs 5-10 years post-treatment, is often preceded by a myelodysplastic phase, and classically involves the loss or deletion of chromosomes 5 or 7.')

;
