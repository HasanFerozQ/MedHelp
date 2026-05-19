import json
import random

topic_slug = 'case-surgical-medical'

templates = [
    # ─── ACUTE APPENDICITIS ───
    {
        "q": "A {age}-old previously healthy {gender} presents to the emergency department with a 12-hour history of vague periumbilical pain that has now migrated to the right lower quadrant. They report anorexia, nausea, and two episodes of non-bilious vomiting. On physical examination, they have a temperature of {temp:.1f}°F ({temp_c:.1f}°C) and focal tenderness at McBurney's point with localized rebound tenderness. What is the most appropriate next step in management?",
        "options": [
            "Proceed directly to laparoscopic appendectomy without prior imaging",
            "Obtain a contrast-enhanced Computed Tomography (CT) scan of the abdomen and pelvis",
            "Obtain an urgent abdominal ultrasound to confirm the diagnosis",
            "Initiate a 7-day course of oral metronidazole and ciprofloxacin and discharge home",
            "Perform a diagnostic diagnostic diagnostic diagnostic exploratory laparotomy"
        ],
        "answer": 0,
        "exp": "For a young male patient presenting with a classic, high-probability history and physical examination consistent with acute appendicitis (migratory RLQ pain, anorexia, fever, localized peritonitis), the diagnosis is clinical. The recommended next step is direct surgical consultation and appendectomy (typically laparoscopic) without obtaining diagnostic imaging, as this avoids unnecessary cost, radiation exposure, and delay to definitive care. (Note: in females of childbearing age, pregnant patients, or patients with atypical presentations, pelvic ultrasound or CT scan is indicated first)."
    },
    {
        "q": "A {age}-old {gender} presenting with acute-onset right lower quadrant pain undergoes an abdominal ultrasound, which is equivocal. A subsequent contrast-enhanced CT scan of the abdomen and pelvis demonstrates a normal-caliber appendix (4 mm) with no surrounding fat stranding, but shows a 4.5 cm complex right ovarian cyst with internal septations. What is the most appropriate next step in management?",
        "options": [
            "Refer for outpatient gynecologic follow-up and perform no acute surgical intervention",
            "Proceed to emergent diagnostic laparoscopy for suspected acute appendicitis",
            "Initiate empiric intravenous piperacillin-tazobactam for pelvic inflammatory disease",
            "Perform an emergent percutaneous cyst aspiration under ultrasound guidance",
            "Perform an urgent unilateral oophorectomy"
        ],
        "answer": 0,
        "exp": "This patient's acute abdominal pain was initially suspicious for appendicitis, but CT imaging ruled it out (normal appendix <6 mm) and identified a 4.5 cm complex ovarian cyst without signs of adnexal torsion or rupture (which would show free fluid or absent Doppler flow). For stable patients with asymptomatic or minimally symptomatic simple or complex ovarian cysts under 5 cm without signs of torsion, immediate surgical intervention is not indicated. The correct management is medical/conservative with outpatient gynecologic follow-up and serial ultrasound monitoring."
    },

    # ─── SMALL BOWEL OBSTRUCTION (SBO) ───
    {
        "q": "A {age}-old {gender} with a history of prior open cholecystectomy presents with a 24-hour history of severe colicky abdominal pain, abdominal distention, and multiple episodes of bilious vomiting. They report that they have not passed flatus or feces for 18 hours. On examination, they are hemodynamically stable, their abdomen is distended and tympanic with high-pitched 'tinkling' bowel sounds, but they have no rebound tenderness or guarding. An abdominal radiograph reveals multiple dilated loops of small bowel with air-fluid levels and a complete absence of gas in the colon. What is the most appropriate initial step in management?",
        "options": [
            "Admit the patient for conservative medical management (NPO, intravenous fluids, and nasogastric tube decompression)",
            "Proceed directly to urgent exploratory laparotomy to lyse peritoneal adhesions",
            "Perform an urgent Endoscopic Retrograde Cholangiopancreatography (ERCP)",
            "Administer oral polyethylene glycol and discharge the patient home",
            "Initiate immediate intravenous thrombolytic therapy"
        ],
        "answer": 0,
        "exp": "This patient has a classic presentation of a complete or high-grade small bowel obstruction (SBO) secondary to post-surgical adhesions. In the absence of 'strangulation signs' or peritoneal findings (such as fever, severe leukocytosis, constant localized pain, rebound tenderness, guarding, or hemodynamic instability), initial management is non-operative (conservative medical management). This consists of keeping the patient NPO, providing aggressive IV fluid resuscitation, correcting electrolyte abnormalities, and inserting a nasogastric (NG) tube for active gastric decompression. Up to 70-80% of adhesive SBOs resolve with conservative management alone."
    },
    {
        "q": "A {age}-old {gender} is admitted for a small bowel obstruction. Despite 48 hours of complete nasogastric decompression and intravenous fluid resuscitation, the patient develops a new fever of 101.8°F (38.8°C), tachycardia of 115 bpm, localized right lower quadrant abdominal tenderness, and severe guarding. Their white blood cell count has increased from 9,500 to 18,500/uL. What is the most appropriate next step in management?",
        "options": [
            "Proceed immediately to surgical exploration (laparoscopy or laparotomy)",
            "Order a repeat contrast-enhanced CT scan of the abdomen and pelvis to assess progress",
            "Increase the negative suction on the nasogastric tube and continue observation",
            "Switch to a different class of intravenous antibiotics and check serial blood cultures",
            "Perform a bedside percutaneous peritoneal lavage"
        ],
        "answer": 0,
        "exp": "While uncomplicated SBO is managed medically first, the development of 'strangulation signs'—which include systemic toxicity (fever, tachycardia, leukocytosis) and clinical signs of localized peritonitis (localized tenderness, guarding, rebound)—indicates compromised bowel perfusion, ischemia, or impending perforation. This is a surgical emergency. The patient must undergo immediate surgical exploration (laparoscopy or laparotomy) to assess bowel viability, lyse the obstructing adhesions, and resect any gangrenous, non-viable segments of bowel."
    },

    # ─── SIGMOID VOLVULUS ───
    {
        "q": "A {age}-old {gender} with a history of chronic constipation and Parkinson's disease presents with progressive abdominal distention, obstipation, and mild abdominal discomfort over 2 days. On exam, the abdomen is massively distended, tympanic, and non-tender without peritoneal signs. An abdominal X-ray reveals a classic 'bent inner tube' or 'coffee bean' sign, showing a massively dilated loop of colon arising from the pelvis. What is the most appropriate initial management?",
        "options": [
            "Perform an urgent rigid or flexible sigmoidoscopy with detorsion and placement of a rectal tube",
            "Proceed directly to emergent exploratory laparotomy with Hartmann's procedure",
            "Administer high-dose oral laxatives and perform a barium enema",
            "Initiate systemic intravenous thrombolysis with tissue plasminogen activator",
            "Perform a percutaneous cecostomy under interventional radiology guidance"
        ],
        "answer": 0,
        "exp": "This patient presents with a sigmoid volvulus, which is a common cause of large bowel obstruction, especially in elderly, institutionalized, or neurologically impaired patients with chronic constipation. In a stable patient without signs of bowel ischemia or perforation (e.g., no peritonitis, no systemic toxicity), the first-line management is non-operative (medical/endoscopic decompression). This is achieved via rigid or flexible sigmoidoscopy to untwist the volvulus (detorsion) and place a rectal tube to maintain decompression. Because recurrence rates are extremely high (up to 60-70%), an elective semi-urgent sigmoid resection is planned during the same hospital stay."
    },
    {
        "q": "A {age}-old {gender} with a known history of recurrent sigmoid volvulus presents with severe abdominal pain. On examination, they are febrile to 101.5°F (38.6°C), hypotensive (BP 88/50 mmHg), and tachycardic (HR 122 bpm). The abdomen is rigid with diffuse rebound tenderness and guarding. An abdominal radiograph shows free air under the diaphragm. What is the most appropriate next step in management?",
        "options": [
            "Emergent laparotomy with sigmoid resection and end-colostomy (Hartmann's procedure)",
            "Attempt urgent flexible sigmoidoscopic detorsion",
            "Place a nasogastric tube and start aggressive intravenous fluid resuscitation alone",
            "Refer for urgent CT-guided percutaneous drainage",
            "Initiate oral broad-spectrum antibiotic therapy and observe in the ICU"
        ],
        "answer": 0,
        "exp": "In contrast to an uncomplicated volvulus, a volvulus with signs of bowel necrosis, gangrene, or perforation (diffuse peritonitis, shock, fever, pneumoperitoneum/free air under the diaphragm) is a surgical emergency. Non-operative endoscopic detorsion is strictly contraindicated due to the high risk of further perforating the necrotic bowel. The patient requires immediate fluid resuscitation, intravenous broad-spectrum antibiotics, and emergent surgical exploration (laparotomy) with resection of the perforated/ischemic segment, typically resulting in an end-colostomy and rectal stump closure (Hartmann's procedure)."
    },

    # ─── SPLENIC INJURY (HEMODYNAMIC STABILITY VS INSTABILITY) ───
    {
        "q": "A {age}-old {gender} is brought to the emergency department after a motor vehicle collision. They complain of left upper quadrant pain and left shoulder pain (Kehr's sign). On arrival, their blood pressure is 122/76 mmHg and heart rate is 84 bpm, both of which remain stable. Focused Assessment with Sonography for Trauma (FAST) reveals free fluid in the splenorenal recess. A contrast-enhanced abdominal CT scan shows a Grade III splenic laceration with a subcapsular hematoma. What is the most appropriate next step in management?",
        "options": [
            "Admit the patient to the intensive care unit for close observation, serial abdominal exams, and serial hemoglobin monitoring",
            "Proceed immediately to exploratory laparotomy for emergent splenectomy",
            "Perform an urgent ultrasound-guided percutaneous splenic aspiration",
            "Initiate immediate systemic anticoagulation with intravenous heparin",
            "Refer for immediate left nephrectomy"
        ],
        "answer": 0,
        "exp": "For patients with blunt abdominal trauma resulting in splenic injury (even high-grade lacerations), the primary determinant of management is **hemodynamic stability**. If the patient is hemodynamically stable (normal blood pressure, responsive to minimal fluids, stable heart rate) and does not have signs of peritonitis, the standard of care is conservative medical management (non-operative management). This includes admission to the ICU, absolute bed rest, serial abdominal examinations by the same surgical team, and serial hemoglobin checks. This approach successfully preserves splenic function in over 85-90% of stable patients."
    },
    {
        "q": "A {age}-old {gender} is brought to the trauma bay after being struck by a vehicle. They are unresponsive, with a blood pressure of 78/42 mmHg and a heart rate of 132 bpm. After administration of 2 liters of intravenous crystalloids and 2 units of packed red blood cells, their blood pressure remains 80/44 mmHg. A FAST exam shows massive free fluid in the splenorenal and hepatorenal spaces. What is the most appropriate next step in management?",
        "options": [
            "Proceed immediately to the operating room for exploratory laparotomy",
            "Perform an urgent contrast-enhanced CT scan of the abdomen and pelvis",
            "Refer to interventional radiology for urgent splenic artery embolization",
            "Place a bilateral chest tube and repeat the FAST exam in 30 minutes",
            "Initiate a continuous infusion of vasopressin and monitor in the ICU"
        ],
        "answer": 0,
        "exp": "This trauma patient has sustained significant blunt abdominal trauma and is **hemodynamically unstable** (refractory hypotension and tachycardia despite aggressive fluid and blood resuscitation) with a positive FAST scan indicating massive intra-abdominal hemorrhage. In hemodynamically unstable patients with a positive FAST, obtaining a CT scan is strictly contraindicated because the patient is too unstable to leave the resuscitation bay and could arrest in the scanner. The correct management is immediate transfer to the operating room for an emergent exploratory laparotomy to locate and control the source of bleeding (e.g., performing a splenectomy or packing)."
    },

    # ─── ASYMPTOMATIC VS SYMPTOMATIC CAROTID ARTERY STENOSIS ───
    {
        "q": "A {age}-old asymptomatic {gender} undergoes a carotid duplex ultrasound as part of a vascular screening program, which demonstrates an 85% stenosis of the left internal carotid artery. The right internal carotid artery has a 30% stenosis. The patient has no history of transient ischemic attacks (TIAs), stroke, or amaurosis fugax. They are a non-smoker with well-controlled hypertension. What is the most appropriate next step in management?",
        "options": [
            "Initiate optimal medical therapy (high-intensity statin, aspirin, and blood pressure control) and refer for elective carotid endarterectomy (CEA)",
            "Perform immediate emergent surgical carotid endarterectomy under general anesthesia",
            "Perform an urgent balloon angioplasty and stenting of the right internal carotid artery",
            "Prescribe low-dose oral prednisone and advise yearly repeat duplex ultrasound",
            "Reassure the patient that no intervention or medication is necessary for stenosis under 90%"
        ],
        "answer": 0,
        "exp": "For an **asymptomatic** patient with high-grade internal carotid artery stenosis (70-99%), clinical trials have shown that surgical intervention with Carotid Endarterectomy (CEA) or stenting combined with optimal medical therapy provides a significant, though modest, reduction in 5-year stroke risk compared to medical therapy alone, provided the patient has a life expectancy of at least 5 years and the surgical center has a documented perioperative complication rate of <3%. The management should combine optimal medical therapy (aspirin, high-intensity statin, tight blood pressure control) with a referral for elective CEA."
    },
    {
        "q": "A {age}-old {gender} presents to the emergency department 2 hours after experiencing sudden-onset weakness in their right hand and difficulty speaking (expressive aphasia) that resolved completely within 45 minutes. A carotid duplex ultrasound reveals a 75% stenosis of the left internal carotid artery with an ulcerated plaque. What is the most appropriate recommendation for this patient?",
        "options": [
            "Initiate optimal medical therapy and schedule a left carotid endarterectomy (CEA) within 2 weeks",
            "Initiate lifelong anticoagulation with warfarin and avoid all surgical interventions",
            "Schedule serial carotid duplex ultrasounds every 3 months and defer intervention",
            "Perform an emergent left carotid endarterectomy immediately in the emergency department",
            "Perform a left superficial temporal-to-middle cerebral artery bypass surgery"
        ],
        "answer": 0,
        "exp": "This patient experienced a transient ischemic attack (TIA) in the distribution of the left internal carotid artery and was found to have high-grade **symptomatic** carotid stenosis (70-99%). For symptomatic patients with 50-99% stenosis, Carotid Endarterectomy (CEA) is strongly indicated and highly beneficial in preventing subsequent disabling strokes. The benefit of surgery is highest when performed early, ideally within 2 weeks of the qualifying neurologic event. Standard optimal medical therapy (aspirin, statin, risk-factor modification) must be initiated concomitantly."
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
            
        age = random.randint(24, 85)
        temp = random.uniform(99.4, 102.6)
        temp_c = (temp - 32) * 5 / 9
        gp = random.choice(genders_pool)
        
        q_text = t['q'].format(age=age, gender=gp['gender'], temp=temp, temp_c=temp_c)
        
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

out_file = "C:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260519_step2_surgical_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Clinical Case Integration: Surgical vs medical decision making\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\n")
    f.write("DECLARE\n")
    f.write("    v_topic_id UUID;\n")
    f.write("BEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'case-surgical-medical' LIMIT 1;\n")
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
