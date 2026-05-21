import json
import random

random.seed(42)

topic_slug = 'geri-cardiovascular'

# ============================================================
# Pools of Variables for Randomization
# ============================================================
female_names = [
    "Margaret", "Eleanor", "Dorothy", "Ruth", "Mildred", "Frances", "Elizabeth",
    "Helen", "Alice", "Florence", "Gladys", "Marie", "Lillian", "Evelyn", "Jean",
    "Rose", "Irene", "Shirley", "Hazel", "Gertrude", "Louise", "Grace", "Ruby",
    "Virginia", "Catherine", "Martha", "Edna", "Phyllis", "Clara", "Edith"
]

male_names = [
    "James", "John", "Robert", "William", "Charles", "Thomas", "Walter", "Arthur",
    "Albert", "Harold", "Richard", "Joseph", "Henry", "George", "Edward", "Raymond",
    "Paul", "Donald", "Harry", "Ralph", "Kenneth", "David", "Eugene", "Howard",
    "Frank", "Lawrence", "Herbert", "Roy", "Clarence", "Stanley"
]

genders_pool = [
    {
        "gender": "male",
        "pronoun": "he",
        "pronoun_cap": "He",
        "possessive": "his",
        "possessive_cap": "His",
        "names": male_names
    },
    {
        "gender": "female",
        "pronoun": "she",
        "pronoun_cap": "She",
        "possessive": "her",
        "possessive_cap": "Her",
        "names": female_names
    }
]

ages_pool = list(range(66, 98, 2))
sbp_high_pool = [152, 158, 162, 165, 168, 172, 175, 178, 182, 186]
dbp_normal_pool = [62, 65, 68, 70, 72, 74, 76, 78]
sbp_standing_drop_pool = [22, 25, 28, 30, 32, 35, 38]
dbp_standing_drop_pool = [10, 12, 14, 15]
hr_pool = [68, 72, 76, 78, 80, 82, 84, 88]
ef_preserved_pool = [55, 58, 60, 62, 65, 68, 70]
ef_reduced_pool = [20, 25, 28, 30, 32, 35]
bnp_hfpef_pool = [180, 220, 280, 320, 350, 420]
bnp_hfref_pool = [850, 1200, 1500, 1800, 2200]
ntprobnp_pool = [450, 620, 780, 900, 1100, 1400]
e_eprime_pool = [14, 15, 16, 18, 20]
la_vol_pool = [36, 38, 40, 42, 45]
bmi_pool = [28, 30, 32, 34, 36]
creatinine_pool = [1.2, 1.4, 1.6, 1.8, 2.0]
potassium_pool = [4.8, 5.0, 5.2, 5.4, 5.6]
sodium_pool = [128, 130, 132, 134]
weight_gain_pool = [3, 4, 5, 6, 8]
pulse_pressure_pool = [72, 78, 82, 86, 90, 95, 100]
duration_months_pool = [3, 4, 6, 8, 12]
duration_years_pool = [2, 3, 5, 8, 10]
alpha_blockers_pool = ["doxazosin", "prazosin", "terazosin"]
thiazide_pool = ["chlorthalidone", "hydrochlorothiazide", "indapamide"]
ccb_pool = ["amlodipine", "nifedipine extended-release"]
acei_pool = ["lisinopril", "enalapril", "ramipril", "benazepril"]
arb_pool = ["losartan", "valsartan", "candesartan", "irbesartan"]
sglt2i_pool = ["empagliflozin", "dapagliflozin"]
loop_diuretic_pool = ["furosemide", "bumetanide", "torsemide"]
bb_pool = ["metoprolol succinate", "carvedilol", "bisoprolol"]
mra_pool = ["spironolactone", "eplerenone"]
nitrate_pool = ["isosorbide mononitrate", "isosorbide dinitrate", "nitroglycerin sublingual"]
antihtn_count_pool = [3, 4, 5]

