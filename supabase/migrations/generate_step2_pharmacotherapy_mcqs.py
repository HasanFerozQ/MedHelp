import json
import random

topic_slug = 'case-pharmacotherapy'

templates = [
    # ─── CARDIOVASCULAR PHARMACOTHERAPY ───
    {
        "q": "A {age}-old {gender} with a history of long-standing hypertension and chronic kidney disease is evaluated for a new dry, hacking cough that has persisted for 3 weeks. They deny fever, chills, or dyspnea. They recently started a new antihypertensive medication. What is the molecular mechanism responsible for this patient's cough?",
        "options": [
            "Accumulation of bradykinin and substance P in the respiratory tract due to ACE inhibition",
            "Direct activation of the renin-angiotensin-aldosterone system by loop diuretics",
            "Inhibition of calcium influx into vascular smooth muscle cells by calcium channel blockers",
            "Beta-2 adrenergic receptor blockade causing mild bronchoconstriction",
            "Direct pulmonary toxic injury and alveolar inflammation"
        ],
        "answer": 0,
        "exp": "Angiotensin-Converting Enzyme (ACE) inhibitors (e.g., Lisinopril, Enalapril) are a classic cause of a drug-induced dry cough (occurring in 5-20% of patients). ACE is responsible for the breakdown of bradykinin and substance P. Inhibition of ACE leads to the accumulation of these inflammatory peptides in the respiratory tract, which sensitizes sensory airway fibers, causing the dry cough. Converting to an Angiotensin II Receptor Blocker (ARB) resolves the cough because ARBs do not affect bradykinin metabolism."
    },
    {
        "q": "A {age}-old {gender} with chronic Heart Failure with Reduced Ejection Fraction (HFrEF) is scheduled to transition from an ACE inhibitor to a new combination therapy containing Sacubitril and Valsartan (ARNI). What is the molecular target of Sacubitril, and what is its physiologic benefit?",
        "options": [
            "Inhibition of neprilysin, leading to increased levels of beneficial natriuretic peptides",
            "Direct blockade of the aldosterone receptor to prevent cardiac remodeling",
            "Inhibition of the sodium-potassium-chloride cotransporter in the thick ascending limb",
            "Blockade of calcium channels in cardiac myocytes to decrease myocardial oxygen demand",
            "Direct agonism of beta-1 adrenergic receptors to increase cardiac contractility"
        ],
        "answer": 0,
        "exp": "Sacubitril is a neprilysin inhibitor. Neprilysin is an endopeptidase that degrades vasoactive peptides, including atrial natriuretic peptide (ANP), brain natriuretic peptide (BNP), bradykinin, and adrenomedullin. By inhibiting neprilysin, sacubitril increases the levels of these beneficial peptides, promoting vasodilation, natriuresis, and diuresis, and counteracting chronic maladaptive neurohormonal activation in heart failure. It is combined with Valsartan (an ARB) to block the concomitant increase in angiotensin II."
    },
    {
        "q": "A {age}-old {gender} with a history of refractory ventricular tachycardia is initiated on long-term oral Amiodarone therapy. Which of the following sets of diagnostic tests is essential to obtain at baseline and monitor periodically during therapy due to Amiodarone's classic toxicities?",
        "options": [
            "Pulmonary function tests (PFTs), Thyroid function tests (TFTs), and Liver function tests (LFTs)",
            "Serial audiometry, serum creatinine, and complete blood count",
            "Echocardiography, serum potassium, and 24-hour urine collection",
            "Ophthalmic slit-lamp exam, serum amylase, and fasting lipid panel",
            "Bone mineral density scan, serum calcium, and serum lipase"
        ],
        "answer": 0,
        "exp": "Amiodarone is a highly effective Class III antiarrhythmic but has a broad toxicity profile. Due to its high iodine content and tissue accumulation, it can cause: (1) pulmonary toxicity (interstitial lung disease/fibrosis), (2) thyroid toxicity (both amiodarone-induced hypothyroidism and hyperthyroidism), and (3) hepatotoxicity. Baseline and periodic monitoring of pulmonary function (PFTs and chest X-ray), thyroid function (TSH/free T4), and liver enzymes (LFTs) is mandatory."
    },
    {
        "q": "A {age}-old {gender} presenting with deep vein thrombosis is initiated on oral Warfarin therapy. They are also started on a concurrent Heparin infusion. What is the pharmacodynamic rationale for co-administering Heparin with Warfarin during the initial 5 days of therapy?",
        "options": [
            "To prevent transient hypercoagulability and skin necrosis caused by rapid depletion of Protein C and S",
            "To accelerate the renal clearance of warfarin metabolites",
            "To prevent the development of drug-induced thrombocytopenia",
            "To increase the gastrointestinal absorption of oral warfarin",
            "To prevent warfarin-induced osteopenia"
        ],
        "answer": 0,
        "exp": "Warfarin inhibits Vitamin K epoxide reductase, decreasing the synthesis of functional clotting factors II, VII, IX, and X, as well as anticoagulant proteins C and S. Because Protein C and S have much shorter half-lives (approx. 8 and 30 hours) compared to procoagulant factor II (approx. 60 hours), starting warfarin alone leads to a transient, early hypercoagulable state due to rapid loss of Protein C/S. Co-administration of a rapid-acting anticoagulant (e.g., Heparin or LMWH) is required as 'bridge therapy' for at least 5 days and until the INR is in the therapeutic range (2.0-3.0) for at least 24 hours to prevent thromboembolism and warfarin-induced skin necrosis."
    },

    # ─── ENDOCRINE & METABOLIC PHARMACOTHERAPY ───
    {
        "q": "A {age}-old {gender} with type 2 diabetes presents to the clinic for a routine follow-up. Lab tests reveal a serum creatinine of 1.8 mg/dL and an estimated glomerular filtration rate (eGFR) of 26 mL/min/1.73m². They are currently taking Metformin 1000 mg twice daily. Which of the following is the most appropriate management regarding their Metformin therapy?",
        "options": [
            "Discontinue Metformin immediately due to the high risk of drug accumulation and lactic acidosis",
            "Reduce the Metformin dose by half and continue close monitoring of renal function",
            "Add a loop diuretic to enhance renal excretion of Metformin",
            "Continue the current dose but advise the patient to avoid all dietary carbohydrates",
            "Transition to intravenous Metformin to bypass first-pass hepatic metabolism"
        ],
        "answer": 0,
        "exp": "Metformin is cleared renally by glomerular filtration and active tubular secretion. In patients with severe renal impairment (eGFR <30 mL/min/1.73m²), Metformin clearance is significantly reduced, leading to drug accumulation. This accumulation increases the risk of metformin-associated lactic acidosis (MALA), a rare but life-threatening complication characterized by elevated lactate and severe metabolic acidosis. Metformin is strictly contraindicated in patients with an eGFR <30 mL/min/1.73m² and should be discontinued immediately."
    },
    {
        "q": "A {age}-old {gender} with type 2 diabetes and clinical heart failure is initiated on Empagliflozin (an SGLT2 inhibitor). While discussing the drug's profile, the physician mentions its primary mechanism of action. SGLT2 inhibitors lower blood glucose by which of the following mechanisms?",
        "options": [
            "Inhibiting glucose reabsorption in the proximal convoluted tubule of the kidney, promoting glycosuria",
            "Activating peroxisome proliferator-activated receptor gamma (PPAR-gamma) in adipose tissue",
            "Blocking the sulfonylurea receptor on pancreatic beta cells to stimulate insulin release",
            "Inhibiting the dipeptidyl peptidase-4 enzyme to increase endogenous GLP-1 levels",
            "Directly stimulating the GLP-1 receptor to delay gastric emptying and suppress appetite"
        ],
        "answer": 0,
        "exp": "Sodium-Glucose Cotransporter 2 (SGLT2) inhibitors (e.g., Empagliflozin, Dapagliflozin) act in the proximal convoluted tubule of the kidney to inhibit SGLT2, which is responsible for reabsorbing approximately 90% of filtered glucose. Blocking this transporter leads to decreased glucose reabsorption and increased glucose excretion in the urine (glycosuria). SGLT2 inhibitors provide significant cardiovascular benefits (e.g., reducing heart failure hospitalizations) and renal protection, but carry side-effects like genitourinary tract infections and euglycemic diabetic ketoacidosis (DKA)."
    },
    {
        "q": "A {age}-old {gender} who is in the 8th week of pregnancy is diagnosed with severe Graves' disease (hyperthyroidism). What is the recommended first-line antithyroid drug therapy for this patient during the first trimester of pregnancy?",
        "options": [
            "Propylthiouracil (PTU) therapy",
            "Methimazole therapy",
            "Radioactive iodine ablation",
            "High-dose oral Potassium Iodide solution",
            "Immediate total thyroidectomy"
        ],
        "answer": 0,
        "exp": "In the pharmacotherapeutic management of hyperthyroidism in pregnancy, the choice of antithyroid drug varies by trimester. During the first trimester, Propylthiouracil (PTU) is preferred and first-line. Methimazole is associated with a higher risk of teratogenic effects (methimazole embryopathy), specifically aplasia cutis (congenital skin defects, typically of the scalp) and choanal/esophageal atresia. During the second and third trimesters, patients are typically transitioned to Methimazole because PTU is associated with a risk of severe drug-induced fulminant hepatotoxicity."
    },

    # ─── RENAL & PULMONARY PHARMACOTHERAPY ───
    {
        "q": "A {age}-old {gender} with chronic heart failure is treated with high-dose Spironolactone to reduce cardiac remodeling and mortality. After 3 months, they present with painful swelling of the breasts (bilateral gynecomastia). Which of the following potassium-sparing diuretics is the most appropriate alternative that avoids this specific side effect?",
        "options": [
            "Eplerenone",
            "Amiloride",
            "Triamterene",
            "Furosemide",
            "Acetazolamide"
        ],
        "answer": 0,
        "exp": "Spironolactone is a non-selective mineralocorticoid (aldosterone) receptor antagonist. It also binds to and blocks androgen receptors and acts as a partial agonist at progesterone receptors, leading to endocrine side effects such as gynecomastia, breast tenderness, and erectile dysfunction. Eplerenone is a highly selective mineralocorticoid receptor antagonist with minimal affinity for androgen and progesterone receptors, thus avoiding gynecomastia while providing identical cardiovascular benefits."
    },

    # ─── INFECTIOUS DISEASES PHARMACOTHERAPY ───
    {
        "q": "A {age}-old {gender} with severe hospital-acquired pneumonia is treated with intravenous Gentamicin. On day 6 of therapy, they report progressive dizziness, instability when walking, and a constant high-pitched ringing in their ears. What is the primary mechanism of toxicity associated with this antibiotic class?",
        "options": [
            "Direct mitochondrial damage and accumulation of the drug in the sensory hair cells of the inner ear",
            "Inhibition of mammalian ribosomal protein synthesis in hepatic tissue",
            "Blockade of sodium-calcium exchangers in systemic vascular endothelium",
            "Direct immune-mediated destruction of myelin in the vestibulocochlear nerve",
            "Precipitation of drug crystals in the semicircular canals"
        ],
        "answer": 0,
        "exp": "Aminoglycosides (e.g., Gentamicin, Tobramycin, Amikacin) are highly effective against gram-negative aerobic bacilli but are notoriously ototoxic and nephrotoxic. Ototoxicity can be vestibular (causing dizziness, ataxia, dysequilibrium) and/or cochlear (causing tinnitus, high-frequency hearing loss). The mechanism involves direct entry of the drug into the sensory hair cells of the inner ear via mechanosensitive channels, leading to accumulation, mitochondrial dysfunction, generation of reactive oxygen species (ROS), and cell death."
    },
    {
        "q": "A {age}-old {gender} is hospitalized with severe cellulitis. Intravenous Vancomycin is initiated. Ten minutes after starting the first infusion, the patient develops marked flushing, pruritus, and an erythematous maculopapular rash involving the face, neck, and upper torso. Their vital signs remain stable with a blood pressure of 120/75 mmHg and heart rate of 82 bpm. What is the most appropriate next step in management?",
        "options": [
            "Temporarily interrupt the infusion, administer an antihistamine, and restart the infusion at a slower rate",
            "Discontinue Vancomycin permanently, administer epinephrine, and initiate emergent intubation",
            "Continue the infusion at the current rate and prescribe oral systemic corticosteroids",
            "Increase the infusion rate to deliver the drug faster and clear the reaction",
            "Add intravenous gentamicin to target potential synergistic infections"
        ],
        "answer": 0,
        "exp": "This patient is experiencing Vancomycin Infusion Reaction (formerly known as 'Red Man Syndrome'). This is a non-immune, infusion-rate-dependent reaction caused by the direct activation of mast cells by vancomycin, leading to histamine release. It is NOT a true IgE-mediated anaphylactic reaction (vital signs are stable, no airway compromise). The appropriate management consists of temporarily stopping the infusion, administering an antihistamine (e.g., diphenhydramine), and restarting the infusion at a much slower rate (typically over at least 2 hours)."
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

# Target: 300 MCQs
while counter < 300:
    for t in templates:
        if counter >= 300:
            break
            
        age = random.randint(22, 84)
        gp = random.choice(genders_pool)
        
        q_text = t['q'].format(age=age, gender=gp['gender'])
        
        # Shuffling options
        opts = list(t['options'])
        correct_opt = opts[t['answer']]
        random.shuffle(opts)
        new_ans_idx = opts.index(correct_opt)
        
        # Double check character replacements
        q_text_escaped = q_text.replace("'", "''")
        opts_json_escaped = json.dumps(opts).replace("'", "''")
        exp_escaped = t['exp'].replace("'", "''")
        
        mcq_str = f"    (v_topic_id, '{q_text_escaped}', '{opts_json_escaped}'::jsonb, {new_ans_idx}, '{exp_escaped}')"
        
        if mcq_str not in mcqs:
            mcqs.append(mcq_str)
            counter += 1

out_file = "C:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260519_step2_pharmacotherapy_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Clinical Case Integration: Pharmacotherapy in clinical context\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\n")
    f.write("DECLARE\n")
    f.write("    v_topic_id UUID;\n")
    f.write("BEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'case-pharmacotherapy' LIMIT 1;\n")
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
