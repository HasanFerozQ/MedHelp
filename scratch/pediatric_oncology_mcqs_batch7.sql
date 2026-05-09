-- Batch 7: 30 Pediatric Oncology MCQs (Questions 181-210)
-- Note: Replace (SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1) with the actual topic_id for Pediatric Oncology Essentials

INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation) VALUES

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 2-year-old child presents with a retroperitoneal mass. A biopsy confirms localized neuroblastoma. The tumor cells lack MYCN amplification but have hyperdiploidy (abnormal DNA index > 1). The tumor is completely excised surgically. What is the standard postoperative management for this infant?', 
'["High-dose chemotherapy and autologous stem cell transplant", "Abdominal radiation therapy", "Observation without cytotoxic therapy", "Lifelong administration of isotretinoin"]'::jsonb, 
2, 
'In infants (<18 months old), localized neuroblastoma (Stage 1 or 2) with favorable biological features (no MYCN amplification, hyperdiploidy) has an extraordinarily high cure rate (>95%) with surgical resection alone. These tumors have a strong tendency to mature or spontaneously regress. Standard of care is careful observation without the need for toxic postoperative chemotherapy or radiation.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 3-year-old boy presents with an abdominal mass and hypertension. An ultrasound shows a mass originating from the right kidney. The surgeon suspects a Wilms tumor and schedules a nephrectomy. During the operation, which associated finding would immediately upstage this patient from Stage II to Stage III disease, altering the postoperative treatment plan?', 
'["The tumor is very large, measuring >10 cm in diameter", "Microscopic tumor invasion of the renal sinus vessels", "Spillage of tumor contents into the peritoneal cavity during resection", "The presence of favorable histology"]'::jsonb, 
2, 
'In Wilms tumor staging, Stage III denotes residual non-hematogenous tumor confined to the abdomen. A critical, surgeon-dependent factor that automatically upstages a patient to Stage III is tumor spillage during the operation (either spontaneous rupture before surgery or accidental rupture of the capsule during dissection). Spillage seeds the peritoneum with malignant cells, necessitating the addition of whole-abdomen radiation therapy to the treatment regimen.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 13-year-old girl is diagnosed with a high-grade Osteosarcoma of the distal femur. She is scheduled to receive a multi-agent chemotherapy regimen that includes high-dose Methotrexate, Doxorubicin, and Cisplatin (MAP regimen). Which of these three agents requires rigorous pre-hydration and the administration of mannitol to force diuresis in order to prevent severe, irreversible nephrotoxicity?', 
'["Methotrexate", "Doxorubicin", "Cisplatin", "All of the above"]'::jsonb, 
2, 
'While high-dose Methotrexate requires hydration and urinary alkalinization to prevent crystallization, Cisplatin is a heavy metal compound that directly damages the renal proximal tubules, causing severe, often irreversible acute tubular necrosis (nephrotoxicity). The standard protocol to prevent this specific heavy metal toxicity requires rigorous, aggressive intravenous pre-hydration with normal saline and the administration of a forced osmotic diuretic, like mannitol, to rapidly flush the cisplatin through the kidneys.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 16-year-old male presents with a painless, enlarging testicular mass. He undergoes a radical inguinal orchiectomy. Pathology reveals a mixed germ cell tumor. His serum alpha-fetoprotein (AFP) and beta-hCG are both elevated. Which specific component of the mixed tumor is responsible for the elevated AFP?', 
'["Seminoma", "Choriocarcinoma", "Yolk sac tumor", "Teratoma"]'::jsonb, 
2, 
'In testicular germ cell tumors, serum markers are highly specific to the tissue type. Elevated Alpha-fetoprotein (AFP) is specifically secreted by the Yolk Sac Tumor (Endodermal sinus tumor) component. Elevated beta-hCG is secreted by the Choriocarcinoma component (or sometimes by syncytiotrophoblastic giant cells within a seminoma). Pure seminomas and pure teratomas do not secrete AFP.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old boy with ALL presents to the ER with a temperature of 39.0°C and an absolute neutrophil count (ANC) of 0/mm³. He is admitted for neutropenic fever and started on broad-spectrum antibiotics. On day 3, he develops a dry cough, pleuritic chest pain, and a new nodular infiltrate with a "halo sign" on chest CT. What is the most likely infectious organism?', 
'["Pneumocystis jirovecii", "Cytomegalovirus (CMV)", "Aspergillus fumigatus", "Streptococcus pneumoniae"]'::jsonb, 
2, 
'In a patient with profound, prolonged neutropenia, the development of new pulmonary symptoms and a "halo sign" on a chest CT (a pulmonary nodule surrounded by a halo of ground-glass opacity, representing local hemorrhage) is highly characteristic of invasive pulmonary Aspergillosis (Aspergillus fumigatus). This fungal infection invades blood vessels, causing thrombosis and infarction. It requires immediate treatment with Voriconazole or Liposomal Amphotericin B.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old girl with a history of Ewing Sarcoma of the chest wall (Askin tumor) was treated with radiation therapy to her chest. Ten years later, she presents to a cardiologist with heart failure symptoms. Echocardiogram shows a thickened, fibrotic pericardium restricting diastolic filling (constrictive pericarditis). This is a known late effect of radiation therapy. Which of the following physical exam findings is classic for constrictive pericarditis?', 
'["A loud, holosystolic murmur at the apex", "A paradoxically split S2", "Kussmaul''s sign (an increase in jugular venous pressure on inspiration)", "Pulsus parvus et tardus"]'::jsonb, 
2, 
'Constrictive pericarditis is a severe late effect of mediastinal/chest radiation. The fibrotic, rigid pericardium prevents the right heart chambers from expanding to accommodate increased venous return during inspiration. This leads to Kussmaul''s sign: a paradoxical rise (or lack of fall) in the jugular venous pressure (JVP) during inspiration. (Normally, JVP falls during inspiration due to negative intrathoracic pressure). Another classic sign is a pericardial "knock" in early diastole.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 6-year-old boy presents with a solid abdominal mass and severe hypertension. Laboratory testing reveals elevated levels of renin in the peripheral blood. Which of the following pediatric tumors is classically associated with autonomous renin secretion, causing this secondary hypertension?', 
'["Neuroblastoma", "Hepatoblastoma", "Wilms tumor (Nephroblastoma)", "Pheochromocytoma"]'::jsonb, 
2, 
'Wilms tumor (Nephroblastoma) originates in the kidney. A unique feature of some Wilms tumors is their ability to autonomously secrete renin, leading to massive activation of the renin-angiotensin-aldosterone system (RAAS) and profound, renin-dependent hypertension. This can be a presenting symptom in up to 25% of cases. Neuroblastoma and pheochromocytoma cause hypertension via catecholamine secretion (epinephrine/norepinephrine).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 1-year-old infant is diagnosed with an atypical teratoid/rhabdoid tumor (ATRT) of the central nervous system. This is an extraordinarily aggressive, highly malignant embryonal tumor. The defining molecular hallmark of ATRT is the loss or mutation of which specific tumor suppressor gene?', 
'["TP53", "RB1", "SMARCB1 (INI1)", "PTEN"]'::jsonb, 
2, 
'Atypical Teratoid/Rhabdoid Tumor (ATRT) is a rare, devastating brain tumor that primarily affects infants and very young children. It is biologically defined by the biallelic inactivation (mutation or deletion) of the SMARCB1 (INI1) gene, which is located on chromosome 22q11.2 and encodes a core subunit of the SWI/SNF chromatin remodeling complex. The loss of INI1 protein expression on immunohistochemistry confirms the diagnosis.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 15-year-old male with Acute Promyelocytic Leukemia (APL) is successfully treated with ATRA and arsenic trioxide. Which defining genetic translocation is present in APL and is directly targeted by this therapy?', 
'["t(9;22) BCR-ABL1", "t(15;17) PML-RARA", "t(8;14) MYC-IGH", "t(12;21) ETV6-RUNX1"]'::jsonb, 
1, 
'Acute Promyelocytic Leukemia (APL), or AML subtype M3, is defined by the t(15;17) translocation. This fuses the Promyelocytic Leukemia (PML) gene on chromosome 15 with the Retinoic Acid Receptor Alpha (RARA) gene on chromosome 17. The resulting PML-RARA fusion protein blocks cellular differentiation at the promyelocyte stage. All-trans retinoic acid (ATRA) and arsenic trioxide specifically bind to and degrade this fusion protein, forcing the cells to differentiate and undergo apoptosis.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 4-year-old child presents with a painless, rapidly enlarging mass in the skeletal muscle of his thigh. A biopsy confirms Alveolar Rhabdomyosarcoma. To accurately stage this disease, which of the following areas MUST be evaluated for metastasis due to the tumor''s specific lymphatic drainage patterns?', 
'["The bone marrow via bilateral aspirates/biopsies", "The regional lymph nodes via imaging and/or sentinel node biopsy", "The cerebrospinal fluid via lumbar puncture", "Both A and B"]'::jsonb, 
3, 
'Rhabdomyosarcoma is highly aggressive and metastasizes early. Unlike many other sarcomas (which primarily spread hematogenously to the lungs), rhabdomyosarcoma has a strong propensity for both hematogenous spread (to lungs and bone marrow) AND lymphatic spread to regional lymph nodes. Therefore, accurate staging mandates evaluating the regional lymph node basin (clinically, radiographically, or surgically) AND performing bilateral bone marrow aspirates and biopsies to check for marrow infiltration.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which of the following classes of antineoplastic agents exerts its effect by intercalating between DNA base pairs, inhibiting Topoisomerase II, and generating oxygen free radicals, but carries a strict lifetime cumulative dose limit due to irreversible cardiotoxicity?', 
'["Alkylating agents", "Anthracyclines", "Vinca alkaloids", "Platinum compounds"]'::jsonb, 
1, 
'Anthracyclines (e.g., Doxorubicin, Daunorubicin, Epirubicin) are recognizable by their bright red color. They have multiple mechanisms of action (intercalation, Topo II inhibition, free radical generation). The generation of free radicals is highly toxic to the myocardium, causing dose-dependent, cumulative, and permanent dilated cardiomyopathy. Because of this, every patient has a strictly calculated "lifetime maximum cumulative dose" (e.g., usually around 400-450 mg/m² for doxorubicin) that cannot be exceeded.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 7-year-old girl with relapsed ALL receives a CD19-directed CAR-T cell infusion. Four days later, she develops a fever of 40.5°C, hypotension requiring vasopressors, and hypoxia requiring a ventilator. She is diagnosed with severe Cytokine Release Syndrome (CRS). Which specific drug is the FDA-approved first-line antidote to rapidly reverse this life-threatening inflammatory storm?', 
'["High-dose Dexamethasone", "Tocilizumab", "Infliximab", "Epinephrine"]'::jsonb, 
1, 
'Cytokine Release Syndrome (CRS) is driven by the massive release of cytokines, most prominently Interleukin-6 (IL-6), from the expanding CAR-T cells and activated macrophages. Tocilizumab is a monoclonal antibody that acts as a highly specific IL-6 receptor antagonist. Administering Tocilizumab rapidly blocks the IL-6 signaling pathway, dramatically reversing the fever, hypotension, and capillary leak associated with severe CRS without necessarily killing the therapeutic CAR-T cells. Corticosteroids are used as a second-line option.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 12-year-old boy is diagnosed with Hodgkin Lymphoma. He asks his doctor why his neck lymph node swelled up. The doctor explains the pathophysiology involving the Reed-Sternberg cell. What is the actual cellular origin of the malignant Reed-Sternberg cell in classical Hodgkin Lymphoma?', 
'["A cytotoxic T lymphocyte", "A germinal center B lymphocyte", "A macrophage", "An NK cell"]'::jsonb, 
1, 
'Despite their bizarre appearance and lack of standard B-cell surface markers (like CD20), molecular studies have definitively proven that the malignant Reed-Sternberg cells in classical Hodgkin Lymphoma are clonally derived from crippled, post-germinal center B lymphocytes that have failed to undergo normal apoptosis. They orchestrate the surrounding massive inflammatory response by secreting cytokines (like IL-5 and TGF-beta).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 3-year-old boy presents with an abdominal mass and right-sided aniridia (absence of the iris). He is diagnosed with a Wilms tumor. Genetic testing reveals a deletion on chromosome 11p13, confirming WAGR syndrome. Which specific gene deletion within this locus is responsible for the development of the Wilms tumor?', 
'["PAX6", "WT1", "WT2", "MYCN"]'::jsonb, 
1, 
'WAGR syndrome is a contiguous gene deletion syndrome on chromosome 11p13. The deletion encompasses two critical adjacent genes: the WT1 (Wilms Tumor 1) gene and the PAX6 gene. Deletion of the WT1 tumor suppressor gene directly causes the development of the Wilms tumor (and the associated Genitourinary anomalies). Deletion of the PAX6 gene directly causes the Aniridia and contributes to intellectual disability (Retardation).'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A pediatric patient requires prolonged intravenous access for multi-year chemotherapy. A totally implantable venous access device (Port-a-Cath) is surgically placed in the chest. Which vein is the most common target for the distal tip of this catheter to reside in order to ensure rapid dilution of highly irritating chemotherapy drugs?', 
'["Internal jugular vein", "Subclavian vein", "Cavoatrial junction (where the Superior Vena Cava meets the Right Atrium)", "Inferior Vena Cava"]'::jsonb, 
2, 
'To prevent severe chemical phlebitis and vessel sclerosis from caustic chemotherapy agents (vesicants and irritants), the tip of a central venous catheter (like a Port-a-Cath or Hickman) must be positioned in a large, high-flow vessel. The optimal location is the cavoatrial junction—the exact point where the Superior Vena Cava (SVC) empties into the Right Atrium. The massive blood flow here immediately dilutes the chemotherapy to safe levels.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-year-old girl is diagnosed with a low-grade brain tumor in her optic nerve. Her physical exam reveals multiple café-au-lait spots, axillary freckling, and Lisch nodules on her iris. She is diagnosed with Neurofibromatosis Type 1 (NF1). The NF1 gene normally codes for neurofibromin. What is the physiological function of neurofibromin?', 
'["It acts as a GTPase-activating protein (GAP) that turns off the RAS signaling pathway", "It is a tyrosine kinase receptor for epidermal growth factor", "It is a transcription factor that induces apoptosis", "It maintains telomere length"]'::jsonb, 
0, 
'Neurofibromin is a tumor suppressor protein that acts as a GTPase-activating protein (GAP). Its normal function is to bind to the active RAS protein (which is bound to GTP and driving cell growth) and accelerate the hydrolysis of GTP to GDP, effectively turning RAS "off." When the NF1 gene is mutated, neurofibromin is dysfunctional, leaving RAS permanently active. This unchecked RAS signaling drives the continuous cellular proliferation seen in the tumors of NF1 patients.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 15-year-old male receives a bone marrow transplant. Three weeks later, his neutrophil count recovers, but he develops a severe, peeling skin rash, copious green diarrhea, and jaundice. He is diagnosed with acute Graft-Versus-Host Disease (GVHD). Which class of medications is the first-line, standard-of-care therapy to treat acute GVHD?', 
'["High-dose systemic corticosteroids (e.g., Methylprednisolone)", "Monoclonal antibodies against CD20 (Rituximab)", "Antiviral therapy (Ganciclovir)", "Chemotherapy (Methotrexate)"]'::jsonb, 
0, 
'Acute GVHD is an intense, destructive immune response mediated by donor T cells attacking the host. The immediate, first-line therapy to rapidly suppress this T-cell-mediated attack and halt the inflammation is the administration of high-dose systemic corticosteroids (like IV Methylprednisolone). If the GVHD is steroid-refractory, second-line agents like Ruxolitinib (a JAK inhibitor) or anti-thymocyte globulin (ATG) are utilized.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 5-year-old child with standard-risk ALL is in the maintenance phase of therapy, receiving weekly oral Methotrexate. Routine lab work reveals significantly elevated liver transaminases (AST/ALT) and mild hepatomegaly. The physician suspects methotrexate-induced hepatotoxicity. What is the most appropriate management?', 
'["Perform a liver biopsy immediately to assess for cirrhosis", "Stop the Methotrexate permanently and switch to Cyclophosphamide", "Temporarily withhold the Methotrexate until the liver enzymes normalize, then restart at a lower dose or adjust the schedule", "Administer high-dose Leucovorin rescue"]'::jsonb, 
2, 
'Chronic oral methotrexate therapy frequently causes a transient, reversible elevation in liver transaminases (transaminitis). If the elevation is significant (e.g., >5 to 10 times the upper limit of normal), the standard protocol is to temporarily hold the drug. The liver enzymes almost always recover fully once the drug is stopped. The methotrexate can then be cautiously restarted, often at a reduced dose. Liver biopsies are rarely indicated in pediatric ALL maintenance unless irreversible liver failure is suspected. Leucovorin rescue is not used for chronic, low-dose maintenance toxicity.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 4-year-old boy presents with a firm abdominal mass. A biopsy confirms a Wilms tumor. Histological analysis reveals diffuse Anaplasia. Why does the presence of diffuse anaplasia significantly worsen the prognosis of Wilms tumor?', 
'["It indicates the tumor has already metastasized to the brain", "It makes the tumor highly resistant to standard cytotoxic chemotherapy and radiation", "It causes the tumor to secrete lethal levels of catecholamines", "It means the tumor cannot be surgically removed"]'::jsonb, 
1, 
'Diffuse anaplasia (characterized by massive hyperchromatic nuclei and abnormal, multipolar mitotic figures) is the hallmark of "unfavorable histology" in Wilms tumor. It is strongly correlated with mutations in the TP53 gene. Anaplastic cells are biologically highly resistant to the DNA damage caused by standard chemotherapy and radiation. Because they survive therapy, the risk of relapse and death is drastically higher, requiring the use of much more intense and toxic regimens.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 16-year-old female presents with a swelling in her distal femur. X-ray shows a lytic lesion with a "Codman triangle." Biopsy confirms Osteosarcoma. The patient asks why the tumor occurred in her knee. The oncologist explains that osteosarcoma is linked to rapid bone growth. During which physiological event does the incidence of osteosarcoma sharply peak?', 
'["During fetal development in utero", "During the toddler years (ages 1-3)", "During the adolescent growth spurt", "During the third trimester of pregnancy"]'::jsonb, 
2, 
'The incidence of primary Osteosarcoma has a distinct bimodal age distribution. The first and largest peak occurs strictly during the adolescent growth spurt (typically ages 13-16 for girls, 15-18 for boys). During this time, the epiphyseal growth plates at the metaphyses of the long bones (especially around the knee) are undergoing massive, rapid cellular proliferation and bone turnover, drastically increasing the statistical chance of a malignant mutation occurring in an osteoblast.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A pediatric patient with relapsed Neuroblastoma is treated with I-131 MIBG (Metaiodobenzylguanidine) therapy. What is the mechanism of action of this highly targeted radiopharmaceutical?', 
'["It is an antibody that binds to the GD2 receptor on the cell surface", "It is an analog of norepinephrine that is actively taken up by the norepinephrine transporter (NET) into the tumor cells, delivering targeted radiation", "It is a radioactive glucose analog that accumulates in highly metabolic cells", "It is a targeted inhibitor of the MYCN transcription factor"]'::jsonb, 
1, 
'Neuroblastoma cells, derived from the sympathetic nervous system, possess the Norepinephrine Transporter (NET) on their surface. MIBG (Metaiodobenzylguanidine) is a structural analog of norepinephrine. When injected, MIBG is actively pumped into the neuroblastoma cells via the NET. By attaching a radioactive Iodine-131 isotope to the MIBG molecule, the drug delivers a lethal dose of targeted, internal radiation directly and selectively to the neuroblastoma cells, sparing most normal tissues.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 7-year-old child is undergoing radiation therapy for a brain tumor. To prevent permanent damage to a critical endocrine organ that is highly sensitive to radiation, the radiation oncologist carefully shields the neck. Which organ is being protected?', 
'["The thymus", "The thyroid gland", "The parathyroid glands", "The pituitary gland"]'::jsonb, 
1, 
'The thyroid gland is exceptionally sensitive to ionizing radiation. Radiation exposure to the neck (even scatter radiation from treating the brain or chest) significantly increases the risk of developing hypothyroidism (often years later) and greatly increases the long-term risk of developing secondary thyroid cancer (especially papillary thyroid carcinoma). Whenever possible, the thyroid is shielded during radiation therapy to the head or upper body.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 3-year-old girl presents with a firm mass in her right flank. Ultrasound shows a large, homogeneous mass originating from the kidney. No other masses are found. The surgeon performs a radical nephrectomy. During the surgery, the tumor is removed completely intact, without any spillage. The renal capsule is pristine. What must the pathologist confirm microscopically to definitively assign this patient as Stage I?', 
'["The presence of anaplasia", "That the surgical margins are negative for tumor cells and the renal sinus vessels are not invaded", "That the tumor cells secrete renin", "That the tumor contains all three triphasic elements"]'::jsonb, 
1, 
'To officially be designated as Stage I Wilms tumor, the tumor must not only be completely excised and macroscopically intact, but the pathologist must confirm under the microscope that the surgical margins (the edges of the resected tissue) are completely free of tumor cells. Furthermore, there must be no microscopic evidence of tumor invading into the vessels of the renal sinus or penetrating through the renal capsule. If microscopic margins are positive, it becomes Stage III.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'Which of the following classes of chemotherapy drugs acts by inhibiting the enzyme ribonucleotide reductase, thereby depleting the cell of the deoxynucleotides required for DNA synthesis, and is frequently used to rapidly lower exceptionally high white blood cell counts (leukapheresis alternative)?', 
'["Hydroxyurea", "Methotrexate", "Cytarabine", "Mercaptopurine"]'::jsonb, 
0, 
'Hydroxyurea is an antimetabolite that specifically inhibits the enzyme ribonucleotide reductase. This enzyme is crucial for converting ribonucleotides into deoxyribonucleotides. By inhibiting it, hydroxyurea rapidly halts DNA synthesis (S-phase specific). Because it acts very quickly, it is often used in oncologic emergencies to rapidly cytoreduce (lower) massive white blood cell counts in patients with hyperleukocytosis to prevent leukostasis, while preparing for definitive chemotherapy.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 10-month-old infant presents with a massive liver. Biopsy confirms Hepatoblastoma. The tumor is deemed unresectable due to its size and involvement of major hepatic vessels. The patient receives neoadjuvant chemotherapy. What is the primary goal of this chemotherapy?', 
'["To cure the patient without surgery", "To shrink the tumor to make it amenable to complete surgical resection", "To palliate the patient''s pain", "To prevent the development of a secondary leukemia"]'::jsonb, 
1, 
'For pediatric solid tumors like Hepatoblastoma, Wilms tumor, and Osteosarcoma, complete surgical resection is absolutely required for a cure. If a tumor is initially deemed unresectable (too large, invading critical structures), neoadjuvant (pre-surgical) chemotherapy is administered. The primary, critical goal is to shrink the tumor mass and pull it away from vital structures, converting an "unresectable" tumor into a "resectable" one, allowing the surgeon to remove it completely.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 14-year-old male with Acute Myeloid Leukemia (AML) requires a hematopoietic stem cell transplant. He does not have a matched sibling. The registry finds an unrelated donor who is a 10/10 match at the HLA-A, B, C, DRB1, and DQB1 loci. Despite this perfect match, the patient is still at significant risk for Graft-Versus-Host Disease (GVHD). What is the primary immunological reason for this?', 
'["The donor T cells react to Minor Histocompatibility Antigens present on the recipient''s cells", "The HLA matching process is inherently inaccurate", "The recipient''s T cells attack the donor stem cells", "The patient''s immune system recognizes the donor''s blood type as foreign"]'::jsonb, 
0, 
'Even with a perfect 10/10 match at the Major Histocompatibility Complex (MHC/HLA) loci, patients receiving allogeneic transplants are still at high risk for GVHD. This is because the donor''s T cells can recognize and attack Minor Histocompatibility Antigens (mHAs). These are small polymorphic peptides derived from normal cellular proteins that differ slightly between individuals due to normal genetic variation. The donor T cells recognize these subtle differences on the recipient''s tissues as foreign.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 2-year-old child is diagnosed with Embryonal Rhabdomyosarcoma of the bladder. The tumor is localized. After induction chemotherapy, the tumor shrinks significantly. The next step is local control. Why might radiation therapy be preferred over radical surgical excision (e.g., radical cystoprostatectomy) in this specific scenario?', 
'["Radiation is more effective at killing rhabdomyosarcoma cells than surgery", "To preserve the anatomical structure and function of the bladder (organ preservation)", "Surgery is contraindicated in children under 5 years old", "Rhabdomyosarcomas always recur after surgery"]'::jsonb, 
1, 
'In the treatment of pediatric solid tumors (especially rhabdomyosarcoma and bone tumors), a major goal of modern protocols is organ and function preservation. A radical surgical excision of a bladder/prostate tumor in a 2-year-old would leave the child with a permanent urostomy and severe lifelong morbidity. Because embryonal rhabdomyosarcoma is highly radiosensitive, local control can often be achieved with targeted radiation therapy, sparing the organ and preserving the child''s quality of life and normal urinary function.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 6-year-old girl with ALL develops severe, localized pain and swelling at the site of her peripheral IV immediately after the nurse administers Daunorubicin. The skin around the IV site appears red and blistered. What has occurred, and what is the classification of Daunorubicin in this context?', 
'["Anaphylaxis; Daunorubicin is an allergen", "Extravasation; Daunorubicin is a vesicant", "Phlebitis; Daunorubicin is an irritant", "Infection; Daunorubicin is immunosuppressive"]'::jsonb, 
1, 
'This is a classic presentation of Extravasation, which occurs when a drug leaks out of the vein into the surrounding subcutaneous tissue. Daunorubicin (and all anthracyclines, as well as vinca alkaloids) are classified as Vesicants. A vesicant is a highly caustic chemical that causes severe, irreversible tissue necrosis, blistering, and sloughing if it escapes the vein. This is a medical emergency requiring immediate cessation of the infusion, aspiration of the drug, and application of specific antidotes (e.g., Dexrazoxane for anthracyclines) or cold compresses.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 12-year-old boy presents with a headache and visual disturbances. MRI reveals a mass in the pineal gland. Tumor markers are drawn from the serum and CSF. The markers show significantly elevated Beta-hCG and normal AFP. What is the most likely diagnosis for this pineal region tumor?', 
'["Germinoma", "Pineoblastoma", "Choriocarcinoma", "Yolk sac tumor"]'::jsonb, 
2, 
'The pineal gland is a common site for extragonadal germ cell tumors in the brain. The tumor markers are diagnostic. A Germinoma (the most common pineal tumor) typically has normal or mildly elevated beta-hCG and normal AFP. A Yolk Sac Tumor has elevated AFP and normal beta-hCG. A Choriocarcinoma is a highly malignant tumor that exclusively secretes massive amounts of Beta-hCG. A Pineoblastoma is a PNET (small round blue cell tumor) and does not secrete these germ cell markers.'),

((SELECT id FROM topics WHERE slug = 'peds-oncology' LIMIT 1), 
'A 16-year-old female treated for Hodgkin Lymphoma receives mantle field radiation. Because this radiation field includes the heart, she is at lifelong risk for cardiovascular complications. Which of the following is the most common *pericardial* complication associated with high-dose mediastinal radiation?', 
'["Acute purulent pericarditis", "Chronic constrictive pericarditis", "Cardiac tamponade", "Myxomatous degeneration of the mitral valve"]'::jsonb, 
1, 
'Radiation therapy to the chest causes chronic inflammation and progressive fibrosis of the tissues in the field. The pericardium is particularly susceptible. Years to decades after treatment, the pericardium can become heavily thickened, fibrotic, and rigid, leading to Chronic Constrictive Pericarditis. This rigid sac prevents the heart from expanding properly during diastole, causing right heart failure symptoms (edema, hepatomegaly, JVD). It often requires surgical stripping of the pericardium (pericardiectomy).')

;
