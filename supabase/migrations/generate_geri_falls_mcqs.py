import json
import random

topic_slug = 'geri-falls'

templates = [
    # ─── TEMPLATE 1: PARKINSONIAN GAIT & DRUG-INDUCED PARKINSONISM ───
    {
        "q": "A {age}-old {gender} is brought to the outpatient clinic by {possessive} family due to a {duration}-month history of multiple unexplained falls, most recently occurring when {pronoun} tried to turn around quickly. The patient's family notes that {pronoun} has become increasingly slow-moving and quiet. History is notable for type 2 diabetes mellitus complicated by gastroparesis, for which {pronoun} was prescribed {offending_med} {med_months} months ago. The patient is on a total of {pill_count} daily medications. Physical examination reveals:<br>• Gait: <b>Shuffling, short-stepped gait with decreased arm swing, and significant postural instability (falls backward on the pull test)</b><br>• Motor exam: <b>Mild resting tremor in the right hand and bilateral cogwheel rigidity</b><br>• Mental status: <b>Alert and oriented to person, place, and time; no cognitive decline</b><br><br>What is the most likely diagnosis, and what is the most appropriate next step in management?",
        "options": [
            "Drug-induced parkinsonism secondary to {offending_med}; taper and discontinue the offending medication, and transition to a safe prokinetic alternative if gastroparesis symptoms recur",
            "Idiopathic Parkinson's disease; initiate high-dose levodopa-carbidopa therapy immediately and schedule a brain MRI",
            "Normal pressure hydrocephalus; perform a diagnostic high-volume lumbar puncture (CSF tap test) to evaluate for shunt placement",
            "Vascular parkinsonism; initiate aggressive antiplatelet therapy with aspirin and clopidogrel, and check a lipid panel",
            "Progressive supranuclear palsy; initiate baclofen therapy for spasticity and refer the patient for speech therapy"
        ],
        "answer": 0,
        "exp": "This patient presents with classic features of **drug-induced parkinsonism (DIP)**. DIP is the second most common cause of parkinsonism in the elderly and is frequently misdiagnosed as idiopathic Parkinson's disease. The key clues are the **subacute onset** of symmetric parkinsonian features (shuffling gait, bradykinesia, cogwheel rigidity, postural instability) and the **use of a dopamine D2 receptor antagonist**. In this case, **{offending_med}** (frequently used for diabetic gastroparesis or as an antiemetic) is the culprit. Other common offending agents include antipsychotics (haloperidol, risperidone), prochlorperazine, and fluphenazine. The first-line and definitive management is to **discontinue the offending medication**. Parkinsonian symptoms typically resolve within weeks to months after withdrawal. If prokinetic therapy is still required for gastroparesis, safe alternatives like erythromycin or domperidone (which does not cross the blood-brain barrier) should be considered."
    },

    # ─── TEMPLATE 2: ORTHOSTATIC HYPOTENSION ───
    {
        "q": "A {age}-old {gender} presents with a {duration}-week history of frequent lightheadedness, dizziness, and a feeling of near-blackout upon standing up from a chair or getting out of bed in the morning. These symptoms have led to {fall_count} falls over the past month. The patient's current medications include {medication} for {indication}. Physical examination is notable for a normal cardiac exam and no focal neurological deficits. Vital signs are recorded as follows:<br>• Supine: <b>BP {supine_sbp}/{supine_dbp} mmHg, HR {supine_hr} bpm</b> (after lying down for 5 minutes)<br>• Standing (at 3 minutes): <b>BP {standing_sbp}/{standing_dbp} mmHg, HR {standing_hr} bpm</b><br><br>What is the most likely diagnosis, and what is the best initial management strategy?",
        "options": [
            "Orthostatic hypotension secondary to autonomic insufficiency and {medication} use; slowly taper and discontinue the offending medication, advise the patient to stand up in stages, liberalize sodium and fluids (if no contraindications), and consider physical maneuvers",
            "Vasovagal syncope; recommend strict bed rest, initiate daily low-dose beta-blocker therapy, and advise avoiding all sodium intake",
            "Carotid sinus hypersensitivity; perform immediate carotid sinus massage at the bedside and schedule the patient for dual-chamber pacemaker placement",
            "Aortic stenosis; schedule an emergent transthoracic echocardiogram and refer the patient for urgent surgical valve replacement",
            "Dehydration; administer a 2-liter intravenous bolus of normal saline and prescribe daily oral fludrocortisone as first-line outpatient monotherapy"
        ],
        "answer": 0,
        "exp": "This patient has **orthostatic hypotension (OH)**, defined as a **decrease in systolic blood pressure of at least 20 mmHg or diastolic blood pressure of at least 10 mmHg within 3 minutes of standing** from a supine position. The drop here (from {supine_sbp}/{supine_dbp} to {standing_sbp}/{standing_dbp}) meets these criteria. OH in the elderly is commonly caused by a combination of age-related declines in baroreceptor sensitivity, decreased arterial compliance, and **exacerbating medications** (especially alpha-blockers like {medication}, diuretics, vasodilators, or TCAs). The initial management of OH involves: (1) **reviewing and tapering/discontinuing offending medications**, (2) implementing **non-pharmacological measures** such as rising slowly in stages, avoiding sudden head movements, **liberalizing salt and fluid intake** (if the patient does not have heart failure or advanced chronic kidney disease), wearing abdominal binders or compression stockings, and elevating the head of the bed by 10-20 degrees at night. Pharmacotherapy (e.g., Midodrine, Fludrocortisone) is reserved for severe, refractory cases."
    },

    # ─── TEMPLATE 3: NORMAL PRESSURE HYDROCEPHALUS (NPH) ───
    {
        "q": "A {age}-old {gender} is brought to the clinic by {possessive} spouse due to a progressive, {duration}-month history of gait instability and frequent falls. The spouse also notes that the patient has developed a 'magnetic' gait, where {possessive} feet appear to be glued to the floor. Over the same period, the patient has developed urinary urgency and occasional incontinence, alongside mild cognitive changes, including forgetfulness and psychomotor slowing. Physical examination reveals:<br>• Gait: <b>Slow, wide-based, short-stepped gait with difficulty initiating walking and turning (magnetic gait)</b><br>• Mini-Mental State Examination (MMSE) score: <b>{mmse}/30</b><br>• Brain MRI: <b>Ventriculomegaly (enlarged lateral ventricles) out of proportion to cerebral sulcal atrophy</b><br>• Lumbar puncture: <b>Opening pressure {opening_pressure} mmH2O</b> (normal)<br><br>What is the most likely diagnosis, and what is the gold-standard diagnostic test and definitive treatment for this condition?",
        "options": [
            "Normal Pressure Hydrocephalus (NPH); diagnosed by transient gait improvement following a high-volume lumbar puncture (CSF tap test), and treated definitively with a ventriculoperitoneal (VP) shunt",
            "Alzheimer's disease with secondary motor decline; diagnosed by CSF amyloid/tau ratios, and treated definitively with donepezil and memantine",
            "Parkinson's disease dementia; diagnosed by clinical response to a levodopa trial, and treated definitively with deep brain stimulation (DBS)",
            "Vascular dementia; diagnosed by multi-infarct lesions on MRI, and treated definitively with daily low-dose aspirin and atorvastatin",
            "Cerebellar degeneration; diagnosed by visible cerebellar atrophy on MRI, and treated definitively with high-dose vitamin B12 injections"
        ],
        "answer": 0,
        "exp": "This patient presents with the classic triad of **Normal Pressure Hydrocephalus (NPH)**: **gait disturbance** (classically a 'magnetic' gait with difficulty initiating walking and short, shuffling steps), **urinary urgency/incontinence**, and **cognitive decline** (often referred to as 'wet, wobbly, and wacky'). The gait disturbance is typically the first and most prominent symptom. Brain MRI classically shows ventricular enlargement out of proportion to cortical sulcal thinning. The opening pressure on lumbar puncture is **normal** (typically 70-200 mmH2O). The gold-standard diagnostic test to predict shunt responsiveness is a **high-volume lumbar puncture (CSF tap test)**, where 30-50 mL of CSF is removed, followed by objective gait testing before and after the tap. Improvement in gait speed, balance, or turning time is highly predictive of a positive response to the definitive treatment, which is the surgical insertion of a **ventriculoperitoneal (VP) shunt**."
    },

    # ─── TEMPLATE 4: SARCOPENIA & FRAILTY SYNDROME ───
    {
        "q": "A {age}-old {gender} is evaluated during a routine health maintenance visit. The patient reports feeling increasingly weak, easily fatigued, and slow on {possessive} feet, with {fall_count} near-falls inside {possessive} home over the past {duration} months. Over the past year, the patient has experienced an unintentional weight loss of {weight_loss} lbs. Physical and functional assessments reveal:<br>• Gait speed: <b>{gait_speed} m/s</b> (measured over a 4-meter course)<br>• Handgrip strength: <b>{grip_strength} kg</b> (measured by dynamometer; normal is >27 kg for men, >16 kg for women)<br>• Skeletal muscle mass index: <b>Significantly reduced</b> on dual-energy X-ray absorptiometry (DEXA)<br>• Labs: <b>TSH, Vitamin D, Vitamin B12, and basic metabolic panels are completely normal</b><br><br>What is the most likely diagnosis, and what is the most effective evidence-based intervention to reduce falls risk and improve functional status in this patient?",
        "options": [
            "Sarcopenia and Frailty Syndrome; prescribe progressive resistance training/physical therapy and a high-protein nutritional diet",
            "Anorexia of aging; prescribe daily oral megestrol acetate and recommend strict bed rest to conserve energy",
            "Subclinical hypothyroidism; initiate low-dose levothyroxine therapy and advise avoidance of strenuous physical activity",
            "Amyotrophic lateral sclerosis (ALS); initiate riluzole therapy and refer the patient for emergent occupational therapy",
            "Polymyalgia rheumatica; initiate a moderate-dose oral prednisone course (15 mg daily) and advise absolute rest"
        ],
        "answer": 0,
        "exp": "This patient meets the clinical criteria for **Sarcopenia and Frailty Syndrome**. Sarcopenia is defined as the age-related progressive loss of skeletal muscle mass, strength, and physical performance. Frailty is a clinical syndrome characterized by a state of increased vulnerability to stressors, defined by Fried's criteria (meeting ≥ 3 of: **unintentional weight loss**, **self-reported exhaustion**, **weakness/low grip strength**, **slowness/slow gait speed**, and **low physical activity**). The patient has low gait speed ({gait_speed} m/s; < 0.8 m/s is highly suggestive of high falls risk and poor outcomes), low grip strength ({grip_strength} kg), and unintentional weight loss. The most effective, evidence-based intervention for sarcopenia and frailty is **progressive resistance exercise training (PRT)** combined with **aerobic and balance training (physical therapy)** and a **high-protein nutritional diet** (1.2-1.5 g/kg/day) to stimulate muscle protein synthesis."
    },

    # ─── TEMPLATE 5: TIMED UP AND GO (TUG) TEST & RISK STRATIFICATION ───
    {
        "q": "A {age}-old {gender} with a history of hypertension and osteoarthritis presents for an annual wellness visit. The patient reports having experienced {fall_count} fall {duration} months ago while walking in {possessive} backyard, resulting in minor bruising but no fractures. As part of a systematic fall risk assessment, the physician performs the **Timed Up and Go (TUG)** test. The patient stands up from a standard chair, walks 3 meters at {possessive} normal pace, turns, walks back, and sits down. The test takes **{tug_time} seconds** to complete. Ocular and basic sensory examinations are stable. What is the correct interpretation of this TUG test result, and what is the most appropriate next step in clinical management?",
        "options": [
            "The TUG test result indicates a high risk of falls (TUG ≥ 12 - 14 seconds); perform a comprehensive multifactorial falls risk assessment (evaluating medications, orthostatic vitals, vision, balance, home environment, and gait details)",
            "The TUG test result is completely normal (TUG < 20 seconds); reassure the patient, advise continued routine activities, and repeat the TUG test in 3 years",
            "The TUG test result is abnormal; immediately refer the patient to a cardiologist for an electrophysiology study and ambulatory Holter monitor",
            "The TUG test result indicates severe motor apraxia; obtain an emergent non-contrast brain CT scan to rule out acute ischemic stroke",
            "The TUG test result is abnormal; immediately prescribe daily oral alendronate and initiate a high-dose Vitamin D regimen without further diagnostic workup"
        ],
        "answer": 0,
        "exp": "The **Timed Up and Go (TUG)** test is a rapid, high-yield clinical tool used to assess a patient's mobility, balance, and fall risk. A completion time of **{tug_time} seconds** is abnormal; **times ≥ 12-14 seconds indicate a high risk for future falls** in community-dwelling older adults. According to the American Geriatrics Society (AGS) and British Geriatrics Society (BGS) guidelines, any community-dwelling older adult who presents with a history of falls, balance/gait complaints, or an abnormal TUG test should undergo a **comprehensive multifactorial falls risk assessment**. This multifactorial assessment includes: (1) detailed review of all prescription and over-the-counter medications (targeting Beers Criteria drugs), (2) checking for orthostatic hypotension (lying and standing vitals), (3) formal assessment of vision, gait, balance, joint range of motion, muscle strength, and neurological function, (4) assessment of cognitive function, and (5) home safety/environmental hazard evaluation."
    },

    # ─── TEMPLATE 6: HOME SAFETY ASSESSMENT & ENVIROMENTAL MODIFICATIONS ───
    {
        "q": "A {age}-old {gender} is being discharged back home after being treated for a minor non-displaced humeral fracture sustained during a fall in {possessive} living room. The patient has a history of moderate knee osteoarthritis and mild cognitive impairment. {possessive_cap} family is highly concerned about the safety of {possessive} home environment and asks what modifications are most effective in reducing the risk of recurrent falls. The home is a single-family house with {home_detail}. According to the American Geriatrics Society guidelines, which of the following represents the most appropriate and evidence-based recommendation for environmental falls prevention in this patient?",
        "options": [
            "Arrange a professional home safety assessment to systematically remove loose area rugs, secure loose extension cords, install grab bars in the bathroom, place non-slip mats in the tub, and improve lighting in all hallways and staircases",
            "Recommend that the patient remain strictly on the first floor at all times, wear soft-soled socks instead of shoes, and keep the home dim to prevent glare",
            "Install soft carpet padding over all existing hardwood floors and instruct the family to apply high-gloss wax to all vinyl tiles to make them easier to clean",
            "Advise the patient to avoid all physical activity and functional tasks at home, and prescribe a portable wheelchair as the primary mode of indoor mobilization",
            "Recommend installing high-frequency ultrasonic motion detectors and sound alarms at the base of all walls, and purchase a motorized stair-lift as the sole environmental intervention"
        ],
        "answer": 0,
        "exp": "Environmental hazards contribute to approximately 30-50% of all falls in older adults. According to the AGS/BGS clinical practice guidelines, a **home safety assessment and environmental hazard modification** conducted by a professional (such as an occupational therapist) is a highly effective, evidence-based intervention to prevent recurrent falls, especially in high-risk individuals (such as those with a history of falls, osteoarthritis, and cognitive impairment). Key interventions include: (1) **removing loose throw rugs** or securing them with non-slip backing, (2) clearing clutter and **loose electrical cords** from walking pathways, (3) **installing sturdy grab bars** in the shower/tub and near the toilet, (4) placing **non-slip adhesive mats** in the tub, (5) ensuring **excellent lighting** in all walkways, hallways, and staircases (including nightlights), and (6) ensuring stable handrails on both sides of all staircases. Patients should also be advised to wear **supportive, well-fitting shoes with non-slip soles** rather than walking barefoot, in socks, or in loose slippers."
    },

    # ─── TEMPLATE 7: VITAMIN B12 DEFICIENCY (SENSORY ATAXIA & PROPRIOCEPTION) ───
    {
        "q": "A {age}-old {gender} presents with a {duration}-month history of progressive gait instability, unsteady walking, and recurrent falls. The patient notes that {possessive} balance is significantly worse in the dark or when {pronoun} closes {possessive} eyes while washing {possessive} face. Ophthalmic examination is normal. Physical examination reveals:<br>• Gait: <b>Wide-based, stomping gait; the patient watches {possessive} feet continuously while walking</b><br>• Neurological exam: <b>Absent vibration and proprioception (position sense) in the bilateral lower extremities up to the knees; decreased light touch in a stocking distribution; normal motor strength (5/5) throughout</b><br>• Romberg test: <b>Significant swaying and loss of balance immediately upon closing {possessive} eyes</b><br>• Labs: <b>Hemoglobin {hb} g/dL, MCV {mcv} fL</b> (normal 80-100 fL)<br><br>What is the most likely diagnosis, the underlying anatomical localization, and the best next step in management?",
        "options": [
            "Vitamin B12 deficiency (subacute combined degeneration); demyelination of the posterior/dorsal columns of the spinal cord causing sensory ataxia; measure serum methylmalonic acid (MMA) and homocysteine levels, and initiate intramuscular cobalamin replacement",
            "Tabes dorsalis (neurosyphilis); demyelination of the anterior spinothalamic tract; perform a serum VDRL test and initiate IV penicillin G therapy",
            "Diabetic peripheral neuropathy; axonal loss of small unmyelinated nerve fibers; initiate aggressive glycemic control and prescribe daily amitriptyline",
            "Parkinson's disease; degeneration of dopaminergic neurons in the substantia nigra pars compacta; initiate levodopa-carbidopa therapy immediately",
            "Cerebellar vermis degeneration; atrophy of the Purkinje cell layer; perform a brain MRI and advise absolute avoidance of alcohol"
        ],
        "answer": 0,
        "exp": "This patient presents with a classic **sensory ataxia** manifesting as a wide-based, stomping gait, impaired vibration and proprioception, and a **positive Romberg test** (loss of balance upon closing the eyes). The Romberg test is a specific indicator of proprioceptive or vestibular dysfunction: with eyes open, the patient can compensate using visual input; once visual input is removed by closing the eyes, proprioceptive loss leads to instability. The combination of sensory ataxia and **macrocytic anemia (Hb {hb} g/dL, MCV {mcv} fL)** in an older adult is highly characteristic of **Vitamin B12 deficiency**, which causes **subacute combined degeneration (SCD) of the spinal cord**. SCD involves demyelination of the **posterior (dorsal) columns** (responsible for vibration and proprioception) and the lateral corticospinal tracts (causing spasticity/weakness later). The best next step to confirm diagnosis (especially in borderline cases) is to check **methylmalonic acid (MMA) and homocysteine levels** (both are elevated in B12 deficiency) and initiate **intramuscular cobalamin (B12) replacement**."
    },

    # ─── TEMPLATE 8: CEREBELLAR STROKE (ACUTE GAIT ATAXIA) ───
    {
        "q": "A {age}-old {gender} is rushed to the emergency department after experiencing a sudden, dramatic onset of severe gait instability and {fall_count} falls {duration} hours ago. The patient reports severe room-spinning vertigo, nausea, and a persistent headache localized to the back of {possessive} head. History is notable for long-standing hypertension and type 2 diabetes. Physical examination reveals:<br>• Cardiovascular: <b>BP {bp} mmHg, HR {hr} bpm</b><br>• Gait/Coordination: <b>Inability to stand or walk without support; prominent dysmetria (past-pointing) on bilateral finger-to-nose and heel-to-shin testing</b><br>• Neurological: <b>Alert and oriented; motor strength is 5/5 in all extremities; cranial nerves and sensory exams are completely intact</b><br>• Romberg test: <b>Unable to perform (unsteady even with eyes open)</b><br><br>What is the most likely diagnosis, and what is the highest priority next step in management?",
        "options": [
            "Acute cerebellar stroke; perform an urgent non-contrast CT scan of the brain (or brain MRI) and consult stroke neurology for emergency reperfusion or decompressive surgery evaluation",
            "Benign paroxysmal positional vertigo (BPPV); perform the Epley maneuver immediately in the emergency department and discharge the patient with oral meclizine",
            "Acute vestibular neuritis; initiate a 10-day course of high-dose oral prednisone and advise bed rest for 48 hours",
            "Meniere's disease; administer a 40 mg intravenous bolus of furosemide, restrict dietary sodium, and refer to ENT",
            "Normal pressure hydrocephalus; perform an emergent high-volume lumbar puncture (CSF tap test) at the bedside to lower intracranial pressure"
        ],
        "answer": 0,
        "exp": "This patient presents with **acute-onset gait ataxia, vertigo, and headache**, which is highly concerning for an **acute cerebellar stroke** (ischemic or hemorrhagic in the posterior circulation). In an older patient with cardiovascular risk factors (hypertension, diabetes), the sudden onset of severe gait instability (inability to stand or walk without support) and **ipsilateral cerebellar signs** (limb dysmetria on finger-to-nose and heel-to-shin testing) is a medical emergency. Unlike peripheral vestibular disorders (like vestibular neuritis or BPPV) where patients can typically stand and walk with assistance, patients with central cerebellar lesions have severe truncal instability and are often **unable to stand even with their eyes open**. The immediate priority is an **urgent non-contrast CT scan of the brain** (to rule out hemorrhage or mass effect/herniation risk) or a **brain MRI** (diffusion-weighted imaging is gold-standard for early ischemic stroke), followed by consultation with **stroke neurology**."
    },

    # ─── TEMPLATE 9: CAROTID SINUS HYPERSENSITIVITY & SYNCOPE ───
    {
        "q": "A {age}-old {gender} is evaluated in the clinic after experiencing {sync_count} episodes of sudden loss of consciousness (syncope) over the past 3 months. The patient's spouse notes that during the most recent episode, the patient was backing the car out of the driveway, turned {possessive} head sharply to look behind, and immediately slumped over and fell forward onto the steering wheel. The patient recovered fully within 1 minute with no confusion. The patient also reports a similar episode while shaving and wearing a tight dress shirt. Ophthalmic, cardiac, and basic orthostatic examinations are completely normal. The physician performs a supervised **carotid sinus massage** in the clinic with continuous EKG and blood pressure monitoring, which demonstrates:<br>• EKG: <b>A transient period of asystole (ventricular standstill) lasting {standstill} seconds</b><br>• Blood pressure: <b>A temporary drop in systolic blood pressure of {bp_drop} mmHg</b><br><br>What is the most likely diagnosis, and what is the first-line treatment of choice for this symptomatic condition?",
        "options": [
            "Carotid sinus hypersensitivity (cardioinhibitory subtype); dual-chamber permanent cardiac pacemaker placement",
            "Carotid sinus hypersensitivity (vasodepressor subtype); lifelong high-dose oral midodrine and strict sodium loading",
            "Vasovagal syncope; daily oral low-dose fludrocortisone and avoidance of all head rotation",
            "Sick sinus syndrome; immediate percutaneous coronary intervention (PCI) and coronary artery bypass grafting",
            "Orthostatic hypotension; taper and discontinue all blood pressure medications and wear full-length compression stockings"
        ],
        "answer": 0,
        "exp": "This patient has **Carotid Sinus Hypersensitivity (CSH)**, an underdiagnosed cause of syncope and falls in older adults. It is characterized by an exaggerated response to stimulation of the carotid sinus baroreceptors (which can be triggered by neck turning, looking up, shaving, or wearing tight shirt collars). CSH is diagnosed via supervised **carotid sinus massage** showing: (1) a **cardioinhibitory response** (asystole/ventricular standstill lasting ≥ 3 seconds), and/or (2) a **vasodepressor response** (a drop in systolic blood pressure of ≥ 50 mmHg in the absence of significant bradycardia). The patient's massage demonstrates a **cardioinhibitory response** with a {standstill}-second asystole and a drop in blood pressure. For patients with symptomatic, recurrent syncope due to the cardioinhibitory subtype of CSH, the first-line, gold-standard treatment is the **surgical implantation of a dual-chamber permanent cardiac pacemaker**."
    },

    # ─── TEMPLATE 10: BEERS CRITERIA HIGH-RISK MEDICATION (BENZODIAZEPINES) ───
    {
        "q": "A {age}-old {gender} is brought to the clinic by {possessive} daughter due to a recent nocturnal fall. The daughter reports finding the patient on the floor of the hallway at 2:00 AM, looking confused and unsteady on {possessive} feet, while trying to walk to the bathroom. The patient has a history of mild osteoarthritis and has suffered from chronic sleep onset insomnia for years, for which {pronoun} has been taking **{offending_med}** nightly for the past {years} years. Physical and neurological examinations are normal. According to the **AGS Beers Criteria** for Potentially Inappropriate Medication Use in Older Adults, what is the best explanation for this patient's clinical presentation, and what is the most appropriate management?",
        "options": [
            "Offending medication toxicity ({offending_med}); older adults have decreased clearance of benzodiazepines/Z-drugs, leading to daytime drowsiness, psychomotor impairment, and falls; perform a gradual medication taper and discontinue, and initiate Cognitive Behavioral Therapy for Insomnia (CBT-I)",
            "Idiopathic insomnia syndrome; the patient's falls are a direct complication of inadequate sleep; increase the nightly dose of {offending_med} by 50% to ensure deeper sleep",
            "Normal age-related nocturia; the falls are caused exclusively by rapid movement in the dark; prescribe nightly oral desmopressin and continue the nightly {offending_med}",
            "Vestibular hypofunction; the drug is completely safe; prescribe daily oral meclizine and recommend a soft walker for nocturnal mobilization",
            "Beers criteria medication side effect ({offending_med}); immediately discontinue the medication abruptly without a taper, and initiate high-dose daily oral diphenhydramine"
        ],
        "answer": 0,
        "exp": "This patient's nocturnal fall and unsteady gait are direct side effects of **{offending_med}** (a benzodiazepine or non-benzodiazepine receptor agonist/Z-drug). The **AGS Beers Criteria** strongly advises against the use of **benzodiazepines** (e.g., alprazolam, temazepam, lorazepam) and **non-benzodiazepine receptor agonists/Z-drugs** (e.g., zolpidem, eszopiclone, zaleplon) in older adults. With aging, physiological pharmacokinetic shifts (increased volume of distribution for lipophilic drugs, decreased hepatic clearance) result in prolonged drug half-lives. This leads to **cognitive clouding**, **daytime somnolence**, **impaired psychomotor performance**, ataxia, and **a two-fold increased risk of falls, fractures, and motor vehicle accidents**. The best management is to **gradually taper and discontinue** the drug to avoid withdrawal seizures or severe rebound insomnia. First-line therapy for chronic insomnia in older adults is non-pharmacological: **Cognitive Behavioral Therapy for Insomnia (CBT-I)**. Clinicians should never prescribe diphenhydramine as an alternative, as it is a highly anticholinergic Beers Criteria drug that also dramatically increases falls risk."
    }
]