# ============================================================
# 40 UNIQUE TEMPLATES — Geriatrics: Cardiovascular in elderly
# ============================================================
templates = [
    # ===== ISOLATED SYSTOLIC HYPERTENSION (Templates 1-15) =====
    # T1: ISH Pathophysiology - Arterial Stiffness
    {
        "q": "A {age}-year-old {gender} named {name} presents for a routine health maintenance visit. Blood pressure is {sbp_high}/{dbp_normal} mmHg on three separate measurements. The pulse pressure is calculated at {pulse_pressure} mmHg. What is the primary pathophysiological mechanism underlying isolated systolic hypertension (ISH) in older adults?",
        "options": [
            "Progressive loss of elastin fibers and increased collagen deposition in the aortic wall and large conduit arteries, leading to arterial stiffness, reduced Windkessel function, and augmented systolic pressure with preserved or decreased diastolic pressure",
            "Excessive renin secretion by the juxtaglomerular apparatus leading to angiotensin II-mediated vasoconstriction of the peripheral resistance arterioles",
            "Primary aldosteronism causing sodium and water retention with proportional elevation of both systolic and diastolic pressures",
            "Increased cardiac output from hyperthyroidism-induced tachycardia and elevated stroke volume",
            "Bilateral renal artery stenosis causing renovascular hypertension with equal elevation of systolic and diastolic blood pressures"
        ],
        "answer": 0,
        "exp": "**Isolated systolic hypertension (ISH)** is the most common form of hypertension in adults over 60. The primary pathophysiology is **age-related arterial stiffening** due to: (1) **Loss of elastin fibers** and replacement by **collagen** in the aortic media, (2) **Calcification of the arterial wall** (arteriosclerosis), and (3) **Endothelial dysfunction** with reduced nitric oxide bioavailability. The aorta normally acts as a Windkessel (elastic reservoir), expanding during systole and recoiling during diastole to maintain continuous flow. With stiffening, the aorta loses this buffering capacity, resulting in **elevated systolic pressure** (augmented forward wave) and **decreased or unchanged diastolic pressure** (loss of elastic recoil), thereby **widening the pulse pressure**. (Ref: Hazzard's Ch. 37; ACC/AHA 2017 Hypertension Guidelines; UWorld Step 2 CK)"
    },
    # T2: ISH Definition & Classification
    {
        "q": "A {age}-year-old {gender} named {name} has blood pressure readings of {sbp_high}/{dbp_normal} mmHg confirmed on three clinic visits. According to the 2017 ACC/AHA Hypertension Guidelines, which of the following correctly classifies this patient's blood pressure and defines isolated systolic hypertension?",
        "options": [
            "Stage 2 hypertension (SBP >= 140 mmHg); isolated systolic hypertension is defined as SBP >= 130 mmHg with DBP < 80 mmHg, and it is the predominant pattern of hypertension in adults over 60 years of age",
            "Normal blood pressure; no treatment is indicated because diastolic pressure is within normal limits",
            "Hypertensive urgency requiring immediate hospitalization and intravenous nitroprusside infusion",
            "White coat hypertension; the elevated systolic reading is attributable to the clinic environment and the diastolic value confirms this",
            "Prehypertension with no cardiovascular risk; observation alone for 5 years before initiating any therapy"
        ],
        "answer": 0,
        "exp": "Per the **2017 ACC/AHA Hypertension Guidelines**: Normal BP is < 120/80, Elevated BP is 120-129/<80, Stage 1 HTN is 130-139 or 80-89, and **Stage 2 HTN is >= 140 or >= 90**. **Isolated systolic hypertension (ISH)** is specifically defined as **SBP >= 130 mmHg with DBP < 80 mmHg**. ISH is the **predominant hypertension pattern in adults over age 60**, affecting over 65% of hypertensive older adults. The widened pulse pressure (SBP - DBP) reflects arterial stiffness. ISH confers significant cardiovascular risk, including stroke, myocardial infarction, heart failure, and chronic kidney disease, and **must be treated**. (Ref: ACC/AHA 2017 HTN Guidelines; Hazzard's Ch. 37; Master the Boards Step 2 CK)"
    },
    # T3: Pulse Pressure Significance
    {
        "q": "A {age}-year-old {gender} named {name} with isolated systolic hypertension has a blood pressure of {sbp_high}/{dbp_normal} mmHg, yielding a pulse pressure of {pulse_pressure} mmHg. Which of the following statements regarding pulse pressure in older adults is most accurate?",
        "options": [
            "An elevated pulse pressure (> 60 mmHg) is an independent predictor of cardiovascular events including stroke, myocardial infarction, and heart failure, and reflects the degree of large-artery (aortic) stiffness",
            "Pulse pressure is clinically irrelevant and has no independent prognostic value beyond systolic and diastolic pressures individually",
            "A pulse pressure above 40 mmHg is protective against coronary artery disease because it ensures adequate coronary perfusion during diastole",
            "Elevated pulse pressure is exclusively caused by aortic valve regurgitation and has no association with age-related vascular changes",
            "Lowering pulse pressure below 20 mmHg is the primary therapeutic goal in geriatric hypertension management"
        ],
        "answer": 0,
        "exp": "**Pulse pressure (PP = SBP - DBP)** is an important independent cardiovascular risk marker in older adults. A normal resting PP is approximately 40 mmHg. In ISH, the PP is characteristically **widened (often > 60-80 mmHg)** due to arterial stiffening. Elevated PP independently predicts: (1) **Stroke**, (2) **Myocardial infarction**, (3) **Heart failure**, (4) **All-cause mortality**, and (5) **Aortic root dilation**. The Framingham Heart Study demonstrated that in adults over 60, **pulse pressure was a stronger predictor of coronary heart disease than either systolic or diastolic pressure alone**. (Ref: Framingham Heart Study; Hazzard's Ch. 37; ACC/AHA 2017 Guidelines)"
    },
    # T4: First-Line Pharmacotherapy for ISH
    {
        "q": "A {age}-year-old {gender} named {name} is diagnosed with isolated systolic hypertension (BP {sbp_high}/{dbp_normal} mmHg). {pronoun_cap} has no diabetes, chronic kidney disease, or heart failure. After counseling on lifestyle modifications (DASH diet, sodium restriction, exercise), which of the following pharmacological agents is the most appropriate first-line therapy?",
        "options": [
            "A thiazide or thiazide-like diuretic (e.g., {thiazide}) or a long-acting dihydropyridine calcium channel blocker (e.g., {ccb}); both have the strongest evidence for reducing cardiovascular events in older adults with ISH",
            "A short-acting beta-blocker (e.g., propranolol) as first-line monotherapy because it directly reduces arterial stiffness",
            "An alpha-1 adrenergic blocker (e.g., {alpha_blocker}) as first-line because it selectively reduces systolic pressure without affecting diastolic pressure",
            "A centrally acting alpha-2 agonist (e.g., clonidine) as the preferred agent due to its favorable side-effect profile in the elderly",
            "A direct renin inhibitor (e.g., aliskiren) combined with an ACE inhibitor for synergistic blockade of the RAAS system"
        ],
        "answer": 0,
        "exp": "For **isolated systolic hypertension in older adults without compelling indications** (diabetes, CKD, heart failure), the strongest evidence-based first-line agents are: (1) **Thiazide or thiazide-like diuretics** (chlorthalidone preferred over HCTZ due to longer duration and superior outcome data from ALLHAT and SHEP trials), and (2) **Long-acting dihydropyridine CCBs** (amlodipine, supported by the Syst-Eur trial). ACE inhibitors and ARBs are also first-line options, especially with compelling indications. **Beta-blockers are NOT recommended as first-line** for uncomplicated ISH in older adults (inferior stroke prevention). Alpha-blockers are associated with orthostatic hypotension and heart failure risk (ALLHAT doxazosin arm). (Ref: ACC/AHA 2017; SHEP Trial; Syst-Eur Trial; ALLHAT; Hazzard's Ch. 37)"
    },
    # T5: BP Targets in Elderly - SPRINT Trial
    {
        "q": "A {age}-year-old {gender} named {name} with isolated systolic hypertension and no history of diabetes or stroke is being managed with {thiazide}. {possessive_cap} current BP is 148/{dbp_normal} mmHg. Regarding blood pressure targets in older adults, which of the following statements best reflects current evidence-based recommendations?",
        "options": [
            "The SPRINT trial demonstrated that intensive BP control (target SBP < 120 mmHg) in adults >= 75 years significantly reduced major cardiovascular events and all-cause mortality compared to standard control (target SBP < 140 mmHg), but with increased rates of hypotension, syncope, acute kidney injury, and electrolyte abnormalities",
            "All older adults should have a BP target of < 160/90 mmHg, as lowering below this threshold provides no additional benefit",
            "Blood pressure should never be treated in adults over 80 years of age because the risks of pharmacotherapy always outweigh the benefits",
            "The only proven benefit of treating ISH in older adults is stroke prevention; there is no mortality benefit regardless of target",
            "The SPRINT trial excluded all patients over age 75, so there is no evidence to guide intensive BP targets in the very elderly"
        ],
        "answer": 0,
        "exp": "The landmark **SPRINT trial (2015)** randomized 9,361 adults (including a prespecified subgroup of 2,636 adults aged >= 75 years, the **SPRINT-SENIOR** cohort) to intensive (SBP < 120 mmHg) vs. standard (SBP < 140 mmHg) blood pressure control. In the >= 75 subgroup, intensive treatment resulted in: (1) **34% reduction in major cardiovascular events** (MI, ACS, stroke, heart failure, CV death), and (2) **33% reduction in all-cause mortality**. However, intensive treatment increased the rates of **hypotension, syncope, acute kidney injury, and electrolyte abnormalities**. These findings support individualized, cautious BP lowering in fit older adults, while balancing the risks of overtreatment in frail patients. (Ref: SPRINT Trial, NEJM 2015; SPRINT-SENIOR, JAMA 2016; ACC/AHA 2017 Guidelines; Hazzard's Ch. 37)"
    },
    # T6: Risks of Aggressive BP Lowering - J-Curve
    {
        "q": "A {age}-year-old {gender} named {name} with isolated systolic hypertension and stable coronary artery disease is on three antihypertensive medications. {possessive_cap} current BP is 108/52 mmHg. {pronoun_cap} reports new-onset dizziness, fatigue, and near-syncopal episodes. Which of the following best describes the risk of excessively lowering diastolic blood pressure in older adults with coronary artery disease?",
        "options": [
            "The J-curve phenomenon: when diastolic BP is lowered below approximately 60-65 mmHg, coronary perfusion pressure decreases (because the coronary arteries fill primarily during diastole), increasing the risk of myocardial ischemia, infarction, and mortality",
            "Low diastolic pressure is always beneficial because it reduces left ventricular afterload and myocardial oxygen demand",
            "Diastolic pressure has no effect on coronary perfusion because the coronary arteries fill exclusively during systole",
            "The J-curve phenomenon only applies to patients under 50 years of age and is irrelevant in geriatric populations",
            "Diastolic BP should be lowered to < 40 mmHg in all elderly patients to maximize tissue oxygen extraction"
        ],
        "answer": 0,
        "exp": "The **J-curve phenomenon** is a critical concept in geriatric cardiology. Coronary arteries are perfused predominantly during **diastole** (when the aortic valve is closed and the myocardium relaxes). In older adults with ISH and widened pulse pressure, aggressive antihypertensive therapy can lower the **diastolic BP excessively** (< 60-65 mmHg), reducing the coronary perfusion pressure gradient and paradoxically **increasing the risk of myocardial ischemia and infarction**. This is especially dangerous in patients with existing coronary artery disease or left ventricular hypertrophy. Clinical wisdom: **treat the systolic, but watch the diastolic**. Most guidelines recommend avoiding DBP < 60 mmHg in patients with CAD. (Ref: Hazzard's Ch. 37; ACC/AHA 2017; Messerli FH et al., JACC 2006; UWorld Step 2 CK)"
    },
    # T7: Pseudohypertension - Osler Maneuver
    {
        "q": "A {age}-year-old {gender} named {name} has consistently elevated clinic blood pressure readings ({sbp_high}/{dbp_normal} mmHg), but {pronoun} has no signs of target organ damage despite {duration_years} years of apparent hypertension. On physical examination, the radial artery remains palpable (though pulseless) after the blood pressure cuff is inflated above the systolic reading. This finding is most consistent with which of the following conditions?",
        "options": [
            "Pseudohypertension due to severe arterial calcification (Monckeberg medial calcific sclerosis); the calcified artery cannot be fully compressed by the cuff, leading to falsely elevated sphygmomanometric readings; the finding described is a positive Osler maneuver",
            "True resistant hypertension requiring the addition of a fourth antihypertensive agent and referral for renal denervation",
            "White coat hypertension confirmed by the normal exam; no further evaluation is needed",
            "Essential hypertension with early end-organ damage masked by compensatory cardiac remodeling",
            "Secondary hypertension due to pheochromocytoma; the palpable artery reflects chronically elevated catecholamine levels"
        ],
        "answer": 0,
        "exp": "**Pseudohypertension** is a condition in which blood pressure measured by standard sphygmomanometry is **falsely elevated** due to **heavily calcified, non-compressible arteries** (Monckeberg medial calcific sclerosis). The stiffened arterial wall requires higher cuff pressures to compress, leading to spuriously high readings. The **Osler maneuver** is a bedside test: inflate the BP cuff above the systolic reading — if the **radial or brachial artery remains palpable** (hardened, cord-like, but pulseless) after cuff occlusion, the test is **positive**, suggesting pseudohypertension. True diagnosis is confirmed by **intra-arterial (direct) blood pressure measurement**, which will show normal pressures. Treating pseudohypertension aggressively causes **dangerous iatrogenic hypotension**. (Ref: Hazzard's Ch. 37; AGS Geriatrics At Your Fingertips; Master the Boards Step 2 CK)"
    },
    # T8: White Coat HTN & Ambulatory BP Monitoring
    {
        "q": "A {age}-year-old {gender} named {name} has office blood pressure readings consistently above 150/80 mmHg across {antihtn_count} clinic visits. However, {possessive} home blood pressure log shows readings consistently below 125/75 mmHg. {pronoun_cap} has no target organ damage. Which of the following is the most appropriate next step to distinguish white coat hypertension from sustained (masked) hypertension?",
        "options": [
            "Order 24-hour ambulatory blood pressure monitoring (ABPM); ABPM is the gold standard for diagnosing white coat hypertension, confirming true mean BP, and identifying nocturnal dipping or non-dipping patterns",
            "Immediately start {thiazide} based on the elevated clinic readings alone, as office BP is always more accurate than home measurements",
            "Dismiss the elevated readings entirely and discontinue monitoring because the patient reports no symptoms",
            "Refer for urgent cardiac catheterization to evaluate for coronary artery disease as the cause of the elevated readings",
            "Prescribe an anxiolytic (benzodiazepine) before each clinic visit to eliminate the white coat effect and obtain a true reading"
        ],
        "answer": 0,
        "exp": "**White coat hypertension (WCH)** occurs in 15-30% of older adults and is defined as elevated BP in the clinical setting (>= 130/80 mmHg) with normal out-of-office BP (< 130/80 by ABPM or < 135/85 by home BP). **24-hour ambulatory blood pressure monitoring (ABPM)** is the **gold standard** for: (1) Diagnosing white coat hypertension (elevated office, normal ambulatory), (2) Detecting **masked hypertension** (normal office, elevated ambulatory — which carries high cardiovascular risk), (3) Evaluating **nocturnal dipping** (normal >= 10% SBP drop at night; non-dipping is an independent CV risk factor). WCH carries lower cardiovascular risk than sustained hypertension, but still requires periodic monitoring. (Ref: ACC/AHA 2017; Hazzard's Ch. 37; UWorld Step 2 CK)"
    },
    # T9: Systolic HTN & Stroke Risk
    {
        "q": "A {age}-year-old {gender} named {name} has a {duration_years}-year history of poorly controlled isolated systolic hypertension (SBP consistently > 160 mmHg). {pronoun_cap} asks about the most serious consequence of untreated ISH. Based on epidemiological evidence, which of the following is the most accurate counseling statement?",
        "options": [
            "Isolated systolic hypertension is the strongest modifiable risk factor for both ischemic and hemorrhagic stroke in older adults; the SHEP trial demonstrated that treating ISH with low-dose chlorthalidone reduced stroke risk by 36%",
            "ISH only increases the risk of hemorrhagic stroke; ischemic stroke risk is determined exclusively by atrial fibrillation status",
            "ISH increases the risk of peripheral vascular disease but has no independent association with cerebrovascular events",
            "Only diastolic hypertension (DBP > 90) confers stroke risk; isolated elevation of systolic pressure is benign",
            "Treatment of ISH in adults over 70 provides no stroke prevention benefit according to all major randomized trials"
        ],
        "answer": 0,
        "exp": "**Isolated systolic hypertension is the strongest modifiable risk factor for stroke** in older adults. The landmark **SHEP (Systolic Hypertension in the Elderly Program) trial** randomized 4,736 adults aged >= 60 with ISH (SBP 160-219, DBP < 90) to low-dose chlorthalidone vs. placebo and demonstrated: (1) **36% reduction in total stroke**, (2) **27% reduction in coronary events**, (3) **32% reduction in heart failure**. Additional trials (Syst-Eur, HYVET) confirmed these benefits across the age spectrum, including the very elderly (> 80 years). Every 10 mmHg reduction in SBP reduces stroke risk by approximately 30-40%. (Ref: SHEP Trial, JAMA 1991; Syst-Eur Trial; HYVET Trial; Hazzard's Ch. 37)"
    },
    # T10: Thiazide Side Effects in Elderly
    {
        "q": "A {age}-year-old {gender} named {name} is started on {thiazide} for isolated systolic hypertension. Two weeks later, {pronoun} presents with confusion, nausea, and a serum sodium of {sodium} mEq/L (reference: 136-145). Which of the following best describes the mechanism of thiazide-induced hyponatremia in older adults and why they are particularly vulnerable?",
        "options": [
            "Thiazides inhibit sodium reabsorption at the Na-Cl cotransporter in the distal convoluted tubule while preserving free water absorption in the collecting duct (via ADH-mediated aquaporin channels); older adults are predisposed due to age-related impaired free water excretion, increased ADH sensitivity, decreased total body water, and lower muscle mass",
            "Thiazides cause massive sodium wasting in the loop of Henle by blocking the Na+/K+/2Cl- cotransporter, identical to loop diuretics",
            "Thiazide-induced hyponatremia is caused by excessive sweating and insensible water losses, not by a renal mechanism",
            "Hyponatremia is only a side effect of loop diuretics and never occurs with thiazide diuretics in clinical practice",
            "Thiazides increase ADH secretion from the posterior pituitary by directly stimulating vasopressin V2 receptors on the renal collecting duct"
        ],
        "answer": 0,
        "exp": "**Thiazide-induced hyponatremia** is one of the most dangerous adverse effects in older adults. Mechanism: Thiazides block the **Na-Cl cotransporter (NCC)** in the **distal convoluted tubule (DCT)**, causing sodium loss. However, unlike loop diuretics (which impair the concentrating mechanism and promote free water excretion), thiazides **preserve the medullary concentration gradient** and **do not impair ADH-mediated free water reabsorption** in the collecting duct. This leads to a **dilutional hyponatremia**. Older adults are especially vulnerable because: (1) **Reduced total body water and lean mass**, (2) **Increased baseline ADH sensitivity**, (3) **Decreased renal free water clearance**, (4) **Concomitant SSRIs or NSAIDs** that worsen SIADH. (Ref: Hazzard's Ch. 37; AGS Beers Criteria 2023; UWorld Step 2 CK)"
    },
    # T11: CCB Choice in ISH
    {
        "q": "A {age}-year-old {gender} named {name} with isolated systolic hypertension is started on amlodipine 5 mg daily. After {duration_months} months, {pronoun} reports bilateral lower-extremity ankle edema. {possessive_cap} BP is now 138/{dbp_normal} mmHg. Renal function and albumin are normal. What is the mechanism of CCB-induced peripheral edema, and what is the most appropriate management?",
        "options": [
            "Dihydropyridine CCBs cause preferential dilation of precapillary arterioles without proportional dilation of postcapillary venules, creating a hydrostatic pressure gradient that forces fluid into the interstitial space; adding an ACE inhibitor or ARB (which dilates the postcapillary venules) can counterbalance this effect and reduce the edema",
            "CCB-induced edema is caused by renal sodium retention and should be treated by adding a loop diuretic and restricting sodium to < 500 mg/day",
            "The edema indicates decompensated heart failure caused by the CCB; discontinue amlodipine immediately and start intravenous dobutamine",
            "CCBs cause allergic angioedema; switch to an ACE inhibitor immediately and administer epinephrine",
            "This is a normal gravitational effect of aging; no treatment adjustment is needed as long as BP is controlled"
        ],
        "answer": 0,
        "exp": "**Dihydropyridine CCB-induced peripheral edema** (amlodipine, nifedipine) is a common dose-dependent side effect affecting 5-30% of patients. The mechanism is **NOT fluid retention** (renal); it is a **hemodynamic redistribution** effect: DHP-CCBs preferentially dilate **precapillary arterioles** without proportional dilation of **postcapillary venules**. This increases the **capillary hydrostatic pressure gradient**, forcing plasma into the interstitial space (dependent edema). Management: (1) **Add an ACE inhibitor or ARB** — these agents dilate the postcapillary venules, restoring the arteriolar-venular balance and reducing the hydrostatic gradient (combination therapy reduces edema by 50-75%), (2) Dose reduction, (3) Switch to a non-DHP CCB or alternative class. (Ref: Hazzard's Ch. 37; Sica DA, Clin Ther 2003; UWorld Step 2 CK)"
    },
    # T12: ACEi/ARB & Hyperkalemia in Elderly
    {
        "q": "A {age}-year-old {gender} named {name} with hypertension, type 2 diabetes, and stage G3b chronic kidney disease (eGFR 38 mL/min) is started on {acei} for renal protection. At a follow-up visit {duration_months} months later, serum potassium is {potassium} mEq/L (reference: 3.5-5.0) and serum creatinine has risen from 1.4 to {creatinine} mg/dL. What is the most appropriate clinical response?",
        "options": [
            "ACE inhibitors reduce aldosterone secretion (via decreased angiotensin II), decreasing potassium excretion in the collecting duct; in elderly patients with CKD (reduced GFR and impaired tubular potassium secretion), this frequently causes hyperkalemia; hold the ACEi if potassium > 5.5 or creatinine rises > 30% from baseline, and recheck in 1-2 weeks",
            "Continue the ACEi at the same dose because mild hyperkalemia is always benign in patients with CKD and does not require monitoring",
            "Double the ACEi dose to enhance renal potassium excretion through increased tubular flow rates",
            "Add an oral potassium supplement to the regimen to prevent hypokalemia, as ACE inhibitors typically cause potassium wasting",
            "Discontinue the ACEi permanently and replace it with an aldosterone receptor antagonist (spironolactone) at maximum dose"
        ],
        "answer": 0,
        "exp": "**ACE inhibitors and ARBs** are renoprotective in diabetic nephropathy and CKD but carry a significant risk of **hyperkalemia** in older adults, especially those with: (1) **Reduced GFR** (impaired renal potassium excretion), (2) **Diabetes** (hyporeninemic hypoaldosteronism/type 4 RTA), (3) **Concurrent potassium-sparing diuretics, NSAIDs, or trimethoprim**. Monitoring protocol: Check **serum potassium and creatinine within 1-2 weeks** of initiation and after dose changes. **Hold the drug if**: potassium > 5.5 mEq/L, or creatinine rises > 30% from baseline (suggests bilateral renal artery stenosis or excessive renal hypoperfusion). (Ref: Hazzard's Ch. 37; AGS Geriatrics At Your Fingertips; KDIGO 2021; UWorld Step 2 CK)"
    },
    # T13: Beta-Blockers NOT First-Line for ISH
    {
        "q": "A {age}-year-old {gender} named {name} with isolated systolic hypertension (BP {sbp_high}/{dbp_normal} mmHg), no heart failure, no coronary artery disease, and no atrial fibrillation is seen in clinic. A colleague recommends starting atenolol as first-line antihypertensive therapy. Which of the following best explains why beta-blockers are NOT recommended as first-line agents for uncomplicated ISH in older adults?",
        "options": [
            "Beta-blockers reduce heart rate and prolong diastolic filling time but do NOT reduce central aortic systolic pressure or arterial stiffness as effectively as thiazides, CCBs, or RAAS inhibitors; the LIFE trial and meta-analyses showed inferior stroke prevention compared to other first-line agents, particularly in older adults",
            "Beta-blockers are too potent at lowering systolic pressure and invariably cause symptomatic hypotension in all elderly patients",
            "Beta-blockers are contraindicated in all patients over 65 regardless of comorbidities",
            "Beta-blockers increase pulse pressure by accelerating heart rate and increasing systolic ejection velocity",
            "Beta-blockers are only indicated for the treatment of asthma and chronic obstructive pulmonary disease in the elderly"
        ],
        "answer": 0,
        "exp": "**Beta-blockers are NOT recommended as first-line therapy for uncomplicated ISH** in older adults. Key reasons: (1) They reduce heart rate and cardiac output but **do not adequately reduce central aortic systolic pressure or arterial stiffness** (the primary pathology in ISH), (2) The **LIFE trial** (losartan vs. atenolol) showed that atenolol was **inferior to losartan for stroke prevention** despite similar brachial BP reduction, (3) **Meta-analyses** (Lindholm et al., Lancet 2005; Wiysonge et al., Cochrane 2017) confirmed that BBs as first-line monotherapy were associated with **worse stroke outcomes** compared to other first-line agents. BBs remain appropriate when there is a **compelling indication** (e.g., post-MI, HFrEF, rate control in AF). (Ref: LIFE Trial; ACC/AHA 2017; Hazzard's Ch. 37; Cochrane Review 2017)"
    },
    # T14: Resistant Hypertension & Aldosterone
    {
        "q": "A {age}-year-old {gender} named {name} has blood pressure of {sbp_high}/{dbp_normal} mmHg despite adherence to maximum-dose {thiazide}, {ccb}, and {acei}. {pronoun_cap} has no identifiable secondary causes on initial workup. What is the most appropriate next step in managing this patient's resistant hypertension?",
        "options": [
            "Add a mineralocorticoid receptor antagonist (e.g., {mra}) as the preferred fourth-line agent; resistant hypertension frequently involves relative aldosterone excess, and the PATHWAY-2 trial demonstrated that spironolactone was the most effective add-on therapy",
            "Discontinue all current medications and restart with a single beta-blocker as monotherapy",
            "Refer for bilateral renal denervation as the immediate next step before trying any additional pharmacotherapy",
            "Add a direct-acting vasodilator (hydralazine) at maximum dose without monitoring for reflex tachycardia",
            "Increase the thiazide dose to 10 times the recommended maximum to overcome the resistance"
        ],
        "answer": 0,
        "exp": "**Resistant hypertension** is defined as BP above goal despite optimal doses of >= 3 antihypertensive agents from different classes (ideally including a diuretic), or BP controlled on >= 4 agents. Before diagnosing true resistance, exclude: (1) **Non-adherence** (most common cause), (2) **White coat effect**, (3) **Secondary causes** (primary aldosteronism, renal artery stenosis, pheochromocytoma, obstructive sleep apnea). The **PATHWAY-2 trial** demonstrated that adding **spironolactone** as a fourth agent was significantly more effective than adding bisoprolol, doxazosin, or placebo. This is because **relative aldosterone excess** (even without frank hyperaldosteronism) contributes to sodium retention and volume expansion in many patients with resistant HTN. (Ref: PATHWAY-2 Trial, Lancet 2015; ACC/AHA 2017; Hazzard's Ch. 37)"
    },
    # T15: HYVET Trial - Treating HTN in Very Elderly
    {
        "q": "A {age}-year-old {gender} named {name} has sustained systolic blood pressure of {sbp_high} mmHg. {possessive_cap} family asks whether treating hypertension in someone over 80 is truly beneficial. Which of the following landmark trials specifically addressed this question?",
        "options": [
            "The HYVET (Hypertension in the Very Elderly Trial) randomized adults aged >= 80 with SBP >= 160 mmHg to indapamide (+/- perindopril) vs. placebo and demonstrated a 30% reduction in fatal and non-fatal stroke, 21% reduction in all-cause mortality, and 64% reduction in heart failure",
            "The ALLHAT trial, which only enrolled patients aged 55-65 and showed no benefit of any antihypertensive class",
            "The SPRINT trial excluded all patients over 75, so no evidence exists for this age group",
            "The Framingham Heart Study, which concluded that hypertension treatment is harmful in all adults over 75",
            "The ACCORD trial, which specifically studied blood pressure targets in octogenarians with type 1 diabetes"
        ],
        "answer": 0,
        "exp": "The **HYVET (Hypertension in the Very Elderly Trial, NEJM 2008)** was a landmark randomized controlled trial that specifically enrolled **3,845 adults aged >= 80 years** with sustained SBP >= 160 mmHg. Patients were randomized to **indapamide SR 1.5 mg (+/- perindopril 2-4 mg)** vs. placebo, targeting a BP of 150/80 mmHg. Results: (1) **30% reduction in fatal and non-fatal stroke**, (2) **21% reduction in all-cause mortality**, (3) **64% reduction in heart failure**, (4) **34% reduction in cardiovascular events**. The trial was stopped early due to the magnitude of benefit. HYVET provided definitive evidence that **treating hypertension in the very elderly (>= 80) is beneficial**, settling a longstanding clinical controversy. (Ref: HYVET Trial, NEJM 2008; Hazzard's Ch. 37; ACC/AHA 2017)"
    },

    # ===== ORTHOSTATIC HYPOTENSION (Templates 16-27) =====
    # T16: Orthostatic Hypotension Definition
    {
        "q": "A {age}-year-old {gender} named {name} presents after a syncopal episode. Supine blood pressure is {sbp_high}/{dbp_normal} mmHg. After standing for 3 minutes, blood pressure drops to {sbp_standing}/{dbp_standing} mmHg. Which of the following correctly defines orthostatic hypotension and its clinical significance in this patient?",
        "options": [
            "Orthostatic hypotension is defined as a sustained reduction of SBP >= 20 mmHg and/or DBP >= 10 mmHg within 3 minutes of standing (or head-up tilt >= 60 degrees); it affects 20-30% of community-dwelling older adults and is a major independent risk factor for falls, syncope, stroke, myocardial infarction, and all-cause mortality",
            "Orthostatic hypotension requires a sustained SBP drop of at least 50 mmHg within 30 seconds of standing to be clinically significant",
            "A blood pressure drop upon standing is a normal physiological response that requires no evaluation in older adults",
            "Orthostatic hypotension is defined exclusively by symptoms (dizziness) and does not require specific blood pressure criteria",
            "Orthostatic hypotension is only relevant in patients under 40 with autonomic neuropathy and has no significance in geriatric medicine"
        ],
        "answer": 0,
        "exp": "**Orthostatic hypotension (OH)** is defined by the **consensus definition (American Autonomic Society/AAN)** as a **sustained reduction in SBP >= 20 mmHg and/or DBP >= 10 mmHg within 3 minutes of standing** (or head-up tilt to >= 60 degrees). OH affects **20-30% of community-dwelling older adults** and **up to 50-60% of frail nursing home residents**. OH is an **independent risk factor** for: (1) Falls and fractures, (2) Syncope, (3) Cognitive decline, (4) Stroke and MI, (5) All-cause mortality. **Measurement technique**: Patient should be supine for >= 5 minutes, then BP measured at 1 minute and 3 minutes of standing. (Ref: Hazzard's Ch. 37 & 55; AGS Geriatrics At Your Fingertips; AAN Consensus Statement; UWorld Step 2 CK)"
    },
    # T17: OH Pathophysiology - Baroreceptor Blunting
    {
        "q": "A {age}-year-old {gender} named {name} has recurrent symptomatic orthostatic hypotension with presyncope and lightheadedness upon standing. {pronoun_cap} has no diabetes, Parkinson's disease, or medications known to cause OH. What is the most likely age-related pathophysiological mechanism contributing to {possessive} orthostatic hypotension?",
        "options": [
            "Age-related blunting of the arterial baroreceptor reflex arc (carotid sinus and aortic arch baroreceptors), combined with decreased beta-1 adrenergic receptor sensitivity in the heart and reduced total blood volume, leading to impaired compensatory heart rate and vasoconstrictor responses to postural change",
            "Excessive parasympathetic tone from vagal nerve hyperactivity, causing profound bradycardia and vasodilation upon standing",
            "Age-related increase in total blood volume causing venous pooling exclusively in the pulmonary vasculature upon standing",
            "Primary adrenal insufficiency (Addison's disease) causing mineralocorticoid deficiency and sodium wasting in all older adults",
            "Chronic dehydration from mandatory age-related anuria (complete cessation of urine production after age 70)"
        ],
        "answer": 0,
        "exp": "The pathophysiology of age-related orthostatic hypotension involves multiple mechanisms: (1) **Baroreceptor blunting**: The carotid sinus and aortic arch baroreceptors become less sensitive with age due to arterial stiffening; they fail to detect the blood pressure drop upon standing and cannot mount an adequate compensatory response. (2) **Decreased beta-1 adrenergic receptor sensitivity**: The heart has a blunted chronotropic (heart rate) response to sympathetic stimulation, limiting the compensatory tachycardia. (3) **Reduced total blood volume**: Older adults have lower plasma volume due to decreased thirst, reduced renal concentrating ability, and diuretic use. (4) **Decreased venous compliance**: Reduced capacity of leg veins to return blood against gravity. (Ref: Hazzard's Ch. 37 & 55; AGS Geriatrics At Your Fingertips; UWorld Step 2 CK)"
    },
    # T18: Medication-Induced Orthostatic Hypotension
    {
        "q": "A {age}-year-old {gender} named {name} with benign prostatic hyperplasia (BPH) was started on {alpha_blocker} {duration_months} months ago. {pronoun_cap} now presents after sustaining a fall upon standing from bed at night. Supine BP is 142/78 mmHg; standing BP at 3 minutes is 108/62 mmHg. Which of the following is the most accurate clinical explanation?",
        "options": [
            "Alpha-1 adrenergic receptor blockers (e.g., doxazosin, prazosin, terazosin) block alpha-1 mediated vascular smooth muscle contraction, impairing the normal sympathetic venoconstriction response to standing and directly causing orthostatic hypotension; they are a leading iatrogenic cause of OH in older men",
            "Alpha-blockers increase aldosterone secretion, causing excessive fluid retention and paradoxical orthostatic hypertension",
            "Alpha-blockers stimulate the parasympathetic nervous system, causing reflex bradycardia and syncope unrelated to blood pressure changes",
            "The fall was caused by BPH-related nocturia, not by the medication; alpha-blockers have no hemodynamic effects",
            "Alpha-blockers only cause orthostatic hypotension in patients under 50 years of age and are hemodynamically safe in older adults"
        ],
        "answer": 0,
        "exp": "**Alpha-1 adrenergic blockers** (doxazosin, prazosin, terazosin) are among the **most common iatrogenic causes of orthostatic hypotension** in older adults, particularly older men treated for BPH. Mechanism: Alpha-1 receptors on **vascular smooth muscle** mediate sympathetically driven venoconstriction and arteriolar vasoconstriction upon standing. Blocking these receptors impairs the compensatory vasoconstrictor response, leading to venous pooling, reduced venous return, decreased cardiac output, and a drop in blood pressure upon standing. The ALLHAT trial also showed that doxazosin increased the risk of **heart failure** compared to chlorthalidone. Tamsulosin (a uroselective alpha-1A blocker) carries lower — but not zero — orthostatic risk. (Ref: Hazzard's Ch. 37; AGS Beers Criteria 2023; ALLHAT Trial; UWorld Step 2 CK)"
    },
    # T19: Post-Prandial Hypotension
    {
        "q": "A {age}-year-old {gender} named {name} residing in an assisted living facility reports dizziness, lightheadedness, and near-syncope approximately 30-60 minutes after eating large meals. Standing blood pressure before meals is normal. Blood pressure measured 45 minutes after lunch shows a decline of {sbp_standing_drop} mmHg from the pre-meal baseline. What is the most likely diagnosis and appropriate management?",
        "options": [
            "Post-prandial hypotension (PPH); defined as a drop in SBP >= 20 mmHg within 2 hours of eating a meal; caused by splanchnic blood pooling during digestion with impaired compensatory baroreceptor and sympathetic responses; management includes smaller, more frequent meals, reducing carbohydrate content, avoiding alcohol with meals, and walking after eating",
            "Acute mesenteric ischemia; the blood pressure drop indicates bowel infarction requiring emergent surgery",
            "Dumping syndrome; this only occurs after gastric surgery and is unrelated to age-related cardiovascular changes",
            "Vasovagal syncope triggered exclusively by emotional distress, not by meals",
            "Reactive hypoglycemia; prescribe high-dose sulfonylurea therapy to maintain post-meal glucose levels"
        ],
        "answer": 0,
        "exp": "**Post-prandial hypotension (PPH)** is defined as a **decline in SBP >= 20 mmHg within 2 hours of eating a meal** (or a fall to < 90 mmHg if pre-meal SBP was >= 100 mmHg). PPH affects **25-40% of institutionalized older adults** and is a major cause of falls, syncope, and cardiovascular events in this population. Pathophysiology: After eating, blood is redistributed to the **splanchnic (mesenteric) vascular bed** to facilitate digestion. In healthy young adults, baroreceptor reflexes compensate by increasing heart rate and peripheral vascular resistance. In older adults, **impaired baroreceptor sensitivity** and **blunted sympathetic responses** prevent adequate compensation. Management: (1) Smaller, more frequent meals, (2) Reduce carbohydrate load (carbs cause the greatest splanchnic vasodilation), (3) Avoid alcohol with meals, (4) Walk after eating, (5) Consider acarbose (slows carbohydrate absorption). (Ref: Hazzard's Ch. 55; AGS Geriatrics At Your Fingertips; UWorld Step 2 CK)"
    },
    # T20: Supine HTN with Orthostatic Hypotension Paradox
    {
        "q": "A {age}-year-old {gender} named {name} with Parkinson's disease has supine blood pressure of {sbp_high}/{dbp_normal} mmHg but experiences symptomatic orthostatic hypotension (SBP drops {sbp_standing_drop} mmHg upon standing). Treating the supine hypertension worsens the orthostatic symptoms, while treating the OH worsens the supine hypertension. Which of the following management strategies best addresses this clinical paradox?",
        "options": [
            "Elevate the head of the bed by 10-20 degrees at night (reverse Trendelenburg position) to reduce nocturnal supine hypertension and natriuresis; administer midodrine only during waking/upright hours (avoid bedtime dosing); and use a short-acting nighttime antihypertensive (e.g., losartan or nitroglycerin patch, removed in the morning) for supine HTN",
            "Aggressively treat the supine hypertension with maximum-dose thiazide and CCB around the clock, accepting worsening orthostatic falls as an unavoidable consequence",
            "Administer midodrine 10 mg at bedtime to raise overnight blood pressure and prevent nocturnal diuresis",
            "Perform bilateral adrenalectomy to eliminate all catecholamine and aldosterone production",
            "Ignore both conditions because they cancel each other out and the net cardiovascular risk is zero"
        ],
        "answer": 0,
        "exp": "The **coexistence of supine hypertension and orthostatic hypotension** is a common and challenging paradox in older adults, especially those with autonomic failure (Parkinson's disease, diabetes, MSA). Management requires a nuanced, time-of-day approach: (1) **Elevate the head of the bed 10-20 degrees** at night — this reduces nocturnal supine hypertension and the resulting pressure natriuresis (overnight urine losses worsen daytime hypovolemia and OH), (2) **Midodrine (alpha-1 agonist)** should be given **only during waking/upright hours** and **never at bedtime** (it will worsen supine HTN), (3) **Short-acting nighttime antihypertensives** (nitroglycerin patch removed in the morning, or short-acting losartan) can control nocturnal supine HTN without worsening morning OH. (Ref: Hazzard's Ch. 55; Freeman R, NEJM 2008; AGS Geriatrics At Your Fingertips)"
    },
    # T21: Non-Pharmacological OH Management
    {
        "q": "A {age}-year-old {gender} named {name} is diagnosed with orthostatic hypotension. Before initiating pharmacotherapy, {possessive} physician recommends non-pharmacological interventions. Which of the following is the most comprehensive and evidence-based set of non-pharmacological strategies?",
        "options": [
            "Adequate fluid intake (2-2.5 L/day unless contraindicated), liberal salt intake (6-10 g/day), waist-high compression stockings (30-40 mmHg) or abdominal binders, rise slowly from supine to sitting to standing, perform counter-pressure maneuvers (leg crossing, squatting), and avoid prolonged standing and hot environments",
            "Severe fluid restriction (< 1 L/day) and a strict low-sodium diet (< 2 g/day) to prevent fluid overload",
            "Immediate bed rest for 2 weeks with complete avoidance of standing or walking to allow baroreceptor recovery",
            "Wearing loose-fitting, low-compression knee-high stockings and avoiding all physical activity",
            "Consuming a single large, high-carbohydrate meal per day to maintain plasma glucose levels and prevent hypotension"
        ],
        "answer": 0,
        "exp": "**Non-pharmacological management** is the foundation of OH treatment and should always be tried first: (1) **Increase fluid intake** to 2-2.5 L/day (bolus water drinking — 500 mL in 5 minutes — can raise SBP by 20-30 mmHg within 15-20 minutes via the osmopressor response), (2) **Liberal salt intake** (6-10 g/day, unless contraindicated by HF), (3) **Compression garments**: waist-high stockings (30-40 mmHg) or abdominal binders are more effective than knee-high stockings because they compress the splanchnic and pelvic venous reservoirs, (4) **Gradual postural changes**: sit on the edge of the bed before standing, (5) **Counter-pressure maneuvers**: leg crossing, toe raising, squatting, and isometric handgrip, (6) **Avoid triggers**: prolonged standing, hot environments, alcohol, large carbohydrate meals. (Ref: Hazzard's Ch. 55; AGS Geriatrics At Your Fingertips; Freeman R, NEJM 2008)"
    },
    # T22: Midodrine for Severe OH
    {
        "q": "A {age}-year-old {gender} named {name} with severe symptomatic orthostatic hypotension (SBP drops {sbp_standing_drop} mmHg on standing) has failed non-pharmacological interventions. {possessive_cap} physician prescribes midodrine. What is the mechanism of action of midodrine, and what is the critical counseling point regarding its administration?",
        "options": [
            "Midodrine is an oral selective alpha-1 adrenergic agonist (prodrug converted to desglymidodrine) that causes peripheral arterial and venous vasoconstriction, raising standing blood pressure; the critical counseling point is that it must NOT be taken within 4 hours of bedtime because it causes dangerous supine hypertension",
            "Midodrine is a beta-2 adrenergic agonist that increases heart rate and cardiac output; it should be taken only at bedtime",
            "Midodrine is a direct renin inhibitor that increases angiotensin II levels; it should be taken with a high-potassium meal",
            "Midodrine is a centrally acting alpha-2 agonist (like clonidine) that reduces sympathetic outflow; it has no timing restrictions",
            "Midodrine is a mineralocorticoid that expands plasma volume by promoting renal sodium retention; it should be taken with potassium supplements"
        ],
        "answer": 0,
        "exp": "**Midodrine** is an FDA-approved **oral selective alpha-1 adrenergic agonist** (prodrug; active metabolite = desglymidodrine) used for the treatment of symptomatic orthostatic hypotension. Mechanism: Activates **alpha-1 receptors** on peripheral **arterial and venous smooth muscle**, causing vasoconstriction that raises both standing and supine blood pressure. Typical dosing: 2.5-10 mg, 2-3 times daily **during waking/upright hours**. **Critical counseling**: (1) **Do NOT take within 4 hours of bedtime** — midodrine causes **supine hypertension**, which can lead to headache, blurred vision, and cardiovascular events during sleep, (2) Monitor supine BP at home, (3) Urinary retention is a contraindication. (Ref: Hazzard's Ch. 55; AGS Geriatrics At Your Fingertips; FDA Prescribing Information)"
    },
    # T23: Fludrocortisone for OH
    {
        "q": "A {age}-year-old {gender} named {name} with neurogenic orthostatic hypotension secondary to diabetic autonomic neuropathy is started on fludrocortisone 0.1 mg daily. Which of the following best describes the mechanism of fludrocortisone and the primary monitoring concern in this elderly patient?",
        "options": [
            "Fludrocortisone is a synthetic mineralocorticoid that promotes renal sodium and water reabsorption in the collecting duct (via epithelial sodium channels, ENaC), expanding plasma volume; the primary monitoring concerns are supine hypertension, hypokalemia, peripheral edema, and worsening of heart failure",
            "Fludrocortisone is a glucocorticoid that suppresses ACTH secretion and reduces cortisol levels, having no effect on blood pressure",
            "Fludrocortisone is an alpha-1 agonist that directly constricts peripheral blood vessels without any effect on renal sodium handling",
            "Fludrocortisone causes renal potassium retention and sodium wasting, requiring potassium restriction and sodium supplementation",
            "Fludrocortisone is a loop diuretic that reduces total blood volume to prevent venous pooling in the lower extremities"
        ],
        "answer": 0,
        "exp": "**Fludrocortisone** (Florinef) is a synthetic **mineralocorticoid** used off-label for orthostatic hypotension. Mechanism: It activates **mineralocorticoid receptors** in the renal collecting duct, upregulating the **epithelial sodium channel (ENaC)** and the **Na+/K+ ATPase**, causing: (1) **Increased sodium and water reabsorption** (expands plasma volume by 10-20%), (2) **Increased potassium excretion** (risk of hypokalemia). Additional mechanism: At higher doses, it sensitizes alpha-1 adrenergic receptors on blood vessels, enhancing the vasoconstrictive response. **Monitoring concerns in elderly**: (1) **Supine hypertension** (worsened by volume expansion), (2) **Hypokalemia**, (3) **Peripheral edema**, (4) **Heart failure exacerbation** (CONTRAINDICATED in patients with HF). (Ref: Hazzard's Ch. 55; AGS Geriatrics At Your Fingertips; Freeman R, NEJM 2008)"
    },
    # T24: Droxidopa for Neurogenic OH
    {
        "q": "A {age}-year-old {gender} named {name} with Parkinson's disease and refractory neurogenic orthostatic hypotension (SBP drops {sbp_standing_drop} mmHg on standing) has failed midodrine and non-pharmacological therapies. {possessive_cap} neurologist prescribes droxidopa. What is the mechanism of action of droxidopa?",
        "options": [
            "Droxidopa (L-threo-3,4-dihydroxyphenylserine) is a synthetic norepinephrine precursor (prodrug) that is converted to norepinephrine by aromatic L-amino acid decarboxylase (DOPA decarboxylase), both peripherally and centrally, directly replenishing the depleted norepinephrine stores in patients with autonomic failure",
            "Droxidopa is a dopamine agonist (like pramipexole) that improves motor function in Parkinson's disease and has no effect on blood pressure",
            "Droxidopa is a selective serotonin reuptake inhibitor (SSRI) that increases serotonin levels in the brainstem cardiovascular centers",
            "Droxidopa is a mineralocorticoid receptor agonist that promotes sodium retention in the renal collecting duct",
            "Droxidopa is a competitive antagonist of acetylcholine at muscarinic M3 receptors, preventing parasympathetic-mediated vasodilation"
        ],
        "answer": 0,
        "exp": "**Droxidopa** (Northera) is FDA-approved for the treatment of **neurogenic orthostatic hypotension** (nOH), particularly in patients with **Parkinson's disease, multiple system atrophy (MSA), and pure autonomic failure**. Mechanism: Droxidopa is a **synthetic amino acid precursor of norepinephrine**. It is converted to **norepinephrine** by the enzyme **aromatic L-amino acid decarboxylase (DOPA decarboxylase)**, bypassing the rate-limiting step of dopamine beta-hydroxylase. This directly **replenishes depleted norepinephrine stores** at peripheral sympathetic nerve terminals and in the CNS, restoring the sympathetic vasoconstrictive response to standing. Unlike midodrine (which acts on alpha-1 receptors), droxidopa provides the actual neurotransmitter. (Ref: Hazzard's Ch. 55; Kaufmann H et al., Neurology 2014; FDA Prescribing Information)"
    },
    # T25: OH Screening in Falls Assessment
    {
        "q": "A {age}-year-old {gender} named {name} presents after a mechanical fall at home. {pronoun_cap} tripped on a rug while walking to the bathroom at night. As part of the comprehensive geriatric falls assessment, when should orthostatic blood pressure be routinely measured?",
        "options": [
            "Orthostatic blood pressure measurement should be performed in ALL older adults who present with falls, syncope, presyncope, or dizziness, and routinely at health assessments in those aged >= 65; it should also be checked after starting or adjusting any antihypertensive, diuretic, vasodilator, or psychotropic medication",
            "Orthostatic blood pressure should only be measured in patients with a confirmed diagnosis of Parkinson's disease or multiple system atrophy",
            "Orthostatic blood pressure is only relevant in hospitalized patients and should never be measured in the outpatient setting",
            "Orthostatic blood pressure testing is obsolete and has been replaced entirely by 24-hour ambulatory blood pressure monitoring",
            "Orthostatic blood pressure should only be measured if the patient explicitly reports positional dizziness; falls alone are not an indication"
        ],
        "answer": 0,
        "exp": "**Orthostatic BP measurement is a critical component of the comprehensive geriatric falls assessment** and should be performed in: (1) **ALL older adults presenting with falls, syncope, presyncope, lightheadedness, or unexplained weakness**, (2) **Routine health assessments in adults >= 65**, (3) **After initiation or dose adjustment** of any medication that can cause OH (antihypertensives, diuretics, alpha-blockers, nitrates, tricyclic antidepressants, antipsychotics, opioids, dopaminergic agents), (4) **Hospital admission and discharge** assessments. Technique: Supine BP after 5 minutes rest, then standing BP at 1 minute and 3 minutes. Note that OH can be **asymptomatic** in up to 50% of affected older adults (especially those with cognitive impairment). (Ref: AGS/BGS Fall Prevention Guidelines 2022; Hazzard's Ch. 55; AGS Geriatrics At Your Fingertips)"
    },
    # T26: Tilt-Table Testing
    {
        "q": "A {age}-year-old {gender} named {name} has recurrent unexplained syncope. Bedside orthostatic blood pressure measurements have been inconclusive. Which of the following is the most appropriate next diagnostic test to evaluate for orthostatic or vasovagal mechanisms of syncope?",
        "options": [
            "Head-up tilt-table testing; the patient is tilted to 60-70 degrees for up to 45 minutes while continuous BP and heart rate are monitored, with optional isoproterenol or nitroglycerin provocation to unmask vasovagal or orthostatic mechanisms",
            "Coronary angiography to evaluate for critical coronary artery stenosis as the cause of recurrent syncope",
            "24-hour Holter monitor as the definitive test for all forms of syncope including orthostatic hypotension",
            "Lumbar puncture to measure cerebrospinal fluid pressure and rule out normal pressure hydrocephalus as the cause of syncope",
            "Carotid duplex ultrasound to evaluate for carotid artery stenosis as the primary cause of orthostatic syncope"
        ],
        "answer": 0,
        "exp": "**Head-up tilt-table testing** is the gold standard provocative test for evaluating **unexplained recurrent syncope** when bedside orthostatic measurements are inconclusive. Protocol: (1) Patient lies supine for 20 minutes on a motorized table, (2) Table is tilted to **60-70 degrees** (simulating standing), (3) Continuous beat-to-beat BP and heart rate are monitored for up to **45 minutes**, (4) Optional pharmacological provocation with sublingual nitroglycerin or IV isoproterenol. Positive results: (1) **Vasovagal syncope (neurocardiogenic)**: sudden bradycardia and/or hypotension with reproduction of symptoms, (2) **Orthostatic hypotension**: sustained progressive BP drop meeting criteria, (3) **POTS (postural orthostatic tachycardia syndrome)**: HR increase >= 30 bpm without significant BP drop. (Ref: Hazzard's Ch. 55; ESC Syncope Guidelines 2018; UWorld Step 2 CK)"
    },
    # T27: Diabetic Autonomic Neuropathy & OH
    {
        "q": "A {age}-year-old {gender} named {name} with a {duration_years}-year history of poorly controlled type 2 diabetes mellitus (HbA1c 9.2%) presents with chronic orthostatic hypotension, gastroparesis, and erectile dysfunction (if male) / urinary retention (if female). What is the unifying diagnosis, and what is the underlying mechanism?",
        "options": [
            "Diabetic autonomic neuropathy; chronic hyperglycemia causes oxidative stress, accumulation of advanced glycation end-products (AGEs), and polyol pathway activation, leading to progressive degeneration of small unmyelinated autonomic nerve fibers (C-fibers) in the sympathetic and parasympathetic nervous systems",
            "Diabetic ketoacidosis; acute insulin deficiency causing osmotic dehydration, which resolves completely with fluid resuscitation",
            "Hypothyroidism; thyroid hormone deficiency causing global autonomic dysfunction and requires levothyroxine replacement",
            "Vitamin B12 deficiency; subacute combined degeneration of the dorsal columns and corticospinal tracts",
            "Pheochromocytoma; episodic catecholamine surges causing paroxysmal hypertension alternating with orthostatic hypotension"
        ],
        "answer": 0,
        "exp": "**Diabetic autonomic neuropathy (DAN)** is a common and underdiagnosed complication of long-standing, poorly controlled diabetes. It affects the **small unmyelinated C-fibers** of both the **sympathetic and parasympathetic nervous systems**. Pathophysiology: (1) **Oxidative stress** from chronic hyperglycemia, (2) **Advanced glycation end-products (AGEs)** damaging nerve fibers and vasa nervorum, (3) **Polyol pathway activation** (sorbitol accumulation causing osmotic nerve injury). Clinical manifestations include: **Cardiovascular** (orthostatic hypotension, resting tachycardia, exercise intolerance), **Gastrointestinal** (gastroparesis, constipation, diarrhea), **Genitourinary** (neurogenic bladder, erectile dysfunction), **Sudomotor** (anhidrosis of feet, gustatory sweating). (Ref: Hazzard's Ch. 55; ADA Standards of Care 2024; UWorld Step 2 CK)"
    },

    # ===== HFpEF - Heart Failure with Preserved Ejection Fraction (Templates 28-40) =====
    # T28: HFpEF Definition & Diagnostic Criteria
    {
        "q": "A {age}-year-old {gender} named {name} presents with progressive exertional dyspnea, bilateral lower-extremity edema, and paroxysmal nocturnal dyspnea over the past {duration_months} months. Echocardiography reveals a left ventricular ejection fraction (LVEF) of {ef_preserved}%, increased left ventricular wall thickness (concentric hypertrophy), elevated E/e' ratio of {e_eprime}, and enlarged left atrial volume index of {la_vol} mL/m2. NT-proBNP is {ntprobnp} pg/mL. What is the most likely diagnosis?",
        "options": [
            "Heart failure with preserved ejection fraction (HFpEF); defined as clinical heart failure symptoms and signs with LVEF >= 50%, evidence of diastolic dysfunction (elevated E/e' ratio, enlarged left atrium), and elevated natriuretic peptides (BNP or NT-proBNP)",
            "Heart failure with reduced ejection fraction (HFrEF); defined as LVEF <= 40% with systolic pump failure",
            "Acute pulmonary embolism causing right heart strain with preserved left ventricular function",
            "Restrictive cardiomyopathy caused exclusively by cardiac amyloidosis with no diastolic dysfunction",
            "Constrictive pericarditis causing equalization of diastolic pressures in all four cardiac chambers"
        ],
        "answer": 0,
        "exp": "**HFpEF (Heart failure with preserved ejection fraction)** accounts for approximately **50% of all heart failure** and is the **predominant form in older adults**. Diagnostic criteria (2022 AHA/ACC/HFSA Guidelines): (1) **Clinical symptoms and signs** of heart failure (dyspnea, edema, orthopnea, PND), (2) **LVEF >= 50%** on echocardiography, (3) **Objective evidence of diastolic dysfunction**: elevated **E/e' ratio** (>= 14 suggests elevated LV filling pressures), enlarged **left atrial volume index** (> 34 mL/m2), and (4) **Elevated natriuretic peptides** (BNP > 35 pg/mL or NT-proBNP > 125 pg/mL). HFpEF is distinct from HFrEF (LVEF <= 40%), which represents systolic pump failure. (Ref: 2022 AHA/ACC/HFSA HF Guidelines; Hazzard's Ch. 38; UWorld Step 2 CK)"
    },
    # T29: HFpEF Pathophysiology
    {
        "q": "A {age}-year-old {gender} named {name} is diagnosed with HFpEF. {possessive_cap} echocardiogram shows concentric left ventricular hypertrophy with preserved systolic function but impaired relaxation. What is the primary pathophysiological mechanism underlying HFpEF?",
        "options": [
            "Impaired left ventricular diastolic relaxation and increased passive myocardial stiffness (due to LV hypertrophy, myocardial fibrosis, and titin isoform changes), leading to elevated LV filling pressures, left atrial hypertension, pulmonary congestion, and exercise intolerance, despite normal systolic ejection",
            "Severe systolic contractile failure with a markedly dilated, thin-walled left ventricle and global hypokinesis",
            "Primary mitral valve regurgitation causing volume overload and eccentric left ventricular dilation",
            "Right ventricular failure due to chronic pulmonary embolism (cor pulmonale) with no involvement of the left ventricle",
            "Cardiac tamponade from pericardial effusion compressing all four cardiac chambers equally"
        ],
        "answer": 0,
        "exp": "The hallmark pathophysiology of **HFpEF** is **diastolic dysfunction** — the left ventricle contracts normally (preserved EF) but **cannot relax and fill adequately during diastole**. Key mechanisms: (1) **Impaired active relaxation**: the myocardium fails to relax normally during early diastole (due to abnormal calcium reuptake by SERCA2a), (2) **Increased passive stiffness**: due to **concentric LV hypertrophy** (from chronic HTN), **myocardial interstitial fibrosis** (collagen deposition), and **titin isoform switching** (from the compliant N2BA to the stiff N2B isoform). Consequences: (3) Elevated LV end-diastolic pressure → (4) Elevated left atrial pressure → (5) **Pulmonary venous congestion** (dyspnea, orthopnea) and (6) Reduced cardiac output during exercise (exercise intolerance). (Ref: Hazzard's Ch. 38; Borlaug BA, JACC 2014; UWorld Step 2 CK)"
    },
    # T30: HFpEF Epidemiology & Risk Factors
    {
        "q": "A {age}-year-old {gender} named {name} with a BMI of {bmi} kg/m2, long-standing hypertension, type 2 diabetes mellitus, and atrial fibrillation is diagnosed with HFpEF. Which of the following statements most accurately describes the epidemiology and risk factor profile of HFpEF?",
        "options": [
            "HFpEF predominantly affects older women and is strongly associated with hypertension, obesity, diabetes mellitus, atrial fibrillation, and chronic kidney disease; it accounts for approximately 50% of all heart failure hospitalizations and carries a 5-year mortality rate of 50-75%",
            "HFpEF exclusively affects young, athletic males under 40 and is caused solely by genetic cardiomyopathy mutations",
            "HFpEF is a benign condition with normal life expectancy and no associated morbidity if ejection fraction is preserved",
            "HFpEF has no known risk factors and occurs randomly in the general population without any demographic predilection",
            "HFpEF only occurs in patients who have previously had HFrEF and have recovered their ejection fraction after treatment"
        ],
        "answer": 0,
        "exp": "**HFpEF epidemiology** reveals a distinctive patient profile: (1) **Older age** (mean age at diagnosis > 70 years), (2) **Female predominance** (60-70%), (3) **Obesity** (BMI > 30 in > 80%), (4) **Hypertension** (most common comorbidity, present in > 80%), (5) **Type 2 diabetes mellitus** (40-50%), (6) **Atrial fibrillation** (50-65%), (7) **Chronic kidney disease**. HFpEF accounts for approximately **50% of all HF hospitalizations** and carries a substantial **5-year mortality rate of 50-75%**, comparable to HFrEF. Unlike HFrEF, where neurohormonal therapies (ACEi, BB, MRA) dramatically improve survival, until recently there were **no proven mortality-reducing therapies** for HFpEF. (Ref: 2022 AHA/ACC/HFSA HF Guidelines; Hazzard's Ch. 38; Dunlay SM et al., Nat Rev Cardiol 2017)"
    },
    # T31: BNP/NT-proBNP in HFpEF
    {
        "q": "A {age}-year-old {gender} named {name} with suspected heart failure has a BNP level of {bnp_hfpef} pg/mL. {possessive_cap} LVEF is {ef_preserved}%. A colleague states that the BNP is 'not high enough' to diagnose heart failure. Which of the following is the most accurate interpretation?",
        "options": [
            "Natriuretic peptide levels in HFpEF are often lower than in HFrEF because the LV is smaller (concentric hypertrophy) and wall stress is less than in a dilated, volume-overloaded ventricle; a BNP > 35 pg/mL or NT-proBNP > 125 pg/mL still supports the diagnosis in the correct clinical context, especially when combined with echocardiographic evidence of diastolic dysfunction",
            "A BNP below 500 pg/mL always excludes heart failure regardless of the clinical presentation, ejection fraction, or echocardiographic findings",
            "BNP levels are always higher in HFpEF than in HFrEF because diastolic dysfunction generates more myocardial wall stress than systolic dysfunction",
            "BNP is only elevated in HFrEF and has no diagnostic utility in HFpEF; the test should not be ordered if LVEF is >= 50%",
            "Obesity does not affect BNP levels, and the standard cutoffs apply universally regardless of body mass index"
        ],
        "answer": 0,
        "exp": "**Natriuretic peptide levels in HFpEF are characteristically LOWER than in HFrEF.** Reasons: (1) BNP/NT-proBNP secretion is proportional to **myocardial wall stress** (LaPlace's law: wall stress = [pressure × radius] / [2 × wall thickness]). In HFpEF, the LV has **concentric hypertrophy** (thick walls, small cavity), so wall stress is relatively low despite high filling pressures. In HFrEF, the LV is dilated (large radius, thin walls), generating much higher wall stress. (2) **Obesity** (common in HFpEF) independently suppresses BNP levels (adipose tissue expresses neprilysin, which degrades BNP). Therefore, **normal or mildly elevated BNP does NOT exclude HFpEF**, and clinicians must integrate clinical presentation, echocardiography, and biomarkers. (Ref: 2022 AHA/ACC/HFSA HF Guidelines; Hazzard's Ch. 38; Maisel AS et al., JACC 2017)"
    },
    # T32: Echocardiographic Findings in HFpEF
    {
        "q": "A {age}-year-old {gender} named {name} with exertional dyspnea and preserved LVEF ({ef_preserved}%) undergoes a comprehensive echocardiogram. Which of the following echocardiographic parameters is most useful for estimating left ventricular filling pressures and supporting a diagnosis of HFpEF?",
        "options": [
            "The E/e' ratio (ratio of mitral inflow E-wave velocity to tissue Doppler e' velocity at the mitral annulus); an E/e' ratio >= 14 suggests elevated LV filling pressures, and combined with enlarged left atrial volume index (> 34 mL/m2) and elevated tricuspid regurgitation velocity (> 2.8 m/s), strongly supports diastolic dysfunction",
            "The left ventricular internal diameter in diastole (LVIDd); a normal LVIDd confirms normal diastolic function regardless of filling pressures",
            "The aortic valve area calculated by the continuity equation; aortic stenosis is the sole cause of diastolic dysfunction in older adults",
            "The right ventricular systolic pressure estimated by tricuspid regurgitation velocity; this is only relevant for diagnosing pulmonary embolism",
            "The inferior vena cava (IVC) diameter alone; an IVC < 2.1 cm with respiratory variation definitively excludes HFpEF"
        ],
        "answer": 0,
        "exp": "The **E/e' ratio** is the single most important non-invasive echocardiographic parameter for estimating **LV filling pressures** in suspected HFpEF. **E wave**: early diastolic mitral inflow velocity (reflects the pressure gradient between LA and LV). **e' velocity**: early diastolic mitral annular velocity on tissue Doppler (reflects myocardial relaxation). Interpretation: (1) **E/e' < 8**: normal LV filling pressures, (2) **E/e' 8-14**: indeterminate (need additional criteria), (3) **E/e' >= 14**: elevated LV filling pressures (suggests diastolic dysfunction). Additional supporting criteria: **Enlarged LA volume index > 34 mL/m2** (reflects chronic elevation of LA pressure), **Tricuspid regurgitation velocity > 2.8 m/s** (reflects elevated pulmonary artery systolic pressure). (Ref: ASE/EACVI 2016 Guidelines; 2022 AHA/ACC/HFSA; Hazzard's Ch. 38)"
    },
    # T33: Diuretics for Congestion in HFpEF
    {
        "q": "A {age}-year-old {gender} named {name} with HFpEF (LVEF {ef_preserved}%) presents with worsening dyspnea, orthopnea, bilateral lower-extremity edema, and weight gain of {weight_gain} lbs over the past week. Which of the following is the most appropriate initial pharmacological management of the acute congestion?",
        "options": [
            "Intravenous or oral loop diuretics (e.g., {loop_diuretic}) are the cornerstone of congestion management in HFpEF; they reduce preload by promoting sodium and water excretion, alleviating pulmonary and peripheral edema; however, they must be titrated carefully to avoid excessive volume depletion, hypotension, and prerenal azotemia",
            "Start high-dose beta-blocker therapy (metoprolol 200 mg daily) to reduce heart rate and improve diastolic filling time as the primary treatment for acute congestion",
            "Administer intravenous dobutamine to increase cardiac contractility and improve ejection fraction",
            "Prescribe a high-sodium diet (> 6 g/day) to increase intravascular volume and improve cardiac output",
            "Initiate continuous positive airway pressure (CPAP) as the sole therapy for HFpEF-related congestion without any diuretics"
        ],
        "answer": 0,
        "exp": "**Loop diuretics** are the **mainstay of congestion management** in ALL forms of heart failure, including HFpEF. In HFpEF, the primary symptom is **volume overload** (dyspnea, edema, weight gain) due to elevated LV filling pressures. Diuretics reduce **preload** by promoting renal sodium and water excretion, thereby: (1) Reducing pulmonary venous pressure (relieving dyspnea and orthopnea), (2) Reducing peripheral edema, (3) Reducing left atrial pressure (improving diastolic filling). **Important caveats in HFpEF**: These patients are highly **preload-sensitive** — the stiff, non-compliant ventricle depends on adequate filling pressure to maintain stroke volume. Over-diuresis can cause: (1) **Hypotension**, (2) **Prerenal AKI**, (3) **Reduced cardiac output**. Therefore, diuretics must be carefully titrated to the **lowest effective dose**. (Ref: 2022 AHA/ACC/HFSA HF Guidelines; Hazzard's Ch. 38; UWorld Step 2 CK)"
    },
    # T34: SGLT2 Inhibitors in HFpEF
    {
        "q": "A {age}-year-old {gender} named {name} with HFpEF (LVEF {ef_preserved}%) is being optimized on diuretics but continues to have recurrent hospitalizations. {possessive_cap} physician adds {sglt2i} to the regimen. Which of the following best describes the evidence supporting SGLT2 inhibitors in HFpEF?",
        "options": [
            "The EMPEROR-Preserved trial (empagliflozin) and the DELIVER trial (dapagliflozin) both demonstrated significant reductions in the composite endpoint of cardiovascular death or heart failure hospitalization in patients with HFpEF, making SGLT2 inhibitors the first drug class with robust evidence across the full spectrum of LVEF",
            "SGLT2 inhibitors are contraindicated in HFpEF because they cause excessive dehydration and hypotension in patients with diastolic dysfunction",
            "SGLT2 inhibitors only benefit patients with type 2 diabetes and have no cardiovascular effects in non-diabetic HFpEF patients",
            "SGLT2 inhibitors improve ejection fraction from 60% to 80%, converting HFpEF into a hyperdynamic state",
            "The PARAGON-HF trial proved that SGLT2 inhibitors are harmful in HFpEF and increase all-cause mortality"
        ],
        "answer": 0,
        "exp": "**SGLT2 inhibitors** are now the **first and only drug class with robust clinical trial evidence** for reducing heart failure outcomes in HFpEF. Key trials: (1) **EMPEROR-Preserved (empagliflozin, NEJM 2021)**: Reduced the composite of cardiovascular death or HF hospitalization by **21%** in patients with LVEF > 40% (including HFpEF), regardless of diabetes status. (2) **DELIVER (dapagliflozin, NEJM 2022)**: Reduced the same composite endpoint by **18%** in HFpEF (LVEF > 40%), also regardless of diabetes. These results, combined with prior HFrEF data (DAPA-HF, EMPEROR-Reduced), establish SGLT2 inhibitors as beneficial **across the entire LVEF spectrum**. Mechanisms: osmotic diuresis, natriuresis, reduced preload, improved myocardial energetics (ketone body utilization), anti-fibrotic effects. (Ref: EMPEROR-Preserved, NEJM 2021; DELIVER, NEJM 2022; 2022 AHA/ACC/HFSA Guidelines)"
    },
    # T35: Spironolactone in HFpEF - TOPCAT Trial
    {
        "q": "A {age}-year-old {gender} named {name} with HFpEF (LVEF {ef_preserved}%) asks about the role of {mra} in {possessive} condition. Which of the following best summarizes the evidence from the TOPCAT trial regarding spironolactone in HFpEF?",
        "options": [
            "The TOPCAT trial showed that spironolactone did not significantly reduce the primary composite endpoint of cardiovascular death, cardiac arrest, or HF hospitalization in the overall HFpEF population; however, regional subgroup analyses (Americas cohort) suggested potential benefit, and spironolactone may reduce HF hospitalizations; the 2022 guidelines give it a Class 2b recommendation for selected HFpEF patients",
            "The TOPCAT trial conclusively proved that spironolactone reduces all-cause mortality by 50% in HFpEF and is now a Class I recommendation",
            "Spironolactone is absolutely contraindicated in HFpEF because it worsens diastolic dysfunction by promoting myocardial fibrosis",
            "The TOPCAT trial demonstrated that eplerenone (not spironolactone) was the only effective MRA in HFpEF",
            "The TOPCAT trial was never completed and provides no evidence regarding MRA therapy in HFpEF"
        ],
        "answer": 0,
        "exp": "The **TOPCAT (Treatment of Preserved Cardiac Function Heart Failure with an Aldosterone Antagonist) trial** was a large RCT (3,445 patients) testing **spironolactone vs. placebo** in HFpEF (LVEF >= 45%). Overall results: Spironolactone **did NOT significantly reduce** the primary composite endpoint (CV death, cardiac arrest, or HF hospitalization; HR 0.89, p = 0.14). However: (1) **Regional heterogeneity**: The Americas cohort showed a significant benefit (HR 0.82), while the Russia/Georgia cohort showed no benefit (suspected enrollment and adherence issues). (2) Spironolactone reduced **HF hospitalizations** as a secondary endpoint. (3) The **2022 AHA/ACC/HFSA Guidelines** give spironolactone a **Class 2b recommendation** ('may be reasonable') for selected HFpEF patients to reduce hospitalizations. (Ref: TOPCAT Trial, NEJM 2014; 2022 AHA/ACC/HFSA HF Guidelines; Hazzard's Ch. 38)"
    },
    # T36: Volume Management in HFpEF
    {
        "q": "A {age}-year-old {gender} named {name} with HFpEF (LVEF {ef_preserved}%) has been stable on {loop_diuretic} but presents with acute decompensation (dyspnea at rest, SpO2 91%, bilateral crackles) after a dietary indiscretion (high-sodium restaurant meal). Body weight has increased by {weight_gain} lbs from baseline. What is the most appropriate acute management?",
        "options": [
            "Administer intravenous {loop_diuretic} with continuous monitoring of urine output, daily weights, serum electrolytes, and renal function; target net negative fluid balance while avoiding excessive diuresis that can precipitate hypotension and prerenal azotemia in the preload-sensitive HFpEF ventricle",
            "Administer intravenous normal saline bolus (2 liters) to improve cardiac output by increasing preload in the stiff ventricle",
            "Start intravenous milrinone to increase myocardial contractility and reduce filling pressures",
            "Administer high-dose intravenous nitroglycerin as the sole therapy, as diuretics are contraindicated in acute HFpEF decompensation",
            "Perform emergent pericardiocentesis to relieve the fluid overload"
        ],
        "answer": 0,
        "exp": "**Acute decompensated HFpEF** management centers on **volume removal with IV loop diuretics** while maintaining vigilant monitoring. Key principles: (1) **IV loop diuretics** (furosemide, bumetanide, torsemide) are first-line for acute congestion — they promote rapid natriuresis and diuresis, reducing pulmonary edema and symptom burden. (2) **Monitor closely**: urine output (target > 0.5-1 mL/kg/hr), daily weights (target 0.5-1 kg/day net loss), serum electrolytes (K+, Na+, Mg2+), and renal function (Cr). (3) **Avoid over-diuresis**: HFpEF patients have a **stiff, non-compliant ventricle** that is highly **preload-dependent**. Excessive volume removal drops filling pressures below the steep portion of the Frank-Starling curve, causing **hypotension, low cardiac output, and prerenal AKI**. (Ref: 2022 AHA/ACC/HFSA HF Guidelines; Hazzard's Ch. 38; UWorld Step 2 CK)"
    },
    # T37: Exercise Training in HFpEF
    {
        "q": "A {age}-year-old {gender} named {name} with stable, compensated HFpEF (LVEF {ef_preserved}%) and NYHA Class II symptoms asks about exercise. Which of the following is the most accurate evidence-based recommendation?",
        "options": [
            "Supervised moderate-intensity aerobic exercise training is strongly recommended in stable HFpEF; the Ex-DHF trial and multiple meta-analyses demonstrated that structured exercise programs improve peak VO2 (cardiorespiratory fitness), quality of life, diastolic function (E/e' ratio), and 6-minute walk distance",
            "All physical activity is strictly contraindicated in HFpEF because exercise increases cardiac filling pressures and invariably causes acute decompensation",
            "Only isometric (static) strength training is recommended in HFpEF; aerobic exercise is harmful",
            "Exercise provides no measurable benefit in HFpEF according to all published randomized controlled trials",
            "Exercise should be deferred until the ejection fraction drops below 40%, at which point cardiac rehabilitation becomes beneficial"
        ],
        "answer": 0,
        "exp": "**Exercise training** is one of the **most effective interventions** for improving functional capacity in HFpEF. The **Ex-DHF (Exercise Training in Diastolic Heart Failure) trial** and subsequent **meta-analyses** demonstrated that supervised moderate-intensity aerobic exercise: (1) **Improves peak VO2** (cardiorespiratory fitness) by 2-3 mL/kg/min (clinically meaningful), (2) **Improves quality of life** (KCCQ and SF-36 scores), (3) **Improves diastolic function** (reduced E/e' ratio), (4) **Improves 6-minute walk distance**, (5) **Reduces left atrial volume**. The 2022 AHA/ACC/HFSA Guidelines give exercise a **Class I recommendation** for all stable HF patients (including HFpEF). Mechanism: exercise training improves peripheral oxygen extraction, endothelial function, skeletal muscle efficiency, and vascular compliance. (Ref: Ex-DHF Trial; 2022 AHA/ACC/HFSA Guidelines; Hazzard's Ch. 38; Pandey A et al., JACC 2017)"
    },
    # T38: Atrial Fibrillation in HFpEF
    {
        "q": "A {age}-year-old {gender} named {name} with HFpEF (LVEF {ef_preserved}%) develops new-onset atrial fibrillation with a ventricular rate of 128 bpm. {pronoun_cap} becomes acutely dyspneic with worsening edema. Why does atrial fibrillation cause disproportionate hemodynamic deterioration in patients with HFpEF compared to those with normal diastolic function?",
        "options": [
            "In HFpEF, the stiff, non-compliant ventricle depends heavily on the atrial contraction ('atrial kick') for adequate diastolic filling (contributing up to 25-40% of stroke volume); loss of the atrial kick in AF, combined with tachycardia-induced shortening of diastolic filling time, causes a precipitous drop in cardiac output and rapid volume overload",
            "Atrial fibrillation causes identical hemodynamic effects in all patients regardless of ventricular compliance or diastolic function",
            "Atrial fibrillation improves diastolic filling in HFpEF by increasing the atrial contractile force through fibrillatory waves",
            "The hemodynamic deterioration is caused exclusively by the loss of AV nodal conduction and has no relationship to ventricular stiffness",
            "Atrial fibrillation in HFpEF is always hemodynamically benign and requires no rate control or rhythm management"
        ],
        "answer": 0,
        "exp": "**Atrial fibrillation (AF)** has a **disproportionately severe hemodynamic impact** in HFpEF compared to patients with normal diastolic function. In HFpEF, the **stiff, non-compliant left ventricle** has impaired passive early diastolic filling and relies heavily on the **atrial contraction (atrial kick)** to fill the ventricle during late diastole. The atrial kick contributes **25-40% of LV stroke volume** in HFpEF (vs. only 15-20% in normal hearts). When AF develops: (1) **Loss of atrial kick** → precipitous reduction in stroke volume, (2) **Tachycardia** → shortened diastolic filling time → further reduction in LV filling, (3) **Elevated LA pressure** → acute pulmonary congestion. Management priorities: (1) **Rate control** (beta-blocker or non-DHP CCB), (2) **Consider rhythm control** (cardioversion) for acute hemodynamic compromise. (Ref: Hazzard's Ch. 38; Zile MR, Circulation 2004; 2022 AHA/ACC/HFSA Guidelines)"
    },
    # T39: Distinguishing HFpEF from HFrEF
    {
        "q": "A {age}-year-old {gender} named {name} presents with dyspnea and edema. Echocardiography is performed. Which of the following comparisons between HFpEF and HFrEF is most accurate?",
        "options": [
            "HFpEF features LVEF >= 50%, concentric LV hypertrophy, normal or small LV cavity, impaired diastolic relaxation, elevated E/e' ratio, and is typically associated with older age, female sex, HTN, obesity, and AF; HFrEF features LVEF <= 40%, eccentric LV dilation, thin LV walls, reduced systolic contractility, and is typically associated with prior MI, ischemic cardiomyopathy, or dilated cardiomyopathy",
            "HFpEF and HFrEF are identical conditions with the same pathophysiology, demographics, and treatment, distinguished only by the arbitrary cutoff of 50% EF",
            "HFpEF is defined by LVEF <= 30% with severe systolic dysfunction, while HFrEF is defined by LVEF > 65% with diastolic dysfunction",
            "HFpEF exclusively affects young males with ischemic cardiomyopathy, while HFrEF exclusively affects older females with hypertension",
            "The distinction between HFpEF and HFrEF is purely academic and has no implications for treatment or prognosis"
        ],
        "answer": 0,
        "exp": "**HFpEF vs. HFrEF** are distinct clinical entities:\n\n| Feature | HFpEF | HFrEF |\n|---|---|---|\n| LVEF | >= 50% | <= 40% |\n| LV geometry | Concentric hypertrophy, normal/small cavity | Eccentric dilation, thin walls |\n| Primary dysfunction | Diastolic (impaired relaxation/increased stiffness) | Systolic (reduced contractility) |\n| Demographics | Older, female, obese, hypertensive | Younger, male, post-MI, ischemic |\n| BNP levels | Lower (less wall stress) | Higher (more wall stress) |\n| Proven therapies | SGLT2i, diuretics, exercise | ACEi/ARB/ARNI, BB, MRA, SGLT2i |\n\n(Ref: 2022 AHA/ACC/HFSA HF Guidelines; Hazzard's Ch. 38; Borlaug BA, JACC 2014)"
    },
    # T40: Sacubitril/Valsartan in HFpEF - PARAGON-HF
    {
        "q": "A {age}-year-old {gender} named {name} with HFpEF (LVEF {ef_preserved}%) is being considered for sacubitril/valsartan (angiotensin receptor-neprilysin inhibitor, ARNI). Which of the following best summarizes the evidence from the PARAGON-HF trial regarding ARNI therapy in HFpEF?",
        "options": [
            "The PARAGON-HF trial showed that sacubitril/valsartan did NOT significantly reduce the primary composite endpoint of total HF hospitalizations and cardiovascular death compared to valsartan alone in the overall HFpEF population (LVEF >= 45%); however, prespecified subgroup analyses suggested potential benefit in patients with lower LVEF (45-57%) and in women, leading to FDA expansion of the indication to include HF with LVEF 'below normal'",
            "PARAGON-HF demonstrated a 50% reduction in all-cause mortality with sacubitril/valsartan in all HFpEF patients, establishing it as first-line therapy",
            "Sacubitril/valsartan is absolutely contraindicated in HFpEF because neprilysin inhibition worsens diastolic stiffness",
            "PARAGON-HF tested sacubitril/valsartan exclusively in HFrEF patients and provided no data on HFpEF",
            "PARAGON-HF was terminated early due to excess mortality in the sacubitril/valsartan arm"
        ],
        "answer": 0,
        "exp": "The **PARAGON-HF (Prospective Comparison of ARNI with ARB Global Outcomes in HFpEF) trial** was a landmark RCT (4,822 patients, LVEF >= 45%) comparing **sacubitril/valsartan vs. valsartan alone**. Results: (1) The primary composite endpoint (total HF hospitalizations + CV death) was **NOT significantly reduced** (rate ratio 0.87, p = 0.06 — just missed statistical significance). (2) **Subgroup analyses** suggested benefit in: (a) **Patients with lower LVEF (45-57%)** (the mildly reduced range), and (b) **Women**. (3) Based on these findings and the PARADIGM-HF data in HFrEF, the FDA expanded the sacubitril/valsartan indication to include HF patients with **LVEF 'below normal'**. (4) The 2022 AHA/ACC/HFSA Guidelines give sacubitril/valsartan a **Class 2b recommendation** in selected HFpEF patients. (Ref: PARAGON-HF Trial, NEJM 2019; 2022 AHA/ACC/HFSA Guidelines; Hazzard's Ch. 38)"
    },
]

