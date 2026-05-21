import json
import random

random.seed(42)

topic_slug = 'geri-functional-assessment'

# ============================================================
# 40 UNIQUE TEMPLATES - Geriatrics: Functional Assessment
# Covers: ADLs, iADLs, CGA, Frailty Scoring, Physical Tests,
#         Cognitive/Mood Screens, Nutrition, Beers/STOPP, etc.
# ============================================================

templates = [
    # ===== BASIC ADLS (Templates 1-5) =====
    # T1: Dressing (Basic ADL)
    {
        "q": "A {age}-year-old {gender} is evaluated during a routine clinic visit. {possessive_cap} child reports that the patient requires physical assistance to select appropriate, weather-sensitive clothing, coordinate buttons and zippers, and put on {possessive} shoes, but can eat, walk, bathe, and use the toilet independently. Cognitive screening is normal. According to the Katz Index of Independence in Activities of Daily Living (ADL), how should this patient's functional status be classified, and what is the primary clinical utility of this tool?",
        "options": [
            "Impairment in Dressing only (Katz ADL score 5/6); the tool tracks basic self-care tasks to determine the level of daily personal care support needed and predict post-discharge needs",
            "Impairment in an Instrumental ADL; the tool evaluates complex executive functions required for independent community living",
            "Pre-frail status; the tool is primarily a diagnostic marker for sarcopenia and underlying chronic inflammation",
            "Impairment in Dressing and Hygiene; the tool is used to qualify patients for skilled nursing home care under Medicare Part A",
            "Normal functional status; dressing is considered an instrumental ADL rather than a basic activity of daily living"
        ],
        "answer": 0,
        "exp": "The Katz ADL Index evaluates six basic self-care tasks: Bathing, Dressing, Toileting, Transferring, Continence, and Feeding (mnemonic: DEATH - Dressing, Eating, Ambulating, Toileting, Hygiene). Requiring assistance with selecting clothes or managing fasteners represents an impairment in dressing. The Katz score is out of 6, where 6 indicates full independence and lower scores indicate increasing dependency. The primary utility of basic ADL assessment is to determine the level of assistance/nursing support needed, assess prognosis, and guide discharge planning (e.g., home care vs. assisted living vs. skilled nursing facility). Dressing is a basic ADL, not an IADL. (Ref: Hazzard's Ch. 12; Current Geriatrics Ch. 2)"
    },
    # T2: Eating (Basic ADL)
    {
        "q": "A {age}-year-old {gender} with advanced osteoarthritis and mild cognitive decline is evaluated. The caregiver reports that while the patient can chew and swallow safely, {pronoun} cannot cut {possessive} food, spread butter, or bring utensils to {possessive} mouth without dropping them, requiring full physical assistance to be fed. {pronoun_cap} is continent and independent in transferring and bathing. Which of the following correctly describes this deficit under the Katz ADL index, and what is its prognostic significance?",
        "options": [
            "Impairment in Feeding (eating); this is typically the last basic ADL to be lost in progressive decline, and its loss is strongly associated with high 1-year mortality and the need for 24-hour care",
            "Impairment in Food Preparation; this is an instrumental ADL (IADL) that is typically lost early in the course of cognitive decline",
            "Impairment in Transferring; the inability to eat indicates a loss of proximal muscle strength and severe balance impairment",
            "Impairment in Continence; the inability to feed oneself always correlates with detrusor instability and neurogenic bladder",
            "Impairment in Hygiene; the patient requires assistance with feeding due to severe apraxia, which is classified under the bathing domain"
        ],
        "answer": 0,
        "exp": "Feeding (eating) is a basic ADL. It represents the ability to transfer food from a container/plate to one's mouth; it does not include food preparation (which is an IADL). In the hierarchical loss of basic ADLs, feeding is typically the VERY LAST basic ADL to be lost (bathing and dressing are lost first). Consequently, the loss of feeding ability indicates advanced physical or cognitive decline and is a strong predictor of 1-year mortality and the need for 24-hour nursing care. (Ref: Hazzard's Ch. 12; Current Geriatrics Ch. 2)"
    },
    # T3: Ambulating / Transferring (Basic ADL)
    {
        "q": "A {age}-year-old {gender} is admitted to the hospital following a mild pneumonia episode. During physical therapy evaluation, the patient is found to require weight-bearing assistance and a walker to get out of bed and transfer to a chair. Prior to admission, {pronoun} was fully independent in all transfers. The team is discussing the discharge plan. Which of the following basic ADL domains is impaired, and what is the most appropriate next step in management?",
        "options": [
            "Impairment in Transferring; prescribe physical therapy for gait and transfer training to restore baseline function before determining long-term placement",
            "Impairment in Ambulating; recommend immediate permanent placement in a skilled nursing facility as independence is unlikely to return",
            "Impairment in Toileting; order a Foley catheter to prevent skin breakdown during bed rest",
            "Impairment in Shopping; arrange for home-delivered meals and transportation services",
            "Impairment in bathing; initiate occupational therapy exclusively to modify the home bathroom layout"
        ],
        "answer": 0,
        "exp": "Transferring is a basic ADL that evaluates a patient's ability to move in and out of bed or a chair. An acute decline in transferring due to hospitalization (deconditioning) should be managed actively with physical therapy and rehabilitation (gait and transfer training) to restore baseline function. Permanent facility placement should not be decided during an acute, reversible deconditioning episode. Toileting and bathing are distinct ADLs, and shopping is an IADL. (Ref: Hazzard's Ch. 12; Current Geriatrics Ch. 2)"
    },
    # T4: Toileting (Basic ADL)
    {
        "q": "A {age}-year-old {gender} is evaluated for urinary accidents. The daughter notes that the patient is continent of urine but has frequent accidents because {pronoun} cannot unbutton {possessive} trousers in time or requires assistance to clean {possessive}self and adjust clothing after voiding. Which of the following functional domains is primarily impaired in this patient, and what is this type of incontinence called?",
        "options": [
            "Impairment in the Toileting ADL (difficulty getting to the toilet, managing clothing, or cleaning oneself); this represents functional incontinence",
            "Impairment in the Continence ADL; this represents urge incontinence due to detrusor overactivity",
            "Impairment in the Hygiene ADL; this represents stress incontinence due to urethral hypermobility",
            "Impairment in the Accounting IADL; this represents overflow incontinence due to detrusor underactivity",
            "Impairment in the Dressing ADL; this represents mixed urinary incontinence due to intrinsic sphincter deficiency"
        ],
        "answer": 0,
        "exp": "The Toileting ADL covers the ability to get to the toilet, get on and off the toilet, arrange clothing, and clean oneself. When physical or cognitive limitations (such as severe arthritis, slow gait, or difficulty managing clothing fasteners) prevent a patient from using the toilet in time despite normal physiologic bladder control, this is termed **functional incontinence**. It is managed by addressing the functional barriers (e.g., bedside commodes, clothing modifications like Velcro, scheduled toileting), not by bladder-directed medications. (Ref: Hazzard's Ch. 12, Ch. 78)"
    },
    # T5: Bathing (Basic ADL)
    {
        "q": "A {age}-year-old {gender} is being assessed for safety at home. The patient is independent in eating, transferring, dressing, and using the toilet. However, due to fear of falling and severe osteoarthritis of the knees, the patient has not taken a tub bath or shower in {duration} months, relying instead on partial sponge baths. {pronoun_cap} requires assistance to wash {possessive} back and lower extremities. Which of the following is the most accurate assessment of the patient's functional status?",
        "options": [
            "Impairment in Bathing (basic ADL), which is typically the first basic ADL to be lost in the course of functional decline; perform an occupational therapy home safety evaluation for assistive devices (e.g., tub bench, grab bars)",
            "Impairment in Housekeeping (IADL); recommend immediate transition to an assisted living facility",
            "Normal functional status because sponge baths are considered equivalent to full bathing in older adults",
            "Impairment in transferring; prescribe high-dose muscle relaxants to improve knee range of motion",
            "Impairment in Hygiene (IADL); start empirical antidepressant therapy for self-neglect"
        ],
        "answer": 0,
        "exp": "Bathing is a basic ADL and is almost always the **first basic ADL to be lost** during progressive functional decline. Requiring assistance with washing any part of the body (or avoiding bathing due to safety fears/physical limits) constitutes an impairment. The most appropriate management is to perform a home safety and occupational therapy (OT) assessment to introduce assistive devices (e.g., grab bars, shower chair, handheld shower head) to restore safe independence, rather than pushing for premature facility placement. (Ref: Hazzard's Ch. 12; Current Geriatrics Ch. 2)"
    },

    # ===== INSTRUMENTAL ADLS (Templates 6-11) =====
    # T6: Shopping (IADL)
    {
        "q": "A {age}-year-old {gender} is brought to the clinic by {possessive} adult child, who is concerned that the patient is no longer eating well. The child notes that the patient can feed {possessive}self and cook simple meals, but has stopped going to the grocery store because {pronoun} finds planning, navigating the aisles, and carrying bags too physically exhausting and cognitively overwhelming. Which of the following best describes this functional deficit and the tool used to assess it?",
        "options": [
            "Impairment in Shopping, which is an Instrumental Activity of Daily Living (IADL) assessed by the Lawton IADL Scale; IADLs measure the ability to live independently in the community",
            "Impairment in Feeding, which is a Basic Activity of Daily Living (ADL) assessed by the Katz ADL Index; ADLs measure basic survival skills",
            "Impairment in Food Preparation, which is a Basic Activity of Daily Living (ADL) assessed by the Berg Balance Scale",
            "Impairment in Transportation, which is an IADL assessed by the Mini-Cog to evaluate driving safety",
            "Impairment in Housekeeping, which is an ADL assessed by the Tinetti mobility scale"
        ],
        "answer": 0,
        "exp": "Shopping is an **Instrumental Activity of Daily Living (IADL)**. IADLs (often remembered by the mnemonic SHAFT: Shopping, Housekeeping, Accounting/Finances, Food prep, Transportation/Telephone, plus medication management) are complex activities necessary for independent community living. They are commonly assessed using the **Lawton IADL Scale**. In contrast, basic ADLs (DEATH: Dressing, Eating, Ambulating, Toileting, Hygiene/Bathing) represent fundamental self-care tasks. IADLs are typically lost **before** basic ADLs in progressive cognitive or physical decline. (Ref: Lawton & Brody, 1969; Hazzard's Ch. 12)"
    },
    # T7: Housekeeping (IADL)
    {
        "q": "A {age}-year-old {gender} lives alone in a two-story home. During a home visit, the nurse notes that the house is extremely cluttered, dust and mold are accumulating, dishes are piled in the sink, and laundry is undone. The patient admits that {pronoun} can no longer vacuum, wash clothes, or clean floors due to severe dyspnea on exertion from COPD. {pronoun_cap} is independent in all basic self-care. What is the most appropriate interpretation and initial intervention?",
        "options": [
            "The patient has an IADL deficit in Housekeeping; arrange for home health aide services or light housekeeping assistance to maintain a safe, hygienic living environment",
            "The patient is independent because basic ADLs are intact; no clinical interventions are warranted",
            "The patient has a basic ADL deficit in Bathing; order an urgent home nursing referral for daily sponge baths",
            "The patient has a cognitive decline (dementia); initiate empirical donepezil therapy immediately",
            "The patient has an environmental safety hazard; report the patient immediately to Adult Protective Services for self-neglect"
        ],
        "answer": 0,
        "exp": "Housekeeping is an IADL. While the patient's basic ADLs are intact, an inability to perform housekeeping due to physical limitations (such as COPD) creates a safety and health hazard (clutter, dust, mold). The appropriate intervention is to support the patient's desire to remain at home by arranging for community resources, social services, or home care agencies to assist with light housekeeping and laundry. It does not warrant an APS report for self-neglect unless the patient is refusing essential assistance and is in imminent danger. (Ref: Hazzard's Ch. 12, Ch. 14)"
    },
    # T8: Accounting/Finances (IADL)
    {
        "q": "A {age}-year-old {gender} is brought to the clinic after {possessive} bank flagged multiple late mortgage payments and several unusual wire transfers to unverified overseas accounts. The patient, who previously managed all household finances, admits {pronoun} now finds balancing the checkbook confusing and has been paying bills twice or not at all. Which of the following is the most appropriate next step in management?",
        "options": [
            "Perform cognitive testing (e.g., MoCA) to screen for cognitive impairment, and advise the family to establish a durable power of attorney (POA) for finances to protect the patient from financial exploitation",
            "Immediately prescribe a cholinesterase inhibitor to reverse the financial errors",
            "Recommend immediate nursing home placement as the patient is incapable of independent living",
            "Advise the patient to close all bank accounts and carry only cash to simplify transactions",
            "File a mandatory elder abuse report against the bank for flagging the patient's accounts"
        ],
        "answer": 0,
        "exp": "Financial management (Accounting) is a complex IADL that requires intact executive functioning. Deficits in managing finances are often the **earliest sign of cognitive decline** or dementia (e.g., Alzheimer's). The clinician must perform formal cognitive testing (like the Montreal Cognitive Assessment [MoCA]) to evaluate the underlying cause and counsel the family to secure financial protections (such as establishing a financial Durable Power of Attorney [POA] or a co-signer) to prevent financial exploitation, scams, and unpaid bills. (Ref: Hazzard's Ch. 12, Ch. 72)"
    },
    # T9: Food Preparation (IADL)
    {
        "q": "A {age}-year-old {gender} is evaluated after a home health aide discovered a scorched pot and a burner left on overnight. The patient's spouse died recently, and the patient is now living alone. {pronoun_cap} reports eating mostly canned soup because preparing hot meals feels 'too complicated' and {pronoun} frequently forgets what {pronoun} is cooking. {possessive_cap} basic ADLs are intact. Which of the following is the most appropriate initial management step?",
        "options": [
            "Assess for cognitive impairment, screen for geriatric depression, and recommend home-delivered meal services (e.g., Meals on Wheels) or supervised cooking to ensure nutritional safety",
            "Prescribe low-dose atypical antipsychotics to manage the patient's cooking forgetfulness",
            "Inform the patient that {pronoun} is no longer permitted to eat warm food under any circumstances",
            "Recommend the immediate installation of a commercial-grade restaurant kitchen in the patient's home",
            "Arrange for immediate involuntary psychiatric hospitalization due to unsafe behavior"
        ],
        "answer": 0,
        "exp": "Food preparation is an IADL. An inability to prepare meals safely (e.g., leaving the stove on, scorching cookware) poses a significant risk of house fire and malnutrition. The initial clinical steps are to evaluate the patient's cognitive status and screen for geriatric depression (common after recent spousal bereavement) while immediately securing patient safety. This is achieved by utilizing community resources like Meals on Wheels or setting up in-home support for meal prep, and educating the family on stove safety devices (automatic shutoff devices). (Ref: AGS Geriatrics At Your Fingertips; Hazzard's Ch. 12)"
    },
    # T10: Transportation & Telephone (IADL)
    {
        "q": "A {age}-year-old {gender} is evaluated due to social withdrawal. The family reports that the patient has stopped attending senior center activities and misses medical appointments. The patient explains that {pronoun} can no longer drive due to vision loss from macular degeneration and is unable to use {possessive} smartphone to call for rides because the text is too small and confusing. Which of the following IADL domains are impaired, and what is the best initial intervention?",
        "options": [
            "Impairments in Transportation and Telephone use; refer the patient for low-vision rehabilitation, set up a simplified high-contrast large-button telephone, and coordinate community-based senior transit services",
            "Impairments in Ambulating and Eating; prescribe high-dose vitamin therapy to reverse macular degeneration",
            "Impairment in Transferring; recommend transition to a skilled nursing facility immediately",
            "Impairment in Dressing; recommend immediate occupational therapy for buttoning training",
            "Normal aging findings; reassure the family that social withdrawal is a natural and healthy part of late life"
        ],
        "answer": 0,
        "exp": "Transportation and Telephone use are key IADLs on the Lawton Scale. Visual impairment (from age-related macular degeneration) directly compromises these IADLs, leading to social isolation, depression, and missed medical care. The best intervention is a multidimensional approach: referring to low-vision rehabilitation, adapting the telephone (e.g., large-button, high-contrast, voice-activated), and arranging senior transit or paratransit services to maintain community connection. (Ref: Hazzard's Ch. 12, Ch. 45)"
    },
    # T11: Medication Management (IADL)
    {
        "q": "A {age}-year-old {gender} with hypertension and type 2 diabetes is admitted for symptomatic hypoglycemia (blood glucose {moca_score} mg/dL). A pill count reveals that the patient has been taking double doses of {possessive} glimepiride and missing {possessive} antihypertensive medications because the multiple pill bottles are confusing. {possessive_cap} cognitive screening shows mild executive dysfunction. Which of the following is the most effective initial intervention to improve medication adherence?",
        "options": [
            "Simplify the medication regimen, consolidate dosing times, implement a pre-filled pill organizer (e.g., pillbox or blister packs), and enlist a family member or home health nurse to supervise medication administration",
            "Prescribe a second-generation antipsychotic to improve the patient's focus on pill bottles",
            "Discontinue all oral diabetes medications and transition to multiple-daily-injection insulin therapy to simplify the regimen",
            "Advise the patient to memorize the chemical names and colors of all {possessive} pills",
            "Admit the patient to the hospital indefinitely for medication administration"
        ],
        "answer": 0,
        "exp": "Medication management is a critical IADL. Impairments in this domain can lead to life-threatening errors (e.g., severe hypoglycemia or hypertensive crisis). For older adults with cognitive or executive impairment, the most effective adherence strategies are: (1) Simplifying the regimen (reducing pill burden, stopping non-essential drugs); (2) Consolidating dosing to once daily if possible; (3) Using assistive devices (pre-filled weekly pillboxes, blister packaging); and (4) Enlisting social support (family, home health nurse) to fill and monitor the system. Transitioning to complex insulin regimens would increase the risk of errors. (Ref: Hazzard's Ch. 12, Ch. 30)"
    },

    # ===== COMPREHENSIVE GERIATRIC ASSESSMENT (CGA) (Templates 12-14) =====
    # T12: Interdisciplinary Team (CGA)
    {
        "q": "A {age}-year-old {gender} with multiple chronic conditions, recurrent falls, and polypharmacy is referred to a Comprehensive Geriatric Assessment (CGA) program. The patient asks why {pronoun} needs to see a whole team instead of just {possessive} primary care doctor. Which of the following statements best describes the evidence-based benefit and composition of the CGA interdisciplinary team?",
        "options": [
            "CGA utilizes an interdisciplinary team (geriatrician, nurse, pharmacist, social worker, PT/OT) to deliver multidimensional assessment and coordinated care, which has been shown to reduce hospital readmissions, delay nursing home placement, and improve functional survival",
            "CGA is a diagnostic tool performed exclusively by a neurologist to determine genetic risk profiles for dementia",
            "CGA is a billing code that allows multiple physicians to charge for the same office visit without collaborating",
            "CGA is a home safety inspection team that is legally mandated to confiscate driving licenses from patients over 80",
            "CGA is a palliative care service designed only for patients with a life expectancy of less than 6 months"
        ],
        "answer": 0,
        "exp": "A **Comprehensive Geriatric Assessment (CGA)** is a multidimensional, interdisciplinary diagnostic and therapeutic process designed to determine an older person's medical, psychological, and functional capabilities. The core interdisciplinary team typically includes a geriatrician, nurse, clinical pharmacist, social worker, and physical/occupational therapists. Strong clinical trial evidence demonstrates that CGA-based care leads to **improved functional status, reduced rates of hospitalization and nursing home placement, and increased likelihood of remaining alive in one's own home** compared to standard care. (Ref: Hazzard's Ch. 12; Ellis et al., Cochrane Database Syst Rev 2017)"
    },
    # T13: CGA Core Domains (CGA)
    {
        "q": "A {age}-year-old {gender} is undergoing a Comprehensive Geriatric Assessment (CGA). During the evaluation, the team screens the patient's physical health, performs cognitive testing (MoCA), reviews all medications, assesses safety in the home environment, screens for depression, evaluates social support networks, and reviews advanced directives. Which of the following describes the key principle underlying the assessment of these multiple domains?",
        "options": [
            "Physical, cognitive, psychological, social, and environmental domains are highly interdependent in older adults; an unaddressed deficit in one domain (e.g., social isolation) can accelerate decline in another (e.g., cognitive and physical function)",
            "The domains are assessed separately because they do not influence one another, allowing different specialists to work in complete isolation",
            "The environmental assessment is the only domain with prognostic value for mortality in older adults",
            "The assessment of cognitive and psychological domains is only performed if a patient has a formal diagnosis of schizophrenia",
            "The CGA is designed to replace all standard medical treatments with non-pharmacological therapies"
        ],
        "answer": 0,
        "exp": "The defining feature of the **Comprehensive Geriatric Assessment (CGA)** is its **multidimensionality**. Older adults typically have multiple coexisting problems across physical, cognitive, psychological, social, economic, and environmental domains. These domains are **highly interdependent**—for example, severe osteoarthritis (physical) can lead to restricted mobility, which causes social isolation (social/environmental), triggering depression (psychological), which worsens cognitive testing scores and leads to poor nutrition and medication adherence. Addressing all domains in an integrated fashion is essential for effective care. (Ref: Hazzard's Ch. 12)"
    },
    # T14: Target Population for CGA
    {
        "q": "A health system is developing a screening protocol to identify patients who would benefit most from a referral to a high-resource Comprehensive Geriatric Assessment (CGA) clinic. Which of the following patients represents the **most appropriate** target population for a CGA?",
        "options": [
            "A {age}-year-old {gender} with mild cognitive decline, progressive gait unsteadiness, recent emergency department visits for minor falls, and polypharmacy (taking {gds_score} medications)",
            "A {age}-year-old {gender} who is highly active, jogs 3 miles daily, manages all {possessive} own finances, and has well-controlled hypertension on one medication",
            "A {age}-year-old {gender} with end-stage metastatic pancreatic cancer who is currently receiving hospice care in a dedicated facility",
            "A {age}-year-old {gender} with severe, advanced Alzheimer's disease who is completely bedbound, non-verbal, and dependent for all basic ADLs",
            "A 45-year-old patient with new-onset type 1 diabetes and no other medical or functional comorbidities"
        ],
        "answer": 0,
        "exp": "The **target population** for CGA consists of older adults who are **moderately frail, have complex medical-psychosocial needs, or are at risk of functional decline** but still have **rehabilitative potential**. Robust older adults (who are healthy and independent) do not need the resource-intensive CGA. Conversely, patients with end-stage terminal illness (who are on hospice) or those with advanced, irreversible functional dependency (bedbound, end-stage dementia) do not benefit from the diagnostic and rehabilitative focus of a CGA; their care is better managed through primary palliative/comfort-focused care. (Ref: Hazzard's Ch. 12; AGS Geriatrics At Your Fingertips)"
    },

    # ===== FRAILTY & FRAILTY SCORING (Templates 15-18) =====
    # T15: Fried Frailty Phenotype (Frailty)
    {
        "q": "A {age}-year-old {gender} is evaluated for general decline. Over the past year, the patient has had an unintentional weight loss of **{weight_loss_pct} lbs** ({possessive} baseline was 130 lbs), reports feeling exhausted 'nearly every day,' has a slow walking speed (takes 8 seconds to walk 4 meters), has weak grip strength, and reports low physical activity (sedentary lifestyle). According to the **Fried Frailty Phenotype**, how should this patient's frailty status be classified, and what is the biological basis of this condition?",
        "options": [
            "Frail (satisfies 3 or more criteria); frailty is a syndrome of physiological vulnerability characterized by chronic low-grade inflammation (inflammaging) and multi-system dysregulation",
            "Robust (satisfies 0 criteria); the patient's symptoms are a normal and inevitable consequence of chronological aging",
            "Pre-frail (satisfies 1-2 criteria); managed primarily with long-term bed rest to conserve energy",
            "Sarcopenic only; the patient does not meet frailty criteria because cognitive function is intact",
            "Anorexic; the weight loss is the only clinically significant finding and should be treated with high-dose stimulants"
        ],
        "answer": 0,
        "exp": "The **Fried Frailty Phenotype** defines frailty based on **five clinical criteria**: (1) Unintentional weight loss (≥10 lbs or ≥5% of body weight in the past year); (2) Self-reported exhaustion; (3) Weakness (low grip strength); (4) Slowness (slow walking speed over 4 meters); (5) Low physical activity. Scoring: **0 criteria = Robust**; **1–2 criteria = Pre-frail**; **≥3 criteria = Frail**. This patient meets all five criteria (or at least 3: weight loss, exhaustion, slowness, weakness, low activity), classifying them as **Frail**. Pathophysiologically, frailty represents a state of reduced physiologic reserve and high vulnerability to stressors, driven by **chronic inflammation ('inflammaging')**, mitochondrial dysfunction, endocrine dysregulation (HPA axis, IGF-1), and sarcopenia. (Ref: Fried et al., J Gerontol A Biol Sci Med Sci 2001; Hazzard's Ch. 12, Ch. 26)"
    },
    # T16: Clinical Frailty Scale (CFS) (Frailty)
    {
        "q": "A {age}-year-old {gender} is scheduled for an elective total hip arthroplasty. During the pre-operative assessment, the clinician utilizes the **Clinical Frailty Scale (CFS)**. The patient is found to be active but has progressive difficulty with complex IADLs (requires assistance with shopping and heavy housework), though {pronoun} is fully independent in all basic ADLs (DEATH). Which of the following CFS scores is most appropriate, and what does it predict?",
        "options": [
            "CFS 4 (Vulnerable) or CFS 5 (Mildly Frail); indicates that the patient is at an increased risk of post-operative delirium, prolonged hospital stay, and discharge to an inpatient rehabilitation facility",
            "CFS 1 (Very Fit); predicts a flawless post-operative course with zero risk of surgical complications",
            "CFS 9 (Terminally Ill); indicates that elective surgery is absolutely contraindicated and the patient should be transitioned to hospice",
            "CFS 7 (Severely Frail); indicates that the patient is completely dependent for all self-care tasks",
            "CFS 3 (Managing Well); indicates that the patient has no active medical problems or physical limitations"
        ],
        "answer": 0,
        "exp": "The **Clinical Frailty Scale (CFS)** is a 9-point visual scale used to rapidly assess frailty. **CFS 4 (Vulnerable)** describes patients who are not dependent but are limited in activities and commonly complain of 'slowing down'. **CFS 5 (Mildly Frail)** describes patients with more evident slowing who require help with complex IADLs (finances, transportation, heavy housework) but maintain independent basic ADLs. In pre-operative settings, a CFS score of 4 or 5 (or higher) is a powerful predictor of adverse outcomes: **increased risk of post-operative delirium, surgical complications, increased length of stay, and institutional discharge** (discharge to rehab). Identifying frailty pre-operatively allows for targeted interventions (prehabilitation, geriatric co-management). (Ref: Rockwood et al., CMAJ 2005; Hazzard's Ch. 12, Ch. 26)"
    },
    # T17: Clinical Implications of Frailty
    {
        "q": "A {age}-year-old {gender} with a history of stage III colon cancer is being evaluated for adjuvant chemotherapy. The oncologist is hesitant to prescribe a standard multi-agent regimen due to concerns about toxicity. A formal frailty assessment reveals that the patient is moderately frail. Which of the following statements regarding the clinical implications of frailty in oncology and surgery is most accurate?",
        "options": [
            "Frailty is a strong independent predictor of severe chemotherapeutic toxicity, post-operative complications, and mortality, regardless of chronological age; treatment plans should be tailored based on physiological age rather than chronological age",
            "Chronological age is a far superior predictor of chemotherapy tolerability and surgical outcomes than frailty scoring",
            "Frail patients should always receive the highest possible dose of chemotherapy to overcome their physiological vulnerability",
            "Frailty is only relevant for musculoskeletal procedures and has no predictive value for systemic cancer therapies",
            "Frailty scores are highly subjective and have not been validated in clinical oncology or surgical outcomes research"
        ],
        "answer": 0,
        "exp": "Frailty is a measure of **physiological age and vulnerability**, which is distinct from and far superior to chronological age in predicting clinical outcomes. In both surgical and oncology settings, frailty is a powerful, validated predictor of adverse outcomes: it independently predicts **grade 3/4 chemotherapeutic toxicity, treatment discontinuation, post-operative complications (infections, wound dehiscence), prolonged hospitalization, and short-term mortality**. Consequently, international guidelines recommend screening for frailty in older adults before starting chemotherapy or undergoing major surgery, allowing clinicians to tailor treatment (e.g., using dose-adjusted regimens or choosing less invasive surgical options). (Ref: Hazzard's Ch. 26, Ch. 99; Hurria et al., J Clin Oncol 2011)"
    },
    # T18: Pathophysiology of Frailty
    {
        "q": "A {age}-year-old {gender} is diagnosed with frailty syndrome. The patient's family asks about the underlying biological mechanisms that lead to this state of extreme physical vulnerability. Which of the following best describes the core pathophysiological features of frailty?",
        "options": [
            "Multi-system physiological dysregulation driven by chronic, low-grade inflammation (elevated IL-6, TNF-alpha, CRP), dysregulation of the hypothalamic-pituitary-adrenal (HPA) axis, decreased anabolic hormones (IGF-1, DHEA-S), mitochondrial dysfunction, and skeletal muscle loss (sarcopenia)",
            "A single genetic mutation in the NOTCH3 gene that leads to selective atrophy of the cerebral cortex and motor neurons",
            "Primary psychiatric disease characterized by voluntary muscle disuse and secondary psychogenic muscle wasting",
            "Selective autoimmune destruction of peripheral myelinated motor axons, similar to Guillain-Barré syndrome",
            "Chronic vitamin D toxicity leading to hypercalcemic muscle paralysis and severe metastatic calcification of the joints"
        ],
        "answer": 0,
        "exp": "Frailty is not caused by a single organ failure or a single disease; it is a **multi-system physiological syndrome** driven by the accumulation of subclinical declines across multiple organ systems. The core pathophysiological drivers include: (1) **'Inflammaging'** — chronic, sterile, low-grade inflammation with elevated levels of pro-inflammatory cytokines (IL-6, TNF-alpha) and C-reactive protein (CRP); (2) **Endocrine dysregulation** — blunted growth hormone/IGF-1 axis, reduced DHEA-S, and chronic activation or blunting of the HPA axis (high cortisol); (3) **Mitochondrial dysfunction** and oxidative stress; (4) **Sarcopenia** — the age-related loss of skeletal muscle mass, quality, and strength. These pathways interact in a vicious cycle leading to reduced energy production, weight loss, and physical vulnerability. (Ref: Hazzard's Ch. 26; Clegg et al., Lancet 2013)"
    },

    # ===== PHYSICAL PERFORMANCE & FALL RISK (Templates 19-23) =====
    # T19: Timed Up and Go (TUG) Test (Physical Tests)
    {
        "q": "During a Comprehensive Geriatric Assessment, a {age}-year-old {gender} performs the **Timed Up and Go (TUG)** test. The patient rises from a standard chair, walks 3 meters (10 feet), turns around, walks back to the chair, and sits down. The patient completes this in **{tug_time} seconds** using a cane. Which of the following is the correct clinical interpretation of this result?",
        "options": [
            "The TUG time is ≥12 seconds (or ≥13.5 seconds depending on criteria), indicating a high risk of falls; the clinician should conduct a detailed multi-factorial fall risk assessment including gait, balance, home safety, and medication review",
            "The TUG time is normal, indicating an exceptionally low risk of falls; reassure the patient that no further mobility interventions are needed",
            "The test is invalid because the patient used a cane; the TUG must only be performed without any assistive devices",
            "The TUG score suggests severe cognitive impairment; initiate immediate referral for a brain MRI and lumbar puncture",
            "The TUG score indicates acute joint infection; prescribe immediate empiric intravenous antibiotics"
        ],
        "answer": 0,
        "exp": "The **Timed Up and Go (TUG)** test is a quick, widely used screening tool for gait and balance impairment. The patient is instructed to stand up from a chair, walk 3 meters, turn, walk back, and sit down. They may use their usual walking aid (e.g., cane, walker). Timing thresholds: **<10 seconds is normal** (independent mobility); **≥12 seconds** (according to AGS/CDC STEADI guidelines) or **≥13.5 seconds** (according to other validated cohorts) indicates **high fall risk**. Because this patient took {tug_time} seconds, they are at high risk of falls. This must trigger a multifactorial fall assessment: reviewing medications (Beers list), checking orthostatic vitals, evaluating vision, assessing home safety (OT), and prescribing physical therapy for balance/strength training. (Ref: AGS/BGS Clinical Practice Guideline for Prevention of Falls; CDC STEADI Tool)"
    },
    # T20: Berg Balance Scale (Physical Tests)
    {
        "q": "A {age}-year-old {gender} with a history of two falls in the past 6 months is evaluated in a physical therapy clinic. The therapist administers the **Berg Balance Scale (BBS)**, which consists of 14 static and dynamic balance tasks. The patient receives a score of **{berg_score} out of 56**. Which of the following is the most accurate clinical interpretation and management plan?",
        "options": [
            "A score of ≤45 out of 56 indicates a significantly increased risk of recurrent falls; recommend structured balance and strength training (e.g., Otago Exercise Program or physical therapy) and home environmental safety modifications",
            "A score of {berg_score}/56 is in the optimal range, confirming that the patient's balance is entirely normal and no interventions are required",
            "The Berg Balance Scale is a diagnostic test for Parkinson's disease; a score of {berg_score} confirms idiopathic Parkinson's disease",
            "A low Berg score is a pathognomonic marker for cerebellar stroke; immediate transfer to the emergency department for stroke activation is indicated",
            "The patient requires an immediate orthopedic consultation for bilateral total knee replacements based solely on this score"
        ],
        "answer": 0,
        "exp": "The **Berg Balance Scale (BBS)** is a 14-item scale designed to measure balance in older adults by assessing performance in functional tasks (such as standing on one foot, reaching forward, turning 360 degrees). The maximum score is 56. A score of **≤45/56 is the classic threshold indicating a high risk of falls**. Because this patient scored {berg_score}/56, they are at elevated risk for recurrent falls. The most appropriate management includes: (1) Referral to physical therapy for targeted balance, gait, and strength training; (2) A home safety evaluation (OT); (3) Multi-factorial fall risk reduction (addressing vision, orthostatic hypotension, and polypharmacy). (Ref: Berg et al., Physiother Can 1989; Hazzard's Ch. 12, Ch. 24)"
    },
    # T21: Tinetti POMA Test (Physical Tests)
    {
        "q": "A {age}-year-old {gender} with progressive gait difficulty is evaluated. The clinician performs the **Tinetti Performance Oriented Mobility Assessment (POMA)**, which evaluates both static balance (9 items) and gait characteristics (8 items). The patient scores **{tinetti_score} out of a maximum 28 points**. What is the significance of this score, and how is it structured?",
        "options": [
            "A score of <19 indicates a high risk of falls (scores 19-24 indicate moderate risk); the test evaluates specific gait parameters (like step length and symmetry) and balance parameters (like nudge tolerance)",
            "A score of {tinetti_score}/28 is a normal finding; the POMA is primarily used to screen for peripheral neuropathy",
            "The Tinetti POMA is a cognitive screening tool; a score of {tinetti_score} indicates moderate-to-severe dementia",
            "The POMA is used exclusively to evaluate patients after a hip fracture and has no role in community-dwelling fall risk screening",
            "A low Tinetti score is a diagnostic criteria for sarcopenia and requires immediate androgen replacement therapy"
        ],
        "answer": 0,
        "exp": "The **Tinetti Performance Oriented Mobility Assessment (POMA)** is a task-oriented test that measures an older adult's gait and balance abilities. It has two subscales: **Balance** (max 16 points, evaluating sitting balance, rising, standing balance, turning, and tolerance to a gentle sternal nudge) and **Gait** (max 12 points, evaluating step initiation, step height, step length, step symmetry, path deviation, and trunk stability). The maximum total score is 28. Scoring interpretation: **<19 = High fall risk**; **19–24 = Moderate fall risk**; **>24 = Low fall risk**. With a score of {tinetti_score}, this patient is at high risk of falls and requires targeted physical therapy and multifactorial fall interventions. (Ref: Tinetti ME, JAMA 1986; Hazzard's Ch. 12, Ch. 24)"
    },
    # T22: Functional Reach Test (Physical Tests)
    {
        "q": "A {age}-year-old {gender} is evaluated for balance deficits during a wellness visit. The clinician performs the **Functional Reach Test** by instructing the patient to stand adjacent to a wall, make a fist, extend {possessive} arm, and reach as far forward as possible without taking a step or losing {possessive} balance. The patient achieves a reach of **{reach_dist} inches**. What is the clinical significance of this result?",
        "options": [
            "A functional reach of <10 inches (especially <6-7 inches) indicates a significantly restricted margin of stability and a high risk of falls; refer the patient for balance training",
            "A reach of {reach_dist} inches is exceptional, demonstrating excellent postural control and zero risk of falls",
            "The Functional Reach Test measures cardiac output and predicts myocardial infarction in older adults",
            "The test is designed only to measure shoulder joint range of motion and has no correlation with postural stability or falls",
            "A reach of {reach_dist} inches indicates severe spinal stenosis; the patient should be restricted from all physical activity"
        ],
        "answer": 0,
        "exp": "The **Functional Reach Test** is a quick, single-item clinical tool used to measure a patient's **margin of stability** and dynamic balance. It measures the maximum distance a patient can reach forward beyond arm's length while maintaining a fixed base of support. Scoring and fall risk: **Reach <10 inches (25 cm) indicates increased fall risk**, with a **reach of <6-7 inches indicating a very high fall risk** (associated with a 4-fold increase in fall risk). Since this patient reached {reach_dist} inches, they have impaired dynamic balance and require further evaluation and balance training. (Ref: Duncan et al., J Gerontol 1990; Hazzard's Ch. 12, Ch. 24)"
    },
    # T23: Short Physical Performance Battery (SPPB)
    {
        "q": "A {age}-year-old {gender} is evaluated for frailty using the **Short Physical Performance Battery (SPPB)**. The assessment includes three components: a hierarchical balance test (side-by-side, semi-tandem, and full tandem stand), a 4-meter gait speed test, and a five-times chair stand test. The patient receives a total score of **{sppb_score} out of 12**. Which of the following is the most accurate clinical interpretation of this score?",
        "options": [
            "A score of ≤8 (out of 12) indicates significant physical impairment and is a strong predictor of future functional disability, hospitalization, institutionalization, and all-cause mortality; initiate physical therapy",
            "A score of {sppb_score}/12 indicates robust physical performance; the patient has a very low risk of developing functional dependence",
            "The SPPB is a diagnostic test for motor neuron disease; a score of {sppb_score} confirms amyotrophic lateral sclerosis (ALS)",
            "The SPPB is a cognitive test that replaces the MoCA in patients with severe sensory impairments",
            "The chair stand component of the SPPB is used to diagnose severe osteoarthritis of the hip joint"
        ],
        "answer": 0,
        "exp": "The **Short Physical Performance Battery (SPPB)** is a highly validated, objective tool used to measure lower extremity physical performance and identify frailty/sarcopenia. It consists of three parts (each scored 0–4): (1) **Balance testing** (holding side-by-side, semi-tandem, and full tandem positions for 10 seconds each); (2) **Gait speed** (walking 4 meters at normal pace); (3) **Five-times chair stand** (time taken to stand up and sit down 5 times from a chair without using arms). The total score is out of 12. Scoring interpretation: **≤8 indicates significant physical impairment** and is a powerful, independent predictor of future mobility disability, hospitalization, nursing home admission, and death. A score of {sppb_score}/12 warrants physical therapy referral. (Ref: Guralnik et al., J Gerontol 1994; Hazzard's Ch. 12, Ch. 26)"
    },

    # ===== COGNITIVE/MOOD/DELIRIUM SCREENING (Templates 24-27) =====
    # T24: Mini-Cog (Screens)
    {
        "q": "During a Comprehensive Geriatric Assessment, a {age}-year-old {gender} is screened for cognitive impairment using the **Mini-Cog**. The patient successfully repeats three unrelated words (banana, sunrise, chair). After a brief interval during which {pronoun} is asked to draw a clock face, put in the numbers, and set the hands to '10 past 11', {pronoun} recalls only **1 of the 3 words**. The clock drawing is found to have all numbers in the correct positions, but the hands point to 10 and 11 instead of 2 and 11 (an abnormal clock). What is the patient's Mini-Cog score, and what is the next step in management?",
        "options": [
            "Mini-Cog score is 1/5 (abnormal); this indicates a high likelihood of cognitive impairment and warrants a more detailed cognitive evaluation (e.g., MoCA) and diagnostic workup for dementia",
            "Mini-Cog score is 3/5 (normal); reassure the patient and family that cognitive function is entirely intact",
            "The Mini-Cog is a diagnostic tool for schizophrenia; a score of 1 indicates active psychosis requiring atypical antipsychotics",
            "The clock drawing component is highly subjective and should be ignored; because the patient recalled at least 1 word, the screen is negative",
            "The abnormal clock indicates a focal cerebellar lesion; order an emergent head CT and neurology consultation"
        ],
        "answer": 0,
        "exp": "The **Mini-Cog** is a rapid, 3-minute cognitive screening instrument scored out of 5. It consists of: (1) **3-word recall** (0–3 points); (2) **Clock Drawing Test (CDT)** (0 points if abnormal, 2 points if normal). A normal clock must have all numbers present in the correct order and the hands pointing to the correct time (typically 11:10 or 8:20). Scoring interpretation: **0–2 indicates high likelihood of cognitive impairment** (positive screen); **3–5 indicates low likelihood** (negative screen). This patient gets 1 point for the 1 recalled word and 0 points for the abnormal clock, resulting in a score of **1/5 (abnormal)**. This must trigger a comprehensive dementia evaluation, including a longer cognitive test (MoCA), lab work (TSH, B12, CMP, CBC), and neuroimaging (brain MRI). (Ref: Borson et al., Int J Geriatr Psychiatry 2000; Hazzard's Ch. 12, Ch. 72)"
    },
    # T25: MoCA vs MMSE (Screens)
    {
        "q": "A {age}-year-old {gender} is brought to the clinic by {possessive} family due to subtle changes in planning, multitasking, and driving. The patient scores **27/30** on the Mini-Mental State Examination (MMSE), which is in the 'normal' range. However, the family insists that something is wrong. The clinician decides to administer the **Montreal Cognitive Assessment (MoCA)**, and the patient scores **19/30**. Which of the following best explains why the MoCA detected a deficit that the MMSE missed?",
        "options": [
            "The MoCA has superior sensitivity for detecting Mild Cognitive Impairment (MCI) and early dementia because it includes more demanding tests of executive function (trail making, clock drawing, phonemic fluency) and abstract reasoning compared to the MMSE",
            "The MMSE is highly sensitive to early changes in executive function, but the patient was likely malingering during the first test",
            "The MoCA is a highly specific test for depression and somatic symptoms, whereas the MMSE only screens for language barriers",
            "A score of 19/30 on the MoCA is a normal finding in older adults, while 27/30 on the MMSE indicates severe cortical atrophy",
            "The MMSE is no longer used in clinical practice because it has been legally banned due to copyright infringement"
        ],
        "answer": 0,
        "exp": "The **Mini-Mental State Examination (MMSE)** and the **Montreal Cognitive Assessment (MoCA)** are both 30-point cognitive screens, but they have different clinical strengths. The **MMSE is heavily weighted toward memory and language** and has a significant 'ceiling effect'—meaning patients with high premorbid intelligence or subtle **executive dysfunction** (common in vascular cognitive impairment, frontotemporal dementia, or early Alzheimer's/MCI) can score in the normal range (≥26/30). The **MoCA was specifically designed to detect Mild Cognitive Impairment (MCI)**. It includes much more challenging tests of **executive functioning, visuospatial skills, and attention** (such as a 5-point executive/visuospatial section including a mini-trail making test, clock drawing, cube copy, and phonemic verbal fluency). MoCA sensitivity for MCI is ~90% (vs. ~18% for the MMSE). (Ref: Nasreddine et al., J Am Geriatr Soc 2005; Hazzard's Ch. 12, Ch. 72)"
    },
    # T26: Geriatric Depression Scale (GDS-15) (Screens)
    {
        "q": "A {age}-year-old {gender} is evaluated for progressive social withdrawal, fatigue, and decreased appetite. To screen for depression, the clinician administers the **Geriatric Depression Scale (GDS-15)**. The patient scores **{gds_score} out of 15**. Which of the following statements regarding the GDS-15 is most accurate?",
        "options": [
            "A score of ≥5 on the GDS-15 indicates a positive screen for depression; the tool is highly effective because it deliberately omits somatic symptoms (like fatigue, sleep changes, and weight loss) which frequently overlap with normal aging or physical illness in older adults",
            "A score of {gds_score} is normal; the GDS-15 is only considered positive if the patient scores a perfect 15 out of 15",
            "The GDS-15 is a diagnostic tool for bipolar disorder and requires immediate initiation of lithium therapy",
            "Somatic symptoms are the most reliable indicators of depression in the elderly and are the primary focus of the GDS-15",
            "The GDS-15 is an obsolete tool that has been replaced entirely by the Hamilton Depression Rating Scale in older adults"
        ],
        "answer": 0,
        "exp": "The **Geriatric Depression Scale (GDS-15)** is a 15-item yes/no questionnaire used to screen for depression in older adults. A score of **≥5 indicates a positive screen for depression** (with ≥10 indicating moderate-to-severe depression). Because this patient scored {gds_score}/15, they screen positive. A critical design feature of the GDS is that it **omits somatic symptoms** (such as sleep disturbance, fatigue, changes in appetite, and weight loss). In older populations, these somatic symptoms are highly prevalent due to co-existing physical illnesses, medications, or normal aging, and their inclusion in standard depression screens (like the Beck Depression Inventory) leads to a high rate of false-positive results. By focusing on cognitive and affective symptoms (e.g., life satisfaction, boredom, helplessness, fear of the future), the GDS-15 provides a highly specific screening. (Ref: Yesavage et al., J Psychiatr Res 1983; Hazzard's Ch. 12, Ch. 75)"
    },
    # T27: Confusion Assessment Method (CAM) (Screens)
    {
        "q": "A {age}-year-old {gender} is admitted to the medical ward for a urinary tract infection. On post-admission day 2, the patient becomes acutely confused, starts picking at imaginary objects in the air, and fluctuates between extreme agitation and lethargy. The nurse suspects delirium. To confirm this, the clinician utilizes the **Confusion Assessment Method (CAM)**. Which of the following describes the criteria required to diagnose delirium using the CAM?",
        "options": [
            "Requires the presence of both (1) Acute onset and fluctuating course, AND (2) Inattention; PLUS either (3) Disorganized thinking, OR (4) Altered level of consciousness",
            "Requires the presence of all five DSM-5 criteria for dementia including chronic, irreversible memory decline and cortical atrophy",
            "Requires only the presence of an altered level of consciousness, as acute fluctuations are normal in hospitalized older adults",
            "Requires a positive urine culture and an elevated white blood cell count; clinical features are secondary",
            "Requires an abnormal brain MRI showing acute ischemic changes in the bilateral temporal lobes"
        ],
        "answer": 0,
        "exp": "The **Confusion Assessment Method (CAM)** is the gold-standard bedside screening tool for **delirium**. To establish a diagnosis of delirium, the CAM requires the presence of: (1) **Acute onset and fluctuating course** (evidence of an acute change in mental status from baseline that fluctuates in severity); **AND** (2) **Inattention** (difficulty focusing, easily distracted); **PLUS** either (3) **Disorganized thinking** (rambling conversation, illogical flow) **OR** (4) **Altered level of consciousness** (ranging from hyperalert/agitated to lethargic/stuporous). Delirium is an acute medical emergency representing acute brain dysfunction, usually triggered by underlying medical illnesses (infections, drugs, dehydration) in vulnerable hosts. (Ref: Inouye et al., Ann Intern Med 1990; Hazzard's Ch. 12, Ch. 27)"
    },

    # ===== NUTRITIONAL & SENSORY (Templates 28-31) =====
    # T28: Mini Nutritional Assessment (MNA) (Nutrition)
    {
        "q": "A {age}-year-old {gender} is undergoing a wellness evaluation. The clinician administers the **Mini Nutritional Assessment Short-Form (MNA-SF)**, which covers food intake decline, weight loss, mobility, acute stress/disease, neuropsychological problems, and Body Mass Index (BMI). The patient receives a score of **{mna_score} out of 14**. What is the clinical significance of this score, and what is the next step in management?",
        "options": [
            "A score of ≤11 out of 14 indicates a risk of malnutrition (with ≤7 indicating malnutrition); this patient requires a detailed nutritional assessment, dietary review, and targeted nutritional interventions",
            "A score of {mna_score}/14 is optimal, indicating excellent nutritional status; no interventions or changes are needed",
            "The MNA-SF is a diagnostic tool for celiac disease; a low score requires an immediate referral for upper endoscopy and duodenal biopsy",
            "A low MNA-SF score indicates that the patient should be placed on a strict low-calorie diet to prevent metabolic syndrome",
            "The MNA-SF is a cognitive screening tool; a score of {mna_score} indicates that the patient has advanced dementia"
        ],
        "answer": 0,
        "exp": "The **Mini Nutritional Assessment Short-Form (MNA-SF)** is a rapid, validated screening tool designed to identify nutritional issues in older adults. It is scored out of 14 points. Scoring thresholds: **12–14 points = Normal nutritional status**; **8–11 points = At risk of malnutrition**; **0–7 points = Malnourished**. Because this patient scored {mna_score}/14, they are 'at risk of malnutrition' (or malnourished if ≤7). This positive screen must trigger: (1) A comprehensive dietary assessment (calorie counts, food preferences); (2) Evaluation of reversible causes (poor dentition, dysphagia, social isolation, depression, medications, financial limits); (3) Weight monitoring and consideration of nutritional supplements or referral to a dietitian. (Ref: Guigoz et al., J Nutr Health Aging 2006; Hazzard's Ch. 12, Ch. 29)"
    },
    # T29: Unintentional Weight Loss Workup (Nutrition)
    {
        "q": "A {age}-year-old {gender} presents with progressive weight loss. The patient's spouse notes that {possessive} clothes have become noticeably baggy. A review of clinic records confirms that the patient's weight has dropped from 160 lbs to 142 lbs over the past 6 months (a **{weight_loss_pct}% decline**), which was unintentional. {pronoun_cap} has no specific pain, fever, or changes in bowel habits. Which of the following is the standard definition of clinically significant weight loss in older adults, and what is the most appropriate initial diagnostic workup?",
        "options": [
            "Unintentional weight loss of ≥5% of body weight in 6 months (or ≥10% in 1 year) is clinically significant; the initial workup includes a comprehensive history, physical exam, medication review, depression screening, and basic laboratory tests (CBC, CMP, TSH, B12, urinalysis, stool guaiac)",
            "Clinically significant weight loss is defined as a drop of at least 25% of body weight in 3 months; the initial step is an immediate whole-body CT scan and PET scan to look for occult malignancy",
            "Any weight loss in older adults is considered normal and benign; reassure the patient and recommend high-fat foods only",
            "Weight loss of ≥5% requires immediate placement of a percutaneous endoscopic gastrostomy (PEG) tube to prevent further decline",
            "The initial step is to discontinue all oral antihypertensive medications as they are the primary cause of muscle wasting"
        ],
        "answer": 0,
        "exp": "Clinically significant **unintentional weight loss** in older adults is defined as an involuntary weight loss of **≥5% of body weight in 6 months, or ≥10% in 1 year**. It is associated with increased morbidity and mortality. The initial diagnostic approach should be systematic and non-invasive, starting with a **detailed history, physical exam, review of medications (polypharmacy), depression screening (GDS), and baseline labs** (Complete Blood Count, Complete Metabolic Panel to check renal/hepatic function and albumin, Thyroid Stimulating Hormone to rule out hyperthyroidism, Vitamin B12, urinalysis, and fecal occult blood testing). Advanced imaging (CT/PET) is NOT recommended as an initial screen unless specific red-flag symptoms or focal physical findings suggest malignancy. (Ref: Hazzard's Ch. 29; Alibhai et al., Am J Med 2005)"
    },
    # T30: Vision Impairment Screenings (Sensory)
    {
        "q": "A {age}-year-old {gender} presents for a routine physical. The clinician performs a **Snellen chart** visual acuity test, and the patient's vision is **20/60** in the right eye and **20/80** in the left eye with {possessive} current glasses. {pronoun_cap} reports difficulty reading labels and driving at night. Which of the following statements regarding vision impairment screening in the CGA is most accurate?",
        "options": [
            "Vision impairment (acuity worse than 20/40) is a major risk factor for falls, hip fractures, depression, and cognitive decline; refer the patient to ophthalmology for a comprehensive exam to evaluate for cataracts, age-related macular degeneration (AMD), glaucoma, or refractive error",
            "Vision of 20/80 is considered normal in this age group; reassure the patient that no further ophthalmological evaluations are necessary",
            "The Snellen chart is a diagnostic test for glaucoma; a score of 20/80 confirms closed-angle glaucoma",
            "The patient should be immediately reported to the state licensing agency to have {possessive} driver's license permanently revoked without further testing",
            "Prescribe low-dose atypical antipsychotics to manage the patient's complaints of nighttime driving difficulty"
        ],
        "answer": 0,
        "exp": "Vision impairment is highly prevalent in older adults and is a critical domain in the Comprehensive Geriatric Assessment (CGA). Visual acuity of **worse than 20/40 is abnormal**. Uncorrected vision loss is a powerful **independent risk factor for falls, hip fractures, social isolation, depression, and accelerated cognitive decline**. The Snellen chart is a screening tool, not a diagnostic one. A positive screen (acuity worse than 20/40, or new symptoms) must prompt a referral to an ophthalmologist or optometrist to identify and treat reversible or progressive conditions, including: (1) Refractive errors; (2) **Cataracts** (most common cause of reversible vision loss); (3) **Age-related Macular Degeneration (AMD)** (leading cause of irreversible blindness); (4) **Glaucoma**; (5) **Diabetic retinopathy**. (Ref: Hazzard's Ch. 12, Ch. 45; AGS Geriatrics At Your Fingertips)"
    },
    # T31: Hearing Impairment Screenings (Sensory)
    {
        "q": "A {age}-year-old {gender} is brought to the clinic by {possessive} spouse, who reports that the patient 'turns the television up to maximum volume' and frequently withdraws from family conversations. During the CGA, the clinician performs the **handheld whisper test** (standing 2 feet behind the patient, whispering a sequence of numbers/letters while masking the contralateral ear), and the patient fails to repeat the sequence. Which of the following is the most likely diagnosis, and what is the clinical significance of hearing loss in older adults?",
        "options": [
            "Presbyacusis (age-related high-frequency sensorineural hearing loss); hearing loss is strongly associated with social isolation, depression, and is one of the most modifiable risk factors for accelerated cognitive decline/dementia",
            "Otosclerosis (conductive hearing loss); hearing loss has no correlation with cognitive or psychological function in older adults",
            "Acoustic neuroma (vestibular schwannoma); this patient requires an immediate referral for brain surgery",
            "Normal auditory aging; tell the spouse to speak in a loud, high-pitched scream to communicate with the patient",
            "Meniere's disease; treat the patient immediately with high-dose intravenous diuretics and a fluid-restricted diet"
        ],
        "answer": 0,
        "exp": "Hearing loss affects over two-thirds of adults over age 70. The most common cause is **presbyacusis**—characterized by progressive, bilateral, symmetric, **high-frequency sensorineural hearing loss** caused by the degeneration of cochlear hair cells. The handheld whisper test is a highly sensitive and specific screening tool. In the CGA, addressing hearing loss is vital because untreated hearing impairment is a powerful **independent risk factor for social isolation, depression, and cognitive decline**. Crucially, the Lancet Commission on Dementia identified midlife/late-life hearing loss as the **single largest modifiable risk factor for dementia**, accounting for an 8% relative reduction in dementia risk if fully corrected with hearing aids. Speaking in a high-pitched voice is counterproductive because high frequencies are lost first; instead, speak in a clear, deep, low-pitched voice facing the patient. (Ref: Hazzard's Ch. 12, Ch. 46; Livingston et al., Lancet 2020)"
    },

    # ===== SOCIAL, ENVIRONMENTAL, SAFETY (Templates 32-35) =====
    # T32: Home Safety / Environmental (Safety)
    {
        "q": "A {age}-year-old {gender} with moderate knee osteoarthritis, mild peripheral neuropathy, and a history of a recent non-syncopal fall is preparing for discharge after a brief hospital stay. The team is addressing fall prevention. Which of the following represents the most evidence-based, high-yield intervention to improve home safety and reduce the risk of recurrent falls?",
        "options": [
            "Refer the patient for a home safety evaluation by an Occupational Therapist (OT) to assess for environmental hazards (e.g., remove throw rugs, improve lighting, install grab bars in the bathroom, add handrails to stairs) and provide adaptive equipment",
            "Advise the patient to remain seated or in bed for at least 22 hours a day to prevent all physical contact with environmental hazards",
            "Prescribe low-dose benzodiazepines nightly to reduce the patient's fear of falling during ambulation",
            "Order a commercial wheelchair and advise the patient to never attempt standing again",
            "Advise the patient to carpet the entire house with thick shag rugs to cushion the impact of future falls"
        ],
        "answer": 0,
        "exp": "Environmental hazards in the home are responsible for 30–50% of falls in older adults. A home safety assessment performed by an **Occupational Therapist (OT)** is a highly effective, evidence-based intervention that reduces fall rates by up to 30% in high-risk patients. The OT evaluates the patient performing functional activities in their own environment and recommends: (1) **Removing hazards** — especially throw rugs, electrical cords, and clutter; (2) **Bathroom modifications** — installing professional grab bars (not towel racks) in the tub/shower and next to the toilet, using a raised toilet seat or tub transfer bench; (3) **Stair safety** — securing double handrails; (4) **Lighting** — installing nightlights in hallways and bright, glare-free lighting on stairwells. Thick carpeting, benzodiazepines (which increase falls per Beers Criteria), and physical restraints actually *increase* the risk of falls and injury. (Ref: Gillespie et al., Cochrane Database Syst Rev 2012; Hazzard's Ch. 24)"
    },
    # T33: Driving Evaluations (Safety)
    {
        "q": "A {age}-year-old {gender} with mild-to-moderate Alzheimer's disease is brought to the clinic. The family reports that the patient has had two minor car accidents in the past month, frequently gets lost in familiar areas, and has difficulty staying in {possessive} lane. The patient insists that {pronoun} is a 'perfectly safe driver.' Which of the following is the most appropriate clinical and ethical management step?",
        "options": [
            "Perform a comprehensive evaluation (including vision screening, cognitive testing of executive/visuospatial function, and neck range of motion), advise the patient to immediately stop driving, and refer the patient to a certified driving rehabilitation specialist (CDRS) for a formal on-road driving evaluation",
            "Reassure the family that because the accidents were minor, the patient can continue driving as long as {pronoun} avoids driving at rush hour",
            "Immediately notify the police department to have the patient arrested and the vehicle impounded",
            "Prescribe a high dose of a cholinesterase inhibitor and inform the patient that this completely restores safe driving abilities",
            "Tell the family that legally the physician has no right to discuss driving safety and they must manage the issue without medical input"
        ],
        "answer": 0,
        "exp": "Driving is a highly valued IADL that represents independence, but the safety of the patient and the public is paramount. When driving safety is questioned (due to accidents, getting lost, or cognitive decline), the clinician must: (1) **Assess key driving-related domains** — vision (acuity/visual fields), cognition (executive function, trail making, visuospatial skills), and motor skills (neck rotation, reaction time); (2) **Counsel the patient and family** — if severe deficits are present (such as in moderate-to-severe dementia), the patient must be advised to **stop driving immediately**; (3) **Refer for formal evaluation** — if the case is borderline or the patient lacks insight, refer to a **Certified Driving Rehabilitation Specialist (CDRS)** for a formal, standardized off-road and on-road driving assessment; (4) **Understand legal duties** — in many jurisdictions, physicians are mandated or permitted to report cognitively impaired drivers to the department of motor vehicles. (Ref: Hazzard's Ch. 12, Ch. 73; AMA Ethical Guidelines on Impaired Drivers)"
    },
    # T34: Elder Abuse & Neglect Screenings (Safety)
    {
        "q": "A {age}-year-old {gender} with moderate dementia and osteoarthritis is brought to the clinic for a routine visit. On physical examination, the nurse notes multiple linear bruises on the patient's upper back, a deep pressure injury over the sacrum with a foul odor, and severe perineal dermatitis from soiled incontinence briefs. The patient appears quiet and looks at {possessive} primary caregiver (adult child) before answering any questions. The caregiver appears angry and complains loudly about the financial and physical burden of care. Which of the following is the most appropriate next step in management?",
        "options": [
            "Interview the patient alone in a safe, private space to screen for elder abuse and neglect, and file a report immediately with Adult Protective Services (APS) or the state regulatory agency based on clinical suspicion of neglect and physical abuse",
            "Confront the caregiver aggressively in front of the patient and demand that they apologize for the poor care",
            "Reassure the caregiver that caregiver burden is normal and no interventions are needed since the bruising is likely due to 'easy bruising' of aging",
            "Discontinue all pain medications and cognitive therapies to simplify the caregiver's daily routine",
            "Admit the patient to the hospital and refuse to allow the caregiver to visit, without filing any external reports"
        ],
        "answer": 0,
        "exp": "Elder abuse and neglect affect up to 10% of older adults, with cognitively impaired individuals being at the highest risk. Signs of **neglect** include poor hygiene, untreated pressure ulcers, soiled clothing, and malnutrition. Signs of **physical abuse** include bruises on non-exposed areas (back, inner thighs) that are atypical for accidental falls (which usually occur on bony prominences like knees and elbows). Clinicians must: (1) **Interview the patient alone** to ask direct, non-judgmental questions; (2) **Identify caregiver burnout/stress**, which is a major risk factor for abuse; (3) **Mandatory Reporting** — in almost all states, clinicians are legally mandated to report any **reasonable suspicion** of elder abuse, neglect, or financial exploitation to **Adult Protective Services (APS)**. You do not need absolute proof; clinical suspicion is the threshold for reporting. (Ref: Hazzard's Ch. 12, Ch. 14; Lachs & Pillemer, N Engl J Med 2015)"
    },
    # T35: Advance Care Planning (Safety)
    {
        "q": "A {age}-year-old {gender} with a progressive, life-limiting neurodegenerative condition is undergoing a Comprehensive Geriatric Assessment. The clinical team is facilitating **Advance Care Planning (ACP)**. The patient states, 'If my heart stops or I can't breathe on my own, I do not want machines keeping me alive, and I want my oldest child to make decisions for me if I can't speak.' Which of the following represents the most legally and clinically appropriate set of documents to execute this patient's wishes?",
        "options": [
            "Execute a Durable Power of Attorney for Healthcare (to designate the surrogate decision-maker), complete a Living Will (outlining preferences for life-sustaining treatments), and translate these into an actionable Physician Orders for Life-Sustaining Treatment (POLST/MOLST) form signed by the clinician",
            "Advise the patient that oral statements to the family are the only legally binding form of advance directive in all states",
            "Create a standard financial will, as this is the primary document used by physicians to determine resuscitation status in the emergency department",
            "Inform the patient that advance care planning is only permitted for patients who are actively dying in an ICU setting",
            "Execute a unilateral 'Do Not Resuscitate' (DNR) order in the chart without discussing the decision with the designated surrogate"
        ],
        "answer": 0,
        "exp": "Advance Care Planning (ACP) involves two key components: (1) **Designating a surrogate decision-maker** — via a **Durable Power of Attorney for Healthcare** (Healthcare Proxy); (2) **Documenting treatment preferences** — via a **Living Will**. In patients with advanced illness or progressive decline, these preferences should be translated into a **Physician Orders for Life-Sustaining Treatment (POLST)** or Medical Orders for Life-Sustaining Treatment (MOLST) form. Unlike a living will (which is a general planning document), a POLST/MOLST is a set of **actionable medical orders** signed by a clinician that is highly visible and must be honored by emergency medical services (EMS) across care settings (home, nursing home, hospital). (Ref: Hazzard's Ch. 12, Ch. 15; AGS Geriatrics At Your Fingertips)"
    },

    # ===== PHARMACOLOGICAL REVIEW (Templates 36-39) =====
    # T36: Beers Criteria - Anticholinergic Burden (Pharma)
    {
        "q": "A {age}-year-old {gender} is brought to the clinic due to a recent fall, worsening dry mouth, severe constipation, and episodes of acute confusion at night. A review of the patient's medications reveals that the patient has been taking **{medication}** ({mna_score} mg) nightly for insomnia. Which of the following is the best interpretation of this medication use according to the **Beers Criteria**, and what is the most appropriate management?",
        "options": [
            "The medication is a highly inappropriate drug for older adults due to its potent anticholinergic activity, which increases the risk of delirium, falls, dry mouth, urinary retention, and constipation; discontinue the medication and manage insomnia with sleep hygiene and cognitive behavioral therapy (CBT-I)",
            "The medication is the safest first-line sedative-hypnotic in older adults and should be continued at a higher dose to eliminate nighttime confusion",
            "The medication's side effects are normal aging changes and should be treated by adding a laxative, a saliva stimulant, and an atypical antipsychotic",
            "The medication is safe in older adults because its anticholinergic effects are purely peripheral and have no central nervous system penetration",
            "The medication should be replaced immediately with high-dose amitriptyline to improve both sleep and bladder function"
        ],
        "answer": 0,
        "exp": "According to the **AGS Beers Criteria for Potentially Inappropriate Medication Use in Older Adults**, drugs with **potent anticholinergic properties** (e.g., first-generation antihistamines like **diphenhydramine** or **hydroxyzine**, tricyclic antidepressants like **amitriptyline**, and urinary antispasmodics like **oxybutynin**) should be **strongly avoided** in older adults. Older adults have age-related reductions in cholinergic transmission, making them highly susceptible to anticholinergic side effects: **central** (delirium, cognitive decline, drowsiness, fall risk) and **peripheral** (dry mouth, blurred vision, severe constipation, urinary retention). The medication must be tapered and discontinued, and underlying insomnia managed with non-pharmacological therapies (Sleep Hygiene, Cognitive Behavioral Therapy for Insomnia [CBT-I]) or safer agents (e.g., low-dose melatonin). (Ref: AGS Beers Criteria 2023; Hazzard's Ch. 30)"
    },
    # T37: Beers Criteria - Prescribing Cascades (Pharma)
    {
        "q": "A {age}-year-old {gender} presents with progressive ankle swelling and a history of hypertension. The patient was started on **{anti_hypertensive}** 10 mg daily by another physician {duration} months ago. A week later, due to bilateral ankle edema, {pronoun} was prescribed **furosemide** 40 mg daily. The patient now presents with frequent nocturnal urination, muscle cramps, and orthostatic dizziness. Which of the following clinical concepts does this scenario represent, and what is the correct management?",
        "options": [
            "A prescribing cascade, where a side effect of one medication ({anti_hypertensive}-induced peripheral edema) is misdiagnosed as a new medical condition, leading to the prescription of an unnecessary and harmful second medication (furosemide); discontinue furosemide, reduce or stop {anti_hypertensive}, and switch to a safer antihypertensive class (e.g., ACE inhibitor or ARB)",
            "Standard multi-drug management of essential hypertension; the ankle edema indicates new-onset congestive heart failure requiring an increase in both medications",
            "A drug-drug interaction that can be resolved by changing the time of day the medications are taken, without altering the doses",
            "A genetic resistance to calcium channel blockers; the patient requires immediate referral for a renal biopsy",
            "An acute allergic reaction to furosemide; the patient should be treated with high-dose intravenous corticosteroids indefinitely"
        ],
        "answer": 0,
        "exp": "This is a classic example of a **prescribing cascade**—a critical clinical concept in geriatrics. A prescribing cascade occurs when an **adverse drug reaction (ADR) is misinterpreted as a new medical condition**, and a subsequent drug is prescribed to treat the symptom. Calcium channel blockers (like **amlodipine** or **nifedipine**) cause arteriolar vasodilation, leading to **fluid transudation and peripheral edema** (a benign, non-cardiac, non-renal side effect). Prescribing a loop diuretic (furosemide) to treat this edema is ineffective, inappropriate, and exposes the patient to serious risks (volume depletion, hypokalemia, nocturnal polyuria leading to falls, orthostatic hypotension). The correct management is to recognize the cascade, **discontinue the loop diuretic**, and address the primary drug (stop/reduce amlodipine and substitute it with an ACE inhibitor or ARB, which do not cause significant edema). (Ref: Rochon & Gurwitz, BMJ 1997; Hazzard's Ch. 30)"
    },
    # T38: STOPP/START Criteria (Pharma)
    {
        "q": "A {age}-year-old {gender} with a history of type 2 diabetes, chronic kidney disease (eGFR 35 mL/min), and chronic gout is evaluated. The patient's medication list is reviewed using the **STOPP/START criteria** (Screening Tool of Older Persons' Prescriptions and Screening Tool to Alert to Right Treatment). The patient is currently taking **glimepiride** (a long-acting sulfonylurea) and **NSAIDs** (naproxen daily for joint pain), but is NOT taking an **ACE inhibitor** or an **osteoporosis preventive** despite a history of a recent vertebral fracture. Which of the following represents the most appropriate set of interventions based on STOPP/START principles?",
        "options": [
            "Discontinue glimepiride (STOPP; high risk of prolonged hypoglycemia) and switch to a safer agent; discontinue daily NSAIDs (STOPP; high risk of worsening CKD and GI bleed); and initiate an ACE inhibitor (START; renal protection in diabetes) and a bisphosphonate (START; osteoporosis treatment)",
            "Continue all current medications and add high-dose prednisone daily to manage the joint pain",
            "The STOPP/START criteria are used only in pediatric medicine; no medication changes are warranted",
            "Discontinue the ACE inhibitor and double the dose of daily NSAIDs to maximize pain control",
            "The criteria recommend discontinuing all medications and initiating full-time homeopathic remedies"
        ],
        "answer": 0,
        "exp": "The **STOPP/START criteria** are an evidence-based clinical tool used to identify potentially inappropriate medications (**STOPP**) and potentially omitted indicated medications (**START**) in older adults. (1) **STOPP targets in this patient**: **Long-acting sulfonylureas (glimepiride, glyburide)** should be stopped due to a very high risk of severe, prolonged hypoglycemia; **NSAIDs** should be stopped in patients with chronic kidney disease (eGFR <60) due to risks of acute kidney injury, fluid retention, and gastrointestinal bleeding. (2) **START targets in this patient**: An **ACE inhibitor or ARB** is indicated for renal protection in patients with diabetes and albuminuria/CKD; a **bisphosphonate or other anti-resorptive** is strongly indicated for osteoporosis prevention in an older patient with a prior fragility fracture (vertebral fracture). (Ref: O'Mahony et al., Age Ageing 2015; Hazzard's Ch. 30)"
    },
    # T39: Polypharmacy / Brown-Bag (Pharma)
    {
        "q": "A {age}-year-old {gender} presents with progressive dizziness, recurrent near-syncope, and cognitive slowing. The patient brings a large paper bag containing **{gds_score} active prescription medications** from three different specialists, along with five over-the-counter supplements. Orthostatic vitals show a blood pressure drop of **24 mmHg** upon standing. Which of the following is the correct definition of polypharmacy, and what is the best stepwise strategy for a 'brown-bag review' and deprescribing?",
        "options": [
            "Polypharmacy is typically defined as the concomitant use of ≥5 medications; the best strategy is a systematic review of all active bottles ('brown-bag review'), identifying duplications, screening for drug-drug interactions, assessing indications, and step-by-step deprescribing of non-essential or high-risk drugs",
            "Polypharmacy is defined as taking more than 20 medications; the best strategy is to immediately stop all medications cold turkey without tapering",
            "The 'brown-bag review' is a safety inspection of the patient's food storage areas to rule out mold contamination",
            "The presence of polypharmacy indicates that the patient requires more specialist consultations to manage each medication separately",
            "The clinician should instruct the patient to throw away the paper bag and purchase only branded over-the-counter vitamins"
        ],
        "answer": 0,
        "exp": "**Polypharmacy** is most commonly defined as the concurrent use of **five or more prescription medications**. It is a major risk factor for adverse drug events, drug-drug interactions, cognitive decline, falls, and mortality. A **'brown-bag review'** is a critical clinical process where the patient brings in ALL actual medication bottles (including OTCs, supplements, and herbals). The clinician performs medication reconciliation, checks for: (1) Therapeutic duplication (taking two drugs in the same class); (2) Prescribing cascades; (3) Indication-prescription mismatch (drugs with no active indication); (4) Potentially inappropriate medications (Beers list). **Deprescribing** is the systematic, supervised process of tapering and discontinuing unnecessary, ineffective, or high-risk medications, which has been shown to improve cognition, reduce falls, and enhance quality of life in older adults. (Ref: Hazzard's Ch. 30; AGS Geriatrics At Your Fingertips)"
    },

    # ===== CONTINENCE & REVERSIBLE CAUSES (Template 40) =====
    # T40: Urinary Continence / DIAPPERS (Continence)
    {
        "q": "A {age}-year-old {gender} with moderate cognitive decline and severe knee osteoarthritis is brought to the clinic for new-onset urinary incontinence over the past 2 weeks. The patient has been having frequent accidents at home and is highly distressed. The clinician recalls the **DIAPPERS mnemonic** for transient, reversible causes of urinary incontinence in older adults. Urinalysis shows pyuria and bacteriuria, and the patient was recently started on a strong first-generation antihistamine for allergies. Which of the following represents the most appropriate initial management?",
        "options": [
            "Treat the symptomatic urinary tract infection (Infection), discontinue the first-generation antihistamine (Pharmaceuticals), and optimize pain management for knee arthritis to improve mobility (Restricted mobility)",
            "Prescribe oxybutynin immediately to suppress detrusor contractions, while continuing the antihistamine",
            "Place an indwelling Foley catheter permanently to manage the incontinence and avoid diagnostic testing",
            "Recommend immediate surgical bladder neck suspension as first-line therapy for all new-onset incontinence",
            "Reassure the family that new-onset incontinence is an expected and irreversible progression of dementia"
        ],
        "answer": 0,
        "exp": "New-onset urinary incontinence in older adults should always prompt an evaluation for **transient, reversible causes** before considering chronic therapies or surgery. The **DIAPPERS mnemonic** covers these causes: (D) **Delirium**; (I) **Infection** (symptomatic UTI); (A) **Atrophic vaginitis/urethritis**; (P) **Pharmaceuticals** (e.g., highly anticholinergic antihistamines causing retention/overflow, or diuretics causing urgency); (P) **Psychological** (severe depression); (E) **Excess urine output** (hyperglycemia, hypercalcemia); (R) **Restricted mobility** (severe arthritis preventing timely access to the toilet); (S) **Stool impaction** (compressing the bladder neck). In this patient, addressing three transient factors is first-line: treating the UTI, stopping the high-risk antihistamine, and managing knee arthritis pain to restore mobility. Adding oxybutynin (a highly anticholinergic Beers drug) would worsen retention and cognition. (Ref: Hazzard's Ch. 12, Ch. 78)"
    }
]