genders_pool = [
    {"gender": "female", "pronoun": "she", "possessive": "her", "possessive_cap": "Her"},
    {"gender": "male", "pronoun": "he", "possessive": "his", "possessive_cap": "His"},
    {"gender": "woman", "pronoun": "she", "possessive": "her", "possessive_cap": "Her"},
    {"gender": "man", "pronoun": "he", "possessive": "his", "possessive_cap": "His"}
]

mcqs = []
seen_questions = set()
counter = 0

# Target: 400 MCQs
while counter < 400:
    for t in templates:
        if counter >= 400:
            break
            
        age = random.randint(66, 94)
        gp = random.choice(genders_pool)
        
        # Topic parameters
        duration = random.randint(2, 18)
        fall_count = random.randint(1, 4)
        
        # Template-specific randomizations
        offending_med = random.choice(["Metoclopramide", "Prochlorperazine", "Haloperidol", "Risperidone"])
        med_months = random.randint(2, 9)
        pill_count = random.randint(6, 13)
        
        medication = random.choice(["Doxazosin", "Terazosin", "Furosemide", "Amitriptyline", "Tamsulosin"])
        indication = "benign prostatic hyperplasia" if medication in ["Doxazosin", "Terazosin", "Tamsulosin"] else ("heart failure" if medication == "Furosemide" else "major depressive disorder and chronic neuropathic pain")
        
        supine_sbp = random.randint(142, 168)
        supine_dbp = random.randint(82, 96)
        supine_hr = random.randint(62, 78)
        standing_sbp = supine_sbp - random.randint(22, 34)
        standing_dbp = supine_dbp - random.randint(12, 18)
        standing_hr = supine_hr + random.randint(4, 18)
        
        mmse = random.randint(19, 25)
        opening_pressure = random.randint(115, 185)
        
        weight_loss = random.randint(6, 16)
        gait_speed = round(random.uniform(0.42, 0.76), 2)
        grip_strength = random.randint(10, 15) if gp['gender'] in ['female', 'woman'] else random.randint(18, 25)
        
        tug_time = random.randint(13, 24)
        
        home_detail = random.choice([
            "multiple unsecured throw rugs placed over slick hardwood floors, dim hallways, and no grab bars in the bathroom",
            "loose electrical extension cords stretching across the main living room walkway, slippery bathtubs with no non-slip mats, and poorly lit stairwells",
            "a bathroom with a high-rimmed tub and no safety grab bars, cluttered narrow hallways with thick carpeting, and a lack of outdoor pathway lighting",
            "unlit steep stairs with a loose handrail on only one side, several thick area rugs in the bedroom, and a low toilet seat with no support frames"
        ])
        
        hb = round(random.uniform(8.8, 11.2), 1)
        mcv = random.randint(102, 118)
        
        bp = f"{random.randint(152, 188)}/{random.randint(92, 106)}"
        hr = random.randint(82, 108)
        
        sync_count = random.randint(2, 6)
        standstill = round(random.uniform(3.2, 5.8), 1)
        bp_drop = random.randint(52, 76)
        
        # Offending medication for Beers
        offending_med_beers = random.choice(["Alprazolam (Xanax)", "Temazepam (Restoril)", "Zolpidem (Ambien)", "Eszopiclone (Lunesta)", "Diazepam (Valium)"])
        years = random.randint(2, 8)
        
        # Format the question text
        q_text = t['q'].format(
            age=age, gender=gp['gender'], pronoun=gp['pronoun'], possessive=gp['possessive'], possessive_cap=gp['possessive_cap'],
            duration=duration, fall_count=fall_count, offending_med=offending_med if "offending_med" in t['q'] else offending_med_beers,
            med_months=med_months, pill_count=pill_count, medication=medication, indication=indication,
            supine_sbp=supine_sbp, supine_dbp=supine_dbp, supine_hr=supine_hr,
            standing_sbp=standing_sbp, standing_dbp=standing_dbp, standing_hr=standing_hr,
            mmse=mmse, opening_pressure=opening_pressure, weight_loss=weight_loss,
            gait_speed=gait_speed, grip_strength=grip_strength, tug_time=tug_time,
            home_detail=home_detail, hb=hb, mcv=mcv, bp=bp, hr=hr,
            sync_count=sync_count, standstill=standstill, bp_drop=bp_drop, years=years
        )
        
        # Replace occurrences in options/explanation as well
        opts_formatted = []
        for o in t['options']:
            o_fmt = o.format(offending_med=offending_med if "offending_med" in o else offending_med_beers, medication=medication)
            opts_formatted.append(o_fmt)
            
        exp_formatted = t['exp'].format(
            offending_med=offending_med if "offending_med" in t['exp'] else offending_med_beers,
            medication=medication, supine_sbp=supine_sbp, supine_dbp=supine_dbp,
            standing_sbp=standing_sbp, standing_dbp=standing_dbp, mmse=mmse,
            gait_speed=gait_speed, grip_strength=grip_strength, tug_time=tug_time,
            hb=hb, mcv=mcv, standstill=standstill
        )
        
        # Shuffling options
        correct_opt = opts_formatted[t['answer']]
        random.shuffle(opts_formatted)
        new_ans_idx = opts_formatted.index(correct_opt)
        
        # Escape single quotes and JSON strings
        q_text_escaped = q_text.replace("'", "''")
        opts_json_escaped = json.dumps(opts_formatted).replace("'", "''")
        exp_escaped = exp_formatted.replace("'", "''")
        
        mcq_str = f"    (v_topic_id, '{q_text_escaped}', '{opts_json_escaped}'::jsonb, {new_ans_idx}, '{exp_escaped}')"
        
        if q_text not in seen_questions:
            seen_questions.add(q_text)
            mcqs.append(mcq_str)
            counter += 1

out_file = "C:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260519_geri_falls_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Geriatrics: Falls & gait disorders — risk assessment, prevention, workup\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\n")
    f.write("DECLARE\n")
    f.write("    v_topic_id UUID;\n")
    f.write("BEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'geri-falls' LIMIT 1;\n")
    f.write("    IF v_topic_id IS NULL THEN\n")
    f.write("        RAISE EXCEPTION 'Topic geri-falls not found.';\n")
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
