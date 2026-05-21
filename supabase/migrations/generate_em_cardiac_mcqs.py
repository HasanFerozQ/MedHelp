import json
import random

random.seed(42)

topic_slug = 'em-cardiac-emergencies'

# ============================================================
# Pools of Variables for Randomization
# ============================================================
female_names = [
    "Mary", "Patricia", "Jennifer", "Linda", "Elizabeth", "Barbara", "Susan", "Jessica",
    "Sarah", "Karen", "Nancy", "Lisa", "Betty", "Margaret", "Sandra", "Ashley", "Kimberly",
    "Emily", "Donna", "Michelle", "Dorothy", "Carol", "Amanda", "Melissa", "Deborah",
    "Stephanie", "Rebecca", "Sharon", "Laura", "Cynthia", "Kathleen", "Amy", "Shirley",
    "Angela", "Helen", "Anna", "Brenda", "Pamela"
]

male_names = [
    "James", "John", "Robert", "Michael", "William", "David", "Richard", "Joseph",
    "Thomas", "Charles", "Christopher", "Daniel", "Matthew", "Anthony", "Mark", "Donald",
    "Steven", "Paul", "Andrew", "Joshua", "Kenneth", "Kevin", "Brian", "George", "Edward",
    "Ronald", "Timothy", "Jason", "Jeffrey", "Ryan", "Jacob", "Gary", "Nicholas", "Eric",
    "Jonathan", "Stephen", "Larry", "Justin"
]

genders_pool = [
    {
        "gender": "male",
        "pronoun": "he",
        "pronoun_cap": "He",
        "possessive": "his",
        "possessive_cap": "His",
        "objective": "him",
        "names": male_names
    },
    {
        "gender": "female",
        "pronoun": "she",
        "pronoun_cap": "She",
        "possessive": "her",
        "possessive_cap": "Her",
        "objective": "her",
        "names": female_names
    }
]

ages_pool = list(range(28, 86, 2))
sbp_low_pool = [80, 82, 84, 86, 88, 90, 92, 94]
dbp_low_pool = [48, 50, 52, 54, 56, 58, 60]
sbp_normal_pool = [118, 120, 122, 126, 130, 134, 138]
dbp_normal_pool = [72, 76, 78, 82, 84, 86]
sbp_high_pool = [182, 188, 194, 202, 210, 218, 224]
dbp_high_pool = [110, 114, 118, 122, 126, 130]
hr_normal_pool = [68, 72, 76, 80, 84, 88, 92]
hr_slow_pool = [32, 35, 38, 40, 42, 44]
hr_fast_pool = [102, 108, 114, 120, 132, 140]
hr_tachy_pool = [155, 162, 170, 178, 185, 192, 204]
rr_normal_pool = [14, 16, 18, 20]
rr_high_pool = [22, 24, 26, 28, 30, 32]
spo2_normal_pool = [96, 97, 98, 99, 100]
spo2_low_pool = [85, 87, 89, 90, 91, 92]
temp_f_normal_pool = [98.2, 98.6, 98.9, 99.1]
temp_f_high_pool = [100.4, 100.9, 101.3, 101.8, 102.2, 102.6]
troponin_high_pool = [1.25, 2.80, 4.50, 7.20, 9.80, 12.4]
bnp_high_pool = [620, 850, 1100, 1450, 1800, 2450]
potassium_low_pool = [2.6, 2.9, 3.1, 3.3]
potassium_high_pool = [5.8, 6.2, 6.5, 6.8, 7.2]
magnesium_low_pool = [1.1, 1.3, 1.5]
lead_elev_pool = ["leads II, III, and aVF", "leads V1 through V4", "leads I, aVL, V5, and V6"]
lead_dep_pool = ["leads I and aVL", "leads II, III, and aVF", "leads V1 and V2"]
pain_radiation_pool = ["left shoulder", "jaw", "back", "left arm"]
location_pool = ["Emergency Department triage room", "resuscitation bay", "high-acuity area", "bedside monitor area"]

hours_count_pool = [2, 3, 4, 5, 6]
distance_pool = [45, 60, 75, 90, 110]
minutes_count_pool = [130, 145, 160, 180, 210]
post_day_pool = [2, 3, 4, 5, 6, 7]
qtc_val_pool = [510, 525, 540, 560, 580]
duration_pool = [2, 3, 4, 5]
pr_interval_pool = [240, 260, 280, 310, 340]