# ===== POOLS FOR GENERATING UNIQUE VARIATIONS =====

genders_pool = [
    {"gender": "female", "pronoun": "she", "pronoun_cap": "She", "possessive": "her", "possessive_cap": "Her"},
    {"gender": "male", "pronoun": "he", "pronoun_cap": "He", "possessive": "his", "possessive_cap": "His"},
    {"gender": "woman", "pronoun": "she", "pronoun_cap": "She", "possessive": "her", "possessive_cap": "Her"},
    {"gender": "man", "pronoun": "he", "pronoun_cap": "He", "possessive": "his", "possessive_cap": "His"}
]

medications_pool = ["diphenhydramine", "amitriptyline", "hydroxyzine", "oxybutynin"]
anti_hypertensives_pool = ["amlodipine", "nifedipine"]

mcqs = []
seen_questions = set()

# Generate exactly 10 variants per template = 400 MCQs
for t_idx, t in enumerate(templates):
    variants_generated = 0
    attempts = 0
    while variants_generated < 10 and attempts < 2000:
        attempts += 1
        age = random.randint(66, 97)
        gp = random.choice(genders_pool)
        duration = random.randint(2, 6)
        weight_loss_pct = random.randint(6, 14)
        tug_time = random.randint(13, 26)
        berg_score = random.randint(28, 44)
        tinetti_score = random.randint(11, 18)
        reach_dist = random.randint(4, 9)
        sppb_score = random.randint(3, 8)
        moca_score = random.randint(18, 24)
        gds_score = random.randint(6, 12)
        mna_score = random.randint(5, 11)
        medication = random.choice(medications_pool)
        anti_hypertensive = random.choice(anti_hypertensives_pool)

        format_kwargs = {
            "age": age,
            "gender": gp["gender"],
            "pronoun": gp["pronoun"],
            "pronoun_cap": gp["pronoun_cap"],
            "possessive": gp["possessive"],
            "possessive_cap": gp["possessive_cap"],
            "duration": duration,
            "weight_loss_pct": weight_loss_pct,
            "tug_time": tug_time,
            "berg_score": berg_score,
            "tinetti_score": tinetti_score,
            "reach_dist": reach_dist,
            "sppb_score": sppb_score,
            "moca_score": moca_score,
            "gds_score": gds_score,
            "mna_score": mna_score,
            "medication": medication,
            "anti_hypertensive": anti_hypertensive
        }

        try:
            q_text = t["q"].format(**format_kwargs)
        except KeyError as e:
            print(f"KeyError in template {t_idx} (q): {e}")
            continue

        if q_text in seen_questions:
            continue

        opts_formatted = []
        for o in t["options"]:
            try:
                o_fmt = o.format(**format_kwargs)
            except KeyError:
                o_fmt = o
            opts_formatted.append(o_fmt)

        try:
            exp_formatted = t["exp"].format(**format_kwargs)
        except KeyError:
            exp_formatted = t["exp"]

        correct_opt = opts_formatted[t["answer"]]
        random.shuffle(opts_formatted)
        new_ans_idx = opts_formatted.index(correct_opt)

        q_esc = q_text.replace("'", "''")
        opts_json = json.dumps(opts_formatted).replace("'", "''")
        exp_esc = exp_formatted.replace("'", "''")

        mcq_str = f"    (v_topic_id, '{q_esc}', '{opts_json}'::jsonb, {new_ans_idx}, '{exp_esc}')"

        seen_questions.add(q_text)
        mcqs.append(mcq_str)
        variants_generated += 1

print(f"Total unique MCQs generated: {len(mcqs)}")

# Split into 4 parts of 100
parts = [mcqs[i:i+100] for i in range(0, len(mcqs), 100)]

for part_num, part_mcqs in enumerate(parts, 1):
    out_file = f"c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260521_geri_functional_mcqs_p{part_num}.sql"
    with open(out_file, "w", encoding="utf-8") as f:
        f.write(f"-- US MD/MBBS (4th Year) clinical case blocks - Geriatrics: Functional assessment - ADLs, iADLs, Comprehensive Geriatric Assessment, frailty scoring - Part {part_num} ({(part_num-1)*100+1}-{part_num*100})\n")
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