# ============================================================
# Generation Engine
# ============================================================
ages_pool = list(range(66, 98, 2))

mcqs = []
seen_questions = set()

for t_idx, t in enumerate(templates):
    variants_generated = 0
    attempts = 0
    max_attempts = 200
    
    while variants_generated < 10 and attempts < max_attempts:
        attempts += 1
        gp = random.choice(genders_pool)
        name = random.choice(gp["names"])
        gender = gp["gender"]
        pronoun = gp["pronoun"]
        pronoun_cap = gp["pronoun_cap"]
        possessive = gp["possessive"]
        possessive_cap = gp["possessive_cap"]
        
        age = random.choice(ages_pool)
        sbp_high = random.choice(sbp_high_pool)
        dbp_normal = random.choice(dbp_normal_pool)
        pulse_pressure = sbp_high - dbp_normal
        sbp_standing_drop = random.choice(sbp_standing_drop_pool)
        dbp_standing_drop = random.choice(dbp_standing_drop_pool)
        sbp_standing = sbp_high - sbp_standing_drop
        dbp_standing = dbp_normal - dbp_standing_drop
        hr = random.choice(hr_pool)
        ef_preserved = random.choice(ef_preserved_pool)
        ef_reduced = random.choice(ef_reduced_pool)
        bnp_hfpef = random.choice(bnp_hfpef_pool)
        bnp_hfref = random.choice(bnp_hfref_pool)
        ntprobnp = random.choice(ntprobnp_pool)
        e_eprime = random.choice(e_eprime_pool)
        la_vol = random.choice(la_vol_pool)
        bmi = random.choice(bmi_pool)
        creatinine = random.choice(creatinine_pool)
        potassium = random.choice(potassium_pool)
        sodium = random.choice(sodium_pool)
        weight_gain = random.choice(weight_gain_pool)
        duration_months = random.choice(duration_months_pool)
        duration_years = random.choice(duration_years_pool)
        alpha_blocker = random.choice(alpha_blockers_pool)
        thiazide = random.choice(thiazide_pool)
        ccb = random.choice(ccb_pool)
        acei = random.choice(acei_pool)
        arb = random.choice(arb_pool)
        sglt2i = random.choice(sglt2i_pool)
        loop_diuretic = random.choice(loop_diuretic_pool)
        bb = random.choice(bb_pool)
        mra = random.choice(mra_pool)
        nitrate = random.choice(nitrate_pool)
        antihtn_count = random.choice(antihtn_count_pool)
        
        format_kwargs = {
            "age": age,
            "gender": gender,
            "name": name,
            "pronoun": pronoun,
            "pronoun_cap": pronoun_cap,
            "possessive": possessive,
            "possessive_cap": possessive_cap,
            "sbp_high": sbp_high,
            "dbp_normal": dbp_normal,
            "pulse_pressure": pulse_pressure,
            "sbp_standing_drop": sbp_standing_drop,
            "dbp_standing_drop": dbp_standing_drop,
            "sbp_standing": sbp_standing,
            "dbp_standing": dbp_standing,
            "hr": hr,
            "ef_preserved": ef_preserved,
            "ef_reduced": ef_reduced,
            "bnp_hfpef": bnp_hfpef,
            "bnp_hfref": bnp_hfref,
            "ntprobnp": ntprobnp,
            "e_eprime": e_eprime,
            "la_vol": la_vol,
            "bmi": bmi,
            "creatinine": creatinine,
            "potassium": potassium,
            "sodium": sodium,
            "weight_gain": weight_gain,
            "duration_months": duration_months,
            "duration_years": duration_years,
            "alpha_blocker": alpha_blocker,
            "thiazide": thiazide,
            "ccb": ccb,
            "acei": acei,
            "arb": arb,
            "sglt2i": sglt2i,
            "loop_diuretic": loop_diuretic,
            "bb": bb,
            "mra": mra,
            "nitrate": nitrate,
            "antihtn_count": antihtn_count,
        }
        
        try:
            q_text = t["q"].format(**format_kwargs)
        except KeyError as e:
            print(f"KeyError in template {t_idx} (q): {e}")
            continue
            
        if q_text in seen_questions:
            continue
            
        # Format options
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
            
        # Escape for SQL single quotes
        q_esc = q_text.replace("'", "''")
        opts_json = json.dumps(opts_formatted).replace("'", "''")
        exp_esc = exp_formatted.replace("'", "''")
        
        mcq_str = f"    (v_topic_id, '{q_esc}', '{opts_json}'::jsonb, {new_ans_idx}, '{exp_esc}')"
        
        seen_questions.add(q_text)
        mcqs.append(mcq_str)
        variants_generated += 1
        
    if variants_generated < 10:
        print(f"WARNING: Template {t_idx} only generated {variants_generated} variants after {attempts} attempts")