# ============================================================
# 35 UNIQUE TEMPLATES
# ============================================================
templates = [
    # T1: STEMI Diagnosis
    {
        "q": "A {age}-year-old {gender} named {name} presents to the {location} with sudden-onset substernal chest pressure radiating to the {pain_radiation}. Vitals are BP {sbp_normal}/{dbp_normal} mmHg, HR {hr_normal} bpm, RR {rr_normal} rpm, and SpO2 {spo2_normal}% on room air. The initial ECG reveals ST-elevation of 2.5 mm in {lead_elev} with reciprocal ST-depression in {lead_dep}. Troponin is {troponin_high} ng/mL. Which of the following is the most appropriate next step in management?",
        "options": [
            "Immediate activation of the cardiac catheterization laboratory for primary percutaneous coronary intervention (PCI) and administration of aspirin and a P2Y12 inhibitor",
            "Obtain a chest CT angiogram to rule out aortic dissection prior to initiating any antiplatelet therapy",
            "Administer oral metoprolol 50 mg immediately and repeat the ECG in 4 hours",
            "Initiate intravenous thrombolysis with tenecteplase as first-line therapy, as PCI is reserved for patients with recurrent symptoms",
            "Discharge the patient home with sublingual nitroglycerin and outpatient cardiology follow-up within 1 week"
        ],
        "answer": 0,
        "exp": "Acute ST-elevation myocardial infarction (STEMI) requires immediate reperfusion. For a patient presenting to a PCI-capable hospital, primary percutaneous coronary intervention (PCI) is the gold standard and must be performed within 90 minutes of first medical contact. Initial medical therapy includes dual antiplatelet therapy (DAPT) with aspirin (325 mg chewed) and a P2Y12 inhibitor (e.g., ticagrelor or clopidogrel), anticoagulation (e.g., heparin), and nitrates for pain relief if blood pressure permits and there are no contraindications. (Ref: Tintinalli's Ch. 48; Step-Up to EM Ch. 2; Case Files: EM Case 1)"
    },
    # T2: Right Ventricular Infarction
    {
        "q": "A {age}-year-old {gender} named {name} is brought to the {location} with severe epigastric pain, nausea, and diaphoresis. Vitals are BP {sbp_low}/{dbp_low} mmHg, HR {hr_fast} bpm, RR {rr_normal} rpm, and SpO2 {spo2_normal}% on room air. Lungs are clear to auscultation bilaterally, but jugular venous distension is noted. The ECG shows ST-elevation in leads II, III, and aVF. A right-sided ECG (V4R) reveals 1.5 mm of ST-elevation. Which of the following is the most appropriate initial therapy?",
        "options": [
            "Intravenous normal saline bolus (500–1000 mL) to increase right ventricular preload and improve cardiac output",
            "Intravenous nitroglycerin infusion titrated to chest pain resolution",
            "Intravenous furosemide 40 mg to reduce preload and relieve pulmonary congestion",
            "Sublingual nitroglycerin 0.4 mg followed by intravenous morphine 2 mg for pain control",
            "Oral metoprolol succinate 25 mg to decrease myocardial oxygen demand"
        ],
        "answer": 0,
        "exp": "Right ventricular (RV) myocardial infarction complicates up to 40% of inferior myocardial infarctions. The classic clinical triad of RV infarction is hypotension, clear lung fields, and jugular venous distension (JVD). RV infarctions are highly preload-dependent because the dysfunctional right ventricle requires high fill pressures to push blood through the pulmonary circulation. Nitrates, loop diuretics, and morphine are absolutely contraindicated as they reduce preload and can precipitate severe, refractory hypotension. The initial treatment for RV infarction-induced hypotension is aggressive volume expansion with intravenous crystalloid boluses (normal saline or lactated Ringer's) to optimize right ventricular preload. (Ref: Tintinalli's Ch. 48; Step-Up to EM Ch. 2; Case Files: EM Case 1; Roberts & Hedges Ch. 12)"
    },
    # T3: Cocaine-Induced Myocardial Ischemia
    {
        "q": "A {age}-year-old {gender} named {name} presents with severe retrosternal chest pain and agitation after snorting cocaine. Vitals are BP {sbp_high}/{dbp_high} mmHg, HR {hr_fast} bpm, RR {rr_high} rpm, and SpO2 {spo2_normal}% on room air. The patient is sweating profusely and has dilated pupils. The ECG shows sinus tachycardia with 1 mm ST depressions in leads V4–V6. Troponin is {troponin_high} ng/mL. Which of the following represents the most appropriate pharmacological management for this patient's cardiac symptoms?",
        "options": [
            "Intravenous benzodiazepines (e.g., lorazepam or diazepam) and sublingual nitroglycerin",
            "Intravenous metoprolol 5 mg push every 5 minutes to a maximum of 15 mg",
            "Intravenous propranolol infusion to achieve rate control and reduce hypertension",
            "Immediate administration of oral carvedilol 6.25 mg to provide mixed alpha- and beta-blockade",
            "Intravenous thrombolytic therapy with alteplase due to cocaine-induced coronary thrombosis"
        ],
        "answer": 0,
        "exp": "Cocaine-induced myocardial ischemia/infarction is driven by coronary artery vasospasm, increased myocardial oxygen demand (tachycardia and hypertension), and enhanced platelet aggregation. The cornerstone of management is control of the hyperadrenergic state. First-line therapy includes intravenous benzodiazepines (which reduce central sympathetic output, lowering heart rate and blood pressure) and nitroglycerin (which promotes coronary vasodilation and reduces preload). Beta-blockers (including selective, non-selective, and even mixed agents like labetalol/carvedilol in the acute phase) are strictly contraindicated due to the risk of unopposed alpha-adrenergic stimulation, which can cause catastrophic coronary vasoconstriction, hypertensive crisis, and death. (Ref: Tintinalli's Ch. 48 & 185; Step-Up to EM Ch. 2; Case Files: EM Case 1)"
    },
    # T4: STEMI Reperfusion Timelines
    {
        "q": "A {age}-year-old {gender} named {name} presents to a small community Emergency Department (non-PCI capable) with chest pain of {hours_count} hours duration. The ECG shows 3 mm ST-elevation in leads V1-V4. The nearest percutaneous coronary intervention (PCI) center is located {distance} miles away, and the estimated transfer and door-to-balloon time is {minutes_count} minutes. There are no contraindications to fibrinolytic therapy. Which of the following is the most appropriate reperfusion strategy?",
        "options": [
            "Administer a fibrinolytic agent (e.g., tenecteplase or alteplase) at the presenting facility within 30 minutes of arrival, followed by transfer to a PCI-capable center",
            "Initiate immediate transfer for primary percutaneous coronary intervention (PCI), as mechanical reperfusion is always preferred regardless of transfer delays",
            "Administer heparin and glycoprotein IIb/IIIa inhibitors and observe for 2 hours before deciding on thrombolysis",
            "Perform emergent coronary artery bypass grafting (CABG) at the presenting facility using a general surgeon",
            "Decline fibrinolysis and PCI, and initiate conservative medical management with aspirin and high-dose statin therapy"
        ],
        "answer": 0,
        "exp": "For patients presenting with STEMI within 12 hours of symptom onset, reperfusion should be initiated immediately. Primary PCI is preferred if it can be performed within 120 minutes of first medical contact (or 90 minutes if at a PCI-capable center). If the transfer and door-to-balloon time is expected to exceed 120 minutes, fibrinolytic therapy should be administered within 30 minutes of arrival (door-to-needle time) at the non-PCI-capable center, provided there are no absolute contraindications. Following thrombolysis, the patient should be transferred to a PCI-capable facility for routine invasive evaluation. (Ref: Tintinalli's Ch. 48; Step-Up to EM Ch. 2; Case Files: EM Case 1)"
    },
    # T5: NSTEMI / Unstable Angina Risk Stratification
    {
        "q": "A {age}-year-old {gender} named {name} presents with intermittent chest discomfort. Vitals are normal. The initial ECG shows non-specific T-wave changes, and the baseline troponin is negative. The physician calculates a HEART score to risk-stratify the patient. Which of the following represents the correct variables assessed in the HEART score and the appropriate action for a low-risk patient (score 0–3)?",
        "options": [
            "History, ECG, Age, Risk factors, Troponin; patients with a score of 0–3 have a <2% risk of a Major Adverse Cardiac Event (MACE) in 30 days and can be safely discharged with outpatient follow-up",
            "Heart rate, Ejection fraction, Age, Renal function, Troponin; patients with a score of 0–3 require immediate admission to the coronary care unit",
            "History, ECG, Activity level, Respiratory rate, Troponin; patients with a score of 0–3 require urgent cardiac catheterization within 24 hours",
            "Hypertension, ECG, Age, Risk factors, Troponin; patients with a score of 0–3 must undergo immediate stress testing in the Emergency Department",
            "History, ECG, Age, Risk factors, Troponin; patients with a score of 0–3 should be started on dual antiplatelet therapy and low-molecular-weight heparin before discharge"
        ],
        "answer": 0,
        "exp": "The HEART score is a validated risk stratification tool used in the ED to evaluate patients with chest pain. It assesses five elements (each scored 0, 1, or 2): History (highly, moderately, or slightly suspicious), ECG (significant ST-depression, non-specific repolarization, or normal), Age (>=65, 45-64, <45), Risk factors (>=3 or history of CAD, 1-2, or none), and Troponin (>=3x normal, 1-3x, or normal). A score of 0–3 is classified as low risk, associated with a <2% risk of Major Adverse Cardiac Events (MACE) within 30 days. These patients can be safely discharged from the ED with outpatient follow-up. (Ref: Tintinalli's Ch. 48; Step-Up to EM Ch. 2; Case Files: EM Case 1)"
    },
    # T6: Papillary Muscle Rupture
    {
        "q": "A {age}-year-old {gender} named {name} is admitted to the cardiac care unit following a myocardial infarction. On post-infarction day {post_day}, {pronoun} suddenly develops acute-onset severe dyspnea, orthopnea, and pink frothy sputum. Vitals are BP {sbp_low}/{dbp_low} mmHg, HR {hr_fast} bpm, and SpO2 {spo2_low}% on high-flow oxygen. Physical examination reveals a new, loud, blowing holosystolic murmur loudest at the apex radiating to the axilla. Which of the following is the most likely diagnosis?",
        "options": [
            "Acute papillary muscle rupture causing severe mitral regurgitation",
            "Acute interventricular septum rupture causing a left-to-right shunt",
            "Left ventricular free wall rupture leading to cardiac tamponade",
            "Acute myocarditis with rapid development of dilated cardiomyopathy",
            "Right ventricular free wall infarction causing acute right heart failure"
        ],
        "answer": 0,
        "exp": "Acute papillary muscle rupture is a catastrophic complication of myocardial infarction (most commonly inferior MI affecting the posteromedial papillary muscle, which has a single blood supply from the PDA). It typically occurs 2 to 7 days post-MI. It presents with sudden-onset acute pulmonary edema (dyspnea, orthopnea, pink frothy sputum) and cardiogenic shock due to acute, severe mitral regurgitation. On exam, a new holosystolic murmur is heard loudest at the apex radiating to the axilla. Treatment requires urgent surgical valve repair or replacement. (Ref: Tintinalli's Ch. 48; Step-Up to EM Ch. 2; Case Files: EM Case 1)"
    },
    # T7: Interventricular Septum Rupture
    {
        "q": "A {age}-year-old {gender} named {name} presents with cardiogenic shock {post_day} days after an anterior wall myocardial infarction. On physical examination, a new, harsh, loud holosystolic murmur is heard best at the left lower sternal border, accompanied by a palpable thrill. The lungs have diffuse crackles bilaterally. Which of the following is the most likely diagnosis and diagnostic test of choice?",
        "options": [
            "Interventricular septum rupture; diagnosed by emergent transthoracic or transesophageal echocardiography showing a left-to-right shunt",
            "Papillary muscle rupture; diagnosed by chest CT angiogram showing mitral valve prolapse",
            "Left ventricular free wall rupture; diagnosed by coronary angiography showing coronary artery re-occlusion",
            "Acute aortic valve dissection; diagnosed by a chest radiograph showing a widened mediastinum",
            "Right ventricular infarction; diagnosed by a right-sided ECG showing ST-elevation in lead V4R"
        ],
        "answer": 0,
        "exp": "Interventricular septum (IVS) rupture is a mechanical complication of MI that occurs in 1-2% of cases, typically 2 to 7 days post-MI (seen with both anterior and inferior MIs). It creates a left-to-right shunt, leading to acute right-sided and left-sided heart failure and cardiogenic shock. The classic physical exam finding is a new, harsh, loud holosystolic murmur best heard at the left lower sternal border (LLSB), often with a palpable thrill. Transthoracic echocardiography (TTE) with Doppler is the diagnostic test of choice. (Ref: Tintinalli's Ch. 48; Step-Up to EM Ch. 2; Case Files: EM Case 1)"
    },
    # T8: Left Ventricular Free Wall Rupture
    {
        "q": "A {age}-year-old {gender} named {name} is recovering in the cardiac monitoring unit {post_day} days after a transmural myocardial infarction. {pronoun_cap} suddenly loses consciousness. The cardiac monitor shows sinus tachycardia at {hr_fast} bpm, but no pulse is palpable (pulseless electrical activity). Neck veins are engorged, and heart sounds are extremely distant and muffled. Which of the following is the most likely diagnosis?",
        "options": [
            "Left ventricular free wall rupture causing acute hemopericardium and cardiac tamponade",
            "Acute papillary muscle rupture causing acute mitral regurgitation",
            "Interventricular septum rupture causing acute volume overload",
            "Recurrent acute myocardial infarction with cardiogenic shock",
            "Acute massive pulmonary embolism with right ventricular outflow tract obstruction"
        ],
        "answer": 0,
        "exp": "Left ventricular free wall rupture is a highly lethal mechanical complication of transmural MI, occurring in 1-3% of cases (usually 1 to 14 days post-MI). It leads to rapid bleeding into the pericardial sac (hemopericardium), resulting in acute cardiac tamponade. Clinical features include sudden loss of consciousness, pulseless electrical activity (PEA) arrest, jugular venous distension (engorged neck veins), and muffled/distant heart sounds (Beck's triad). Prognosis is dismal, and emergency surgical intervention is the only definitive treatment. (Ref: Tintinalli's Ch. 48; Step-Up to EM Ch. 2; Case Files: EM Case 1)"
    },
    # T9: Symptomatic Sinus Bradycardia
    {
        "q": "A {age}-year-old {gender} named {name} presents with dizziness, diaphoresis, and near-syncope. Vitals are BP {sbp_low}/{dbp_low} mmHg, HR {hr_slow} bpm, RR {rr_normal} rpm, and SpO2 {spo2_normal}% on room air. The ECG shows sinus bradycardia. The patient is unresponsive to verbal stimuli but responds to painful stimuli. Which of the following is the most appropriate first-line pharmacological treatment?",
        "options": [
            "Atropine 1 mg intravenous push, repeatable every 3–5 minutes to a maximum dose of 3 mg",
            "Amiodarone 150 mg intravenous infusion over 10 minutes",
            "Epinephrine 1 mg intravenous push over 1 minute",
            "Adenosine 6 mg rapid intravenous push with saline flush",
            "Metoprolol 5 mg intravenous push over 5 minutes"
        ],
        "answer": 0,
        "exp": "For patients with symptomatic bradycardia (defined by signs of hemodynamic compromise: hypotension, altered mental status, chest pain, acute HF), the first-line pharmacological intervention according to the ACLS bradycardia algorithm is Atropine. The dose is 1 mg IV push, which can be repeated every 3–5 minutes as needed up to a maximum cumulative dose of 3 mg. If atropine is ineffective, next steps include transcutaneous pacing, dopamine infusion (5–20 mcg/kg/min), or epinephrine infusion (2–10 mcg/min). (Ref: Tintinalli's Ch. 18 & 22; Step-Up to EM Ch. 2; Case Files: EM Case 2; Roberts & Hedges Ch. 15)"
    },
    # T10: Second-Degree AV Block Mobitz Type I (Wenckebach)
    {
        "q": "A {age}-year-old {gender} named {name} is found to have an irregular pulse during a routine Emergency Department workup for minor trauma. Vitals are BP {sbp_normal}/{dbp_normal} mmHg, HR {hr_slow} bpm, RR {rr_normal} rpm, and SpO2 {spo2_normal}%. The ECG shows a repeating pattern of progressive lengthening of the PR interval until a QRS complex is completely dropped, after which the PR interval resets to its shortest duration. The patient is completely asymptomatic. What is the most appropriate management?",
        "options": [
            "Observation and reassurance, as this represents a Second-Degree AV Block Mobitz Type I (Wenckebach) which is usually benign in asymptomatic patients",
            "Immediate placement of a temporary transvenous pacemaker in the Emergency Department",
            "Administration of intravenous atropine 1 mg to normalize the heart rate",
            "Initiate an emergency epinephrine infusion at 5 mcg/min",
            "Admit the patient to the coronary care unit for urgent permanent pacemaker implantation"
        ],
        "answer": 0,
        "exp": "This ECG description defines Second-Degree AV Block Mobitz Type I (Wenckebach), characterized by progressive PR prolongation followed by a dropped QRS complex. This block occurs at the level of the AV node, is often associated with high vagal tone, medications (beta-blockers, CCBs), or inferior MI, and is typically benign. In asymptomatic patients, no active intervention is indicated other than observation and reassurance. (Ref: Tintinalli's Ch. 18; Step-Up to EM Ch. 2; Case Files: EM Case 2)"
    },
    # T11: Second-Degree AV Block Mobitz Type II
    {
        "q": "A {age}-year-old {gender} named {name} presents with lightheadedness and chest tightness. Vitals are BP {sbp_low}/{dbp_low} mmHg, HR {hr_slow} bpm, RR {rr_normal} rpm, and SpO2 {spo2_normal}%. The ECG shows a constant, normal PR interval but with intermittent dropped QRS complexes in a fixed ratio. What is the correct classification of this block, and what is the most appropriate immediate step?",
        "options": [
            "Second-Degree AV Block Mobitz Type II; immediately apply transcutaneous pacing pads and prepare for transvenous pacing due to high risk of progression to complete heart block",
            "First-Degree AV Block; administer oral aspirin and discharge home with outpatient cardiology referral",
            "Second-Degree AV Block Mobitz Type I (Wenckebach); administer intravenous atropine 1 mg and repeat the ECG in 30 minutes",
            "Third-Degree AV Block; perform immediate synchronized cardioversion at 100 Joules",
            "Sinus arrhythmia; reassure the patient and advise avoiding caffeine and strenuous exercise"
        ],
        "answer": 0,
        "exp": "This ECG description defines Second-Degree AV Block Mobitz Type II, characterized by a constant PR interval with intermittent dropped QRS complexes. This block occurs below the level of the AV node (in the Bundle of His or bundle branches) and carries a high risk of sudden progression to complete (third-degree) heart block and severe hemodynamic collapse. The immediate management for symptomatic Mobitz Type II block is the application of transcutaneous pacing pads and preparation for transvenous pacing. (Ref: Tintinalli's Ch. 18; Step-Up to EM Ch. 2; Case Files: EM Case 2; Roberts & Hedges Ch. 15)"
    },
    # T12: Third-Degree (Complete) AV Block
    {
        "q": "A {age}-year-old {gender} named {name} presents with syncope and severe lightheadedness. Vitals are BP {sbp_low}/{dbp_low} mmHg, HR {hr_slow} bpm, RR {rr_normal} rpm, and SpO2 {spo2_normal}%. The ECG shows P waves occurring at a regular rate of 80 bpm, and QRS complexes occurring at a regular rate of {hr_slow} bpm, but there is no relationship or correlation between the P waves and the QRS complexes. Which of the following is the most appropriate immediate management?",
        "options": [
            "Initiate immediate transcutaneous pacing and prepare for transvenous pacing",
            "Administer a rapid infusion of 2 liters of normal saline to correct hypotension",
            "Administer adenosine 6 mg rapid intravenous push to restore AV conduction",
            "Perform immediate unsynchronized defibrillation at 200 Joules",
            "Prescribe oral metoprolol 25 mg to control the atrial rate"
        ],
        "answer": 0,
        "exp": "The ECG describes Third-Degree (Complete) AV Block, characterized by complete AV dissociation where the atria and ventricles beat independently. Complete heart block is a medical emergency that leads to low cardiac output and can progress to asystole. In symptomatic patients, the immediate treatment of choice is transcutaneous pacing (TCP) to maintain ventricular rate and perfusion, while arranging for emergent transvenous pacemaker insertion. (Ref: Tintinalli's Ch. 18; Step-Up to EM Ch. 2; Case Files: EM Case 2; Roberts & Hedges Ch. 15)"
    },
    # T13: Stable vs. Unstable SVT
    {
        "q": "A {age}-year-old {gender} named {name} presents to the {location} with palpitations and shortness of breath. Vitals are BP {sbp_low}/{dbp_low} mmHg, HR {hr_tachy} bpm, RR {rr_high} rpm, and SpO2 {spo2_normal}%. The patient is confused and diaphoretic. The cardiac monitor shows a regular, narrow-complex tachycardia at {hr_tachy} bpm. What is the most appropriate immediate intervention?",
        "options": [
            "Perform urgent synchronized cardioversion at 50–100 Joules",
            "Perform carotid sinus massage or a modified Valsalva maneuver",
            "Administer adenosine 6 mg rapid intravenous push",
            "Administer diltiazem 0.25 mg/kg intravenously over 2 minutes",
            "Perform unsynchronized defibrillation at 200 Joules"
        ],
        "answer": 0,
        "exp": "For any patient presenting with a tachyarrhythmia, the first clinical assessment is whether the patient is hemodynamically stable or unstable. Signs of instability include hypotension, altered mental status, chest pain, or acute heart failure. In this case, the patient is unstable (hypotension, confusion). The correct treatment for unstable narrow-complex tachycardia is immediate synchronized cardioversion (starting at 50–100 Joules for regular narrow complex). (Ref: Tintinalli's Ch. 18; Step-Up to EM Ch. 2; Case Files: EM Case 2)"
    },
    # T14: Symptomatic Stable SVT / AVNRT
    {
        "q": "A {age}-year-old {gender} named {name} presents to the {location} with rapid palpitations. Vitals are BP {sbp_normal}/{dbp_normal} mmHg, HR {hr_tachy} bpm, RR {rr_normal} rpm, and SpO2 {spo2_normal}%. The patient is alert, oriented, and denies chest pain or dyspnea. The ECG shows a regular, narrow-complex tachycardia at {hr_tachy} bpm with no visible P waves. After an unsuccessful modified Valsalva maneuver, what is the next most appropriate step?",
        "options": [
            "Administer adenosine 6 mg rapid intravenous push, followed by a saline flush",
            "Perform synchronized cardioversion at 100 Joules",
            "Administer intravenous amiodarone 150 mg over 10 minutes",
            "Administer intravenous metoprolol 5 mg push over 2 minutes",
            "Administer adenosine 12 mg rapid intravenous push, followed by a saline flush"
        ],
        "answer": 0,
        "exp": "The patient has stable Supraventricular Tachycardia (SVT), most likely AV nodal reentrant tachycardia (AVNRT), as evidenced by a regular narrow-complex tachycardia in a hemodynamically stable patient. The first step is vagal maneuvers (e.g., modified Valsalva). If vagal maneuvers fail, the next first-line therapy is intravenous adenosine. The initial dose is 6 mg rapid IV push through a large-bore peripheral line, immediately followed by a rapid saline flush. If unsuccessful, a second dose of 12 mg IV push can be administered. (Ref: Tintinalli's Ch. 18; Step-Up to EM Ch. 2; Case Files: EM Case 2; Roberts & Hedges Ch. 15)"
    },
    # T15: Atrial Fibrillation with RVR (Stable)
    {
        "q": "A {age}-year-old {gender} named {name} presents with a three-day history of palpitations and mild fatigue. Vitals are BP {sbp_normal}/{dbp_normal} mmHg, HR {hr_tachy} bpm (irregular), RR {rr_normal} rpm, and SpO2 {spo2_normal}%. The ECG reveals an irregularly irregular rhythm with no discernible P waves and narrow QRS complexes, consistent with Atrial Fibrillation with Rapid Ventricular Response. The patient is hemodynamically stable. Which of the following is the most appropriate initial management strategy?",
        "options": [
            "Rate control with intravenous diltiazem or metoprolol, and assessment of stroke risk using the CHA2DS2-VASc score",
            "Immediate synchronized cardioversion at 200 Joules to restore sinus rhythm",
            "Administration of intravenous amiodarone 150 mg over 10 minutes followed by heparin infusion",
            "Administration of intravenous adenosine 6 mg rapid push to block the AV node",
            "Immediate initiation of oral warfarin and discharge home without rate control"
        ],
        "answer": 0,
        "exp": "For hemodynamically stable Atrial Fibrillation with Rapid Ventricular Response (RVR), the primary goal in the Emergency Department is rate control rather than immediate rhythm control, especially if the duration of AFib is unknown or >48 hours (due to risk of thromboembolism). First-line agents include calcium channel blockers (e.g., diltiazem) or beta-blockers (e.g., metoprolol). Additionally, long-term stroke risk must be evaluated using the CHA2DS2-VASc score to determine the need for anticoagulation. (Ref: Tintinalli's Ch. 18; Step-Up to EM Ch. 2; Case Files: EM Case 2)"
    },
    # T16: Atrial Fibrillation with WPW Syndrome
    {
        "q": "A {age}-year-old {gender} named {name} presents to the {location} with rapid palpitations and lightheadedness. Vitals are BP {sbp_normal}/{dbp_normal} mmHg, HR {hr_tachy} bpm (irregular), RR {rr_normal} rpm, and SpO2 {spo2_normal}%. The ECG shows an irregularly irregular wide-complex tachycardia with a ventricular rate fluctuating between 180 and 240 bpm. The QRS morphology varies dynamically. Which of the following is the most appropriate pharmacological treatment?",
        "options": [
            "Intravenous procainamide 17 mg/kg infusion over 20–30 minutes, or ibutilide",
            "Intravenous adenosine 6 mg rapid push to slow AV conduction",
            "Intravenous metoprolol 5 mg push to control ventricular rate",
            "Intravenous diltiazem 20 mg over 2 minutes to control ventricular rate",
            "Intravenous digoxin 0.5 mg to increase vagal tone and slow conduction"
        ],
        "answer": 0,
        "exp": "The patient is presenting with pre-excited atrial fibrillation in the setting of Wolff-Parkinson-White (WPW) syndrome. This is characterized by an irregularly irregular, extremely rapid (often >200 bpm), wide-complex tachycardia with variable QRS complexes. In WPW-AFib, AV nodal blocking agents (Adenosine, Beta-blockers, Calcium channel blockers, and Digoxin - ABCD) are strictly contraindicated because blocking the AV node will divert all conduction down the accessory pathway, potentially precipitating ventricular fibrillation and cardiac arrest. For stable patients, the treatment of choice is intravenous procainamide or ibutilide. (Ref: Tintinalli's Ch. 18; Step-Up to EM Ch. 2; Case Files: EM Case 2)"
    },
    # T17: Stable Ventricular Tachycardia (Monomorphic)
    {
        "q": "A {age}-year-old {gender} named {name} presents with chest discomfort and palpitations. Vitals are BP {sbp_normal}/{dbp_normal} mmHg, HR {hr_tachy} bpm, RR {rr_normal} rpm, and SpO2 {spo2_normal}%. The ECG reveals a regular, monomorphic wide-complex tachycardia at {hr_tachy} bpm. The patient is alert, oriented, and denies dyspnea or lightheadedness. Which of the following is the most appropriate initial treatment?",
        "options": [
            "Intravenous amiodarone 150 mg over 10 minutes, or intravenous procainamide",
            "Intravenous adenosine 6 mg rapid push",
            "Immediate synchronized cardioversion at 100 Joules",
            "Intravenous metoprolol 5 mg push over 2 minutes",
            "Intravenous lidocaine 100 mg push over 1 minute"
        ],
        "answer": 0,
        "exp": "The patient presents with stable monomorphic Ventricular Tachycardia (VT), as evidenced by a regular wide-complex tachycardia in a hemodynamically stable patient. First-line pharmacological management includes intravenous amiodarone or intravenous procainamide (which is often preferred in stable patient populations without prolonged QT or severe heart failure). Lidocaine is an alternative but has lower efficacy. (Ref: Tintinalli's Ch. 18; Step-Up to EM Ch. 2; Case Files: EM Case 2; Roberts & Hedges Ch. 15)"
    },
    # T18: Unstable Ventricular Tachycardia with Pulse
    {
        "q": "A {age}-year-old {gender} named {name} is brought to the resuscitation bay with severe chest pain and dizziness. Vitals are BP {sbp_low}/{dbp_low} mmHg, HR {hr_tachy} bpm, RR {rr_high} rpm, and SpO2 {spo2_normal}%. The cardiac monitor shows monomorphic ventricular tachycardia at {hr_tachy} bpm. The patient is poorly responsive to commands. What is the most appropriate next step in management?",
        "options": [
            "Urgent synchronized cardioversion at 100 Joules, after considering brief sedation if feasible",
            "Intravenous push of amiodarone 300 mg over 1 minute",
            "Unsynchronized defibrillation at 200 Joules",
            "Perform immediate vagal maneuvers and administer adenosine 6 mg IV",
            "Initiate high-quality chest compressions and prepare for intubation"
        ],
        "answer": 0,
        "exp": "The patient has unstable Ventricular Tachycardia (VT) with a pulse (evidenced by hypotension, altered mental status, and chest pain). The immediate treatment of choice is urgent synchronized cardioversion (starting at 100 Joules for monomorphic VT). Synchronization prevents the shock from being delivered during the vulnerable T-wave phase, avoiding the induction of ventricular fibrillation. If the QRS rhythm is regular and monomorphic, we synchronize. (Ref: Tintinalli's Ch. 18; Step-Up to EM Ch. 2; Case Files: EM Case 2)"
    },
    # T19: Pulseless VT / Ventricular Fibrillation
    {
        "q": "A {age}-year-old {gender} named {name} suddenly collapses in the Emergency Department. {pronoun_cap} is unresponsive, pulseless, and apneic. The cardiac monitor shows ventricular fibrillation. CPR is immediately initiated, and the defibrillator is charged. What is the next most appropriate action?",
        "options": [
            "Deliver an immediate unsynchronized shock (defibrillation) at 200 Joules biphasic, then resume chest compressions immediately",
            "Perform synchronized cardioversion at 200 Joules to coordinate with the QRS complex",
            "Administer epinephrine 1 mg intravenously before delivering any shocks",
            "Administer amiodarone 300 mg intravenously over 10 minutes",
            "Intubate the patient and obtain arterial blood gas values before defibrillation"
        ],
        "answer": 0,
        "exp": "For pulseless Ventricular Tachycardia (VT) or Ventricular Fibrillation (VF), the single most critical intervention is immediate defibrillation (unsynchronized shock). Biphasic defibrillators should deliver the shock at the manufacturer's recommended dose (typically 120–200 Joules). Following the shock, chest compressions (CPR) must be resumed immediately for 2 minutes before checking the rhythm or pulse. (Ref: Tintinalli's Ch. 22; Step-Up to EM Ch. 2; Case Files: EM Case 2)"
    },
    # T20: Torsades de Pointes
    {
        "q": "A {age}-year-old {gender} named {name} presents with recurrent syncope. While attached to the cardiac monitor, the patient has an episode of rapid, irregular wide-complex tachycardia where the QRS complexes appear to twist around the baseline (polymorphic ventricular tachycardia). The patient is hemodynamically stable. An ECG obtained earlier showed a corrected QT (QTc) interval of {qtc_val} ms. Which of the following is the first-line therapy to prevent recurrence?",
        "options": [
            "Intravenous Magnesium Sulfate 2 grams push, followed by a maintenance infusion",
            "Intravenous amiodarone 150 mg push over 10 minutes",
            "Intravenous metoprolol 5 mg push over 2 minutes",
            "Intravenous lidocaine 100 mg push over 1 minute",
            "Immediate synchronized cardioversion at 100 Joules"
        ],
        "answer": 0,
        "exp": "This patient has Torsades de Pointes (TdP), a form of polymorphic ventricular tachycardia characterized by the twisting of QRS complexes around the baseline, occurring in the setting of a prolonged QT interval (QTc > 500 ms). The first-line treatment for stable TdP is intravenous magnesium sulfate (2 grams IV), which stabilizes the myocardial membrane. Potassium should also be aggressively replete to a target of >4.5 mEq/L. Amiodarone is strictly contraindicated. (Ref: Tintinalli's Ch. 18; Step-Up to EM Ch. 2; Case Files: EM Case 2; Roberts & Hedges Ch. 15)"
    },
    # T21: ADHF with Pulmonary Edema
    {
        "q": "A {age}-year-old {gender} named {name} presents to the {location} in severe respiratory distress. The patient has a history of congestive heart failure. Vitals are BP {sbp_high}/{dbp_high} mmHg, HR {hr_fast} bpm, RR {rr_high} rpm, and SpO2 {spo2_low}% on room air. The patient is sitting upright, using accessory muscles, and has diffuse crackles bilaterally and jugular venous distention. Which of the following represents the most appropriate initial therapy?",
        "options": [
            "Initiate non-invasive positive pressure ventilation (BiPAP/CPAP) and administer intravenous nitroglycerin",
            "Intubate the patient immediately and administer intravenous loop diuretics",
            "Administer high-flow oxygen via non-rebreather mask and intravenous morphine 4 mg",
            "Administer albuterol-ipratropium nebulizer and oral metoprolol 25 mg",
            "Administer intravenous nitroprusside infusion and normal saline bolus"
        ],
        "answer": 0,
        "exp": "The patient is presenting with Acute Decompensated Heart Failure (ADHF) with acute pulmonary edema and sympathetic crash. The first-line therapeutic goals are to reduce work of breathing and decrease preload/afterload. Non-invasive positive pressure ventilation (NIPPV: CPAP or BiPAP) is highly effective: it increases intrathoracic pressure, reducing preload, and recruits collapsed alveoli, improving oxygenation. Intravenous nitroglycerin acts as a powerful venodilator to reduce preload and, at higher doses, an afterload reducer. Morphine should be avoided. (Ref: Tintinalli's Ch. 53; Step-Up to EM Ch. 2; Case Files: EM Case 3)"
    },
    # T22: Cardiogenic Shock
    {
        "q": "A {age}-year-old {gender} named {name} is admitted with an acute anterior wall STEMI. The patient is now hypotensive with BP {sbp_low}/{dbp_low} mmHg, tachycardic at {hr_fast} bpm, and tachypneic. {pronoun_cap} has cold, clammy extremities, poor urine output, and diffuse crackles throughout both lung fields. An echocardiogram shows severe left ventricular dysfunction with an ejection fraction of 20%. Which of the following is the most appropriate first-line pharmacotherapy for this form of shock?",
        "options": [
            "Inotropic support with intravenous Dobutamine, along with Norepinephrine if profound hypotension is present",
            "Aggressive fluid resuscitation with 2 liters of normal saline bolus",
            "Intravenous nitroglycerin infusion titrated to a mean arterial pressure of 65 mmHg",
            "Intravenous metoprolol 5 mg push to reduce myocardial oxygen demand",
            "High-dose intravenous furosemide 80 mg push as sole therapy"
        ],
        "answer": 0,
        "exp": "The patient is in cardiogenic shock, characterized by inadequate tissue perfusion (cold, clammy extremities, poor urine output) and pulmonary congestion (crackles) in the setting of severe cardiac dysfunction. Fluid resuscitation is contraindicated as it will worsen pulmonary edema. The primary treatment includes inotropic support with Dobutamine to increase cardiac contractility and cardiac output. If profound hypotension is present (e.g., MAP < 60 mmHg), a vasopressor such as Norepinephrine should be co-administered to maintain perfusion pressure. (Ref: Tintinalli's Ch. 53 & 12; Step-Up to EM Ch. 2; Case Files: EM Case 3)"
    },
    # T23: Acute Aortic Dissection
    {
        "q": "A {age}-year-old {gender} named {name} presents with sudden-onset, severe, 'tearing' chest pain that radiates to the {pain_radiation}. Vitals are BP 210/115 mmHg in the right arm and 175/95 mmHg in the left arm, HR {hr_fast} bpm, and RR {rr_normal} rpm. The chest radiograph shows a widened mediastinum. A CT angiogram confirms an acute Stanford Type B aortic dissection. Which of the following represents the correct immediate medical management strategy?",
        "options": [
            "Administer intravenous esmolol or labetalol FIRST to control heart rate to <60 bpm, then add a vasodilator like nitroprusside if needed to keep SBP 100–120 mmHg",
            "Administer intravenous nitroprusside immediately to rapidly lower blood pressure, followed by oral metoprolol",
            "Administer a 1 liter normal saline bolus and start a norepinephrine infusion to maintain coronary perfusion pressure",
            "Administer intravenous heparin and activate the catheterization laboratory for emergency coronary stenting",
            "Administer intravenous tissue plasminogen activator (tPA) to dissolve any occlusive thrombi in the aorta"
        ],
        "answer": 0,
        "exp": "The management of acute aortic dissection requires immediate reduction of blood pressure and heart rate to minimize aortic wall shear stress (dP/dt). The target heart rate is <60 bpm and target systolic blood pressure is 100–120 mmHg. Heart rate must be controlled FIRST using a short-acting beta-blocker (like esmolol or labetalol). If a vasodilator (such as nitroprusside or nicardipine) is administered before beta-blockade, it will cause reflex sympathetic activation and tachycardia, which increases dP/dt and can cause dissection propagation. (Ref: Tintinalli's Ch. 59; Step-Up to EM Ch. 2; Case Files: EM Case 4)"
    },
    # T24: Hypertensive Emergency with Acute Pulmonary Edema
    {
        "q": "A {age}-year-old {gender} named {name} presents with severe shortness of breath and headache. Vitals are BP {sbp_high}/{dbp_high} mmHg, HR {hr_fast} bpm, and RR {rr_high} rpm. Physical exam reveals a patient in distress with diffuse rales, jugular venous distention, and 2+ bilateral lower extremity edema. The chest radiograph demonstrates pulmonary vascular congestion. What is the most appropriate management for this hypertensive emergency?",
        "options": [
            "Intravenous vasodilators (e.g., nitroglycerin, clevidipine, or nitroprusside) to reduce afterload, alongside intravenous loop diuretics",
            "Intravenous hydralazine push and oral clonidine 0.2 mg to rapidly drop the blood pressure to normal limits within 30 minutes",
            "Intravenous esmolol infusion as sole therapy to achieve a target heart rate <60 bpm",
            "Sublingual nifedipine 10 mg to achieve rapid, predictable blood pressure reduction",
            "Discharge the patient with instructions to double their current oral antihypertensive regimen and follow up in 24 hours"
        ],
        "answer": 0,
        "exp": "The patient is experiencing a hypertensive emergency presenting as acute heart failure/pulmonary edema. This condition requires immediate, controlled reduction of blood pressure to reduce left ventricular afterload and relieve pulmonary congestion. The preferred agents are intravenous vasodilators such as nitroglycerin or clevidipine, along with intravenous loop diuretics (furosemide). Short-acting oral calcium channel blockers (e.g., sublingual nifedipine) are contraindicated due to the risk of precipitating rapid, uncontrolled hypotension. (Ref: Tintinalli's Ch. 57 & 53; Step-Up to EM Ch. 2; Case Files: EM Case 3 & 4)"
    },
    # T25: Hypertensive Encephalopathy
    {
        "q": "A {age}-year-old {gender} named {name} presents with a severe headache, confusion, and visual blurriness. Vitals are BP {sbp_high}/{dbp_high} mmHg, HR {hr_normal} bpm, RR {rr_normal} rpm, and Temp {temp_f_normal}°F. Physical examination reveals bilateral papilledema and mild disorientation, but no focal neurological deficits. Head CT is negative for acute hemorrhage or ischemia. What is the most appropriate strategy for blood pressure reduction in this patient?",
        "options": [
            "Reduce Mean Arterial Pressure (MAP) by no more than 20–25% in the first hour using titratable intravenous medications like nicardipine, clevidipine, or labetalol",
            "Rapidly reduce blood pressure to <120/80 mmHg within the first 30 minutes using intravenous hydralazine push",
            "Administer sublingual nifedipine 10 mg every 15 minutes until systolic blood pressure is below 140 mmHg",
            "Withhold all blood pressure medications for 24 hours to prevent hypoperfusion and cerebral ischemia",
            "Initiate oral lisinopril 20 mg and discharge home with outpatient follow-up in 48 hours"
        ],
        "answer": 0,
        "exp": "The patient is presenting with hypertensive encephalopathy, a hypertensive emergency characterized by severe headache, confusion, visual changes, and papilledema due to breakdown of cerebral autoregulation. To prevent cerebral hypoperfusion and ischemic stroke, blood pressure should be reduced in a controlled manner: lowering Mean Arterial Pressure (MAP) by no more than 20–25% in the first hour, followed by gradual reduction to 160/100–110 mmHg over the next 2–6 hours. Highly titratable intravenous medications such as nicardipine, clevidipine, or labetalol are preferred. (Ref: Tintinalli's Ch. 57; Step-Up to EM Ch. 2; Case Files: EM Case 4)"
    },
    # T26: Pheochromocytoma Hypertensive Crisis
    {
        "q": "A {age}-year-old {gender} named {name} presents to the Emergency Department in a severe hypertensive crisis with a blood pressure of {sbp_high}/{dbp_high} mmHg, heart rate of {hr_fast} bpm, severe headache, palpitations, and sweating. The patient has a known history of pheochromocytoma and admits to missing their medications. Which of the following represents the correct class of medication and sequence of administration?",
        "options": [
            "Administer an alpha-blocker (e.g., phentolamine or phenoxybenzamine) FIRST, followed by a beta-blocker if tachycardia persists",
            "Administer a beta-blocker (e.g., metoprolol or esmolol) FIRST to control the tachyarrhythmia, followed by an alpha-blocker",
            "Administer intravenous lisinopril immediately to avoid any adrenergic pathway drug-drug interactions",
            "Administer a pure beta-blocker like propranolol as mono-therapy, as it controls both tachycardia and vasomotor tone",
            "Administer high-dose intravenous loop diuretics to promote rapid renal clearance of excess catecholamines"
        ],
        "answer": 0,
        "exp": "In a sympathetic crisis (e.g., pheochromocytoma, cocaine/amphetamine toxicity), there is a massive release of catecholamines stimulating both alpha- and beta-receptors. The correct management is alpha-blockade first (e.g., intravenous phentolamine or oral phenoxybenzamine) to promote vasodilation and lower blood pressure, followed by beta-blockade to control tachycardia. If a beta-blocker is administered first or alone, it blocks the vasodilatory beta-2 receptors, leaving alpha-1 vasoconstrictive receptors unopposed. This unopposed alpha-stimulation can precipitate severe vasoconstriction and dangerous hypertensive crisis. (Ref: Tintinalli's Ch. 57 & 185; Step-Up to EM Ch. 2; Case Files: EM Case 4)"
    },
    # T27: Acute Pericarditis
    {
        "q": "A {age}-year-old {gender} named {name} presents with a {duration}-day history of sharp substernal chest pain. The pain is worse when lying flat in bed and is relieved when {pronoun} sits upright and leans forward. Temp is {temp_f_high}°F, BP {sbp_normal}/{dbp_normal} mmHg, HR {hr_normal} bpm. A friction rub is audible at the left lower sternal border. The ECG shows diffuse, concave ST-elevation in multiple leads and PR-segment depression in lead II, along with PR-elevation in lead aVR. Which of the following is the most appropriate treatment?",
        "options": [
            "High-dose NSAIDs (e.g., ibuprofen or aspirin) and Colchicine",
            "Emergent coronary angiography and percutaneous coronary intervention",
            "Intravenous heparin infusion and broad-spectrum antibiotics",
            "Intravenous corticosteroids (methylprednisolone) and observation",
            "Emergent pericardiocentesis at the bedside"
        ],
        "answer": 0,
        "exp": "The clinical presentation (pleuritic chest pain worse when supine, relieved by sitting forward), presence of a pericardial friction rub, fever, and classic ECG changes (diffuse concave ST-elevation and reciprocal PR-segment changes: depression in lead II, elevation in aVR) are pathognomonic for acute pericarditis. The first-line treatment is high-dose NSAIDs (e.g., ibuprofen or aspirin) for pain and inflammation, combined with Colchicine to reduce recurrence rates. (Ref: Tintinalli's Ch. 54; Step-Up to EM Ch. 2; Case Files: EM Case 5)"
    },
    # T28: Cardiac Tamponade
    {
        "q": "A {age}-year-old {gender} named {name} presents with severe dyspnea and chest pressure. Vitals are BP {sbp_low}/{dbp_low} mmHg, HR {hr_fast} bpm, RR {rr_high} rpm. On physical examination, the patient has jugular venous distension and muffled heart sounds. The systolic blood pressure drops by 15 mmHg during inspiration. The ECG demonstrates electrical alternans. Which of the following is the most appropriate immediate management?",
        "options": [
            "Emergent bedside ultrasound-guided pericardiocentesis",
            "Intravenous infusion of furosemide 80 mg push to decrease intravascular volume",
            "Intravenous metoprolol 5 mg push to reduce myocardial oxygen consumption",
            "Immediate endotracheal intubation and initiation of positive pressure ventilation",
            "Urgent chest tube insertion (tube thoracostomy) in the 5th intercostal space"
        ],
        "answer": 0,
        "exp": "The patient is presenting with cardiac tamponade, characterized by Beck's triad (hypotension, jugular venous distension, and muffled heart sounds), pulsus paradoxus (systolic BP drop >10 mmHg during inspiration), and ECG findings of electrical alternans. This is a life-threatening emergency causing mechanical cardiogenic shock. The immediate treatment of choice is emergent pericardiocentesis to remove fluid and restore ventricular filling. (Ref: Tintinalli's Ch. 54; Step-Up to EM Ch. 2; Case Files: EM Case 5; Roberts & Hedges Ch. 13)"
    },
    # T29: Myocarditis
    {
        "q": "A {age}-year-old {gender} named {name} presents with chest pain, palpitations, and progressive dyspnea over the past week. The patient reports having a flu-like illness with fever and myalgias two weeks ago. Vitals are BP 106/68 mmHg, HR 104 bpm, and RR 20 rpm. Troponin is elevated at {troponin_high} ng/mL, and the chest radiograph shows mild cardiomegaly. The ECG shows sinus tachycardia with non-specific T-wave inversions. What is the most likely diagnosis?",
        "options": [
            "Myocarditis",
            "Acute coronary syndrome",
            "Acute pericarditis",
            "Dilated cardiomyopathy",
            "Infective endocarditis"
        ],
        "answer": 0,
        "exp": "The presentation of a young or middle-aged patient with a recent viral prodrome (flu-like symptoms) who subsequently develops chest pain, palpitations, signs of heart failure (dyspnea, cardiomegaly), and elevated cardiac enzymes (troponin) is highly suspicious for myocarditis (myocardial inflammation). ECG findings are non-specific. Management is primarily supportive, focusing on treating heart failure symptoms (ACE inhibitors, beta-blockers) and monitoring for dysrhythmias. (Ref: Tintinalli's Ch. 53 & 54; Step-Up to EM Ch. 2; Case Files: EM Case 5)"
    },
    # T30: Infective Endocarditis with Valve Ring Abscess
    {
        "q": "A {age}-year-old {gender} named {name} presents with a fever of {temp_f_high}°F, chills, and fatigue. The patient has a history of intravenous drug use. Vitals are BP {sbp_normal}/{dbp_normal} mmHg, HR {hr_slow} bpm. Physical exam reveals a new blowing holosystolic murmur at the apex, subungual splinter hemorrhages, and Osler nodes. The ECG shows sinus bradycardia with a new first-degree AV block (PR interval {pr_interval} ms). Which of the following is the most likely cause of the ECG abnormality and the next best step?",
        "options": [
            "Perivalvular/valve ring abscess invading the cardiac conduction system; obtain an emergent echocardiogram (preferably transesophageal) and consult cardiology/cardiac surgery",
            "Myocardial infarction of the SA node; activate the cardiac catheterization laboratory for emergency angiography",
            "Digoxin toxicity; administer digoxin-specific antibody fragments (Digibind) immediately",
            "Lyme carditis; initiate intravenous ceftriaxone and place temporary pacing pads",
            "Normal variant in intravenous drug users; reassure the patient and check blood cultures in 24 hours"
        ],
        "answer": 0,
        "exp": "This patient presents with signs of infective endocarditis (IE) (fever, IV drug use, new murmur, peripheral stigmata). The new ECG finding of conduction system delay (first-degree AV block or bundle branch block) in a patient with IE is a classic indicator of a perivalvular abscess (valve ring abscess). The infection has extended from the valve annulus into the adjacent cardiac skeleton and conduction pathway. A transesophageal echocardiogram (TEE) is the diagnostic test of choice. (Ref: Tintinalli's Ch. 55 & 18; Step-Up to EM Ch. 2; Case Files: EM Case 5 & 2)"
    },
    # T31: Infective Endocarditis Empiric Treatment
    {
        "q": "A {age}-year-old {gender} named {name} presents to the {location} with fever, acute confusion, and dyspnea. Physical examination reveals multiple petechiae on the oral mucosa, a new early diastolic murmur, and splinter hemorrhages under the fingernails. Blood cultures are drawn. What is the most appropriate empiric antimicrobial regimen while awaiting culture results?",
        "options": [
            "Intravenous Vancomycin and Ceftriaxone",
            "Oral Amoxicillin and Clindamycin",
            "Intravenous Piperacillin-Tazobactam as monotherapy",
            "Intravenous Azithromycin and Ciprofloxacin",
            "Intravenous Acyclovir and Ganciclovir"
        ],
        "answer": 0,
        "exp": "The clinical presentation is highly suggestive of acute infective endocarditis. Empiric antibiotic therapy must be initiated promptly in patients with suspected IE who are acutely ill or hemodynamically unstable, after drawing at least 2-3 sets of blood cultures. The standard empiric regimen for acute IE (targeting MRSA, streptococci, and enterococci) consists of intravenous Vancomycin to cover Gram-positives including resistant strains, combined with intravenous Ceftriaxone (2 g every 12 hours) or Gentamicin. (Ref: Tintinalli's Ch. 55; Step-Up to EM Ch. 2; Case Files: EM Case 5)"
    },
    # T32: Cardiogenic vs. Vasovagal Syncope
    {
        "q": "A {age}-year-old {gender} named {name} is brought to the Emergency Department after a transient loss of consciousness. The episode occurred suddenly while {pronoun} was sitting in a chair, with no prodromal symptoms, and was witnessed by a co-worker who reports the patient was unresponsive for 30 seconds. Which of the following features in this patient's presentation represents a high-risk factor that mandates admission and cardiac telemetry monitoring?",
        "options": [
            "Sudden loss of consciousness without prodrome while in a seated position",
            "Age younger than 40 years old and a history of motion sickness",
            "The presence of lightheadedness and nausea prior to losing consciousness",
            "Loss of consciousness immediately following a painful stimulus",
            "Loss of consciousness occurring immediately upon standing up"
        ],
        "answer": 0,
        "exp": "Syncope must be risk-stratified to differentiate benign causes from life-threatening cardiogenic syncope (arrhythmia, structural heart disease). High-risk features indicating cardiogenic syncope include: sudden onset without prodrome, syncope occurring while supine or seated, syncope during exertion, family history of sudden cardiac death, or abnormal ECG. These patients mandate admission for continuous telemetry monitoring. (Ref: Tintinalli's Ch. 52; Step-Up to EM Ch. 2; Case Files: EM Case 6)"
    },
    # T33: Pulmonary Embolism with Right Heart Strain
    {
        "q": "A {age}-year-old {gender} named {name} presents with sudden-onset pleuritic chest pain, dyspnea, and near-syncope. Vitals are BP {sbp_low}/{dbp_low} mmHg, HR {hr_fast} bpm, RR {rr_high} rpm, and SpO2 {spo2_low}% on room air. The physical exam reveals a diaphoretic patient with prominent jugular venous distension. The ECG shows sinus tachycardia at {hr_fast} bpm with an S1Q3T3 pattern. A bedside echocardiogram reveals right ventricular dilation and hypokinesis of the RV free wall (McConnell's sign). Which of the following is the most appropriate management?",
        "options": [
            "Intravenous thrombolysis (e.g., Alteplase) or catheter-directed embolectomy",
            "Initiation of therapeutic anticoagulation with low-molecular-weight heparin",
            "Urgent coronary angiography to evaluate for acute myocardial infarction",
            "Intravenous furosemide 40 mg and a nitroglycerin infusion",
            "Discharge home on oral apixaban with close outpatient follow-up"
        ],
        "answer": 0,
        "exp": "The patient is presenting with a massive pulmonary embolism (PE), defined by acute PE causing hemodynamic instability (systolic blood pressure <90 mmHg). The presence of right ventricular strain (evidenced by McConnell's sign on echo, S1Q3T3 pattern on ECG, and JVD) confirms significant right heart overload. The treatment of choice for massive PE with persistent shock is intravenous thrombolysis (systemic Alteplase 100 mg) to rapidly dissolve the clot and restore pulmonary perfusion. (Ref: Tintinalli's Ch. 56; Step-Up to EM Ch. 2; Case Files: EM Case 7)"
    },
    # T34: Cardiac Arrest with PEA/Asystole
    {
        "q": "A {age}-year-old {gender} named {name} goes into cardiac arrest in the Emergency Department. CPR is ongoing. The cardiac monitor shows a slow, wide-complex rhythm at {hr_slow} bpm. There is no palpable carotid pulse. Which of the following represents the correct immediate action according to ACLS protocols?",
        "options": [
            "Continue high-quality CPR, administer Epinephrine 1 mg IV push every 3–5 minutes, and search for reversible causes (H's and T's)",
            "Perform immediate unsynchronized defibrillation at 200 Joules biphasic",
            "Perform synchronized cardioversion at 100 Joules to restore sinus rhythm",
            "Administer a rapid bolus of Amiodarone 300 mg intravenously",
            "Initiate transcutaneous pacing immediately to override the slow rhythm"
        ],
        "answer": 0,
        "exp": "The cardiac arrest rhythm is Pulseless Electrical Activity (PEA). The ACLS algorithm for non-shockable rhythms (PEA and Asystole) dictates: (1) High-quality CPR continuously; (2) Epinephrine 1 mg IV/IO as soon as possible, repeated every 3–5 minutes; (3) Search for and treat reversible causes (the 5 H's and 5 T's: Hypovolemia, Hypoxia, Hydrogen ion acidosis, Hypo-/Hyperkalemia, Hypothermia; Tension pneumothorax, Tamponade, Toxins, Thrombosis pulmonary, Thrombosis coronary). Defibrillation or cardioversion is NOT indicated for PEA. (Ref: Tintinalli's Ch. 22; Step-Up to EM Ch. 2; Case Files: EM Case 2)"
    },
    # T35: Pacemaker Malfunction (Failure to Pace/Sense)
    {
        "q": "A {age}-year-old {gender} named {name} with a past medical history of a permanent pacemaker presents with severe lightheadedness and dyspnea. Vitals are BP {sbp_low}/{dbp_low} mmHg, HR {hr_slow} bpm. The cardiac monitor shows a ventricular rate of {hr_slow} bpm. The ECG demonstrates occasional pacemaker spikes that are not followed by a QRS complex. Which of the following represents the most appropriate immediate Emergency Department intervention?",
        "options": [
            "Initiate transcutaneous pacing immediately and place a magnet over the pacemaker generator to revert it to asynchronous pacing mode",
            "Administer amiodarone 150 mg IV over 10 minutes to stabilize the pacemaker-myocardium interface",
            "Administer a bolus of 1 liter of normal saline and repeat the ECG in 1 hour",
            "Initiate an emergency infusion of norepinephrine at 10 mcg/min to stimulate intrinsic pacing",
            "Immediately arrange for emergent surgical explantation of the pacemaker leads"
        ],
        "answer": 0,
        "exp": "This patient is experiencing pacemaker malfunction presenting as failure to capture (pacemaker spikes are visible but do not depolarize the ventricles, resulting in symptomatic bradycardia). The immediate management for symptomatic bradycardia due to pacemaker failure is transcutaneous pacing (TCP) to restore rate and perfusion. Additionally, placing a magnet over the pacemaker generator causes the device to revert to its default asynchronous pacing mode (often VOO or DOO), which can override sensing errors or software issues. (Ref: Tintinalli's Ch. 58 & 18; Step-Up to EM Ch. 2; Case Files: EM Case 2; Roberts & Hedges Ch. 15)"
    }
]

