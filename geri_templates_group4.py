# Group 4 Geriatrics Templates
# Covers: Cardiovascular, End-of-Life, Elder Abuse, Social Determinants

templates_cardiovascular = [
    # 1. Isolated systolic hypertension
    {
        "title": "Isolated Systolic Hypertension",
        "age_range": (60, 85),
        "scenario": (
            "A {age}-year-old {gender} is evaluated during a routine health wellness visit. The patient has no symptoms of cardiorespiratory disease. Physical exam is normal. BP is 158/72 mmHg (widened pulse pressure). Echocardiogram shows mild concentric left ventricular hypertrophy with normal ejection fraction of 62%."
        ),
        "questions": [
            {
                "q": "What is the primary underlying physiological mechanism for this clinical presentation?",
                "options": [
                    "Decreased arterial compliance (stiffening of large conduit arteries) due to loss of elastin and increased collagen deposition",
                    "Primary hypersecretion of renin and aldosterone by the kidney",
                    "Atherosclerotic calcification of the main renal arteries (renovascular hypertension)",
                    "Upregulation of vascular beta-2 adrenergic receptors",
                    "Impaired left ventricular contraction during early systole"
                ],
                "answer": 0,
                "exp": "Isolated systolic hypertension (ISH) is the most common form of hypertension in older adults. It is driven by the age-related loss of elastic fibers and deposition of collagen in the media of large arteries (e.g., aorta), leading to increased arterial stiffness and decreased vascular compliance, which selectively elevates SBP."
            },
            {
                "q": "Which of the following classes of antihypertensive medications is preferred as first-line therapy for isolated systolic hypertension in older adults?",
                "options": [
                    "Thiazide-like diuretics (e.g., chlorthalidone) or dihydropyridine calcium channel blockers (e.g., amlodipine)",
                    "Beta-blockers (e.g., metoprolol or atenolol)",
                    "Alpha-1 blockers (e.g., doxazosin or terazosin)",
                    "Direct vasodilators (e.g., hydralazine)",
                    "Loop diuretics (e.g., furosemide) as first-line monotherapy"
                ],
                "answer": 0,
                "exp": "For ISH, clinical trials (like SHEP and Syst-Eur) demonstrate that thiazide diuretics and long-acting dihydropyridine calcium channel blockers are highly effective first-line agents in reducing stroke and cardiovascular events in older adults."
            },
            {
                "q": "What is the relaxed blood pressure target recommended by the American College of Physicians (ACP) for very elderly patients (aged >= 80) to minimize the risk of orthostatic falls and cerebral hypoperfusion?",
                "options": [
                    "< 140/90 mmHg (or < 150 mmHg systolic in frail patients)",
                    "< 120/80 mmHg strictly",
                    "< 110/70 mmHg to prevent all microvascular strokes",
                    "A systolic pressure of exactly 100 mmHg",
                    "Hypertension should not be treated at all in patients over age 80"
                ],
                "answer": 0,
                "exp": "For patients over 80 or frail with falls risk, guidelines suggest relaxing targets (systolic < 140 or < 150 mmHg) because aggressive blood pressure control is linked to significant orthostatic hypotension, syncope, and fractures."
            }
        ]
    },
    # 2. Atrial fibrillation management
    {
        "title": "Atrial Fibrillation and Anticoagulation Decision",
        "age_range": (65, 90),
        "scenario": (
            "A {age}-year-old {gender} with a history of hypertension, osteoarthritis, and a prior ischemic stroke is diagnosed with new-onset, asymptomatic atrial fibrillation. The patient has had no falls. The physician calculates the patient's **CHA2DS2-VASc** and **HAS-BLED** scores to guide anticoagulation therapy."
        ),
        "questions": [
            {
                "q": "What represents the most appropriate anticoagulation recommendation for this patient?",
                "options": [
                    "Initiate a Direct Oral Anticoagulant (DOAC like apixaban or rivaroxaban); in patients with elevated CHA2DS2-VASc scores (>= 2), anticoagulation is indicated for stroke prevention, and DOACs are preferred over warfarin due to lower intracranial bleeding risk",
                    "Initiate daily aspirin 81 mg and clopidogrel 75 mg as a safer alternative to oral anticoagulants",
                    "Avoid all anticoagulation; the patient's age and history of osteoarthritis (falls risk) make the bleeding risk prohibitive",
                    "Initiate high-dose intravenous heparin infusion and schedule immediate surgical left atrial appendage closure",
                    "Initiate warfarin therapy with a target INR of 4.0 to 5.0 to guarantee thrombus prevention"
                ],
                "answer": 0,
                "exp": "This patient's CHA2DS2-VASc score is elevated (at least 4: age >= 75: 2 points, HTN: 1 point, prior stroke: 2 points), indicating a high stroke risk (> 4% annually). Anticoagulation is strongly indicated. DOACs (apixaban, rivaroxaban) are first-line over warfarin because they have superior safety profiles, particularly a lower risk of life-threatening intracranial hemorrhage."
            },
            {
                "q": "Which of the following clinical factors is heavily weighted as 2 points in the CHA2DS2-VASc stroke risk stratification score?",
                "options": [
                    "Age >= 75 and prior history of stroke, TIA, or thromboembolism",
                    "Congestive heart failure and female sex",
                    "Hypertension and diabetes mellitus",
                    "Active smoking and vascular disease",
                    "Severe chronic kidney disease and osteoarthritis"
                ],
                "answer": 0,
                "exp": "In the CHA2DS2-VASc score, **C**ongestive heart failure (1), **H**ypertension (1), **A**ge >= 75 (2), **D**iabetes (1), **S**troke/TIA (2), **V**ascular disease (1), **A**ge 65-74 (1), **S**ex category/female (1). Age >= 75 and prior stroke are the 2-point criteria."
            },
            {
                "q": "How does a history of recurrent falls impact the clinical decision to anticoagulate an older adult with atrial fibrillation?",
                "options": [
                    "Anticoagulation should still be prescribed for most patients with high stroke risk, as the benefit of stroke prevention far outweighs the risk of subdural hematoma from falls, unless the falls are exceptionally frequent or uncontrolled",
                    "Recurrent falls represent an absolute contraindication to all forms of anticoagulation",
                    "The patient should be anticoagulated only with aspirin, which has no risk of causing subdural bleeding",
                    "The patient must be placed on strict, permanent bed rest if they are anticoagulated",
                    "The dose of the anticoagulant should be reduced by 75% to prevent bleeding during falls"
                ],
                "answer": 0,
                "exp": "Clinical models show that an older patient would need to fall approximately 295 times per year for the risk of subdural hematoma from falls to outweigh the benefit of stroke reduction from oral anticoagulation. Thus, falls are a precaution, not an absolute contraindication."
            }
        ]
    },
    # 3. Heart failure with preserved EF (HFpEF)
    {
        "title": "HFpEF: The Diastolic Heart Failure",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with a history of long-standing hypertension and type 2 diabetes presents with a 2-month history of progressive shortness of breath on exertion, orthopnea, and bilateral ankle swelling. Echocardiogram shows a left ventricular ejection fraction of **60%** (normal), but reveals concentric LV hypertrophy and severe diastolic dysfunction (impaired relaxation)."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the primary pharmacological management for symptom control?",
                "options": [
                    "Heart Failure with Preserved Ejection Fraction (HFpEF/diastolic heart failure); loop diuretics (e.g., furosemide) for volume control, along with aggressive blood pressure control and consideration of an SGLT2 inhibitor",
                    "Heart Failure with Reduced Ejection Fraction (HRef); initiate high-dose carvedilol, lisinopril, and spironolactone, and hold all diuretics",
                    "Primary pulmonary arterial hypertension; prescribe daily high-dose oral sildenafil and restrict all sodium",
                    "Coronary artery disease alone; schedule emergent coronary artery bypass graft (CABG) surgery",
                    "This is normal age-related dyspnea; discontinue all cardiac medications and recommend moderate exercise"
                ],
                "answer": 0,
                "exp": "HFpEF represents heart failure symptoms with an EF >= 50%. It is highly common in older hypertensive females, driven by ventricular stiffness and impaired relaxation. Management focuses on diuretics (furosemide) to maintain euvolemia, controlling blood pressure, and SGLT2 inhibitors (empagliflozin), which have shown survival/hospitalization benefits in HFpEF."
            },
            {
                "q": "What represents the primary pathophysiological alteration in the left ventricle of a patient with HFpEF?",
                "options": [
                    "Impaired left ventricular relaxation and increased chamber stiffness, leading to elevated diastolic filling pressures at rest or during exercise",
                    "Severe loss of myocardial contractility with dilatation of the ventricular chamber",
                    "Complete occlusion of the left anterior descending coronary artery causing anterior wall akinesis",
                    "Selective stenosis of the pulmonary valve causing severe right-sided pressure overload",
                    "Acute autoimmune destruction of the cardiac purkinje fibers"
                ],
                "answer": 0,
                "exp": "In HFpEF, the systolic pump function is intact (EF is normal), but the ventricle is stiff and hypertrophied, preventing it from relaxing and filling normally at low pressures during diastole. This raises pressure in the LV, which backs up into the lungs, causing dyspnea."
            },
            {
                "q": "Which of the following classes of medications has recently demonstrated a significant reduction in cardiovascular death and heart failure hospitalizations in patients with HFpEF in large clinical trials (e.g., EMPEROR-Preserved)?",
                "options": [
                    "SGLT2 inhibitors (e.g., empagliflozin or dapagliflozin)",
                    "Beta-blockers as first-line monotherapy",
                    "Loop diuretics as the sole treatment to improve survival",
                    "Calcium channel blockers like nifedipine",
                    "Inotropic agents like digoxin"
                ],
                "answer": 0,
                "exp": "Sodium-Glucose Cotransporter 2 (SGLT2) inhibitors, such as empagliflozin, were the first class of medications to demonstrate a statistically significant reduction in the composite endpoint of cardiovascular death and hospitalization for heart failure in patients with HFpEF."
            }
        ]
    },
    # 4. Aortic stenosis in elderly
    {
        "title": "Aortic Stenosis: Murmur and Syncope",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} presents after experiencing a brief episode of syncope while walking up a flight of stairs. The patient also reports progressive dyspnea and chest pressure during exertion. Physical exam is notable for a harsh, late-peaking **systolic crescendo-decrescendo murmur** at the right upper sternal border that radiates to the carotids, and a delayed carotid upstroke (pulsus parvus et tardus)."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what represents the definitive treatment for this symptomatic patient?",
                "options": [
                    "Severe symptomatic Aortic Stenosis (AS); diagnosed by echocardiogram, and treated definitively with Aortic Valve Replacement (either Transcatheter Aortic Valve Replacement [TAVR] or surgical SAVR)",
                    "Mitral valve prolapse; diagnosed by cardiac MRI, and treated with daily oral metoprolol and avoid all activity",
                    "Hypertrophic obstructive cardiomyopathy; treated with immediate surgical septal myectomy and high-dose digoxin",
                    "Vasovagal syncope secondary to arterial stiffness; prescribe daily oral midodrine and fludrocortisone",
                    "Angina pectoris; treated with daily high-dose oral isosorbide mononitrate as monotherapy"
                ],
                "answer": 0,
                "exp": "Symptomatic aortic stenosis classically presents with the triad of: **S**yncope, **A**ngina, and **D**yspnea ('SAD' mnemonic). The late-peaking systolic murmur radiating to the carotids and pulsus parvus et tardus confirm the diagnosis. Once symptoms develop, survival is extremely poor (< 2-3 years) without definitive Aortic Valve Replacement (TAVR is often preferred in older, frail patients due to its minimally invasive nature)."
            },
            {
                "q": "Which of the following clinical trials/developments has made valve replacement highly accessible and preferred in very elderly or frail patients with severe aortic stenosis due to its minimally invasive, percutaneous approach?",
                "options": [
                    "Transcatheter Aortic Valve Replacement (TAVR)",
                    "Surgical Aortic Valve Replacement (SAVR) with full sternotomy",
                    "Percutaneous balloon valvuloplasty as a permanent cure",
                    "Dual-chamber cardiac pacemaker placement",
                    "Coronary artery bypass grafting (CABG)"
                ],
                "answer": 0,
                "exp": "TAVR is a catheter-based, percutaneous procedure that deploys a prosthetic valve within the diseased aortic valve, bypassing the need for a full sternotomy and cardiopulmonary bypass, making it highly suitable for elderly, high-risk, or frail patients."
            },
            {
                "q": "Which of the following classes of medications should be used with extreme caution or avoided in patients with severe, critical aortic stenosis due to the risk of precipitating severe hypotension and syncope?",
                "options": [
                    "Vasodilators (e.g., nitrates, ACE inhibitors) and high-dose diuretics",
                    "Beta-blockers in patients with prior myocardial infarction",
                    "Direct oral anticoagulants like apixaban",
                    "Choleseterol-lowering statins like atorvastatin",
                    "Inhaled beta-2 agonists for concurrent asthma"
                ],
                "answer": 0,
                "exp": "Patients with severe AS have a fixed cardiac output. Vasodilators (nitrates, ACE inhibitors, or calcium channel blockers) reduce systemic vascular resistance. Because the heart cannot increase cardiac output to compensate, this causes a sudden, catastrophic drop in blood pressure, triggering syncope or cardiac arrest."
            }
        ]
    },
    # 5. Orthostatic hypotension management
    {
        "title": "Managing Orthostatic Hypotension",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} presents with frequent lightheadedness and near-falls upon standing up. Medications include doxazosin and furosemide. Vital signs demonstrate a lying BP of 148/88 mmHg and heart rate of 72 bpm. Standing BP at 3 minutes is 112/68 mmHg, with a heart rate of 80 bpm."
        ),
        "questions": [
            {
                "q": "What is the most appropriate first-line management plan for this patient?",
                "options": [
                    "Taper and discontinue the doxazosin and furosemide, instruct the patient on rising in stages, liberalize sodium and fluids (if no HF/CKD contraindications), and consider physical compression garments",
                    "Initiate high-dose oral midodrine and fludrocortisone immediately while continuing the doxazosin",
                    "Recommend strict, permanent bed rest to avoid all upright postural changes",
                    "Increase the dose of doxazosin to treat the supine hypertension and restrict all sodium",
                    "Abruptly stop all medications and administer a 3-liter normal saline bolus"
                ],
                "answer": 0,
                "exp": "The patient has orthostatic hypotension (drop in SBP >= 20 mmHg upon standing). Doxazosin (alpha-1 blocker) and furosemide (diuretic causing volume depletion) are prime triggers. Management is stepped: (1) stop offending drugs, (2) non-pharmacological measures (standing in stages, foot pumps, hydration, compression), (3) pharmacotherapy (midodrine/fludrocortisone) only if refractory."
            },
            {
                "q": "Which of the following physical counter-maneuvers is taught to patients with orthostatic hypotension to help abort an episode of lightheadedness during standing?",
                "options": [
                    "Crossing the legs, squeezing the thigh and buttock muscles, and tensing the abdomen",
                    "Performing rapid, deep hyperventilation for 60 seconds",
                    "Bending backward at the waist and raising both arms overhead",
                    "Sitting down immediately and keeping the head completely flat",
                    "None of the options; physical maneuvers have no effect on blood pressure"
                ],
                "answer": 0,
                "exp": "Physical isometric counter-maneuvers (isometric tensing of the lower body: leg crossing, thigh muscle contraction, squatting) compress the peripheral vasculature, which increases venous return and cardiac output, transiently raising blood pressure and preventing syncope."
            },
            {
                "q": "What represents the primary pharmacological mechanism and clinical risk of using oral fludrocortisone for refractory orthostatic hypotension?",
                "options": [
                    "A synthetic mineralocorticoid that increases renal sodium reabsorption and expands intravascular volume; clinical risks include hypokalemia, fluid overload/heart failure exacerbation, and severe supine hypertension",
                    "A selective alpha-1 agonist that causes immediate vasoconstriction; clinical risks include severe bronchospasm",
                    "A direct vasodilator that reduces afterload; clinical risks include severe reflex tachycardia",
                    "A beta-blocker that slows the heart; clinical risks include acute AV block",
                    "Fludrocortisone has no risks and is a completely safe drug in all elderly heart failure patients"
                ],
                "answer": 0,
                "exp": "Fludrocortisone is a mineralocorticoid that promotes sodium retention and potassium excretion. While it expands volume (raising BP), it carries significant risks in the elderly: fluid retention (triggering heart failure), hypokalemia, and severe supine hypertension (dangerously high blood pressure when lying flat)."
            }
        ]
    },
    # 6. Beta-blocker considerations in elderly
    {
        "title": "Beta-Blockers: Dangers in the Elderly",
        "age_range": (65, 90),
        "scenario": (
            "A {age}-year-old {gender} with a history of hypertension and mild COPD is started on a high dose of metoprolol for 'heart protection.' 1 week later, the family brings the patient to the clinic due to profound fatigue, severe bradycardia (HR 44 bpm), and a new onset of wheezing. The patient has had two near-falls when standing."
        ),
        "questions": [
            {
                "q": "According to geriatric pharmacotherapy principles, what represents the best explanation for this patient's clinical deterioration?",
                "options": [
                    "Beta-blocker toxicity; metoprolol caused severe sinus bradycardia, blocked beta-2 receptors in the lungs (triggering bronchospasm/wheezing in COPD), and compromised postural reflexes; taper and reduce or stop metoprolol",
                    "Acute bacterial pneumonia; metoprolol is completely safe; prescribe high-dose oral amoxicillin and continue metoprolol",
                    "Normal age-related heart failure; double the dose of metoprolol immediately to stabilize cardiac output",
                    "A acute allergic reaction to beta-blocker drops; prescribe topical epinephrine drops and continue metoprolol",
                    "Primary autonomic failure; initiate daily fludrocortisone and continue metoprolol"
                ],
                "answer": 0,
                "exp": "Beta-blockers can cause significant side effects in the elderly: bradycardia, fatigue, and orthostasis. In patients with reactive airway disease (COPD/asthma), even cardioselective beta-blockers (like metoprolol) can lose selectivity at higher doses and block lung beta-2 receptors, triggering bronchospasm. Doses should be tapered and stopped/reduced."
            },
            {
                "q": "Why should beta-blockers generally be tapered gradually rather than discontinued abruptly in patients who have been taking them chronically?",
                "options": [
                    "Abrupt cessation can trigger a withdrawal syndrome characterized by severe rebound hypertension, tachycardia, myocardial ischemia, or arrhythmias due to receptor upregulation",
                    "Abrupt cessation causes immediate, irreversible acute liver necrosis",
                    "Beta-blockers will precipitate in the bloodstream if stopped suddenly, causing arterial occlusions",
                    "Abrupt withdrawal triggers severe, intractable visual loss and optic neuritis",
                    "There is no risk; beta-blockers can be stopped abruptly at any time without side effects"
                ],
                "answer": 0,
                "exp": "Chronic beta-blockade causes upregulation (increased density) of beta-1 receptors on the myocardium. Abrupt withdrawal leaves these receptors exposed to endogenous catecholamines, causing hyper-responsiveness: severe tachycardia, rebound hypertension, and potential MI in patients with CAD."
            },
            {
                "q": "Which of the following is a cardiotargeted, highly selective beta-1 blocker that is generally preferred over non-selective beta-blockers (e.g., propranolol) in older adults to minimize the risk of bronchospasm and peripheral vasoconstriction?",
                "options": [
                    "Metoprolol or Atenolol",
                    "Propranolol",
                    "Carvedilol",
                    "Nadolol",
                    "Timolol"
                ],
                "answer": 0,
                "exp": "Metoprolol, atenolol, bisoprolol, and nebivolol are selective beta-1 antagonists (cardioselective). At low-to-moderate doses, they spare the beta-2 receptors in the bronchioles and blood vessels, carrying a lower risk of bronchospasm than non-selective beta-blockers (propranolol)."
            }
        ]
    },
    # 7. Anticoagulation bleeding risk (HAS-BLED)
    {
        "title": "Atrial Fibrillation and HAS-BLED Bleeding Risk",
        "age_range": (65, 90),
        "scenario": (
            "A {age}-year-old {gender} with a history of atrial fibrillation, hypertension (BP 164/96 mmHg), and prior gastrointestinal bleed is being evaluated for oral anticoagulation. The patient is currently taking daily aspirin 81 mg and ibuprofen. The physician calculates the **HAS-BLED** score to stratify the patient's bleeding risk."
        ),
        "questions": [
            {
                "q": "What is the correct clinical interpretation of this patient's HAS-BLED score, and what represents the most appropriate management?",
                "options": [
                    "The HAS-BLED score is high (score >= 3 indicates high bleeding risk); address modifiable bleeding risk factors (control blood pressure, discontinue aspirin and NSAIDs, and counsel on alcohol), and prescribe a DOAC at the appropriate dose, rather than withholding anticoagulation",
                    "A high HAS-BLED score is an absolute contraindication to oral anticoagulation; withhold apixaban and prescribe daily clopidogrel",
                    "The HAS-BLED score is low; proceed with high-dose warfarin and continue the aspirin and ibuprofen",
                    "The HAS-BLED score is non-quantitative; initiate immediate surgical left atrial appendage occlusion as first-line",
                    "None of the options; HAS-BLED calculates the risk of ischemic stroke"
                ],
                "answer": 0,
                "exp": "The HAS-BLED score calculates bleeding risk. A score >= 3 indicates high risk. A high score is **not** an excuse to withhold anticoagulation (as stroke risk is still high). Instead, it directs the clinician to identify and resolve modifiable risk factors: control hypertension (< 130 SBP), stop concurrent antiplatelets (aspirin) and NSAIDs (ibuprofen), and limit alcohol. DOACs are preferred over warfarin."
            },
            {
                "q": "Which of the following clinical factors is included in the HAS-BLED bleeding risk stratification score?",
                "options": [
                    "Hypertension, abnormal renal/liver function, stroke history, bleeding history, labile INRs, elderly age (>= 65), and drugs/alcohol",
                    "Diabetes mellitus, congestive heart failure, and female sex",
                    "History of falls, osteoarthritis, and cognitive impairment",
                    "Glucocorticoid use, rheumatoid arthritis, and low bone density",
                    "Baseline GFR < 60 mL/min and high-dose statin use"
                ],
                "answer": 0,
                "exp": "HAS-BLED stands for: **H**ypertension (systolic > 160 mmHg), **A**bnormal renal or liver function (1 or 2 points), **S**troke history, **B**leeding history/predisposition, **L**abile INRs (on warfarin), **E**lderly (age >= 65), **D**rugs (antiplatelets/NSAIDs) or alcohol (1 or 2 points)."
            },
            {
                "q": "Which of the following direct oral anticoagulants (DOACs) is noted for having a lower risk of major gastrointestinal bleeding in head-to-head trials compared to standard-dose dabigatran or rivaroxaban, making it preferred in patients with a prior GI bleed?",
                "options": [
                    "Apixaban (5 mg twice daily)",
                    "Rivaroxaban (20 mg daily)",
                    "Dabigatran (150 mg twice daily)",
                    "High-dose warfarin",
                    "Edoxaban (60 mg daily)"
                ],
                "answer": 0,
                "exp": "In the ARISTOTLE trial, apixaban demonstrated superior safety compared to warfarin, showing a significantly lower risk of both intracranial and gastrointestinal bleeding. In contrast, higher-dose dabigatran (150 mg) and rivaroxaban (20 mg) have shown higher GI bleeding rates."
            }
        ]
    },
    # 8. Peripheral arterial disease
    {
        "title": "Claudication: Peripheral Arterial Disease",
        "age_range": (65, 85),
        "scenario": (
            "A {age}-year-old {gender} with a history of smoking and type 2 diabetes presents with a {duration}-month history of severe crampy leg pain in the bilateral calves that occurs exclusively when walking 2 blocks, and resolves completely with 5 minutes of rest. Ankle-Brachial Index (ABI) is measured, showing a value of **0.62** bilaterally."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what represents the most effective initial management?",
                "options": [
                    "Peripheral Arterial Disease (PAD) causing intermittent claudication; initiate a structured, supervised exercise program (walking to near-maximal pain), prescribe daily aspirin 81 mg and atorvastatin 40-80 mg, and discuss smoking cessation",
                    "Deep vein thrombosis; prescribe immediate low-molecular-weight heparin and recommend strict bed rest",
                    "Spinal stenosis (pseudoclaudication); refer for urgent lumbar epidural steroid injection",
                    "Normal age-related muscle cramping; continue smoking and prescribe daily oral magnesium supplements",
                    "Severe critical limb ischemia; perform emergent bilateral femoral artery bypass grafting"
                ],
                "answer": 0,
                "exp": "A leg pain brought on by walking and relieved by rest is classic **intermittent claudication** from PAD. ABI < 0.9 confirms PAD (0.62 is moderate). First-line therapy for claudication is a **structured, supervised exercise/walking program** to build collateral circulation. Medical therapy involves antiplatelet (aspirin) and high-intensity statin (atorvastatin) for secondary prevention of CV events."
            },
            {
                "q": "What represents the diagnostic threshold Ankle-Brachial Index (ABI) value that is diagnostic of peripheral arterial disease?",
                "options": [
                    "An ABI value less than or equal to 0.90",
                    "An ABI value between 1.00 and 1.40",
                    "An ABI value greater than 1.40",
                    "An ABI value of exactly 1.00",
                    "ABI is not measured as a ratio"
                ],
                "answer": 0,
                "exp": "An ABI <= 0.90 is diagnostic of PAD (with sensitivity > 95%). A normal ABI is 1.00 to 1.40. An ABI > 1.40 is abnormal and indicates non-compressible, calcified vessels (common in long-standing diabetes), requiring toe-brachial index (TBI) testing."
            },
            {
                "q": "Which of the following medications is specifically approved to improve walking distance in patients with moderate-to-severe intermittent claudication by causing selective vasodilation and inhibiting platelet aggregation?",
                "options": [
                    "Cilostazol (phosphodiesterase-3 inhibitor)",
                    "Clopidogrel (P2Y12 inhibitor) as monotherapy for pain",
                    "Metoprolol (beta-blocker)",
                    "Furosemide (loop diuretic)",
                    "Donepezil (cholinesterase inhibitor)"
                ],
                "answer": 0,
                "exp": "Cilostazol is a PDE-3 inhibitor that increases intracellular cAMP, causing vasodilation and anti-platelet activity. It is approved to improve walking distance in claudication. **Contraindication**: Cilostazol is strictly contraindicated in patients with **heart failure** of any severity due to class-effect risk of mortality."
            }
        ]
    },
    # 9. Syncope workup in elderly
    {
        "title": "Syncope: Workup in the Elderly",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} is admitted to the emergency department after experiencing a sudden loss of consciousness (syncope) while sitting in a chair. The patient reports having no warning symptoms (no lightheadedness, nausea, or sweating) prior to the blackout, and woke up on the floor with minor facial bruising. EKG shows a normal sinus rhythm with a left bundle branch block."
        ),
        "questions": [
            {
                "q": "What is the primary diagnostic category suggested by this patient's presentation, and what is the highest-priority workup?",
                "options": [
                    "Cardiac syncope (due to arrhythmia or structural disease); suggested by syncope without prodrome occurring while seated; perform continuous telemetry monitoring, echocardiogram to rule out structural AS/cardiomyopathy, and consider an implantable loop recorder",
                    "Vasovagal syncope; suggested by sudden blackout; recommend strict bed rest and avoid all visual monitoring",
                    "Orthostatic syncope; suggested by syncope while seated; prescribe high-dose oral midodrine immediately",
                    "Acute ischemic stroke; activate the stroke team for immediate tPA and schedule a brain MRI",
                    "Carotid sinus hypersensitivity; perform immediate bilateral carotid massage in the emergency department"
                ],
                "answer": 0,
                "exp": "Syncope occurring **without warning/prodrome** and **while seated or supine** is highly concerning for a **cardiac syncope** (ventricular arrhythmia, heart block, or structural obstruction). This is a high-risk diagnosis associated with sudden cardiac death. Workup involves: continuous telemetry monitoring, echocardiogram, and outpatient cardiology evaluation (loop recorders)."
            },
            {
                "q": "Which of the following syncopal presentations is highly characteristic of 'Vasovagal Syncope' (reflex syncope), helping to differentiate it from dangerous cardiac syncope?",
                "options": [
                    "Syncope preceded by a clear prodrome (nausea, warmth, sweating, lightheadedness, pallor) and triggered by prolonged standing, pain, or emotional distress",
                    "Syncope occurring suddenly while lying completely flat in bed, with no warning",
                    "Syncope immediately preceded by severe, crushing substernal chest pain and dyspnea",
                    "Syncope accompanied by a sudden, complete loss of all deep tendon reflexes",
                    "Syncope that is immediately resolved by administering high-dose oral donepezil"
                ],
                "answer": 0,
                "exp": "Vasovagal syncope is a benign reflex syncope. It is preceded by a warm prodrome (sweating, pallor, nausea, tunnel vision) and occurs in an upright position, triggered by orthostatic stress, fear, or pain, driven by a vagal surge causing bradycardia and vasodilation."
            },
            {
                "q": "What is the utility of an 'Implantable Loop Recorder' (ILR) in the diagnostic workup of unexplained, recurrent syncope in an older adult?",
                "options": [
                    "To provide long-term, continuous subcutaneous electrocardiogram (ECG) monitoring (up to 3 years) to capture transient, infrequent arrhythmias during spontaneous syncopal episodes",
                    "To actively deliver high-voltage defibrillation shocks during ventricular fibrillation",
                    "To monitor the patient's daily physical activity, steps, and caloric expenditure",
                    "To measure the GFR and serum drug concentrations in the home setting",
                    "To perform continuous intracranial electroencephalogram (EEG) monitoring"
                ],
                "answer": 0,
                "exp": "An ILR is a tiny, subcutaneous device placed under the skin of the chest. It monitors the EKG continuously for up to 3 years, automatically saving recordings during arrhythmias or when activated by the patient during a syncopal event, allowing diagnosis of rare, transient heart blocks or pauses."
            }
        ]
    },
    # 10. Statin therapy risk-benefit in elderly
    {
        "title": "Statin Therapy: Primary vs Secondary Prevention",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with a history of prior ischemic stroke and myocardial infarction presents for a routine visit. The patient's LDL cholesterol is 112 mg/dL. The patient is taking atorvastatin 80 mg daily. The patient complains of mild, generalized muscle aches (myalgias) and asks if the statin is truly necessary at {possessive} advanced age."
        ),
        "questions": [
            {
                "q": "What represents the correct clinical recommendation regarding the patient's statin therapy?",
                "options": [
                    "Maintain high-intensity statin therapy (secondary prevention); in patients with established cardiovascular disease, statins provide a powerful, proven reduction in recurrent stroke and MI regardless of age; evaluate the myalgia (check CK levels, try a lower dose or different statin like rosuvastatin/pravastatin)",
                    "Discontinue the statin immediately; primary prevention statins are contraindicated in patients over age 70 due to high risk of acute dementia",
                    "Continue atorvastatin 80 mg and prescribe daily high-dose oral prednisone to treat the myalgia",
                    "Discontinue the statin and initiate daily high-dose oral red yeast rice as a safer natural alternative",
                    "Double the dose of atorvastatin to ensure maximum plaque stabilization and ignore the muscle pain"
                ],
                "answer": 0,
                "exp": "A critical distinction exists: (1) **Secondary prevention**: In patients with established CAD/stroke, high-intensity statins have a clear, powerful mortality/stroke reduction benefit at all ages. Side effects (myalgias) should be managed (switching statins, lowering dose, checking creatine kinase) rather than stopping. (2) **Primary prevention**: In patients > 75 without CV disease, the benefit of starting a statin is controversial, and stopping is highly considered in frailty or limited prognosis."
            },
            {
                "q": "Which of the following represents the primary difference in clinical guidelines between starting a statin for 'Primary Prevention' vs 'Secondary Prevention' in adults aged 75 and older?",
                "options": [
                    "Primary prevention benefits are uncertain and starting is controversial in patients > 75 (often deprescribed in frailty), while secondary prevention has clear, powerful mortality benefits and should be maintained",
                    "Primary prevention is mandatory for all patients over 75, while secondary prevention is strictly contraindicated",
                    "Primary prevention statins have no side effects, while secondary prevention statins cause acute liver failure",
                    "Primary prevention requires daily intravenous infusions, while secondary prevention uses oral tablets",
                    "There is no difference; statins are equally indicated and mandatory for all patients of any age"
                ],
                "answer": 0,
                "exp": "For primary prevention (no prior MI/stroke), the time-to-benefit of statins (1-2 years) and lack of robust clinical trial data in the very elderly (>75) make starting controversial, and stopping is favored in frailty. For secondary prevention (prior MI/stroke), the risk of recurrence is high, and statins are strongly indicated at all ages."
            },
            {
                "q": "Which of the following laboratory tests is the most appropriate initial diagnostic step to evaluate a patient presenting with progressive, severe muscle pain (myalgia) while taking high-intensity statin therapy to rule out rhabdomyolysis?",
                "options": [
                    "Serum Creatine Kinase (CK) level",
                    "Serum alkaline phosphatase level",
                    "Total serum calcium and magnesium levels",
                    "Erythrocyte sedimentation rate (ESR) alone",
                    "Serum albumin and prealbumin levels"
                ],
                "answer": 0,
                "exp": "Statin-associated muscle symptoms range from mild myalgias to rare, severe rhabdomyolysis (skeletal muscle breakdown). Checking a serum Creatine Kinase (CK) level is essential: a CK > 10 times the upper limit of normal confirms severe myopathy/rhabdomyolysis, requiring immediate drug discontinuation."
            }
        ]
    }
]