print(f"Total unique MCQs generated: {len(mcqs)}")

# ============================================================
# Partition and Write to 4 Files (100, 100, 100, 100)
# ============================================================
parts = [
    mcqs[0:100],
    mcqs[100:200],
    mcqs[200:300],
    mcqs[300:400]
]

for part_num, part_mcqs in enumerate(parts, 1):
    out_file = f"c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260521_geri_cardiovascular_mcqs_p{part_num}.sql"
    with open(out_file, "w", encoding="utf-8") as f:
        f.write(f"-- US MD/MBBS (4th Year) clinical case blocks - Geriatrics: Cardiovascular in elderly — isolated systolic HTN, orthostatic hypotension, HFpEF - Part {part_num} ({(part_num-1)*100+1}-{((part_num-1)*100)+len(part_mcqs)})\n")
        f.write("BEGIN;\n\n")
        f.write("DO $$\nDECLARE\n    v_topic_id UUID;\nBEGIN\n")
        f.write(f"    SELECT id INTO v_topic_id FROM topics WHERE slug = '{topic_slug}' LIMIT 1;\n")
        f.write(f"    IF v_topic_id IS NULL THEN\n        RAISE EXCEPTION 'Topic {topic_slug} not found.';\n    END IF;\n\n")
        
        if part_num == 1:
            f.write("    DELETE FROM mcqs WHERE topic_id = v_topic_id;\n\n")
            
        f.write("    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES\n")
        for i, m in enumerate(part_mcqs):
            if i < len(part_mcqs) - 1:
                f.write(m + ",\n")
            else:
                f.write(m + ";\n")
        f.write("END $$;\nCOMMIT;\n")
        
    print(f"Part {part_num}: {len(part_mcqs)} MCQs -> {out_file}")

print(f"\nDone! Total: {len(mcqs)} MCQs in {len(parts)} files.")
