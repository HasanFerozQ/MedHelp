import json
import random

topic_slug = 'case-algorithms'

templates = [
    # ─── SOLITARY PULMONARY NODULE (SPN) ───
    {
        "q": "A {age}-old {gender} is found to have a 1.2 cm, well-circumscribed, non-calcified solitary pulmonary nodule on a chest X-ray obtained for a minor motor vehicle collision. They have no prior imaging for comparison. They are a non-smoker and have no family history of lung cancer. What is the most appropriate next step in the diagnostic algorithm?",
        "options": [
            "Perform a high-resolution Computed Tomography (CT) scan of the chest",
            "Obtain a Positron Emission Tomography (CT-PET) scan",
            "Refer for urgent transthoracic needle biopsy (TTNB)",
            "Perform serial chest radiographs every 3 months for 2 years",
            "Refer for urgent video-assisted thoracoscopic surgery (VATS) resection"
        ],
        "answer": 0,
        "exp": "The diagnostic algorithm for an incidentally discovered solitary pulmonary nodule (SPN) on plain radiograph begins with reviewing prior chest X-rays to assess stability. If no prior films are available, the first diagnostic step of choice is to obtain a high-resolution CT scan of the chest to better characterize the nodule's borders, size, and attenuation. Subsequent steps (PET, biopsy, or observation) are guided by the CT findings and the patient's overall risk profile."
    },
    {
        "q": "A {age}-old {gender} who is a heavy smoker presents with a new 2.5 cm solitary pulmonary nodule with irregular, spiculed borders on a chest CT. Prior imaging is unavailable. What is the most appropriate next step in the management algorithm for this nodule?",
        "options": [
            "Refer for surgical resection (VATS or open thoracotomy)",
            "Perform serial chest CT scans in 3 months",
            "Order a sputum cytology and bronchoscopy",
            "Initiate empiric broad-spectrum antibiotics and repeat imaging in 6 weeks",
            "Order a serum CEA and CA 19-9 level"
        ],
        "answer": 0,
        "exp": "For a solitary pulmonary nodule that is highly suspicious for malignancy based on size (>2 cm), spiculed borders, and high-risk patient features (older age, heavy smoking history), the management algorithm recommends proceeding directly to surgical resection (typically via video-assisted thoracoscopic surgery [VATS] or lobectomy) without prior biopsy, provided the patient is a suitable surgical candidate. Biopsy is reserved for intermediate-risk nodules or when surgery is contraindicated."
    },

    # ─── BILIARY PATHOLOGY ALGORITHMS ───
    {
        "q": "A {age}-old {gender} presents with recurrent, severe right upper quadrant (RUQ) abdominal pain radiating to the right scapula, typically triggered by fatty meals. Physical exam is unremarkable, and liver function tests are normal. A RUQ ultrasound demonstrates several gallstones but no gallbladder wall thickening, no pericholecystic fluid, and a normal common bile duct diameter (4 mm). What is the next best step in management?",
        "options": [
            "Elective laparoscopic cholecystectomy",
            "Emergent open cholecystectomy",
            "Perform a hepatobiliary iminodiacetic acid (HIDA) scan",
            "Perform Endoscopic Retrograde Cholangiopancreatography (ERCP)",
            "Prescribe oral Ursodeoxycholic acid therapy"
        ],
        "answer": 0,
        "exp": "This patient presents with classic symptomatic cholelithiasis (biliary colic). Since the patient has recurrent symptoms and documented gallstones on ultrasound, the definitive treatment of choice is elective laparoscopic cholecystectomy. Diagnostic workup is complete because the ultrasound confirmed the presence of gallstones, and normal LFTs and lack of inflammatory signs rule out acute cholecystitis or choledocholithiasis."
    },
    {
        "q": "A {age}-old {gender} presents with constant right upper quadrant pain, fever, and leukocytosis. On physical examination, inspiration is arrested upon deep palpation of the right upper quadrant (positive Murphy's sign). A RUQ ultrasound is performed, which shows cholelithiasis but is otherwise equivocal (no gallbladder wall thickening or pericholecystic fluid). What is the most appropriate next diagnostic step in the algorithm?",
        "options": [
            "Perform a cholescintigraphy (HIDA) scan",
            "Order a Magnetic Resonance Cholangiopancreatography (MRCP)",
            "Perform an urgent Endoscopic Retrograde Cholangiopancreatography (ERCP)",
            "Perform a CT scan of the abdomen with oral contrast",
            "Repeat the RUQ ultrasound in 48 hours"
        ],
        "answer": 0,
        "exp": "In cases where acute cholecystitis is clinically suspected (pain, fever, leukocytosis, Murphy's sign) but the initial right upper quadrant ultrasound is equivocal or negative for secondary signs of inflammation, the next diagnostic test of choice in the algorithm is a HIDA scan (cholescintigraphy). Failure of the gallbladder to visualize within 1-4 hours due to cystic duct obstruction confirms the diagnosis of acute cholecystitis."
    },
    {
        "q": "A {age}-old {gender} presents with severe right upper quadrant abdominal pain and jaundice. Laboratory evaluation reveals an alanine aminotransferase (ALT) of 180 U/L, aspartate aminotransferase (AST) of 150 U/L, alkaline phosphatase of 450 U/L, and a total bilirubin of 5.8 mg/dL. A right upper quadrant ultrasound demonstrates cholelithiasis and a dilated common bile duct (CBD) of 9 mm, but no stone is directly visualized. What is the most appropriate next step in management?",
        "options": [
            "Perform an Endoscopic Retrograde Cholangiopancreatography (ERCP)",
            "Perform a Magnetic Resonance Cholangiopancreatography (MRCP)",
            "Refer for immediate laparoscopic cholecystectomy and intraoperative cholangiogram",
            "Perform a CT scan of the abdomen and pelvis with IV contrast",
            "Repeat liver function tests and total bilirubin in 24 hours"
        ],
        "answer": 0,
        "exp": "Based on the diagnostic algorithm for suspected choledocholithiasis, patients are stratified into high, intermediate, or low risk. This patient is at high risk because they have a dilated CBD (>6 mm on ultrasound) and a total bilirubin >4 mg/dL. For high-risk patients, the next best step is direct therapeutic intervention via Endoscopic Retrograde Cholangiopancreatography (ERCP) to perform sphincterotomy and stone extraction, followed by cholecystectomy during the same hospital stay."
    },
    {
        "q": "A {age}-old {gender} presents with mild, episodic right upper quadrant pain. Physical examination shows no jaundice or abdominal tenderness. Lab tests reveal mildly elevated liver enzymes (AST 55 U/L, ALT 60 U/L, Alkaline Phosphatase 150 U/L) and a total bilirubin of 1.8 mg/dL. A RUQ ultrasound demonstrates gallstones and a borderline common bile duct diameter of 6.5 mm. What is the most appropriate next diagnostic step in the algorithm?",
        "options": [
            "Perform a Magnetic Resonance Cholangiopancreatography (MRCP) or Endoscopic Ultrasound (EUS)",
            "Perform an immediate therapeutic ERCP",
            "Refer for urgent open cholecystectomy",
            "Perform a HIDA scan",
            "Prescribe oral Ursodeoxycholic acid and discharge home"
        ],
        "answer": 0,
        "exp": "This patient falls into the intermediate-risk category for choledocholithiasis (abnormal liver enzymes, total bilirubin 1.8-4.0 mg/dL, or dilated CBD >6 mm). Because they do not meet the high-risk criteria, proceeding directly to invasive ERCP is contraindicated due to risks of pancreatitis and bleeding. Instead, the algorithm recommends performing a non-invasive confirmatory test first: either an MRCP or an endoscopic ultrasound (EUS). If positive, the patient then undergoes ERCP."
    },

    # ─── THYROID NODULE ALGORITHM ───
    {
        "q": "A {age}-old {gender} is found to have a 1.5 cm nodule in the left lobe of the thyroid during a routine physical examination. An ultrasound confirms the presence of a solid, hypoechoic nodule. What is the first and most appropriate lab test to obtain in the diagnostic algorithm?",
        "options": [
            "Serum Thyroid-Stimulating Hormone (TSH) level",
            "Serum free thyroxine (T4) and triiodothyronine (T3) levels",
            "Serum Calcitonin level",
            "Fine Needle Aspiration (FNA) biopsy",
            "Thyroid antibody panel (anti-TPO and anti-TG)"
        ],
        "answer": 0,
        "exp": "The diagnostic algorithm for a newly discovered thyroid nodule >=1 cm begins with a serum Thyroid-Stimulating Hormone (TSH) level along with a thyroid ultrasound. The TSH level dictates the next step: if TSH is low (suppressed), it indicates a hyperfunctioning nodule, and a radioactive iodine uptake scan (scintigraphy) should be performed. If TSH is normal or elevated, the nodule is non-functioning, and evaluation for fine-needle aspiration (FNA) is based on ultrasound characteristics."
    },
    {
        "q": "A {age}-old {gender} presents with a 1.8 cm thyroid nodule. A serum TSH level is obtained and is found to be suppressed (0.05 uIU/mL). What is the most appropriate next step in the diagnostic workup algorithm?",
        "options": [
            "Perform a thyroid scintigraphy (radioactive iodine uptake scan)",
            "Perform an immediate ultrasound-guided Fine Needle Aspiration (FNA) biopsy",
            "Initiate empiric treatment with Levothyroxine",
            "Order a serum free T4 and perform a total thyroidectomy",
            "Repeat TSH and ultrasound in 6 months"
        ],
        "answer": 0,
        "exp": "In the thyroid nodule workup algorithm, if the serum TSH is suppressed (low), the next step is to perform a thyroid scintigraphy (radioactive iodine uptake scan). If the scan shows a hyperfunctioning ('hot') nodule, the risk of malignancy is extremely low, and the nodule does not require FNA; management instead focuses on treating hyperthyroidism. If the nodule is non-functioning ('cold'), it has a higher risk of malignancy, and FNA should be performed."
    },

    # ─── DYSPHAGIA ALGORITHM ───
    {
        "q": "A {age}-old {gender} presents with a 6-month history of progressive difficulty swallowing both solids and liquids from the onset of symptoms, accompanied by regurgitation of undigested food and mild weight loss. What is the most appropriate next diagnostic test in the algorithm?",
        "options": [
            "Barium esophagram (barium swallow) or Esophageal Manometry",
            "Upper endoscopy (EGD) with biopsy",
            "High-resolution CT scan of the chest and abdomen",
            "24-hour esophageal pH monitoring",
            "Empiric trial of high-dose proton pump inhibitors"
        ],
        "answer": 0,
        "exp": "Dysphagia is categorized into oropharyngeal or esophageal. Esophageal dysphagia is further divided: if it is for both solids and liquids from the onset, it suggests a neuromuscular/motility disorder (e.g., Achalasia, Diffuse Esophageal Spasm). The diagnostic algorithm for suspected motility disorders begins with a barium esophagram (showing a classic 'bird''s beak' in achalasia) or esophageal manometry, which is the gold standard for confirmation. EGD is performed to rule out pseudoachalasia from malignancy."
    },
    {
        "q": "A {age}-old {gender} presents with difficulty swallowing that initially only occurred with solid foods like steak and bread but has recently progressed to include liquids. They report significant weight loss. What is the most appropriate next step in the diagnostic algorithm?",
        "options": [
            "Upper Endoscopy (EGD) with mucosal biopsies",
            "Esophageal manometry",
            "Barium swallow alone without further testing",
            "Empiric balloon dilation of the lower esophageal sphincter",
            "24-hour pH monitoring and esophageal impedance testing"
        ],
        "answer": 0,
        "exp": "Esophageal dysphagia that initially affects only solids and then progresses to liquids suggests a mechanical obstruction (e.g., peptic stricture, esophageal ring, or esophageal carcinoma). The diagnostic algorithm for suspected mechanical obstruction requires an Upper Endoscopy (EGD) first to directly visualize the esophagus, obtain biopsies of any suspected mass or inflammation, and potentially perform therapeutic dilatation if a benign stricture is found."
    },

    # ─── ASCITES EVALUATION ───
    {
        "q": "A {age}-old {gender} with a history of alcohol use disorder presents with abdominal distention and a positive shifting dullness on percussion. A diagnostic paracentesis is performed. Lab analysis reveals ascites albumin of 1.2 g/dL and serum albumin of 2.6 g/dL. What is the calculated Serum-to-Ascites Albumin Gradient (SAAG), and what does it suggest?",
        "options": [
            "SAAG is 1.4 g/dL, suggesting portal hypertension (e.g., Cirrhosis, Heart Failure)",
            "SAAG is 0.46 g/dL, suggesting peritoneal carcinomatosis or tuberculosis",
            "SAAG is 1.4 g/dL, suggesting nephrotic syndrome or pancreatic ascites",
            "SAAG is 0.8 g/dL, suggesting portal hypertension",
            "SAAG is 2.1 g/dL, suggesting spontaneous bacterial peritonitis"
        ],
        "answer": 0,
        "exp": "The Serum-to-Ascites Albumin Gradient (SAAG) is calculated as: SAAG = Serum Albumin - Ascites Albumin. Here, SAAG = 2.6 g/dL - 1.2 g/dL = 1.4 g/dL. A SAAG >= 1.1 g/dL is highly suggestive of portal hypertension (cirrhosis, congestive heart failure, or Budd-Chiari syndrome). A SAAG < 1.1 g/dL suggests a non-portal hypertensive cause (peritoneal carcinomatosis, tuberculous peritonitis, nephrotic syndrome, or pancreatic ascites)."
    },

    # ─── ADRENAL INCIDENTALOMA ALGORITHM ───
    {
        "q": "A {age}-old {gender} undergoes a non-contrast abdominal CT scan for suspected nephrolithiasis, which reveals an incidental 2.5 cm, homogeneous, well-circumscribed right adrenal mass with low attenuation (<10 Hounsfield units). The patient is asymptomatic. What is the most appropriate next step in the workup algorithm?",
        "options": [
            "Perform biochemical screening to rule out a functional tumor (e.g., overnight dexamethasone suppression test, 24-hour urine metanephrines, aldosterone-to-renin ratio if hypertensive)",
            "Refer for immediate laparoscopic right adrenalectomy",
            "Perform a CT-guided fine-needle aspiration biopsy of the adrenal mass",
            "Repeat the abdominal CT scan in 3 months to assess for growth",
            "Reassure the patient and perform no further workup"
        ],
        "answer": 0,
        "exp": "All patients with an incidentally discovered adrenal mass (adrenal incidentaloma) must undergo biochemical evaluation to rule out a functional (hormone-secreting) tumor, regardless of whether they have symptoms. Screening includes: (1) an overnight 1 mg dexamethasone suppression test for subclinical Cushing's, (2) 24-hour fractionated urinary metanephrines/catecholamines (or plasma free metanephrines) for pheochromocytoma, and (3) plasma aldosterone concentration to plasma renin activity ratio (if hypertensive) for Conn syndrome. Fine needle biopsy is contraindicated until pheochromocytoma is biochemically ruled out, due to risk of hypertensive crisis."
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

out_file = "C:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260519_step2_algorithms_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Clinical Case Integration: Diagnostic reasoning & management algorithms\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\n")
    f.write("DECLARE\n")
    f.write("    v_topic_id UUID;\n")
    f.write("BEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'case-algorithms' LIMIT 1;\n")
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
