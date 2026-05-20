import json
import random

topic_slug = 'geri-polypharmacy'

templates = [
    # TEMPLATE 1: PRESCRIBING CASCADE
    {
        "q": "A {age}-old {gender} presents to the clinic with a history of hypertension, osteoarthritis, and new-onset {symptom2}. Review of {possessive} medications reveals: Lisinopril 20 mg daily, Acetaminophen 650 mg three times daily, **{drug1} {dose1}** daily for osteoarthritis pain, and **{drug2} {dose2}** daily which was recently started to treat {symptom1} that developed {duration} weeks ago. Which of the following concepts best describes this clinical scenario, and what is the most appropriate management strategy?",
        "options": [
            "Prescribing cascade; discontinue {drug2} and discontinue or taper {drug1}, replacing it with non-pharmacological therapies or a topical NSAID if appropriate",
            "Polypharmacy; increase the dose of {drug2} to achieve better symptom control and add a third-line agent",
            "Drug-disease interaction; continue both medications and add a proton pump inhibitor to protect the gastric mucosa",
            "Age-related renal clearance failure; perform emergent hemodialysis to clear both drugs from the system",
            "Normal therapeutic progression; continue both medications and refer to orthopedic surgery for joint replacement"
        ],
        "answer": 0,
        "exp": "This clinical scenario illustrates a classic **prescribing cascade**, which occurs when an adverse drug reaction (ADR) is misinterpreted as a new medical condition, leading to the prescription of a second drug to treat the side effect of the first. Here, the use of **{drug1}** (a systemic NSAID/calcium channel blocker) caused **{symptom1}** (hypertension/peripheral edema), which was then treated with **{drug2}** (an antihypertensive/diuretic). Other common prescribing cascades in older adults include: (1) Cholinesterase inhibitors (for dementia) causing urinary incontinence, treated with anticholinergic bladder medications (e.g., oxybutynin), which worsens cognitive impairment. (2) NSAIDs causing dyspepsia/gastritis, treated with PPIs, increasing C. diff risk. (3) Metoclopramide/antipsychotics causing Parkinsonism, treated with Levodopa or benztropine. Management should focus on recognizing the ADR, stopping the offending medication ({drug1}), and subsequently discontinuing the unnecessary second medication ({drug2})."
    },
    # TEMPLATE 2: FIRST-GENERATION ANTIHISTAMINES (DIPHENHYDRAMINE)
    {
        "q": "A {age}-old {gender} is brought to the emergency department by family members due to acute confusion, visual hallucinations, and agitation. The family reports the patient has also been complaining of dry mouth, blurred vision, and difficulty urinating over the past {duration} days. {pronoun_cap} has a history of mild cognitive impairment and insomnia. Review of over-the-counter medications reveals the recent initiation of a ''PM'' sleep aid containing **Diphenhydramine 50 mg** at bedtime. On exam, the patient is tachycardic, has dilated pupils, dry mucous membranes, and a palpable bladder. Which of the following best explains this patient''s symptoms, and what is the Beers Criteria recommendation regarding this class of medication?",
        "options": [
            "Anticholinergic toxicity from a first-generation antihistamine; the Beers Criteria recommends avoiding first-generation antihistamines in older adults due to high risk of anticholinergic side effects (confusion, delirium, dry mouth, urinary retention, constipation, falls)",
            "Atypical presentation of a urinary tract infection; initiate empiric ciprofloxacin and continue diphenhydramine for sleep",
            "Acute ischemic stroke affecting the occipital lobe; order a head CT scan and prepare for tissue plasminogen activator (tPA) administration",
            "Wernicke-Korsakoff syndrome from severe thiamine deficiency; administer high-dose intravenous thiamine and continue diphenhydramine",
            "Benzodiazepine withdrawal syndrome; initiate a diazepam taper and prescribe diphenhydramine as a replacement sleep aid"
        ],
        "answer": 0,
        "exp": "This patient is presenting with **anticholinergic toxicity (delirium, dry mouth, blurred vision, urinary retention, mydriasis, tachycardia)** secondary to the use of **diphenhydramine**, a first-generation antihistamine. The **Beers Criteria** (published by the American Geriatrics Society) strongly recommends **avoiding first-generation antihistamines** (e.g., diphenhydramine, hydroxyzine, chlorpheniramine, promethazine, doxylamine) in older adults. These drugs are highly anticholinergic, and their clearance is reduced in the elderly. They cross the blood-brain barrier readily, leading to severe central nervous system effects (sedation, cognitive impairment, delirium, falls) and peripheral effects (urinary retention, dry mouth, constipation, pupillary dilation). For insomnia or allergic rhinitis, safer alternatives such as non-pharmacological sleep hygiene, low-dose melatonin, second-generation antihistamines (e.g., cetirizine, fexofenadine), or intranasal steroid sprays should be utilized."
    },
    # TEMPLATE 3: BENZODIAZEPINES & Z-DRUGS (ZOLPIDEM, ALPRAZOLAM)
    {
        "q": "A {age}-old {gender} with a history of anxiety and chronic insomnia presents to the clinic after suffering a fall at night while walking to the bathroom. The patient is found to have a non-displaced wrist fracture. {possessive_cap} medication list includes: **{benzo_drug} {benzo_dose}** at bedtime for insomnia and anxiety, which {pronoun} has taken daily for the past 5 years. Which of the following best describes the Beers Criteria recommendation and risks associated with benzodiazepines and non-benzodiazepine receptor agonists (Z-drugs) in older adults?",
        "options": [
            "Avoid benzodiazepines and Z-drugs regardless of half-life, as they increase the risk of cognitive impairment, delirium, falls, fractures, and motor vehicle accidents, and have minimal efficacy in chronic insomnia; manage with a gradual taper",
            "Benzodiazepines with a short half-life (like Alprazolam) are highly recommended and safe for long-term use in older adults to prevent falls from anxiety-induced gait instability",
            "Z-drugs (like Zolpidem) are a safe and non-addictive alternative to benzodiazepines in the elderly, carry no risk of falls, and require no tapering when discontinued",
            "Benzodiazepines should be continued because abrupt discontinuation has no withdrawal symptoms and they are essential for preventing age-related sleep architecture changes",
            "Only long-acting benzodiazepines (like Diazepam) should be avoided; short-acting agents can be used indefinitely without monitoring"
        ],
        "answer": 0,
        "exp": "The **Beers Criteria recommends avoiding all benzodiazepines** (both short-acting like alprazolam, lorazepam, and triazolam, and long-acting like diazepam, chlordiazepoxide, and flurazepam) and **non-benzodiazepine receptor agonist hypnotics (Z-drugs** like zolpidem, zaleplon, and eszopiclone) in older adults. Older adults have increased sensitivity to these agents due to age-related changes in pharmacokinetics (reduced metabolism and prolonged half-life) and pharmacodynamics (increased CNS sensitivity). The use of these medications significantly increases the risk of **cognitive impairment, delirium, falls, hip/wrist fractures, and motor vehicle accidents**. Furthermore, their efficacy for chronic insomnia is minimal due to tolerance. Management involves a **gradual, slow taper** to avoid withdrawal symptoms (which can include severe anxiety, insomnia, tremors, and seizures) and transitioning to non-pharmacological options like Cognitive Behavioral Therapy for Insomnia (CBT-I)."
    },
    # TEMPLATE 4: TRICYCLIC ANTIDEPRESSANTS (AMITRIPTYLINE)
    {
        "q": "A {age}-old {gender} with a history of chronic diabetic neuropathy and depression is evaluated in the clinic. The patient has been taking **Amitriptyline {tca_dose} mg** at bedtime for the past 6 months. {pronoun_cap} reports feeling extremely dizzy and lightheaded upon standing, leading to a near-syncope episode yesterday. Vital signs demonstrate a blood pressure of 130/80 mmHg when supine and **{ortho_bp} mmHg** when standing. Which of the following explains the mechanism of this side effect, and what is the Beers Criteria guidance regarding Amitriptyline?",
        "options": [
            "Amitriptyline causes orthostatic hypotension due to alpha-1 adrenergic blockade and is highly anticholinergic; the Beers Criteria recommends avoiding all TCAs in older adults due to risks of orthostasis, sedation, and cognitive decline",
            "Amitriptyline causes orthostatic hypotension through central beta-blockade; it is the preferred agent for neuropathy in older adults and the dose should be increased to treat depression",
            "Amitriptyline causes orthostatic hypotension due to severe hypernatremia; continue the drug and place the patient on a sodium-restricted diet",
            "TCAs have no anticholinergic or cardiovascular side effects in older adults; the symptoms are due to normal aging and require no medication changes",
            "Amitriptyline causes orthostatic hypotension through direct stimulation of the vagus nerve; treat by adding clonidine daily"
        ],
        "answer": 0,
        "exp": "This patient is experiencing **orthostatic hypotension** (defined as a drop in systolic BP ≥20 mmHg or diastolic BP ≥10 mmHg upon standing) and has a high risk of falls, secondary to **Amitriptyline**, a tricyclic antidepressant (TCA). TCAs cause orthostatic hypotension by blocking **alpha-1 adrenergic receptors**, preventing the compensatory vasoconstriction that normally occurs when standing. Additionally, TCAs have **potent anticholinergic properties** (causing confusion, dry mouth, constipation, urinary retention, and blurred vision) and are sedating. The **Beers Criteria strongly recommends avoiding tricyclic antidepressants** (such as amitriptyline, imipramine, doxepin, nortriptyline) in older adults. For diabetic neuropathic pain, safer alternatives include topical lidocaine, topical capsaicin, gabapentin, pregabalin, or duloxetine (a SNRI with a better safety profile, though requiring monitoring for SIADH/hyponatremia)."
    },
    # TEMPLATE 5: ANTIPSYCHOTICS IN DEMENTIA-RELATED PSYCHOSIS (BLACK BOX WARNING)
    {
        "q": "A {age}-old {gender} with advanced vascular dementia is brought to the clinic by a spouse due to progressive agitation, pacing, and visual hallucinations (seeing strangers in the house). The spouse is exhausted and asks if the patient can be prescribed **{antipsychotic}** to control these behaviors. Which of the following represents the Beers Criteria recommendation and FDA warning regarding the use of atypical or typical antipsychotics in patients with dementia-related behavioral symptoms?",
        "options": [
            "Avoid antipsychotics for behavioral symptoms of dementia unless non-pharmacological interventions have failed AND the patient poses an immediate threat to self or others; antipsychotics carry an FDA Black Box Warning for increased risk of stroke and all-cause mortality in dementia patients",
            "Antipsychotics are highly recommended as first-line therapy for all behavioral symptoms of dementia and should be titrated to maximum dose to prevent hospitalization",
            "Atypical antipsychotics (like Risperidone) are completely safe and FDA-approved for dementia-related agitation, with zero risk of cerebrovascular adverse events",
            "Antipsychotics should only be used if co-administered with a benzodiazepine to eliminate the risk of extrapyramidal symptoms and neuroleptic malignant syndrome",
            "Typical antipsychotics (like Haloperidol) are preferred over atypical agents because they have no impact on mortality or stroke risk in older adults"
        ],
        "answer": 0,
        "exp": "The **Beers Criteria and the FDA strongly caution against the use of atypical and typical antipsychotics** (such as risperidone, olanzapine, quetiapine, haloperidol, aripiprazole) for the behavioral and psychological symptoms of dementia (BPSD). These medications carry an **FDA Black Box Warning** because they are associated with an **increased risk of stroke, cognitive decline, cardiovascular events, and all-cause mortality** in older adults with dementia. The Beers Criteria states they should be **avoided** unless non-pharmacological strategies (such as behavioral modifications, sensory stimulation, or structured routines) have failed, and the patient''s behaviors are severe, distressing, and/or pose an immediate threat of harm to themselves or others. If used, they must be started at the lowest possible dose, monitored closely for side effects (e.g., extrapyramidal symptoms, QT prolongation), and tapered for discontinuation at the earliest opportunity."
    },
    # TEMPLATE 6: DIGOXIN AND LONG-ACTING SULFONYLUREAS (GLYBURIDE)
    {
        "q": "A {age}-old {gender} with a history of type 2 diabetes and chronic heart failure is admitted to the hospital with bradycardia (heart rate 42 bpm), nausea, decreased appetite, and blurry vision with a yellowish-green tint. The patient''s medication list includes: Metformin 1000 mg twice daily, **{sulfonylurea} 5 mg** daily, and **{digoxin_drug} {digoxin_dose} mg** daily. Laboratory evaluation reveals: **creatinine {cr} mg/dL** (normal: 0.6-1.2, baseline 0.8), potassium 3.6 mEq/L, and a blood glucose of **{bg} mg/dL**. Which of the following represents the most likely cause of this presentation, and what is the Beers Criteria recommendation for these high-risk drug classes?",
        "options": [
            "Digoxin toxicity (due to renal accumulation causing bradycardia/nausea/xanthopsia) and sulfonylurea-induced hypoglycemia; the Beers Criteria recommends avoiding {digoxin_drug} as first-line therapy and avoiding {sulfonylurea} in older adults",
            "Atypical acute myocardial infarction; the patient requires immediate fibrinolytic therapy and continuation of all medications",
            "Normal progression of diabetic ketoacidosis; treat with insulin infusion and double the dose of {digoxin_drug} to stabilize the heart rate",
            "Metformin-associated lactic acidosis alone; the other drugs are safe and should be continued at current doses",
            "Age-related macular degeneration and chronic pancreatitis; manage with intraocular injections and pancreatic enzyme replacement"
        ],
        "answer": 0,
        "exp": "This patient exhibits classic signs of **Digoxin toxicity** (bradycardia, nausea, anorexia, and **xanthopsia**—blurry yellow-green vision) along with severe **hypoglycemia (blood glucose of {bg} mg/dL)**. Digoxin is cleared renally, and even a mild acute-on-chronic kidney injury (**creatinine of {cr} mg/dL**) can cause digoxin to accumulate to toxic levels. The **Beers Criteria recommends avoiding digoxin** as first-line therapy for heart failure or atrial fibrillation due to its narrow therapeutic index and risk of toxicity in older adults. Furthermore, the Beers Criteria **strongly recommends avoiding long-acting sulfonylureas** (such as **{sulfonylurea}** and glimepiride) in older adults because they have a prolonged duration of action and carry an exceptionally high risk of **severe, prolonged, and potentially fatal hypoglycemia**. Preferred alternatives for diabetes include metformin, SGLT2 inhibitors, or DPP-4 inhibitors, and for rate control, beta-blockers or non-dihydropyridine calcium channel blockers."
    },
    # TEMPLATE 7: NSAIDS IN ELDERLY (RENAL & GI RISKS)
    {
        "q": "A {age}-old {gender} with a history of osteoarthritis, chronic kidney disease (Stage 3, baseline eGFR 45 mL/min), and chronic heart failure is evaluated for progressive shortness of breath, bilateral ankle edema, and epigastric pain. The patient reports taking **{nsaid_drug} {nsaid_dose} mg** three times daily for the past 3 weeks for knee pain. Diagnostic workup reveals a serum **creatinine of {cr} mg/dL** (eGFR decreased to 22 mL/min) and a **hemoglobin of {hb} g/dL** (baseline 12.5 g/dL). Which of the following best describes the pathophysiology of this patient''s complications and the Beers Criteria recommendation for NSAIDs?",
        "options": [
            "NSAIDs inhibit afferent arteriolar vasodilatory prostaglandins causing acute kidney injury, promote sodium/water retention worsening heart failure, and cause direct/indirect mucosal injury causing GI blood loss; avoid chronic oral NSAIDs in older adults",
            "NSAIDs cause renal papillary necrosis through direct calcification of the ureters, have no impact on sodium excretion, and are completely safe for chronic use if taken with meals",
            "NSAIDs stimulate the renin-angiotensin-aldosterone system causing renal artery dilation and hypokalemia; they should be continued with a potassium supplement",
            "The patient''s symptoms are due to normal progression of heart failure and kidney disease; the {nsaid_drug} is protective and the dose should be increased to reduce systemic inflammation",
            "NSAIDs selectively cause constriction of the efferent arteriole, increasing GFR and creatinine clearance; the low hemoglobin is due to age-related myelodysplastic syndrome"
        ],
        "answer": 0,
        "exp": "This patient is experiencing three classic complications of **NSAID therapy in older adults**: (1) **Acute Kidney Injury**: NSAIDs inhibit cyclooxygenase (COX), reducing the synthesis of renal prostaglandins (PGE2, PGI2) which are responsible for maintaining patency of the **afferent arteriole** via vasodilation. Loss of these prostaglandins leads to afferent vasoconstriction, decreased renal perfusion, and a drop in GFR (indicated by creatinine rising to {cr} mg/dL). (2) **Exacerbation of Heart Failure**: NSAIDs increase sodium and water reabsorption in the thick ascending limb, leading to fluid retention, peripheral edema, and acute decompensation of heart failure. (3) **Gastrointestinal bleeding**: Systemic COX-1 inhibition reduces cytoprotective prostaglandins in the stomach, increasing the risk of peptic ulcer disease and GI bleeding (evidenced by the decrease in hemoglobin to {hb} g/dL). The **Beers Criteria recommends avoiding chronic oral NSAIDs** in older adults. If needed, topical NSAIDs (like diclofenac gel) or acetaminophen should be preferred."
    },
    # TEMPLATE 8: ANTISPASMODICS & URINARY ANTIMUSCARINICS (OXYBUTYNIN)
    {
        "q": "A {age}-old {gender} with mild cognitive impairment is evaluated for worsening urinary urgency and frequency. The patient was started on **Oxybutynin 5 mg** three times daily {duration} weeks ago. Since then, the caregiver reports the patient has become significantly more confused, is having dry mouth that interferes with swallowing, has developed severe constipation, and has had {falls_count} near-falls. Which of the following represents the Beers Criteria recommendation and preferred alternative management for this condition?",
        "options": [
            "Avoid oral Oxybutynin and other highly anticholinergic urinary antimuscarinics in older adults due to risks of cognitive decline, delirium, dry mouth, constipation, and falls; prefer non-pharmacological therapies or Mirabegron (a beta-3 agonist)",
            "Increase the Oxybutynin dose to 10 mg three times daily and prescribe a laxative for constipation and donepezil for the confusion",
            "Oxybutynin is the safest and most effective first-line therapy for urinary urgency in patients with cognitive impairment, and the confusion is likely unrelated",
            "Switch the patient to Tolterodine, which has zero anticholinergic side effects and is highly recommended by the Beers Criteria",
            "Discontinue Oxybutynin and perform a routine indwelling Foley catheterization to manage the urinary urgency and prevent falls"
        ],
        "answer": 0,
        "exp": "The **Beers Criteria strongly recommends avoiding oral Oxybutynin** and other strongly anticholinergic antimuscarinic medications (such as tolterodine, solifenacin, darifenacin, fesoterodine) for urge urinary incontinence/overactive bladder in older adults. These drugs have a high **anticholinergic burden**, which worsens cognitive function, increases the risk of delirium (especially in patients with baseline cognitive impairment), and causes distressing peripheral side effects (dry mouth, constipation, blurred vision, urinary retention). This significantly increases the risk of **falls and fractures**. Safer alternatives include: (1) **Non-pharmacological therapies** (bladder training, pelvic floor muscle exercises, scheduled voiding), or (2) **Mirabegron** (a beta-3 adrenergic agonist) which stimulates detrusor relaxation without any anticholinergic side effects, making it much safer in patients with cognitive impairment or high anticholinergic burden."
    },
    # TEMPLATE 9: SKELETAL MUSCLE RELAXANTS (CYCLOBENZAPRINE)
    {
        "q": "A {age}-old {gender} is evaluated in the clinic for lower back pain after lifting a grocery bag. {pronoun_cap} has a history of benign prostatic hyperplasia and mild cognitive impairment. The patient asks for a prescription of **{muscle_relaxant} {mr_dose} mg** three times daily, which {pronoun} heard is effective for muscle spasms. Which of the following is the Beers Criteria recommendation regarding skeletal muscle relaxants in older adults?",
        "options": [
            "Avoid all skeletal muscle relaxants in older adults, as they are poorly tolerated due to strong anticholinergic side effects, sedation, and a high risk of falls, fractures, and delirium, while having questionable efficacy",
            "Skeletal muscle relaxants (such as {muscle_relaxant}) are highly recommended as first-line therapy for acute musculoskeletal pain in patients over 75",
            "Skeletal muscle relaxants are safe to use in older adults provided they are combined with a long-acting benzodiazepine to maximize muscle relaxation",
            "{muscle_relaxant} is the drug of choice for elderly patients with BPH because it relaxes the bladder neck and improves urinary flow",
            "Only Carisoprodol should be avoided; all other skeletal muscle relaxants have no anticholinergic properties and can be used without restrictions"
        ],
        "answer": 0,
        "exp": "The **Beers Criteria recommends avoiding all skeletal muscle relaxants** (such as **{muscle_relaxant}**, carisoprodol, chlorzoxazone, metaxalone, methocarbamol, orphenadrine) in older adults. Most skeletal muscle relaxants are **highly anticholinergic**, sedating, and cause significant central nervous system depression. Consequently, they are poorly tolerated in older adults and are associated with a **high risk of falls, fractures, cognitive impairment, delirium, and urinary retention** (which can cause acute urinary obstruction in patients with baseline BPH). Furthermore, clinical evidence of their effectiveness at doses tolerated by older adults is weak. Acute musculoskeletal pain in older adults should be managed with non-pharmacological therapies (heat, physical therapy), topical NSAIDs, acetaminophen, or short courses of oral NSAIDs (if no contraindications exist and with gastroprotection)."
    },
    # TEMPLATE 10: PPI OVERUSE & DE-PRESCRIBING RISKS
    {
        "q": "A {age}-old {gender} is seen for a routine wellness visit. Medication review shows the patient has been taking **Omeprazole 40 mg daily for {duration} years** for ''acid reflux.'' {pronoun_cap} reports no active reflux symptoms and has never had a documented history of peptic ulcer disease, Barrett''s esophagus, or severe erosive esophagitis. Which of the following represents the Beers Criteria guidance regarding the long-term use of Proton Pump Inhibitors (PPIs) in older adults, and what are the associated risks?",
        "options": [
            "Avoid scheduled PPI use for >8 weeks unless high-risk indications are present (e.g., oral corticosteroid/chronic NSAID use, severe esophagitis); long-term use increases risks of C. difficile infection, bone loss/fractures, and B12 deficiency",
            "PPIs should be continued indefinitely in all older adults as they are completely safe and prevent all-cause gastrointestinal bleeding",
            "PPIs should be stopped immediately without tapering, as there is no risk of rebound acid hypersecretion",
            "Long-term PPI use is highly recommended by the Beers Criteria because it enhances calcium and magnesium absorption in the duodenum",
            "Avoid PPIs only in patients with a history of hypertension; for all other patients, they should be used first-line for mild dyspepsia"
        ],
        "answer": 0,
        "exp": "The **Beers Criteria recommends avoiding scheduled Proton Pump Inhibitor (PPI)** use for **more than 8 weeks** in older adults, unless the patient has a clear, high-risk indication (e.g., chronic oral corticosteroid or NSAID use, severe erosive esophagitis, documented Barrett''s esophagus, or pathological hypersecretory conditions). Long-term PPI use is associated with several significant risks in older adults: (1) **Clostridioides difficile-associated diarrhea and pneumonia** (due to suppression of gastric acid, which normally acts as a barrier against pathogens), (2) **bone loss, osteoporosis, and hip/wrist fractures** (due to impaired absorption of calcium and magnesium, which require an acidic environment), and (3) **Vitamin B12 deficiency** (as gastric acid is required to cleave B12 from dietary protein). When de-prescribing PPIs, a **gradual taper** or switching to an as-needed H2 receptor antagonist is recommended to avoid **rebound gastric acid hypersecretion**."
    }
]