templates_end_of_life = [
    # 1. Goals of care conversation (SPIKES)
    {
        "title": "SPIKES Protocol: Goals of Care Conversation",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with advanced stage IV heart failure is admitted for a severe cardiogenic shock. The clinical team realizes that further curative treatments are futile. The geriatrician plans to conduct a formal, multi-disciplinary goals of care conversation with the patient's family, using the **SPIKES** protocol to discuss transitioning to comfort care."
        ),
        "questions": [
            {
                "q": "Which of the following represents the six steps of the SPIKES protocol for delivering bad news and aligning goals of care?",
                "options": [
                    "Setting (setup), Perception, Invitation, Knowledge, Empathy (emotions), and Strategy/Summary",
                    "Screening, Pathophysiology, Intubation, Ketonemia, Electrolytes, and Sedation",
                    "Setup, Primary diagnosis, Intravenous fluids, Katz index, EASI score, and Social work",
                    "Symptom review, Prognosis, ICU transfer, Katz scale, Empathy, and Surgical options",
                    "None of the options; SPIKES is a surgical technique for vascular bypasses"
                ],
                "answer": 0,
                "exp": "The SPIKES protocol is a widely validated, structured clinical tool for delivering bad news and discussing end-of-life choices: (1) **S**etting up the interview (privacy, seating), (2) assessing the patient's **P**erception, (3) obtaining the patient's **I**nvitation to share info, (4) giving **K**nowledge and information (avoiding jargon), (5) addressing emotions with **E**mpathy, and (6) establishing a **S**tratey and **S**ummary."
            },
            {
                "q": "During a goals of care conversation, a family member becomes highly tearful, stating, 'I can't believe this is happening, I feel so helpless.' Which of the following responses by the clinician represents the 'Empathy' component of the SPIKES protocol?",
                "options": [
                    "Acknowledge and validate the emotion (e.g., 'I can see how much you love your mother, and how incredibly difficult and painful this is for you. We are here to support you')",
                    "Provide a technical explanation of the heart failure ejection fraction trends over the past week",
                    "Tell the family member to stop crying because they need to be strong for the patient",
                    "Advise the family that they must sign the POLST form immediately to avoid hospital costs",
                    "Leave the room immediately and call a security guard to manage the emotional reaction"
                ],
                "answer": 0,
                "exp": "Empathy in SPIKES involves identifying the emotion, identifying the reason, and responding with validation. Acknowledging the pain and offering support builds trust and helps the family process the bad news, facilitating alignment on comfort care."
            },
            {
                "q": "What is the primary difference in clinical goals between 'Curative Care' and 'Comfort-Only (Palliative/Hospice) Care' in a patient with terminal illness?",
                "options": [
                    "Curative care focuses on extending life and curing disease, while comfort-only care prioritizes symptom control, quality of life, and dignity",
                    "Curative care is performed only by MDs, while comfort care is performed only by family members",
                    "Comfort care is designed to actively accelerate death using high-dose chemical injections",
                    "Curative care has no side effects, while comfort care has a high rate of severe pain",
                    "There is no difference; both approaches utilize identical clinical treatments and goals"
                ],
                "answer": 0,
                "exp": "Curative care seeks to prolong survival by treating underlying pathology (chemotherapy, surgeries, dialysis). Comfort care (palliative/hospice) shifts the goal entirely to relieving suffering, maximizing quality of life, and providing emotional/spiritual support in the patient's remaining time, avoiding invasive, painful interventions."
            }
        ]
    },
    # 2. Hospice eligibility criteria
    {
        "title": "Hospice Eligibility: The Six-Month Rule",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with advanced, late-stage Alzheimer's disease resides in a long-term care facility. The patient is non-verbal, bed-bound, has double incontinence, and has suffered three aspiration pneumonias in the past 6 months. The family wishes to transition the patient to **Hospice Care**."
        ),
        "questions": [
            {
                "q": "What is the primary eligibility criterion for a patient to enroll in Medicare-certified hospice care, and what is the disease-specific threshold for advanced dementia?",
                "options": [
                    "A prognosis of 6 months or less if the terminal illness runs its normal course, certified by two physicians; for dementia, FAST Stage 7c or beyond (non-verbal, unable to walk, sit, or smile), combined with severe complications (e.g., recurrent aspiration pneumonias)",
                    "A prognosis of 12 months or less, and a MMSE score of exactly 12/30",
                    "A patient must be actively comatose and hospitalized in an intensive care unit for at least 30 days",
                    "Hospice is available only to patients who have a primary diagnosis of metastatic cancer",
                    "There are no criteria; any patient over age 65 can enroll in hospice at any time for convenience"
                ],
                "answer": 0,
                "exp": "Under the Medicare Hospice Benefit, a patient is eligible if two physicians certify that their life expectancy is **6 months or less** if the disease runs its natural course. For advanced dementia, the patient must meet FAST Stage 7 (non-verbal, unable to dress/bathe/walk independently) and have suffered a severe complicating illness (e.g., aspiration pneumonia, decubitus ulcers, weight loss > 10% in 6 months)."
            },
            {
                "q": "Which of the following clinical scales is used to formally stage the progressive functional decline of dementia, with Stage 7 representing the threshold for hospice eligibility?",
                "options": [
                    "Functional Assessment Staging Test (FAST)",
                    "Katz Index of ADLs",
                    "Mini-Mental State Examination (MMSE)",
                    "Montreal Cognitive Assessment (MoCA)",
                    "Braden Scale"
                ],
                "answer": 0,
                "exp": "The FAST (Functional Assessment Staging Test) scale divides progressive dementia into 7 stages based on functional loss. Stage 7 is characterized by severe loss: 7a (speech limited to <= 5 words), 7b (single-word speech), 7c (unable to walk), 7d (unable to sit upright), 7e (unable to smile), 7f (unable to hold head up)."
            },
            {
                "q": "Who covers the cost of certified hospice care for eligible older adults in the United States, including all medications, medical equipment (hospital beds, oxygen), and professional nursing visits related to the terminal diagnosis?",
                "options": [
                    "Medicare Part A (the Medicare Hospice Benefit)",
                    "Medicare Part B only, requiring a 20% co-pay for all services",
                    "Private commercial health insurance only; Medicare does not cover hospice care",
                    "The patient's family must pay out-of-pocket for all hospice services",
                    "The state government via a dedicated public lottery fund"
                ],
                "answer": 0,
                "exp": "The Medicare Hospice Benefit (covered under Medicare Part A) is exceptionally comprehensive. It covers 100% of all services, medications, supplies, and durable medical equipment (beds, wheelchairs, oxygen) related to the terminal illness, with zero co-pays or deductibles for the patient."
            }
        ]
    },
    # 3. Pain management with WHO analgesic ladder
    {
        "title": "Palliative Pain: The Analgesic Ladder",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with advanced metastatic prostate cancer is enrolled in hospice care. The patient has severe, constant, aching bone pain (rated 8/10) that is not relieved by acetaminophen. The clinical team wishes to optimize pain control, adhering to the **WHO Analgesic Ladder**."
        ),
        "questions": [
            {
                "q": "What represents the correct pharmacological recommendation for this patient's severe cancer pain?",
                "options": [
                    "Step 3 of the WHO ladder: initiate a strong opioid (e.g., oral morphine or oxycodone) dosed around-the-clock (scheduled) rather than PRN, with a rapid-acting breakthrough dose (10-15% of total daily dose) available PRN, and a prophylactic laxative",
                    "Prescribe high-dose daily oral ibuprofen 800 mg four times daily and avoid all opioids to prevent addiction",
                    "Initiate a continuous intravenous infusion of high-dose ketamine as first-line monotherapy",
                    "Prescribe a nightly long-acting benzodiazepine like diazepam as the primary analgesic",
                    "Opioids are strictly contraindicated in hospice patients due to the high risk of causing respiratory arrest"
                ],
                "answer": 0,
                "exp": "For severe cancer pain (Step 3: severe pain, 7-10/10), strong opioids are indicated. Pain should be managed with scheduled, around-the-clock dosing to prevent 'pain spikes,' with an immediate-release breakthrough dose (10-15% of the daily scheduled dose) for breakthrough pain. A bowel regimen must always be started prophylactically."
            },
            {
                "q": "Which of the following represents the three steps of the classic World Health Organization (WHO) Analgesic Ladder for cancer pain management?",
                "options": [
                    "Step 1: Non-opioids (acetaminophen, NSAIDs); Step 2: Weak opioids (codeine, tramadol); Step 3: Strong opioids (morphine, oxycodone, fentanyl)",
                    "Step 1: Oral drugs; Step 2: Intramuscular injections; Step 3: Continuous intravenous infusions",
                    "Step 1: Lifestyle changes; Step 2: Physical therapy; Step 3: Surgical debridement",
                    "Step 1: Donepezil; Step 2: Memantine; Step 3: Haloperidol",
                    "None of the options; the WHO ladder is a surgical protocol for wound healing"
                ],
                "answer": 0,
                "exp": "The WHO ladder provides a stepped framework: Step 1 (mild pain, 1-3/10) uses non-opioids. Step 2 (moderate pain, 4-6/10) adds mild/moderate opioids (tramadol). Step 3 (severe pain, 7-10/10) uses strong opioids (morphine, fentanyl). Adjuvants (corticosteroids, gabapentinoids) can be added at any step."
            },
            {
                "q": "When prescribing scheduled long-acting opioids for a dying patient, what percentage of the total daily baseline opioid dose should be prescribed as the immediate-release 'breakthrough' dose, to be taken as-needed (PRN)?",
                "options": [
                    "10% to 15% of the total daily scheduled baseline dose, to be taken every 2-4 hours as needed",
                    "Exactly 100% of the daily dose, to be taken once daily in the evening",
                    "50% of the daily dose, to be taken every 12 hours without exception",
                    "Breakthrough doses are not recommended; patients should rely entirely on long-acting scheduled drugs",
                    "The breakthrough dose is determined by the patient's heart rate"
                ],
                "answer": 0,
                "exp": "To manage breakthrough pain (transient flare-ups of severe pain), an immediate-release opioid dose representing 10% to 15% of the total daily scheduled dose should be available PRN. If a patient requires > 3-4 breakthrough doses daily, the baseline scheduled dose should be increased."
            }
        ]
    },
    # 4. Opioid management in dying patient (morphine for dyspnea)
    {
        "title": "Morphine for Dyspnea at the End of Life",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with end-stage congestive heart failure is in the active phase of dying in a residential hospice unit. The patient develops rapid, labored breathing (respiratory rate 28/min) with severe accessory muscle use and grimacing. The family is highly distressed, crying, 'He's suffocating!' The nurse prepares to administer a low dose of sublingual liquid morphine."
        ),
        "questions": [
            {
                "q": "What is the clinical rationale and mechanism of action for using low-dose morphine to treat dyspnea in a dying patient?",
                "options": [
                    "Morphine is the gold-standard treatment for dyspnea (air hunger) at the end of life; it reduces the central respiratory drive, decreases vascular preload (reducing pulmonary congestion), and relieves anxiety; it does not hasten death when titrated properly",
                    "Morphine is used strictly to accelerate the dying process and relieve the family's emotional burden",
                    "Morphine is a potent bronchodilator that acts on beta-2 receptors in the lungs to open airways",
                    "Morphine acts on the kidneys to cause a rapid, massive diuresis that clears pulmonary edema",
                    "The morphine will cause immediate respiratory arrest; it is strictly contraindicated in dying patients"
                ],
                "answer": 0,
                "exp": "Low-dose opioids are the first-line, evidence-based treatment for severe dyspnea ('air hunger') at the end of life. Morphine acts centrally in the medulla to blunt the perception of breathlessness, reduces pulmonary vascular congestion (vasodilation/preload reduction), and relieves dyspnea-associated anxiety. Evidence shows it does **not** hasten death when titrated carefully for symptoms."
            },
            {
                "q": "What is the primary ethical principle (specifically the 'Doctrine of Double Effect') that justifies the clinical use of high-dose opioids or sedatives to treat refractory pain or dyspnea in a dying patient, even if it carries a foreseeable, unintended risk of shortening the patient's life?",
                "options": [
                    "The Doctrine of Double Effect: an action with a foreseen harmful effect (shortening life) is permissible if the primary intention is exclusively beneficial (relieving suffering), the act is not inherently bad, and the good effect is not achieved by means of the bad effect",
                    "The principle of paternalism, which allows a physician to override all family preferences to ensure clinical efficiency",
                    "The legal right of the state to enforce euthanasia in terminally ill patients",
                    "The principle of utility, which states that saving hospital resources is the primary goal of end-of-life care",
                    "There is no ethical principle; the doctor is legally liable for homicide if the patient dies shortly after an opioid dose"
                ],
                "answer": 0,
                "exp": "The Doctrine of Double Effect is a key bioethical tenet in palliative care. It justifies using high-dose analgesics for severe pain/dyspnea: the intent is to relieve suffering (good effect), and the potential shortening of life (bad effect) is an unintended, though foreseen, side effect. The good effect (comfort) is the direct result of the drug's analgesic property, not the patient's death."
            },
            {
                "q": "Which of the following non-pharmacological interventions is highly effective and recommended as an adjunct to low-dose morphine to relieve the sensation of dyspnea (air hunger) in a dying patient?",
                "options": [
                    "Placing a portable fan to blow a gentle, cool stream of air directly across the patient's face",
                    "Keeping the patient's head completely flat and holding a dry cloth over their mouth",
                    "Initiating high-frequency chest wall oscillation therapy (vibrating vest)",
                    "Administering a high-volume normal saline bolus through a peripheral IV",
                    "Placing a tightly fitting non-rebreather oxygen mask set at 15 liters per minute"
                ],
                "answer": 0,
                "exp": "A simple cool draft of air from a fan stimulates the trigeminal nerve (V2/V3 branches) on the face, which reflexively dampens the central perception of breathlessness in the brainstem, providing rapid, non-pharmacological relief for dyspnea."
            }
        ]
    },
    # 5. Terminal delirium management
    {
        "title": "Terminal Delirium and the Death Rattle",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with advanced dementia is in the final 48 hours of life. The patient developed severe terminal agitation, constantly plucking at the air, moaning, and thrashing in bed. The patient also has noisy, rattling respirations (the 'death rattle') due to accumulated secretions. The family is highly distressed."
        ),
        "questions": [
            {
                "q": "What is the most appropriate management for this patient's terminal agitation and noisy respirations?",
                "options": [
                    "For terminal agitation: administer low-dose haloperidol or chlorpromazine; for the 'death rattle': administer a subcutaneous anticholinergic (e.g., glycopyrrolate or atropine) to dry secretions, position the patient on their side, and educate the family that the noise does not cause distress to the patient",
                    "Perform aggressive, deep endotracheal suctioning every 15 minutes and initiate high-dose intravenous alprazolam",
                    "Administer high-dose epinephrine to stimulate breathing and place the patient in a prone position",
                    "Double the dose of donepezil and prescribe high-dose oral prednisone",
                    "The symptoms require no management; tell the family to leave the room to avoid witnessing the death"
                ],
                "answer": 0,
                "exp": "Terminal agitation is common during active dying. Haloperidol is a standard treatment for terminal delirium. The 'death rattle' is caused by air vibrating through secretions in the relaxed hypopharynx of an unconscious patient. It is treated with anticholinergics (glycopyrrolate is preferred over atropine/scopolamine as it does not cross the BBB, avoiding central delirium) and repositioning (side-lying). Family education is vital to reassure them that the patient is not drowning or suffering."
            },
            {
                "q": "Why is glycopyrrolate generally preferred over scopolamine or atropine for the treatment of terminal secretions ('death rattle') in a dying patient who has a history of pre-existing delirium?",
                "options": [
                    "Glycopyrrolate is a quaternary ammonium compound that does not cross the blood-brain barrier, thereby avoiding the exacerbation of central anticholinergic delirium",
                    "Glycopyrrolate has a rapid, direct vasodilatory effect on the pulmonary capillaries",
                    "Glycopyrrolate is the only anticholinergic that can be administered orally in a comatose patient",
                    "Atropine is highly toxic to the myocardium, causing immediate ventricular fibrillation",
                    "There is no clinical preference; all three drugs have identical pharmacological profiles"
                ],
                "answer": 0,
                "exp": "Glycopyrrolate has a polar structure that prevents it from crossing the blood-brain barrier. It dries salivary and bronchial secretions peripherally without causing the central anticholinergic effects (hallucinations, worsening agitation) associated with atropine or scopolamine."
            },
            {
                "q": "Why is deep endotracheal suctioning generally discouraged and avoided for the management of the 'death rattle' in dying patients?",
                "options": [
                    "It is highly invasive, painful, causes severe gagging, coughing, and mucosal trauma, and does not effectively clear the deep secretions",
                    "It causes a rapid, massive release of thyroid hormone, triggering a thyroid storm",
                    "It is illegal to perform suctioning on patients who have a Do Not Resuscitate (DNR) order",
                    "It causes immediate permanent paralysis of the vocal cords",
                    "The suctioning equipment is highly radioactive and dangerous to the staff"
                ],
                "answer": 0,
                "exp": "Aggressive suctioning is highly distressing and uncomfortable for a dying patient. It causes severe choking, gagging, and trauma to the pharyngeal mucosa, and can cause a reactive increase in secretion production. Side-positioning and anticholinergics are safer, non-invasive alternatives."
            }
        ]
    },
    # 6. Advance directives (Living Will and DPOAH)
    {
        "title": "Living Will and Durable Power of Attorney",
        "age_range": (65, 85),
        "scenario": (
            "A {age}-year-old {gender} with early-stage cognitive decline is evaluated. The physician initiates a formal discussion regarding **Advance Directives**. The patient wishes to understand the difference between a **Living Will** and a **Durable Power of Attorney for Healthcare (DPOAH)**."
        ),
        "questions": [
            {
                "q": "What is the key functional difference between a Living Will and a Durable Power of Attorney for Healthcare (DPOAH)?",
                "options": [
                    "A Living Will documents the patient's specific preferences for future end-of-life treatments, while a DPOAH designates a surrogate decision-maker to make medical choices if the patient loses capacity",
                    "A Living Will is a financial contract transferring assets, while a DPOAH is a medical order signed by a doctor",
                    "A Living Will is legally binding only in a hospital, while a DPOAH is binding only in a nursing home",
                    "A DPOAH is legally executed only after the patient dies, while a Living Will is active only during surgery",
                    "There is no difference; the two terms represent the exact same legal document"
                ],
                "answer": 0,
                "exp": "A Living Will is an instruction directive (stating preferences: e.g., 'no feeding tubes if I am in a persistent vegetative state'). A DPOAH is a proxy directive, appointing a person (surrogate) to make decisions. Most geriatricians prefer appointing a surrogate (DPOAH) because it allows flexible, real-time decisions as complex clinical scenarios evolve, which a static paper document cannot predict."
            },
            {
                "q": "When does a patient's Durable Power of Attorney for Healthcare (DPOAH) legally 'activate' or take effect to allow the surrogate to make medical decisions?",
                "options": [
                    "Only when a physician formally determines that the patient has lost decision-making capacity for the specific medical choice at hand",
                    "Immediately upon the document being signed and notarized, regardless of the patient's capacity",
                    "Only when a court judge signs an order declaring the patient legally incompetent",
                    "Immediately upon the patient being admitted to any hospital or skilled nursing facility",
                    "Only after the patient has progressed to FAST Stage 7 of dementia"
                ],
                "answer": 0,
                "exp": "A DPOAH does not strip the patient of their rights. As long as the patient retains decision-making capacity, they make their own choices. The surrogate's authority activates only when the attending physician determines the patient lacks capacity for a decision."
            },
            {
                "q": "Which of the following represents the legal standard of 'Best Interests' used by a surrogate decision-maker when the patient's own values and preferences are completely unknown?",
                "options": [
                    "Choosing the treatment option that a reasonable person would choose in the patient's situation, balancing the benefits and burdens to maximize the patient's welfare",
                    "Choosing the least expensive treatment option to preserve the family's inheritance",
                    "Decline all medical treatments to allow the patient to die as quickly as possible",
                    "Always choosing the most aggressive, experimental treatments available in the hope of a miracle",
                    "Following the attending physician's personal religious beliefs regarding end-of-life care"
                ],
                "answer": 0,
                "exp": "The best interests standard is used as a fallback when the patient's prior wishes are unknown (no living will, no prior discussions). The surrogate must weigh the benefits against the burdens of a treatment, choosing the option that promotes the patient's overall well-being."
            }
        ]
    },
    # 7. POLST/MOLST form
    {
        "title": "POLST Form: Actionable Medical Orders",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with advanced stage IV heart failure and a life expectancy estimated at less than 1 year is being discharged home from the hospital. The patient wishes to avoid all cardiopulmonary resuscitation (CPR) and mechanical ventilation, preferring to die peacefully at home if a cardiac arrest occurs. The physician completes a **POLST (Physician Orders for Life-Sustaining Treatment)** form."
        ),
        "questions": [
            {
                "q": "What represents the key clinical utility and legally binding nature of a POLST form, and how does it differ from a standard Living Will?",
                "options": [
                    "A POLST form translates the patient's preferences into actionable, legally binding medical orders signed by a clinician, which must be followed by emergency medical services (EMS) in all settings; a Living Will is an expression of wishes that EMS cannot legally follow",
                    "A POLST form is a financial contract that covers the cost of the patient's hospice care under Medicare",
                    "A POLST form is completed only by a court judge and requires a full legal trial to activate",
                    "A POLST form is active only within the hospital walls and is ignored by EMS in the home setting",
                    "None of the options; POLST is a surgical consent form for vascular bypasses"
                ],
                "answer": 0,
                "exp": "A POLST (or MOLST) form is a medical order. Unlike a Living Will (which is a legal document expressing general wishes for future care, which EMS cannot interpret or legally follow in an emergency), a POLST contains signed, actionable medical orders (e.g., Do Not Resuscitate, Comfort-Focused Care) that EMS must follow at home or in transit."
            },
            {
                "q": "Which of the following represents the three core sections evaluated and documented in a standard POLST (Physician Orders for Life-Sustaining Treatment) form?",
                "options": [
                    "Section A: Cardiopulmonary Resuscitation (CPR/DNR); Section B: Medical Interventions (Full, Selective, or Comfort-focused); Section C: Artificially Administered Nutrition (Feeding tubes)",
                    "Section A: Cognitive scores; Section B: Katz index ADLs; Section C: Braden scale scores",
                    "Section A: Primary diagnosis; Section B: Surgical history; Section C: Financial assets",
                    "Section A: Donepezil dose; Section B: Memantine dose; Section C: Morphine dose",
                    "None of the options; POLST forms contain only the patient's signature"
                ],
                "answer": 0,
                "exp": "A standard POLST form has three key sections: Section A dictates CPR status (Attempt Resuscitation vs Do Not Resuscitate). Section B dictates medical interventions if the patient has a pulse (Full treatment, Selective treatment, or Comfort-focused treatment). Section C dictates preferences for feeding tubes."
            },
            {
                "q": "If a patient has a signed, valid POLST form indicating a Do Not Resuscitate (DNR) status, and emergency medical services (EMS) are called to their home when the patient stops breathing, what is the legally required action of the EMS team?",
                "options": [
                    "EMS must honor the DNR order: confirm the patient's identity and validity of the form, withhold chest compressions and intubation, but provide comfort measures (oxygen, positioning, pain relief)",
                    "EMS must ignore the DNR and perform full cardiopulmonary resuscitation (CPR) because they are legally required to attempt to save every life",
                    "EMS must immediately transport the patient to the hospital without providing any treatment or comfort measures",
                    "EMS must contact the patient's primary care physician for a verbal confirmation before taking any action",
                    "EMS must perform a bedside ventriculoperitoneal shunt placement immediately"
                ],
                "answer": 0,
                "exp": "EMS must honor a valid out-of-hospital DNR or POLST form. They must withhold chest compressions, defibrillation, and intubation. However, they are legally required to provide comfort care: clearing the airway, administering oxygen, managing pain, and supporting the patient and family."
            }
        ]
    },
    # 8. Palliative sedation ethics
    {
        "title": "Palliative Sedation: The Refractory Symptoms",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with terminal, metastatic colon cancer is in the active phase of dying. The patient has developed severe, constant, refractory delirium and agitation, thrashing in bed and screaming, despite maximal doses of haloperidol, chlorpromazine, and morphine. The palliative care team discusses **palliative sedation** with the family."
        ),
        "questions": [
            {
                "q": "What is the clinical definition and ethical justification for palliative sedation (continuous deep sedation) in this terminal patient?",
                "options": [
                    "Palliative sedation is the monitored use of sedative medications (e.g., midazolam or propofol) to reduce a patient's level of consciousness to the degree necessary to relieve one or more refractory, intolerable symptoms; it is ethically justified under the Doctrine of Double Effect, as the intent is to relieve suffering, not to hasten death",
                    "Palliative sedation is a form of active voluntary euthanasia designed to legally terminate the patient's life using high-dose chemical injections",
                    "Palliative sedation is a standard treatment for mild insomnia and requires no specialized clinical monitoring",
                    "Palliative sedation is performed strictly to reduce the workload of the hospice nursing staff",
                    "Palliative sedation is ethically and legally prohibited under all circumstances in the United States"
                ],
                "answer": 0,
                "exp": "Palliative sedation (continuous deep sedation) is reserved for severe, refractory symptoms (symptoms that cannot be controlled despite all other therapies). Midazolam or propofol are titrated to lower consciousness and relieve distress. It is ethically distinct from euthanasia: the intent is entirely symptom control, the dose is titrated to comfort (not a lethal dose), and studies show it does not shorten survival."
            },
            {
                "q": "Which of the following medications is most commonly used as the first-line agent for initiating and titrating palliative sedation in the hospice setting?",
                "options": [
                    "Midazolam (short-acting benzodiazepine)",
                    "Haloperidol (antipsychotic) as monotherapy",
                    "Donepezil (cholinesterase inhibitor)",
                    "Furosemide (loop diuretic)",
                    "Prednisone (systemic corticosteroid)"
                ],
                "answer": 0,
                "exp": "Midazolam is the drug of choice for palliative sedation. It is a short-acting benzodiazepine that can be continuously infused intravenously or subcutaneously, allowing rapid, precise titration to the desired level of sedation and comfort."
            },
            {
                "q": "What is a key clinical requirement before a palliative care team can ethically proceed with continuous deep palliative sedation?",
                "options": [
                    "Confirm that the patient has a terminal illness in the active phase of dying, the symptoms are truly refractory to all standard therapies, and obtain informed consent from the patient or their legal surrogate",
                    "Verify that the patient has no outstanding financial debts to the hospital",
                    "Obtain a court order signed by a judge declaring the patient legally incompetent",
                    "Ensure that all of the patient's family members are in complete, unanimous agreement regarding the decision",
                    "There are no requirements; the attending physician can decide to sedate any patient at their own discretion"
                ],
                "answer": 0,
                "exp": "Continuous deep sedation is a major intervention. It requires: (1) a terminal diagnosis with active dying (life expectancy days to weeks), (2) truly refractory symptoms (all other therapies failed), and (3) formal informed consent from the patient (if they have capacity) or their DPOAH."
            }
        ]
    },
    # 9. Bereavement support
    {
        "title": "Bereavement: Normal vs Complicated Grief",
        "age_range": (65, 85),
        "scenario": (
            "A {age}-year-old {gender} presents for a clinic visit 9 months after the death of {possessive} spouse from a terminal illness. The patient reports feeling a profound, constant yearning and preoccupation with the deceased spouse, intense anger regarding the death, and feeling that life has 'completely ended.' The patient has isolated {self_pronoun} from all family and friends."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what represents the most appropriate management?",
                "options": [
                    "Prolonged Grief Disorder (Complicated Grief); refer the patient for specialized Prolonged Grief Disorder Therapy (PGDT) or Cognitive Behavioral Therapy, and screen for concurrent Major Depressive Disorder",
                    "Normal, expected bereavement; reassure the patient that no interventions are needed and check back in 2 years",
                    "Late-onset schizophrenia; initiate daily atypical antipsychotics like risperidone",
                    "Mild cognitive impairment; initiate donepezil 5 mg daily",
                    "Disruptive mood dysregulation disorder; prescribe a 6-week course of daily oral prednisone"
                ],
                "answer": 0,
                "exp": "Normal grief slowly evolves: the acute pain transitions to an integrated, manageable sadness over 6-12 months. Prolonged Grief Disorder (complicated grief) is diagnosed when intense yearning, anger, preoccupation with the deceased, and functional impairment persist beyond **1 year** (or 6 months for DSM-5-TR research/clinical criteria in some contexts, though 12 months is standard for formal diagnosis in the US). It requires specialized psychotherapy (PGDT) rather than simple antidepressants alone."
            },
            {
                "q": "Which of the following clinical features is highly characteristic of Prolonged Grief Disorder (complicated grief), distinguishing it from a standard Major Depressive Episode?",
                "options": [
                    "Intense, persistent yearning for the deceased, preoccupation with the circumstances of the death, and difficulty accepting that the person is gone",
                    "Generalized, constant feelings of worthlessness, guilt that is not related to the deceased, and global psychomotor retardation",
                    "A complete absence of any sadness or emotional expression regarding the loss",
                    "Detailed visual and auditory hallucinations of small animals or children in the room",
                    "Severe cognitive decline with a MoCA score < 15/30"
                ],
                "answer": 0,
                "exp": "While depression and prolonged grief overlap, Prolonged Grief is characterized by 'separation distress': the sadness, yearning, and pain are specifically focused on the deceased person. Depression presents with global 'failure of self-esteem' (worthlessness, generalized guilt, flat affect)."
            },
            {
                "q": "Which of the following psychotherapeutic modalities is considered the first-line, gold-standard evidence-based treatment for patients diagnosed with Prolonged Grief Disorder?",
                "options": [
                    "Prolonged Grief Disorder Therapy (PGDT) (a targeted 16-session manualized therapy focusing on accepting the loss and restoring life goals)",
                    "High-dose tricyclic antidepressant therapy (amitriptyline) combined with daily bed rest",
                    "Electroconvulsive Therapy (ECT) twice weekly for 6 weeks",
                    "Systemic desensitization using audio recordings of the deceased's voice",
                    "Psychoanalysis for early childhood separation anxiety"
                ],
                "answer": 0,
                "exp": "PGDT is a highly structured, manualized therapy developed by Dr. M. Katherine Shear. It incorporates elements of CBT and interpersonal therapy, focusing on two tracks: (1) processing the story of the death to facilitate acceptance, and (2) restoring meaningful life goals to re-engage with the world."
            }
        ]
    },
    # 10. POLST vs DNR
    {
        "title": "POLST vs DNR: Clarifying the Medical Orders",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with advanced stage IV heart failure is being discharged from the hospital. The family is confused by the terminology. The physician explains the key differences between a standard **Out-of-Hospital DNR (Do Not Resuscitate)** order and a comprehensive **POLST (Physician Orders for Life-Sustaining Treatment)** form."
        ),
        "questions": [
            {
                "q": "What is the primary difference in clinical scope between a standard DNR order and a POLST form?",
                "options": [
                    "A DNR order dictates actions only if the patient has NO pulse and is NOT breathing (withhold CPR), while a POLST form covers both cardiac arrest (CPR status) AND medical interventions if the patient HAS a pulse and IS breathing (Full, Selective, or Comfort-focused treatments)",
                    "A DNR order is a legal contract signed by a judge, while a POLST is a medical order signed by a nurse",
                    "A POLST form is legally binding only inside the ICU, while a DNR is binding only in the patient's home",
                    "A DNR order covers only the use of feeding tubes, while a POLST covers only mechanical ventilation",
                    "There is no difference; the two documents are legally and clinically identical"
                ],
                "answer": 0,
                "exp": "A DNR is narrow: it says 'do not attempt CPR' if the patient is in cardiac/respiratory arrest (no pulse, no breathing). If the patient is alive (has a pulse) but in distress, a DNR does not guide care. A POLST is comprehensive: Section A is CPR status, and Section B dictates the level of medical care when the patient is **alive** but critically ill (e.g., 'Do not intubate but provide IV fluids and antibiotics,' or 'Comfort care only')."
            },
            {
                "q": "In Section B of a standard POLST form, a patient designates a preference for 'Comfort-Focused Treatment' (comfort measures only). If this patient develops a severe, acute bacterial pneumonia at home, what is the appropriate action of the medical team?",
                "options": [
                    "Provide comfort measures (positioning, suctioning, pain/dyspnea relief with morphine), and treat with oral antibiotics only if it directly promotes comfort, while avoiding hospital transfer unless comfort cannot be maintained at home",
                    "Immediately intubate the patient at home and transfer them to the nearest intensive care unit for full mechanical ventilation",
                    "Initiate high-dose intravenous chemotherapy and schedule immediate exploratory thoracic surgery",
                    "Withhold all treatments, including pain medications, to allow the pneumonia to run its natural course",
                    "Perform a bedside ventriculoperitoneal shunt placement immediately to lower intracranial pressure"
                ],
                "answer": 0,
                "exp": "Comfort-focused care means the primary goal is relieving pain and distress. Hospital transfer is avoided. Pneumonia is managed with oxygen, morphine for dyspnea, and oral antibiotics only if they reduce symptoms. Invasive treatments (intubation, ICU) are avoided."
            },
            {
                "q": "Who must sign a POLST (Physician Orders for Life-Sustaining Treatment) form to make it a legally active, binding medical order that must be followed by emergency medical services (EMS)?",
                "options": [
                    "A licensed physician (or nurse practitioner/physician assistant depending on state law) AND the patient (or their legal surrogate decision-maker)",
                    "The patient's primary care nurse and a hospital social worker only",
                    "A state court judge and a notary public, without requiring the clinician's signature",
                    "The patient's next-of-kin surrogate and a hospital chaplain only",
                    "Only the patient's signature is required to make the form active"
                ],
                "answer": 0,
                "exp": "A POLST is a medical order, so it must be signed by a licensed clinician (MD/DO/NP/PA). Because it represents a shared decision-making process, it also requires the signature of the patient or their DPOAH surrogate to confirm agreement, making it legally binding for EMS."
            }
        ]
    }
]

