import json
import random

topic_slug = 'case-vignettes'

templates = [
    # ─── CARDIOLOGY & PULMONOLOGY ───
    {
        "q": "A {age}-old {gender} presents to the emergency department with acute onset of severe, crushing substernal chest pain that radiates to the left arm and jaw, accompanied by diaphoresis and shortness of breath. The ECG reveals ST-segment elevations in leads II, III, and aVF. Which of the following is the most immediate and critical next step in management?",
        "options": [
            "Emergent coronary angiography and primary percutaneous coronary intervention (PCI)",
            "Intravenous administration of high-dose beta-blockers",
            "Urgent CT angiogram of the chest to rule out aortic dissection",
            "Intubation and positive-pressure mechanical ventilation",
            "Subcutaneous low-molecular-weight heparin injection only"
        ],
        "answer": 0,
        "exp": "For patients presenting with acute ST-segment elevation myocardial infarction (STEMI) (inferior MI in this case), the gold-standard treatment is immediate reperfusion therapy. Primary percutaneous coronary intervention (PCI) is preferred if it can be performed within 90 minutes of first medical contact at a PCI-capable facility (or within 120 minutes if transfer is required). If PCI is unavailable within this window, fibrinolytic therapy should be administered."
    },
    {
        "q": "A {age}-old {gender} presents with progressive dyspnea on exertion, orthopnea, and paroxysmal nocturnal dyspnea. Physical examination reveals bilateral pitting lower extremity edema, jugular venous distention (JVD), and a prominent third heart sound (S3). An echocardiogram shows a left ventricular ejection fraction of 28%. Which of the following drug classes has been shown to reduce mortality in this patient's condition?",
        "options": [
            "Beta-blockers (e.g., Metoprolol succinate, Carvedilol)",
            "Loop diuretics (e.g., Furosemide)",
            "Calcium channel blockers (e.g., Amlodipine)",
            "Short-acting nitrates (e.g., Isosorbide dinitrate)",
            "Digoxin therapy"
        ],
        "answer": 0,
        "exp": "This patient has Heart Failure with Reduced Ejection Fraction (HFrEF). Beta-blockers (specifically metoprolol succinate, carvedilol, and bisoprolol) have been proven to reduce mortality, decrease hospitalization rates, and improve symptoms by counteracting chronic sympathetic activation. Other mortality-reducing agents include ACE inhibitors/ARBs/ARNIs, aldosterone antagonists (spironolactone), and SGLT2 inhibitors (dapagliflozin). Loop diuretics are essential for symptom control but do not reduce mortality."
    },
    {
        "q": "A {age}-old {gender} presents with a 3-week history of low-grade fever, malaise, and progressive shortness of breath. They have a history of intravenous drug use. Physical exam reveals a new regurgitant systolic murmur at the lower left sternal border and multiple painless, erythematous macules on the palms and soles. Which of the following is the most appropriate next step to confirm the suspected diagnosis?",
        "options": [
            "Obtain three sets of blood cultures from different venipuncture sites and order an echocardiogram",
            "Perform an immediate chest CT scan with intravenous contrast",
            "Initiate empiric broad-spectrum oral antibiotics",
            "Perform a bone marrow aspiration and biopsy",
            "Order a serum rheumatoid factor and antinuclear antibody panel"
        ],
        "answer": 0,
        "exp": "The clinical presentation (low-grade fever, IV drug use, tricuspid regurgitation murmur, and Janeway lesions on palms/soles) is highly suggestive of Infective Endocarditis (IE). According to the modified Duke criteria, the gold-standard initial steps are obtaining multiple sets of blood cultures (three sets within 24 hours from different venipuncture sites before starting antibiotics) and performing an echocardiogram (typically starting with transthoracic, followed by transesophageal if suspicion remains high)."
    },
    {
        "q": "A {age}-old {gender} presents to the emergency department with acute onset of severe dyspnea, pleuritic chest pain, and tachypnea. They recently underwent a total hip arthroplasty 2 weeks ago. Physical exam reveals a heart rate of 115 bpm and oxygen saturation of 88% on room air. ECG shows sinus tachycardia and a prominent S wave in lead I, Q wave in lead III, and inverted T wave in lead III (S1Q3T3 pattern). What is the gold-standard diagnostic imaging test to confirm the diagnosis?",
        "options": [
            "CT Pulmonary Angiography (CTPA)",
            "Ventilation-Perfusion (V/Q) lung scan",
            "Transthoracic Echocardiogram (TTE)",
            "Compression ultrasonography of the bilateral lower extremities",
            "Magnetic Resonance Angiography (MRA) of the chest"
        ],
        "answer": 0,
        "exp": "This patient has a high clinical probability of Pulmonary Embolism (PE) based on their recent orthopedic surgery, tachycardia, hypoxia, and classic S1Q3T3 ECG findings. In hemodynamically stable patients with a high pre-test probability or a positive D-dimer, CT Pulmonary Angiography (CTPA) is the gold-standard diagnostic imaging test of choice. V/Q scanning is reserved for patients with contraindications to contrast or radiation (e.g., renal failure, pregnancy)."
    },
    {
        "q": "A {age}-old {gender} presents with sudden-onset, severe, 'tearing' chest pain that radiates directly to their back. Physical exam reveals a blood pressure of 185/95 mmHg in the right arm and 145/70 mmHg in the left arm, along with a new diastolic murmur heard best at the right sternal border. Chest X-ray reveals a widened mediastinum. What is the most appropriate immediate medical management to stabilize this patient?",
        "options": [
            "Intravenous Esmolol to reduce heart rate and shear stress, followed by Nitroprusside if needed",
            "Intravenous Heparin bolus followed by continuous infusion",
            "Intravenous Thrombolysis (Alteplase)",
            "Immediate administration of high-dose sublingual Nitroglycerin alone",
            "Intravenous fluids and emergent administration of Dopamine"
        ],
        "answer": 0,
        "exp": "This patient has an acute aortic dissection (likely Stanford Type A due to the new aortic regurgitation murmur). The immediate goal of medical management in acute aortic dissection is to reduce systolic blood pressure (to 100-120 mmHg) and heart rate (to <60 bpm) to minimize aortic wall shear stress. Intravenous short-acting beta-blockers (e.g., Esmolol or Labetalol) are first-line. Vasodilators like nitroprusside should only be added *after* adequate beta-blockade is achieved to prevent reflex tachycardia."
    },

    # ─── GASTROENTEROLOGY & GENERAL SURGERY ───
    {
        "q": "A {age}-old {gender} presents to the emergency department with severe, constant epigastric pain that radiates to the back, accompanied by nausea and persistent vomiting. Physical examination reveals marked epigastric tenderness and abdominal distention. Laboratory evaluation shows a serum lipase level that is four times the upper limit of normal. What is the most common etiology of this condition in developed countries?",
        "options": [
            "Gallstones (Choledocholithiasis)",
            "Chronic alcohol consumption",
            "Severe hypertriglyceridemia (>1000 mg/dL)",
            "Autoimmune pancreatitis",
            "Drug-induced (e.g., Thiazide diuretics, Azathioprine)"
        ],
        "answer": 0,
        "exp": "The clinical presentation and elevated lipase confirm a diagnosis of acute pancreatitis. In developed countries, the most common etiology of acute pancreatitis is gallstones (accounting for 35-40% of cases), caused by gallstone passage or impaction at the ampulla of Vater. Alcohol consumption is the second most common trigger (30% of cases)."
    },
    {
        "q": "A {age}-old {gender} presents with colicky abdominal pain, persistent nausea, projectile bilious vomiting, and obstipation for 2 days. They have a history of an exploratory laparotomy for a ruptured appendix 10 years ago. Physical exam reveals a distended abdomen with high-pitched, 'tinkling' bowel sounds. Abdominal X-ray shows dilated loops of small bowel with multiple air-fluid levels and a complete lack of gas in the colon. What is the most likely cause of this patient's obstruction?",
        "options": [
            "Post-operative peritoneal adhesions",
            "Incarcerated inguinal hernia",
            "Sigmoid volvulus",
            "Intussusception",
            "Crohn's disease flare"
        ],
        "answer": 0,
        "exp": "This patient presents with a classic mechanical Small Bowel Obstruction (SBO). The most common cause of mechanical SBO in adults is post-operative peritoneal adhesions (accounting for up to 60-70% of cases), which develop after prior abdominal surgery. Incarcerated hernias are the second most common cause. The presence of dilated loops, air-fluid levels, and absence of colonic gas supports a complete or near-complete SBO."
    },
    {
        "q": "A {age}-old {gender} presents with severe abdominal pain, high fever, and yellowing of the eyes. Physical exam reveals a temperature of 39.1°C, scleral icterus, and significant right upper quadrant tenderness. Blood pressure is 85/50 mmHg and they appear lethargic and confused. Lab tests show marked leukocytosis and elevated direct bilirubin. What is the most appropriate next step in management?",
        "options": [
            "Aggressive fluid resuscitation, broad-spectrum IV antibiotics, and urgent biliary decompression via Endoscopic Retrograde Cholangiopancreatography (ERCP)",
            "Emergent open cholecystectomy",
            "Immediate CT scan of the abdomen without contrast followed by observation",
            "Initiate oral ciprofloxacin and recommend outpatient follow-up",
            "Perform an immediate percutaneous liver biopsy"
        ],
        "answer": 0,
        "exp": "This patient presents with Reynolds' Pentad (fever, jaundice, RUQ pain, hypotension, and altered mental status), which is highly specific for acute ascending cholangitis, a life-threatening bacterial infection of the biliary tract secondary to obstruction. The most appropriate immediate management consists of aggressive fluid resuscitation, broad-spectrum intravenous antibiotics, and urgent biliary decompression, typically achieved via ERCP."
    },
    {
        "q": "A {age}-old {gender} with a history of chronic atrial fibrillation presents with sudden onset of severe, diffuse abdominal pain. They have had three loose, watery stools. Physical examination reveals a soft, non-distended abdomen with only mild, diffuse tenderness on palpation, completely out of proportion to the patient's complaints of agonizing pain. Lab tests reveal a significant leukocytosis and metabolic acidosis with an elevated lactate. What is the most likely diagnosis?",
        "options": [
            "Acute Mesenteric Ischemia",
            "Perforated peptic ulcer",
            "Acute diverticulitis",
            "Sigmoid volvulus",
            "Biliary colic"
        ],
        "answer": 0,
        "exp": "Acute Mesenteric Ischemia is a vascular emergency classically caused by an arterial embolus from the left atrium in a patient with poorly controlled atrial fibrillation. The classic presentation is severe, agonizing abdominal pain that is 'out of proportion to physical exam findings' (soft, minimally tender abdomen). The development of metabolic lactic acidosis indicates bowel ischemia and necrosis."
    },

    # ─── NEPHROLOGY & ENDOCRINOLOGY ───
    {
        "q": "A {age}-old {gender} with type 1 diabetes is brought to the emergency department by their family due to lethargy, deep rapid breathing, and abdominal pain. Lab results reveal a serum glucose of 450 mg/dL, arterial pH of 7.15, serum bicarbonate of 10 mEq/L, and positive serum ketones. Their serum potassium is 5.2 mEq/L. What is the most appropriate initial step in fluid and electrolyte management?",
        "options": [
            "Initiate aggressive IV hydration with Normal Saline (0.9% NaCl) and monitor potassium closely, adding potassium to IV fluids as soon as it drops below 5.2 mEq/L",
            "Administer a high-dose bolus of intravenous insulin and give IV potassium only when serum potassium drops below 3.3 mEq/L",
            "Administer sodium bicarbonate ampules immediately to correct the acidosis",
            "Initiate IV hydration with 5% Dextrose in Normal Saline and IV potassium boluses",
            "Restrict all oral and IV fluid intake to prevent cerebral edema"
        ],
        "answer": 0,
        "exp": "This patient has Diabetic Ketoacidosis (DKA). The most critical initial step in DKA management is aggressive volume resuscitation with intravenous Normal Saline (0.9% NaCl) to restore intravascular volume. Insulin therapy should be started, but potassium management is critical: although serum potassium appears normal or elevated due to acidemia shifting potassium extracellularly, total body potassium is severely depleted. Potassium must be added to IV fluids as soon as the level drops below 5.2 mEq/L to prevent fatal hypokalemia driven by insulin therapy."
    },
    {
        "q": "A {age}-old {gender} presents with resistant hypertension, muscle weakness, and occasional muscle cramps. Laboratory evaluation reveals a serum sodium of 144 mEq/L, a serum potassium of 2.8 mEq/L, and metabolic alkalosis. A plasma aldosterone concentration (PAC) to plasma renin activity (PRA) ratio is calculated and is found to be 35. What is the most likely underlying diagnosis?",
        "options": [
            "Primary Hyperaldosteronism (Conn Syndrome)",
            "Renal artery stenosis",
            "Cushing's syndrome",
            "Pheochromocytoma",
            "Fibromuscular dysplasia"
        ],
        "answer": 0,
        "exp": "The clinical triad of resistant hypertension, hypokalemia, and metabolic alkalosis, combined with a high PAC/PRA ratio (>20), is diagnostic of Primary Hyperaldosteronism (Conn Syndrome). This is most commonly caused by an aldosterone-producing adrenal adenoma or bilateral adrenal hyperplasia. Renin is suppressed (low PRA) due to volume expansion from aldosterone-mediated sodium retention."
    },
    {
        "q": "A {age}-old {gender} presents with severe, episodic headaches, excessive sweating (diaphoresis), and palpitations. During these episodes, their blood pressure is found to be 210/110 mmHg. A 24-hour urine collection reveals elevated metanephrines and catecholamines. The patient is scheduled for surgical resection of the tumor. Which of the following preoperative medication regimens is essential to prevent a hypertensive crisis during surgery?",
        "options": [
            "Initiate an alpha-blocker (e.g., Phenoxybenzamine) first, followed by a beta-blocker (e.g., Propranolol)",
            "Initiate a beta-blocker (e.g., Metoprolol) first, followed by an alpha-blocker",
            "Prescribe high-dose intravenous loop diuretics",
            "Initiate monotherapy with a calcium channel blocker (e.g., Amlodipine)",
            "Prescribe high-dose oral Spironolactone"
        ],
        "answer": 0,
        "exp": "This patient has a pheochromocytoma, a catecholamine-secreting tumor of the adrenal medulla. Prior to surgical resection, patients must undergo alpha-adrenergic blockade (first-line is phenoxybenzamine, a non-competitive alpha-blocker) to control blood pressure. Beta-blockers (e.g., propranolol) can be added *only after* adequate alpha-blockade has been established. Giving a beta-blocker first is strictly contraindicated as it leads to unopposed alpha-adrenergic stimulation, causing vasoconstriction and a potentially fatal hypertensive crisis."
    },

    # ─── HEMATOLOGY/ONCOLOGY & INFECTIOUS DISEASE ───
    {
        "q": "A {age}-old {gender} with a history of deep vein thrombosis is hospitalized and started on a continuous intravenous Heparin infusion. On day 5 of therapy, their platelet count drops from 250,000/mm³ to 95,000/mm³, and they develop an acute pain in their left calf with a new thrombus confirmed on ultrasound. What is the most appropriate next step in management?",
        "options": [
            "Discontinue Heparin immediately and initiate a non-heparin anticoagulant such as Argatroban",
            "Double the Heparin infusion rate to treat the new calf thrombus and transfuse platelets",
            "Transition immediately to oral Warfarin (Coumadin) therapy",
            "Discontinue Heparin and start low-molecular-weight heparin (Enoxaparin)",
            "Perform an immediate surgical thrombectomy and continue Heparin"
        ],
        "answer": 0,
        "exp": "This patient has Heparin-Induced Thrombocytopenia (HIT) Type II, a clinicopathologic syndrome caused by IgG autoantibodies targeting the platelet factor 4 (PF4)-heparin complex, leading to platelet activation and a high risk of arterial or venous thrombosis. The diagnostic criteria include a >50% drop in platelet count within 5-10 days of heparin exposure. The critical management steps are: (1) immediate discontinuation of all heparin products (including LMWH and heparin flushes), and (2) initiation of a non-heparin anticoagulant, classically a direct thrombin inhibitor (e.g., Argatroban) or Fondaparinux. Warfarin should NOT be started until platelets recover to >150,000/mm³ due to the risk of venous gangrene from transient protein C depletion."
    },
    {
        "q": "A {age}-old {gender} with small cell lung cancer is undergoing their first cycle of chemotherapy. Three days after treatment, they present to the clinic with a temperature of 38.5°C. They have no specific localized symptoms. Lab evaluation reveals a leukocyte count of 600/mm³ with 10% neutrophils (absolute neutrophil count of 60/mm³). What is the most appropriate next step?",
        "options": [
            "Obtain blood and urine cultures, and immediately initiate broad-spectrum intravenous antipseudomonal monotherapy (e.g., Cefepime or Piperacillin-Tazobactam)",
            "Wait for culture results to return before starting antibiotic therapy to prevent resistance",
            "Prescribe oral Amoxicillin-Clavulanate and send the patient home with close follow-up",
            "Administer subcutaneous Granulocyte Colony-Stimulating Factor (G-CSF) and observe in the clinic",
            "Initiate intravenous Acyclovir and Fluconazole immediately"
        ],
        "answer": 0,
        "exp": "This patient has neutropenic fever, defined as a single oral temperature of >=38.3°C (or >=38.0°C sustained for 1 hour) in a patient with an absolute neutrophil count (ANC) <500/mm³ (or expected to fall below 500/mm³). Neutropenic fever is a medical emergency due to the high risk of rapid, overwhelming bacterial sepsis. After obtaining blood and urine cultures, the patient must immediately receive empiric, broad-spectrum intravenous antibiotic monotherapy with antipseudomonal activity (e.g., Cefepime, Piperacillin-Tazobactam, or Meropenem). Delaying treatment to wait for cultures is associated with high mortality."
    },

    # ─── PEDIATRICS & OB/GYN ───
    {
        "q": "A 32-week pregnant {gender} presents to the labor and delivery unit with a severe, persistent headache and visual spots. Their blood pressure is 165/105 mmHg on two separate readings 15 minutes apart. Urinalysis shows 3+ proteinuria. Which of the following is the most appropriate immediate medical intervention to prevent maternal seizures?",
        "options": [
            "Initiate intravenous Magnesium Sulfate infusion",
            "Administer high-dose intravenous Labetalol only",
            "Prescribe oral Phenytoin therapy",
            "Perform an immediate emergent Cesarean section without prior stabilization",
            "Initiate a continuous infusion of Nitroprusside"
        ],
        "answer": 0,
        "exp": "This patient presents with preeclampsia with severe features (headache, visual changes, severe hypertension, and significant proteinuria). The primary risk is progression to eclampsia (seizures). The standard of care for seizure prophylaxis in preeclampsia with severe features is the administration of intravenous Magnesium Sulfate. Hydralazine or Labetalol should be used to control severe blood pressure, but magnesium sulfate is the specific agent for seizure prevention."
    },

    # ─── PSYCHIATRY & EMERGENCY MEDICINE ───
    {
        "q": "A {age}-old {gender} is brought to the emergency department by their friends due to marked agitation, confusion, and muscle twitching. They report that the patient recently started taking an over-the-counter cough medicine containing dextromethorphan while also taking a prescribed selective serotonin reuptake inhibitor (SSRI) for depression. Physical exam reveals a temperature of 38.6°C, dilated pupils, hyperactive bowel sounds, hyperreflexia, and inducible clonus in the lower extremities. What is the most appropriate first-line pharmacologic treatment for this patient?",
        "options": [
            "Intravenous Benzodiazepines (e.g., Lorazepam) and supportive care, followed by Cyproheptadine if symptoms persist",
            "High-dose intravenous Dantrolene",
            "Immediate administration of Bromocriptine",
            "Intravenous Haloperidol to control agitation",
            "Initiate systemic glucocorticoid therapy"
        ],
        "answer": 0,
        "exp": "This patient has Serotonin Syndrome, triggered by the co-administration of an SSRI and dextromethorphan (which has weak serotonergic activity). Serotonin syndrome is characterized by the triad of mental status changes, autonomic hyperactivity (fever, tachycardia, mydriasis), and neuromuscular abnormalities (hyperreflexia, clonus, tremor). First-line management consists of discontinuing all serotonergic agents, supportive care (cooling, IV fluids), and intravenous benzodiazepines to control agitation and muscle activity. For severe cases unresponsive to benzodiazepines, Cyproheptadine (a serotonin receptor antagonist) can be administered. Dantrolene and Bromocriptine are used in Neuroleptic Malignant Syndrome (NMS)."
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

out_file = "C:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260519_step2_integration_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Clinical Case Integration: Multi-system clinical vignettes\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\n")
    f.write("DECLARE\n")
    f.write("    v_topic_id UUID;\n")
    f.write("BEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'case-vignettes' LIMIT 1;\n")
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