genders_pool = [
    {"gender": "female", "pronoun": "she", "pronoun_cap": "She", "possessive": "her", "possessive_cap": "Her"},
    {"gender": "male", "pronoun": "he", "pronoun_cap": "He", "possessive": "his", "possessive_cap": "His"},
    {"gender": "woman", "pronoun": "she", "pronoun_cap": "She", "possessive": "her", "possessive_cap": "Her"},
    {"gender": "man", "pronoun": "he", "pronoun_cap": "He", "possessive": "his", "possessive_cap": "His"}
]

mcqs = []
seen_questions = set()
counter = 0

# Variables for randomize formatting
prescribing_cascades = [
    {"drug1": "Amlodipine", "dose1": "10 mg", "symptom1": "bilateral peripheral edema", "drug2": "Furosemide", "dose2": "20 mg", "symptom2": "urinary frequency"},
    {"drug1": "Ibuprofen", "dose1": "800 mg", "symptom1": "elevated blood pressure", "drug2": "Metoprolol succinate", "dose2": "25 mg", "symptom2": "bradycardia and fatigue"},
    {"drug1": "Donepezil", "dose1": "10 mg", "symptom1": "urinary urge incontinence", "drug2": "Oxybutynin", "dose2": "5 mg", "symptom2": "confusion and dry mouth"}
]

