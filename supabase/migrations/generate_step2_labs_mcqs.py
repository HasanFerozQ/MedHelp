import json
import random

topic_slug = 'case-labs-imaging'

templates = [
    # ─── PLEURAL EFFUSION (LIGHT'S CRITERIA) ───
    {
        "q": "A {age}-old {gender} is evaluated for progressive dyspnea and dullness to percussion at the left lung base. Diagnostic thoracentesis is performed, and pleural fluid analysis yields the following results:<br>• Pleural fluid protein: <b>{pf_prot:.1f} g/dL</b><br>• Serum protein: <b>{ser_prot:.1f} g/dL</b><br>• Pleural fluid LDH: <b>{pf_ldh} U/L</b><br>• Serum LDH: <b>{ser_ldh} U/L</b> (normal upper limit: 90 U/L)<br><br>What is the most appropriate classification of this pleural effusion, and what is its most likely underlying etiology?",
        "options": [
            "Exudate, secondary to a parapneumonic effusion or malignancy",
            "Transudate, secondary to congestive heart failure",
            "Transudate, secondary to liver cirrhosis with hepatic hydrothorax",
            "Exudate, secondary to nephrotic syndrome",
            "Chylothorax, secondary to thoracic duct disruption"
        ],
        "answer": 0,
        "exp": "According to Light's criteria, a pleural effusion is classified as an **exudate** if it meets at least one of the following: (1) Pleural fluid protein / Serum protein ratio > 0.5, (2) Pleural fluid LDH / Serum LDH ratio > 0.6, or (3) Pleural fluid LDH > 2/3 the upper limit of normal for serum LDH. Here, the protein ratio is >0.5 and the LDH ratio is >0.6, indicating an exudative effusion. Common causes of exudative effusions include parapneumonic effusions (infection), malignancies, pulmonary embolisms, and tuberculosis. Transudative effusions are caused by systemic factors like congestive heart failure, cirrhosis, or nephrotic syndrome."
    },

    # ─── CSF ANALYSIS ───
    {
        "q": "A {age}-old {gender} is brought to the emergency department due to a 24-hour history of severe headache, high fever, and altered mental status. On physical examination, they have neck stiffness and a positive Brudzinski sign. Lumbar puncture is performed, and cerebrospinal fluid (CSF) analysis reveals:<br>• Opening pressure: <b>{op} mm H2O</b> (normal: 50-180)<br>• White blood cell count: <b>{wbc} /uL</b> (normal: 0-5) with 92% polymorphonuclear leukocytes<br>• Protein: <b>{prot} mg/dL</b> (normal: 15-45)<br>• Glucose: <b>{gluc} mg/dL</b> (serum glucose is {ser_gluc} mg/dL)<br><br>What is the most likely diagnosis?",
        "options": [
            "Acute bacterial meningitis",
            "Viral aseptic meningitis",
            "Fungal or tuberculous meningitis",
            "Multiple sclerosis exacerbation",
            "Guillain-Barre syndrome"
        ],
        "answer": 0,
        "exp": "This CSF profile is highly classic for **acute bacterial meningitis**, characterized by: (1) a markedly elevated opening pressure, (2) severe polymorphonuclear (neutrophilic) pleocytosis, (3) a significantly elevated protein level due to blood-brain barrier disruption, and (4) a markedly reduced glucose level (typically <40 mg/dL or a CSF-to-serum glucose ratio <0.4) because bacteria utilize glucose for energy. Empirical treatment with intravenous cephalosporins (e.g., ceftriaxone), vancomycin, and corticosteroids (dexamethasone) should be initiated immediately."
    },
    {
        "q": "A {age}-old {gender} presents with progressive ascending motor weakness and areflexia over the past 3 days. A lumbar puncture is performed, and cerebrospinal fluid (CSF) analysis reveals:<br>• Protein level: <b>{prot_gb} mg/dL</b> (normal: 15-45)<br>• White blood cell count: <b>{wbc_gb} cells/uL</b> (normal: 0-5)<br><br>What is the term for this CSF pattern, and what is the most likely diagnosis?",
        "options": [
            "Albuminocytologic dissociation, indicating Guillain-Barre syndrome",
            "Oligoclonal bands, indicating Multiple Sclerosis",
            "Polymorphonuclear pleocytosis, indicating bacterial meningitis",
            "Lymphocytic pleocytosis, indicating viral encephalitis",
            "Xanthochromia, indicating subarachnoid hemorrhage"
        ],
        "answer": 0,
        "exp": "The cerebrospinal fluid (CSF) finding of an elevated protein level in the presence of a normal white blood cell count is known as **albuminocytologic dissociation**. This is the classic hallmark of **Guillain-Barre syndrome (GBS)** (acute inflammatory demyelinating polyradiculoneuropathy), which typically presents as progressive, symmetric, ascending muscle weakness and areflexia, often following a gastrointestinal (e.g., Campylobacter jejuni) or respiratory infection. The elevated protein is due to severe inflammation of the myelin sheaths of nerve roots."
    },

    # ─── ABG / ACID-BASE ───
    {
        "q": "A {age}-old {gender} with type 1 diabetes is brought to the emergency department unresponsive. Their arterial blood gas (ABG) shows:<br>• pH: <b>{ph:.2f}</b><br>• pCO2: <b>{pco2} mmHg</b><br>• HCO3: <b>{hco3} mEq/L</b><br><br>Serum sodium is <b>{na} mEq/L</b> and chloride is <b>{cl} mEq/L</b>. What is the acid-base disturbance, and what is the expected respiratory compensation?",
        "options": [
            "High anion gap metabolic acidosis with appropriate respiratory compensation",
            "Primary respiratory acidosis with metabolic compensation",
            "Normal anion gap metabolic acidosis with respiratory alkalosis",
            "Mixed high anion gap metabolic acidosis and respiratory acidosis",
            "Primary metabolic alkalosis with respiratory compensation"
        ],
        "answer": 0,
        "exp": "The pH is low (<7.35), indicating an acidemia. The low HCO3 indicates a metabolic acidosis. The anion gap is calculated as Na - (Cl + HCO3), which is elevated (>12), confirming a high anion gap metabolic acidosis (HAGMA), classic for Diabetic Ketoacidosis (DKA). Using Winter's formula (expected pCO2 = 1.5 * HCO3 + 8 +/- 2) to evaluate respiratory compensation: the measured pCO2 falls directly within the expected range, indicating appropriate respiratory compensation (hyperventilation/Kussmaul breathing) and no secondary respiratory disturbance."
    },

    # ─── SYNOVIAL FLUID ANALYSIS ───
    {
        "q": "A {age}-old {gender} presents with acute, severe pain, swelling, and erythema in the right first metatarsophalangeal (MTP) joint. Arthrocentesis is performed, and synovial fluid examination under polarized light microscopy demonstrates needle-shaped crystals that are strongly negatively birefringent (bright yellow when parallel to the slow vibration axis of the compensator). What is the most likely composition of these crystals, and what is the diagnosis?",
        "options": [
            "Monosodium urate crystals, indicating acute gouty arthritis",
            "Calcium pyrophosphate dihydrate (CPPD) crystals, indicating pseudogout",
            "Calcium oxalate crystals, indicating end-stage renal disease arthritis",
            "Cholesterol crystals, indicating rheumatoid arthritis",
            "Hydroxyapatite crystals, indicating calcific tendinitis"
        ],
        "answer": 0,
        "exp": "Synovial fluid analysis showing **needle-shaped, strongly negatively birefringent** crystals under polarized light is the pathognomonic diagnostic hallmark of **acute gouty arthritis**. These crystals are composed of **monosodium urate**. Gout classically presents as a painful, erythematous monoarthritis affecting the first MTP joint (podagra). In contrast, pseudogout (CPPD) crystals are rhomboid-shaped and weakly positively birefringent (blue when parallel to the compensator)."
    },

    # ─── THYROID PATHOLOGY / BIOPSY ───
    {
        "q": "A {age}-old {gender} undergoes a fine-needle aspiration (FNA) biopsy of a 2.1 cm solid thyroid nodule. Histopathologic examination of the aspirate reveals cells with large nuclei, fine chromatin, prominent nucleoli, and characteristic intranuclear inclusions, along with 'Orphan Annie eye' nuclei and scattered Psammoma bodies. What is the most likely diagnosis?",
        "options": [
            "Papillary thyroid carcinoma",
            "Follicular thyroid carcinoma",
            "Medullary thyroid carcinoma",
            "Anaplastic thyroid carcinoma",
            "Thyroid lymphoma"
        ],
        "answer": 0,
        "exp": "This biopsy description is classic for **papillary thyroid carcinoma**, the most common type of thyroid malignancy. Pathognomonic histopathologic features include **'Orphan Annie eye' nuclei** (ground-glass appearance of nuclei due to optical clearing), **intranuclear pseudoinclusions**, and **Psammoma bodies** (concentric lamellar calcifications). Papillary thyroid carcinoma has an excellent prognosis and is classically treated with surgical resection followed by radioactive iodine therapy if indicated."
    },

    # ─── GLOMERULAR BIOPSIES ───
    {
        "q": "A {age}-old {gender} presents with generalized edema, severe hypoalbuminemia, and massive proteinuria (>5 g/24h). A renal biopsy is performed. Under light microscopy, the glomeruli appear entirely normal. Immunofluorescence is negative. Electron microscopy, however, demonstrates diffuse effacement of podocyte foot processes. What is the most likely diagnosis?",
        "options": [
            "Minimal change disease",
            "Membranous nephropathy",
            "Focal segmental glomerulosclerosis (FSGS)",
            "Post-streptococcal glomerulonephritis",
            "Diabetic nephropathy"
        ],
        "answer": 0,
        "exp": "The triad of massive proteinuria, hypoalbuminemia, and generalized edema defines nephrotic syndrome. In a patient with normal light microscopy, negative immunofluorescence, and **diffuse effacement of podocyte foot processes on electron microscopy**, the diagnosis is **minimal change disease (MCD)**. MCD is the most common cause of nephrotic syndrome in children but can also occur in adults (sometimes associated with NSAID use or Hodgkin lymphoma). It is highly responsive to corticosteroid therapy."
    }
]