templates_abuse = [
    # 1. Physical abuse
    {
        "title": "Unexplained Bruises: Physical Elder Abuse",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with moderate vascular dementia is brought to the clinic by {possessive} caregiver (a family member) for a routine skin check. During the physical exam, the physician identifies multiple large, dark purple contusions (bruises) in various stages of healing localized to the patient's upper arms, back, and inner thighs. The caregiver states the bruises are from 'bumping into a kitchen table.'"
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what represents the physician's highest-priority legal and clinical obligation?",
                "options": [
                    "Suspected physical elder abuse; document the injuries in detail (including anatomical diagrams/photographs), interview the patient alone, and file an immediate report with Adult Protective Services (APS) as a mandated reporter",
                    "Normal age-related capillary fragility (senile purpura) alone; reassure the family and continue current care",
                    "A cute immune thrombocytopenic purpura (ITP); immediately administer high-dose systemic corticosteroids",
                    "Idiopathic vascular stroke; perform an emergent pelvic CT scan and initiate dual antiplatelet therapy",
                    "The caregiver's history is highly consistent; no further investigations or reports are needed"
                ],
                "answer": 0,
                "exp": "Multiple bruises in various stages of healing, located in non-accidental areas (inner thighs, upper arms, back) in a dependent elder with dementia is highly suggestive of physical abuse. The caregiver's explanation (bumping into a table) is clinically inconsistent. Physicians are **mandated reporters**; they must report any suspicion of elder abuse to Adult Protective Services (APS) immediately, document thoroughly, and interview the patient separately."
            },
            {
                "q": "Which of the following injury patterns or anatomical locations is highly suggestive of physical elder abuse rather than normal accidental falls or senile purpura?",
                "options": [
                    "Bruises in various stages of healing located on the upper arms (suggesting grabbing), chest, abdomen, neck, inner thighs, or ears",
                    "Small, isolated purple macules on the dorsum of the hands and forearms only (senile purpura)",
                    "A single minor abrasion over the anterior tibia sustained during gardening",
                    "Bilateral symmetric osteoarthritis changes in the knee joints with crepitus",
                    "A minor laceration on the chin sustained during a syncopal fall"
                ],
                "answer": 0,
                "exp": "Accidental falls usually cause bruises over bony prominences (knees, shins, elbows, forehead). Bruising in 'sheltered' or fleshy areas (inner thighs, upper arms—indicating defensive blocking or grabbing, trunk, neck, ears) is highly suspicious for physical abuse."
            },
            {
                "q": "Does the physician's mandatory reporting obligation to Adult Protective Services (APS) require absolute proof of elder abuse prior to filing a report?",
                "options": [
                    "No; physicians are legally required to report any **reasonable suspicion** or concern of elder abuse, and are granted civil and criminal immunity for reports filed in good faith",
                    "Yes; the physician must conduct a full private investigation and obtain absolute proof (such as a confession or video) before reporting",
                    "No; reporting requires the prior written consent of the suspected abuser",
                    "Yes; reporting without absolute proof is a felony violation of HIPAA confidentiality guidelines",
                    "Reporting is voluntary and is discouraged to preserve family privacy"
                ],
                "answer": 0,
                "exp": "Mandated reporters are legally required to file a report with APS if they have a 'reasonable suspicion' or belief that an elder is being abused, neglected, or exploited. They do not need to prove it (investigation is APS's job) and are legally protected from liability for good-faith reports."
            }
        ]
    },
    # 2. Financial exploitation
    {
        "title": "The Sudden Will Changes: Financial Exploitation",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with mild Alzheimer's disease is brought to the clinic by {possessive} daughter. The daughter reports that the patient has recently befriended a new neighbor who has taken complete control of the patient's checkbook. The patient recently made several large ATM withdrawals of $5,000, and has signed a document designating the neighbor as {possessive} sole financial power of attorney."
        ),
        "questions": [
            {
                "q": "What represents the most likely diagnosis, and what is the best clinical and legal management?",
                "options": [
                    "Financial exploitation (elder financial abuse); assess the patient's cognitive capacity, document the concerns, file an immediate report with Adult Protective Services (APS), and advise the family to consult an elder law attorney",
                    "A normal, altruistic gift to a friend; reassure the daughter that the patient has the right to spend {possessive} money as {pronoun} pleases",
                    "Donepezil-induced manic episode; discontinue donepezil and prescribe high-dose daily lithium carbonate",
                    "Acute vascular stroke; perform an emergent head CT and initiate immediate thrombolysis (tPA)",
                    "There are no concerns; financial matters are private and outside the physician's scope of practice"
                ],
                "answer": 0,
                "exp": "Financial exploitation is a common form of elder abuse. Vulnerable elders with cognitive decline are target for manipulation. Clues include: new 'friends' controlling money, sudden changes in wills/DPOAs, large withdrawals, and unpaid bills. Mandated reporting to APS is required, along with a cognitive capacity assessment."
            },
            {
                "q": "Which of the following cognitive screening scores represents a patient who is at highly elevated risk for financial exploitation due to impaired financial decision-making capacity?",
                "options": [
                    "A Montreal Cognitive Assessment (MoCA) score less than 26/30 (especially scores < 20 indicating dementia)",
                    "A Mini-Mental State Examination (MMSE) score of exactly 30/30",
                    "A Braden Scale score of 23/23",
                    "A Katz Index of ADLs score of 6/6 (completely independent)",
                    "A normal Hamilton Depression Rating Scale score"
                ],
                "answer": 0,
                "exp": "Financial capacity (the ability to manage money, understand bills, and make complex financial decisions) is one of the earliest and most complex IADLs to decline in cognitive disorders (MCI and early dementia). A low MoCA score indicates a high vulnerability to exploitation."
            },
            {
                "q": "Which of the following legal concepts protects a vulnerable elder by appointing a court-approved individual to manage their financial affairs when they are found to globally lack the capacity to do so?",
                "options": [
                    "Conservatorship or Guardianship of the Estate",
                    "Healthcare Proxy",
                    "Living Will",
                    "POLST Form",
                    "HIPAA Authorization"
                ],
                "answer": 0,
                "exp": "A conservatorship (or guardianship of the estate) is a legal relationship created by a court, appointing a conservator to manage the financial affairs of an incapacitated individual (the conservatee) when no prior, valid financial DPOA exists."
            }
        ]
    },
    # 3. Neglect
    {
        "title": "The Bed-bound Elder with Poor Hygiene: Neglect",
        "age_range": (70, 95),
        "scenario": (
            "A {age}-year-old {gender} with severe dementia is brought to the emergency department. The patient is bed-bound and relies entirely on {possessive} adult son for care. The patient is found to be severely dehydrated, wearing a heavily soiled diaper that has not been changed in days, and has a Stage IV pressure injury over the sacrum that is covered in feces and slough."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what represents the physician's immediate clinical and legal obligations?",
                "options": [
                    "Active caregiver neglect; admit the patient for medical stabilization (rehydration, wound care, infection management), document the physical findings thoroughly, and file an immediate report with Adult Protective Services (APS)",
                    "Normal progression of end-stage dementia; prescribe comfort-focused hospice care and discharge the patient back home with the son",
                    "Donepezil-induced diarrhea and secondary uremia; discontinue donepezil and double the son's caregiver allowance",
                    "A cute ischemic stroke; perform an emergent head CT and activate the stroke team for tPA",
                    "There are no concerns; dry skin and diaper rash are normal in all bed-bound older adults"
                ],
                "answer": 0,
                "exp": "This is a classic case of caregiver neglect (the failure to provide essential care: food, water, hygiene, medical care, wound care). Physical signs include: severe dehydration, soiled diapers, untreated stage III/IV pressure ulcers, and poor hygiene. Immediate medical admission is required for stabilization, along with mandatory reporting to APS."
            },
            {
                "q": "Which of the following physical findings, if identified during an physical assessment of a dependent older adult, is a major warning sign ('red flag') for caregiver neglect?",
                "options": [
                    "Severe dehydration, malnutrition (unexplained weight loss), poor hygiene, soiled clothing/diapers, and untreated medical conditions (such as advanced pressure ulcers)",
                    "Mild age-related dry skin and thin hair on the extremities",
                    "Bilateral symmetric knee crepitus and mild joint deformities from osteoarthritis",
                    "A normal, healing surgical incision from a recent total hip replacement",
                    "A calculated body mass index (BMI) of 24 kg/m2 (normal)"
                ],
                "answer": 0,
                "exp": "Warning signs for neglect include: chronic dehydration/malnutrition without a medical cause, poor hygiene, smelling of urine/feces, inappropriate clothing for the weather, lack of assistive devices (dentures, glasses), and untreated ulcers or infections."
            },
            {
                "q": "What is the primary role of Adult Protective Services (APS) once a report of suspected elder neglect is filed by a mandated reporter?",
                "options": [
                    "To investigate the report, evaluate the elder's safety and capacity, coordinate protective services, and connect the family with resources to resolve the neglect (or take emergency custody if danger is imminent)",
                    "To immediately arrest the caregiver and prosecute them in a federal criminal court",
                    "To audit the hospital's financial records to verify correct billing for the admission",
                    "To perform a surgical ventriculoperitoneal shunt placement on the patient",
                    "To immediately revoke the patient's Medicare and Medicaid health insurance coverage"
                ],
                "answer": 0,
                "exp": "APS is a state agency. Their goal is not primarily punitive; they investigate the situation, evaluate the elder's safety and cognitive capacity, and coordinate protective services: home health aides, respite care, meal deliveries, or if the danger is severe and capacity is lacking, arranging emergency shelter or guardianship."
            }
        ]
    },
    # 4. Self-neglect
    {
        "title": "Hoarding and Poor Hygiene: Self-Neglect",
        "age_range": (70, 95),
        "scenario": (
            "A {age}-year-old {gender} is visited at home by a community nurse. The nurse finds the patient living in a house filled with severe trash, rotten food, and animal feces (hoarding). The patient has a severe, unwashed odor, is wearing tattered, dirty clothes, and has multiple untreated skin tears on {possessive} legs. The patient insists {pronoun} is 'doing fine' and refuses all services."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what represents the highest priority next step in clinical management?",
                "options": [
                    "Elder self-neglect (potentially Diogenes syndrome); conduct a formal cognitive and decision-making capacity assessment, file a report with Adult Protective Services (APS), and work to build trust to introduce home health services",
                    "A normal, eccentric lifestyle choice; respect the patient's absolute right to self-determination and make no reports",
                    "Donepezil-induced obsessive-compulsive disorder; discontinue donepezil and prescribe high-dose sertraline",
                    "Acute bacterial meningitis; immediately call an ambulance for involuntary spinal tap and IV antibiotics",
                    "The patient's behavior is safe; advise the community nurse to stop visiting the home"
                ],
                "answer": 0,
                "exp": "Self-neglect is the most common form of elder abuse reported to APS. It involves the elder's own failure to provide essential food, water, shelter, hygiene, or medical care. It is often linked to dementia, depression, or severe psychiatric disorders (Diogenes syndrome). Mandated reporting to APS is required. A critical first step is assessing cognitive/decision-making capacity; if capacity is intact, the patient has a right to refuse help, but if capacity is impaired, protective interventions are warranted."
            },
            {
                "q": "What represents the clinical condition historically referred to as 'Diogenes Syndrome' in geriatric psychiatry?",
                "options": [
                    "A syndrome of severe self-neglect, domestic squalor, extreme hoarding, social withdrawal, and a complete lack of shame regarding their living conditions",
                    "An acute allergic vasculitis causing diffuse purple lesions on the extremities",
                    "A progressive cerebellar degeneration presenting with sudden, severe vertical nystagmus",
                    "A form of vascular dementia presenting with rapid, stepwise language loss",
                    "A disease of chronic uremic encephalopathy caused by high-dose NSAID abuse"
                ],
                "answer": 0,
                "exp": "Diogenes syndrome is characterized by extreme self-neglect, domestic squalor (living in garbage/feces), intense hoarding (syllogomania), social isolation, and a striking lack of concern or shame regarding their personal hygiene and environment."
            },
            {
                "q": "If a physician determines that an older adult experiencing severe self-neglect has fully intact decision-making capacity and has no signs of dementia or active psychosis, can the patient legally refuse Adult Protective Services (APS) interventions?",
                "options": [
                    "Yes; an adult with full decision-making capacity has the legal right to self-determination and can refuse all medical, social, and protective services, even if their choices appear highly self-destructive",
                    "No; any score on the MoCA less than 28/30 allows the physician to override all patient refusals and enforce institutionalization",
                    "No; APS has the absolute legal authority to override all patient refusals and enforce placement in a nursing home",
                    "Yes, but only if they sign a legal document relinquishing all of their financial assets to the state",
                    "Yes, but they must undergo weekly involuntary psychiatric evaluations to maintain this right"
                ],
                "answer": 0,
                "exp": "The principle of autonomy dictates that a person with intact decision-making capacity has the legal right to make their own choices, even if those choices are eccentric, unhealthy, or self-destructive. APS cannot force interventions on an autonomous, capable adult, though they will continue to offer supportive resources."
            }
        ]
    },
    # 5. Caregiver-mediated abuse (overmedication)
    {
        "title": "The Somnolent Elder: Caregiver-Mediated Chemical Abuse",
        "age_range": (70, 95),
        "scenario": (
            "A {age}-year-old {gender} with moderate dementia and chronic agitation is brought to the clinic by {possessive} daughter (who is the primary caregiver). The daughter appears highly stressed, complaining that the patient 'screams all night and is exhausting.' The physician notes the patient is profoundly somnolent, slurring words, and has a heart rate of 52 bpm. The daughter admits she has been giving the patient 'extra' doses of a relative's alprazolam and nightly diphenhydramine to 'keep him quiet.'"
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the best clinical and legal management?",
                "options": [
                    "Caregiver-mediated chemical elder abuse (inappropriate chemical restraint/overmedication); discontinue the alprazolam and diphenhydramine, document the toxidrome, file an immediate report with Adult Protective Services (APS), and coordinate caregiver support resources (respite care)",
                    "Donepezil toxicity; continue alprazolam and double the dose of donepezil to treat the underlying dementia",
                    "Normal post-dementia somnolence; advise the daughter to continue the medication regimen to ensure she gets rest",
                    "Acute bacterial sepsis; immediately initiate intravenous ceftriaxone and keep the patient heavily sedated",
                    "There are no concerns; chemical restraints are standard and highly recommended for all dementia home care"
                ],
                "answer": 0,
                "exp": "Chemical elder abuse involves using medications (sedatives, antipsychotics) inappropriately to control, sedate, or restrain a dependent elder for caregiver convenience. This carries a high risk of falls, respiratory depression, and death. Discontinuing the drugs, mandatory reporting to APS, and addressing the caregiver's severe stress (coordinating respite, support) are required."
            },
            {
                "q": "Which of the following represents a potential, serious clinical danger of using first-generation antihistamines (such as diphenhydramine) as a chemical sedative in a patient with pre-existing dementia?",
                "options": [
                    "High risk of anticholinergic delirium, severe confusion, dry mouth, urinary retention, constipation, and an increased risk of falls and fractures",
                    "Immediate cardiac arrest due to severe myocardial calcification",
                    "Rapid progression of the temporal lobe atrophy within 48 hours",
                    "Complete failure of the thyroid gland to synthesize thyroid hormone",
                    "There are no dangers; diphenhydramine is an over-the-counter medication and is completely safe"
                ],
                "answer": 0,
                "exp": "Diphenhydramine is a highly anticholinergic Beers Criteria drug. In patients with dementia (who already have a central acetylcholine deficit), it can trigger severe, acute anticholinergic delirium, along with dangerous peripheral side effects (urinary retention, falls, constipation)."
            },
            {
                "q": "Which of the following resources is designed to support a highly stressed primary caregiver, directly reducing the risk of caregiver burnout and subsequent elder abuse or neglect?",
                "options": [
                    "Respite care services, caregiver support groups, and Adult Day Health programs",
                    "Involuntary inpatient psychiatric hospitalization of the caregiver for 6 months",
                    "Increasing the patient's medication count to ensure absolute sedation 24 hours a day",
                    "A mandatory court order forcing the caregiver to provide full-time care without assistance",
                    "Tapering and discontinuing all of the patient's health insurance coverage"
                ],
                "answer": 0,
                "exp": "Geriatric medicine recognizes that caregiver stress is a primary driver of elder abuse. Providing support: respite care (temporary relief), caregiver support groups (emotional outlet), and Adult Day programs (daytime care) are highly effective interventions to prevent burnout and protect both the patient and caregiver."
            }
        ]
    },
    # 6. Sexual abuse in institutionalized elderly
    {
        "title": "Unexplained Trauma: Sexual Elder Abuse",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with advanced, non-verbal Alzheimer's disease resides in a skilled nursing facility. The nursing staff reports a sudden, dramatic change in the patient's behavior: {pronoun} has become highly fearful, screaming and thrashing when caregivers attempt to perform routine perineal care. During the physical exam, the nurse identifies unexplained bruising on the patient's inner thighs and minor genital trauma."
        ),
        "questions": [
            {
                "q": "What is the primary diagnostic concern, and what represents the immediate, highest-priority clinical and legal response?",
                "options": [
                    "Suspected sexual elder abuse; perform a meticulous medical evaluation, document all injuries, file an immediate report with law enforcement and Adult Protective Services (APS), ensure the patient is in a secure, protected environment, and consult a sexual assault forensic examiner (SAFE)",
                    "Severe localized candidal intertrigo; apply topical nystatin ointment and make no reports",
                    "A normal, expected behavioral flare of advanced dementia; initiate daily atypical antipsychotics and continue current care",
                    "An allergic reaction to the diaper material; transition to a different brand and avoid visual checks",
                    "The symptoms require no investigation; advise the nursing staff to perform perineal care rapidly to minimize agitation"
                ],
                "answer": 0,
                "exp": "Unexplained genital trauma, inner thigh bruising, and sudden, severe behavioral fear/agitation during bathing/perineal care in a non-verbal, dependent elder is highly concerning for sexual abuse. This is a severe medical and legal emergency. Meticulous documentation, immediate reporting to law enforcement and APS, ensuring safety, and a forensic SAFE exam are required."
            },
            {
                "q": "Why are institutionalized older adults with advanced dementia particularly vulnerable to physical and sexual abuse in long-term care facilities?",
                "options": [
                    "They are physically dependent on caregivers, frequently isolated, have severe cognitive/communication deficits that prevent them from reporting the abuse, and their complaints may be dismissed as 'dementia-related delusions'",
                    "They have upregulated pain receptors that make minor touches feel extremely painful",
                    "Dementia directly causes the skin to bruise under normal, light touch",
                    "They are legally barred from having family members visit their rooms",
                    "None of the options; institutionalized older adults are completely safe from all abuse"
                ],
                "answer": 0,
                "exp": "Vulnerability is driven by dependency and communication deficits. A non-verbal or severely confused patient cannot tell anyone what happened. If they do complain, staff or family may mistakenly attribute the comments to 'dementia confabulation' or delusions, allowing the abuse to continue."
            },
            {
                "q": "Which of the following represents a legally mandated investigator who serves as an independent advocate for residents of nursing homes, assisted living facilities, and board and care homes, investigating complaints of abuse and neglect?",
                "options": [
                    "Long-Term Care Ombudsman",
                    "Adult Protective Services case manager alone",
                    "The facility director or administrator",
                    "A hospital-appointed ethical consultant",
                    "A local district attorney"
                ],
                "answer": 0,
                "exp": "The Long-Term Care Ombudsman Program is a federally mandated advocacy program. Ombudsmen are independent advocates who visit facilities, investigate resident complaints (including abuse, neglect, and rights violations), resolve issues, and advocate for systemic quality improvement."
            }
        ]
    },
    # 7. Mandatory reporting obligations
    {
        "title": "Mandated Reporting: Elder Abuse suspicion",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with moderate dementia is evaluated in the clinic. The physician suspects financial exploitation and mild neglect by the patient's caregiver (an adult child) but has no absolute, definitive proof. The caregiver is highly defensive. The physician reviews the legal requirements for mandated reporting of elder abuse."
        ),
        "questions": [
            {
                "q": "What represents the physician's legal obligation and liability in this situation?",
                "options": [
                    "The physician is legally mandated to report any **suspected** elder abuse, neglect, or exploitation to Adult Protective Services (APS) immediately; a lack of definitive proof is not an excuse to withhold reporting, and the physician is legally immune from civil/criminal liability for good-faith reports",
                    "The physician must not report until they have obtained absolute, irrefutable proof (such as a confession or video), to avoid violating HIPAA and being sued for defamation",
                    "Reporting is legally voluntary; the physician should maintain family confidentiality and try to resolve the issues privately",
                    "Reporting is required only if the patient has intact decision-making capacity and gives explicit, written consent to file the report",
                    "The physician should immediately notify the caregiver of the suspicion and advise them to seek legal counsel before reporting"
                ],
                "answer": 0,
                "exp": "Under the law, healthcare providers are **mandated reporters**. They must report any 'reasonable suspicion' or belief that an elder is being abused, neglected, or exploited. They do not need to prove it (investigation is APS's job). Good-faith reports are legally protected with complete immunity from civil or criminal liability. Failing to report suspected abuse is a misdemeanor or felony under state laws."
            },
            {
                "q": "What is the standard timeframe required by law for a mandated reporter to file a report with Adult Protective Services (APS) after developing a suspicion of elder abuse?",
                "options": [
                    "Immediately (or within 24-48 hours depending on state law, with immediate telephone reporting required for imminent danger)",
                    "Within 30 days of the suspicion developing",
                    "At the patient's next scheduled annual wellness visit",
                    "Only after the patient has been formally discharged from the hospital",
                    "There is no timeframe; reports can be filed at the physician's convenience"
                ],
                "answer": 0,
                "exp": "State laws require immediate reporting. Typically, a mandated reporter must make an immediate oral report by telephone to the APS hotline as soon as the suspicion arises (especially if the patient is in danger), followed by a written report within 24 to 48 hours."
            },
            {
                "q": "Which of the following represents a potential, serious legal consequence for a physician who fails to report a reasonable suspicion of elder abuse to Adult Protective Services (APS)?",
                "options": [
                    "A misdemeanor or class A misdemeanor charge, significant fines, and potential professional disciplinary action by the state medical board",
                    "An immediate, automatic revocation of their driver's license",
                    "A mandatory sentence of life imprisonment in a federal penitentiary",
                    "The physician is legally forced to provide full-time home care for the patient",
                    "There are no legal consequences; failure to report carries no penalties"
                ],
                "answer": 0,
                "exp": "Under most state laws, failure of a mandated reporter to file a report of suspected elder abuse is a misdemeanor, punishable by significant fines (e.g., up to $1,000) and/or jail time (up to 6 months), along with potential investigation and discipline by the state licensing board."
            }
        ]
    },
    # 8. Risk factors for elder abuse
    {
        "title": "Elder Abuse: Identifying Risk Factors",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with advanced Alzheimer's disease is cared for at home by {possessive} adult child. The child is the sole caregiver, has a history of alcohol use disorder, is financially dependent on the patient's Social Security income, and has no social support. The physician identifies a high risk for elder abuse, even in the absence of current physical signs."
        ),
        "questions": [
            {
                "q": "Which of the following sets of risk factors represents the highest cumulative risk for the development of elder abuse or neglect in a home setting?",
                "options": [
                    "Patient: severe cognitive impairment (dementia), high physical dependency; Caregiver: high caregiver stress, history of substance abuse/mental illness, financial dependence on the elder, and severe social isolation",
                    "Patient: intact cognition, independent ADLs; Caregiver: employed, has high social support, and has no history of mental illness",
                    "Patient: history of treated hypertension and mild osteoarthritis; Caregiver: lives in a different state and visits monthly",
                    "Patient: active in a local senior center; Caregiver: professional home health aide with a clean background",
                    "None of the options; elder abuse is completely random and has no identifiable risk factors"
                ],
                "answer": 0,
                "exp": "Elder abuse is multifactorial. High-risk profiles involve: (1) Patient: cognitive impairment (agitation, combativeness is highly stressful), physical dependence. (2) Caregiver: high caregiver stress/burnout, substance abuse, mental health disorders, social isolation, and financial dependence on the elder (leading to resentment or exploitation)."
            },
            {
                "q": "Which of the following patient-related characteristics is the strongest predictor of a vulnerable older adult becoming a victim of elder abuse or neglect?",
                "options": [
                    "Severe cognitive impairment (dementia or moderate-to-severe cognitive decline)",
                    "A history of controlled primary essential hypertension",
                    "Having a high level of financial independence and wealth",
                    "A calculated bone mineral density T-score of -1.5 (osteopenia)",
                    "Active participation in daily physical therapy programs"
                ],
                "answer": 0,
                "exp": "Cognitive impairment (dementia) is the single strongest patient-related risk factor. Dementia patients require intensive, 24-hour care, may exhibit challenging behaviors (agitation, screaming, wandering), and cannot report abuse, making them highly vulnerable."
            },
            {
                "q": "Which of the following caregiver-related characteristics is highly associated with an elevated risk of committing elder neglect or abuse?",
                "options": [
                    "Active substance abuse (alcohol or drugs), untreated psychiatric illness, and financial dependence on the elder's income",
                    "Being a licensed professional registered nurse (RN)",
                    "Having a high level of social support and frequent respite care",
                    "Having a stable, high-paying full-time employment",
                    "Being an active member of a local caregiver support group"
                ],
                "answer": 0,
                "exp": "Caregivers with active substance abuse or mental health issues have compromised coping skills and judgment. Financial dependence on the elder creates power imbalances and financial stress, significantly elevating the risk of financial exploitation or neglect."
            }
        ]
    },
    # 9. Cognitive impairment and vulnerability
    {
        "title": "Cognitive Decline and Abuse Vulnerability",
        "age_range": (70, 95),
        "scenario": (
            "A {age}-year-old {gender} with moderate dementia and chronic aphasia is brought to the clinic. The physician notices the patient appears fearful and jumps when the caregiver moves suddenly. The patient cannot verbally communicate or answer questions about their home life due to severe language deficits. The physician evaluates the patient's vulnerability and plans protective actions."
        ),
        "questions": [
            {
                "q": "How does severe cognitive and communication impairment (aphasia) impact the vulnerability of older adults to abuse, and what is the appropriate clinical approach?",
                "options": [
                    "It dramatically increases vulnerability because the patient cannot verbally report the abuse, and the caregiver has complete control; the clinician must rely on non-verbal behavioral signs (fear, withdrawal, startle response) and physical evidence, and file an APS report",
                    "It decreases vulnerability because cognitively impaired patients do not perceive or feel pain or emotional trauma",
                    "A lack of verbal report means abuse cannot be diagnosed or reported; the clinician must wait until the patient can explain the situation",
                    "The patient's fear is a normal delusional symptom of moderate dementia and has no clinical significance",
                    "Immediately prescribe high-dose oral donepezil to restore the patient's speech prior to taking action"
                ],
                "answer": 0,
                "exp": "Vulnerability is magnified by communication deficits (aphasia, dementia). Abusers target these patients because they know they cannot report the abuse, or that their complaints will be dismissed as 'dementia delusions.' Clinicians must recognize non-verbal cues: fear/flinching around the caregiver, sudden withdrawal, startle response, or unexplained bruising. Mandated reporting to APS is required based on these clinical indicators."
            },
            {
                "q": "Which of the following non-verbal behavioral signs, if observed in an older adult with advanced dementia during a clinical visit, should raise immediate suspicion of potential elder abuse or intimidation?",
                "options": [
                    "Extreme fear, flinching, withdrawal, or looking at the caregiver anxiously before answering simple questions",
                    "Appearing pleasant, smiling, and making direct eye contact with the clinician",
                    "A calculated Mini-Mental State Examination (MMSE) score of 18/30",
                    "Mild age-related tremors in both hands during physical examination",
                    "Active participation in dynamic balance exercises during the visit"
                ],
                "answer": 0,
                "exp": "Behavioral indicators of abuse include: looking at the caregiver with hypervigilance, appearing deferential or terrified, extreme passivity, sudden withdrawal, or a caregiver who refuses to leave the room or answers all questions for the patient."
            },
            {
                "q": "If a physician suspects that a cognitively impaired older adult is in immediate, life-threatening danger at home due to severe caregiver neglect or physical abuse, what is the most appropriate action?",
                "options": [
                    "Admit the patient to the hospital for medical stabilization and safety, and file an immediate emergency report with law enforcement and APS",
                    "Discharge the patient home and schedule a follow-up visit in 30 days to see if the situation improves",
                    "Confront the caregiver aggressively in the lobby and threaten them with a private lawsuit",
                    "Ask the caregiver to sign a voluntary home safety agreement and send the patient home",
                    "Taper and discontinue all of the patient's cardiac and dementia medications"
                ],
                "answer": 0,
                "exp": "If the elder's safety is immediately compromised, they must not be sent back to the dangerous environment. Hospital admission provides a safe haven ('social admission' for safety), allowing the medical team to stabilize the patient, consult social work, and coordinate with APS and police for immediate protective custody or surrogate changes."
            }
        ]
    },
    # 10. Elder Abuse Suspicion Index (EASI) screening
    {
        "title": "EASI: Screening for Elder Abuse",
        "age_range": (65, 85),
        "scenario": (
            "A {age}-year-old {gender} with a history of mild osteoarthritis is evaluated during an annual wellness visit. The patient has intact cognitive function (MoCA 27/30) and lives with {possessive} adult child. As part of a preventive screening protocol, the physician decides to administer the **Elder Abuse Suspicion Index (EASI)** screening tool."
        ),
        "questions": [
            {
                "q": "What is the Elder Abuse Suspicion Index (EASI), and how is it clinically administered and interpreted?",
                "options": [
                    "A validated 6-question screening tool (5 questions asked directly to the patient alone, and 1 question completed by the clinician based on observation); any 'yes' answer on the patient questions represents a positive screen, requiring detailed evaluation and an APS report",
                    "A complex 50-item questionnaire completed by the caregiver to evaluate their level of stress",
                    "A blood test that measures circulating pyrogenic cytokines to identify physical trauma",
                    "A legal document that appoints a court-approved public guardian for the patient",
                    "None of the options; EASI is used to evaluate surgical anesthesia risk in BPH patients"
                ],
                "answer": 0,
                "exp": "The Elder Abuse Suspicion Index (EASI) is a rapid, validated screening tool for cognitively intact older adults (MMSE >= 24). It consists of 5 direct questions asked to the patient alone (targeting physical, emotional, financial abuse, and neglect) and 1 observation question for the doctor. A 'yes' to any of the 5 patient questions represents a positive screen, triggering a thorough assessment and mandated APS report."
            },
            {
                "q": "Which of the following represents the EASI (Elder Abuse Suspicion Index) question specifically targeting potential neglect or failure to provide essential care?",
                "options": [
                    "'Has anyone close to you failed to give you basic care that you needed, like giving you food, medicine, or taking you to the doctor?'",
                    "'Have you signed any legal documents that you did not fully understand?'",
                    "'Has anyone close to you made you feel afraid, or threatened you in the past year?'",
                    "'Has anyone close to you pushed, hit, or physically hurt you?'",
                    "'None of the options; the EASI does not evaluate caregiver neglect'"
                ],
                "answer": 0,
                "exp": "The EASI includes direct questions: Q1 (neglect: failure to provide basic care), Q2 (emotional: making you feel afraid/threatened), Q3 (financial: taking your money/cards), Q4 (physical: hitting/hurting), Q5 (apathy/abuse: general concerns). Q6 is the clinician's observation of physical or cognitive signs."
            },
            {
                "q": "Why must the Elder Abuse Suspicion Index (EASI) be administered to the older patient in strict privacy, with the caregiver or family member asked to leave the room?",
                "options": [
                    "Older adults are highly unlikely to report abuse, intimidation, or neglect if their potential abuser is present in the room, due to fear of immediate retaliation or shame",
                    "The caregiver's presence will contaminate the sterile field required for the screening",
                    "HIPAA guidelines strictly prohibit family members from hearing any cognitive questions",
                    "The screening takes 2 hours to complete and requires a quiet, distraction-free environment",
                    "There is no reason; the screening can be performed in front of anyone without issues"
                ],
                "answer": 0,
                "exp": "Abused elders are terrified of their abusers. If the caregiver is present, the patient will deny any abuse to protect themselves from retaliation at home, out of shame, or to protect the family member. Meticulous privacy is an absolute clinical requirement for all elder abuse screenings."
            }
        ]
    }
]