benzos_pool = [
    {"benzo_drug": "Alprazolam", "benzo_dose": "0.5 mg"},
    {"benzo_drug": "Diazepam", "benzo_dose": "5 mg"},
    {"benzo_drug": "Zolpidem", "benzo_dose": "10 mg"},
    {"benzo_drug": "Temazepam", "benzo_dose": "15 mg"}
]

sulfonylureas_pool = ["Glyburide", "Glimepiride"]
digoxins_pool = [
    {"digoxin_drug": "Digoxin", "digoxin_dose": "0.25", "cr": "1.7"},
    {"digoxin_drug": "Lanoxin", "digoxin_dose": "0.125", "cr": "1.5"}
]

nsaids_pool = [
    {"nsaid_drug": "Naproxen", "nsaid_dose": "500"},
    {"nsaid_drug": "Meloxicam", "nsaid_dose": "15"},
    {"nsaid_drug": "Ibuprofen", "nsaid_dose": "600"},
    {"nsaid_drug": "Diclofenac", "nsaid_dose": "75"}
]

antipsychotics_pool = ["Haloperidol", "Risperidone", "Quetiapine", "Olanzapine"]
muscle_relaxants_pool = [
    {"muscle_relaxant": "Cyclobenzaprine", "mr_dose": "10"},
    {"muscle_relaxant": "Carisoprodol", "mr_dose": "350"},
    {"muscle_relaxant": "Methocarbamol", "mr_dose": "750"}
]

