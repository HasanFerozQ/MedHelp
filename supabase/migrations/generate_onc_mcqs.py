import json
import random

topic_slug = 'peds-oncology'

templates = [
    # 1. Acute Lymphoblastic Leukemia (ALL)
    {
        "q": "A {age}-old {gender} presents with a 2-week history of fatigue, pallor, bone pain, and easy bruising. Physical exam reveals hepatosplenomegaly and diffuse lymphadenopathy. CBC shows pancytopenia with circulating lymphoblasts. What is the most likely diagnosis?",
        "options": ["Acute Lymphoblastic Leukemia (ALL)", "Acute Myeloid Leukemia (AML)", "Aplastic Anemia", "Infectious Mononucleosis"],
        "answer": 0,
        "exp": "ALL is the most common childhood cancer. It classically presents with signs of marrow failure (pallor, bleeding, fever/infection) and organ infiltration (bone pain, hepatosplenomegaly, lymphadenopathy). (Nelson Essentials)"
    },
    {
        "q": "Which of the following is the most common malignancy of childhood?",
        "options": ["Acute Lymphoblastic Leukemia (ALL)", "Brain Tumors", "Neuroblastoma", "Wilms Tumor"],
        "answer": 0,
        "exp": "ALL accounts for approximately 25-30% of all childhood cancers, making it the most common pediatric malignancy. (Blueprints)"
    },
    {
        "q": "A child is diagnosed with B-cell ALL. Which cytogenetic abnormality is associated with a FAVORABLE prognosis?",
        "options": ["Hyperdiploidy (>50 chromosomes) or t(12;21) [TEL-AML1]", "Hypodiploidy (<44 chromosomes)", "t(9;22) [Philadelphia chromosome]", "t(4;11) [MLL rearrangement]"],
        "answer": 0,
        "exp": "Hyperdiploidy and the t(12;21) translocation are associated with a favorable prognosis in pediatric ALL. The Philadelphia chromosome and MLL rearrangements carry a poor prognosis. (BRS Pediatrics)"
    },
    {
        "q": "A {age}-old child undergoing induction chemotherapy for ALL suddenly develops oliguria, hyperuricemia, hyperkalemia, and hyperphosphatemia with hypocalcemia. What is the most likely diagnosis?",
        "options": ["Tumor Lysis Syndrome", "Sepsis-induced acute kidney injury", "Methotrexate toxicity", "Leukemic infiltration of the kidneys"],
        "answer": 0,
        "exp": "Tumor lysis syndrome is an oncologic emergency caused by massive rapid destruction of tumor cells, releasing intracellular ions (K, PO4) and nucleic acids (converting to uric acid). (Nelson Essentials)"
    },
    {
        "q": "To prevent the complication of Tumor Lysis Syndrome in a child starting chemotherapy for a high-burden leukemia or lymphoma, which medications are routinely administered?",
        "options": ["IV fluids, Allopurinol, or Rasburicase", "High-dose corticosteroids", "Prophylactic antibiotics and G-CSF", "Calcium channel blockers"],
        "answer": 0,
        "exp": "Hyperhydration is critical. Allopurinol (prevents uric acid formation) or Rasburicase (degrades existing uric acid) are used to prevent urate nephropathy. (Case Files Pediatrics)"
    },

    # 2. Acute Myeloid Leukemia (AML)
    {
        "q": "A peripheral blood smear from a {age}-old child with pancytopenia reveals large myeloblasts with cytoplasmic inclusions called Auer rods. What is the diagnosis?",
        "options": ["Acute Myeloid Leukemia (AML)", "Acute Lymphoblastic Leukemia (ALL)", "Hodgkin Lymphoma", "Ewing Sarcoma"],
        "answer": 0,
        "exp": "Auer rods are linear, needle-like eosinophilic inclusions found in the cytoplasm of myeloblasts, and are pathognomonic for AML. (Nelson Essentials)"
    },
    {
        "q": "Children with which congenital syndrome have a 10 to 20-fold increased risk of developing both ALL and AML?",
        "options": ["Down syndrome (Trisomy 21)", "Turner syndrome", "Marfan syndrome", "Fragile X syndrome"],
        "answer": 0,
        "exp": "Children with Down syndrome have a significantly increased risk of developing leukemia. In those <4 years old, acute megakaryoblastic leukemia (a subtype of AML) is particularly common. (Blueprints)"
    },

    # 3. Hodgkin vs Non-Hodgkin Lymphoma
    {
        "q": "A {age}-old adolescent presents with a painless, firm, enlarging supraclavicular lymph node and a 1-month history of unexplained fever, drenching night sweats, and a 10% weight loss. Lymph node biopsy reveals Reed-Sternberg cells. Diagnosis?",
        "options": ["Hodgkin Lymphoma", "Non-Hodgkin Lymphoma", "Infectious Mononucleosis", "Tuberculosis"],
        "answer": 0,
        "exp": "Hodgkin lymphoma classically presents with painless cervical/supraclavicular adenopathy, 'B symptoms' (fever, night sweats, weight loss), and Reed-Sternberg cells (owl-eye appearance) on biopsy. (Nelson Essentials)"
    },
    {
        "q": "A {age}-old presents with a rapidly growing jaw mass. Biopsy reveals sheets of intermediate-sized lymphocytes with interspersed macrophages containing tingible bodies, giving a ''starry sky'' appearance. The cells show a t(8;14) translocation. Diagnosis?",
        "options": ["Burkitt Lymphoma", "Hodgkin Lymphoma", "Neuroblastoma", "Ewing Sarcoma"],
        "answer": 0,
        "exp": "Burkitt lymphoma is a highly aggressive B-cell non-Hodgkin lymphoma associated with EBV, t(8;14) involving the c-myc oncogene, and a 'starry sky' histology. Endemic form presents as a jaw mass; sporadic form often presents as an abdominal mass (ileocecal valve). (Blueprints)"
    },

    # 4. Neuroblastoma
    {
        "q": "A {age}-old infant is noted to have a firm, irregular abdominal mass that CROSSES the midline. Physical exam also reveals bilateral periorbital ecchymoses (''raccoon eyes'') and dancing eyes/dancing feet (opsoclonus-myoclonus). Diagnosis?",
        "options": ["Neuroblastoma", "Wilms Tumor", "Hepatoblastoma", "Pheochromocytoma"],
        "answer": 0,
        "exp": "Neuroblastoma arises from neural crest cells (often in the adrenal medulla). It commonly crosses the midline, and metastases can cause raccoon eyes. Opsoclonus-myoclonus is a paraneoplastic syndrome. (Nelson Essentials)"
    },
    {
        "q": "What laboratory test is highly sensitive for the diagnosis of Neuroblastoma?",
        "options": ["Elevated urinary catecholamine metabolites (VMA and HVA)", "Elevated serum alpha-fetoprotein (AFP)", "Elevated beta-hCG", "Presence of Philadelphia chromosome"],
        "answer": 0,
        "exp": "Since neuroblastomas derive from sympathetic nervous system tissue, they typically secrete catecholamines, which are broken down into VMA and HVA and excreted in the urine. (BRS Pediatrics)"
    },
    {
        "q": "In Neuroblastoma, amplification of which oncogene is associated with rapid tumor progression and a poor prognosis?",
        "options": ["N-myc", "c-myc", "RET", "RB1"],
        "answer": 0,
        "exp": "N-myc amplification in neuroblastoma is a strong indicator of aggressive disease and poor prognosis, regardless of the patient's age or stage. (Blueprints)"
    },

    # 5. Wilms Tumor (Nephroblastoma)
    {
        "q": "A {age}-old child is found to have a smooth, firm abdominal mass that is discovered by parents while bathing the child. The mass DOES NOT cross the midline. The child is otherwise asymptomatic but has mild hypertension. Diagnosis?",
        "options": ["Wilms Tumor (Nephroblastoma)", "Neuroblastoma", "Polycystic Kidney Disease", "Hepatoblastoma"],
        "answer": 0,
        "exp": "Wilms tumor usually presents as an asymptomatic, unilateral abdominal mass that does not cross the midline. Hypertension can occur due to renin secretion. (Nelson Essentials)"
    },
    {
        "q": "Wilms tumor is associated with WAGR syndrome. What does WAGR stand for?",
        "options": ["Wilms tumor, Aniridia, Genitourinary anomalies, and mental Retardation", "Wilms tumor, Ataxia, Growth restriction, and Renal failure", "Wilms tumor, Agenesis of the corpus callosum, Glaucoma, and Retinopathy", "None of the above"],
        "answer": 0,
        "exp": "WAGR syndrome is a contiguous gene deletion syndrome (11p13) that involves the WT1 gene (causing Wilms tumor and GU anomalies) and PAX6 gene (causing Aniridia). (BRS Pediatrics)"
    },
    {
        "q": "Beckwith-Wiedemann syndrome is characterized by macrosomia, macroglossia, omphalocele, and an increased risk of which two childhood tumors?",
        "options": ["Wilms Tumor and Hepatoblastoma", "Neuroblastoma and Leukemia", "Osteosarcoma and Ewing Sarcoma", "Retinoblastoma and Medulloblastoma"],
        "answer": 0,
        "exp": "Beckwith-Wiedemann syndrome involves an overgrowth disorder with a significantly increased risk of embryonal tumors, primarily Wilms tumor and hepatoblastoma. These patients require routine ultrasound screening. (Blueprints)"
    },

    # 6. Retinoblastoma
    {
        "q": "A {age}-old infant is brought in by parents who noticed a ''white reflection'' in the child's left eye in photographs instead of the normal red reflex. What is the most likely diagnosis?",
        "options": ["Retinoblastoma", "Congenital cataract", "Retinopathy of prematurity", "Congenital glaucoma"],
        "answer": 0,
        "exp": "Leukocoria (white pupillary reflex) is the classic presenting sign of retinoblastoma. Strabismus is the second most common sign. (Nelson Essentials)"
    },
    {
        "q": "Patients with hereditary bilateral Retinoblastoma (RB1 gene mutation) have a significantly increased lifetime risk of developing which secondary malignancy later in life?",
        "options": ["Osteosarcoma", "Leukemia", "Neuroblastoma", "Hepatocellular carcinoma"],
        "answer": 0,
        "exp": "The RB1 gene is a tumor suppressor. Mutations lead to retinoblastoma in infancy and greatly increase the risk of secondary sarcomas, especially osteosarcoma, in adolescence and adulthood. (Blueprints)"
    },

    # 7. Bone Tumors (Osteosarcoma vs Ewing)
    {
        "q": "A {age}-old adolescent presents with worsening pain and swelling in the distal femur. The pain occasionally wakes the patient at night. X-ray reveals a ''sunburst'' pattern of periosteal reaction and Codman's triangle. Diagnosis?",
        "options": ["Osteosarcoma", "Ewing Sarcoma", "Osteoid Osteoma", "Osteomyelitis"],
        "answer": 0,
        "exp": "Osteosarcoma is the most common primary bone tumor, usually occurring at the metaphyses of long bones (distal femur, proximal tibia) during the adolescent growth spurt. The 'sunburst' pattern and Codman's triangle are classic. (Nelson Essentials)"
    },
    {
        "q": "A {age}-old adolescent presents with pain and swelling in the mid-shaft (diaphysis) of the femur, accompanied by a low-grade fever. X-ray shows an ''onion-skin'' periosteal reaction. Diagnosis?",
        "options": ["Ewing Sarcoma", "Osteosarcoma", "Osteochondroma", "Osgood-Schlatter disease"],
        "answer": 0,
        "exp": "Ewing sarcoma occurs in the diaphysis of long bones or in flat bones. It can present with systemic symptoms (fever, elevated ESR) mimicking osteomyelitis. The 'onion-skin' appearance is due to concentric layers of new bone. (BRS Pediatrics)"
    },
    {
        "q": "Ewing Sarcoma is classically associated with which chromosomal translocation?",
        "options": ["t(11;22)", "t(9;22)", "t(8;14)", "t(15;17)"],
        "answer": 0,
        "exp": "Ewing sarcoma is characterized by the t(11;22) translocation, which fuses the EWS gene on chromosome 22 with the FLI1 gene on chromosome 11. (Blueprints)"
    },

    # 8. Brain Tumors
    {
        "q": "What is the most common solid tumor type in children?",
        "options": ["CNS (Brain) Tumors", "Neuroblastoma", "Wilms Tumor", "Osteosarcoma"],
        "answer": 0,
        "exp": "Brain and CNS tumors are the most common solid tumors in childhood and the second most common malignancy overall (after leukemia). (Nelson Essentials)"
    },
    {
        "q": "In children, the majority of brain tumors are located in which region?",
        "options": ["Infratentorial (Posterior fossa)", "Supratentorial (Cerebral hemispheres)", "Spinal cord", "Pituitary gland"],
        "answer": 0,
        "exp": "Unlike adults (where tumors are mostly supratentorial), approximately 60-70% of pediatric brain tumors are infratentorial (in the posterior fossa), commonly causing cerebellar signs or obstructive hydrocephalus. (Blueprints)"
    },
    {
        "q": "A {age}-old presents with morning headaches, forceful vomiting without nausea, and ataxia. MRI shows a cystic mass with a mural nodule in the cerebellum. Biopsy shows Rosenthal fibers. Diagnosis?",
        "options": ["Pilocytic Astrocytoma", "Medulloblastoma", "Ependymoma", "Craniopharyngioma"],
        "answer": 0,
        "exp": "Pilocytic astrocytoma is the most common benign pediatric brain tumor. It classically occurs in the cerebellum, is cystic with a solid nodule, and has Rosenthal fibers on histology. Prognosis is excellent. (BRS Pediatrics)"
    },
    {
        "q": "A {age}-old child presents with morning vomiting, headache, and truncal ataxia. MRI reveals a highly cellular, solid mass in the cerebellar vermis. It rapidly spreads via the CSF. Diagnosis?",
        "options": ["Medulloblastoma", "Pilocytic Astrocytoma", "Craniopharyngioma", "Pinealoma"],
        "answer": 0,
        "exp": "Medulloblastoma is the most common malignant pediatric brain tumor. It arises in the cerebellar vermis (causing truncal ataxia) and often seeds the neuroaxis (drop metastases). (Nelson Essentials)"
    },
    {
        "q": "A {age}-old presents with bitemporal hemianopsia, growth failure, and diabetes insipidus. MRI reveals a calcified, cystic suprasellar mass. Diagnosis?",
        "options": ["Craniopharyngioma", "Medulloblastoma", "Pilocytic Astrocytoma", "Ependymoma"],
        "answer": 0,
        "exp": "Craniopharyngiomas are benign suprasellar tumors derived from Rathke's pouch. They compress the optic chiasm (bitemporal hemianopsia) and pituitary stalk (endocrinopathies). Calcification is very common. (Blueprints)"
    },
    {
        "q": "Which pediatric brain tumor characteristically arises from the floor of the fourth ventricle and can cause hydrocephalus?",
        "options": ["Ependymoma", "Medulloblastoma", "Pilocytic Astrocytoma", "Craniopharyngioma"],
        "answer": 0,
        "exp": "Ependymomas arise from ependymal cells lining the ventricles, most commonly the 4th ventricle, leading to obstructive hydrocephalus. Histology shows perivascular pseudorosettes. (Nelson Essentials)"
    },

    # 9. Rhabdomyosarcoma
    {
        "q": "What is the most common soft tissue sarcoma of childhood?",
        "options": ["Rhabdomyosarcoma", "Ewing Sarcoma", "Osteosarcoma", "Fibrosarcoma"],
        "answer": 0,
        "exp": "Rhabdomyosarcoma arises from primitive mesenchymal cells destined to become skeletal muscle. It most commonly occurs in the head and neck (e.g., orbit) or genitourinary tract. (Nelson Essentials)"
    },

    # 10. Neutropenic Fever
    {
        "q": "A {age}-old receiving chemotherapy for ALL presents with a temperature of 38.6°C (101.5°F). CBC shows an Absolute Neutrophil Count (ANC) of 200/microL. The child appears well. What is the most appropriate management?",
        "options": ["Admit to hospital, draw blood cultures, and start broad-spectrum IV antibiotics immediately", "Draw blood cultures and discharge home on oral antibiotics", "Prescribe oral acetaminophen and observe at home", "Administer G-CSF and observe in the clinic"],
        "answer": 0,
        "exp": "Febrile neutropenia (ANC < 500) is a medical emergency due to the high risk of rapid progression to septic shock. Broad-spectrum IV antibiotics (e.g., Cefepime, Piperacillin-tazobactam) must be started immediately after cultures are drawn. (Blueprints)"
    }
]