templates_social = [
    # 1. Caregiver burden assessment (ZBI)
    {
        "title": "Zarit Burden Interview and Caregiver Burnout",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with moderate dementia has been cared for at home by their spouse for 3 years. The spouse reports feeling overwhelmed, missing work, and having no time for personal activities. The clinician administers the Zarit Burden Interview (ZBI), and the spouse scores 58."
        ),
        "questions": [
            {
                "q": "Which of the following is the most appropriate interpretation and next step?",
                "options": [
                    "A ZBI score >= 21 indicates significant caregiver burden (score 58 represents severe burden); refer the caregiver to a social worker, recommend a caregiver support group, arrange respite care services, and screen the caregiver for depression and burnout",
                    "The ZBI is used exclusively to assess the patient's cognitive decline; repeat the Mini-Mental State Examination (MMSE) to evaluate the patient's disease progression",
                    "A ZBI score in this range mandates immediate involuntary psychiatric hospitalization of the caregiver for acute burnout syndrome",
                    "A ZBI score of this level is within normal limits for caregivers; reassure the spouse that these feelings are completely expected and require no intervention",
                    "Advise the caregiver that their only legal option is to continue providing full-time home care without institutional support until the patient dies"
                ],
                "answer": 0,
                "exp": "The Zarit Burden Interview is a validated tool to measure caregiver burden. A score >= 21 is significant, and 40-80 is severe. Caregiver burnout is a major predictor of institutionalization of the patient. Interventions include: social work support groups, respite care, and screening the caregiver for depression."
            },
            {
                "q": "Which of the following represented a key clinical outcome directly linked to severe caregiver burden in the management of dementia patients?",
                "options": [
                    "Premature nursing home placement of the patient and a high risk of depression and physical illness in the caregiver",
                    "Accelerated temporal lobe atrophy in the patient driven by caregiver stress",
                    "Immediate legal prosecution of the family for secondary elder neglect",
                    "Decreased intestinal absorption of the patient's cholinesterase inhibitors",
                    "None of the options; caregiver burden has no impact on clinical outcomes"
                ],
                "answer": 0,
                "exp": "Caregiver burnout is the strongest predictor of premature institutionalization of the dementia patient, as the caregiver becomes physically or emotionally unable to continue home care. Caregivers themselves have higher rates of depression, illness, and mortality."
            },
            {
                "q": "Which of the following services offers temporary, short-term relief to a primary caregiver by providing professional supervision and care for the dementia patient, either at home or in an inpatient setting?",
                "options": [
                    "Respite care services",
                    "Hospice care services",
                    "Adult Day Health programs only",
                    "Medicare Home Health nursing",
                    "Continuing Care Retirement Communities"
                ],
                "answer": 0,
                "exp": "Respite care provides temporary relief for the primary caregiver. It can be provided in-home (by a visiting aide) or in an institutional setting (a nursing home or hospice facility accepting the patient for a few days to a week), allowing the caregiver to rest, attend to their own health, or take a vacation."
            }
        ]
    },
    # 2. Respite care services
    {
        "title": "Respite Care: Giving Caregivers a Break",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with advanced vascular dementia is cared for at home by {possessive} daughter. The daughter works full-time, has developed severe insomnia, and admits she has not had a day off or a single night of uninterrupted sleep in 2 years. She asks if there are any options that will allow her to take a 5-day break to attend her own medical appointments."
        ),
        "questions": [
            {
                "q": "What represents the most appropriate referral and service to meet this caregiver's needs?",
                "options": [
                    "Refer for respite care services (e.g., short-term placement of the patient in a skilled nursing facility, or arranging a temporary in-home personal care aide for 5 days)",
                    "Advise the daughter to place the patient in a permanent, locked psychiatric hospital immediately",
                    "Refer the patient for a permanent ventriculoperitoneal shunt placement to reduce caregiver burden",
                    "Recommend the caregiver resign from her job to focus full-time on home care without assistance",
                    "Respite care is strictly prohibited under federal health regulations and cannot be used"
                ],
                "answer": 0,
                "exp": "Respite care is designed to provide temporary, short-term relief to a primary caregiver. It can be provided in-home (visiting personal care aide) or in an inpatient/institutional setting (skilled nursing facility, assisted living, or hospice) where the patient is admitted for a few days to a week, giving the caregiver a break."
            },
            {
                "q": "Which of the following programs covers short-term inpatient respite care for up to 5 consecutive days at a time, specifically for patients enrolled in hospice care to relieve their primary caregivers?",
                "options": [
                    "Medicare Part A (the Medicare Hospice Benefit)",
                    "Medicare Part B only, with a 50% co-insurance requirement",
                    "The local police department's community safety fund",
                    "Private commercial auto insurance policies",
                    "Respite care is never covered by any public or private programs"
                ],
                "answer": 0,
                "exp": "The Medicare Hospice Benefit (covered under Medicare Part A) explicitly covers short-term inpatient respite care for up to 5 consecutive days at a time in an approved facility (nursing home or hospice inpatient unit) to give the primary caregiver a break, with zero co-pays."
            },
            {
                "q": "What is the primary difference in clinical goals between 'Respite Care' and 'Adult Day Health Programs'?",
                "options": [
                    "Respite care provides continuous, overnight, short-term relief (days to weeks), while Adult Day programs provide structured daytime supervision and socialization (hours during the day)",
                    "Respite care is performed only by surgeons, while Adult Day programs are performed only by physical therapists",
                    "Adult Day programs are designed only for patients with terminal cancer, while Respite care is only for dementia",
                    "There is no difference; the two terms are clinically synonymous",
                    "Respite care requires the patient to undergo a brain biopsy, while Adult Day programs require only a MoCA"
                ],
                "answer": 0,
                "exp": "Respite care is temporary, full-time care (overnight/multi-day) to give the caregiver a extended break. Adult Day programs are daytime-only services (e.g., 9 AM to 3 PM, 3-5 days a week) providing socialization, meals, and activities, allowing the caregiver to work or rest during the day."
            }
        ]
    },
    # 3. Adult Day Health Programs
    {
        "title": "Adult Day Health Programs for Cognitive Stimulation",
        "age_range": (65, 90),
        "scenario": (
            "A {age}-year-old {gender} with moderate Alzheimer's disease lives with {possessive} working son. The son is highly concerned about the patient remaining alone at home during the day, noting that the patient is lonely, has stopped eating lunch, and has a high risk of wandering outside. The son asks about structured daytime options."
        ),
        "questions": [
            {
                "q": "What represents the most appropriate referral to address the patient's socialization and safety needs during the day, while allowing the son to continue working?",
                "options": [
                    "Refer to an Adult Day Health Program (Adult Day Care); this provides structured daytime supervision, cognitive stimulation, socialization, physical activities, and nutritious meals in a secure environment",
                    "Recommend the son place the patient in a permanent, locked forensic nursing facility today",
                    "Refer the patient for an immediate bilateral greater trochanteric joint replacement",
                    "Recommend the patient be left at home with a video monitor and a locked refrigerator",
                    "Adult Day programs are strictly prohibited for patients with Alzheimer's disease due to safety risks"
                ],
                "answer": 0,
                "exp": "Adult Day Health Programs (Adult Day Care) are designed for older adults who need supervision and socialization during the day. They provide a safe, structured environment with activities, cognitive stimulation, meals, and basic health monitoring, allowing primary caregivers to maintain employment or take a daytime break."
            },
            {
                "q": "Which of the following clinical benefits has been demonstrated in older adults with dementia who participate regularly in structured Adult Day Health Programs?",
                "options": [
                    "Improved mood, reduced behavioral disruptions (agitation), enhanced socialization, and a delay in permanent nursing home placement",
                    "Complete reversal of the underlying hippocampal and cortical atrophy",
                    "Severe weight loss due to excessive daytime physical activity",
                    "Rapid progression of the vascular dementia stepwise decline",
                    "No documented benefits; Adult Day care is a purely custodial service"
                ],
                "answer": 0,
                "exp": "Structured daytime programs provide essential cognitive stimulation and social interaction, which directly reduces depression, anxiety, and nighttime agitation (sundowning) in dementia patients, while significantly delaying the need for permanent institutionalization."
            },
            {
                "q": "What represents the primary difference between a 'Social' Adult Day Care program and a 'Medical/Health' Adult Day Care program?",
                "options": [
                    "Social programs focus on activities, meals, and socialization, while Medical programs add skilled nursing care, physical/occupational therapy, and intensive medication management",
                    "Social programs are performed only in public parks, while Medical programs are performed only in operating rooms",
                    "Medical programs are covered 100% by Medicare for all seniors, while Social programs are strictly out-of-pocket",
                    "Social programs are designed only for patients with severe schizophrenia",
                    "There is no difference; the two types of programs utilize identical staff and services"
                ],
                "answer": 0,
                "exp": "Social Adult Day Care focuses on recreation, meals, and companionship. Medical/Health Adult Day Care (Adult Day Health Services) is more comprehensive, employing registered nurses and therapists to provide medication administration, wound care, PT/OT, and personal care for medically complex or frail elders."
            }
        ]
    },
    # 4. Nursing home vs community care decision
    {
        "title": "Nursing Home vs Community Care Decision",
        "age_range": (70, 95),
        "scenario": (
            "A {age}-year-old {gender} with advanced vascular dementia is being evaluated following a brief admission for a fall. The patient has double incontinence and requires assistance with 5 of 6 basic ADLs. The adult children work full-time and are physically unable to provide the level of care needed at home. They discuss permanent placement options."
        ),
        "questions": [
            {
                "q": "What represents the correct clinical approach and options for this family's decision-making process?",
                "options": [
                    "Conduct a formal level of care assessment, discuss long-term care options (Skilled Nursing Facility [SNF] vs Assisted Living with memory care vs 24/7 home care), evaluate financial eligibility (Medicaid long-term care), and align with family values",
                    "Strongly insist the family maintain the patient at home at all costs, as nursing home placement is globally associated with immediate clinical neglect",
                    "Initiate comfort-only hospice care immediately as the sole alternative to nursing home placement, regardless of prognosis",
                    "Advise the family that Medicare will cover 100% of the cost of permanent, long-term nursing home care indefinitely",
                    "Refer the patient for immediate bilateral trochanteric joint replacement as a cure for BPH and incontinence"
                ],
                "answer": 0,
                "exp": "Deciding on long-term care requires a comprehensive approach. A level of care assessment evaluates functional needs. SNFs provide 24/7 skilled nursing for frail patients. Medicaid covers long-term care for financially eligible patients; Medicare does **not** cover long-term custodial care (only short-term rehab up to 100 days). Support involves navigating these choices."
            },
            {
                "q": "Who covers the cost of long-term, permanent custodial care in a skilled nursing facility (nursing home) in the United States for an older adult who lacks private long-term care insurance?",
                "options": [
                    "Medicaid (for patients who meet low-income and asset thresholds, often requiring a 'spend-down' of assets)",
                    "Medicare Part A, which covers 100% of long-term custodial care indefinitely",
                    "Medicare Part B, requiring a 20% co-pay for the room and board",
                    "The federal Social Security administration via a direct monthly nursing home bonus check",
                    "Long-term custodial care is provided completely free of charge by the state to all citizens over 65"
                ],
                "answer": 0,
                "exp": "Long-term custodial care (non-medical help with ADLs) is extremely expensive and is **not** covered by Medicare. Medicaid is the primary payer of long-term nursing home care, but patients must spend down their personal assets to qualify based on strict state-specific income and asset limits."
            },
            {
                "q": "What is the maximum number of days Medicare Part A will cover in a Skilled Nursing Facility (SNF) for short-term rehabilitation following a qualifying 3-day inpatient hospital stay?",
                "options": [
                    "Up to 100 days per benefit period (with days 1-20 covered at 100%, and days 21-100 requiring a significant daily co-insurance)",
                    "Up to 365 days per year, completely covered with zero co-pays",
                    "Exactly 3 days only, matching the hospital stay",
                    "Medicare does not cover short-term SNF rehabilitation under any circumstances",
                    "Indefinitely, as long as the patient's physician certifies they have osteoarthritis"
                ],
                "answer": 0,
                "exp": "Medicare Part A covers up to 100 days of post-acute, skilled rehabilitative care in a SNF if the patient had a preceding 3-day inpatient hospital stay. Coverage is 100% for the first 20 days, and requires a daily co-insurance (~$200/day) for days 21-100. It does not cover permanent custodial care."
            }
        ]
    },
    # 5. Home health services
    {
        "title": "Medicare Home Health Services Criteria",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with severe osteoarthritis and a recent stroke is being discharged home. The patient is physically slow, requires a walker, and requires 'considerable and taxing effort' to leave {possessive} home (e.g., leaving only for medical visits with help). The physician wishes to prescribe Medicare-covered Home Health Services (PT/OT, skilled nursing) at home."
        ),
        "questions": [
            {
                "q": "What represents the key eligibility criteria for an older adult to qualify for Medicare-covered home health services, and how are these services ordered?",
                "options": [
                    "The patient must be certified as 'homebound' (leaving home requires considerable and taxing effort), require intermittent skilled care (nursing or therapy), have a face-to-face encounter with a clinician, and have a signed plan of care",
                    "The patient must be completely bed-bound and unable to speak, and have a life expectancy < 3 months",
                    "Home health is covered 100% for any senior who requests it for general companion and housekeeping services",
                    "The patient must undergo an invasive diagnostic brain biopsy prior to qualifying",
                    "There are no criteria; home health services are voluntarily provided by the state with no requirements"
                ],
                "answer": 0,
                "exp": "Under Medicare, to qualify for home health: (1) the patient must be 'homebound' (meaning leaving home is difficult and requires taxing effort, typically requiring assistive devices or help), (2) require intermittent skilled nursing or PT/OT/SLP, (3) have a face-to-face clinician encounter, and (4) have a signed plan of care. It covers skilled care, **not** 24/7 custodial care or housekeeping."
            },
            {
                "q": "Which of the following activities, if performed regularly by the patient, would generally disqualify them from being certified as 'homebound' under Medicare Home Health guidelines?",
                "options": [
                    "Driving {self_pronoun} to a local grocery store multiple times a week independently, or attending social gatherings without difficulty",
                    "Leaving the home once a week exclusively to attend a medical appointment with assistance",
                    "Leaving the home occasionally to attend a religious service with a wheelchair and family support",
                    "Leaving the home briefly to attend a family wedding with extensive physical assistance",
                    "Walking 10 steps to the mailbox with a walker while accompanied by a visiting nurse"
                ],
                "answer": 0,
                "exp": "To be certified as 'homebound,' leaving home must be infrequent, brief, and require a taxing effort. Driving oneself to run routine errands independently indicates the patient is not homebound, and they should receive outpatient therapies instead."
            },
            {
                "q": "Which of the following home services is NOT covered by the Medicare Home Health benefit, representing a common source of confusion for families?",
                "options": [
                    "Long-term, full-time non-skilled personal care aides (custodial care) and general housekeeping/meal delivery",
                    "Intermittent physical therapy visits (PT)",
                    "Intermittent occupational therapy visits (OT)",
                    "Part-time skilled nursing visits for wound care or catheter changes",
                    "Speech-language pathology visits (SLP) for dysphagia"
                ],
                "answer": 0,
                "exp": "The Medicare Home Health benefit is strictly for short-term, intermittent skilled care. It does not cover 24/7 home care, long-term personal care aides (bathing/dressing assistance as the sole service), or custodial services like housekeeping, laundry, and meals."
            }
        ]
    },
    # 6. Social isolation and loneliness
    {
        "title": "Social Isolation and Loneliness in the Elderly",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} presents for an annual wellness visit. The patient's spouse passed away 1 year ago, and {possessive} children live in a different state. The patient admits to spending all day watching television, having no contact with neighbors, and feeling profoundly lonely and isolated. The physician evaluates the patient for **social isolation**."
        ),
        "questions": [
            {
                "q": "What is the clinical significance of social isolation and loneliness in older adults, and what represents an evidence-based intervention?",
                "options": [
                    "They are powerful social determinants of health, linked to a 50% increased risk of dementia, a 30% increased risk of stroke/heart disease, depression, and all-cause mortality; screen and refer to community resources (senior centers, volunteer programs, adult day programs)",
                    "They have no documented impact on physical health; reassure the patient and advise them to buy a second television",
                    "Immediately initiate daily atypical antipsychotics and prescribe strict, lifelong bed rest",
                    "Refer the patient for immediate bilateral trochanteric joint replacement as the primary therapy",
                    "Social isolation is a self-limiting aging change that requires no clinical intervention"
                ],
                "answer": 0,
                "exp": "Social isolation (objective lack of social contacts) and loneliness (subjective feeling of being alone) are major health risks. Studies show they carry a mortality risk comparable to smoking 15 cigarettes a day, and raise the risk of dementia by 50%, and stroke/CHD by 29-32%. Management involves social prescribing: connecting patients to senior centers, volunteer groups, or silver sneakers."
            },
            {
                "q": "Which of the following clinical screening tools is a widely validated, 3-question or 20-question questionnaire used to quantify subjective feelings of loneliness in clinical research and practice?",
                "options": [
                    "UCLA Loneliness Scale",
                    "Zarit Burden Interview (ZBI)",
                    "Confusion Assessment Method (CAM)",
                    "Braden Scale",
                    "Katz Index of ADLs"
                ],
                "answer": 0,
                "exp": "The UCLA Loneliness Scale (in its 3-item or 20-item version) is the gold-standard tool. The 3-item version asks: 'How often do you feel that you lack companionship?', 'How often do you feel left out?', and 'How often do you feel isolated from others?'"
            },
            {
                "q": "Which of the following represents a highly successful, community-based program designed to reduce social isolation in older adults by promoting regular, structured telephone check-ins by trained volunteers?",
                "options": [
                    "Friendly Visitor or Telephone Reassurance programs",
                    "The HELP protocol for delirium prevention",
                    "The BOOST transitional care model",
                    "The PACE program for long-term care",
                    "Medicare Home Health physical therapy"
                ],
                "answer": 0,
                "exp": "Telephone reassurance or 'Friendly Visitor' programs match isolated older adults with volunteers who make scheduled phone calls or home visits. This provides essential human contact, screens for acute needs, and significantly reduces depression and loneliness."
            }
        ]
    },
    # 7. Transportation barriers to care
    {
        "title": "Transportation Barriers and Missed Appointments",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with severe osteoarthritis, hypertension, and diabetes has missed three consecutive scheduled appointments for diabetic eye checks and GFR monitoring over the past 6 months. The patient admits that {pronoun} stopped driving 1 year ago due to near-misses, has no local family, and cannot afford private taxis. The physician evaluates the patient for **transportation barriers**."
        ),
        "questions": [
            {
                "q": "What is the clinical impact of transportation barriers in older adults, and what is the best clinical management?",
                "options": [
                    "Transportation barriers are a major social determinant of health, leading to missed appointments, poor disease control, and delayed care; evaluate for non-emergency medical transportation (NEMT) services, coordinate social work, or utilize telehealth",
                    "Instruct the patient to resume driving immediately, as maintaining autonomy is the absolute highest priority in BPH",
                    "Discontinue the patient's medications since they cannot attend appointments to monitor them, and close the file",
                    "Refer the patient for immediate bilateral trochanteric joint replacement as a cure for BPH and cataracts",
                    "Transportation is a personal matter outside the scope of medicine; no interventions are indicated"
                ],
                "answer": 0,
                "exp": "Lack of transportation is a major social determinant of health (SDOH). It directly leads to poor chronic disease control, medication non-compliance, and eventually, high-cost emergency room visits or hospitalizations. Clinicians must identify barriers and connect patients to Medicaid-funded NEMT, county transit, or use telehealth."
            },
            {
                "q": "Which of the following programs provides free or low-cost, non-emergency medical transportation (NEMT) services to transport eligible, low-income older adults to and from scheduled medical visits?",
                "options": [
                    "Medicaid (under federally mandated Non-Emergency Medical Transportation benefits)",
                    "Medicare Part B, which covers all taxi fares with zero co-pays",
                    "The local police department's emergency escort fleet",
                    "The Federal Highway Administration's senior transit grant program",
                    "NEMT is not covered by any state or federal programs"
                ],
                "answer": 0,
                "exp": "Medicaid is federally required to provide NEMT benefits. It covers rides to and from medical appointments (pre-arranged van services, bus passes, or specialized wheelchair transport) for low-income patients who have no other means of transportation."
            },
            {
                "q": "For an older adult with severe mobility barriers who lacks local transportation, which of the following represents an excellent, modern clinical alternative to facilitate routine cognitive follow-up and chronic disease monitoring without requiring the patient to leave their home?",
                "options": [
                    "Telehealth / Telemedicine visits",
                    "Aggressive, deep endotracheal suctioning twice weekly",
                    "Enrolling the patient in a clinical trial for a new, unapproved statin",
                    "A permanent ventriculoperitoneal shunt placement",
                    "Involuntary inpatient psychiatric admission"
                ],
                "answer": 0,
                "exp": "Telehealth allows video or audio visits in the patient's home. It is highly useful for follow-ups that do not require physical exams (e.g., checking home BP logs, reviewing glucose readings, reviewing lab results, cognitive screening, counseling), bypassing transportation barriers entirely."
            }
        ]
    },
    # 8. Food insecurity in elderly
    {
        "title": "Food Insecurity: The Hungry Elder",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} presents with a {duration}-month history of progressive weight loss and fatigue. The patient lives alone on a fixed, very low Social Security income. The patient admits that by the 20th of every month, {pronoun} runs out of money and must skip meals or eat only plain white rice. Labs show microcytic anemia, hypokalemia, and low serum prealbumin."
        ),
        "questions": [
            {
                "q": "What is the correct diagnosis, and what represents the most appropriate, immediate intervention?",
                "options": [
                    "Food insecurity causing protein-energy malnutrition; assist the patient in enrolling in the Supplemental Nutrition Assistance Program (SNAP/food stamps), coordinate a referral to a local Meals on Wheels program, and connect with a social worker",
                    "Donepezil-induced cachexia; continue current diet and double the dose of donepezil and memantine",
                    "Primary hyperthyroidism; prescribe high-dose propylthiouracil and initiate daily oral prednisone",
                    "Acute ischemic stroke; perform an emergent head CT and activate the stroke team for tPA",
                    "There are no concerns; skipping meals is a normal, calorie-restriction aging change that promotes longevity"
                ],
                "answer": 0,
                "exp": "Food insecurity (lack of consistent access to nutritious food) is a major SDOH, leading to malnutrition, anemia, and poor clinical outcomes. Clinicians should screen and connect patients to SNAP (food stamps), senior food pantries, or home-delivered meal programs (Meals on Wheels), which provides nutrition and a daily safety check."
            },
            {
                "q": "Which of the following represents a highly successful, home-delivered nutrition program designed specifically for homebound older adults, which provides a hot, nutritious meal daily along with a vital personal safety check?",
                "options": [
                    "Meals on Wheels",
                    "The Supplemental Nutrition Assistance Program (SNAP) alone",
                    "The HELP protocol for delirium prevention",
                    "The BOOST model for transitional care",
                    "Medicare Home Health physical therapy"
                ],
                "answer": 0,
                "exp": "Meals on Wheels is a non-profit program that delivers nutritious meals to homebound older adults. Beyond providing essential food, the daily volunteer delivery serves as a vital safety check: if the patient does not answer the door or appears ill, the volunteer can alert family or emergency services."
            },
            {
                "q": "Which of the following rapid, 2-question screening tools is widely validated and recommended to identify food insecurity in clinical practice?",
                "options": [
                    "The Hunger Vital Sign",
                    "The Zarit Burden Interview (ZBI)",
                    "The Confusion Assessment Method (CAM)",
                    "The Braden Scale Screening",
                    "The Mini-Nutritional Assessment (MNA)"
                ],
                "answer": 0,
                "exp": "The Hunger Vital Sign is a validated 2-question tool: (1) 'Within the past 12 months, we worried whether our food would run out before we got money to buy more,' and (2) 'Within the past 12 months, the food we bought just didn't last and we didn't have money to get more.' An answer of 'often' or 'sometimes' indicates a positive screen."
            }
        ]
    },
    # 9. Medicare vs Medicaid coverage
    {
        "title": "Medicare vs Medicaid: Navigating the Gaps",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} requires long-term, permanent custodial care in a skilled nursing facility (nursing home) due to advanced dementia. The family is confused by the financial coverage, believing that 'Medicare will pay for the nursing home.' The physician explains the key differences in coverage between **Medicare** and **Medicaid**."
        ),
        "questions": [
            {
                "q": "What is the key difference in coverage between Medicare and Medicaid regarding long-term custodial nursing home care?",
                "options": [
                    "Medicare does NOT cover long-term, permanent custodial nursing home care; Medicaid is the primary payer of long-term custodial care for financially eligible older adults who meet low-income and asset limits",
                    "Medicare covers 100% of permanent custodial nursing home care indefinitely, while Medicaid covers only short-term surgical recovery",
                    "Medicare Part B covers the room and board of a nursing home, while Medicaid Part D covers only the drugs",
                    "Both Medicare and Medicaid are legally prohibited from paying for any nursing home care, requiring 100% out-of-pocket payment by all families",
                    "None of the options; the two programs utilize identical funding and coverage criteria"
                ],
                "answer": 0,
                "exp": "Medicare is a federal program for adults >= 65 and disabled, covering acute care (hospitals, doctors, short-term rehab up to 100 days). It does **not** cover long-term custodial care (nursing homes). Medicaid is a joint federal/state program for low-income individuals, and is the primary payer of permanent, long-term custodial nursing home care, subject to strict asset/income thresholds."
            },
            {
                "q": "Which of the following parts of the Medicare program covers inpatient hospital stays, skilled nursing facility (SNF) short-term rehabilitation, and certified hospice care?",
                "options": [
                    "Medicare Part A",
                    "Medicare Part B",
                    "Medicare Part C",
                    "Medicare Part D",
                    "Medigap policies"
                ],
                "answer": 0,
                "exp": "Medicare Part A is hospital insurance. It covers inpatient hospital care, up to 100 days of post-acute skilled nursing facility (SNF) rehab, hospice care, and some home health care. Medicare Part B covers outpatient services (doctor visits, diagnostic tests, NEMT). Part D covers prescription drugs."
            },
            {
                "q": "What is a 'Medigap' (Medicare Supplement Insurance) policy, and what is its primary clinical utility for older adults?",
                "options": [
                    "A private health insurance policy designed to cover the 'gaps' in original Medicare (such as deductibles, co-pays, and co-insurance) to reduce out-of-pocket costs",
                    "A government-funded program that provides free home-delivered meals to all seniors",
                    "A specialized type of long-term care insurance that covers permanent nursing home stays",
                    "A clinical screening tool used to identify mild cognitive impairment in highly educated patients",
                    "None of the options; Medigap is a surgical procedure for cataracts"
                ],
                "answer": 0,
                "exp": "Original Medicare (Part A and B) requires significant out-of-pocket costs (e.g., a 20% co-insurance for Part B services). Medigap is private supplemental insurance that covers these deductibles and co-pays, protecting older adults from high, unpredictable medical bills."
            }
        ]
    },
    # 10. Housing safety and aging in place
    {
        "title": "Aging in Place and PACE Programs",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with moderate dementia and chronic heart failure lives alone in a double-story home. The children wish for the patient to 'age in place' safely, avoiding a nursing home. The physician introduces the **PACE (Program of All-Inclusive Care for the Elderly)** program as a comprehensive, community-based care model."
        ),
        "questions": [
            {
                "q": "What is the PACE program, and how does it support older adults in aging in place safely?",
                "options": [
                    "A comprehensive, capitated care model that integrates all medical and social services (adult day centers, primary care, therapies, meals, NEMT, and home care) under a single team, allowing frail, nursing-home-eligible elders to remain living in the community safely",
                    "A financial grant that provides free, high-speed sports cars to seniors to improve transportation",
                    "A strict residential program that requires the patient to move to a specialized, locked state-run dormitory",
                    "A medical protocol that focuses on weekly, high-volume lumbar punctures to treat dementia",
                    "There are no such programs; aging in place is not clinically supported in patients with dementia"
                ],
                "answer": 0,
                "exp": "PACE is a highly successful model of care. It is a joint Medicare/Medicaid program that serves frail, nursing-home-eligible elders (>= 55). PACE acts as both the provider and the insurer, integrating all services: adult day centers, primary care, transport, home aides, and social work. By coordinating everything, PACE allows 90% of these frail elders to continue living safely at home ('aging in place')."
            },
            {
                "q": "What represents the minimum age requirement and functional eligibility criteria to enroll in the PACE (Program of All-Inclusive Care for the Elderly) program?",
                "options": [
                    "Age 55 or older, certified by the state as meeting the level of care required for a nursing home, and able to live safely in the community with PACE support",
                    "Age 65 or older, with a calculated bone mineral density T-score of -3.0 or worse",
                    "Age 70 or older, with a diagnosis of terminal cancer and a life expectancy < 6 months",
                    "Age 50 or older, with a calculated GFR > 90 mL/min and a normal MMSE",
                    "There are no age or functional criteria; PACE is open to all citizens regardless of health"
                ],
                "answer": 0,
                "exp": "To enroll in PACE: (1) must be >= 55 years old, (2) live in a PACE service area, (3) meet the state's clinical criteria for nursing home level of care, and (4) be able to live safely in the community with the help of PACE services."
            },
            {
                "q": "Which of the following represents an essential 'aging in place' home modification recommended to prevent falls in a patient with severe osteoarthritis of the knees and hips?",
                "options": [
                    "Installing a stair-lift (or moving the bedroom to the first floor), removing throw rugs, installing walk-in showers with grab bars, and securing handrails on both sides of all stairs",
                    "Applying high-gloss wax to all floors and removing all hallway lighting to prevent glare",
                    "Removing all doors and windows to promote ventilation, and keeping the home completely unlit",
                    "Replacing all furniture with low, soft-cushioned sofas that require deep bending to sit in",
                    "There are no effective home modifications; physical environment has no impact on safety"
                ],
                "answer": 0,
                "exp": "To age in place safely, the home must be adapted to the patient's functional limits. Multi-story homes are high risk; moving living quarters to the first floor or installing a stair-lift prevents stair falls. Bathroom adaptations (walk-in showers, grab bars) and clearing floor clutter are critical."
            }
        ]
    }
]
