import json
import random

random.seed(99)

topic_slug = 'geri-social-determinants'

# ============================================================
# Pools of Variables for Randomization
# ============================================================
female_names = [
    "Margaret", "Eleanor", "Dorothy", "Ruth", "Mildred", "Frances", "Elizabeth",
    "Helen", "Alice", "Florence", "Gladys", "Marie", "Lillian", "Evelyn", "Jean",
    "Rose", "Irene", "Shirley", "Hazel", "Gertrude", "Louise", "Grace", "Ruby",
    "Virginia", "Catherine", "Martha", "Edna", "Phyllis", "Clara", "Edith", "Beatrice",
    "Esther", "Lois", "Bernice", "Norma", "Agnes", "Mabel", "Blanche"
]

male_names = [
    "James", "John", "Robert", "William", "Charles", "Thomas", "Walter", "Arthur",
    "Albert", "Harold", "Richard", "Joseph", "Henry", "George", "Edward", "Raymond",
    "Paul", "Donald", "Harry", "Ralph", "Kenneth", "David", "Eugene", "Howard",
    "Frank", "Lawrence", "Herbert", "Roy", "Clarence", "Stanley", "Bernard",
    "Leonard", "Edwin", "Carl", "Earl", "Fred", "Louis", "Vernon"
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

ages_pool = list(range(67, 98, 2))
caregivers_pool = ["adult son", "daughter", "spouse", "grandson", "granddaughter", "nephew", "niece", "paid caregiver"]
dementia_stages_pool = ["mild", "moderate", "advanced", "severe"]
zarit_scores_pool = [44, 51, 58, 62, 67, 71, 74, 55, 48, 63]
phq9_scores_pool = [14, 16, 18, 12, 19, 15, 17, 20, 13, 11]
income_pool = ["$800/month Social Security", "$950/month Social Security", "$1,100/month combined income",
               "$720/month fixed income", "$1,050/month pension", "$880/month Social Security Disability"]
months_pool = [3, 4, 5, 6, 8, 9, 10, 12]
hours_pool = [10, 12, 14, 16, 18, 20, 22]
years_pool = [2, 3, 4, 5, 6, 7, 8]
adl_count_pool = [3, 4, 5, 6]
iadl_count_pool = [4, 5, 6, 7]
states_pool = ["New York", "Florida", "Texas", "California", "Illinois", "Pennsylvania", "Ohio"]

templates = [
    # ===== CAREGIVER BURDEN (T1–T12) =====
    # T1: Zarit Burden Interview — identifying high caregiver burden
    {
        "q": "A {age}-year-old {gender} named {name} with {dementia_stage} dementia has been cared for at home by {possessive} {caregiver} for the past {years} years. The {caregiver} reports feeling overwhelmed, missing work, and having no time for personal activities. The clinician administers the Zarit Burden Interview (ZBI), and the {caregiver} scores {zarit}. Which of the following is the most appropriate interpretation and next step?",
        "options": [
            "A ZBI score ≥ 21 indicates significant caregiver burden; refer the caregiver to a social worker, recommend a caregiver support group, arrange respite care services, and screen the caregiver for depression and burnout",
            "A ZBI score of this level is within normal limits for caregivers; reassure the {caregiver} that these feelings are completely expected and require no intervention",
            "The ZBI is used exclusively to assess the patient's cognitive decline; repeat the Mini-Mental State Examination (MMSE) to evaluate the patient's disease progression",
            "A ZBI score in this range mandates immediate involuntary psychiatric hospitalization of the caregiver for acute burnout syndrome",
            "Advise the caregiver that their only legal option is to continue providing full-time home care without institutional support until the patient dies"
        ],
        "answer": 0,
        "exp": "The **Zarit Burden Interview (ZBI)** is a validated 22-item self-report tool used to assess caregiver burden in dementia caregivers. Scores range from 0–88, with higher scores indicating greater burden. Thresholds: 0–20 (little/no burden), 21–40 (mild–moderate), 41–60 (moderate–severe), 61–88 (severe burden). Any score ≥ 21 warrants clinical intervention. Interventions include: (1) referral to a licensed clinical social worker; (2) enrollment in caregiver support groups (e.g., Alzheimer's Association); (3) arrangement of **respite care** (temporary relief: adult day programs, short-term nursing home stays); (4) depression and anxiety screening for the caregiver (PHQ-9, GAD-7); (5) community resource linkage. Caregiver health directly impacts patient outcomes. (Ref: Hazzard's Ch. 14 & Ch. 17; AGS Geriatrics At Your Fingertips; UWorld Step 2 CK)"
    },
    # T2: Caregiver depression screening (PHQ-9 positive)
    {
        "q": "A {age}-year-old {gender} named {name} with advanced Alzheimer's disease is brought to the clinic by {possessive} {caregiver}, who has been the sole caregiver for {years} years. The clinician notices that the {caregiver} appears tearful, disheveled, and states, 'I haven't slept in days, I've lost {weight_loss} pounds in a month, and I feel hopeless.' The clinician administers the PHQ-9 to the caregiver, and the score is {phq9}. Which of the following is the most appropriate immediate clinical response?",
        "options": [
            "Recognize that the caregiver is experiencing major depressive disorder; refer immediately for psychiatric evaluation and treatment, arrange emergency respite care for the patient, and conduct a safety assessment including suicide risk screening",
            "Tell the caregiver that mild sadness is a normal part of the caregiving role and prescribe a 2-week course of diphenhydramine to help them sleep",
            "Advise the caregiver to take a one-day vacation from their responsibilities, then return to full caregiving duties the following day",
            "Immediately place the patient in a nursing home without discussing the family's preferences, as this is the most efficient way to resolve the caregiver's stress",
            "Document the caregiver's score in the patient's medical record as evidence of secondary self-neglect and file a report with Adult Protective Services"
        ],
        "answer": 0,
        "exp": "**Caregiver depression** is a major public health concern: up to 40–50% of dementia caregivers develop clinical depression. A **PHQ-9 ≥ 10** indicates moderate-to-severe depression requiring evaluation and treatment. The clinician's response must be tripartite: (1) **Treat the caregiver**: refer for psychiatric evaluation (therapy and/or pharmacotherapy); (2) **Relieve the burden**: arrange emergency/crisis respite care so the patient is safely supervised while the caregiver gets urgent help; (3) **Safety**: perform a suicide risk assessment, as caregiver depression is associated with suicidal ideation and even caregiver-patient homicide. Dismissing or minimizing caregiver psychological distress is a clinical failure that endangers both parties. (Ref: Hazzard's Ch. 17; Current Diagnosis & Treatment: Geriatrics Ch. 4; AGS Geriatrics At Your Fingertips)"
    },
    # T3: Respite care — types and appropriateness
    {
        "q": "A {age}-year-old {gender} named {name} with moderate dementia lives at home. {possessive_cap} {caregiver} reports severe burnout and states they desperately need a 2-week break to attend to their own health. The patient is medically stable with no acute illness but requires assistance with all {adl_count} basic activities of daily living (ADLs). The family asks about care options during this period. Which of the following represents the most appropriate form of 'respite care' for this situation?",
        "options": [
            "Arrange a short-term temporary placement in a skilled nursing facility (SNF) or a specialized dementia respite program, which provides supervised care for the patient while the caregiver takes a planned break",
            "Advise the {caregiver} that respite care is only covered by private insurance and is not available through Medicare, Medicaid, or community programs",
            "Recommend that the patient be admitted to the hospital for a 2-week 'social admission' while the caregiver rests",
            "Instruct the caregiver to leave the patient home alone with daily phone check-ins, as the patient is medically stable",
            "Suggest that the family reduce the patient's caloric intake to induce mild sedation and reduce the caregiver's supervision burden"
        ],
        "answer": 0,
        "exp": "**Respite care** is defined as temporary, substitute care provided to give family caregivers a planned, structured break from their caregiving responsibilities. Types include: (1) **In-home respite**: a trained volunteer or paid aide comes to the home to supervise the patient; (2) **Adult Day Health Programs (ADHP)**: structured community-based daytime programs (cognitive stimulation, meals, socialization, nursing monitoring); (3) **Short-term residential respite**: temporary placement in a licensed care facility (SNF, memory care unit) for days to weeks. Medicare Part A covers short-term SNF stays after a qualifying hospital admission. The National Family Caregiver Support Program (Older Americans Act) provides respite funding. Hospitalizing a stable patient solely for social reasons is inappropriate and costly. (Ref: Hazzard's Ch. 17; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics)"
    },
    # T4: Adult Day Health Programs — clinical indication
    {
        "q": "A {age}-year-old {gender} named {name} with mild-to-moderate dementia lives at home with {possessive} working {caregiver}. The {caregiver} must work {hours} hours per day and cannot provide daytime supervision. The patient wanders, forgets to eat, and has had two minor kitchen injuries. The patient remains ambulatory, social, and does not have complex medical needs requiring continuous nursing care. Which of the following is the most appropriate community-based care recommendation?",
        "options": [
            "Enroll the patient in an Adult Day Health Program (ADHP), which provides structured daytime supervision, cognitive stimulation, meals, socialization, and safety monitoring while allowing the patient to return home in the evening",
            "Arrange immediate permanent placement in a locked memory care nursing facility, as any degree of wandering requires 24-hour institutionalization",
            "Prescribe a daily dose of lorazepam 2 mg to chemically suppress the wandering behavior during the caregiver's working hours",
            "Recommend the patient wear a medical alert necklace and be left home alone with the stove disconnected as a safety measure",
            "Advise the {caregiver} to quit their job and provide full-time home care, as this is the most appropriate standard of care for patients with wandering behaviors"
        ],
        "answer": 0,
        "exp": "**Adult Day Health Programs (ADHP)** are community-based, structured programs that operate during daytime hours (typically 8 AM–5 PM) and provide: (1) supervised activities and cognitive stimulation; (2) nutritional meals and hydration monitoring; (3) socialization with peers; (4) basic health monitoring (vital signs, medication management); (5) caregiver respite. Eligibility: ambulatory or semi-ambulatory older adults with cognitive or functional impairments who are safe to return home in the evening. Benefits: delays nursing home placement, reduces caregiver burden, improves patient quality of life. Funding: Medicaid HCBS waivers, Older Americans Act grants, private pay. Using benzodiazepines for behavioral control is dangerous (Beers Criteria) and constitutes a chemical restraint. (Ref: Hazzard's Ch. 17; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics)"
    },
    # T5: Caregiver role strain — identifying non-spousal/adult-child burden
    {
        "q": "A {age}-year-old {gender} named {name} with severe dementia is cared for at home. You learn that the primary caregiver is the patient's {years}-year-old {caregiver}, who is also managing their own chronic conditions including Type 2 diabetes and hypertension. The {caregiver} reports missing their own medical appointments and medications. Which of the following describes this phenomenon and the most appropriate clinical action?",
        "options": [
            "This represents 'caregiver role strain,' where the caregiver's own health is compromised by caregiving demands; the clinician must assess both patient and caregiver needs, connect the caregiver to community support services, and ensure the caregiver maintains their own medical care",
            "The caregiver's missed appointments are solely the responsibility of their own primary care physician and do not fall within the scope of the geriatrician's clinical duties",
            "Advise the caregiver to manage their own health conditions using over-the-counter medications to avoid the time burden of medical appointments",
            "File a report with Adult Protective Services (APS) immediately, as the caregiver's health management failure constitutes medical neglect of the patient",
            "Recommend that both the patient and the caregiver be admitted to a skilled nursing facility simultaneously to provide coordinated care for both"
        ],
        "answer": 0,
        "exp": "**Caregiver role strain** is defined as the physical, emotional, and health burden experienced by informal caregivers who sacrifice their own well-being to care for a dependent family member. It is especially prevalent in **older spousal caregivers** or adult children with their own chronic medical conditions. Consequences include: missed medical appointments, medication non-adherence, worsening chronic disease, depression, social isolation, and increased mortality. The clinician caring for the older patient must adopt a **dyadic (patient + caregiver) care model**: (1) screen for caregiver health status; (2) encourage the caregiver to maintain their own medical care; (3) connect to community resources (Meals on Wheels, PACE, community health workers); (4) arrange additional home support. This is a core principle in the **Geriatric Assessment** framework. (Ref: Hazzard's Ch. 17; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics)"
    },
    # T6: PACE program — comprehensive community-based care
    {
        "q": "A {age}-year-old {gender} named {name} is dually eligible for Medicare and Medicaid. {pronoun_cap} has multiple chronic conditions (diabetes, COPD, mild dementia), requires assistance with {adl_count} ADLs, and meets nursing home level of care criteria. However, {name} and {possessive} family strongly prefer to remain in the community. A social worker mentions a program that provides comprehensive medical, social, and supportive services in a community setting. Which program is being described?",
        "options": [
            "Program of All-inclusive Care for the Elderly (PACE), which provides comprehensive interdisciplinary team-based care (medical, social, rehabilitative, and supportive services) through an adult day health center to nursing home-eligible individuals who choose to remain in the community",
            "Medicare Part D Extra Help (Low Income Subsidy), which provides prescription drug cost assistance for low-income Medicare beneficiaries",
            "The Supplemental Nutrition Assistance Program (SNAP), which provides monthly food vouchers for older adults with nutritional risk factors",
            "The Medicare Annual Wellness Visit, which provides a single-day comprehensive health assessment but does not include ongoing community-based services",
            "Medicaid Managed Long-Term Services and Supports (MLTSS), which exclusively provides nursing home care and excludes all community-based alternatives"
        ],
        "answer": 0,
        "exp": "The **Program of All-inclusive Care for the Elderly (PACE)** is a federally recognized, capitated managed care program that provides comprehensive medical and social services to individuals who: (1) are ≥55 years old; (2) are certified as needing **nursing home level of care**; (3) are able to safely live in the community with PACE support; (4) are enrolled in Medicare and/or Medicaid. PACE provides an **interdisciplinary team** (physician, nurse, social worker, PT, OT, dietitian, activity coordinator) through an adult day health center plus in-home services as needed. PACE accepts full financial risk and coordinates ALL care. PACE delays or prevents nursing home placement and improves quality of life. It is considered the gold standard for community-based long-term care. (Ref: Hazzard's Ch. 17; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics Ch. 4)"
    },
    # T7: Home health aide vs. skilled nursing visit distinction
    {
        "q": "A {age}-year-old {gender} named {name} is discharged home after a hip fracture repair. {pronoun_cap} needs assistance with bathing, dressing, and meal preparation (personal care ADLs), but has no wound care, IV therapy, or skilled therapy needs. The family asks what type of home-based assistance is most appropriate. Which of the following best describes the correct service?",
        "options": [
            "A home health aide (HHA) or personal care aide (PCA), who provides non-skilled, custodial assistance with personal care activities of daily living (ADLs) such as bathing, dressing, grooming, and meal preparation",
            "A Medicare-certified home health agency providing skilled nursing visits, as Medicare Part A covers all home assistance services for patients discharged from the hospital",
            "A hospice home care team, which is appropriate for any patient who is discharged from the hospital with functional limitations",
            "A licensed clinical social worker (LCSW) for daily home visits to provide psychotherapy during the post-discharge recovery period",
            "A durable medical equipment (DME) supplier to provide a hospital-grade bed and mechanical lifting device as the primary service"
        ],
        "answer": 0,
        "exp": "**Home health aides (HHAs)** and **personal care aides (PCAs)** provide **custodial (non-skilled) care**: bathing, dressing, grooming, toileting, meal preparation, light housekeeping, and companionship. This differs critically from **skilled home health** (Medicare Part A/B covered): skilled nursing (wound care, IV antibiotics, medication teaching), physical therapy, occupational therapy, speech therapy — which require a physician's order, homebound status, and a specific skilled need. **Medicare does NOT cover custodial-only home care** (long-term bathing/dressing assistance). Custodial home care is funded by: Medicaid HCBS waivers, private pay, or long-term care insurance. Understanding this distinction is clinically critical for discharge planning and patient/family counseling. (Ref: Hazzard's Ch. 17; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics)"
    },
    # T8: Caregiver burnout — identifying clinical red flags for patient safety risk
    {
        "q": "A {age}-year-old {gender} named {name} with advanced dementia is cared for at home by {possessive} {caregiver}. During a home health visit, the nurse notes the patient appears poorly groomed and has lost {weight_loss} lbs. The {caregiver} states: 'Some days I think about just disappearing or ending things for both of us so we can both be at peace.' Which of the following is the most critical immediate clinical action?",
        "options": [
            "Recognize this as a potential caregiver-patient violence/homicide-suicide risk; immediately assess lethality, ensure the patient's safety, involve crisis mental health services for the caregiver, and report to Adult Protective Services (APS)",
            "Reassure the caregiver that such thoughts are universally experienced by all long-term caregivers and require no immediate clinical response",
            "Prescribe the caregiver a one-week supply of zolpidem 5 mg to improve sleep and schedule a follow-up in 6 weeks",
            "Advise the family to reduce the patient's food intake to minimize caregiver preparation burden, then reassess in 3 months",
            "Document the caregiver's statement as a metaphorical expression of frustration and take no further action at this visit"
        ],
        "answer": 0,
        "exp": "Caregiver statements expressing a wish to 'end things for both of us' represent a **homicide-suicide ideation** — a recognized and documented risk among severely burned-out caregivers. This is a **psychiatric emergency**. Clinical steps: (1) **Immediate safety assessment**: evaluate lethality, access to weapons/medications; (2) **Patient safety**: ensure immediate supervisory safety for the cognitively impaired patient; (3) **Crisis mental health referral**: emergency psychiatric evaluation for the caregiver; (4) **Adult Protective Services (APS) report**: mandated reporting for patient vulnerability; (5) **Emergency respite care** placement. The combination of patient weight loss and caregiver suicidal/homicidal ideation suggests the patient may already be at risk of neglect or harm. This is one of the most critical clinical scenarios in geriatric social medicine. (Ref: Hazzard's Ch. 14 & Ch. 17; Current Diagnosis & Treatment: Geriatrics; UWorld Step 2 CK)"
    },
    # T9: Caregiver support resources — Older Americans Act, NFCSP
    {
        "q": "A {age}-year-old {gender} named {name} with moderate dementia is cared for at home by {possessive} {caregiver}. The family has no private insurance for home care services and asks the clinician what publicly funded support programs exist for family caregivers. Which of the following accurately describes a federally funded program specifically designed to support informal family caregivers of older adults?",
        "options": [
            "The National Family Caregiver Support Program (NFCSP), authorized under Title III-E of the Older Americans Act, provides caregivers with information, assistance, counseling, respite care, and supplemental services through local Area Agencies on Aging (AAA)",
            "Medicare Part B's 'Caregiver Benefit' provides direct monthly payments to family members who care for Medicare beneficiaries at home as a substitute for institutional care",
            "Social Security Disability Insurance (SSDI) automatically reimburses caregivers at a rate of $15 per hour for all hours spent providing care to a disabled family member",
            "The Patient Self-Determination Act mandates that all hospitals provide 40 hours of free respite care per month to family caregivers of hospitalized patients",
            "The American Geriatrics Society (AGS) operates a national network of free 24/7 respite care centers funded entirely by private donations"
        ],
        "answer": 0,
        "exp": "The **National Family Caregiver Support Program (NFCSP)** is a federal program (Title III-E of the **Older Americans Act, 2000**) administered by the Administration for Community Living (ACL) through state **Area Agencies on Aging (AAA)**. It provides 5 core services: (1) **Information** about available services; (2) **Assistance** in accessing support services; (3) **Individual counseling**, organization of support groups, and training; (4) **Respite care** (temporary relief for caregivers); (5) **Supplemental services** (limited, to complement care). Eligibility: adult family caregivers of individuals ≥ 60 years, or grandparents caring for grandchildren. Medicare does NOT pay caregivers directly. The AAA is the local gateway to virtually all community aging services. (Ref: Hazzard's Ch. 17; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics)"
    },
    # T10: Financial toxicity — caregiver out-of-pocket costs
    {
        "q": "A {age}-year-old {gender} named {name} with advanced dementia requires 24-hour supervision. {possessive_cap} {caregiver} has quit their job to provide full-time care and the family's income has dropped to {income}. The {caregiver} reports they cannot afford adult diapers, nutritional supplements, or medication copays. What is the most appropriate primary clinical intervention to address this financial crisis?",
        "options": [
            "Refer to a licensed social worker for a comprehensive financial eligibility assessment including Medicaid (for long-term services), Supplemental Security Income (SSI), Medicare Extra Help, the Low Income Home Energy Assistance Program (LIHEAP), and local Area Agency on Aging benefits counseling",
            "Advise the family to take out a second mortgage on their home to fund the care costs, as this is the standard expected financial sacrifice for long-term caregiving",
            "Prescribe generic versions of all medications only and discharge the family with no further social support",
            "Immediately place the patient in a nursing home as the sole solution to the financial crisis without assessing eligibility for community-based Medicaid programs",
            "Tell the family that until they spend down all assets to Medicaid eligibility thresholds, no public assistance programs are available to them"
        ],
        "answer": 0,
        "exp": "**Financial toxicity** of caregiving is a major social determinant of health. The average out-of-pocket cost of caring for a dementia patient at home exceeds $47,000/year. A geriatric social worker must assess eligibility for: (1) **Medicaid HCBS waivers** — fund home-based personal care aides, adult day programs, respite care; (2) **Supplemental Security Income (SSI)** — income support for low-income older adults; (3) **Medicare Extra Help/Low Income Subsidy** — reduces Part D drug costs; (4) **Area Agency on Aging (AAA)** — Meals on Wheels, transportation, caregiver support; (5) **LIHEAP** — energy bill assistance; (6) **State Pharmaceutical Assistance Programs (SPAP)** — drug cost reduction. Immediate nursing home placement without assessing community-based Medicaid options deprives the family of preferred and often less expensive alternatives. (Ref: Hazzard's Ch. 17; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics Ch. 4)"
    },
    # T11: Anticipatory guidance — caregiver trajectory planning in dementia
    {
        "q": "A {age}-year-old {gender} named {name} has just been diagnosed with mild Alzheimer's disease. {possessive_cap} {caregiver} asks the clinician, 'What should we plan for over the next few years?' Which of the following represents the most appropriate and comprehensive response regarding the caregiver trajectory in Alzheimer's disease?",
        "options": [
            "Provide anticipatory guidance: caregiving demands will progressively increase as the disease advances through mild, moderate, and severe stages; early-stage planning should include legal/financial preparations (power of attorney, advance directives), identifying future care resources, caregiver support enrollment, and discussing the likely eventual need for residential care",
            "Reassure the caregiver that Alzheimer's disease has a very gradual course requiring minimal caregiving adjustments over time, and no long-term planning is necessary at this early stage",
            "Advise the family to purchase a long-term care insurance policy immediately, as this is the only reliable funding source for future dementia care",
            "Tell the {caregiver} that home care for Alzheimer's is unsustainable beyond 6 months and immediate nursing home placement is the clinically recommended option",
            "Focus exclusively on pharmacological management of the patient's symptoms and defer all social planning discussions to a separate social work appointment next year"
        ],
        "answer": 0,
        "exp": "**Anticipatory guidance in dementia caregiving** is a proactive, staged planning approach recognizing that Alzheimer's disease progresses through predictable stages with escalating care demands. Early-stage planning (FAST Stage 3–4) should address: (1) **Legal**: durable power of attorney (financial and healthcare), advance directives (POLST, living will); (2) **Financial**: benefits counseling, long-term care insurance eligibility, spend-down planning; (3) **Social/community**: enroll caregiver in support groups, identify adult day programs, respite care resources; (4) **Future care planning**: discuss realistic trajectory, identify when nursing home placement may become necessary (wandering, incontinence, behavioral disturbances). Early planning reduces crisis decision-making and caregiver burden. The geriatrician should initiate these discussions at the time of diagnosis, not after a crisis. (Ref: Hazzard's Ch. 73; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics)"
    },
    # T12: Caregiver cultural competency — immigrant family caregiving
    {
        "q": "A {age}-year-old {gender} named {name} with advanced dementia is cared for exclusively by family members in a multigenerational household. The family is from a cultural background in which nursing home placement is considered deeply stigmatizing and a betrayal of family duty. Despite the patient's increasing care needs, the family categorically refuses institutional care and is struggling significantly. Which of the following represents the most culturally competent clinical approach?",
        "options": [
            "Respect the family's cultural values while honestly discussing the increasing care demands; collaboratively explore culturally acceptable alternatives such as in-home skilled nursing, PACE, culturally aligned adult day programs, and offer caregiver burnout resources without imposing institutional placement",
            "Inform the family that their cultural beliefs are clinically inappropriate and that nursing home placement is legally mandated once a patient requires assistance with more than three ADLs",
            "File a report with Adult Protective Services for medical neglect because the family is refusing institutional care",
            "Discharge the patient from geriatric care and refer exclusively to a social worker, as cultural issues are outside the scope of geriatric medicine",
            "Arrange nursing home placement without the family's consent as the clinician knows what is medically best, regardless of patient and family values"
        ],
        "answer": 0,
        "exp": "**Cultural competency in geriatric caregiving** is an essential clinical skill. Research shows that Hispanic, Asian-American, and African-American families are significantly more likely to provide home-based care for dementia patients and are less likely to use nursing home placement due to cultural values of **filial piety** and family obligation. The clinician's role is NOT to override cultural values but to: (1) **Acknowledge** and **respect** the family's values; (2) **Honestly assess** escalating care needs; (3) **Offer culturally acceptable alternatives**: in-home aides, PACE, culturally aligned day programs, community health workers from the same cultural background; (4) **Provide resources** in the family's language; (5) **Monitor for caregiver burnout** and patient safety — without judgment. Forcing institutional placement against family values is ethically and legally inappropriate when the patient is safe. (Ref: Hazzard's Ch. 17; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics)"
    },

    # ===== HOUSING (T13–T23) =====
    # T13: Home safety assessment — fall hazards
    {
        "q": "A {age}-year-old {gender} named {name} with mild cognitive impairment and a recent fall is being discharged home. A home safety evaluation is ordered. Which of the following home modifications has the strongest evidence for reducing falls in community-dwelling older adults?",
        "options": [
            "Installation of grab bars in the bathroom (tub, shower, toilet), removal of loose throw rugs, adequate night lighting in hallways and bathrooms, securing loose electrical cords, and referral to occupational therapy for a formal home safety assessment",
            "Prescribing a wheelchair for all indoor ambulation to eliminate the risk of falls from walking",
            "Moving the patient to the ground floor only while installing wall-to-wall padded flooring throughout the entire home",
            "Placing the patient in physical restraints in a recliner chair during all waking hours to prevent unassisted ambulation",
            "Purchasing an expensive commercial smart-home fall detection system as the primary fall prevention strategy, without addressing structural home hazards"
        ],
        "answer": 0,
        "exp": "**Home safety modifications** are a cornerstone of fall prevention in community-dwelling older adults. The strongest evidence-based structural modifications include: (1) **Bathroom**: grab bars (toilet, tub, shower), non-slip bath mats, raised toilet seat; (2) **Floor surfaces**: remove loose throw rugs (major fall hazard), secure carpets, ensure level thresholds; (3) **Lighting**: adequate night lighting (night lights, motion-activated lights), particularly in hallways and bathrooms; (4) **Electrical and clutter**: remove trailing cords, clear pathways; (5) **Stairs**: secure handrails on both sides, contrasting step edges. A formal **occupational therapy (OT) home assessment** is the gold standard — OTs identify individualized hazards and recommend targeted modifications. The CAPABLE (Community Aging in Place—Advancing Better Living for Elders) model combining OT, nursing, and home repairs significantly reduces falls and disability. (Ref: Hazzard's Ch. 41; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics)"
    },
    # T14: Unsafe housing — extreme temperature exposure
    {
        "q": "A {age}-year-old {gender} named {name} with heart failure is seen in the clinic in late July. {pronoun_cap} lives alone in a third-floor apartment with no air conditioning. {possessive_cap} core body temperature is 38.8°C, {pronoun} is mildly confused, and {possessive} medications include a loop diuretic and a beta-blocker. {pronoun_cap} income is {income}. Which of the following is the most appropriate immediate and coordinated clinical response?",
        "options": [
            "Address the immediate heat-related illness medically; provide cooling measures and IV hydration if indicated; connect the patient with LIHEAP (Low Income Home Energy Assistance Program) for air conditioning unit funding; explore emergency housing options or 'cooling center' access; assess medication safety in the heat context",
            "Discharge the patient home immediately with strict instructions to open windows and drink 8 glasses of water daily, as this is sufficient to prevent hyperthermia",
            "Admit to the hospital solely for the purpose of providing a cool environment and discharge after 24 hours without addressing the underlying housing hazard",
            "Prescribe a higher dose of loop diuretics to counteract the fluid shift caused by heat exposure and plan routine follow-up in 1 month",
            "Tell the patient that air conditioning is a luxury item and their housing arrangement requires no medical intervention"
        ],
        "answer": 0,
        "exp": "**Extreme temperature exposure** is a critical **housing-related social determinant of health** in older adults. Physiological reasons for heat vulnerability: (1) impaired thermoregulatory response; (2) reduced thirst sensation (dehydration risk); (3) medications (diuretics promote dehydration; beta-blockers impair cardiovascular adaptation; anticholinergics impair sweating). **LIHEAP** (Low Income Home Energy Assistance Program) provides federally funded energy bill assistance and in some states emergency air conditioning units. Clinical response: (1) treat heat illness; (2) review and adjust heat-risk medications; (3) connect with LIHEAP; (4) refer to **cooling centers** (community shelters with AC open during heat waves); (5) consider home visiting programs. Heat waves are associated with significant excess mortality in older adults. (Ref: Hazzard's Ch. 17; Current Diagnosis & Treatment: Geriatrics; AGS Geriatrics At Your Fingertips)"
    },
    # T15: Social isolation and housing — living alone risk
    {
        "q": "A {age}-year-old {gender} named {name} with mild cognitive impairment lives alone in a rural area. {pronoun_cap} has no family nearby, rarely leaves the home, has not seen a friend in {months} months, and scores positively on the UCLA Loneliness Scale. {pronoun_cap} primary care clinician is concerned about {possessive} safety and well-being. Which of the following represents the most comprehensive clinical approach to address social isolation in this older adult?",
        "options": [
            "Screen formally for loneliness and social isolation; connect with the Area Agency on Aging for services (Meals on Wheels, telephone reassurance, friendly visitor programs, senior center transportation); evaluate for depression; and consider telehealth check-ins to maintain medical oversight",
            "Recommend the patient immediately move to a large urban area where social opportunities are more available",
            "Prescribe a high-dose benzodiazepine to reduce the patient's anxiety associated with social isolation",
            "Discharge the patient from geriatric care as social isolation is a personal lifestyle choice outside the scope of medical practice",
            "Advise the patient to join a social media platform, as this is the primary evidence-based intervention for social isolation in older adults"
        ],
        "answer": 0,
        "exp": "**Social isolation and loneliness** are major social determinants of health in older adults, associated with a 26% increased risk of mortality, cognitive decline, depression, and reduced physical activity. Community-dwelling older adults living alone in rural areas face compounded risk. Evidence-based interventions include: (1) **Meals on Wheels** — provides nutrition AND a daily welfare check; (2) **Telephone reassurance programs** — regular calls from trained volunteers; (3) **Friendly visitor programs** — in-person visits; (4) **Senior center programs** — group activities, transportation assistance; (5) **Telehealth** — video-based medical visits maintain connection with the healthcare team; (6) **Depression screening** (PHQ-9) — loneliness and depression are bidirectional; (7) **Caregiver and community health worker** involvement. The **Area Agency on Aging (AAA)** is the primary local gateway for all these services. (Ref: Hazzard's Ch. 17; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics)"
    },
    # T16: Homelessness in older adults — shelter vs. community care
    {
        "q": "A {age}-year-old {gender} named {name} is brought to the emergency department by police after being found confused and sleeping in a park. {pronoun_cap} has a history of alcohol use disorder, hypertension, and is found to be in early-moderate cognitive decline on bedside testing. {pronoun_cap} states {pronoun} has been without stable housing for {months} months. Which of the following represents the most comprehensive approach to this patient's care?",
        "options": [
            "Medically stabilize the patient; arrange a social work consultation for Housing First program referral, substance use disorder treatment, Medicaid enrollment, and connection to supportive housing with case management services; perform a formal cognitive and capacity assessment",
            "Discharge the patient from the emergency department with a bus token and a list of local churches, as housing is not a medical issue",
            "Admit the patient to a locked psychiatric facility for indefinite care due to cognitive impairment combined with homelessness",
            "Prescribe naltrexone for alcohol use disorder and arrange a clinic follow-up appointment only, without addressing the patient's housing crisis",
            "Advise the patient to apply for Social Security Disability Insurance (SSDI) and wait 2 years for Medicare eligibility before receiving any further care"
        ],
        "answer": 0,
        "exp": "**Older adult homelessness** (the 'graying of homelessness') is a growing public health crisis. Older homeless individuals have a median age of death of ~51 years and have dramatically higher rates of cognitive impairment, falls, hypothermia, infectious disease, and hospitalizations. **Housing First** is the evidence-based model that provides immediate, permanent housing without sobriety prerequisites, then layers in medical and social services. Key interventions: (1) **Housing First program referral** — immediate permanent supportive housing; (2) **Medicaid enrollment** — for uninsured homeless older adults; (3) **Medical stabilization** — address all acute and chronic conditions; (4) **Cognitive assessment** — determine capacity and guardianship needs; (5) **Substance use disorder treatment** — integrated within housing support; (6) **Case management** — multidisciplinary coordination. Homelessness is a medical diagnosis context requiring active physician engagement. (Ref: Hazzard's Ch. 17; Current Diagnosis & Treatment: Geriatrics; AGS Geriatrics At Your Fingertips)"
    },
    # T17: PACE and naturally occurring retirement communities (NORCs)
    {
        "q": "In {state}, a public health official named {name} is presenting a community initiative to a group of geriatricians. The initiative targets a large urban apartment complex where over 60% of residents are adults ≥ 65 years old who have 'aged in place' in their original apartments over several decades. Many residents have multiple chronic conditions, functional impairments, and limited social support networks, but strongly prefer to remain in their homes. Which type of community-based intervention model is most specifically designed for this type of naturally occurring aging community?",
        "options": [
            "A Naturally Occurring Retirement Community (NORC) Supportive Service Program (NORC-SSP), which brings coordinated health, social, and supportive services directly into residential buildings where a large proportion of residents are older adults",
            "A state-mandated mass relocation program to move all residents with ADL limitations to skilled nursing facilities",
            "A hospital-based acute care for elders (ACE) unit, which is limited to inpatient hospitalized patients and is not applicable to community settings",
            "A Medicare Annual Wellness Visit campaign, which provides a single annual assessment but no ongoing community-based services",
            "The State Children's Health Insurance Program (SCHIP), which is exclusively designed for pediatric populations and has no relevance to older adult housing"
        ],
        "answer": 0,
        "exp": "A **Naturally Occurring Retirement Community (NORC)** is a residential community (apartment building, neighborhood) NOT originally designed for older adults but in which a large proportion of residents (≥ 40–60%) are ≥ 60 years old because they have 'aged in place.' NORC-based **Supportive Service Programs (NORC-SSPs)** bring coordinated services INTO the existing residential community: health screenings, case management, social programming, fitness classes, transportation assistance, and links to community agencies — without requiring residents to move. This model preserves **aging in place** while overcoming service access barriers. The **Village model** is a related peer-driven community organization that helps older adults age in place through volunteer services and community connection. Both models address housing-related social determinants without requiring institutionalization. (Ref: Hazzard's Ch. 17; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics)"
    },
    # T18: Aging in place — universal design principles
    {
        "q": "A {age}-year-old {gender} named {name} with moderate osteoarthritis and mild balance impairment is planning to remodel {possessive} home to enable safe aging in place for the next decade. {possessive_cap} occupational therapist recommends incorporating 'universal design' principles. Which of the following best describes the concept of universal design in the context of aging-in-place home modifications?",
        "options": [
            "Universal design refers to the design of environments and products that are usable by all people to the greatest extent possible without adaptation, including wider doorways for wheelchairs, zero-step entries, lever-style door handles, curbless showers, and varied height countertops",
            "Universal design requires replacing all existing home appliances with hospital-grade medical equipment to create a clinical care environment at home",
            "Universal design refers exclusively to the installation of overhead patient-lift systems (Hoyer lifts) in every room of the home",
            "Universal design means that all home modifications must be pre-approved by Medicare before they can be considered medically legitimate",
            "Universal design requires that the home be rebuilt from the foundation using only government-approved building materials rated for geriatric occupancy"
        ],
        "answer": 0,
        "exp": "**Universal design** is an architectural philosophy that creates spaces usable by people of all ages and abilities without the need for specialized adaptation. Key principles for aging-in-place: (1) **Zero-step entries** (no threshold barriers, no front-step curbs); (2) **Wider doorways** (≥32–36 inches) to accommodate mobility aids; (3) **Lever-style door handles and faucets** (easier with arthritis/limited grip); (4) **Single-story living** (bedroom, bathroom, kitchen on one floor); (5) **Curbless/roll-in shower** (eliminates tub transfer risk); (6) **Varied-height counters and adjustable shelving**; (7) **Adequate lighting and contrast** (light switches at reachable heights). The **CAPABLE program** (OT + nurse + home repair) and **Area Agency on Aging** home modification grants help fund these changes for low-income older adults. (Ref: Hazzard's Ch. 41; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics)"
    },
    # T19: Subsidized senior housing — HUD Section 202
    {
        "q": "A {age}-year-old {gender} named {name} lives in a rundown studio apartment and pays 80% of {possessive} {income} in rent, leaving insufficient money for food and medications. {pronoun_cap} is functionally independent with no ADL limitations. {possessive_cap} clinician wants to explore affordable, safe housing alternatives. Which of the following federal housing programs is specifically designed to provide subsidized, supportive housing for very low-income older adults who are functionally independent?",
        "options": [
            "HUD Section 202 Supportive Housing for the Elderly Program, which provides federally subsidized housing units with rents capped at 30% of income, along with access to supportive services coordination for functionally independent low-income older adults",
            "The Medicare Part A institutional care benefit, which covers permanent residential living in skilled nursing facilities for all low-income Medicare beneficiaries",
            "The Veterans Affairs Aid and Attendance Benefit, which is exclusively available to eligible veterans and their spouses and is not applicable to the general older adult population",
            "The Section 8 Housing Choice Voucher Program, which exclusively serves families with children under 18 years old and explicitly excludes older adult applicants",
            "Medicaid's Institutional Care Program, which provides housing only in certified nursing facilities and is not applicable to independent community-dwelling older adults"
        ],
        "answer": 0,
        "exp": "**HUD Section 202 Supportive Housing for the Elderly** is a federal program providing capital financing to develop affordable housing for very low-income older adults (≥62 years) who are functionally independent or nearly so. Key features: (1) Rent is capped at **30% of adjusted gross income** (standard affordable housing benchmark); (2) Units are **service-enhanced** — a service coordinator helps residents access health, social, and community services; (3) Residents maintain their own apartments (independent living, not assisted living); (4) Waiting lists are often very long (months to years). Other relevant programs: **Section 8 Housing Choice Vouchers** (tenant-based rental assistance, not limited to children), **Low Income Housing Tax Credit (LIHTC)** developments. The 30% income benchmark for affordable housing is a key concept. (Ref: Hazzard's Ch. 17; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics)"
    },
    # T20: Boarding and care homes — regulatory gaps
    {
        "q": "A social worker reports to a geriatrician that a {age}-year-old {gender} named {name} with mild dementia is living in a small, unlicensed boarding home with 5 other older adults. The home is run by a private individual who charges monthly fees for room, board, and minimal assistance. There are no licensed nursing staff, no medication management policies, and no oversight by a state regulatory agency. What is the primary clinical and ethical concern in this situation?",
        "options": [
            "Unlicensed board-and-care homes exist in a significant regulatory gap; residents are at high risk for neglect, financial exploitation, substandard care, and safety hazards; the clinician should facilitate a formal home safety and welfare assessment, report concerns to Adult Protective Services (APS), and explore licensed residential alternatives",
            "This arrangement is optimal because the patient is receiving personalized care in a small-group home setting and should be encouraged to sign a long-term lease immediately",
            "Unlicensed facilities are not subject to any reporting obligations, and clinicians should not involve themselves in patients' private housing arrangements",
            "The patient should be immediately arrested for illegal habitation in an unlicensed facility",
            "The home operator should be immediately licensed retroactively as a nurse practitioner to legitimize the care provided"
        ],
        "answer": 0,
        "exp": "**Board-and-care homes** (also called 'adult residential care facilities,' 'personal care homes,' or 'adult foster homes') are small group residential settings that provide room, board, and basic custodial assistance. **Unlicensed** facilities are common and represent a significant **regulatory gap**: they are not subject to the federal standards that govern licensed assisted living or nursing homes (OBRA 1987). Risks include: (1) **Neglect** (inadequate staffing, unsafe medications management); (2) **Financial exploitation** (opaque fee structures); (3) **Physical safety hazards** (fire, fall risks); (4) **No medical oversight**. The clinician's obligation: (1) conduct or facilitate a welfare check; (2) report to **Adult Protective Services (APS)** if neglect is suspected; (3) explore licensed residential care options. This is a key housing-related social determinant of health issue in geriatric practice. (Ref: Hazzard's Ch. 17; Current Diagnosis & Treatment: Geriatrics; AGS Geriatrics At Your Fingertips)"
    },
    # T21: Assisted living vs. skilled nursing facility — criteria distinction
    {
        "q": "A {age}-year-old {gender} named {name} requires assistance with {adl_count} ADLs (bathing, dressing, meals, toileting), has mild dementia with no behavioral disturbances, no complex medical needs, no IV therapy, and no daily skilled nursing requirements. {pronoun_cap} family is exploring long-term residential care options. Which of the following care settings is most appropriate for this patient's current level of need?",
        "options": [
            "Assisted living facility (ALF), which provides 24-hour supervision, personal care (ADL assistance), meals, housekeeping, and social programming for individuals who need help with ADLs but do not require continuous skilled nursing care",
            "Skilled nursing facility (SNF), which is specifically indicated for patients requiring daily skilled nursing care (wound care, IV medications, complex rehabilitation) and would be over-provision for this patient's current needs",
            "Acute rehabilitation hospital, which is designed for patients requiring intensive physical and occupational therapy (minimum 3 hours/day) following an acute medical event",
            "Inpatient psychiatric hospital, which is appropriate because mild dementia with ADL limitations is classified as a psychiatric emergency requiring inpatient stabilization",
            "Independent living retirement community, which requires residents to manage all ADLs independently without assistance and is therefore not appropriate for this patient"
        ],
        "answer": 0,
        "exp": "Understanding the **continuum of long-term care settings** is critical for USMLE Step 2 CK: | Setting | Key Criteria | | --- | --- | | **Independent Living (IL)** | Fully independent in ADLs; no care provided | | **Assisted Living (ALF)** | ADL assistance, supervision, no continuous skilled nursing needed | | **Memory Care Unit** | ALF-level care + secure environment for dementia/wandering | | **Skilled Nursing Facility (SNF)** | Daily skilled nursing care, post-acute rehabilitation, complex medical needs | | **Long-Term Care (LTC) / Nursing Home** | Permanent placement for those who cannot live at home | | **Acute Rehabilitation** | Intensive therapy ≥3 h/day post-acute event | This patient — needing ADL help, mild dementia, no skilled nursing needs — fits **ALF** criteria. ALFs are primarily **private pay** or **Medicaid** (in some states); Medicare does NOT cover ALF costs. (Ref: Hazzard's Ch. 17; Current Diagnosis & Treatment: Geriatrics; AGS Geriatrics At Your Fingertips; First Aid Step 2 CK)"
    },
    # T22: Medicaid spend-down — nursing home financing
    {
        "q": "A {age}-year-old {gender} named {name} requires permanent nursing home placement. {pronoun_cap} has $180,000 in savings and a monthly Social Security income of {income}. {pronoun_cap} family asks how nursing home care will be financed and when public assistance becomes available. Which of the following most accurately describes how nursing home care is typically financed in the United States?",
        "options": [
            "Nursing home care is initially financed by Medicare Part A (for post-acute skilled care only, limited to 100 days), then private pay using personal assets, and finally by Medicaid once the individual has spent down assets to the state-specified threshold (typically $2,000 for an individual); Medicaid then covers long-term custodial nursing home costs",
            "Medicare Part B covers all nursing home costs permanently without any duration limit, asset requirements, or spend-down obligations",
            "Social Security income alone is sufficient to cover all nursing home costs, and no additional private payment or Medicaid enrollment is required",
            "Private health insurance (not Medicare or Medicaid) is the primary payer for all long-term nursing home care in the United States",
            "Nursing home care is completely free of charge for all Americans aged ≥ 65 years old as a standard Medicare benefit with no limitations or eligibility requirements"
        ],
        "answer": 0,
        "exp": "**Nursing home financing** follows a predictable cascade — a critical concept for Step 2 CK: (1) **Medicare Part A**: covers SNF care ONLY after a qualifying hospital stay of ≥3 days; covers days 1–20 at 100%; days 21–100 with a coinsurance ($194.50/day in 2024); **stops after 100 days** (or when the patient no longer needs skilled care); (2) **Private pay**: patient and family pay out-of-pocket using personal assets (median nursing home cost: ~$9,000–$10,000/month); (3) **Medicaid**: after personal assets are spent down to state threshold (~$2,000 for an individual; 'community spouse resource allowance' protects some assets for remaining-at-home spouse); Medicaid then covers custodial nursing home care permanently. Key distinction: **Medicare covers skilled care; Medicaid covers custodial/long-term care**. (Ref: Hazzard's Ch. 17; Current Diagnosis & Treatment: Geriatrics; AGS Geriatrics At Your Fingertips; UWorld Step 2 CK)"
    },
    # T23: Nursing home quality indicators
    {
        "q": "A {age}-year-old {gender} named {name} with advanced dementia and total ADL dependence is a long-term resident of a skilled nursing facility. During a clinical visit, you review the facility's quality indicators and note a high rate of new pressure injuries, frequent use of physical restraints, a high incidence of urinary tract infections, and multiple hospitalizations in the past quarter. What is the most appropriate clinical and advocacy response?",
        "options": [
            "These represent evidence of poor nursing home quality; discuss findings with the nursing home medical director and director of nursing, report concerns to the State Survey Agency (or long-term care ombudsman), review individual patient care plans, and advocate for evidence-based care improvements",
            "Accept these indicators as normal and expected for an advanced dementia population; document them in the chart without any further advocacy",
            "Immediately transfer all patients to other facilities without completing a formal investigation, as this is the fastest way to protect patients",
            "Report the findings exclusively to the nursing home's marketing department for internal quality improvement without involving any external regulatory bodies",
            "Reassure the family that federal regulations do not apply to private-pay nursing home residents, and therefore quality indicators are irrelevant for this patient"
        ],
        "answer": 0,
        "exp": "**Nursing home quality indicators** are publicly reported on Medicare's **Care Compare** (formerly Nursing Home Compare) website. Key quality measures include: (1) **Pressure injury rate** (new/worsening); (2) **Physical restraint use rate** (should be minimized; OBRA 1987 mandates restraint reduction); (3) **Urinary tract infection rate**; (4) **Potentially avoidable hospitalizations**; (5) **Falls with injury rate**; (6) **Antipsychotic use rate** (high use = chemical restraint concern). High rates of these indicators signal **substandard care**. The clinician's advocacy role: (1) raise concerns with the **Medical Director** and **Director of Nursing**; (2) report to the **State Survey Agency** (conducts unannounced inspections) and/or **Long-Term Care Ombudsman** (advocates for residents' rights); (3) review individual patient care plans. Federal nursing home regulations (OBRA 1987) mandate minimum quality standards. (Ref: Hazzard's Ch. 17 & Ch. 14; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics)"
    },

    # ===== NURSING HOME vs. COMMUNITY CARE (T24–T35) =====
    # T24: Criteria for nursing home placement — when home care is insufficient
    {
        "q": "A {age}-year-old {gender} named {name} with severe dementia is cared for at home by {possessive} exhausted {caregiver}. Despite home health aide services {hours} hours/day, the patient wanders nocturnally, has severe sundowning with agitation requiring physical intervention, is incontinent of bowel and bladder, and has developed a Stage III sacral pressure injury. The {caregiver} has had multiple falls while trying to reposition the patient at night. Which of the following represents the most appropriate clinical recommendation?",
        "options": [
            "The patient's care needs (nocturnal wandering, severe BPSD requiring physical intervention, total incontinence, Stage III pressure injury, caregiver injury risk) now exceed what can be safely managed at home; nursing home placement in a secure memory care unit with 24-hour skilled nursing is clinically indicated",
            "Continue home care at its current level with no changes, as families must never be recommended nursing home placement by a physician",
            "Prescribe high-dose quetiapine to eliminate all sundowning behaviors and continue indefinite home care without reassessment",
            "Recommend the {caregiver} purchase a hospital-style bed with four-point restraints and hire an additional uncertified family friend for nighttime repositioning",
            "Transfer the patient to an acute psychiatric inpatient unit for permanent long-term management of behavioral symptoms of dementia"
        ],
        "answer": 0,
        "exp": "**Nursing home placement** becomes clinically indicated when home care cannot safely meet the patient's needs despite maximized community supports. Established criteria for nursing home level of care: (1) **Total ADL dependence** with complex skilled nursing needs (wound care, etc.); (2) **Severe behavioral and psychological symptoms of dementia (BPSD)** requiring constant intervention beyond caregiver capacity; (3) **Nocturnal wandering** that cannot be safely managed at home; (4) **Caregiver safety**: caregiver injury from patient care is a critical threshold indicator; (5) **Complex medical needs**: Stage III/IV pressure injuries, tube feeding, IV medications. The clinician's role is to have an honest, compassionate conversation about the patient's evolving care needs and the limits of home-based capacity — framing nursing home placement as meeting the patient's clinical needs, NOT as abandonment. (Ref: Hazzard's Ch. 17; Current Diagnosis & Treatment: Geriatrics Ch. 4; AGS Geriatrics At Your Fingertips)"
    },
    # T25: SNF vs. LTC — differentiating post-acute from custodial care
    {
        "q": "A {age}-year-old {gender} named {name} was admitted to the hospital for {months} days following an ischemic stroke with left hemiplegia. {pronoun_cap} needs intensive physical therapy, occupational therapy, and speech therapy to regain function, along with daily skilled nursing assessment. {pronoun_cap} is not yet stable enough for home discharge. The medical team discusses post-acute placement options. Which of the following best describes the appropriate placement and its Medicare coverage?",
        "options": [
            "Transfer to a skilled nursing facility (SNF) for post-acute rehabilitation and skilled nursing care; Medicare Part A covers SNF care at 100% for days 1–20 after a qualifying hospital stay of ≥3 days, with cost-sharing from days 21–100",
            "Discharge to a long-term care (LTC) custodial nursing home; Medicare Part A covers all custodial nursing home costs permanently without any duration limit",
            "Transfer to an assisted living facility (ALF) for post-stroke rehabilitation; Medicare Part A fully covers all ALF costs for up to 2 years after a qualifying hospital stay",
            "Direct home discharge with Medicare Part A-funded 24-hour home nursing care for 6 months to complete rehabilitation",
            "Admission to an acute inpatient psychiatric hospital for stroke rehabilitation, as neurological events are classified as psychiatric emergencies under Medicare guidelines"
        ],
        "answer": 0,
        "exp": "**Skilled nursing facility (SNF) care** vs. **long-term custodial care** is a critical distinction for USMLE Step 2 CK and geriatric practice: **SNF (post-acute care)**: Provides skilled nursing + rehabilitation (PT, OT, ST) for patients recovering from acute illness, surgery, or stroke. **Medicare Part A coverage**: 100% for days 1–20 (after ≥3-day qualifying hospital stay); days 21–100: patient pays coinsurance ($194.50/day in 2024); after day 100: patient pays 100%. **Qualifying criteria**: (1) 3-day inpatient hospital stay; (2) admission within 30 days of discharge; (3) daily skilled care needed. **LTC (custodial care)**: Provides personal care and supervision for patients who cannot safely live at home. Medicare does NOT cover long-term custodial nursing home care; this is primarily funded by Medicaid (after spend-down) or private pay. (Ref: Hazzard's Ch. 17; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics; UWorld Step 2 CK)"
    },
    # T26: Home and community-based services (HCBS) waiver — Medicaid
    {
        "q": "A {age}-year-old {gender} named {name} with Parkinson's disease meets nursing home level of care criteria but wishes to remain at home. {pronoun_cap} has limited income and assets and is Medicaid eligible. The social worker mentions that {name} may qualify for a program that uses Medicaid funds to purchase home-based services as an alternative to nursing home placement. Which of the following programs is being described?",
        "options": [
            "Medicaid Home and Community-Based Services (HCBS) 1915(c) waiver program, which allows states to use Medicaid funds to provide personal care aides, adult day health, respite care, home modifications, and case management as alternatives to nursing home placement",
            "Medicare Part C (Medicare Advantage), which replaces all Medicaid benefits and provides comprehensive home care services for dually eligible beneficiaries",
            "The Medicare Annual Wellness Visit program, which provides a home health aide for 365 days per year for all homebound Medicare beneficiaries",
            "The Medicaid Disproportionate Share Hospital (DSH) program, which provides financial support to hospitals serving large numbers of low-income patients but does not fund home care services",
            "The Consolidated Omnibus Budget Reconciliation Act (COBRA), which allows individuals to continue employer-sponsored health insurance after job loss but does not cover home care services"
        ],
        "answer": 0,
        "exp": "**Medicaid HCBS (Home and Community-Based Services) 1915(c) waivers** are state-administered programs authorized under Section 1915(c) of the Social Security Act that allow states to use Medicaid funds — typically reserved for institutional care — to provide community-based services as alternatives to nursing home placement. Waiver services typically include: (1) **Personal care aides** (ADL assistance); (2) **Home health aide services**; (3) **Adult day health programs**; (4) **Respite care**; (5) **Home modifications** (ramps, grab bars); (6) **Case management**; (7) **Meal services**. Eligibility: Medicaid-eligible individuals who meet nursing home level of care. Key point: HCBS waivers explicitly aim to honor the ADA Olmstead Supreme Court decision (1999), which mandates that states provide services in the least restrictive appropriate setting (community vs. institution). (Ref: Hazzard's Ch. 17; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics)"
    },
    # T27: Olmstead decision — integration mandate
    {
        "q": "An attorney named {name} advising a geriatric care team in {state} asks about the legal basis for providing community-based care as an alternative to institutionalization for Medicaid-eligible older adults with disabilities. Which of the following landmark legal decisions established the principle that states must provide services to people with disabilities in the most integrated, least restrictive setting appropriate to their needs?",
        "options": [
            "Olmstead v. L.C. (1999), a U.S. Supreme Court decision interpreting Title II of the Americans with Disabilities Act (ADA), which established that the unjustified institutionalization of persons with disabilities constitutes discrimination and requires states to provide community-based services when clinically appropriate and the individual chooses community placement",
            "Roe v. Wade (1973), a Supreme Court decision related to reproductive rights that has no relevance to the provision of community-based care for older adults",
            "Brown v. Board of Education (1954), a Supreme Court civil rights ruling addressing racial segregation in public schools",
            "The Emergency Medical Treatment and Labor Act (EMTALA, 1986), which mandates emergency medical screening but does not address long-term residential placement decisions",
            "The Health Insurance Portability and Accountability Act (HIPAA, 1996), which protects patient health information privacy but does not govern the setting of care for disabled individuals"
        ],
        "answer": 0,
        "exp": "**Olmstead v. L.C. (1999)** is the landmark U.S. Supreme Court case (L.C. v. Olmstead, Commissioner, Georgia Department of Human Resources) that interpreted **Title II of the Americans with Disabilities Act (ADA)**. The Court held that: (1) The **unjustified institutionalization** of persons with mental disabilities constitutes **discrimination** under the ADA; (2) States are required to provide community-based services to persons with disabilities when: (a) community placement is appropriate; (b) the transfer is not opposed by the affected individual; (c) community placement can be reasonably accommodated. This decision is the legal foundation for all **HCBS waivers**, **PACE**, and other community-based long-term care programs. It directly shapes Medicaid long-term care policy. (Ref: Hazzard's Ch. 17; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics)"
    },
    # T28: Long-term care insurance — role and limitations
    {
        "q": "A {age}-year-old {gender} named {name} is newly diagnosed with early Parkinson's disease and asks {possessive} clinician about financial planning for future long-term care needs. The clinician discusses long-term care insurance. Which of the following accurately describes the role and key limitations of traditional long-term care insurance in financing geriatric care?",
        "options": [
            "Long-term care insurance (LTCI) helps pay for nursing home, assisted living, and home care costs not covered by Medicare; however, premiums are expensive, most policies require medical underwriting (making purchase after diagnosis difficult or impossible), benefits may have daily caps, and only about 7–8% of older Americans currently hold LTCI policies",
            "Long-term care insurance is a mandatory federal benefit for all Americans age 65 and older, funded through Social Security payroll taxes",
            "Long-term care insurance policies universally cover 100% of all care costs indefinitely with no caps, exclusions, or waiting periods",
            "Long-term care insurance can be purchased at any age, even with a pre-existing diagnosis of dementia or advanced cancer, at no additional premium cost",
            "Medicare Part A automatically serves as long-term care insurance and covers all custodial nursing home and assisted living costs for beneficiaries who need them"
        ],
        "answer": 0,
        "exp": "**Long-term care insurance (LTCI)** is a private insurance product designed to cover costs associated with nursing home, assisted living, or home care that Medicare does not cover. Key features and limitations: (1) **Medical underwriting**: applicants must qualify based on health status; purchasing after a diagnosis (Parkinson's, dementia, etc.) is typically impossible or prohibitively expensive; (2) **Premium cost**: can exceed $2,000–$5,000+/year for comprehensive coverage; (3) **Benefit caps**: most policies have daily benefit caps (e.g., $150–$300/day) and limited policy duration (2–5 years is common); (4) **Benefit triggers**: typically triggered by dependence in ≥2 of 6 ADLs or cognitive impairment; (5) **Penetration rate**: very low (~7–8%); the long-term care financing gap is a major national policy challenge. The ideal time to purchase is in one's 50s–early 60s, while still insurable. (Ref: Hazzard's Ch. 17; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics)"
    },
    # T29: Skilled nursing facility — OBRA 1987 resident rights
    {
        "q": "A {age}-year-old {gender} named {name} is a resident of a skilled nursing facility. The patient's family reports that the facility has been deciding {possessive} daily schedule, restricting {possessive} phone calls to family, denying {possessive} requests for a different roommate, and refusing to share {possessive} care plan with {objective}. Which of the following best describes the regulatory framework protecting this resident's rights?",
        "options": [
            "The Omnibus Budget Reconciliation Act of 1987 (OBRA 1987) established a comprehensive Nursing Home Resident Bill of Rights, including the right to be fully informed of one's care plan, to participate in care decisions, to maintain personal privacy, to communicate freely with family, and to voice grievances without retaliation",
            "Nursing home residents surrender all individual rights upon admission and must fully comply with facility scheduling and care decisions without the right to any input",
            "Resident rights in nursing homes are governed exclusively by individual state laws, and no federal legislation provides any protections to nursing home residents",
            "The Long-Term Care Ombudsman program is solely responsible for writing nursing home care plans and has no advocacy or rights-protection function",
            "The only right protected under federal law for nursing home residents is the right to receive meals three times daily; all other daily life decisions are at the facility's discretion"
        ],
        "answer": 0,
        "exp": "**OBRA 1987 (Omnibus Budget Reconciliation Act of 1987)** is the foundational federal legislation governing nursing home quality and resident rights in Medicare- and Medicaid-certified facilities. **OBRA 1987 Nursing Home Resident Bill of Rights** includes: (1) **Right to be informed** of all rights, services, and charges; (2) **Right to participate** in care planning and decision-making; (3) **Right to privacy** and confidentiality; (4) **Right to communicate** freely with family and the outside world; (5) **Right to grievance** without fear of retaliation; (6) **Right to refuse treatment**; (7) **Right to be free from** physical and chemical restraints used for staff convenience; (8) **Right to personal property and funds**. The **Long-Term Care Ombudsman** program (also established under the Older Americans Act) advocates for resident rights and investigates complaints. (Ref: Hazzard's Ch. 17; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics)"
    },
    # T30: Community vs. nursing home — functional status as predictor
    {
        "q": "A research team led by Dr. {name} in {state} presents a study on predictors of nursing home placement in older adults. Which of the following combinations of factors has been most consistently associated with nursing home admission in large epidemiological studies?",
        "options": [
            "Cognitive impairment (especially dementia), dependence in multiple instrumental and basic ADLs, behavioral disturbances (wandering, nocturnal agitation), caregiver unavailability or burnout, urinary and fecal incontinence, and history of falls",
            "Advanced age alone (≥80 years) is the single strongest predictor of nursing home placement, independent of functional status or social support",
            "High socioeconomic status is the primary predictor of nursing home placement, as wealthy individuals are more likely to choose institutional care than home care",
            "The presence of mild hypertension and hypercholesterolemia are the most common primary triggers for nursing home placement in the United States",
            "Living in a rural geographic area is the single most important predictor of nursing home placement, regardless of the patient's functional status or caregiver availability"
        ],
        "answer": 0,
        "exp": "Epidemiological studies consistently identify a **cluster of biopsychosocial predictors** of nursing home placement: (1) **Cognitive impairment** — dementia is the single strongest clinical predictor; (2) **Functional dependence** — especially ADL dependence (bathing, dressing, toileting, transferring) and IADL loss; (3) **Behavioral symptoms** — wandering, nighttime agitation, aggression; (4) **Incontinence** — both urinary and fecal; (5) **Falls with injury** — leading to immobility; (6) **Caregiver factors** — absence of caregiver, caregiver burnout, small social network; (7) **Prior nursing home admission** — strong predictor of re-admission. Age alone is NOT a predictor when functional status and social support are controlled. Race/ethnicity matters: Black and Hispanic older adults are significantly less likely to use nursing homes than white older adults. (Ref: Hazzard's Ch. 17; Current Diagnosis & Treatment: Geriatrics; AGS Geriatrics At Your Fingertips)"
    },
    # T31: Transition from hospital to SNF — care coordination
    {
        "q": "A {age}-year-old {gender} named {name} with heart failure, diabetes, and moderate dementia is being discharged from the hospital to a skilled nursing facility for post-acute rehabilitation. The discharge team is implementing a structured care transitions program. Which of the following is the most important element of safe hospital-to-SNF care transition to prevent early readmission?",
        "options": [
            "A structured medication reconciliation (accurate and complete transfer of the medication list), a detailed discharge summary transmitted to the SNF before or at the time of transfer, clear communication of pending tests and follow-up needs, and a follow-up phone call within 48–72 hours",
            "Providing the patient with a thick discharge folder of educational pamphlets and assuming the patient will manage their own care transition independently",
            "Instructing the SNF to restart all home medications from memory without providing a written reconciled medication list",
            "Scheduling the patient's first post-discharge physician follow-up appointment in 3 months, as stable patients do not require early reassessment",
            "Using verbal-only handoff communication to the SNF nursing staff to save time, as written documentation is not required by The Joint Commission"
        ],
        "answer": 0,
        "exp": "**Hospital-to-SNF care transitions** are high-risk periods for medication errors, communication failures, and early readmission. Evidence-based transition elements include: (1) **Medication reconciliation** — the single most important element; errors are present in up to 60% of post-discharge medication lists; (2) **Complete discharge summary** — transferred to the SNF in advance of or at the time of admission; should include diagnosis, treatment, pending results, follow-up plans; (3) **Early follow-up** — phone call within 48–72 hours; physician visit within 7 days; (4) **Patient/family education** — teach-back method for warning signs; (5) **Care transition models** (Care Transitions Intervention by Coleman; BOOST; Project RED) have been shown to reduce 30-day readmissions by 20–30%. The CMS Transitional Care Management (TCM) billing codes incentivize structured post-discharge follow-up. (Ref: Hazzard's Ch. 17; AGS Geriatrics At Your Fingertips; UWorld Step 2 CK)"
    },
    # T32: Interdisciplinary team in long-term care — role delineation
    {
        "q": "The medical director of a skilled nursing facility in {state}, Dr. {name}, is restructuring the facility's care model to use a comprehensive interdisciplinary team approach. Which of the following best describes the appropriate roles of each interdisciplinary team member in the long-term care setting?",
        "options": [
            "The interdisciplinary team includes the physician/NP/PA (medical management), registered nurse (skilled care, care plan coordination), social worker (psychosocial assessment, discharge planning, family communication), physical therapist (mobility and strength), occupational therapist (ADL function and home safety), speech-language pathologist (swallowing and communication), dietitian (nutritional assessment), and activities coordinator (recreational and cognitive engagement)",
            "The physician alone should make all care decisions without input from nursing, social work, or therapy disciplines, as other team members have no clinical decision-making authority in nursing home settings",
            "The Long-Term Care Ombudsman is a full member of the clinical care team and attends all care plan meetings as a co-treating provider",
            "Social workers in nursing homes are limited to billing and insurance verification tasks and have no clinical role in patient assessment or care planning",
            "Physical therapists in nursing homes provide exclusively exercise instruction classes for groups of residents and do not conduct individual patient assessments"
        ],
        "answer": 0,
        "exp": "The **interdisciplinary team (IDT)** model is mandated in Medicare/Medicaid-certified nursing homes by **OBRA 1987** and is the standard of care in geriatric settings. Federal regulations require a formal care plan meeting with the IDT within 14 days of admission and at least quarterly thereafter. Team composition and roles: | Member | Primary Role | | --- | --- | | **Physician/NP/PA** | Medical diagnosis and management | | **Registered Nurse** | Skilled care delivery, care plan coordination | | **Social Worker** | Psychosocial assessment, family communication, discharge planning, resident rights advocacy | | **Physical Therapist** | Mobility, gait, strength, fall prevention | | **Occupational Therapist** | ADL function, home/facility safety, adaptive equipment | | **Speech-Language Pathologist** | Swallowing, communication | | **Registered Dietitian** | Nutritional assessment and interventions | | **Activities/Recreation Coordinator** | Cognitive and recreational engagement | (Ref: Hazzard's Ch. 17; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics)"
    },
    # T33: Long-term care ombudsman — advocacy role
    {
        "q": "A family member contacts the clinic of a {age}-year-old {gender} named {name} residing in a nursing home. They report that {name} has been complaining of not receiving ordered meals, being left in soiled clothes for hours, and being told by staff that reporting complaints 'will make things worse.' The family is unsure how to address this with the facility. Which of the following correctly describes the role and authority of the Long-Term Care Ombudsman in this situation?",
        "options": [
            "The Long-Term Care Ombudsman (LTCO), established by the Older Americans Act, is a state and locally-funded advocate who investigates and resolves complaints made by or on behalf of nursing home residents, with authority to access the facility, interview staff and residents, review records, and refer for regulatory action — all at no cost to the resident or family",
            "The Long-Term Care Ombudsman is a private attorney who charges hourly legal fees to represent nursing home residents in civil litigation against facilities",
            "The Long-Term Care Ombudsman has authority to immediately arrest nursing home staff found to be in violation of resident care standards",
            "The Long-Term Care Ombudsman program only accepts complaints about financial billing disputes; it has no authority to investigate issues related to care quality, dignity, or neglect",
            "The Long-Term Care Ombudsman program is a hospital-based service that exclusively resolves complaints about acute care settings and has no jurisdiction over nursing homes"
        ],
        "answer": 0,
        "exp": "The **Long-Term Care Ombudsman (LTCO) Program** is established under **Title VII of the Older Americans Act** and is administered at the state and local level. Every state is required to have an LTCO program. Key functions: (1) **Advocate** for residents of nursing homes and assisted living facilities; (2) **Investigate complaints** about care quality, dignity violations, abuse, neglect, and rights infringements; (3) **Access authority**: Ombudsmen have the legal right to enter facilities and review records (with resident consent); (4) **Free service** to residents and families; (5) **Referral authority**: can refer cases to the State Survey Agency for regulatory action or to Adult Protective Services; (6) **Regular facility visits**: provide monitoring and early problem detection. The LTCO is distinct from APS (which handles community-based abuse) and the State Survey Agency (which conducts formal inspections). (Ref: Hazzard's Ch. 17; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics)"
    },
    # T34: Social determinants screening tools — PRAPARE, SDOH
    {
        "q": "A primary care geriatrician is implementing a standardized social determinants of health (SDOH) screening program for all older adult patients. A {age}-year-old {gender} named {name} screens positive for food insecurity, housing instability, lack of transportation to medical appointments, social isolation, and inability to pay utility bills. Which of the following represents the most evidence-based and comprehensive clinical response to a positive SDOH screening?",
        "options": [
            "Document identified SDOH needs in the problem list; refer to a licensed clinical social worker and community health worker for individualized resource navigation; connect with the Area Agency on Aging for benefit enrollment assistance; and follow up within 30 days to assess whether connections to resources were successfully made",
            "Tell the patient that social issues are outside the scope of clinical medicine and that they should contact a charity organization independently",
            "Immediately hospitalize the patient for all identified social needs, as the inpatient setting is the most efficient place to resolve food insecurity and housing instability",
            "Prescribe a multi-vitamin and high-calorie supplement as the sole intervention for food insecurity and dismiss the patient with no further SDOH follow-up",
            "Refer the patient to the emergency department for all social needs, as only emergency medicine physicians are qualified to address social determinants of health"
        ],
        "answer": 0,
        "exp": "**SDOH screening tools** such as **PRAPARE** (Protocol for Responding to and Assessing Patients' Assets, Risks, and Experiences), **AHC HRSN Screening Tool** (developed by CMS), and the **WellRx** address domains including: food insecurity, housing instability, transportation, social isolation, financial strain, and utility assistance. Positive screens require action beyond documentation: (1) **Social work/community health worker (CHW) referral** — CHWs are trusted, culturally competent community liaisons trained in resource navigation; (2) **Area Agency on Aging** — comprehensive benefit enrollment, Meals on Wheels, transportation, case management; (3) **Electronic resource platforms** (findhelp.org, 211) — can connect patients to local food pantries, LIHEAP, SNAP; (4) **Follow-up to close the loop** — screening without follow-up is insufficient; systems-level referral tracking is needed. This is a growing priority in Medicare quality programs (CMMI health equity initiatives). (Ref: Hazzard's Ch. 17; AGS Geriatrics At Your Fingertips; Current Diagnosis & Treatment: Geriatrics)"
    },
    # T35: Medicare Annual Wellness Visit — SDOH and preventive focus
    {
        "q": "A {age}-year-old {gender} named {name} attends {possessive} Medicare Annual Wellness Visit (AWV). During the visit, the clinician is expected to assess the patient's health status and social needs. Which of the following accurately describes a required or recommended component of the Medicare Annual Wellness Visit that directly addresses social determinants of health and aging-related risks?",
        "options": [
            "The Medicare Annual Wellness Visit requires a review of the patient's functional status, cognition (using a structured screen), fall risk, depression screening (PHQ-9 or equivalent), advance care planning discussion, and social history including caregiver support, living situation, and community resource needs",
            "The Medicare Annual Wellness Visit is identical to a standard sick visit and consists solely of evaluating the chief complaint with no preventive or social assessment components",
            "The Medicare Annual Wellness Visit requires a full physical examination (auscultation, percussion, and palpation of all organ systems) and a complete blood count, metabolic panel, and urinalysis for all patients",
            "The Medicare Annual Wellness Visit may only be performed in hospital outpatient settings by board-certified geriatricians and cannot be delivered by primary care physicians or nurse practitioners",
            "The Medicare Annual Wellness Visit is a one-time benefit available only to Medicare beneficiaries in the first year of Medicare enrollment and cannot be repeated annually"
        ],
        "answer": 0,
        "exp": "The **Medicare Annual Wellness Visit (AWV)** (established under the ACA in 2011) is an annual preventive visit covered at **100% under Medicare Part B** (no patient copay). Required components include: (1) **Health Risk Assessment (HRA)** — self-reported health status, psychosocial risks, behavioral risks; (2) **Cognitive assessment** — structured screen (MMSE, MoCA, or validated alternative); (3) **Depression screening** (PHQ-9 or equivalent); (4) **Fall risk assessment**; (5) **Functional status review** (ADLs); (6) **Advance care planning** discussion (documented); (7) **Social history** — living situation, caregiver support, community resources; (8) **Personalized prevention plan** — tailored screening, referrals, and health goals; (9) **Review of medications** and health providers. Key distinction: AWV does NOT require a full physical exam (that is a separate 'Welcome to Medicare' preventive visit in year 1). It CAN be performed by any qualified clinician. (Ref: AGS Geriatrics At Your Fingertips; CMS AWV Guidelines; Hazzard's Ch. 17)"
    },
]

# ============================================================
# Additional variable pools for template formatting
# ============================================================
weight_loss_pool = [8, 10, 12, 14, 15, 18, 20, 22]

def generate_mcqs():
    mcqs = []
    seen_questions = set()

    for t_idx, t in enumerate(templates):
        variants_generated = 0
        attempts = 0
        max_attempts = 200

        while variants_generated < 10 and attempts < max_attempts:
            attempts += 1

            g = random.choice(genders_pool)
            name = random.choice(g["names"])
            age = random.choice(ages_pool)
            caregiver = random.choice(caregivers_pool)
            dementia_stage = random.choice(dementia_stages_pool)
            years = random.choice(years_pool)
            zarit = random.choice(zarit_scores_pool)
            phq9 = random.choice(phq9_scores_pool)
            income = random.choice(income_pool)
            months = random.choice(months_pool)
            hours = random.choice(hours_pool)
            adl_count = random.choice(adl_count_pool)
            iadl_count = random.choice(iadl_count_pool)
            weight_loss = random.choice(weight_loss_pool)
            state = random.choice(states_pool)

            format_kwargs = {
                "age": age,
                "gender": g["gender"],
                "name": name,
                "pronoun": g["pronoun"],
                "pronoun_cap": g["pronoun_cap"],
                "possessive": g["possessive"],
                "possessive_cap": g["possessive_cap"],
                "objective": g["objective"],
                "caregiver": caregiver,
                "dementia_stage": dementia_stage,
                "years": years,
                "zarit": zarit,
                "phq9": phq9,
                "income": income,
                "months": months,
                "hours": hours,
                "adl_count": adl_count,
                "iadl_count": iadl_count,
                "weight_loss": weight_loss,
                "state": state,
            }

            try:
                q_text = t["q"].format(**format_kwargs)
            except (KeyError, IndexError):
                q_text = t["q"]

            if q_text in seen_questions:
                continue

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

            random.shuffle(opts_formatted)
            new_ans_idx = opts_formatted.index(correct_opt)

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
    out_file = f"c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260521_geri_social_mcqs_p{part_num}.sql"
    with open(out_file, "w", encoding="utf-8") as f:
        start_idx = (part_num - 1) * 100 + 1
        end_idx = (part_num - 1) * 100 + len(part_mcqs)
        f.write(f"-- US MD/MBBS (4th Year) clinical case blocks - Geriatrics: Social determinants — caregiver burden, housing, nursing home vs community care - Part {part_num} ({start_idx}-{end_idx})\n")
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
# Write all 350 MCQs to ggeriatrics_mcqs_full.md in Markdown
# ============================================================
md_file_path = "c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\ggeriatrics_mcqs_full.md"
with open(md_file_path, "w", encoding="utf-8") as md_f:
    md_f.write("# Geriatrics MCQs – Social Determinants, Caregiver Burden, Housing, Nursing Home vs Community Care\n\n")
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