# ============================================================
# Generation Logic
# ============================================================
def generate_mcqs():
    seen_questions = set()
    mcqs = []
    
    for t_idx, t in enumerate(templates):
        variants_generated = 0
        attempts = 0
        while variants_generated < 10 and attempts < 200:
            attempts += 1
            gender_details = random.choice(genders_pool)
            name = random.choice(gender_details["names"])
            gender = gender_details["gender"]
            pronoun = gender_details["pronoun"]
            pronoun_cap = gender_details["pronoun_cap"]
            possessive = gender_details["possessive"]
            possessive_cap = gender_details["possessive_cap"]
            objective = gender_details["objective"]
            
            age = random.choice(ages_pool)
            sbp_low = random.choice(sbp_low_pool)
            dbp_low = random.choice(dbp_low_pool)
            sbp_normal = random.choice(sbp_normal_pool)
            dbp_normal = random.choice(dbp_normal_pool)
            sbp_high = random.choice(sbp_high_pool)
            dbp_high = random.choice(dbp_high_pool)
            hr_normal = random.choice(hr_normal_pool)
            hr_slow = random.choice(hr_slow_pool)
            hr_fast = random.choice(hr_fast_pool)
            hr_tachy = random.choice(hr_tachy_pool)
            rr_normal = random.choice(rr_normal_pool)
            rr_high = random.choice(rr_high_pool)
            spo2_normal = random.choice(spo2_normal_pool)
            spo2_low = random.choice(spo2_low_pool)
            temp_f_normal = random.choice(temp_f_normal_pool)
            temp_f_high = random.choice(temp_f_high_pool)
            troponin_high = random.choice(troponin_high_pool)
            bnp_high = random.choice(bnp_high_pool)
            potassium_low = random.choice(potassium_low_pool)
            potassium_high = random.choice(potassium_high_pool)
            magnesium_low = random.choice(magnesium_low_pool)
            lead_elev = random.choice(lead_elev_pool)
            lead_dep = random.choice(lead_dep_pool)
            pain_radiation = random.choice(pain_radiation_pool)
            location = random.choice(location_pool)
            
            hours_count = random.choice(hours_count_pool)
            distance = random.choice(distance_pool)
            minutes_count = random.choice(minutes_count_pool)
            post_day = random.choice(post_day_pool)
            qtc_val = random.choice(qtc_val_pool)
            duration = random.choice(duration_pool)
            pr_interval = random.choice(pr_interval_pool)
            
            format_kwargs = {
                "name": name, "gender": gender, "pronoun": pronoun, "pronoun_cap": pronoun_cap,
                "possessive": possessive, "possessive_cap": possessive_cap, "objective": objective,
                "age": age, "sbp_low": sbp_low, "dbp_low": dbp_low,
                "sbp_normal": sbp_normal, "dbp_normal": dbp_normal,
                "sbp_high": sbp_high, "dbp_high": dbp_high,
                "hr_normal": hr_normal, "hr_slow": hr_slow, "hr_fast": hr_fast, "hr_tachy": hr_tachy,
                "rr_normal": rr_normal, "rr_high": rr_high,
                "spo2_normal": spo2_normal, "spo2_low": spo2_low,
                "temp_f_normal": temp_f_normal, "temp_f_high": temp_f_high,
                "troponin_high": troponin_high, "bnp_high": bnp_high,
                "potassium_low": potassium_low, "potassium_high": potassium_high, "magnesium_low": magnesium_low,
                "lead_elev": lead_elev, "lead_dep": lead_dep, "pain_radiation": pain_radiation,
                "location": location, "hours_count": hours_count, "distance": distance,
                "minutes_count": minutes_count, "post_day": post_day, "qtc_val": qtc_val,
                "duration": duration, "pr_interval": pr_interval
            }
            
            try:
                q_text = t["q"].format(**format_kwargs)
            except KeyError as e:
                print(f"KeyError in template {t_idx} formatting question: {e}")
                continue
                
            if q_text in seen_questions:
                continue
                
            # Format choices
            opts = list(t["options"])
            opts_formatted = []
            for o in opts:
                try:
                    o_fmt = o.format(**format_kwargs)
                except (KeyError, IndexError):
                    o_fmt = o
                opts_formatted.append(o_fmt)
                
            answer_idx = t["answer"]
            correct_opt = opts_formatted[answer_idx]
            
            # Shuffle options
            random.shuffle(opts_formatted)
            new_ans_idx = opts_formatted.index(correct_opt)
            
            # Format explanation
            try:
                exp_formatted = t["exp"].format(**format_kwargs)
            except (KeyError, IndexError):
                exp_formatted = t["exp"]
                
            mcq_data = {
                "q": q_text,
                "options": opts_formatted,
                "correct_index": new_ans_idx,
                "exp": exp_formatted
            }
            
            seen_questions.add(q_text)
            mcqs.append(mcq_data)
            variants_generated += 1
            
        if variants_generated < 10:
            print(f"WARNING: Template {t_idx} only generated {variants_generated} variants after {attempts} attempts")
            
    print(f"Total unique MCQs generated: {len(mcqs)}")
    return mcqs