while counter < 300:
    for t_idx, t in enumerate(templates):
        if counter >= 300:
            break
        age = random.randint(66, 94)
        gp = random.choice(genders_pool)
        duration = random.randint(2, 6)
        
        # Cascade selection
        casc = random.choice(prescribing_cascades)
        
        # Benzo selection
        bz = random.choice(benzos_pool)
        
        # TCA selection
        tca_dose = random.choice([25, 50, 75])
        ortho_bp = f"{random.randint(92, 104)}/{random.randint(54, 62)}"
        
        # Antipsychotic selection
        antipsychotic = random.choice(antipsychotics_pool)
        
        # Digoxin selection
        su = random.choice(sulfonylureas_pool)
        dig = random.choice(digoxins_pool)
        bg = random.randint(42, 58)
        
        # NSAID selection
        ns = random.choice(nsaids_pool)
        cr = round(random.uniform(1.6, 2.5), 1)
        hb = round(random.uniform(8.4, 9.9), 1)
        
        # Muscle relaxant selection
        mr = random.choice(muscle_relaxants_pool)
        
        # Falls count
        falls_count = random.randint(1, 3)

        q_text = t['q'].format(
            age=age, gender=gp['gender'], pronoun=gp['pronoun'], pronoun_cap=gp['pronoun_cap'],
            possessive=gp['possessive'], possessive_cap=gp['possessive_cap'],
            duration=duration,
            drug1=casc['drug1'], dose1=casc['dose1'], symptom1=casc['symptom1'],
            drug2=casc['drug2'], dose2=casc['dose2'], symptom2=casc['symptom2'],
            benzo_drug=bz['benzo_drug'], benzo_dose=bz['benzo_dose'],
            tca_dose=tca_dose, ortho_bp=ortho_bp, antipsychotic=antipsychotic,
            sulfonylurea=su, digoxin_drug=dig['digoxin_drug'], digoxin_dose=dig['digoxin_dose'],
            cr=cr, bg=bg, nsaid_drug=ns['nsaid_drug'], nsaid_dose=ns['nsaid_dose'], hb=hb,
            muscle_relaxant=mr['muscle_relaxant'], mr_dose=mr['mr_dose'], falls_count=falls_count
        )

        opts_formatted = []
        for o in t['options']:
            o_fmt = o.format(
                drug1=casc['drug1'], dose1=casc['dose1'], symptom1=casc['symptom1'],
                drug2=casc['drug2'], dose2=casc['dose2'], symptom2=casc['symptom2'],
                benzo_drug=bz['benzo_drug'], benzo_dose=bz['benzo_dose'],
                tca_dose=tca_dose, ortho_bp=ortho_bp, antipsychotic=antipsychotic,
                sulfonylurea=su, digoxin_drug=dig['digoxin_drug'], digoxin_dose=dig['digoxin_dose'],
                cr=cr, bg=bg, nsaid_drug=ns['nsaid_drug'], nsaid_dose=ns['nsaid_dose'], hb=hb,
                muscle_relaxant=mr['muscle_relaxant'], mr_dose=mr['mr_dose']
            )
            opts_formatted.append(o_fmt)

        exp_formatted = t['exp'].format(
            drug1=casc['drug1'], dose1=casc['dose1'], symptom1=casc['symptom1'],
            drug2=casc['drug2'], dose2=casc['dose2'], symptom2=casc['symptom2'],
            benzo_drug=bz['benzo_drug'], benzo_dose=bz['benzo_dose'],
            tca_dose=tca_dose, ortho_bp=ortho_bp, antipsychotic=antipsychotic,
            sulfonylurea=su, digoxin_drug=dig['digoxin_drug'], digoxin_dose=dig['digoxin_dose'],
            cr=cr, bg=bg, nsaid_drug=ns['nsaid_drug'], nsaid_dose=ns['nsaid_dose'], hb=hb,
            muscle_relaxant=mr['muscle_relaxant'], mr_dose=mr['mr_dose']
        )

        correct_opt = opts_formatted[t['answer']]
        random.shuffle(opts_formatted)
        new_ans_idx = opts_formatted.index(correct_opt)

        q_esc = q_text.replace("'", "''")
        opts_json = json.dumps(opts_formatted).replace("'", "''")
        exp_esc = exp_formatted.replace("'", "''")

        mcq_str = f"    (v_topic_id, '{q_esc}', '{opts_json}'::jsonb, {new_ans_idx}, '{exp_esc}')"

        if q_text not in seen_questions:
            seen_questions.add(q_text)
            mcqs.append(mcq_str)
            counter += 1

out_file = r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260520_geri_polypharmacy_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Geriatrics: Polypharmacy & Beers Criteria — high-risk drug classes in elderly\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\nDECLARE\n    v_topic_id UUID;\nBEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'geri-polypharmacy' LIMIT 1;\n")
    f.write("    IF v_topic_id IS NULL THEN\n        RAISE EXCEPTION 'Topic geri-polypharmacy not found.';\n    END IF;\n\n")
    f.write("    DELETE FROM mcqs WHERE topic_id = v_topic_id;\n\n")
    f.write("    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES\n")
    for i, m in enumerate(mcqs):
        if i < len(mcqs) - 1:
            f.write(m + ",\n")
        else:
            f.write(m + ";\n")
    f.write("END $$;\nCOMMIT;\n")

print(f"Generated {len(mcqs)} MCQs to {out_file}")
