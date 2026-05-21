import json
import random

random.seed(42)

topic_slug = 'geri-abuse'

# ============================================================
# Pools of Variables for Randomization
# ============================================================
female_names = [
    "Margaret", "Eleanor", "Dorothy", "Ruth", "Mildred", "Frances", "Elizabeth",
    "Helen", "Alice", "Florence", "Gladys", "Marie", "Lillian", "Evelyn", "Jean",
    "Rose", "Irene", "Shirley", "Hazel", "Gertrude", "Louise", "Grace", "Ruby",
    "Virginia", "Catherine", "Martha", "Edna", "Phyllis", "Clara", "Edith", "Beatrice",
    "Esther", "Lois", "Bernice", "Norma", "Phyllis", "Gladys", "Alice"
]

male_names = [
    "James", "John", "Robert", "William", "Charles", "Thomas", "Walter", "Arthur",
    "Albert", "Harold", "Richard", "Joseph", "Henry", "George", "Edward", "Raymond",
    "Paul", "Donald", "Harry", "Ralph", "Kenneth", "David", "Eugene", "Howard",
    "Frank", "Lawrence", "Herbert", "Roy", "Clarence", "Stanley", "Bernard",
    "Leonard", "Edwin", "Carl", "Earl", "Fred", "Louis"
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

ages_pool = list(range(66, 98, 2))
caregivers_pool = ["adult son", "daughter", "spouse", "grandson", "granddaughter", "nephew", "niece", "paid caregiver"]
dementia_stages_pool = ["mild", "moderate", "advanced", "severe"]
bruise_locations_pool = ["upper back", "inner arms", "lower abdomen", "buttocks", "thighs"]
bony_prominences_pool = ["knees", "elbows", "foreheads", "shins"]

templates = [
    # ===== TYPES OF ELDER ABUSE (T1-T10) =====
    # T1: Physical abuse (bruises on torso/back, caregiver answers)
    {
        "q": "A {age}-year-old {gender} named {name} with {dementia_stage} dementia is brought to the clinic by {possessive} {caregiver} for a routine checkup. During physical examination, you note multiple linear, purple-blue bruises on {possessive} {bruise_location} and chest. When asked how these injuries occurred, the {caregiver} immediately interrupts, stating, '{name} is clumsy and fell out of bed a few days ago.' The patient remains silent, hypervigilant, and avoids eye contact. What is the most appropriate next step in clinical management?",
        "options": [
            "Interview the patient alone in a safe, private space to conduct a targeted screening for physical abuse and neglect, and file a report with Adult Protective Services (APS) based on reasonable suspicion",
            "Reassure the caregiver that minor falls are common in dementia and prescribe a daily low-dose aspirin for cardiovascular protection",
            "Confront the caregiver aggressively in front of the patient, accusing them of domestic violence and physical assault",
            "Order a full-body skeletal survey and head CT to document all injuries before talking to either the patient or caregiver",
            "Advise the caregiver to use soft physical restraints at night to prevent the patient from falling out of bed"
        ],
        "answer": 0,
        "exp": "Physical abuse in older adults is characterized by non-accidental physical force resulting in injury. Bruises on non-bony, protected areas (such as the back, chest, inner arms, or thighs) are highly red-flagged for intentional trauma, as accidental falls typically injure bony prominences (knees, elbows, forehead). The initial step is always to interview the patient alone to ensure safety and allow for non-judgmental, direct screening. Clinicians are legally mandated to report any reasonable suspicion of elder abuse or neglect to Adult Protective Services (APS). Absolute proof is not required. (Ref: Hazzard's Ch. 14; Current Diagnosis & Treatment: Geriatrics Ch. 12; UWorld Step 2 CK)"
    },
    # T2: Active caregiver neglect (withholding medications/insulin)
    {
        "q": "A {age}-year-old {gender} named {name} is brought to the emergency department in a state of hyperosmolar hyperglycemic state (HHS) with a blood glucose of {glucose} mg/dL. {possessive_cap} {caregiver}, who manages {name}'s medications, states {pronoun} has been administering {possessive} insulin daily. However, the patient's pharmacy records reveal that {possessive} insulin prescriptions have not been refilled for the past {months} months, despite {name} having adequate financial insurance. Physical examination shows severe dehydration, poor hygiene, and a soiled diaper. Which type of elder abuse is best represented in this scenario?",
        "options": [
            "Active caregiver neglect; which involves the deliberate withholding of essential life-sustaining care, medications, or nutrition by a caregiver",
            "Passive caregiver neglect; which occurs when a well-meaning caregiver is overwhelmed and lacks the knowledge or capacity to provide care",
            "Physical abuse; which involves the intentional infliction of physical pain, injury, or bodily impairment",
            "Financial exploitation; which involves the illegal or improper use of an elder's funds, assets, or property",
            "Self-neglect; which occurs when an older adult refuses or fails to manage their own essential personal care and safety"
        ],
        "answer": 0,
        "exp": "Active caregiver neglect is the intentional withholding of food, medication, medical care, or hygiene services by a designated caregiver. In this case, the caregiver deliberately withheld life-sustaining insulin (indicated by the unfilled prescriptions over several months despite insurance), resulting in life-threatening hyperosmolar hyperglycemic state (HHS). This contrasts with passive neglect, where the caregiver lacks the capacity or resources but has no malicious or deliberate intent to withhold care. (Ref: Hazzard's Ch. 14; UWorld Step 2 CK; First Aid Step 2 CK)"
    },
    # T3: Passive caregiver neglect (overwhelmed spouse/caregiver)
    {
        "q": "A {age}-year-old {gender} named {name} with advanced Parkinson's disease and severe mobility impairment is brought to the clinic by {possessive} elderly spouse. On examination, the patient has severe perineal dermatitis, deep skin folds filled with dried urine and feces, and an unaddressed sacral pressure injury. The spouse appears extremely exhausted, tearful, and admits, 'I am doing my best, but {name} has become too heavy for me to lift, and I can't keep up with the laundry or bathing.' There are no signs of intentional physical trauma. What is the most appropriate primary diagnosis and clinical approach?",
        "options": [
            "Passive caregiver neglect; provide immediate nursing care, engage social work to set up home health aids and respite care, and file a mandatory report with Adult Protective Services (APS)",
            "Active caregiver neglect; immediately notify law enforcement to arrest the spouse for criminal abandonment",
            "Self-neglect; refer the patient to an involuntary psychiatric facility for treatment of cognitive decline",
            "Institutional abuse; report the spouse to the state long-term care ombudsman for administrative review",
            "Medical non-adherence; instruct the spouse that they must perform physical therapy at home for 4 hours daily"
        ],
        "answer": 0,
        "exp": "Passive caregiver neglect occurs when a caregiver fails to provide necessary care due to physical, financial, or cognitive limitations, or severe caregiver burnout, without deliberate intent to cause harm. The spouse is clearly overwhelmed by the physical demands of caregiving. While the clinician must still file a mandatory report to Adult Protective Services (APS) to mobilize supportive resources, the management should focus on helper support: arranging home health services, physical therapy, respite care, and social work assistance to reduce caregiver burden. (Ref: Current Diagnosis & Treatment: Geriatrics Ch. 12; AGS Geriatrics At Your Fingertips; UWorld Step 2 CK)"
    },
    # T4: Financial exploitation (unusual cash withdrawals)
    {
        "q": "A {age}-year-old {gender} named {name} with {dementia_stage} dementia is accompanied to the clinic by {possessive} {caregiver}. The clinic social worker notices that the patient's bank recently flagged several large, cash ATM withdrawals and a sudden transfer of {name}'s home title to the {caregiver}. During a private interview, {name} appears confused and states, 'My {caregiver} told me I had to sign some papers to keep receiving my social security checks, but I don't know what they were.' The patient has no signs of physical trauma. What is the most appropriate diagnostic classification and next step?",
        "options": [
            "Financial exploitation; document the clinical interview meticulously, file a mandatory report with Adult Protective Services (APS), and advise the family to contact financial institutions and elder law services",
            "Self-neglect; advise the patient to immediately close all bank accounts and keep cash under {possessive} mattress",
            "Psychological abuse; immediately prescribe a high-dose atypical antipsychotic to treat the patient's paranoia about the {caregiver}",
            "Medical neglect; order a stat non-contrast head CT and toxicology screening to rule out acute encephalopathy",
            "Systemic institutional abuse; contact the state long-term care ombudsman to audit the bank's transaction security"
        ],
        "answer": 0,
        "exp": "Financial exploitation involves the illegal, unauthorized, or improper use of an older adult's resources, funds, property, or assets for personal gain. Red flags include large unexplained bank withdrawals, signing over deeds/titles under coercion, and changes to wills or powers of attorney in the setting of cognitive impairment. Clinicians are legally mandated to report suspected financial exploitation to Adult Protective Services (APS). Supportive measures include consulting elder law attorneys and notifying banks. (Ref: Hazzard's Ch. 14; AGS Geriatrics At Your Fingertips; UWorld Step 2 CK)"
    },
    # T5: Self-neglect (hoarding, cognitive decline, refusing care)
    {
        "q": "A {age}-year-old {gender} named {name} lives alone and is brought to the clinic by a concerned neighbor. The neighbor reports that {name}'s house is filled with trash, has no running water or heat, and multiple dogs are roaming inside. On examination, {name} is cachectic, disheveled, has long unkempt nails, and smells of urine. Cognitive screening reveals a Montreal Cognitive Assessment (MoCA) score of {moca}/30. {name} adamantly refuses any assistance, stating, 'I am fine, I have lived here for 40 years, and I don't want anyone in my house.' What is the most appropriate clinical interpretation and action?",
        "options": [
            "Diagnose self-neglect; perform a comprehensive capacity assessment to determine if {pronoun} has the capacity to refuse services, and file a report with Adult Protective Services (APS)",
            "Respect the patient's autonomy and discharge {objective} home immediately with no further action, as competent adults have the right to live as they choose",
            "Involuntarily admit the patient to a secure psychiatric unit for lifetime management of hoarding disorder",
            "Contact law enforcement to have the patient arrested for public nuisance and animal cruelty",
            "Unilaterally sign the patient over to a long-term care nursing home without performing a capacity assessment"
        ],
        "answer": 0,
        "exp": "Self-neglect is the most common form of elder abuse reported to APS. It occurs when an older adult fails to provide themselves with adequate food, shelter, hygiene, or medical care, posing a threat to their health and safety. In patients who refuse assistance, the clinician must assess **decision-making capacity**. If the patient lacks capacity (e.g., due to advanced cognitive decline, represented by a low MoCA score), protective interventions can be forced via legal channels (emergency guardianship). If the patient retains capacity, they have the legal right to refuse services, but APS should still be involved to offer voluntary support and harm reduction. (Ref: Hazzard's Ch. 14; Current Diagnosis & Treatment: Geriatrics Ch. 12; UWorld Step 2 CK)"
    },
    # T6: Psychological/Emotional abuse (verbal threats, patient withdrawn)
    {
        "q": "A {age}-year-old {gender} named {name} is seen in the clinic for chronic hypertension. During the visit, {possessive} {caregiver} constantly belittles {objective}, calling {objective} 'stupid,' 'dirty,' and a 'burden' in front of the staff. The {caregiver} repeatedly states, 'If you don't start behaving, I will lock you in the basement or put you in the worst nursing home in the state.' {name} sits with head bowed, trembling, and whispers, 'I'm sorry.' There are no physical bruises. What is the most accurate description of this behavior and the clinician's obligation?",
        "options": [
            "Psychological or emotional abuse; which involves the infliction of anguish, pain, or distress through verbal or non-verbal acts; the clinician is legally required to report this to Adult Protective Services (APS)",
            "Normal caregiver-patient interaction; reassure the caregiver that their frustration is completely justified and offer no further interventions",
            "Physical abuse; file a report with local law enforcement to immediately arrest the caregiver for physical assault",
            "Passive caregiver neglect; refer the caregiver to a local clinical training program for anger management, but do not report the case",
            "Self-neglect; advise the patient to seek outpatient psychotherapy to improve {possessive} self-esteem and ignore the caregiver's comments"
        ],
        "answer": 0,
        "exp": "Psychological or emotional abuse in older adults includes verbal assaults, threats of abuse, harassment, intimidation, infantilization, and social isolation. While it does not leave physical marks, it causes significant mental anguish and is associated with increased mortality in older adults. Clinicians must identify these interactions, document them objectively in the medical record, interview the patient alone, and file a mandatory report with Adult Protective Services (APS). (Ref: Hazzard's Ch. 14; UWorld Step 2 CK)"
    },
    # T7: Sexual abuse (genital trauma/bruising in dementia)
    {
        "q": "A {age}-year-old {gender} named {name} with severe, non-verbal dementia is brought from a long-term care facility to the emergency department due to acute agitation and a change in behavior. On physical examination, the nurse notes unexplained bruising on the patient's inner thighs, perineal area, and new-onset vaginal bleeding. Direct examination reveals lacerations of the posterior fourchette. Which type of elder abuse is suspected, and what is the most critical immediate clinical action?",
        "options": [
            "Suspected elder sexual abuse; perform a thorough, gentle medical-forensic examination (rape kit if within time window), secure the patient's immediate safety, and immediately notify law enforcement and the state health department/ombudsman",
            "Suspected self-neglect; advise the facility staff to use adult diapers and apply topical zinc oxide ointment to the perineum",
            "Suspected passive neglect; counsel the nursing home administrator on upgrading their staff training regarding diaper changes",
            "Suspected systemic physical abuse; prescribe an atypical antipsychotic to manage the patient's agitation and return {objective} to the facility",
            "Suspected medical neglect; schedule a follow-up appointment with a gynecologist in 4 weeks to re-evaluate the bleeding"
        ],
        "answer": 0,
        "exp": "Elder sexual abuse is defined as non-consensual sexual contact of any kind with an older adult, particularly those who lack the capacity to consent (such as patients with advanced, non-verbal dementia). Red flags include perineal/inner thigh bruising, unexplained genital bleeding, vaginal lacerations, and sudden behavioral changes. Immediate steps include ensuring the patient's safety, performing a medical-forensic exam by a trained specialist (SANE), documenting all injuries, and immediately reporting the case to both law enforcement and the state regulatory agencies (such as the Long-Term Care Ombudsman/Department of Health for institutional settings). (Ref: Hazzard's Ch. 14; Current Diagnosis & Treatment: Geriatrics Ch. 12; UWorld Step 2 CK)"
    },
    # T8: Institutional abuse (restraints, over-sedation)
    {
        "q": "A {age}-year-old {gender} named {name} with moderate Alzheimer's disease is residing in a local nursing home. During an unannounced visit, {possessive} family finds {name} tied to a wheelchair with a bedsheet and heavily sedated. The nursing staff states, 'We are short-staffed today, and {name} kept wandering toward the exit, so we had to give {objective} extra diphenhydramine and tie {objective} down to prevent a fall.' There is no physician order for restraints or sedation. How should this scenario be classified and managed?",
        "options": [
            "Institutional abuse and neglect; the use of physical restraints (tying with a sheet) and chemical restraints (sedation) for staff convenience or as a substitute for supervision is illegal; file a report with the Long-Term Care Ombudsman and state licensing department",
            "Appropriate fall prevention; praise the nursing staff for their proactive safety measures and document the restraint as standard nursing care",
            "Self-neglect; advise the family to hire a private duty nurse to sit with the patient, as the facility is not responsible for exit-seeking behavior",
            "Physical abuse by the family; accuse the family of failing to provide a safe home environment, forcing the patient into a nursing home",
            "Medical neglect by the physician; file a complaint against the medical director for failing to prescribe daily physical restraints"
        ],
        "answer": 0,
        "exp": "Institutional abuse refers to abuse or neglect that occurs in a residential facility (nursing home, assisted living). The use of **physical restraints** (e.g., tying a patient to a chair) or **chemical restraints** (e.g., administering sedatives like diphenhydramine, benzodiazepines, or antipsychotics) for the convenience of staff or as a substitute for active supervision is strictly prohibited by federal and state regulations (OBRA 1987). Clinicians must report this immediately to the **Long-Term Care Ombudsman** and the state health department, who oversee institutional standards of care. (Ref: Hazzard's Ch. 14; Current Diagnosis & Treatment: Geriatrics Ch. 12)"
    },
    # T9: Medical neglect (repeated missed appointments)
    {
        "q": "A {age}-year-old {gender} named {name} with severe osteoarthritis and chronic open-angle glaucoma is brought to the clinic. You note that the patient has missed {missed_appts} consecutive ophthalmology appointments over the past year. The caregiver, {possessive} {caregiver}, admits to not filling the patient's prostaglandin analog eye drops because 'it's too much driving, and {pronoun} is old anyway.' On exam, the patient is found to have progressed to near-total blindness in the left eye. What is the clinical classification of this finding?",
        "options": [
            "Medical neglect; which occurs when a caregiver fails to provide the necessary medical care, treatments, or medications required to maintain the elder's physical health, leading to preventable harm",
            "Self-neglect; because the patient should have driven themselves to the pharmacy and eye clinic",
            "Active physical abuse; because the caregiver intentionally damaged the patient's optic nerve using physical trauma",
            "Accidental age-related decline; since vision loss is an inevitable part of normal aging and cannot be prevented",
            "Financial exploitation; because the caregiver saved money by not buying the eye drops"
        ],
        "answer": 0,
        "exp": "Medical neglect is a subtype of neglect where a caregiver fails to provide necessary medical treatments, medications, or appointments to an older adult who is dependent on them, resulting in physical deterioration or injury. Withholding glaucoma medication and failing to bring the patient to critical specialist appointments, leading to permanent, preventable blindness, is a classic case of medical neglect. (Ref: Hazzard's Ch. 14; Current Diagnosis & Treatment: Geriatrics Ch. 12; UWorld Step 2 CK)"
    },
    # T10: Abandonment (deserted at ED waiting room)
    {
        "q": "A {age}-year-old {gender} named {name} with advanced dementia is found sitting alone in the emergency department waiting room. {pronoun_cap} is wearing soiled clothes and has a note pinned to {possessive} jacket written by {possessive} {caregiver} stating, 'I cannot do this anymore. I am leaving the state. Please take care of {objective}.' The patient is unable to provide {possessive} address or the caregiver's contact information. What is the correct term for this form of abuse, and what is the immediate clinical action?",
        "options": [
            "Abandonment; admit the patient to the hospital for safety, perform a comprehensive medical evaluation, and immediately notify Adult Protective Services (APS) and law enforcement",
            "Self-neglect; contact a local homeless shelter to arrange overnight lodging and discharge the patient from the ED",
            "Passive neglect; instruct the emergency department security staff to search the nearby parking lot and force the caregiver to return",
            "Medical neglect; prescribe a cholinesterase inhibitor to restore the patient's memory so {pronoun} can go home alone",
            "Institutional abuse; report the emergency department administration to the state health department for patient dumping"
        ],
        "answer": 0,
        "exp": "Abandonment is the desertion of an older adult by an individual who has assumed responsibility for providing care or physical custody. It is a severe form of elder abuse. In this scenario, leaving an incapacitated patient in an ED waiting room without a safe handoff constitutes abandonment. Immediate management involves ensuring the patient's safety, admitting them to the hospital (as they cannot be safely discharged), performing a comprehensive medical assessment, and filing a report with both Adult Protective Services (APS) and law enforcement to locate the caregiver. (Ref: Hazzard's Ch. 14; UWorld Step 2 CK)"
    },

    # ===== RED FLAGS & CLINICAL SIGNS (T11-T20) =====
    # T11: Bruising patterns (bony prominences vs. soft areas)
    {
        "q": "A {age}-year-old {gender} named {name} is brought to the clinic with bruising. Which of the following bruising patterns is most highly specific for intentional physical abuse rather than accidental trauma from typical geriatric falls?",
        "options": [
            "Multiple large bruises on the neck, ears, lateral face, upper arms, and trunk in various stages of healing",
            "A single bruise on the anterior tibia (shin) resulting from bumping into a coffee table",
            "Symmetrical bruises on the bilateral patellae (knees) following a trip-and-fall accident",
            "A small ecchymosis over the dorsal aspect of the hand from an accidental bump",
            "A linear bruise along the elbow crease after a minor slip on ice"
        ],
        "answer": 0,
        "exp": "Accidental bruises in older adults typically occur on **bony prominences** such as the anterior shins, knees, elbows, and forehead, and are usually single or localized. In contrast, **intentional physical abuse** is strongly suggested by bruises located on **soft, protected areas** (such as the neck, ears, inner arms, lateral face, chest, abdomen, back, and buttocks) and bruises in **various stages of healing** (indicating repeated, chronic trauma). Bruises larger than 5 cm on the arms or trunk should also raise suspicion. (Ref: Hazzard's Ch. 14; Lachs & Pillemer, N Engl J Med 2015; UWorld Step 2 CK)"
    },
    # T12: Skeletal trauma (spiral fractures in non-ambulatory elder)
    {
        "q": "A {age}-year-old {gender} named {name} is non-ambulatory and bedbound due to severe advanced dementia. {pronoun_cap} is brought to the emergency department by {possessive} {caregiver} with acute swelling and deformity of the right upper arm. An X-ray reveals a spiral fracture of the mid-shaft humerus. The caregiver states, '{name} must have twisted {possessive} arm in the bedsheets overnight.' What is the clinical significance of this finding?",
        "options": [
            "The spiral fracture in a non-ambulatory patient is highly suspicious for physical abuse caused by a twisting force; the clinician must interview the patient alone, document the injury, and file a report with Adult Protective Services (APS)",
            "The fracture is a normal consequence of severe osteoporosis and can easily occur from rolling over in bed without external force",
            "The caregiver's history is highly plausible; the patient should be discharged home with a plaster cast and routine orthopedic follow-up",
            "This fracture pattern is indicative of self-inflicted injury, and the patient should be referred for emergency psychiatric evaluation",
            "A spiral fracture is pathognomonic for vitamin D toxicity, and the clinician should hold all calcium supplements immediately"
        ],
        "answer": 0,
        "exp": "A **spiral fracture** of a long bone (like the humerus or femur) in a **non-ambulatory, bedbound patient** is a major red flag for physical abuse. Spiral fractures require a significant rotational (twisting) force, which cannot be self-inflicted or occur from simple bed movements. Because the patient is non-ambulatory, the injury must have been caused by an external agent. The clinician is legally obligated to report this suspected abuse to Adult Protective Services (APS) and initiate a comprehensive safety assessment. (Ref: Hazzard's Ch. 14; UWorld Step 2 CK)"
    },
    # T13: Thermal injuries (immersion burns with sparing of flexures)
    {
        "q": "A {age}-year-old {gender} named {name} with moderate dementia is brought to the emergency department with second-degree burns on the bilateral lower feet and ankles. On physical examination, you note a sharp horizontal line of demarcation ('stocking' distribution) with sparing of the skin creases on the anterior ankles and posterior knees. The caregiver states, '{name} stepped into a hot bath {pronoun} drew {possessive}self.' What does this burn pattern indicate?",
        "options": [
            "Forced immersion burn; the stocking distribution and flexural sparing indicate the patient's feet were held down in hot water, contradicting the caregiver's story; this is physical abuse and requires emergency admission and reporting",
            "Accidental splash burn; which typically presents with random, asymmetrical drop-like burn marks across the thighs and abdomen",
            "Normal age-related thermal sensitivity; because elderly skin burns at much lower temperatures than younger skin during self-bathing",
            "Necrotizing vasculitis; a systemic autoimmune condition presenting with cutaneous necrosis resembling thermal burns",
            "Severe diabetic neuropathy; which causes spontaneous blistering (bullosis diabeticorum) resembling thermal immersion burns"
        ],
        "answer": 0,
        "exp": "A **forced immersion burn** is characterized by a symmetric, uniform distribution (often a stocking or glove pattern) with a **sharp horizontal level of demarcation** and **sparing of flexure lines** (like the skin folds behind the knees or ankles, caused by the patient flexing the joints to resist the hot water). Accidental burns, in contrast, show asymmetrical, irregular splash marks. This pattern strongly indicates the patient was held down in scalding water, representing severe physical abuse. Emergency hospitalization is required for burn care, safety, and mandatory reporting. (Ref: Hazzard's Ch. 14; UWorld Step 2 CK)"
    },
    # T14: Dehydration/malnutrition in dependent elders
    {
        "q": "A {age}-year-old {gender} named {name} with advanced dementia is completely dependent on {possessive} {caregiver} for all activities of daily living. The patient is brought to the clinic and found to have a weight loss of {weight_loss} lbs ({weight_loss_pct}% of body weight) in the past {months} months, severe skin turgor loss, dry mucous membranes, and laboratory values showing a serum sodium of {sodium} mEq/L and a BUN/creatinine ratio of {bun_cr}. The caregiver states, 'I feed {name} three times a day, but {pronoun} just refuses to eat.' What is the most appropriate diagnostic and management strategy?",
        "options": [
            "Evaluate for caregiver neglect; review food intake logs, assess for dysphagia, check pharmacy records for missed meds, and file a report with Adult Protective Services (APS) due to severe malnutrition and dehydration",
            "Accept the caregiver's explanation and prescribe high-dose oral loop diuretics to manage the patient's hypernatremia",
            "Diagnose primary anorexia nervosa and refer the patient for inpatient psychiatric eating disorder treatment",
            "Immediately place a percutaneous endoscopic gastrostomy (PEG) feeding tube, as this is the standard treatment for malnutrition in advanced dementia",
            "Reassure the caregiver that severe dehydration and rapid weight loss are normal and beneficial phases of late-stage dementia"
        ],
        "answer": 0,
        "exp": "Severe malnutrition, rapid weight loss, and hypernatremic dehydration in a dependent older adult are significant red flags for caregiver neglect (either active withholding or passive inability to feed). The clinician must evaluate the situation by: (1) ruling out medical causes (e.g., severe dysphagia, cancer), (2) interviewing the patient and caregiver, (3) checking pharmacy refills, and (4) filing a report with Adult Protective Services (APS). In advanced dementia, hand-feeding should be optimized; PEG tubes are not recommended as they do not improve nutritional parameters or prolong life. (Ref: Hazzard's Ch. 14 & Ch. 82; UWorld Step 2 CK)"
    },
    # T15: Over-sedation/Toxicology (chemical restraints)
    {
        "q": "A {age}-year-old {gender} named {name} with mild cognitive decline is brought to the clinic by {possessive} {caregiver} because the patient has been 'sleeping all day' and is increasingly unsteady on {possessive} feet, resulting in a fall. On examination, the patient is extremely lethargic, slurring words, and has a positive Romberg sign. A serum toxicology screen is positive for {sedative}, which has never been prescribed to the patient. The caregiver admits, 'Sometimes I give {name} a little of my {sedative} to keep {objective} quiet so I can get some housework done.' What is the clinical term for this practice, and what is the clinician's obligation?",
        "options": [
            "Chemical restraint (elder abuse); administering sedating medications without clinical indication or consent for behavioral control; file a mandatory report with Adult Protective Services (APS)",
            "Appropriate off-label sedation; document the caregiver's rationale and officially write a prescription for the sedative to ensure safety",
            "Self-neglect; because the patient should have refused to swallow the pills given by the caregiver",
            "Passive caregiver neglect; since the caregiver did not intend to poison the patient, no reporting is required",
            "Accidental drug interaction; advise the patient to separate their medications by at least 2 hours to prevent cross-contamination"
        ],
        "answer": 0,
        "exp": "A **chemical restraint** is the use of any medication (typically benzodiazepines, antipsychotics, or sedating antihistamines) to restrict a patient's freedom of movement or control their behavior, where the medication is not standard treatment for the patient's medical or psychiatric condition. Toking or sedating an older adult for the caregiver's convenience is a form of elder abuse/neglect. The clinician must report this suspected abuse to Adult Protective Services (APS) and address the safety of the patient's home environment. (Ref: Hazzard's Ch. 14; Current Diagnosis & Treatment: Geriatrics Ch. 12; UWorld Step 2 CK)"
    },
    # T16: Caregiver behavior red flags (refusing private interview)
    {
        "q": "A {age}-year-old {gender} named {name} presents to the clinic with {possessive} {caregiver} for evaluation of a skin lesion. During the intake, the nurse notes that the {caregiver} is highly defensive, aggressive, and answers all questions directed at {name}. When the clinician asks the {caregiver} to step out of the room for a brief patient exam, the {caregiver} refuses, stating, '{name} is confused and needs me here for everything. I refuse to leave.' Which of the following is the most appropriate action for the clinical team?",
        "options": [
            "State firmly that a private examination is a standard clinic safety policy, enlist clinic security or administration to assist in escorting the caregiver out, and interview the patient alone about potential abuse and neglect",
            "Acquiesce to the caregiver's demand and conduct the interview in their presence to avoid escalating the conflict",
            "Cancel the medical visit immediately and tell the patient they cannot receive care unless they return alone",
            "Immediately call the police to arrest the caregiver for obstruction of justice and assault",
            "Conduct the physical exam with the caregiver present but use written notes to ask the patient if they are being abused"
        ],
        "answer": 0,
        "exp": "Caregiver behavioral red flags include defensiveness, hostility, answering for the patient, and refusing to allow the patient to be interviewed alone. Interviewing the patient alone is a **critical clinical standard** when screening for elder abuse or domestic violence. If a caregiver refuses to leave, the clinician must firmly state that private interviews are standard policy, use clinic staff or security to separate them, and proceed with the private safety screening. Yielding to the caregiver prevents the patient from disclosing abuse out of fear of retaliation. (Ref: Hazzard's Ch. 14; UWorld Step 2 CK; First Aid Step 2 CK)"
    },
    # T17: Patient behavior red flags (withdrawn, hypervigilant)
    {
        "q": "A {age}-year-old {gender} named {name} with mild cognitive impairment is seen in the clinic. The clinician notes that when the {caregiver} enters the room, the patient immediately stops speaking, tenses {possessive} shoulders, and looks down at the floor. When asked directly about a bruise on {possessive} forearm, the patient looks at the caregiver's face before whispering, 'I bumped it on the door, it was my fault.' The caregiver appears hostile and glares at the patient. What is the most appropriate interpretation of these behavioral cues?",
        "options": [
            "The patient's behavior indicates fear and hypervigilance, which are key behavioral red flags for elder abuse; the clinician must separate the patient and caregiver and screen for safety",
            "The patient's behavior is a typical manifestation of mild cognitive impairment and normal aging, requiring no further investigation",
            "The patient's behavior indicates active depression, and the clinician should immediately start an SSRI without investigating the bruising",
            "The patient is displaying oppositional defiant behavior toward the caregiver, and the caregiver should be counseled on behavioral control",
            "The patient's behavior is pathognomonic for a stroke, and the clinician should immediately activate the stroke protocol"
        ],
        "answer": 0,
        "exp": "Behavioral red flags in the patient include hypervigilance, sudden withdrawal or mutism in the presence of the caregiver, looking to the caregiver for permission to speak, and apologizing for injuries. These signs suggest fear of retaliation and control. The clinician must separate the patient and caregiver, conduct a private interview, and file a report with Adult Protective Services (APS) if abuse is suspected. (Ref: Hazzard's Ch. 14; Lachs & Pillemer, N Engl J Med 2015; UWorld Step 2 CK)"
    },
    # T18: Advanced pressure ulcers (neglected, necrotic sacral wound)
    {
        "q": "A {age}-year-old {gender} named {name} is bedbound due to severe dementia and resides at home. {pronoun_cap} is brought to the clinic and found to have a large, Stage IV sacral pressure injury that is {ulcer_size} cm in diameter, filled with foul-smelling necrotic tissue, and covered in dried feces. The caregiver, {possessive} {caregiver}, states they apply ointment once a week and didn't notice the wound. The patient has had no professional home health care or nursing visits. What is the most appropriate clinical assessment and action?",
        "options": [
            "Suspect severe caregiver neglect; admit the patient to the hospital for wound debridement, infection management, and safety, and file an immediate report with Adult Protective Services (APS)",
            "Prescribe oral antibiotics and send the patient home with the caregiver, instructing them to clean the wound daily with hydrogen peroxide",
            "Diagnose self-neglect; because a bedbound patient is responsible for repositioning themselves every 2 hours to prevent ulcers",
            "Reassure the caregiver that pressure ulcers are an inevitable biological consequence of bedbound status and no intervention is required",
            "Unilaterally report the patient to law enforcement for failing to comply with standard skin care recommendations"
        ],
        "answer": 0,
        "exp": "An advanced, necrotic Stage IV pressure injury covered in stool in a completely dependent patient represents severe caregiver neglect. While pressure ulcers can occur despite good care, a wound of this severity that is unaddressed and lacks professional medical involvement indicates a failure to provide essential care (repositioning, hygiene, wound management). The patient requires hospitalization for wound care and workup for osteomyelitis/sepsis. A mandatory report to Adult Protective Services (APS) must be filed immediately. (Ref: Hazzard's Ch. 14 & Ch. 82; UWorld Step 2 CK)"
    },
    # T19: Therapeutic drug monitoring (absent drug levels)
    {
        "q": "A {age}-year-old {gender} named {name} with chronic atrial fibrillation is brought to the emergency department with acute decompensated heart failure and rapid ventricular response (heart rate of {heart_rate} bpm). The caregiver, {possessive} {caregiver}, insists they give the patient {possessive} prescribed digoxin ({digoxin_dose} mg daily) every morning. However, a serum digoxin level drawn on admission is undetectable (0.0 ng/mL). Pharmacy records show the last refill was {months} months ago. What is the correct clinical interpretation of these findings?",
        "options": [
            "The undetectable drug level and delayed refills indicate medical neglect via withholding of essential cardiac medication; the clinician must report this to Adult Protective Services (APS)",
            "The patient is a rapid metabolizer of digoxin, and the dose should be increased to 1.0 mg daily to achieve therapeutic levels",
            "The caregiver is displaying passive compliance, and the patient should be discharged home with a pill organizer",
            "Digoxin absorption is completely blocked by normal age-related achlorhydria, explaining the undetectable serum level",
            "The patient has developed antibodies against digoxin that neutralize the drug in the bloodstream, requiring plasma exchange"
        ],
        "answer": 0,
        "exp": "Therapeutic drug monitoring is an objective tool to assess compliance and screen for medical neglect. Undetectable serum drug levels (like digoxin, levothyroxine, or anticonvulsants) combined with pharmacy logs showing a lack of refills over several months provide concrete evidence that the caregiver is withholding critical medications. This constitutes medical neglect and requires a mandatory report to Adult Protective Services (APS) and clinical stabilization. (Ref: Hazzard's Ch. 14; UWorld Step 2 CK)"
    },
    # T20: Unexplained perineal trauma (sexual abuse assessment)
    {
        "q": "A {age}-year-old {gender} named {name} with moderate Alzheimer's disease is brought from an assisted living facility with new-onset pelvic pain and severe dysuria. Physical examination reveals bruising on the inner thighs and fresh lacerations of the labia majora. The patient is distressed, crying, and unable to explain what happened. Which of the following is the most appropriate first-line clinical management?",
        "options": [
            "Perform a gentle medical-forensic exam (if within the forensic time window), address acute physical injuries, ensure the patient is in a safe environment, and immediately notify law enforcement and the state health department/ombudsman",
            "Treat empirically for a urinary tract infection (UTI) with oral ciprofloxacin and return the patient to the facility without further workup",
            "Confront the administrator of the assisted living facility in the lobby and demand they fire the shift nurse immediately",
            "Prescribe an oral benzodiazepine to reduce the patient's distress and recommend a pelvic ultrasound in 3 months",
            "Advise the patient's family to transfer the patient to a different facility immediately to avoid the hassle of an investigation"
        ],
        "answer": 0,
        "exp": "Unexplained perineal bruising and labial lacerations in a cognitively impaired older adult are highly specific red flags for sexual abuse. The primary clinical steps are: (1) address acute medical needs and ensure safety, (2) perform a medical-forensic examination (SANE/rape kit) to collect evidence, (3) notify law enforcement immediately, and (4) report the facility to the state health department and long-term care ombudsman, as institutional settings require administrative investigations. (Ref: Hazzard's Ch. 14; Lachs & Pillemer, N Engl J Med 2015; UWorld Step 2 CK)"
    },

    # ===== MANDATORY REPORTING & CLINICAL MANAGEMENT (T21-T35) =====
    # T21: Reporting threshold (suspicion vs. proof)
    {
        "q": "A {age}-year-old {gender} named {name} is seen in the clinic. You suspect physical abuse because of suspicious back bruises that resemble handprints. The patient denies any abuse, stating, 'I just bumped into things.' The caregiver is cooperative and polite. The clinician is unsure if there is enough evidence to prove abuse. What is the legal standard for reporting in this situation?",
        "options": [
            "The clinician must file a report with Adult Protective Services (APS) immediately, as the legal standard for reporting is a 'reasonable suspicion' of abuse or neglect, not absolute proof",
            "The clinician must conduct a private investigation at the patient's home to gather definitive proof before filing any report",
            "The clinician is legally prohibited from reporting unless the patient explicitly consents or admits to being abused",
            "A report should only be filed if the caregiver confesses to the abuse or if there are eyewitnesses to the physical trauma",
            "The clinician should wait until the next scheduled visit in 6 months to see if new bruises appear before reporting"
        ],
        "answer": 0,
        "exp": "Under mandatory reporting laws in the United States, healthcare professionals are required to report elder abuse, neglect, or exploitation when they have **reasonable suspicion** or **reason to believe** that an older adult is being harmed. **Clinicians do not need to prove that abuse has occurred, nor do they need the patient's consent to file the report.** The agency (Adult Protective Services) is responsible for investigating and establishing proof. Failure to report suspected abuse can lead to civil or criminal penalties for the clinician. (Ref: Hazzard's Ch. 14; First Aid Step 2 CK; UWorld Step 2 CK)"
    },
    # T22: APS role (domestic vs. institutional)
    {
        "q": "A {age}-year-old {gender} named {name} is suspected of being neglected by {possessive} {caregiver} in {possessive} own home. A colleague asks you about the difference in reporting pathways for domestic elder abuse versus abuse occurring in an institutional setting (like a nursing home). Which of the following is the correct distinction?",
        "options": [
            "Domestic abuse is reported to Adult Protective Services (APS), whereas institutional abuse is reported to the Long-Term Care Ombudsman and the state department of health or regulatory agency",
            "All elder abuse, regardless of setting, is reported exclusively to the local police department, and clinicians should never contact civil agencies",
            "Institutional abuse is reported to APS, whereas domestic abuse is handled solely by the local ethics committee",
            "The Long-Term Care Ombudsman investigates domestic abuse cases, while APS only investigates nursing home violations",
            "There is no legal reporting mechanism for institutional settings; only private lawsuits can address nursing home neglect"
        ],
        "answer": 0,
        "exp": "The reporting pathway for elder abuse depends on the setting: (1) **Domestic setting (home)**: Suspected abuse, neglect, or financial exploitation is reported to **Adult Protective Services (APS)**. (2) **Institutional setting (nursing home, assisted living)**: Suspected abuse is reported to the **Long-Term Care Ombudsman** and/or the **state department of health/licensing agency** that regulates long-term care facilities. Both pathways are legally mandated. (Ref: Hazzard's Ch. 14; AGS Geriatrics At Your Fingertips; UWorld Step 2 CK)"
    },
    # T23: Competent patient refusing intervention (domestic)
    {
        "q": "A {age}-year-old {gender} named {name} is evaluated in the clinic. During a private interview, {name} admits that {possessive} adult son frequently hits {objective} and takes {possessive} pension checks. A formal cognitive assessment confirms that {name} has intact decision-making capacity. {name} begs you not to report the son, stating, 'He is all I have, and I don't want him to go to jail. I refuse any help from social services.' What is the most appropriate ethical and legal action for the clinician?",
        "options": [
            "File a mandatory report with Adult Protective Services (APS) as required by state law, document the injuries and conversation meticulously, and work with the patient on a safety and harm-reduction plan",
            "Respect the patient's autonomy and do not file a report, as a competent patient's refusal overrides the physician's mandatory reporting duty",
            "Immediately notify local law enforcement to have the son arrested, bypassing APS and ignoring the patient's statements",
            "Involuntarily admit the patient to a psychiatric facility for 'pathological codependency' to separate {objective} from the son",
            "Confront the son in the waiting room and threaten him with legal action, but do not document the encounter in the medical record"
        ],
        "answer": 0,
        "exp": "In the majority of US states, healthcare professionals are **mandated reporters** for elder abuse and must file a report with Adult Protective Services (APS) upon **reasonable suspicion**, **regardless of the patient's consent or cognitive capacity**. While the patient's autonomy must be respected regarding what services they accept from APS (a competent patient can refuse shelter or legal action), the clinician *must* fulfill their legal obligation to report. The clinician should support the patient, document all findings objectively, and discuss safety planning. (Ref: Hazzard's Ch. 14; UWorld Step 2 CK; First Aid Step 2 CK)"
    },
    # T24: Incapacitated patient refusing protection
    {
        "q": "A {age}-year-old {gender} named {name} with advanced dementia is brought to the hospital with a subdural hematoma and multiple facial bruises. The medical team strongly suspects physical abuse by the primary caregiver. {name} has no designated surrogate decision-maker and lacks decision-making capacity. The caregiver demands to discharge the patient home immediately, and the patient repeats, 'I want to go home.' What is the most appropriate clinical and legal course of action?",
        "options": [
            "Place a temporary medical hold, refuse discharge due to immediate safety concerns, file an urgent report with Adult Protective Services (APS), and initiate a legal process to appoint an emergency temporary guardian",
            "Discharge the patient home with the caregiver immediately to respect the patient's statement of wanting to go home",
            "Allow the discharge but schedule a follow-up home visit by a social worker in 2 weeks to check on the patient",
            "Confront the caregiver aggressively in the hospital hallway and refuse to let them leave without a written confession",
            "Have the patient sign a waiver releasing the hospital from all liability and then allow the caregiver to take the patient home"
        ],
        "answer": 0,
        "exp": "When a patient **lacks decision-making capacity** and there is a strong suspicion of elder abuse or neglect, the clinician **cannot discharge the patient back into the abusive environment**, even if the patient or caregiver demands it. The clinician must: (1) place a temporary medical hold to ensure safety, (2) file an immediate report with APS and law enforcement, and (3) consult social work and legal counsel to initiate the process for an **emergency court-appointed guardian** to make safe discharge decisions. (Ref: Hazzard's Ch. 14 & Ch. 21; UWorld Step 2 CK)"
    },
    # T25: Institutional abuse reporting (Ombudsman role)
    {
        "q": "A {age}-year-old {gender} named {name} is a resident of a skilled nursing facility. During a routine physical examination, you note multiple symmetrical bruises on {possessive} wrists resembling restraint marks. The nursing home administrator refuses to provide the shift log and tells you to 'mind your own business.' Which of the following agencies is specifically charged with advocating for residents' rights and investigating complaints within long-term care facilities?",
        "options": [
            "The Long-Term Care Ombudsman; an independent advocate who investigates complaints and resolves conflicts involving residents of nursing homes and assisted living facilities",
            "Adult Protective Services (APS); which only investigates abuse occurring in private, domestic residences",
            "The Federal Bureau of Investigation (FBI); which manages all institutional investigations involving Medicare funds",
            "The Joint Commission; which conducts routine facility surveys but does not investigate individual resident complaints",
            "The state medical board; which disciplines physicians but has no jurisdiction over nursing homes or administrative staff"
        ],
        "answer": 0,
        "exp": "The **Long-Term Care Ombudsman Program** is a federally mandated program in every state. Ombudsmen are independent advocates who work to protect the health, safety, welfare, and rights of residents in nursing homes, assisted living facilities, and other adult care homes. They investigate individual complaints, advocate for systemic changes, and help resolve conflicts between residents and facility administration. Suspected institutional abuse should be reported to both the Ombudsman and the state health department. (Ref: Hazzard's Ch. 14; Current Diagnosis & Treatment: Geriatrics Ch. 12)"
    },
    # T26: Hospitalization for safety (no safe discharge option)
    {
        "q": "A {age}-year-old {gender} named {name} is brought to the emergency department by a neighbor who suspects neglect. The patient is dehydrated, cachectic, and has an untreated fracture of the wrist that is {months} weeks old. The caregiver is uncooperative, smells of alcohol, and refuses to allow social work to enter the home. The patient's acute medical issues are stabilized in the ED, but there is no other family or safe discharge option. What is the most appropriate next step in management?",
        "options": [
            "Admit the patient to the hospital for safety and further evaluation, file a report with Adult Protective Services (APS), and involve social work to identify a safe discharge environment",
            "Discharge the patient home with a prescription for oral pain medication and instruct the caregiver to follow up with orthopedics",
            "Discharge the patient to a local homeless shelter to ensure they are separated from the caregiver",
            "Notify local law enforcement to hold the patient in protective custody at the local jail until APS can investigate",
            "Perform a closed reduction of the wrist in the ED and discharge the patient to the neighbor's home"
        ],
        "answer": 0,
        "exp": "When an older adult is in **immediate danger** due to severe neglect or abuse, and there is **no safe discharge environment** (e.g., the caregiver is uncooperative, impaired, or hostile, and there are no other family members), the patient **must be admitted to the hospital for safety**. The hospital admission serves as a protective hold while Adult Protective Services (APS) and social workers investigate the home environment and arrange for a safe discharge plan (such as placement in a skilled nursing facility or establishing emergency guardianship). (Ref: Hazzard's Ch. 14; UWorld Step 2 CK)"
    },
    # T27: Private interview technique
    {
        "q": "A {age}-year-old {gender} named {name} presents with a deep laceration on the forehead. The caregiver, {possessive} {caregiver}, is present and states that the patient fell in the bathroom. The clinician suspects elder abuse because of the caregiver's aggressive behavior and the patient's submissive posture. What is the most appropriate method for conducting the clinical interview?",
        "options": [
            "Politely request the caregiver to step out of the room to complete the physical examination, and interview the patient alone using direct, non-judgmental questions about safety and fear at home",
            "Interview the patient and caregiver together to ensure both stories align and to avoid creating a conflict",
            "Confront the caregiver with your suspicion in front of the patient to see if the patient validates the accusation",
            "Ask the caregiver to answer all history questions while the patient is undergoing an X-ray in another department",
            "Skip the interview entirely and rely solely on the physical exam findings to make a diagnosis of elder abuse"
        ],
        "answer": 0,
        "exp": "Interviewing the patient **alone in a private space** is the gold standard clinical technique when elder abuse is suspected. This prevents the caregiver from intimidating the patient or answering on their behalf. The clinician should ask direct, non-judgmental questions (e.g., 'Are you afraid of anyone at home?', 'Has anyone touched you without your consent?', 'Who manages your money?'). Confronting the caregiver in front of the patient is dangerous as it can lead to retaliation against the patient. (Ref: Hazzard's Ch. 14; Lachs & Pillemer, N Engl J Med 2015; UWorld Step 2 CK)"
    },
    # T28: Caregiver burnout intervention (preventative)
    {
        "q": "A {age}-year-old {gender} named {name} with moderate Alzheimer's disease is brought to the clinic by {possessive} {caregiver}. The {caregiver} is weeping and reports being overwhelmed, sleeping only 3 hours a night, and feeling like they 'might snap and hurt the patient.' On examination, {name} is clean, well-nourished, and has no signs of abuse. What is the most appropriate clinical intervention to prevent elder abuse in this high-risk scenario?",
        "options": [
            "Acknowledge the caregiver's distress, refer them to social work to arrange home health aides, adult day care programs, and respite care, and provide resources for caregiver support groups",
            "Immediately file a report with Adult Protective Services (APS) for child-like behavior and demand the caregiver be replaced",
            "Prescribe a high-dose stimulant for the caregiver to help them stay awake and continue providing 24-hour care",
            "Advise the caregiver to place the patient in an unlicenced board-and-care home immediately to save money",
            "Tell the caregiver that caregiver burnout is a normal part of life and they must learn to cope without external resources"
        ],
        "answer": 0,
        "exp": "Caregiver burnout, depression, and substance abuse are the **most significant risk factors** for the development of elder abuse and neglect. In this scenario, there is no evidence of abuse yet, but the risk is extremely high. The clinician should intervene preventatively by validating the caregiver's feelings and arranging supportive services: **social work referral, home health aides, adult day programs (to give the caregiver daytime breaks), and respite care**. This support can reduce stress and prevent the escalation to neglect or abuse. (Ref: Hazzard's Ch. 14; AGS Geriatrics At Your Fingertips; UWorld Step 2 CK)"
    },
    # T29: Self-neglect capacity check (autonomy)
    {
        "q": "A {age}-year-old {gender} named {name} is brought to the clinic by a social worker. {name} has mild cognitive decline but demonstrates intact decision-making capacity on formal evaluation. {possessive_cap} home has been flagged by the city for hoarding, but {name} refuses to allow cleanup crews inside, stating, 'I like my things, and I have the right to live how I want.' How should the clinician manage this case of self-neglect?",
        "options": [
            "Respect the patient's autonomy; since {pronoun} has decision-making capacity, {pronoun} has the legal right to refuse interventions; document the capacity assessment and offer voluntary harm-reduction services",
            "Override the patient's refusal and order an immediate involuntary psychiatric hold to force a home cleanup",
            "Contact law enforcement to have the patient evicted and placed in a locked nursing home facility",
            "Unilaterally assign a financial guardian to seize the patient's assets and pay for home remediation",
            "Inform the patient that because they refuse cleanup, they can no longer receive medical care at the clinic"
        ],
        "answer": 0,
        "exp": "A key ethical and legal tenet in elder care is that **a competent adult has the right to self-determination (autonomy)**, which includes the right to engage in eccentric behavior, hoarding, or refuse medical and social interventions, provided they have **decision-making capacity** and their actions do not harm others. If a capacity assessment confirms the patient understands the risks of their living situation and appreciates the consequences of refusing help, the clinician must respect their decision. The clinician should focus on building trust, offering voluntary harm-reduction strategies, and coordinating with APS for periodic welfare checks. (Ref: Hazzard's Ch. 14 & Ch. 21; UWorld Step 2 CK)"
    },
    # T30: Financial abuse management (revoking POA)
    {
        "q": "A {age}-year-old {gender} named {name} with moderate dementia is accompanied to the clinic by {possessive} {caregiver}. The patient's {relation} reveals that the {caregiver} was recently designated as the financial Durable Power of Attorney (POA) and has since emptied the patient's savings account. The patient is confused and did not understand the document {pronoun} signed. What is the most appropriate action for the clinician to address this financial exploitation?",
        "options": [
            "Document the findings objectively, file a report with Adult Protective Services (APS), advise the {relation} to consult an elder law attorney to challenge the POA's validity, and recommend contacting the bank's fraud division",
            "Confront the caregiver during the visit and demand they return the money to the patient immediately",
            "Unilaterally sign a document revoking the caregiver's Power of Attorney status, as physicians have the power to void legal contracts",
            "Advise the patient to sign a new Power of Attorney naming the clinic physician as the sole financial executor",
            "Prescribe a cholinesterase inhibitor to reverse the patient's dementia so they can legally sue the caregiver"
        ],
        "answer": 0,
        "exp": "When financial exploitation is suspected in a patient with cognitive impairment (such as dementia), the clinician must document the details objectively, file a report with Adult Protective Services (APS), and advise the family to contact an **elder law attorney** to legally challenge the validity of the POA (since a patient with moderate dementia may lack the capacity to execute a legal document). The family should also notify the bank's fraud division. The clinician cannot unilaterally revoke a legal Power of Attorney. (Ref: Hazzard's Ch. 14 & Ch. 21; UWorld Step 2 CK)"
    },
    # T31: Multidisciplinary team management
    {
        "q": "A {age}-year-old {gender} named {name} is admitted to the hospital with multiple bruises, severe malnutrition, and cognitive decline. The medical team suspects elder abuse and neglect. Which of the following best describes the role of a multidisciplinary team in managing this patient's care?",
        "options": [
            "Coordinate care involving the geriatrician, social worker, Adult Protective Services (APS) caseworker, psychiatrist, and legal counsel to ensure the patient's physical health, cognitive status, safety, and legal rights are addressed simultaneously",
            "Rely solely on the primary care physician to investigate the home environment, find new housing, and file legal charges",
            "Exclude the social worker and psychiatrist to prevent breaching the patient's confidentiality during the investigation",
            "Transfer all decision-making authority to the hospital security team to handle the caregiver's visits",
            "Discharge the patient as soon as the bruises fade, leaving the investigation entirely to the patient's neighbors"
        ],
        "answer": 0,
        "exp": "Managing elder abuse requires a **multidisciplinary team approach** because of the complex medical, psychological, social, and legal issues involved. The team typically includes: (1) **Geriatricians/Physicians** to diagnose and treat injuries and assess capacity, (2) **Social Workers** to coordinate resources and discharge planning, (3) **APS Caseworkers** to investigate safety and provide protective services, (4) **Psychiatrists** to evaluate cognitive and psychiatric conditions, and (5) **Legal Counsel** or elder law advocates to address guardianship and financial protection. (Ref: Hazzard's Ch. 14; Current Diagnosis & Treatment: Geriatrics Ch. 12)"
    },
    # T32: Documentation standards
    {
        "q": "A {age}-year-old {gender} named {name} presents to the clinic with injuries highly suspicious for physical abuse. Which of the following represents the most appropriate documentation standard for the clinician in the medical record?",
        "options": [
            "Write detailed, objective descriptions of all injuries, use anatomical diagrams to mark sizes and locations, document the patient's quotes verbatim, and obtain consent to take high-quality photographs of the lesions",
            "Use subjective language such as 'caregiver is definitely guilty' and 'patient is lying' to help the police case",
            "Avoid writing any details about the suspected abuse in the chart to prevent legal exposure for the hospital",
            "Estimate the sizes and locations of the bruises from memory after the patient has been discharged",
            "Write a brief note stating 'bruises present, suspect fall' to keep the record simple and concise"
        ],
        "answer": 0,
        "exp": "Meticulous and objective medical documentation is critical in elder abuse cases because the medical record serves as a legal document in civil or criminal proceedings. Proper documentation includes: (1) **Detailed, objective descriptions** of the size, shape, color, and location of all injuries. (2) **Anatomical body maps/diagrams**. (3) **Verbatim quotes** from the patient and caregiver regarding how the injuries occurred. (4) **High-quality photographs** of the injuries (after obtaining the patient's or surrogate's consent). Subjective or accusatory language should be avoided. (Ref: Hazzard's Ch. 14; Lachs & Pillemer, N Engl J Med 2015)"
    },
    # T33: Restraints usage ethics in dementia
    {
        "q": "A {age}-year-old {gender} named {name} with advanced dementia is admitted to a long-term care facility. The facility staff asks the physician to order bilateral wrist restraints and four side rails up on the bed to prevent the patient from wandering and falling. According to geriatric principles and federal guidelines, what is the most appropriate clinical response?",
        "options": [
            "Refuse the request; physical restraints and four side rails do not reduce falls, increase the risk of serious injury (e.g., strangulation, entrapment), and worsen functional decline; recommend non-pharmacological alternatives",
            "Approve the order immediately, as physical restraints are the gold standard for preventing falls in patients with wandering behavior",
            "Order a continuous infusion of intravenous haloperidol as a safer chemical alternative to physical restraints",
            "Approve the order but instruct the staff to release the restraints only when state inspectors are present in the building",
            "Instruct the family that they must sit by the patient's bed 24 hours a day if they refuse the physical restraints"
        ],
        "answer": 0,
        "exp": "Geriatric clinical guidelines and federal regulations (OBRA 1987) strongly discourage the use of physical restraints (e.g., wrist ties, vest restraints) and four side rails. Studies show that **restraints do not reduce the incidence of falls or injuries**; instead, they increase morbidity and mortality from **strangulation, entrapment, pressure injuries, deconditioning, and agitation**. Sparing side rails and using low-height beds, floor mats, bed alarms, and structured activities are safer, non-pharmacological alternatives. Restraints can only be used under strict medical necessity, never for staff convenience. (Ref: Hazzard's Ch. 14 & Ch. 82; AGS Geriatrics At Your Fingertips)"
    },
    # T34: Reporter immunity (good faith reporting)
    {
        "q": "A {age}-year-old {gender} named {name} is seen in the clinic. The clinician files a report with Adult Protective Services (APS) based on reasonable suspicion of caregiver neglect. The caregiver learns of the report and threatens to sue the clinician for defamation and breach of confidentiality. Which of the following legal protections applies to the clinician in this scenario?",
        "options": [
            "State laws provide civil and criminal immunity to mandated reporters who file elder abuse reports in good faith, protecting them from liability and lawsuits",
            "The clinician has no legal protection and can be sued for damages if the APS investigation fails to prove abuse occurred",
            "The clinician is protected only if they obtain a written waiver from the caregiver prior to filing the report",
            "Clinicians are immune from lawsuits only if they report the abuse anonymously without providing their names",
            "The clinician will be suspended from practice until a court verifies that the abuse actually took place"
        ],
        "answer": 0,
        "exp": "To encourage reporting and protect vulnerable populations, all US states have statutes that grant **civil and criminal immunity to mandated reporters** who file reports of suspected elder abuse, neglect, or exploitation **in good faith**. This immunity protects clinicians from lawsuits alleging defamation, libel, or breach of confidentiality (HIPAA specifically exempts reports required by state law), even if the subsequent APS investigation determines that no abuse occurred. (Ref: Hazzard's Ch. 14; UWorld Step 2 CK)"
    },
    # T35: High-risk characteristics for elder abuse
    {
        "q": "A {age}-year-old {gender} named {name} is seen for a routine wellness visit. Which of the following patient and caregiver characteristic combinations carries the highest statistical risk for the development of elder abuse or neglect?",
        "options": [
            "A patient with advanced dementia and high physical dependence, cared for by a co-residing relative who has active substance abuse, untreated mental illness, or high caregiver stress",
            "A patient with intact cognitive function living independently in a retirement community with daily home health aides",
            "A patient with mild osteoarthritis living with a supportive spouse who attends caregiver support groups",
            "A patient with controlled hypertension who visits adult day care programs three times a week",
            "A patient with diabetes living with an adult daughter who is a professional nurse and has extensive social support"
        ],
        "answer": 0,
        "exp": "The risk of elder abuse is multifactorial, but the **highest risk combination** occurs when: (1) the **patient has severe cognitive impairment (dementia)** and is highly dependent for ADLs, (2) the **caregiver lives with the patient**, and (3) the **caregiver has active substance abuse, untreated mental illness, or severe caregiver burnout**. Social isolation of the household is also a major contributing factor. Identifying these high-risk dyads allows clinicians to implement preventive support (respite care, counseling, home visits). (Ref: Hazzard's Ch. 14; Lachs & Pillemer, N Engl J Med 2015; UWorld Step 2 CK)"
    }
]

# ============================================================
# Generate MCQ Variants to reach 350
# ============================================================
mcqs = []
seen_questions = set()

# We will generate exactly 10 unique variants for each of the 35 templates (35 * 10 = 350)
for t_idx, t in enumerate(templates):
    variants_generated = 0
    attempts = 0
    while variants_generated < 10 and attempts < 100:
        attempts += 1
        
        # Select random demographics
        gp = random.choice(genders_pool)
        gender = gp["gender"]
        name = random.choice(gp["names"])
        pronoun = gp["pronoun"]
        pronoun_cap = gp["pronoun_cap"]
        possessive = gp["possessive"]
        possessive_cap = gp["possessive_cap"]
        objective = gp["objective"]
        
        age = random.choice(ages_pool)
        caregiver = random.choice(caregivers_pool)
        dementia_stage = random.choice(dementia_stages_pool)
        bruise_location = random.choice(bruise_locations_pool)
        bony_prominence = random.choice(bony_prominences_pool)
        
        # Math & variable values for templates
        glucose = random.choice([650, 720, 800, 850, 900])
        months = random.choice([3, 4, 5, 6])
        moca = random.choice([10, 12, 14, 15, 16])
        missed_appts = random.choice([3, 4, 5])
        weight_loss = random.choice([15, 18, 20, 22])
        weight_loss_pct = random.choice([10, 12, 15])
        sodium = random.choice([152, 155, 158, 160])
        bun_cr = "35:1" if sodium % 2 == 0 else "40:1"
        sedative = random.choice(["alprazolam", "lorazepam", "diazepam", "temazepam"])
        ulcer_size = random.choice([6, 7, 8, 9, 10])
        heart_rate = random.choice([115, 120, 130, 140])
        digoxin_dose = random.choice(["0.125", "0.25"])
        relation = random.choice(["daughter", "son", "niece", "nephew", "spouse"])
        
        format_kwargs = {
            "age": age,
            "gender": gender,
            "name": name,
            "pronoun": pronoun,
            "pronoun_cap": pronoun_cap,
            "possessive": possessive,
            "possessive_cap": possessive_cap,
            "objective": objective,
            "caregiver": caregiver,
            "dementia_stage": dementia_stage,
            "bruise_location": bruise_location,
            "bony_prominence": bony_prominence,
            "glucose": glucose,
            "months": months,
            "moca": moca,
            "missed_appts": missed_appts,
            "weight_loss": weight_loss,
            "weight_loss_pct": weight_loss_pct,
            "sodium": sodium,
            "bun_cr": bun_cr,
            "sedative": sedative,
            "ulcer_size": ulcer_size,
            "heart_rate": heart_rate,
            "digoxin_dose": digoxin_dose,
            "relation": relation
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
# Partition and Write to 4 Files (100, 100, 100, 50)
# ============================================================
parts = [
    mcqs[0:100],
    mcqs[100:200],
    mcqs[200:300],
    mcqs[300:350]
]

for part_num, part_mcqs in enumerate(parts, 1):
    out_file = f"c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260521_geri_abuse_mcqs_p{part_num}.sql"
    with open(out_file, "w", encoding="utf-8") as f:
        f.write(f"-- US MD/MBBS (4th Year) clinical case blocks - Geriatrics: Elder abuse — types, red flags, mandatory reporting - Part {part_num} ({(part_num-1)*100+1}-{((part_num-1)*100)+len(part_mcqs)})\n")
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