mcqs = generate_mcqs()

# ============================================================
# Partition and Write to 4 SQL Files (100, 100, 100, 50)
# ============================================================
mcq_sql_strings = []
for m in mcqs:
    q_esc = m["q"].replace("'", "''")
    opts_json = json.dumps(m["options"]).replace("'", "''")
    exp_esc = m["exp"].replace("'", "''")
    mcq_sql_strings.append(f"    (v_topic_id, '{q_esc}', '{opts_json}'::jsonb, {m['correct_index']}, '{exp_esc}')")

parts = [
    mcq_sql_strings[0:100],
    mcq_sql_strings[100:200],
    mcq_sql_strings[200:300],
    mcq_sql_strings[300:350]
]

for part_num, part_mcqs in enumerate(parts, 1):
    out_file = f"c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260521_em_cardiac_mcqs_p{part_num}.sql"
    with open(out_file, "w", encoding="utf-8") as f:
        start_idx = (part_num - 1) * 100 + 1
        end_idx = (part_num - 1) * 100 + len(part_mcqs)
        f.write(f"-- US MD/MBBS (4th Year) clinical case blocks - Emergency Medicine: Cardiac emergencies - Part {part_num} ({start_idx}-{end_idx})\n")
        f.write("BEGIN;\n\n")
        f.write("DO $$\nDECLARE\n    v_topic_id UUID;\nBEGIN\n")
        f.write(f"    SELECT id INTO v_topic_id FROM topics WHERE slug = '{topic_slug}' LIMIT 1;\n")
        f.write(f"    IF v_topic_id IS NULL THEN\n        RAISE EXCEPTION 'Topic {topic_slug} not found.';\n    END IF;\n\n")
        
        if part_num == 1:
            f.write("    DELETE FROM mcqs WHERE topic_id = v_topic_id;\n\n")
            
        f.write("    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES\n")
        for i, sql_str in enumerate(part_mcqs):
            if i < len(part_mcqs) - 1:
                f.write(sql_str + ",\n")
            else:
                f.write(sql_str + ";\n")
        f.write("END $$;\nCOMMIT;\n")
        
    print(f"Part {part_num}: {len(part_mcqs)} MCQs -> {out_file}")

# ============================================================
# Write all 350 MCQs to em_cardiac_mcqs_full.md in Markdown
# ============================================================
md_file_path = "c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\em_cardiac_mcqs_full.md"
with open(md_file_path, "w", encoding="utf-8") as md_f:
    md_f.write("# Emergency Medicine MCQs – Cardiac Emergencies\n\n")
    md_f.write("**Instructions:** Choose the best answer for each question.\n\n---\n\n")
    for i, m in enumerate(mcqs, 1):
        md_f.write(f"{i}. {m['q']}\n")
        letters = ["A", "B", "C", "D", "E"]
        for opt_idx, opt in enumerate(m['options']):
            md_f.write(f"   - {letters[opt_idx]}) {opt}\n")
        ans_letter = letters[m['correct_index']]
        md_f.write(f"   - **Answer:** {ans_letter}\n\n")

print(f"Generated Markdown file with {len(mcqs)} MCQs -> {md_file_path}")
print(f"\nDone! Total: {len(mcqs)} MCQs in {len(parts)} SQL files and 1 Markdown file.")