genders_pool = [
    {"gender": "female", "pronoun": "she", "possessive": "her"},
    {"gender": "male", "pronoun": "he", "possessive": "his"},
    {"gender": "woman", "pronoun": "she", "possessive": "her"},
    {"gender": "man", "pronoun": "he", "possessive": "his"},
    {"gender": "lady", "pronoun": "she", "possessive": "her"},
    {"gender": "gentleman", "pronoun": "he", "possessive": "his"}
]

mcqs = []
counter = 0

# Target: 350 MCQs
while counter < 350:
    for t in templates:
        if counter >= 350:
            break
            
        age = random.randint(18, 88)
        gp = random.choice(genders_pool)
        
        # Pleural fluid variables
        pf_prot = random.uniform(3.4, 5.2)
        ser_prot = random.uniform(5.5, 7.5)
        pf_ldh = random.randint(180, 480)
        ser_ldh = random.randint(100, 220)
        
        # CSF variables
        op = random.randint(240, 480)
        wbc = random.randint(1500, 9500)
        prot = random.randint(120, 380)
        gluc = random.randint(10, 32)
        ser_gluc = random.randint(85, 140)
        
        prot_gb = random.randint(85, 280)
        wbc_gb = random.randint(0, 4)
        
        # ABG variables
        ph = random.uniform(7.10, 7.28)
        hco3 = random.randint(6, 15)
        pco2 = int(1.5 * hco3 + 8 + random.choice([-1, 0, 1]))
        na = random.randint(132, 142)
        cl = random.randint(95, 105)
        
        q_text = t['q'].format(
            age=age, gender=gp['gender'],
            pf_prot=pf_prot, ser_prot=ser_prot, pf_ldh=pf_ldh, ser_ldh=ser_ldh,
            op=op, wbc=wbc, prot=prot, gluc=gluc, ser_gluc=ser_gluc,
            prot_gb=prot_gb, wbc_gb=wbc_gb,
            ph=ph, hco3=hco3, pco2=pco2, na=na, cl=cl
        )
        
        # Shuffling options
        opts = list(t['options'])
        correct_opt = opts[t['answer']]
        random.shuffle(opts)
        new_ans_idx = opts.index(correct_opt)
        
        # Escape characters
        q_text_escaped = q_text.replace("'", "''")
        opts_json_escaped = json.dumps(opts).replace("'", "''")
        exp_escaped = t['exp'].replace("'", "''")
        
        mcq_str = f"    (v_topic_id, '{q_text_escaped}', '{opts_json_escaped}'::jsonb, {new_ans_idx}, '{exp_escaped}')"
        
        if mcq_str not in mcqs:
            mcqs.append(mcq_str)
            counter += 1

out_file = "C:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260519_step2_labs_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Clinical Case Integration: Interpretation of labs, imaging, biopsies in context\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\n")
    f.write("DECLARE\n")
    f.write("    v_topic_id UUID;\n")
    f.write("BEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'case-labs-imaging' LIMIT 1;\n")
    f.write("    IF v_topic_id IS NULL THEN\n")
    f.write(f"        RAISE EXCEPTION 'Topic {topic_slug} not found.';\n")
    f.write("    END IF;\n\n")
    
    f.write("    -- Clear existing MCQs for this topic to avoid duplicates\n")
    f.write("    DELETE FROM mcqs WHERE topic_id = v_topic_id;\n\n")
    
    f.write("    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES\n")
    
    for i, m in enumerate(mcqs):
        if i < len(mcqs) - 1:
            f.write(m + ",\n")
        else:
            f.write(m + ";\n")
            
    f.write("END $$;\n")
    f.write("COMMIT;\n")

print(f"Generated {len(mcqs)} MCQs to {out_file}")