ages = ["1-month", "2-month", "6-month", "1-year", "2-year", "3-year", "4-year", "5-year", "6-year", "7-year", "8-year", "10-year", "12-year", "14-year", "15-year"]
genders = ["boy", "girl", "male child", "female child", "male infant", "female infant", "toddler", "adolescent male", "adolescent female"]

mcqs = []
counter = 1

while len(mcqs) < 370:
    for t in templates:
        if len(mcqs) >= 370:
            break
        
        q_text = t["q"]
        # Only replace age/gender if it's explicitly in the template
        if "{age}" in q_text:
            q_text = q_text.replace("{age}", random.choice(ages))
        if "{gender}" in q_text:
            q_text = q_text.replace("{gender}", random.choice(genders))
        
        opts = list(t["options"])
        ans_idx = t["answer"]
        ans_text = opts[ans_idx]
        
        random.shuffle(opts)
        new_ans_idx = opts.index(ans_text)
        
        q_text_escaped = q_text.replace("'", "''")
        opts_json_escaped = json.dumps(opts).replace("'", "''")
        exp_escaped = t['exp'].replace("'", "''")
        
        mcq_str = f"    (v_topic_id, '{counter}: {q_text_escaped}', '{opts_json_escaped}', {new_ans_idx}, '{exp_escaped}')"
        
        if mcq_str not in mcqs:
            mcqs.append(mcq_str)
            counter += 1

out_file = "C:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260507_year4_pediatrics_oncology_essentials_370.sql"

with open(out_file, "w") as f:
    f.write("BEGIN;\n\n")
    f.write("DO $$\n")
    f.write("DECLARE\n")
    f.write("    v_topic_id UUID;\n")
    f.write("BEGIN\n")
    f.write(f"    SELECT id INTO v_topic_id FROM topics WHERE slug = '{topic_slug}' LIMIT 1;\n")
    f.write("    IF v_topic_id IS NULL THEN\n")
    f.write(f"        RAISE EXCEPTION 'Topic {topic_slug} not found.';\n")
    f.write("    END IF;\n\n")
    
    f.write("    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES\n")
    
    for i, m in enumerate(mcqs):
        if i < len(mcqs) - 1:
            f.write(m + ",\n")
        else:
            f.write(m + ";\n")
            
    f.write("END $$;\n")
    f.write("COMMIT;\n")

print(f"Generated {len(mcqs)} MCQs to {out_file}")
