# Group 3 Geriatrics Templates
# Covers: Cognitive Disorders, Functional Assessment, Osteoporosis, Sensory Changes

templates_cognitive = [
    # 1. Mild Cognitive Impairment amnestic type
    {
        "title": "Mild Cognitive Impairment Amnestic Type",
        "age_range": (65, 85),
        "scenario": (
            "A {age}-year-old {gender} is brought to the clinic by {possessive} daughter due to concerns about progressive memory loss over the past {duration} months. The patient admits to occasionally forgetting names and misplacing keys, but {pronoun} continues to live independently, manage {possessive} own finances, and perform all basic and instrumental activities of daily living (ADLs/IADLs). MoCA score is 22/30."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the recommended clinical approach?",
                "options": [
                    "Mild Cognitive Impairment (MCI) amnestic type; recommend structured cognitive training, cardiovascular risk factor control, physical exercise, and regular clinical monitoring for progression to dementia",
                    "Early-stage Alzheimer's disease; initiate immediate high-dose donepezil and memantine therapy and recommend a power of attorney",
                    "Normal age-related forgetfulness; reassure the patient and family, and repeat cognitive testing in 5 years",
                    "Vascular dementia; initiate aggressive dual antiplatelet therapy and schedule immediate carotid duplex ultrasound",
                    "Major depressive disorder (pseudodementia); initiate high-dose sertraline and recommend a course of electroconvulsive therapy (ECT)"
                ],
                "answer": 0,
                "exp": "Mild Cognitive Impairment (MCI) is characterized by objective cognitive decline (MoCA < 26) with **preserved functional independence** in daily life (intact ADLs/IADLs). Amnestic MCI primarily affects memory. There are no FDA-approved drugs for MCI; management focuses on lifestyle, vascular risk control, and monitoring for progression to dementia (which occurs at a rate of 10-15% per year)."
            },
            {
                "q": "Which of the following represents the key clinical distinction between Mild Cognitive Impairment (MCI) and true dementia (e.g., Alzheimer's dementia)?",
                "options": [
                    "Preservation of independence in instrumental and basic Activities of Daily Living (ADLs/IADLs)",
                    "The presence of objective cognitive impairment on standardized neuropsychological testing",
                    "The age of the patient at the onset of memory complaints",
                    "The absence of hippocampal atrophy on high-resolution brain MRI",
                    "The presence of severe depressive symptoms and psychomotor slowing"
                ],
                "answer": 0,
                "exp": "The defining clinical distinction is that patients with MCI retain their independence in daily activities (IADLs/ADLs), whereas patients with dementia have cognitive deficits severe enough to interfere significantly with independence in daily life."
            },
            {
                "q": "What is the approximate annual rate of conversion from Mild Cognitive Impairment to clinically diagnosable dementia (e.g., Alzheimer's disease) in community-dwelling older adults?",
                "options": [
                    "10% to 15% per year",
                    "Less than 1% per year",
                    "50% to 60% per year",
                    "100% conversion within the first 6 months",
                    "MCI never converts to dementia; it is a stable, non-progressive state"
                ],
                "answer": 0,
                "exp": "Older adults diagnosed with MCI convert to dementia at a rate of approximately 10% to 15% per year, compared to a conversion rate of 1% to 2% per year for healthy older controls."
            }
        ]
    },
    # 2. MMSE vs MoCA interpretation
    {
        "title": "MMSE vs MoCA in Mild Cognitive Decline",
        "age_range": (65, 80),
        "scenario": (
            "A {age}-year-old {gender} with a high educational background (master's degree in engineering) presents due to subtle difficulty with complex planning and executive tasks over the past year. The physician administers the Mini-Mental State Examination (MMSE), and the patient scores **28/30** (normal). However, the patient's spouse remains highly concerned. The physician decides to perform a Montreal Cognitive Assessment (MoCA)."
        ),
        "questions": [
            {
                "q": "Why is the MoCA preferred over the MMSE in this highly educated patient, and what is the expected outcome?",
                "options": [
                    "The MoCA has significantly higher sensitivity for detecting Mild Cognitive Impairment (MCI) and early executive dysfunction because it includes more challenging tests of executive function and abstract thinking, which helps overcome the 'ceiling effect' of the MMSE in highly educated individuals",
                    "The MMSE is highly sensitive but takes 45 minutes to complete, making the 5-minute MoCA more practical for a busy clinic",
                    "The MoCA is designed exclusively for vascular dementia, while the MMSE is used exclusively for Alzheimer's disease",
                    "The MMSE is outdated and is no longer legally accepted in the clinical evaluation of cognitive decline",
                    "Highly educated patients score lower on the MoCA because it is culturally biased toward manual labor tasks"
                ],
                "answer": 0,
                "exp": "The MMSE is insensitive to mild cognitive impairment (MCI), particularly in highly educated patients, due to a 'ceiling effect' (they can easily compensate and score normally). The MoCA includes more challenging tests of executive function, visuospatial skills, and abstraction, making it highly sensitive (90% vs 18% for MMSE) for detecting early MCI."
            },
            {
                "q": "Which of the following cognitive domains is heavily tested in the MoCA via the clock-drawing, trail-making, and structural cube-copying tests, but is minimally evaluated in the MMSE?",
                "options": [
                    "Visuospatial and Executive function",
                    "Immediate word recall and registration",
                    "Orientation to time and place",
                    "Language fluency and repetition",
                    "Calculation and spelling backward"
                ],
                "answer": 0,
                "exp": "The MoCA includes a 5-point executive/visuospatial subscale (alternating trail making, copy cube, and draw clock), which requires planning, spatial relations, and abstraction. The MMSE lacks complex executive tests, relying more on memory registration, language, and orientation."
            },
            {
                "q": "What is the standard, clinically accepted cutoff score for an abnormal result on the Montreal Cognitive Assessment (MoCA) indicating cognitive impairment?",
                "options": [
                    "A score less than 26/30",
                    "A score less than 20/30",
                    "A score less than 28/30",
                    "A score of exactly 30/30",
                    "MoCA does not use numerical scoring; it is a qualitative assessment"
                ],
                "answer": 0,
                "exp": "A score of 26 or above is considered normal on the MoCA. A score less than 26 indicates cognitive impairment (typically 18-25 suggests MCI, and < 18 suggests dementia). A 1-point correction is added for patients with <= 12 years of formal education."
            }
        ]
    },
    # 3. Delirium superimposed on dementia
    {
        "title": "Delirium Superimposed on Dementia",
        "age_range": (70, 95),
        "scenario": (
            "A {age}-year-old {gender} with a history of moderate Alzheimer's disease dementia is brought to the emergency department by {possessive} nursing home staff due to an acute, severe worsening of behavior. Over the past 24 hours, the patient has become highly agitated, screaming, and refuses to sleep. Baseline mental status is a stable, pleasant forgetfulness. urinalysis shows leukocyte esterase."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what represents the most appropriate immediate clinical action?",
                "options": [
                    "Delirium superimposed on dementia; search for and treat the underlying medical precipitant (e.g., urinary tract infection), implement non-pharmacological reorientation and calming measures, and avoid physical or chemical restraints",
                    "Normal progression of Alzheimer's disease; double the dose of donepezil and memantine and prescribe a long-acting benzodiazepine",
                    "Primary schizophrenia; initiate daily oral haloperidol and schedule a brain CT to rule out a frontal lobe tumor",
                    "Acute vascular stroke; perform emergent thrombolysis (tPA) and schedule immediate carotid endarterectomy",
                    "Depressive episode; initiate sertraline and arrange respite care"
                ],
                "answer": 0,
                "exp": "Patients with pre-existing dementia are at highly elevated risk for developing delirium. A sudden, acute behavioral shift (agitation, fluctuations) represents delirium superimposed on dementia, usually triggered by an infection (UTI, pneumonia), medication side effect, or fecal impaction. The immediate focus is identifying and treating the trigger."
            },
            {
                "q": "Why is the diagnosis of delirium frequently missed in patients who have pre-existing moderate-to-severe dementia?",
                "options": [
                    "Clinicians frequently mistake the acute behavioral changes and cognitive worsening of delirium as a 'normal progression' or 'behavioral flare' of the patient's underlying dementia",
                    "Dementia completely suppresses the physical and vascular signs of systemic infections",
                    "Standard cognitive screening tools like the CAM cannot be performed in patients with dementia",
                    "Delirium does not cause fluctuations in attention in patients who have pre-existing dementia",
                    "Catheterization is illegal in patients with both dementia and delirium"
                ],
                "answer": 0,
                "exp": "The diagnostic difficulty lies in 'diagnostic overshadowing' where clinicians assume the patient's acute confusion or agitation is just a symptom of their dementia, failing to recognize the acute, fluctuating change from baseline that signals an underlying, treatable medical emergency (delirium)."
            },
            {
                "q": "Which of the following is a high-priority, non-pharmacological safety measure to prevent falls and self-injury in a delirious, agitated patient with dementia?",
                "options": [
                    "Assigning a trained bedside observer (sitter) for continuous observation and reorientation, and lowering the bed to the floor",
                    "Applying soft ankle and wrist restraints to prevent the patient from getting out of bed",
                    "Administering a continuous intravenous infusion of midazolam to ensure absolute sedation",
                    "Restricting all visitors to prevent sensory overload and keeping the room completely dark",
                    "Using a high-sided crib bed and locking the patient in their room"
                ],
                "answer": 0,
                "exp": "Using a trained bedside observer (sitter) provides constant visual monitoring and soothing reorientation without the agitation, physical trauma, and delirium-prolonging effects associated with physical or chemical restraints."
            }
        ]
    },
    # 4. Pseudodementia/depression mimicking dementia
    {
        "title": "Pseudodementia: Depression Mimicking Dementia",
        "age_range": (65, 85),
        "scenario": (
            "A {age}-year-old {gender} presents with a {duration}-month history of memory complaints and difficulty concentrating. The patient reports feeling 'worthless' since {possessive} spouse passed away 6 months ago. During cognitive testing, the patient makes little effort, frequently answering 'I don't know' to simple questions, but performs well when encouraged. MoCA score is 20/30, showing global impairment but normal MRI."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what represents the most appropriate management?",
                "options": [
                    "Depressive pseudodementia; initiate an antidepressant (e.g., SSRI like sertraline) or refer for psychotherapy, which will typically resolve both the depressive symptoms and the cognitive impairment",
                    "Early-onset Alzheimer's disease; initiate donepezil immediately and recommend cognitive rehabilitation",
                    "Vascular dementia; initiate aggressive antiplatelet and statin therapy and schedule a carotid duplex",
                    "Malingering; counsel the patient on honesty and discharge them from the clinic without further follow-up",
                    "Normal aging changes; reassure the patient and repeat the MoCA test in 3 years"
                ],
                "answer": 0,
                "exp": "Depressive pseudodementia is a syndrome where major depression in the elderly presents with cognitive impairment mimicking dementia. Key clues include: acute/subacute onset, distress regarding cognitive symptoms, and 'I don't know' responses on testing (poor effort but correctable with encouragement). Treating the depression completely resolves the cognitive decline."
            },
            {
                "q": "Which of the following testing behaviors is highly characteristic of a patient with depressive pseudodementia, helping to differentiate it from true Alzheimer's dementia?",
                "options": [
                    "Frequent 'I don't know' responses with little effort on testing, and severe distress about their memory loss",
                    "Making excuses or using confabulation (making up answers) to hide their cognitive deficits",
                    "Appearing cheerful and unconcerned (la belle indifference) about their severe memory failures",
                    "Performing flawlessly on short-term recall but failing orientation to time and place",
                    "Excellent performance on complex planning tasks with severe language fluency loss"
                ],
                "answer": 0,
                "exp": "Pseudodementia patients are typically highly distressed by their cognitive decline, complaining bitterly about it, and make poor effort on tests (giving 'I don't know' answers). True dementia patients are often unaware of or minimize their deficits (anosognosia) and may try to hide them via confabulation."
            },
            {
                "q": "Which of the following classes of antidepressants should be avoided in older adults with depressive pseudodementia due to high risk of anticholinergic side effects and cardiac toxicity?",
                "options": [
                    "Tricyclic Antidepressants (TCAs like amitriptyline or imipramine)",
                    "Selective Serotonin Reuptake Inhibitors (SSRIs like escitalopram)",
                    "Serotonin-Norepinephrine Reuptake Inhibitors (SNRIs like duloxetine)",
                    "Atypical Antidepressants (like mirtazapine)",
                    "Atypical Antidepressants (like bupropion)"
                ],
                "answer": 0,
                "exp": "TCAs are highly anticholinergic Beers Criteria drugs that cause sedation, orthostatic hypotension, cardiac conduction delays (QT prolongation), dry mouth, urinary retention, and significant falls risk in older adults. SSRIs (sertraline, escitalopram) or SNRIs are preferred."
            }
        ]
    },
    # 5. Reversible causes of cognitive decline
    {
        "title": "Reversible Cognitive Decline: The Hypothyroid State",
        "age_range": (65, 90),
        "scenario": (
            "A {age}-year-old {gender} is brought to the clinic by {possessive} family due to a {duration}-month history of progressive confusion, forgetfulness, and physical slowing. The family also notes the patient has developed severe cold intolerance, dry skin, constipation, and a hoarse voice. MoCA score is 21/30. Labs show a TSH of 45 µU/mL (normal 0.5-5.0)."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what represents the best management?",
                "options": [
                    "Hypothyroidism-induced reversible cognitive decline (myxedema madness); initiate levothyroxine therapy at a low starting dose ('start low and go slow') and monitor TSH levels",
                    "Alzheimer's disease; initiate donepezil immediately and prescribe daily oral prednisone to treat thyroid inflammation",
                    "Primary schizophrenia; initiate daily haloperidol and schedule thyroidectomy",
                    "Normal pressure hydrocephalus; perform a diagnostic lumbar puncture and refer for VP shunt",
                    "Vascular dementia; initiate aggressive antiplatelet therapy and statins, and avoid all thyroid hormone supplements"
                ],
                "answer": 0,
                "exp": "Hypothyroidism is a classic, highly treatable, and reversible cause of cognitive impairment in the elderly (often presenting as psychomotor slowing, forgetfulness, and 'myxedema madness'). Management involves levothyroxine replacement. In the elderly, dosing must start low (e.g., 25 mcg/day) to prevent triggering myocardial ischemia or arrhythmias."
            },
            {
                "q": "Why must levothyroxine replacement therapy be initiated at a low starting dose ('start low and go slow') in older adults, particularly those with suspected underlying coronary artery disease?",
                "options": [
                    "Rapid thyroid hormone replacement increases myocardial oxygen demand, which can precipitate angina, myocardial infarction, or tachyarrhythmias (such as atrial fibrillation)",
                    "High doses of levothyroxine cause rapid, irreversible acute renal failure and bone marrow suppression",
                    "Levothyroxine is highly toxic to the gastric mucosa, causing bleeding ulcers at high doses",
                    "Older adults have upregulated renal clearance of levothyroxine, making high starting doses completely inactive",
                    "Levothyroxine directly blocks the blood-brain barrier, causing acute cerebral edema"
                ],
                "answer": 0,
                "exp": "Levothyroxine increases the metabolic rate and myocardial oxygen consumption. In older adults with potential silent coronary artery disease, a rapid increase in thyroid hormone can trigger myocardial ischemia (angina, MI) or atrial fibrillation. The standard starting dose is 12.5 to 25 mcg daily."
            },
            {
                "q": "Which of the following is a standard part of the routine laboratory workup recommended by the American Academy of Neurology to rule out reversible causes of cognitive decline in a patient presenting with new-onset dementia?",
                "options": [
                    "Serum Vitamin B12 level and Thyroid Function Tests (TSH)",
                    "Serum copper and ceruloplasmin levels",
                    "Heavy metal screening (lead, arsenic) and urine drug screen",
                    "Cerebrospinal fluid PCR for herpes simplex virus",
                    "Genetic screening for the ApoE4 allele"
                ],
                "answer": 0,
                "exp": "To rule out highly treatable, reversible causes of cognitive decline, all guidelines recommend checking serum Vitamin B12 levels and thyroid-stimulating hormone (TSH) as part of the initial screening for dementia."
            }
        ]
    },
    # 6. Capacity and competency assessment
    {
        "title": "Assessing Decision-Making Capacity",
        "age_range": (70, 95),
        "scenario": (
            "A {age}-year-old {gender} with mild-to-moderate Alzheimer's disease is admitted for a symptomatic inguinal hernia. The surgeon recommends elective repair. During the consent process, the patient appears confused, states {pronoun} 'doesn't want any cutting,' and cannot explain why the surgery is needed or the risks of refusing it. The surgeon asks the geriatrician to assess the patient's decision-making capacity."
        ),
        "questions": [
            {
                "q": "What represents the correct clinical approach to assessing decision-making capacity in this patient?",
                "options": [
                    "Capacity is determined by a clinician for a specific medical decision, based on 4 components: understanding, appreciation, reasoning, and expressing a choice; if capacity is lacking, consult the patient's surrogate decision-maker",
                    "Capacity is a legal status that can only be determined by a court judge; consult the hospital legal team to declare the patient incompetent",
                    "The patient's diagnosis of Alzheimer's disease automatically invalidates all capacity; proceed with the surgery immediately under emergency guidelines",
                    "Perform a MMSE; a score less than 24/30 automatically confirms the patient has capacity for all decisions",
                    "The patient has capacity because {pronoun} was able to state a clear choice ('no cutting'); respect the refusal without further assessment"
                ],
                "answer": 0,
                "exp": "Decision-making capacity is decision-specific, time-specific, and determined by a physician. It is not a permanent legal label (which is 'competency,' determined by a court). The assessment evaluates: (1) understanding the facts, (2) appreciating the significance to their situation, (3) reasoning through the options, and (4) expressing a consistent choice."
            },
            {
                "q": "Which of the following describes the 'Appreciation' component in the assessment of medical decision-making capacity?",
                "options": [
                    "The patient's ability to apply the medical information to their own clinical situation, recognizing that they have the disease and understanding the potential outcomes of treatment vs non-treatment",
                    "The patient's ability to repeat the technical medical risks of a procedure exactly as explained by the surgeon",
                    "The patient's expression of gratitude toward the clinical team for their care",
                    "The patient's ability to logically compare the side effect profiles of multiple different medications",
                    "The patient's legal designation of a durable power of attorney for healthcare"
                ],
                "answer": 0,
                "exp": "Appreciation requires the patient to believe the diagnosis applies to them and understand the real-world consequences of their choices. A patient who understands the surgery conceptually but denies having a hernia lacks 'appreciation' and thus lacks capacity."
            },
            {
                "q": "If a physician determines that a patient lacks decision-making capacity for a high-risk surgical consent, who is the legally appropriate individual to make the medical decision?",
                "options": [
                    "The legally designated surrogate decision-maker (Durable Power of Attorney for Healthcare) or next-of-kin based on the state's surrogate hierarchy",
                    "The attending surgeon, who can override the patient's refusal based on beneficence",
                    "The patient's primary care physician, who has known the patient the longest",
                    "The nurse manager of the surgical ward",
                    "A hospital-appointed ethical committee consisting of at least three administrators"
                ],
                "answer": 0,
                "exp": "When a patient lacks decision-making capacity, consent must be obtained from their legally designated surrogate (DPOAH). If no DPOAH is appointed, the clinician must consult the next-of-kin surrogate based on the state's legal hierarchy (spouse, adult children, parents, siblings)."
            }
        ]
    },
    # 7. Driving safety evaluation
    {
        "title": "Driving Safety and Cognitive Decline",
        "age_range": (65, 85),
        "scenario": (
            "A {age}-year-old {gender} with early-stage Alzheimer's disease is evaluated in the clinic. The spouse reports that the patient has recently gotten lost while driving home from the local grocery store, and has narrow scrapes at intersections. The patient insists {pronoun} is a 'perfectly safe driver' and refuses to stop driving. MoCA score is 20/30."
        ),
        "questions": [
            {
                "q": "What is the most appropriate clinical approach to evaluating and managing driving safety in this patient?",
                "options": [
                    "Perform cognitive/visual-spatial screenings, counsel the patient and family on driving cessation, recommend a formal on-road driving evaluation by a specialist, and check state laws regarding physician reporting requirements",
                    "Immediately notify the police department to confiscate the patient's license, and prescribe donepezil to improve driving skills",
                    "Reassure the spouse that getting lost is a normal part of aging and has no bearing on driving safety; continue driving with a GPS",
                    "Prescribe low-dose oral haloperidol nightly to reduce the patient's driving anxiety and continue driving",
                    "Advise the patient to drive only during severe rainstorms when traffic is slower and safer"
                ],
                "answer": 0,
                "exp": "Driving is a complex task. Getting lost, having near-misses, and cognitive decline indicate high risk. The clinician should screen (visuospatial/MoCA), discuss alternatives, recommend a formal driving rehabilitation specialist (OT) evaluation, and comply with state-specific mandatory or voluntary reporting laws."
            },
            {
                "q": "Which of the following bedside cognitive tests is highly predictive of driving impairment in older adults, as it specifically evaluates visual-spatial attention, scanning, and executive set-shifting?",
                "options": [
                    "Trail Making Test Part B",
                    "Spelling 'WORLD' backward",
                    "Three-word recall after 5 minutes",
                    "Repeating a complex tongue-twister sentence",
                    "Naming as many animals as possible in 60 seconds (category fluency)"
                ],
                "answer": 0,
                "exp": "The Trail Making Test Part B (connecting numbers and letters alternately: 1-A-2-B) is a sensitive predictor of driving safety, as it evaluates executive function, visual search, and mental flexibility—skills critical for navigating traffic and intersections."
            },
            {
                "q": "What is the primary ethical conflict a physician faces when managing an older patient with dementia who refuses to cease driving despite clear evidence of impairment?",
                "options": [
                    "Balancing patient autonomy and confidentiality against the public safety and the duty to protect the patient and others from harm",
                    "Balancing the financial cost of driving rehabilitation against the cost of public transit",
                    "Choosing between different types of medication to treat the patient's driving anxiety",
                    "Deciding whether to report the patient to the insurance company to raise their premiums",
                    "There is no ethical conflict; the patient's autonomy is absolute and must never be restricted"
                ],
                "answer": 0,
                "exp": "The ethical dilemma is the conflict between autonomy/confidentiality (respecting the patient's independence and privacy) and non-maleficence/beneficence (preventing a motor vehicle crash that could kill the patient or innocent pedestrians)."
            }
        ]
    },
    # 8. Caregiver burden assessment
    {
        "title": "The Overwhelmed Spouse: Zarit Burden Interview",
        "age_range": (70, 95),
        "scenario": (
            "A {age}-year-old {gender} with severe Alzheimer's disease is brought to the clinic by {possessive} spouse. The spouse appears exhausted, tearful, and admits to feeling completely overwhelmed. The spouse has stopped attending their own medical visits. The clinician administers the **Zarit Burden Interview (ZBI)** to the spouse, who scores **58**."
        ),
        "questions": [
            {
                "q": "What is the correct clinical interpretation of this ZBI score, and what represents the most appropriate next step in care?",
                "options": [
                    "A ZBI score >= 21 indicates significant caregiver burden (score 58 = severe burden); refer to a social worker, recommend support groups, arrange respite care services, and screen the caregiver for depression/burnout",
                    "A ZBI score in this range is normal for elderly spouses; reassure the caregiver that no interventions are needed",
                    "The ZBI evaluates only the patient's cognitive decline; repeat the patient's MoCA immediately",
                    "A ZBI score of 58 mandates immediate involuntary psychiatric hospitalization of the caregiver for exhaustion",
                    "Advise the caregiver that their only legal option is to continue providing full-time home care without support"
                ],
                "answer": 0,
                "exp": "The Zarit Burden Interview (ZBI) is a validated tool to quantify caregiver burden. A score >= 21 indicates significant burden, and 40-80 indicates severe burden. Caregiver burnout is a major predictor of institutionalization of the patient. Management involves social work referral, support groups (Alzheimer's Association), respite care, and caregiver depression screening (PHQ-9)."
            },
            {
                "q": "Which of the following represents the primary clinical consequence of unrecognized, severe caregiver burden in the management of a patient with dementia?",
                "options": [
                    "Premature nursing home placement of the patient, and a high risk of depression, illness, and mortality in the caregiver",
                    "Rapid progression of the patient's temporal lobe atrophy driven by caregiver stress",
                    "Immediate legal prosecution of the family for secondary elder neglect",
                    "Decreased intestinal absorption of the patient's cholinesterase inhibitors",
                    "Severe hypertrophic cardiomyopathy in the patient due to emotional distress"
                ],
                "answer": 0,
                "exp": "Caregiver burnout is the strongest predictor of premature institutionalization (nursing home placement) of the dementia patient. Caregivers also have a 63% higher mortality rate compared to non-caregiver peers due to chronic stress and self-neglect."
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
    # 9. Non-pharmacologic behavioral interventions
    {
        "title": "Managing Agitation in Moderate Dementia",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with moderate Alzheimer's disease dementia resides in an assisted living facility. The staff reports that the patient has become increasingly agitated, pacing the hallways, and screaming at other residents. The patient does not pose an immediate danger, but {possessive} behavior is highly disruptive. The facility director asks for a management plan."
        ),
        "questions": [
            {
                "q": "What represents the most appropriate first-line clinical approach to managing this patient's agitation?",
                "options": [
                    "Implement a comprehensive non-pharmacological behavioral plan (e.g., music therapy, validating feelings rather than correcting, structured daily routines, and identifying environmental triggers like noise or pain)",
                    "Initiate low-dose daily haloperidol (0.5 mg) immediately to suppress the screaming",
                    "Initiate nightly lorazepam (1 mg) to promote sedation and prevent pacing",
                    "Apply a soft waist restraint to keep the patient seated in their room during active hours",
                    "Instruct the staff to lock the patient in their room and ignore the screaming to avoid reinforcing the behavior"
                ],
                "answer": 0,
                "exp": "Non-pharmacological interventions are first-line for behavioral and psychological symptoms of dementia (BPSD). Agitation is often a form of communication (expressing pain, fear, or sensory overload). Management involves structured routines, validation therapy, music/recreational therapy, and identifying triggers. Antipsychotics are reserved for severe, dangerous behaviors."
            },
            {
                "q": "When communicating with an agitated, cognitively impaired patient who is expressing a delusional belief (e.g., insisting they must 'go home to cook for their mother' who passed away years ago), which of the following represents the most effective validation therapy technique?",
                "options": [
                    "Acknowledge the patient's feelings and redirect their attention (e.g., 'You must really love your mother's cooking. Tell me about her favorite recipes,' and then invite them to a facility snack)",
                    "Confront the delusion directly with reality (e.g., 'Your mother passed away 20 years ago, and you live in a nursing home now')",
                    "Agree with the delusion and arrange immediate transportation to their childhood home",
                    "Ignore the comment completely and walk away to prevent reinforcing the behavior",
                    "Administer an immediate intramuscular injection of haloperidol for active psychosis"
                ],
                "answer": 0,
                "exp": "Validation therapy focuses on the emotional truth of the patient's belief rather than the factual reality. Confronting the patient causes distress, confusion, and catastrophic reactions. Validating their feelings (love for mother) and gently redirecting them is highly effective and comforting."
            },
            {
                "q": "Which of the following physical triggers must always be ruled out first when an older adult with advanced dementia develops a sudden onset of agitation or behavioral changes?",
                "options": [
                    "Pain, urinary retention, or fecal impaction",
                    "Subclinical hypercalcemia or elevated cholesterol",
                    "Normal age-related hair loss or dry skin",
                    "Genetic mutations in the amyloid precursor protein",
                    "Mild age-related macular degeneration"
                ],
                "answer": 0,
                "exp": "Elders with advanced dementia often cannot communicate physical discomfort. A sudden spike in agitation is frequently triggered by a treatable physical issue: unrecognized pain (e.g., osteoarthritis, toothache), acute urinary retention, fecal impaction, or a localized infection."
            }
        ]
    },
    # 10. Advance care planning for cognitive decline
    {
        "title": "Early Advance Care Planning in Cognitive Decline",
        "age_range": (65, 80),
        "scenario": (
            "A {age}-year-old {gender} is diagnosed with very early-stage amnestic Mild Cognitive Impairment, with a MoCA score of 24/30. The patient has full decision-making capacity today, but {possessive} family is highly concerned about the future. The physician initiates a formal discussion regarding advance care planning."
        ),
        "questions": [
            {
                "q": "What is the primary goal and timing recommendation for advance care planning in a patient with early cognitive decline?",
                "options": [
                    "Initiate discussions immediately while the patient retains decision-making capacity; document goals of care, complete a Durable Power of Attorney for Healthcare (DPOAH), and establish preferences for future interventions",
                    "Delay all discussions until the patient has progressed to severe dementia and can no longer understand the choices, to prevent unnecessary anxiety",
                    "Draft a legal contract that transfers all of the patient's financial assets to the state to cover future nursing home care",
                    "Focus exclusively on completing a POLST form indicating a strict Do Not Resuscitate (DNR) status, regardless of the patient's preferences",
                    "There are no recommendations; advance care planning is not indicated in patients with cognitive decline"
                ],
                "answer": 0,
                "exp": "Advance care planning should occur as early as possible in cognitive decline, while the patient still has full capacity to express their values and nominate a DPOAH. Once cognitive decline is severe, the patient can no longer legally execute these documents, forcing the family to make difficult, stressful guesses."
            },
            {
                "q": "Which of the following legal documents designates a specific individual to make medical decisions on behalf of the patient if they lose decision-making capacity in the future?",
                "options": [
                    "Durable Power of Attorney for Healthcare (DPOAH) or Healthcare Proxy",
                    "Living Will",
                    "POLST (Physician Orders for Life-Sustaining Treatment) form",
                    "Last Will and Testament",
                    "HIPAA Authorization Form"
                ],
                "answer": 0,
                "exp": "A DPOAH (Healthcare Proxy) designates a surrogate decision-maker. A Living Will documents the patient's specific preferences for end-of-life treatments (e.g., mechanical ventilation, feeding tubes) but does not appoint a person. Appointing a surrogate is the most flexible and robust advance planning step."
            },
            {
                "q": "What represents the legal concept of a 'Substituted Judgment' standard, which a surrogate decision-maker is ethically and legally bound to use when making medical decisions for an incapacitated patient?",
                "options": [
                    "Making the decision the patient would have made for themselves, based on their known values, written directives, and prior conversations",
                    "Making the decision the surrogate believes is the absolute 'best interest' of the patient, regardless of what the patient wanted",
                    "Deferring all decisions entirely to the attending physician's clinical judgment",
                    "Choosing the least expensive treatment option available to conserve family resources",
                    "Making the decision that maximizes the patient's survival time, regardless of suffering"
                ],
                "answer": 0,
                "exp": "The substituted judgment standard requires the surrogate to stand in the patient's shoes and make the decision the patient would make if they were temporarily lucid. The 'best interest' standard is used only when the patient's own values and preferences are completely unknown."
            }
        ]
    }
]

templates_functional = [
    # 1. ADL assessment with Katz Index
    {
        "title": "Activities of Daily Living (ADLs) and the Katz Index",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with moderate osteoarthritis and mild cognitive decline is evaluated during a functional assessment. The physician uses the **Katz Index of Independence in Activities of Daily Living** to evaluate the patient's functional status. The spouse reports the patient can feed and dress {self_pronoun} but requires assistance with bathing, toileting, and transferring from chair to bed."
        ),
        "questions": [
            {
                "q": "Which of the following represents the six basic Activities of Daily Living (ADLs) evaluated in the Katz Index, and what is the clinical significance of a low score?",
                "options": [
                    "Bathing, dressing, toileting, transferring, continence, and feeding; a low score indicates dependency, predicts mortality and hospitalization, and helps determine the level of nursing care needed",
                    "Cooking, cleaning, driving, managing finances, using the telephone, and managing medications; a low score indicates mild memory decline",
                    "Walking 100 meters, climbing stairs, lifting 10 lbs, reading small print, hearing whispers, and writing legibly",
                    "Fasting glucose, creatinine clearance, heart rate variability, lung capacity, bone density, and grip strength",
                    "None of the options; the Katz Index evaluates only the patient's cognitive scores"
                ],
                "answer": 0,
                "exp": "The Katz Index evaluates six basic ADLs: bathing, dressing, toileting, transferring, continence, and feeding ('DEATHS' mnemonic: Dressing, Eating, Ambulating, Toileting, Hygiene, Swallowing/eating). Basic ADLs are fundamental self-care tasks. Loss of these indicates significant dependency, requiring personal care aides or nursing home placement."
            },
            {
                "q": "Which of the following represents the main mnemonic used by clinicians to easily recall the six basic Activities of Daily Living (ADLs)?",
                "options": [
                    "DEATH (Dressing, Eating, Ambulating, Toileting, Hygiene/bathing, and transferring/continence)",
                    "SHAFT (Shopping, Housekeeping, Accounting/finances, Food preparation, and Transportation)",
                    "DUMBELS (Diarrhea, Urination, Miosis, Bradycardia, Emesis, Lacrimation, Salivation)",
                    "FAST (Face, Arms, Speech, Time)",
                    "HELP (Hydration, Early mobility, Light exposure, Pain control)"
                ],
                "answer": 0,
                "exp": "The mnemonic 'DEATH' (or 'DEATHS') is widely used to recall basic ADLs: **D**ressing, **E**ating (feeding), **A**mbulating (transferring), **T**oileting, and **H**ygiene (bathing), along with **S**phincter control (continence)."
            },
            {
                "q": "What is the primary difference between a basic Activity of Daily Living (ADL) and an Instrumental Activity of Daily Living (IADL) in terms of complexity and functional independence?",
                "options": [
                    "Basic ADLs are fundamental physical self-care tasks required for survival, while IADLs are more complex tasks required for independent community living",
                    "Basic ADLs are evaluated only by neurologists, while IADLs are evaluated only by surgeons",
                    "Basic ADLs are lost late in dementia, while IADLs are lost only in acute delirium",
                    "There is no difference; the two terms are identical and interchangeable",
                    "Basic ADLs require high cognitive function, while IADLs require only simple reflexes"
                ],
                "answer": 0,
                "exp": "Basic ADLs are simple, essential self-care skills (bathing, dressing, eating). IADLs are more complex, cognitively demanding tasks required to live independently in a community (managing money, shopping, cooking, telephone use, driving, medications). IADLs are typically lost first in early dementia."
            }
        ]
    },
    # 2. IADL assessment with Lawton Scale
    {
        "title": "Instrumental Activities of Daily Living (IADLs) and the Lawton Scale",
        "age_range": (65, 90),
        "scenario": (
            "A {age}-year-old {gender} is evaluated. The physician administers the **Lawton Instrumental Activities of Daily Living (IADL) Scale**. The patient's child reports that the patient can no longer prepare meals, manage {possessive} 8 daily medications, buy groceries independently, or handle the monthly utility bills, although the patient can still bathe and feed {self_pronoun} easily."
        ),
        "questions": [
            {
                "q": "Which of the following represents the eight domains evaluated in the Lawton IADL Scale, and what is the primary clinical utility of this scale?",
                "options": [
                    "Ability to use telephone, shopping, food preparation, housekeeping, laundry, mode of transportation, responsibility for own medications, and ability to handle finances; used to assess a patient's capacity for independent community living",
                    "Bathing, dressing, toileting, transferring, continence, feeding, walking, and cognitive scores; used to predict immediate mortality",
                    "Grip strength, gait speed, TUG test, balance, vision, hearing, memory, and bowel habits; used to evaluate frailty syndrome",
                    "Systolic pressure, diastolic pressure, GFR, albumin, thyroid, hemoglobin, glucose, and heart rate; used to dose renal medications",
                    "None of the options; the Lawton Scale is used exclusively to evaluate surgical anesthesia risk"
                ],
                "answer": 0,
                "exp": "The Lawton IADL Scale evaluates 8 complex tasks: using the telephone, shopping, food prep, housekeeping, laundry, transportation, managing medications, and handling finances ('SHAFT' mnemonic handles the core). Decline in IADLs is a highly sensitive indicator of early cognitive decline (MCI or early dementia) or physical frailty, indicating that the patient requires social support or assisted living."
            },
            {
                "q": "Which of the following represents the primary mnemonic used by clinicians to easily recall the core Instrumental Activities of Daily Living (IADLs) evaluated in the Lawton Scale?",
                "options": [
                    "SHAFT (Shopping, Housekeeping, Accounting/finances, Food prep, and Transportation/telephone/meds)",
                    "DEATH (Dressing, Eating, Ambulating, Toileting, Hygiene)",
                    "DUMBELS (Diarrhea, Urination, Miosis, Bradycardia, Emesis, Lacrimation, Salivation)",
                    "CAM (Confusion Assessment Method)",
                    "ABCDE (Airway, Breathing, Circulation, Disability, Exposure)"
                ],
                "answer": 0,
                "exp": "The mnemonic 'SHAFT' is widely used to recall the core IADLs: **S**hopping, **H**ousekeeping, **A**ccounting (finances), **F**ood preparation, and **T**ransportation (along with **T**elephone use and managing medications)."
            },
            {
                "q": "An older adult is found to have a decline in their ability to manage their medications (forgetting doses, double-dosing). Which of the following is the most appropriate and safe clinical intervention to address this IADL deficit?",
                "options": [
                    "Perform a formal medication reconciliation, simplify the regimen to once-daily dosing if possible, and implement a pre-filled pill organizer (PillPack or blister packs) managed by a family member or visiting nurse",
                    "Instruct the patient to continue managing their pills but write down every dose in a detailed journal",
                    "Taper and discontinue all of the patient's medications to avoid the risk of accidental overdose",
                    "Place the patient in an acute inpatient psychiatric ward for medication compliance training",
                    "Advise the patient to memorize the shapes and colors of their pills to avoid confusion"
                ],
                "answer": 0,
                "exp": "Medication mismanagement is a common, high-risk IADL deficit. Simplification (reducing dosing frequency) and utilizing pill organizers, blister packs, or family/nurse supervision are highly effective in ensuring compliance and preventing toxic double-dosing."
            }
        ]
    },
    # 3. Gait speed as vital sign
    {
        "title": "Gait Speed: The Sixth Vital Sign",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} is evaluated during a routine clinic visit. As part of a functional screening, the physician measures the patient's **gait speed** over a 4-meter course. The patient walks at {possessive} normal, comfortable pace. The test is completed in 6.2 seconds, resulting in a calculated gait speed of **0.65 m/s**."
        ),
        "questions": [
            {
                "q": "What is the correct clinical interpretation of this gait speed result, and why is gait speed referred to as the 'sixth vital sign' in geriatrics?",
                "options": [
                    "The gait speed is abnormal (< 0.8 m/s indicates high risk of falls, functional decline, and mortality); gait speed is a powerful, integrated marker of multi-system physiological reserve and a strong predictor of clinical outcomes",
                    "The gait speed is normal (normal range is 0.5 to 0.7 m/s); reassure the patient and repeat the test in 5 years",
                    "The result indicates severe cerebellar tract necrosis; perform an emergent pelvic CT scan",
                    "Gait speed of this level is high-performing; recommend the patient train for a local marathon",
                    "Gait speed cannot be clinically evaluated and has no diagnostic value in older adults"
                ],
                "answer": 0,
                "exp": "Gait speed is a 'vital sign' because it integrates multiple systems: nervous, musculoskeletal, and cardiovascular. A normal walking speed is >= 1.0 m/s. A speed < 0.8 m/s is highly suggestive of frailty, high falls risk, and predicts functional decline, hospitalization, institutionalization, and all-cause mortality."
            },
            {
                "q": "What represents the standard cut-off gait speed value below which an older adult is considered at high risk for future falls and functional decline?",
                "options": [
                    "Less than 0.8 m/s (or less than 1.0 m/s for general subclinical frailty)",
                    "Less than 0.3 m/s only",
                    "Less than 1.5 m/s",
                    "A speed of exactly 1.2 m/s",
                    "Gait speed is not measured in meters per second"
                ],
                "answer": 0,
                "exp": "A gait speed < 0.8 m/s (approx. 2.9 km/h) is the widely accepted cutoff for identifying high-risk community-dwelling older adults who require a comprehensive geriatric assessment and falls prevention interventions."
            },
            {
                "q": "Which of the following physical therapy interventions is most effective and evidence-based to improve gait speed and functional mobility in a frail older adult with a slow walking speed?",
                "options": [
                    "Progressive resistance training (strength training) combined with balance and gait exercises",
                    "Strict bed rest and avoiding all walking to prevent joint wear",
                    "Passive stretching of the lower extremities twice daily by a caregiver",
                    "High-dose systemic corticosteroid therapy to build muscle mass",
                    "Using a wheelchair as the primary mode of mobilization to prevent fatigue"
                ],
                "answer": 0,
                "exp": "Progressive resistance training (PRT) combined with balance (e.g., Tai Chi, single-leg stance) and gait training is the most effective intervention. PRT stimulates muscle hypertrophy, increases power, and directly translates to improved walking speed and stability."
            }
        ]
    },
    # 4. TUG test for fall risk
    {
        "title": "Timed Up and Go (TUG) Test",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with a history of mild knee osteoarthritis presents for an annual wellness visit. The physician performs the **Timed Up and Go (TUG)** test. The patient stands up from a chair, walks 3 meters, turns, walks back, and sits down. The test takes **15 seconds** to complete. The patient has had no falls in the past year."
        ),
        "questions": [
            {
                "q": "What is the correct clinical interpretation of this TUG test result, and what is the recommended next step?",
                "options": [
                    "The TUG test result is abnormal (TUG >= 12 seconds indicates high fall risk); perform a comprehensive falls risk assessment (evaluating medications, orthostatic vitals, vision, joints, and home safety)",
                    "The TUG test result is completely normal (TUG < 20 seconds is normal); reassure the patient and repeat the test in 3 years",
                    "The TUG test is non-diagnostic; immediately perform an abdominal MRI to rule out spinal cord compression",
                    "The result indicates severe locomotor apraxia; obtain an emergent non-contrast brain CT scan",
                    "Immediately prescribe daily alendronate and initiate a high-dose Vitamin D regimen without further workup"
                ],
                "answer": 0,
                "exp": "The TUG test evaluates basic mobility, balance, and strength. A completion time of >= 12 seconds (some guidelines use >= 13.5 or 14 seconds) is abnormal and indicates a high risk for future falls. An abnormal TUG test in any community-dwelling older adult should trigger a comprehensive, multifactorial falls risk assessment."
            },
            {
                "q": "What is the standard distance the patient must walk during the Timed Up and Go (TUG) test?",
                "options": [
                    "3 meters (approximately 10 feet)",
                    "10 meters (approximately 33 feet)",
                    "5 meters (approximately 16 feet)",
                    "Exactly 1 meter",
                    "The distance is determined by the patient's height"
                ],
                "answer": 0,
                "exp": "The standard TUG test distance is 3 meters (10 feet) from the chair. The patient is instructed to walk at their normal, safe, comfortable pace, turn around a marker, return, and sit back down in the same chair."
            },
            {
                "q": "Which of the following joint diseases is the most common cause of a slow TUG test and impaired physical mobility in community-dwelling older adults?",
                "options": [
                    "Osteoarthritis",
                    "Rheumatoid arthritis",
                    "Gouty arthritis",
                    "Systemic lupus erythematosus",
                    "Ankylosing spondylitis"
                ],
                "answer": 0,
                "exp": "Osteoarthritis (particularly of the knees and hips) is the most common joint pathology in the elderly, causing pain, mechanical stiffness, and muscle weakness, directly leading to slow walking speeds, balance deficits, and elevated TUG times."
            }
        ]
    },
    # 5. Comprehensive Geriatric Assessment (CGA)
    {
        "title": "Comprehensive Geriatric Assessment (CGA)",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with multiple chronic conditions (hypertension, osteoarthritis, mild dementia) and a history of recurrent falls is referred for a **Comprehensive Geriatric Assessment (CGA)**. The geriatrician coordinates a multi-disciplinary team evaluation, spanning medical, functional, cognitive, and social domains."
        ),
        "questions": [
            {
                "q": "Which of the following best describes the Comprehensive Geriatric Assessment (CGA), and what represents its primary clinical benefit?",
                "options": [
                    "A multi-disciplinary, multidimensional diagnostic process to determine an older adult's medical, functional, cognitive, and social capabilities and develop an integrated plan for treatment and follow-up; it significantly improves survival, functional status, and reduces hospitalization",
                    "A rapid 5-minute cognitive screen designed to replace the MMSE in the emergency department",
                    "A specialized physical exam focused exclusively on identifying joint deformities and surgical indications",
                    "A billing audit used by hospital administrators to evaluate Medicare reimbursement rates",
                    "A genetic screening protocol designed to identify family markers of Alzheimer's disease"
                ],
                "answer": 0,
                "exp": "A CGA is the cornerstone of geriatric medicine. It is a highly structured, multidimensional, multi-disciplinary process (geriatrician, nurse, social worker, PT/OT, pharmacist) that evaluates medical issues, functional status (ADLs/IADLs), cognition/mood, and social support. Evidence shows that patients undergoing CGA have better functional independence, lower rates of nursing home placement, and improved survival."
            },
            {
                "q": "Which of the following professional disciplines is a key member of the interdisciplinary team performing a Comprehensive Geriatric Assessment (CGA), responsible for evaluating home safety, adaptive equipment, and upper-extremity functional tasks?",
                "options": [
                    "Occupational Therapist (OT)",
                    "Speech-Language Pathologist (SLP)",
                    "Surgical Technician",
                    "Chiropractor",
                    "Clinical Psychologist alone"
                ],
                "answer": 0,
                "exp": "Occupational Therapists (OTs) are critical members of the CGA team. They focus on functional performance, ADL independence, cognitive task adaptation, and conducting home safety evaluations to recommend environmental modifications."
            },
            {
                "q": "What is the primary difference between a standard disease-focused medical evaluation and a Comprehensive Geriatric Assessment (CGA)?",
                "options": [
                    "CGA prioritizes functional independence, quality of life, and multi-system optimization over disease-specific targets",
                    "CGA focuses exclusively on curing the primary disease regardless of side effects",
                    "CGA requires the patient to undergo a brain biopsy and extensive genetic testing",
                    "A standard evaluation is performed only in inpatient wards, while CGA is performed only in surgical suites",
                    "There is no difference; the two assessments utilize identical clinical protocols"
                ],
                "answer": 0,
                "exp": "A standard medical evaluation is often disease-centric (e.g., targeting a strict HbA1c or blood pressure goal). A CGA is functional and patient-centric, prioritizing the patient's quality of life, independence, and overall function, and modifying disease-specific goals when they cause side effects (like orthostatic falls from tight BP control)."
            }
        ]
    },
    # 6. Goal-directed care planning
    {
        "title": "Goal-Directed Care: Prioritizing Function",
        "age_range": (70, 95),
        "scenario": (
            "A {age}-year-old {gender} with a history of advanced COPD, moderate dementia, and severe osteoarthritis is evaluated in the clinic. The patient has been hospitalized three times in the past year for COPD exacerbations and falls. During a care planning discussion, the geriatrician focuses on **goal-directed care**, asking the patient and family to identify their primary functional priorities."
        ),
        "questions": [
            {
                "q": "What is the primary focus of goal-directed care planning in this complex older patient?",
                "options": [
                    "Eliciting the patient's specific, functional, and life-quality goals (e.g., 'being able to walk to the mailbox' or 'avoiding hospital stays') and aligning all medical treatments and targets to support these goals, rather than pursuing strict, disease-specific guideline metrics",
                    "Initiating aggressive, high-risk surgical interventions to completely cure the osteoarthritis and COPD",
                    "Signing a legal document that transfer all medical decision-making authority to the hospital board",
                    "Enrolling the patient immediately in a clinical trial for a new, unapproved dementia drug",
                    "Tapering all medications to zero and initiating comfort-only hospice care today"
                ],
                "answer": 0,
                "exp": "In complex older patients with multiple chronic conditions (multimorbidity), following multiple disease-specific guidelines often leads to polypharmacy, drug-disease interactions, and patient burden. Goal-directed care shifts the focus to patient-centered goals (functional goals like staying at home, avoiding hospitalization) and tailors treatments to achieve them, even if it means relaxing standard clinical metrics."
            },
            {
                "q": "In an older adult with multiple chronic conditions (multimorbidity), blindly following all disease-specific clinical practice guidelines (e.g., strict blood pressure, HbA1c, and lipid targets) frequently leads to which of the following clinical complications?",
                "options": [
                    "Polypharmacy, severe drug-drug and drug-disease interactions, patient burden, and an increased risk of adverse events like falls",
                    "Immediate cure of all underlying chronic conditions and a complete restoration of youth",
                    "Systemic vasculitis and immediate bone marrow suppression",
                    "Rapid weight loss and acute primary hyperthyroidism",
                    "There are no complications; following all guidelines is the gold-standard recommendation"
                ],
                "answer": 0,
                "exp": "Applying multiple single-disease guidelines to a patient with multimorbidity leads to polypharmacy, treatment conflicts (e.g., beta-blockers for heart failure worsening COPD, or tight glycemic control causing hypoglycemic falls), and significant patient distress due to a heavy pill burden."
            },
            {
                "q": "Which of the following is a classic example of 'deprescribing' in alignment with a patient's goal of 'avoiding dizziness and falls,' while relaxing a standard guideline metric?",
                "options": [
                    "Discontinuing hydrochlorothiazide and tapering amlodipine in a patient with a blood pressure of 118/70 mmHg who experiences severe orthostatic lightheadedness",
                    "Adding a fourth daily blood pressure medication to achieve a strict systolic target of < 110 mmHg",
                    "Initiating high-dose daily oral prednisone for mild joint aches in a patient with diabetes",
                    "Discontinuing the patient's donepezil because they forgot their appointment",
                    "Prescribing a nightly dose of alprazolam to ensure deep sleep in a patient with a high falls risk"
                ],
                "answer": 0,
                "exp": "In a patient experiencing orthostatic dizziness and falls, the standard blood pressure target should be relaxed, and blood pressure medications (especially diuretics) should be reduced or stopped. This directly supports the patient's goal of remaining upright and avoiding fractures, even if SBP rises slightly."
            }
        ]
    },
    # 7. Discharge planning and transitions of care
    {
        "title": "Transitions of Care and Discharge Planning",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with mild dementia and hypertension is being discharged from the hospital after being treated for acute heart failure. The physician coordinates the discharge plan, focusing on preventing readmission and ensuring a safe transition back to the home environment."
        ),
        "questions": [
            {
                "q": "According to evidence-based transitions of care models (e.g., Project RED or Project BOOST), which of the following is a critical element of the discharge plan to reduce 30-day readmissions?",
                "options": [
                    "Perform a meticulous medication reconciliation, provide a simplified written plan to the patient and caregiver, schedule a follow-up appointment within 7 to 14 days, and conduct a post-discharge telephone call within 48 hours",
                    "Instruct the patient to resume all pre-admission medications exactly as before, and schedule a follow-up visit in 3 months",
                    "Prescribe low-dose oral haloperidol at discharge to prevent post-hospital delirium, and advise absolute bed rest",
                    "Discontinue all heart failure medications at discharge and place a chronic Foley catheter",
                    "There are no evidence-based models; discharge planning is supportive and has no effect on readmissions"
                ],
                "answer": 0,
                "exp": "Discharge is a high-risk transition. Safe transitions require: (1) formal medication reconciliation, (2) patient/caregiver education with a clear, simplified 'discharge tool,' (3) early outpatient follow-up (ideally within 7 days, definitely within 14 days), and (4) a follow-up phone call within 2-3 days to check on compliance and symptoms."
            },
            {
                "q": "Which of the following is the most common reason for preventable post-discharge adverse events and rapid hospital readmissions in older adults?",
                "options": [
                    "Medication errors, discrepancies, and adverse drug events",
                    "Inadequate hospital food during the admission",
                    "Immediate recurrence of the acute surgical pathology",
                    "Failure of the patient to undergo daily physical therapy at home",
                    "Systemic infections acquired from visiting family members"
                ],
                "answer": 0,
                "exp": "Medication discrepancies and adverse drug events (ADEs) are the leading cause of post-discharge complications. Up to 20% of patients experience an ADE within 3 weeks of discharge, often due to confusion over changed regimens or duplicate prescriptions."
            },
            {
                "q": "What is the recommended timeframe for a patient's first outpatient follow-up appointment after being discharged from the hospital for a high-risk medical condition like acute heart failure or COPD?",
                "options": [
                    "Within 7 days of discharge",
                    "Within 30 to 45 days of discharge",
                    "Exactly 24 hours after discharge",
                    "Within 3 months of discharge",
                    "No follow-up is needed if the patient felt well at discharge"
                ],
                "answer": 0,
                "exp": "Current transitional care guidelines strongly recommend that high-risk older adults be seen by their primary care provider or specialist within 7 days of hospital discharge to review medications, evaluate clinical stability, and prevent early readmissions."
            }
        ]
    },
    # 8. Physical therapy referral criteria
    {
        "title": "Referral to Physical Therapy",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with moderate hip and knee osteoarthritis presents with progressive difficulty rising from a deep chair, a slow walking speed, and a history of a near-fall last month. The patient is highly motivated to remain independent at home. The physician initiates a referral for outpatient physical therapy."
        ),
        "questions": [
            {
                "q": "What represents the primary clinical indications and evidence-based goals for physical therapy (PT) in this older adult?",
                "options": [
                    "Indications: gait speed < 1.0 m/s, rising difficulty, or fall history; goals: improve proximal muscle strength (e.g., quadriceps), enhance balance, teach gait-assistive device use, and directly reduce future fall risk",
                    "Indications: mild memory loss; goals: initiate donepezil therapy and perform cognitive exercises",
                    "Indications: severe acute myocardial infarction; goals: perform immediate high-intensity weightlifting",
                    "Indications: chronic urinary incontinence; goals: perform daily catheterization and restrict fluid",
                    "PT is not indicated; the patient should be advised to avoid all physical activity to protect the arthritic joints"
                ],
                "answer": 0,
                "exp": "Referral to PT is indicated for older adults with gait/balance abnormalities, history of falls, slow gait speed, or difficulty with transfers. PT focuses on progressive resistance training (building quad strength for chair rises) and balance training (preventing falls), which are highly effective in maintaining independence."
            },
            {
                "q": "Which of the following muscle groups is the primary target for progressive resistance training in physical therapy to improve a patient's ability to rise from a chair and climb stairs independently?",
                "options": [
                    "Quadriceps femoris",
                    "Deltoid and biceps brachii",
                    "Rectus abdominis",
                    "Trapezius and latissimus dorsi",
                    "Pectoralis major"
                ],
                "answer": 0,
                "exp": "The quadriceps are the primary extensors of the knee joint and are critical for functional transfers (rising from a chair, toilet) and climbing stairs. Proximal muscle weakness in the quads is a major predictor of mobility loss and falls."
            },
            {
                "q": "When physical therapy recommends a patient use a single-point cane to reduce pain and improve stability in a patient with unilateral knee osteoarthritis, on which side should the patient hold the cane?",
                "options": [
                    "On the contralateral (opposite) side of the affected/painful knee, moving the cane forward concurrently with the affected leg",
                    "On the ipsilateral (same) side of the affected/painful knee, keeping all weight on that side",
                    "In the dominant hand, regardless of which knee is affected, and moving it only during standing",
                    "The patient should hold two canes in one hand to maximize grip stability",
                    "Canes are not recommended for unilateral knee osteoarthritis; a wheelchair is required"
                ],
                "answer": 0,
                "exp": "A cane should be held in the hand opposite the painful/affected leg (contralateral side). This widens the base of support and allows the patient to shift their center of gravity away from the painful joint, reducing joint loading and pain."
            }
        ]
    },
    # 9. Occupational therapy for home adaptation
    {
        "title": "Occupational Therapy and Home Safety",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} is being discharged back home after being treated for a minor non-displaced humeral fracture sustained during a fall in the bathroom. The patient has a history of moderate osteoarthritis and mild cognitive impairment. The physician initiates an Occupational Therapy (OT) referral for home adaptation."
        ),
        "questions": [
            {
                "q": "What is the primary role of an Occupational Therapist (OT) in discharge planning, and what represents an evidence-based recommendation for home safety modifications?",
                "options": [
                    "OTs evaluate functional performance of ADLs/IADLs and recommend adaptive equipment and home modifications (e.g., grab bars in the tub, raised toilet seats, removing throw rugs, improving lighting); this directly reduces falls risk",
                    "OTs focus exclusively on high-intensity lower-extremity aerobic and strength training in a specialized gym",
                    "OTs are responsible for diagnosing and treating clinical depression and anxiety in the home setting",
                    "OTs perform surgical debridement of wounds and manage intravenous antibiotic infusions",
                    "OTs advise the patient to purchase a motorized wheelchair and remain strictly seated at all times"
                ],
                "answer": 0,
                "exp": "Occupational Therapists (OTs) focus on the intersection of function and environment. They assess the patient's ability to perform ADLs/IADLs and conduct home safety assessments to identify and remove hazards, install safety equipment (grab bars, raised toilets), and recommend adaptive tools, which significantly reduces recurrent falls."
            },
            {
                "q": "Which of the following is a classic example of 'Adaptive Equipment' recommended by an Occupational Therapist to help a patient with severe hip osteoarthritis dress their lower extremities independently and safely?",
                "options": [
                    "A sock aid and a long-handled shoehorn",
                    "A motorized wheelchair with a hydraulic lift",
                    "An automated voice-controlled alarm clock",
                    "A blood pressure cuff and a digital pulse oximeter",
                    "A soft cervical collar and bilateral wrist splints"
                ],
                "answer": 0,
                "exp": "For patients with limited hip flexion (who cannot bend forward to reach their feet), adaptive devices like a sock aid, long-handled shoehorn, or reacher/grabber allow them to put on socks and shoes safely without bending, preserving independence and preventing falls."
            },
            {
                "q": "Which of the following home bathroom modifications is highly recommended by OTs to prevent falls during transfers in a patient with severe knee osteoarthritis who has difficulty rising from low surfaces?",
                "options": [
                    "Installing a raised toilet seat with armrests, and securing sturdy grab bars to the wall near the tub and toilet",
                    "Applying a high-gloss wax to the tile floor to make it easier to slide onto the toilet",
                    "Removing all support bars and advising the patient to hold onto the sink basin",
                    "Replacing the toilet with a portable plastic bedpan left on the floor",
                    "Keeping the bathroom completely unlit to prevent glare and distraction"
                ],
                "answer": 0,
                "exp": "A raised toilet seat reduces the distance and quadriceps strength required to transfer. Sturdy, wall-mounted grab bars (never towel racks, which can pull out of the wall) provide essential upper-body support during bathroom transfers, which are high-risk movements."
            }
        ]
    },
    # 10. Decision-making capacity assessment vs competency
    {
        "title": "Decision-Making Capacity vs Legal Competency",
        "age_range": (70, 95),
        "scenario": (
            "A {age}-year-old {gender} with moderate dementia refuses a recommended diagnostic colonoscopy for iron deficiency anemia. The medical team is unsure if they should respect the refusal. The physician conducts a formal decision-making capacity assessment, noting that the patient cannot explain the purpose of the test or the risks of refusing it."
        ),
        "questions": [
            {
                "q": "What is the key clinical and legal distinction between decision-making capacity and legal competency?",
                "options": [
                    "Capacity is a clinical determination made by a physician for a specific medical decision, while competency is a global legal status determined only by a court judge",
                    "Capacity is a permanent legal label, while competency is a transient clinical finding that changes daily",
                    "Capacity is evaluated only by psychiatrists, while competency is evaluated only by primary care nurses",
                    "There is no distinction; the two terms are legally and clinically identical",
                    "Capacity requires a brain biopsy, while competency requires a standardized MMSE score > 28"
                ],
                "answer": 0,
                "exp": "Capacity is a clinical determination made by a physician for a specific decision at a specific time. Competency is a legal designation decided by a judge in a court of law, declaring a person globally capable or incapable of managing their affairs. A patient with dementia may lack capacity for a complex surgery but retain capacity to appoint a healthcare proxy."
            },
            {
                "q": "A patient with mild dementia is found to lack capacity to consent to a high-risk surgical procedure. However, the patient is fully able to identify their daughter, state that they trust her, and wishes for her to make all medical decisions. Does the patient retain the capacity to designate her as their surrogate decision-maker?",
                "options": [
                    "Yes; the threshold of capacity required to designate a surrogate (Healthcare Proxy) is lower than the capacity required to consent to a complex, high-risk surgery",
                    "No; a lack of capacity for one medical decision globally invalidates capacity for all decisions, including proxy designation",
                    "No; patients with dementia are legally barred from designating any surrogates",
                    "Yes, but only if the daughter undergoes a formal psychological evaluation first",
                    "Yes, but the designation must be approved by a panel of three independent surgeons"
                ],
                "answer": 0,
                "exp": "Capacity is decision-specific. The cognitive threshold to appoint a trusted surrogate ('I want my daughter to decide') is much lower than the capacity required to understand and weigh the complex risks/benefits of a major surgery. Clinicians should facilitate proxy designation in these patients while they can."
            },
            {
                "q": "Which of the following is the most appropriate action if an incapacitated patient without a designated Healthcare Proxy or living will requires a non-emergent, high-risk medical decision?",
                "options": [
                    "Identify and consult a surrogate decision-maker from the state's surrogate hierarchy (typically spouse first, then adult children, parents, siblings)",
                    "Proceed with the procedure immediately based on the surgeon's clinical preference",
                    "Wait until a court judge can appoint a public guardian, even if it takes months",
                    "Ask the patient's roommate or a close neighbor to sign the consent form",
                    "Administer low-dose haloperidol to transiently restore the patient's capacity"
                ],
                "answer": 0,
                "exp": "In the absence of a DPOAH, state laws provide a surrogate hierarchy to identify the legally authorized decision-maker, starting with the spouse and moving to adult children, parents, and siblings. The identified surrogate must use the substituted judgment standard."
            }
        ]
    }
]

templates_osteoporosis = [
    # 1. DEXA scan interpretation
    {
        "title": "DEXA Scan: Osteoporosis vs Osteopenia",
        "age_range": (65, 90),
        "scenario": (
            "A {age}-year-old {gender} undergoes a routine screening dual-energy X-ray absorptiometry (DEXA) scan. The patient is healthy and active. The DEXA report reveals a T-score of **-2.7** at the femoral neck and **-2.3** at the lumbar spine. Z-score is -1.1. The patient asks what these scores mean."
        ),
        "questions": [
            {
                "q": "What is the correct clinical interpretation of these DEXA scores, and what is the diagnostic threshold for osteoporosis?",
                "options": [
                    "The T-score of -2.7 is diagnostic of osteoporosis (T-score <= -2.5 defines osteoporosis); the Z-score is normal, and treatment with a bisphosphonate is indicated",
                    "The T-score indicates mild osteopenia (T-score between -1.0 and -2.5); reassure the patient and repeat the scan in 10 years",
                    "The Z-score indicates severe secondary bone cancer; schedule an immediate bone biopsy",
                    "The scores are normal; no active interventions or calcium supplements are needed",
                    "T-scores are outdated; clinical diagnosis should be based exclusively on serum calcium levels"
                ],
                "answer": 0,
                "exp": "According to the WHO: (1) Normal: T-score >= -1.0; (2) Osteopenia: T-score between -1.0 and -2.5; (3) Osteoporosis: T-score <= -2.5. A T-score of -2.7 at the femoral neck confirms osteoporosis, warranting pharmacotherapy (bisphosphonates) and calcium/Vitamin D. Z-scores compare the patient to age-matched controls; Z-score <= -2.0 suggests secondary osteoporosis."
            },
            {
                "q": "What is the primary difference between a T-score and a Z-score in a DEXA report, and when should the Z-score be used preferentially for diagnosis?",
                "options": [
                    "T-scores compare BMD to young, healthy adults, while Z-scores compare to age-, sex-, and ethnicity-matched controls; Z-scores are preferred in premenopausal females and males under age 50",
                    "T-scores evaluate only cortical bone, while Z-scores evaluate only trabecular bone",
                    "Z-scores are used exclusively in patients who have already suffered a hip fracture",
                    "T-scores are qualitative, while Z-scores are highly quantitative and calculate GFR",
                    "There is no difference; both scores utilize identical statistical baselines"
                ],
                "answer": 0,
                "exp": "T-score compares the patient to a young-adult reference population (peak bone mass). Z-score compares the patient to an age-, sex-, and race-matched population. Z-scores are preferred in premenopausal women, younger men, and children; a Z-score <= -2.0 suggests a secondary cause of bone loss."
            },
            {
                "q": "According to the USPSTF guidelines, what is the standard recommendation for osteoporosis screening in healthy, asymptomatic females?",
                "options": [
                    "Screen all females aged 65 and older with a DEXA scan, and screen younger postmenopausal females who have an elevated fracture risk (e.g., elevated FRAX score)",
                    "Screen all females starting at age 40, and repeat the DEXA scan annually",
                    "Screen only females who have a history of a hip fracture, and repeat every 5 years",
                    "Avoid screening; DEXA scans have a high risk of causing radiation-induced osteosarcoma",
                    "Screen all females at age 50 with a pelvic X-ray, and avoid DEXA scans entirely"
                ],
                "answer": 0,
                "exp": "USPSTF recommends screening for osteoporosis with bone measurement testing (DEXA) in women aged 65 and older, and in postmenopausal women younger than 65 who are at increased risk of osteoporosis (e.g., parent with hip fracture, smoking, low weight, glucocorticoid use)."
            }
        ]
    },
    # 2. FRAX score and fracture risk
    {
        "title": "Evaluating Fracture Risk with the FRAX Tool",
        "age_range": (65, 85),
        "scenario": (
            "A {age}-year-old {gender} is evaluated for bone health. The patient's DEXA scan shows a T-score of -2.1 (osteopenia) at the femoral neck. The patient's mother suffered a hip fracture at age 78. The patient is a current smoker and drinks 3 alcoholic beverages daily. The physician calculates the 10-year fracture probability using the **FRAX** tool."
        ),
        "questions": [
            {
                "q": "What represents the clinical utility of the FRAX tool, and what represent the treatment thresholds for initiating pharmacotherapy in a patient with osteopenia?",
                "options": [
                    "The FRAX tool calculates the 10-year probability of a major osteoporotic or hip fracture; initiate pharmacotherapy if the 10-year probability is >= 20% for a major osteoporotic fracture or >= 3% for a hip fracture",
                    "The FRAX tool is used exclusively to diagnose severe osteoarthritis and initiates a referral for joint replacement",
                    "The treatment threshold is a 10-year probability of any fracture >= 50% only; lower scores require no treatment",
                    "FRAX calculations are non-quantitative; treatment is based exclusively on the patient's age and sex",
                    "None of the options; FRAX is used to calculate the risk of myocardial infarction in postmenopausal women"
                ],
                "answer": 0,
                "exp": "The FRAX (Fracture Risk Assessment Tool) integrates clinical risk factors (age, smoking, alcohol, parent hip fracture, glucocorticoids, rheumatoid arthritis) with femoral neck BMD. For patients with osteopenia, the National Osteoporosis Foundation recommends treatment if the FRAX 10-year probability is >= 20% for major osteoporotic fracture (hip, clinical spine, forearm, humerus) or >= 3% for hip fracture."
            },
            {
                "q": "Which of the following clinical risk factors is included in the FRAX tool calculation, reflecting a strong, dose-dependent negative impact on bone mineral density?",
                "options": [
                    "Current smoking, alcohol intake of >= 3 units daily, and prior history of a fragility fracture",
                    "A history of hypertension or hypercholesterolemia",
                    "High dietary intake of calcium and Vitamin D",
                    "Use of a multi-component exercise program (Tai Chi)",
                    "A history of mild cognitive impairment or dementia"
                ],
                "answer": 0,
                "exp": "FRAX incorporates: age, sex, weight, height, previous fracture, parent history of hip fracture, current smoking, glucocorticoid use, rheumatoid arthritis, secondary osteoporosis, alcohol (>= 3 units/day), and femoral neck BMD."
            },
            {
                "q": "Why does chronic, systemic glucocorticoid use (e.g., prednisone) represent a major risk factor that is heavily weighted in the FRAX tool?",
                "options": [
                    "Glucocorticoids directly stimulate osteoclast survival and activity while suppressing osteoblast proliferation and differentiation, causing rapid bone loss",
                    "Glucocorticoids block the renal excretion of calcium, causing severe systemic hypercalcemia",
                    "Prednisone binds directly to bone minerals, dissolving the calcium phosphate matrix",
                    "Glucocorticoids cause a complete genetic deletion of the Vitamin D receptor in the intestine",
                    "There is no risk; glucocorticoids actually strengthen the bone matrix by building collagen"
                ],
                "answer": 0,
                "exp": "Glucocorticoid-induced osteoporosis is the most common cause of secondary osteoporosis. Glucocorticoids have a dual negative effect: they increase osteoclast-mediated bone resorption and directly inhibit osteoblast bone-forming activity, causing rapid bone loss within weeks of starting therapy."
            }
        ]
    },
    # 3. Bisphosphonate therapy
    {
        "title": "Bisphosphonate Therapy and Esophagitis Precautions",
        "age_range": (65, 85),
        "scenario": (
            "A {age}-year-old {gender} is diagnosed with severe osteoporosis (T-score -2.8) and is prescribed oral alendronate 70 mg weekly. The physician provides detailed, critical instructions regarding how to take this medication to prevent severe esophageal irritation and maximize absorption."
        ),
        "questions": [
            {
                "q": "What represents the correct administration protocol and precautions for oral alendronate?",
                "options": [
                    "Take first thing in the morning on an empty stomach with a full glass of plain water; remain upright (sitting or standing) and avoid eating or drinking anything else for at least 30 minutes",
                    "Take right before bedtime with a warm glass of milk, and lie down immediately to promote sleep",
                    "Crush the tablet and take it with a high-calcium yogurt to improve calcium absorption",
                    "Take concurrently with a daily proton pump inhibitor (omeprazole) to protect the stomach",
                    "Dissolve the tablet in a glass of orange juice and drink slowly throughout the morning"
                ],
                "answer": 0,
                "exp": "Oral bisphosphonates are poorly absorbed (< 1%) and highly irritating to the esophageal mucosa. They must be taken on an empty stomach with plain water (not mineral water, juice, or coffee, which block absorption). The patient must remain upright for at least 30 minutes to prevent gastroesophageal reflux and severe chemical esophagitis."
            },
            {
                "q": "What is the primary cellular mechanism of action of bisphosphonates (e.g., alendronate, zoledronic acid) in the treatment of osteoporosis?",
                "options": [
                    "Inhibition of osteoclast-mediated bone resorption by binding to hydroxyapatite and inducing osteoclast apoptosis",
                    "Direct stimulation of osteoblast proliferation and osteoid synthesis in cortical bone",
                    "Upregulation of calcium transport channels in the duodenal brush border",
                    "Inhibition of parathyroid hormone (PTH) release by the parathyroid glands",
                    "Direct deposition of synthetic calcium crystals into the trabecular meshwork"
                ],
                "answer": 0,
                "exp": "Bisphosphonates are pyrophosphate analogs that bind strongly to hydroxyapatite crystals in bone. During bone resorption, they are taken up by osteoclasts, where they inhibit the mevalonate pathway, disrupting key structural proteins and leading to osteoclast dysfunction and apoptosis."
            },
            {
                "q": "Which of the following rare, serious complications is associated with long-term, high-dose bisphosphonate therapy (typically > 5 years of use), warranting the consideration of a 'drug holiday'?",
                "options": [
                    "Atypical femoral fractures (AFF) and osteonecrosis of the jaw (ONJ)",
                    "Severe hypertrophic cardiomyopathy and acute heart block",
                    "Acute interstitial nephritis and bilateral renal papillary necrosis",
                    "Progressive temporal lobe atrophy and dementia",
                    "Complete blindness due to optic nerve calcification"
                ],
                "answer": 0,
                "exp": "Long-term bisphosphonate use suppresses bone turnover, which can lead to microdamage accumulation. This is linked to: (1) Atypical Femoral Fractures (low-energy transverse fractures of the femoral shaft, often preceded by thigh pain) and (2) Osteonecrosis of the Jaw (exposed bone in the oral cavity, often after dental extraction). A 'drug holiday' of 2-3 years is considered after 3-5 years of therapy."
            }
        ]
    },
    # 4. Vertebral compression fracture
    {
        "title": "Acute Back Pain: Vertebral Compression Fracture",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with a history of severe osteoporosis presents with a sudden onset of severe, localized mid-back pain that began yesterday after bending forward to pick up a newspaper. The patient denies trauma, leg weakness, or bowel/bladder changes. Spine exam reveals point tenderness over the T12 vertebra and a mild thoracic kyphosis. Spine X-ray confirms a new wedge compression fracture at T12, with a 30% loss of vertebral height."
        ),
        "questions": [
            {
                "q": "What is the most appropriate initial management strategy for this patient?",
                "options": [
                    "Conservative management: adequate pain control (e.g., acetaminophen, short-term low-dose opioids, or intranasal calcitonin), gentle mobilization as tolerated, avoiding prolonged bed rest, and initiating/optimizing osteoporosis therapy",
                    "Strict absolute bed rest for 6 weeks, and immediate surgical spinal fusion",
                    "Immediate referral for emergent surgical decompressive laminectomy in the absence of neurological deficits",
                    "Initiate high-velocity chiropractic spinal manipulation twice weekly to restore height",
                    "Taper and discontinue all calcium and Vitamin D supplements to prevent spinal calcification"
                ],
                "answer": 0,
                "exp": "Initial treatment for acute, neurologically intact vertebral compression fractures is conservative: pain management, early mobilization (bed rest causes rapid muscle loss and bone density decline), and initiating bone-protective therapy. Intranasal calcitonin is useful as it has a specific analgesic effect on bone pain. Vertebroplasty/kyphoplasty are reserved for severe, refractory pain."
            },
            {
                "q": "Which of the following pharmacological agents used for osteoporosis is specifically noted for providing a rapid, direct analgesic effect for acute, painful vertebral compression fractures?",
                "options": [
                    "Intranasal Calcitonin-salmon",
                    "Oral Alendronate",
                    "Intravenous Zoledronic acid",
                    "Subcutaneous Denosumab",
                    "Oral Raloxifene"
                ],
                "answer": 0,
                "exp": "Calcitonin-salmon (administered intranasally or subcutaneously) has a well-documented, short-term analgesic effect specifically for acute bone pain associated with osteoporotic vertebral fractures, likely mediated by central beta-endorphin release, though it is not a preferred drug for long-term BMD improvement."
            },
            {
                "q": "What is the primary clinical consequence of sustaining a single osteoporotic vertebral compression fracture in terms of future fracture risk?",
                "options": [
                    "A five-fold increased risk of sustaining subsequent vertebral fractures (the 'vertebral fracture cascade'), and a significant increase in hip fracture risk",
                    "A complete cessation of future bone loss due to localized spinal healing",
                    "A direct transition to a low risk of future fractures in the lower extremities",
                    "Immediate onset of severe peripheral sensory neuropathy in all limbs",
                    "There is no impact; a single compression fracture is a benign, isolated event"
                ],
                "answer": 0,
                "exp": "Sustaining a vertebral fracture is a powerful predictor of future fractures. A single fracture increases the risk of subsequent vertebral fractures five-fold, often occurring in adjacent vertebrae due to altered spinal mechanics and kyphosis."
            }
        ]
    },
    # 5. Hip fracture perioperative management
    {
        "title": "Hip Fracture: Perioperative Optimization",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} is admitted to the emergency department after falling at home and sustaining a displaced femoral neck fracture. The patient has a history of mild cognitive impairment and hypertension. The orthopedic surgeon plans for surgical repair. The geriatrician is consulted for perioperative co-management."
        ),
        "questions": [
            {
                "q": "What represents the key perioperative goals and interventions to optimize outcomes and reduce complications in this patient?",
                "options": [
                    "Early surgical intervention (ideally within 24-48 hours), aggressive delirium prevention protocols, appropriate pain management (e.g., femoral nerve block), early mobilization on post-operative day 1, and VTE prophylaxis",
                    "Delay surgery for 7 days to perform extensive cardiac testing, keep the patient strictly NPO, and apply continuous heavy skin traction",
                    "Avoid all pain medications post-surgery to prevent delirium, and keep the patient bed-bound for 2 weeks",
                    "Initiate high-dose oral alendronate immediately in the preoperative phase and hold all intravenous fluids",
                    "Surgical intervention is not recommended in patients over age 80; manage conservatively with strict bed rest"
                ],
                "answer": 0,
                "exp": "Hip fractures carry high morbidity. Key perioperative steps are: (1) early surgery (< 24-48 hours) to reduce mortality, (2) delirium prevention (reorientation, avoiding Beers drugs, sleep hygiene), (3) regional nerve blocks to reduce opioid need, (4) early mobility, and (5) chemical VTE prophylaxis (enoxaparin)."
            },
            {
                "q": "Which of the following regional pain management techniques is highly recommended for preoperative hip fracture pain to reduce the need for systemic opioids and lower the risk of post-operative delirium?",
                "options": [
                    "Femoral Nerve Block or Fascia Iliaca Compartment Block",
                    "High-dose systemic intravenous morphine infusion",
                    "Epidural catheter placement with continuous bupivacaine",
                    "Bedside lumbar puncture with intrathecal fentanyl injection",
                    "Applying a lidocaine patch directly over the fracture site"
                ],
                "answer": 0,
                "exp": "A femoral nerve block or fascia iliaca block provides highly effective, localized analgesia for hip fractures. By blocking sensory transmission, it dramatically reduces the requirement for systemic opioids, which are major triggers for acute delirium in older adults."
            },
            {
                "q": "What is the primary clinical benefit of early mobilization (out of bed, weight-bearing as tolerated) on post-operative day 1 following hip fracture surgery?",
                "options": [
                    "Reduced risk of deep vein thrombosis (DVT), pneumonia, pressure injuries, and sarcopenia, leading to shorter hospital stays and better functional recovery",
                    "Immediate reduction of the patient's blood pressure and serum glucose levels",
                    "It prevents the surgical hardware from developing structural stress fractures",
                    "It causes rapid clearance of anesthetic agents from the liver",
                    "There is no benefit; early mobility is dangerous and should be avoided for 2 weeks"
                ],
                "answer": 0,
                "exp": "Early mobility is a cornerstone of post-operative hip fracture care. Remaining bed-bound causes rapid muscle loss (up to 5% per day), increases pressure ulcer risk, promotes venous stasis (DVTs), and compromises pulmonary function (atelectasis, pneumonia)."
            }
        ]
    },
    # 6. Vitamin D and calcium supplementation
    {
        "title": "Calcium and Vitamin D Supplementation",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} is diagnosed with severe osteoporosis. The physician is planning to initiate treatment with a bisphosphonate. Before starting, the physician reviews the patient's calcium and Vitamin D status. Labs show a 25-hydroxyvitamin D level of **14 ng/mL** (deficient). The patient asks what supplements are needed."
        ),
        "questions": [
            {
                "q": "What represents the correct daily intake targets and management for Vitamin D and calcium deficiency prior to starting bisphosphonates?",
                "options": [
                    "Correct the Vitamin D deficiency first (e.g., high-dose Vitamin D3 weekly for 8 weeks), then maintain a daily intake of 800-1000 IU of Vitamin D3 and 1000-1200 mg of elemental calcium (preferring dietary sources, and using calcium citrate if on a PPI); starting bisphosphonates in severe Vitamin D deficiency can precipitate hypocalcemia",
                    "Prescribe a high starting dose of oral alendronate immediately and advise the patient to avoid all calcium supplements to prevent kidney stones",
                    "Initiate daily oral calcium carbonate 3000 mg and avoid all Vitamin D supplements to prevent hypervitaminosis D",
                    "Give a single intramuscular injection of 1,000,000 IU of Vitamin D2 and restrict all dietary calcium",
                    "Vitamin D deficiency is a normal aging change and requires no treatment or supplementation"
                ],
                "answer": 0,
                "exp": "Severe Vitamin D deficiency (25-OH-D < 20 ng/mL) must be corrected before starting potent bone-resorption inhibitors (bisphosphonates or denosumab) to avoid precipitating acute hypocalcemia. Daily targets are 800-1000 IU of D3 and 1000-1200 mg of calcium. Citrate is preferred over carbonate for patients on PPIs."
            },
            {
                "q": "Which of the following represents the biologically active form of Vitamin D synthesized by the kidneys, which acts on the intestinal mucosa to stimulate active calcium absorption?",
                "options": [
                    "1,25-dihydroxyvitamin D3 (Calcitriol)",
                    "25-hydroxyvitamin D3 (Calcidiol)",
                    "Cholecalciferol (Vitamin D3)",
                    "Ergocalciferol (Vitamin D2)",
                    "7-dehydrocholesterol"
                ],
                "answer": 0,
                "exp": "Calcitriol (1,25-(OH)2-D3) is the active hormone. Cholecalciferol (D3) is hydroxylated in the liver to calcidiol (25-OH-D3, which is the major circulating form measured to assess Vitamin D stores), and then hydroxylated in the kidney by 1-alpha-hydroxylase to active calcitriol."
            },
            {
                "q": "What is the primary risk of using high-dose calcium supplements (e.g., > 2000 mg of elemental calcium daily from pills) rather than relying primarily on dietary calcium sources?",
                "options": [
                    "Increased risk of nephrolithiasis (kidney stones) and potential risk of cardiovascular calcification, along with GI side effects (constipation)",
                    "Severe acute liver necrosis and secondary bone marrow failure",
                    "Rapid development of a severe papular skin rash and photosensitivity",
                    "Complete genetic deletion of the calcium-sensing receptor in the parathyroid glands",
                    "No risks; high-dose calcium pills are completely safe and highly recommended"
                ],
                "answer": 0,
                "exp": "Unlike dietary calcium (which binds oxalate in the gut, reducing kidney stones), excess supplemental calcium pills raise serum calcium spikes, increasing urinary calcium excretion and kidney stone risk. High supplemental calcium is also linked to potential arterial calcification, and causes significant constipation in the elderly."
            }
        ]
    },
    # 7. Secondary osteoporosis workup
    {
        "title": "Secondary Osteoporosis: The Glucocorticoid Patient",
        "age_range": (65, 85),
        "scenario": (
            "A {age}-year-old {gender} with a history of polymyalgia rheumatica has been taking daily prednisone 15 mg for the past 9 months. The patient presents for a bone health evaluation. DEXA scan shows a T-score of -2.6 (osteoporosis). The physician initiates a workup for secondary osteoporosis and plans treatment."
        ),
        "questions": [
            {
                "q": "Which of the following represents the most appropriate management plan for this patient with glucocorticoid-induced osteoporosis?",
                "options": [
                    "Initiate a bisphosphonate (e.g., alendronate or zoledronic acid) as first-line therapy, optimize calcium and Vitamin D intake, and use the lowest effective dose of prednisone for the shortest possible duration",
                    "Discontinue prednisone abruptly today, and prescribe a high-dose Vitamin D supplement as monotherapy",
                    "Prednisone-induced bone loss is self-limiting and requires no active pharmacological treatment",
                    "Initiate high-dose daily oral calcitonin and prescribe a strict bed rest protocol",
                    "Perform immediate bilateral greater trochanteric joint replacement to prevent future fractures"
                ],
                "answer": 0,
                "exp": "Glucocorticoids induce rapid bone loss. For patients on long-term therapy (prednisone >= 2.5-5 mg/day for >= 3 months) with osteoporosis or high risk, pharmacotherapy (bisphosphonates) is recommended immediately. Prednisone should be kept at the lowest effective dose. Stopping abruptly is dangerous due to adrenal suppression."
            },
            {
                "q": "Which of the following laboratory screening panels is most appropriate to rule out other common causes of secondary osteoporosis in an older adult presenting with severe bone loss?",
                "options": [
                    "TSH, serum calcium, phosphorus, alkaline phosphatase, 25-OH-Vitamin D, creatinine, parathyroid hormone (PTH), and serum protein electrophoresis (SPEP)",
                    "Serum copper, zinc, selenium, and lead levels",
                    "Complete blood count, lipid panel, and urine drug screen",
                    "Cerebrospinal fluid analysis for oligoclonal bands",
                    "Arterial blood gas, lactic acid, and amylase levels"
                ],
                "answer": 0,
                "exp": "A secondary workup rules out: hyperthyroidism (TSH), hyperparathyroidism (PTH, calcium), renal disease (creatinine), Vitamin D deficiency, bone disease (alk-phos), and multiple myeloma (SPEP/UPEP, which is a key cause of fractures in the elderly)."
            },
            {
                "q": "Multiple myeloma classically presents in older adults with bone pain and fractures. Which of the following laboratory findings is highly characteristic of multiple myeloma, contributing directly to bone destruction?",
                "options": [
                    "A monoclonal protein (M-spike) on serum protein electrophoresis (SPEP), anemia, hypercalcemia, and lytic bone lesions",
                    "Severe hypocalcemia, microcytic anemia, and dense osteosclerotic lesions",
                    "Elevated serum Vitamin B12 levels and severe thrombocytopenia",
                    "Hypothyroidism, elevated TSH, and diffuse joint effusion",
                    "Complete absence of immunoglobulin light chains in the urine"
                ],
                "answer": 0,
                "exp": "Multiple myeloma is a plasma cell neoplasm that causes lytic bone lesions, hypercalcemia, renal failure, and anemia ('CRAB' criteria: Calcium, Renal, Anemia, Bone). Diagnosis is supported by an M-spike on SPEP or free light chains in the urine."
            }
        ]
    },
    # 8. Atypical femoral fracture from bisphosphonates
    {
        "title": "The Thigh Pain: Atypical Femoral Fracture",
        "age_range": (65, 85),
        "scenario": (
            "A {age}-year-old {gender} with severe osteoporosis has been taking oral alendronate daily for the past 7 years. The patient presents with a 2-month history of a dull, aching, progressive pain in the mid-thigh, most prominent when walking or standing. There is no history of trauma. Femur X-ray reveals a focal thickening of the lateral cortex (beaking) of the mid-femur shaft, with a tiny, incomplete transverse fracture line."
        ),
        "questions": [
            {
                "q": "What is the correct diagnosis, and what is the immediate clinical management?",
                "options": [
                    "Atypical Femoral Fracture (AFF) secondary to long-term bisphosphonate therapy; discontinue alendronate immediately, recommend non-weight-bearing (crutches/walker), obtain an MRI or bone scan of the contralateral femur, and consult orthopedic surgery",
                    "Osteoarthritic hip flare; increase the alendronate dose and initiate high-dose daily ibuprofen",
                    "Metastatic bone cancer; schedule immediate pelvic radiation therapy and continue alendronate",
                    "Normal age-related muscular fatigue; prescribe a local lidocaine patch and advise the patient to walk more",
                    "Deep vein thrombosis; initiate immediate low-molecular-weight heparin and continue alendronate"
                ],
                "answer": 0,
                "exp": "Atypical Femoral Fractures (AFFs) are a rare, serious side effect of long-term bisphosphonate use (due to severe bone turnover suppression). They are transverse fractures of the femoral shaft, often preceded by prodromal thigh or groin pain. If identified, the bisphosphonate must be stopped, orthopedic surgery consulted, and the opposite femur imaged (as AFFs are frequently bilateral)."
            },
            {
                "q": "Why is it highly critical to obtain imaging (X-ray or MRI) of the contralateral (opposite) femur when a patient is diagnosed with an atypical femoral fracture?",
                "options": [
                    "Atypical femoral fractures are frequently bilateral (occurring in both femurs in up to 30-40% of cases), even in the absence of pain in the opposite leg",
                    "Imaging is required to verify that the opposite femur can be used as a source for a bone graft",
                    "To rule out a primary metastatic bone cancer that has spread from the affected side",
                    "To calibrate the surgical traction equipment used during operative repair",
                    "There is no reason; bilateral fractures are anatomically impossible"
                ],
                "answer": 0,
                "exp": "Because bisphosphonates act systemically, the suppression of bone remodeling occurs in both femurs. Consequently, atypical femoral fractures are highly bilateral. A silent cortical stress fracture must be ruled out in the opposite leg to prevent a catastrophic complete fracture."
            },
            {
                "q": "Which of the following represents the primary mechanism by which long-term bisphosphonate therapy is believed to facilitate atypical femoral fractures?",
                "options": [
                    "Severe suppression of bone remodeling preventing the natural repair of microcracks, leading to accumulation of microdamage and bone fragility",
                    "Direct chemical dissolution of the cortical osteoid matrix",
                    "Induction of severe renal osteodystrophy causing secondary bone softening",
                    "Blockade of the intestinal blood vessels supplying the femoral head",
                    "Selective destruction of the osteocytes responsible for calcium storage"
                ],
                "answer": 0,
                "exp": "By profoundly inhibiting osteoclast activity, bisphosphonates severely suppress normal bone remodeling. Over years, this prevents the body from repairing the normal, daily microdamage (microcracks) that accumulates in long bones under mechanical stress, leading to structural fatigue and atypical fractures."
            }
        ]
    },
    # 9. Denosumab use and discontinuation
    {
        "title": "Denosumab and the Rebound Fracture Risk",
        "age_range": (65, 90),
        "scenario": (
            "A {age}-year-old {gender} with severe osteoporosis has been receiving subcutaneous injections of **denosumab** every 6 months for the past 4 years. The patient's bone density has significantly improved, and the T-score has risen from -2.9 to -2.1. The patient decides to stop the injections, believing {possessive} bones are now 'healed' and no further therapy is needed."
        ),
        "questions": [
            {
                "q": "What is the critical clinical risk of abruptly discontinuing denosumab without transitioning to another bone-protective medication, and what is the correct recommendation?",
                "options": [
                    "Abrupt discontinuation leads to a rapid, catastrophic drop in BMD and a high risk of multiple vertebral fractures (rebound fractures); do not stop denosumab without immediately transitioning to a bisphosphonate (e.g., alendronate) to 'lock in' the bone gains",
                    "Stopping denosumab is safe and has no withdrawal risks; the bone gains are permanent",
                    "Discontinuing causes acute renal failure and severe liver necrosis within 30 days",
                    "Taper the denosumab injection dose by 50% every 6 months for 3 years, and prescribe high-dose Vitamin C",
                    "Discontinue denosumab and immediately initiate a high-dose oral corticosteroid course"
                ],
                "answer": 0,
                "exp": "Unlike bisphosphonates (which persist in bone for years), denosumab is a monoclonal antibody that is cleared rapidly. Stopping it removes all osteoclast suppression. This triggers a rebound surge in osteoclast activity, causing rapid bone loss within 12 months and a high risk of multiple vertebral compression fractures. A bisphosphonate must be given to prevent this rebound."
            },
            {
                "q": "What is the specific molecular target and mechanism of action of denosumab in the treatment of osteoporosis?",
                "options": [
                    "A human monoclonal antibody that binds to RANKL (Receptor Activator of Nuclear Factor-kappa B Ligand), preventing it from activating the RANK receptor on osteoclast precursors, thereby blocking osteoclast maturation and survival",
                    "A recombinant parathyroid hormone analog that stimulates osteoblast bone-forming activity",
                    "A selective estrogen receptor modulator (SERM) that stimulates bone estrogen receptors",
                    "A competitive inhibitor of the calcium-sensing receptor in the renal tubules",
                    "A direct antagonist of the calcitonin receptor on the thyroid gland"
                ],
                "answer": 0,
                "exp": "Denosumab targets **RANKL**, a cytokine essential for osteoclast formation, function, and survival. By binding RANKL, denosumab mimics the natural action of osteoprotegerin (OPG), preventing RANKL from binding to its receptor (RANK) on osteoclasts, severely suppressing bone resorption."
            },
            {
                "q": "Which of the following represents the standard dosing frequency for subcutaneous denosumab injections in the treatment of osteoporosis?",
                "options": [
                    "One injection every 6 months",
                    "One injection weekly",
                    "One injection daily",
                    "One injection once a year",
                    "Dosing is based entirely on the patient's daily calcium levels"
                ],
                "answer": 0,
                "exp": "Denosumab (Prolia) is administered as a single 60 mg subcutaneous injection once every 6 months. Compliance with this strict 6-month window is essential to maintain efficacy and prevent rebound bone resorption."
            }
        ]
    },
    # 10. Fall prevention in osteoporotic patients
    {
        "title": "Falls Prevention in Severe Osteoporosis",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with a history of severe osteoporosis (T-score -2.9) and a prior wrist fracture is evaluated. The patient has a slow gait speed and mild balance deficits. The physician wishes to implement an aggressive, comprehensive fall prevention program to protect the patient from sustaining a catastrophic hip fracture."
        ),
        "questions": [
            {
                "q": "Which of the following combinations of interventions represents the most effective, evidence-based approach to preventing falls and fractures in this patient?",
                "options": [
                    "Prescribe progressive resistance and balance training (physical therapy), review and deprescribe high-risk Beers medications, correct vision and hearing, perform a home safety assessment, and consider hip protectors",
                    "Advise the patient to avoid all walking and remain bed-bound, and prescribe nightly lorazepam",
                    "Initiate high-dose oral muscle relaxants and purchase a motorized indoor wheelchair",
                    "Double the dose of bisphosphonates and prescribe a tight lumbar support brace to prevent spinal movement",
                    "There are no effective strategies; fall prevention has no impact on fracture rates in osteoporosis"
                ],
                "answer": 0,
                "exp": "In osteoporotic patients, preventing falls is as critical as building bone density. An evidence-based, multifactorial falls prevention program includes: PT (resistance/balance exercises), deprescribing sedatives/anticholinergics, visual corrections, home safety modifications, and hip protectors (padded undergarments that absorb impact during lateral falls)."
            },
            {
                "q": "Which of the following physical exercise modalities is highly validated and recommended specifically for improving dynamic balance and reducing falls in community-dwelling older adults?",
                "options": [
                    "Tai Chi",
                    "Strict high-intensity bench pressing",
                    "Long-distance commercial lap swimming",
                    "High-speed stationary cycling",
                    "Static stretching of the upper extremities"
                ],
                "answer": 0,
                "exp": "Tai Chi is a highly validated, evidence-based exercise for older adults. It focuses on slow, controlled movements, weight-shifting, and posture, which significantly improves dynamic balance, coordinates proprioception, and reduces falls risk by up to 50%."
            },
            {
                "q": "What represents the clinical utility of 'hip protectors' (padded undergarments) in the management of frail older adults with severe osteoporosis residing in long-term care facilities?",
                "options": [
                    "They contain protective lateral pads that shunt and absorb the kinetic energy of a direct lateral impact during a fall, significantly reducing the incidence of hip fractures",
                    "They act as a local heat source, promoting increased arterial perfusion to the femoral neck",
                    "They contain electronic sensors that automatically alert emergency services during a fall",
                    "They are designed to restrict hip flexion, preventing the patient from climbing stairs",
                    "There is no utility; hip protectors increase the risk of trochanteric friction ulcers"
                ],
                "answer": 0,
                "exp": "Hip protectors are specialized undergarments with built-in plastic shields or foam pads over the greater trochanters. During a lateral fall, they deflect and absorb the impact force, protecting the vulnerable femoral neck from fracture, especially in frail, high-risk institutionalized elders."
            }
        ]
    }
]

templates_sensory = [
    # 1. Age-related macular degeneration dry type
    {
        "title": "Dry Age-Related Macular Degeneration",
        "age_range": (65, 90),
        "scenario": (
            "A {age}-year-old {gender} presents with a {duration}-month history of progressive difficulty reading and seeing faces clearly. The patient reports a central 'smudge' or blurry spot in both eyes, with preserved peripheral vision. Slit-lamp ophthalmoscopy reveals bilateral, symmetric yellow-white deposits (drusen) in the macula and focal pigmentary changes. Amsler grid testing shows distortion of the central lines."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the recommended clinical management?",
                "options": [
                    "Dry (non-exudative) Age-Related Macular Degeneration (AMD); recommend daily AREDS2 antioxidant vitamin supplements (Vitamin C, E, Zinc, Copper, Lutein, Zeaxanthin), smoking cessation, and daily self-monitoring with an Amsler grid",
                    "Wet (exudative) AMD; refer for urgent intravitreal anti-VEGF (ranibizumab/aflibercept) injections",
                    "Open-angle glaucoma; initiate daily topical prostaglandin analog (latanoprost) drops",
                    "Diabetic retinopathy; perform immediate panretinal photocoagulation laser surgery",
                    "Cataract; schedule immediate bilateral phacoemulsification and intraocular lens placement"
                ],
                "answer": 0,
                "exp": "Dry AMD is the most common cause of central vision loss in the elderly. It is characterized by progressive central scotoma, macular drusen (deposits of extracellular material), and RPE atrophy. AREDS2 vitamins slow progression in intermediate-to-advanced dry AMD. Smoking is a key modifiable risk factor. Daily Amsler grid self-testing is critical to detect conversion to wet AMD."
            },
            {
                "q": "Which of the following represents the primary clinical utility of daily self-monitoring with an Amsler grid in a patient diagnosed with dry age-related macular degeneration?",
                "options": [
                    "To detect early, sudden conversion from dry AMD to wet (exudative) AMD, indicated by new-onset metamorphopsia (distortion of straight lines)",
                    "To measure intraocular pressure trends to rule out secondary glaucoma",
                    "To calculate the patient's visual acuity from a standard distance of 20 feet",
                    "To monitor the progressive loss of peripheral visual fields in the home setting",
                    "Amsler grid testing has no clinical utility and is used only as a placebo"
                ],
                "answer": 0,
                "exp": "Conversion from dry to wet AMD occurs when abnormal, fragile choroidal neovascular membranes sprout under the retina. This causes rapid fluid leakage and sudden, severe vision distortion (metamorphopsia). Daily Amsler grid testing allows the patient to detect this immediately, prompting urgent therapy."
            },
            {
                "q": "Which of the following modifications was made to the original AREDS formulation in the AREDS2 trial to eliminate the significantly increased risk of developing lung cancer in smokers and former smokers?",
                "options": [
                    "Replacing beta-carotene with lutein and zeaxanthin",
                    "Replacing zinc with copper and selenium",
                    "Completely removing Vitamin E and increasing Vitamin C",
                    "Adding high-dose Vitamin A and removing lutein",
                    "The AREDS2 trial concluded that vitamin supplements are ineffective"
                ],
                "answer": 0,
                "exp": "The original AREDS formula contained beta-carotene, which was found to significantly increase the risk of lung cancer in smokers. The AREDS2 study demonstrated that replacing beta-carotene with the carotenoids lutein and zeaxanthin maintained efficacy in slowing AMD progression while eliminating the cancer risk."
            }
        ]
    },
    # 2. Presbycusis
    {
        "title": "Presbycusis: Age-Related Hearing Loss",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} reports progressive difficulty hearing conversations, particularly at family gatherings or in noisy restaurants. The patient's family notes that {pronoun} turns the television volume extremely high. Audiometry demonstrates a bilateral, symmetric, sensorineural hearing loss that is most pronounced at high frequencies (above 2000 Hz)."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, the primary anatomical site of pathology, and the recommended intervention?",
                "options": [
                    "Presbycusis (age-related sensorineural hearing loss); progressive degeneration of the cochlear hair cells in the organ of Corti; refer for audiologic evaluation, hearing aid fitting, and communication strategies",
                    "Otosclerosis; calcification of the middle ear ossicles (stapes footplate); schedule immediate stapedectomy",
                    "Cerumen impaction; physical obstruction of the external auditory canal; perform immediate syringe irrigation",
                    "Acoustic neuroma (vestibular schwannoma); unilateral CN VIII compression; refer for urgent neurosurgery",
                    "Meniere's disease; endolymphatic hydrops; prescribe daily low-dose diuretics and sodium restriction"
                ],
                "answer": 0,
                "exp": "Presbycusis is the progressive, bilateral, symmetric high-frequency sensorineural hearing loss of aging. The primary cause is the loss of sensory hair cells in the basal turn of the cochlea (organ of Corti). Treatment involves hearing aids, assistive listening devices, and communication strategies (facing the speaker, reducing background noise)."
            },
            {
                "q": "Which of the following audiometric findings is characteristic of presbycusis?",
                "options": [
                    "Bilateral, symmetric, sloping sensorineural hearing loss at high frequencies (down-sloping audiogram)",
                    "Unilateral, asymmetric conductive hearing loss with an air-bone gap > 30 dB",
                    "Bilateral, symmetric conductive hearing loss restricted to low frequencies",
                    "A distinctive notch-like sensorineural hearing loss isolated at 4000 Hz",
                    "Presbycusis does not show any abnormalities on formal audiometry"
                ],
                "answer": 0,
                "exp": "The classic audiogram of presbycusis shows a bilateral, symmetric, gradually sloping sensorineural hearing loss, with high frequencies (responsible for consonant sounds, making speech hard to understand in noise) affected first and most severely."
            },
            {
                "q": "Which of the following is a major, documented consequence of untreated, severe presbycusis in older adults, emphasizing the need for early screening and hearing aid intervention?",
                "options": [
                    "Social isolation, depression, accelerated cognitive decline, and a two-fold increased risk of dementia",
                    "Progressive temporal lobe hypertrophy and visual field loss",
                    "Immediate risk of developing chronic, refractory bacterial meningitis",
                    "Severe hypertrophic cardiomyopathy due to auditory stress",
                    "There are no consequences; hearing loss is a benign, isolated aging change"
                ],
                "answer": 0,
                "exp": "Untreated hearing loss is a major, modifiable risk factor for dementia. It leads to social isolation, depression, sensory deprivation, and increased cognitive load (as the brain burns resources trying to decode degraded sounds), which accelerates cognitive decline."
            }
        ]
    },
    # 3. Cerumen impaction
    {
        "title": "Hearing Loss from Cerumen Impaction",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with moderate dementia presents with a sudden worsening of confusion and is refusing to participate in social activities. The staff notes the patient has stopped responding to verbal cues. Otoscopic examination reveals a dense, dark brown, solid plug of cerumen completely occluding the external auditory canal of both ears. The tympanic membrane cannot be visualized."
        ),
        "questions": [
            {
                "q": "What is the correct diagnosis, and what is the safest and most appropriate initial management?",
                "options": [
                    "Bilateral cerumen impaction causing conductive hearing loss and secondary cognitive worsening; perform cerumen removal using a curette, suction, or gentle warm water syringe irrigation (if the tympanic membrane is suspected to be intact), or use cerumenolytic drops",
                    "Presbycusis; proceed with immediate bilateral hearing aid fitting without removing the cerumen",
                    "Acute otitis media; prescribe a 10-day course of high-dose oral amoxicillin and leave the cerumen intact",
                    "Psychotic depression; initiate sertraline and risperidone immediately",
                    "Bilateral tympanic membrane perforation; schedule emergent tympanoplasty surgery"
                ],
                "answer": 0,
                "exp": "Cerumen impaction is a common, reversible cause of conductive hearing loss in the elderly. In patients with dementia, it can trigger sudden confusion, social withdrawal, and agitation due to sensory deprivation. Safe removal involves: cerumenolytics (carbamide peroxide), curette removal by a trained clinician, or gentle warm water irrigation (contraindicated if tympanic perforation or ear surgery history is present)."
            },
            {
                "q": "Which of the following represents a strict contraindication to the use of syringe irrigation with warm water for cerumen removal?",
                "options": [
                    "A suspected or known history of tympanic membrane perforation, ear tubes (tympanostomy), or prior middle ear surgery",
                    "The presence of mild cognitive impairment or moderate dementia",
                    "Bilateral symmetric high-frequency sensorineural hearing loss (presbycusis)",
                    "A patient age > 75 or history of osteoarthritis of the hip",
                    "Irrigation is always completely safe and has no contraindications"
                ],
                "answer": 0,
                "exp": "Syringing is strictly contraindicated if the eardrum is perforated or patent tympanostomy tubes are present, as the high-pressure water can enter the middle ear, causing severe pain, vertigo, infection, and damage to the ossicles."
            },
            {
                "q": "Why must water used for ear syringing/irrigation be strictly warmed to body temperature (approximately 37 C / 98.6 F) prior to administration?",
                "options": [
                    "Cold or hot water triggers a caloric reflex in the semicircular canals, causing sudden, severe vertigo, horizontal nystagmus, nausea, and vomiting",
                    "Cold water causes immediate, permanent necrosis of the external auditory canal skin",
                    "Hot water will liquefy the tympanic membrane, causing a permanent perforation",
                    "Warm water is required to maintain the viability of the commensal ear bacteria",
                    "There is no reason; water of any temperature (including ice-cold) is completely safe"
                ],
                "answer": 0,
                "exp": "Irrigating the ear with water that is significantly cooler or warmer than body temperature creates a temperature gradient that stimulates the vestibular system (caloric stimulation). This triggers rapid convective endolymph movement in the lateral semicircular canal, causing severe vertigo, nystagmus, and vomiting."
            }
        ]
    },
    # 4. Presbyopia
    {
        "title": "Presbyopia: The Loss of Near Vision",
        "age_range": (65, 80),
        "scenario": (
            "A {age}-year-old {gender} presents with a progressive difficulty reading books, menus, and text messages. The patient notes that {pronoun} must hold reading materials at arm's length to focus on the print. Distance vision remains excellent. Physical exam shows bilateral near visual acuity of 20/70, which improves to 20/20 with a standard positive (+2.00 diopter) corrective lens."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the primary underlying physiological mechanism?",
                "options": [
                    "Presbyopia; progressive loss of lens elasticity (stiffening of the lens) and, to a lesser extent, mild weakening of the ciliary muscle, preventing the lens from becoming sufficiently round to accommodate for near vision",
                    "Dry age-related macular degeneration; progressive atrophy of the retinal pigment epithelium in the fovea centralis",
                    "Bilateral open-angle glaucoma; progressive cupping of the optic nerve head due to elevated pressures",
                    "Cataract formation; progressive opacification of the crystalline lens driven by UV exposure",
                    "Presbyopia; progressive thickening and calcification of the cornea preventing light refraction"
                ],
                "answer": 0,
                "exp": "Presbyopia is the normal, age-related loss of accommodation (near vision focus). The primary mechanism is **decreased lens elasticity (stiffening of the crystalline lens)**, making it unable to increase its curvature (become rounder/more powerful) when the ciliary muscle contracts. The standard treatment is simple over-the-counter or prescription reading glasses (convex positive lenses)."
            },
            {
                "q": "Which of the following muscle/lens changes normally occurs during the physiologic process of 'Accommodation' when a healthy young adult focuses on a close object?",
                "options": [
                    "The ciliary muscle contracts, relaxing the zonule fibers, which allows the elastic crystalline lens to become rounder and more convex (increasing its refractive power)",
                    "The ciliary muscle relaxes, tightening the zonule fibers, which flattens the lens",
                    "The iris dilator muscle contracts, causing pupillary dilation to maximize light entry",
                    "The rectus muscles contract, pulling the globes backward into the orbit",
                    "The cornea actively alters its thickness and curvature to refract light"
                ],
                "answer": 0,
                "exp": "To focus near, the eye accommodates: the ciliary muscle (a circular sphincter) contracts, which moves the ciliary body forward and inward. This reduces tension on the suspensory ligaments (zonule fibers), allowing the natural elasticity of the lens to pull it into a rounder, thicker shape, boosting its refractive power."
            },
            {
                "q": "What type of corrective lens is used to treat presbyopia in patients who have normal baseline distance vision?",
                "options": [
                    "Convex (positive/plus) spherical lenses (reading glasses) that converge light rays before they enter the eye",
                    "Concave (negative/minus) spherical lenses that diverge light rays",
                    "Cylindrical lenses that correct asymmetric corneal curvature",
                    "Prismatic lenses that realign parallel visual axes",
                    "Opaque cosmetic lenses that block peripheral light entry"
                ],
                "answer": 0,
                "exp": "Convex (plus) lenses are converging lenses. They add refractive power, compensating for the aging lens's inability to increase its curvature, allowing near light rays to focus directly on the retina rather than behind it."
            }
        ]
    },
    # 5. Glaucoma screening in elderly
    {
        "title": "Glaucoma Screening: Optic Nerve Cupping",
        "age_range": (65, 90),
        "scenario": (
            "A {age}-year-old {gender} with a history of hypertension presents for a comprehensive eye evaluation. The patient has no vision complaints. Ocular examination reveals open anterior chamber angles bilaterally. Fundus exam shows a cup-to-disc ratio (CDR) of **0.7** in the right eye and **0.4** in the left eye, with asymmetric neuroretinal rim thinning. Intraocular pressure (IOP) is 24 mmHg OD and 16 mmHg OS."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what represents the standard screening workup for this condition?",
                "options": [
                    "Primary Open-Angle Glaucoma (POAG) (or suspect); diagnosed by asymmetric optic nerve cupping, elevated IOP, and visual field defects; perform automated visual field testing (perimetry), gonioscopy, and central corneal pachymetry",
                    "Age-related macular degeneration; diagnosed by drusen in the macula; perform an Amsler grid self-test",
                    "Normal-tension glaucoma; diagnosed by severe cupping with normal pressures; schedule a brain MRI",
                    "Superficial bacterial conjunctivitis; initiate topical tobramycin drops and repeat the fundus exam in 1 year",
                    "This is a normal anatomical variant; reassure the patient and repeat the eye exam in 5 years"
                ],
                "answer": 0,
                "exp": "Primary Open-Angle Glaucoma is characterized by progressive optic neuropathy (optic nerve cupping, CDR asymmetry > 0.2, rim thinning) often with elevated IOP. The screening and diagnostic workup includes: (1) perimetry (visual field testing), (2) gonioscopy (verifying the angle is open), and (3) pachymetry (measuring corneal thickness, as thin corneas can cause underestimation of true IOP)."
            },
            {
                "q": "Which of the following clinical findings on funduscopic examination of the optic nerve head is highly specific for glaucomatous damage rather than normal aging changes?",
                "options": [
                    "Asymmetric cupping (cup-to-disc ratio asymmetry > 0.2), neuroretinal rim thinning, and nasalization of the retinal vessels",
                    "A pale, swollen optic disc with blurred margins and splinter hemorrhages",
                    "A completely flat, pink optic disc with a cup-to-disc ratio of 0.1",
                    "Diffuse yellow-white hard exudates in a circinate pattern around the disc",
                    "Bilateral macular drusen and subretinal fluid accumulation"
                ],
                "answer": 0,
                "exp": "Glaucoma selectively damages the nerve fibers at the border of the disc. This causes 'cupping' (expansion of the central white cup relative to the pink neuroretinal rim). Key signs are CDR asymmetry > 0.2, rim thinning (especially inferior/superior, violating the ISNT rule), and nasal displacement of the disc vessels."
            },
            {
                "q": "Why is the measurement of central corneal thickness (pachymetry) a critical component of the comprehensive workup for suspected open-angle glaucoma?",
                "options": [
                    "Central corneal thickness directly affects the accuracy of applanation tonometry: a thin cornea leads to an underestimation of the true intraocular pressure, while a thick cornea leads to an overestimation",
                    "A thin cornea is a direct marker of severe systemic Vitamin D and calcium deficiency",
                    "Corneal thickness is used to calculate the clearance of topical beta-blocker drops",
                    "A thick cornea is diagnostic of acute angle-closure glaucoma",
                    "Pachymetry is used to verify that the patient has not undergone cataract surgery"
                ],
                "answer": 0,
                "exp": "Goldmann applanation tonometry is calibrated for a standard corneal thickness (540 microns). A thin cornea (e.g., 500 microns) is 'soft' and easily indented, giving a falsely low IOP reading. This can lead to missed diagnoses in patients who actually have dangerously high pressures."
            }
        ]
    },
    # 6. Hearing aid fitting and compliance
    {
        "title": "Hearing Aid Compliance and Troubleshooting",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with a history of severe presbycusis was fitted with bilateral, behind-the-ear hearing aids 3 months ago. The patient's family reports that the patient refuses to wear them, complaining that 'they make a screeching noise, make {possessive} own voice sound like {pronoun} is speaking in a barrel, and are too difficult to put in.'"
        ),
        "questions": [
            {
                "q": "What is the correct clinical approach to addressing this patient's hearing aid non-compliance?",
                "options": [
                    "Refer back to the audiologist to check the physical fit (earmold seal to prevent acoustic feedback/screeching), adjust the digital settings to address the occlusion effect (barrel voice), provide detailed training, and recommend assistive tools (e.g., magnetic insertion wand)",
                    "Advise the family to respect the patient's choice and return the hearing aids, as non-compliance cannot be resolved in patients over age 80",
                    "Prescribe low-dose oral haloperidol nightly to treat the patient's sensory agitation, and continue forcing the hearing aids",
                    "Instruct the patient to wear the hearing aids only during sleep to promote adaptation",
                    "Immediately refer the patient to an otolaryngologist for a bilateral surgical cochlear implant"
                ],
                "answer": 0,
                "exp": "Hearing aid non-compliance is extremely high (up to 50%). Common, treatable barriers are: (1) **Acoustic feedback (screeching)**: caused by an improper earmold seal leaking sound back to the microphone; (2) **Occlusion effect (barrel voice)**: caused by trapped low-frequency sounds in the canal, treatable by venting the earmold or digital adjustments; and (3) **Dexterity issues**: managed by larger devices (in-the-ear), simpler battery doors, or assistive insertion tools."
            },
            {
                "q": "What is the primary cause of the loud, high-pitched 'screeching' or whistling noise (acoustic feedback) that frequently occurs when a hearing aid is inserted?",
                "options": [
                    "Amplified sound from the receiver leaking out of the ear canal and being re-amplified by the microphone, creating an audio loop",
                    "The battery door being left partially open, causing an electrical short circuit",
                    "Direct microbial infection of the external auditory canal by Pseudomonas bacteria",
                    "A toxic neurological reaction of the vestibulocochlear nerve to digital signals",
                    "The volume being set too low, triggering an automated system warning alarm"
                ],
                "answer": 0,
                "exp": "Acoustic feedback is the same loop effect seen when a microphone is held close to a speaker. In a hearing aid, if the earmold does not fit snugly, sound escapes from the canal and is picked up by the microphone, creating a feedback squeal. It is resolved by improving the fit or clearing cerumen."
            },
            {
                "q": "Which of the following hearing aid designs is generally preferred for older adults with severe osteoarthritis or parkinsonian hand tremors who struggle with fine motor tasks?",
                "options": [
                    "Larger, In-the-Ear (ITE) or Behind-the-Ear (BTE) models with rechargeable batteries, rather than tiny Completely-in-the-Canal (CIC) models that require micro-battery changes",
                    "Tiny Completely-in-the-Canal (CIC) models that are completely invisible",
                    "Disposable hearing aids that are replaced weekly by the physician",
                    "Large, heavy over-ear headphones connected by a 10-foot wire to a portable amplifier box",
                    "Cochlear implants, which require no physical user maintenance"
                ],
                "answer": 0,
                "exp": "Tiny hearing aids (like CICs) require high manual dexterity to insert and require frequent, delicate changes of microscopic zinc-air batteries (size 10). Larger models (BTE/ITE) with magnetic rechargeable cradles are much easier for arthritic or tremulous hands to manage."
            }
        ]
    },
    # 7. Visual impairment and falls risk
    {
        "title": "Visual Impairment and Falls Prevention",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with a history of severe bilateral cataracts and a recent fall presents for a health evaluation. The patient notes that {possessive} vision has become progressively blurry, and {pronoun} struggles to see steps or cracks in the sidewalk. Visual acuity is 20/80 bilaterally. The physician plans a visual intervention to prevent future falls."
        ),
        "questions": [
            {
                "q": "According to falls prevention guidelines, what represents the most effective and evidence-based visual intervention for this patient?",
                "options": [
                    "Refer for cataract surgery to restore visual acuity and contrast sensitivity, and recommend single-vision distance glasses for outdoor walking rather than bifocal or multifocal lenses",
                    "Advise the patient to avoid all visual corrections and wear dark sunglasses outdoors to prevent glare",
                    "Prescribe a nightly low-dose benzodiazepine to reduce visual anxiety and continue walking normally",
                    "Recommend the patient wear a patch over one eye to eliminate double vision while walking outdoors",
                    "Cataract surgery is strictly contraindicated in patients over age 80 due to high risk of acute glaucoma"
                ],
                "answer": 0,
                "exp": "Visual impairment is a powerful, modifiable falls risk factor. Cataract surgery significantly reduces falls by restoring visual acuity, depth perception, and contrast sensitivity. Crucially, older adults should use **single-vision distance glasses** when walking outdoors, as bifocals/multifocals blur the ground and steps when looking down, directly causing trips and falls."
            },
            {
                "q": "Why are bifocal or progressive multifocal lenses discouraged for outdoor mobilization and walking in older adults who are at high risk for falls?",
                "options": [
                    "The lower segment of the lens (designed for reading) blurs the patient's view of the ground, steps, and obstacles when they look down, severely impairing depth perception",
                    "Bifocal lenses cause rapid, severe corneal calcification in patients over age 70",
                    "The line dividing the lens segments directly triggers acute optical seizures in dementia",
                    "Multifocal lenses accelerate the rate of age-related macular degeneration",
                    "None of the options; bifocals are highly recommended for all high-risk walkers"
                ],
                "answer": 0,
                "exp": "Bifocals/multifocals have a lower reading segment. When a patient looks down to step over a curb or walk down stairs, they look through this reading segment, which blurs the distant ground. This distorts depth perception and spatial awareness, causing missteps."
            },
            {
                "q": "Which of the following environmental lighting modifications is recommended by occupational therapists to assist visually impaired older adults in navigating their homes safely?",
                "options": [
                    "Increasing illumination in all hallways and stairwells, installing nightlights, and using high-contrast colored tape on the edges of all steps",
                    "Using low-wattage dim red bulbs in all rooms to prevent visual fatigue",
                    "Applying high-gloss reflective paint to the floors to maximize ambient light reflection",
                    "Keeping the home dimly lit during the day and completely dark at night",
                    "Installing strobe lights in the hallways to stimulate visual-spatial reflexes"
                ],
                "answer": 0,
                "exp": "Visually impaired elders require high illumination to compensate for decreased contrast sensitivity. Installing high-wattage bulbs, nightlights along paths, and high-contrast markers on step edges are effective, low-cost interventions to prevent home falls."
            }
        ]
    },
    # 8. Dual sensory impairment
    {
        "title": "Dual Sensory Impairment: Vision and Hearing Loss",
        "age_range": (70, 95),
        "scenario": (
            "A {age}-year-old {gender} with a history of both dry age-related macular degeneration and severe presbycusis is admitted to a long-term care facility. The nursing staff notes that the patient has become highly withdrawn, refuses to leave {possessive} room, and shows signs of severe depression and cognitive decline. The physician evaluates the patient for **dual sensory impairment**."
        ),
        "questions": [
            {
                "q": "What represents the clinical significance and management of dual sensory impairment in the elderly?",
                "options": [
                    "Dual sensory impairment (vision + hearing loss) carries a massive risk for depression, profound social isolation, cognitive decline, and falls; optimize both sensory modalities immediately (glasses, hearing aids, pocket amplifiers) and use tactile communication",
                    "The two impairments compensate for each other, resulting in a normal overall functional status; no interventions are needed",
                    "Initiate high-dose antipsychotic and antidepressant therapy immediately as the primary treatment",
                    "Place the patient in strict sensory isolation to prevent sensory overload and agitation",
                    "Dual sensory impairment is a rare, genetic condition that does not occur in normal aging"
                ],
                "answer": 0,
                "exp": "Dual sensory impairment (the combination of vision and hearing loss) is common and devastating. It cuts off the patient's primary channels of communication and environmental awareness, leading to a 4-fold risk of depression, rapid cognitive decline, and falls. Immediate optimization of both modalities (proper glasses, hearing aids, pocket talkers/amplifiers) and social stimulation are essential."
            },
            {
                "q": "Which of the following simple, portable assistive communication devices is highly useful in a busy clinical setting to communicate with a patient who has severe hearing loss and has misplaced their hearing aids?",
                "options": [
                    "A portable personal amplifier (Pocket Talker) with headphones and a microphone",
                    "A high-frequency diagnostic tuning fork (512 Hz)",
                    "A standard acoustic stethoscope placed on the patient's forehead",
                    "A computerized speech-to-braille generator",
                    "Writing in microscopic print on a whiteboard"
                ],
                "answer": 0,
                "exp": "A Pocket Talker is an invaluable bedside tool. The patient wears standard headphones connected to a small, battery-powered amplifier, and the clinician speaks into a microphone, allowing clear, loud, direct communication without shouting, which distorts sound and violates privacy."
            },
            {
                "q": "What is the recommended communication strategy when speaking to an older adult who has dual sensory impairment?",
                "options": [
                    "Face the patient directly at eye level in a well-lit room, speak slowly and clearly in a normal-to-low pitch, minimize background noise, and use simple visual/tactile cues",
                    "Stand behind the patient and shout directly into their ear to maximize volume",
                    "Speak rapidly in a very high-pitched voice to stimulate the high-frequency auditory receptors",
                    "Avoid all verbal communication and rely exclusively on a sign language interpreter",
                    "Dim the lights and play loud static white noise in the background to mask distractions"
                ],
                "answer": 0,
                "exp": "To communicate effectively: face the patient (allowing lip-reading and visual cues), ensure good lighting, speak in a normal or slightly lower pitch (high pitch is lost first in presbycusis), speak slowly, and minimize background noise (turn off TV, close door)."
            }
        ]
    },
    # 9. Wet AMD
    {
        "title": "Wet AMD: The Sudden Vision Loss",
        "age_range": (65, 90),
        "scenario": (
            "A {age}-year-old {gender} with a history of dry AMD presents to the clinic with a sudden, dramatic distortion and worsening of vision in {possessive} {eye_side} eye that began yesterday. The patient notes that straight lines (like doorframes or telephone poles) appear highly bent and wavy. visual acuity in the affected eye has dropped from 20/40 to 20/150."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the gold-standard treatment that requires urgent referral?",
                "options": [
                    "Wet (exudative) Age-Related Macular Degeneration (AMD) with active choroidal neovascularization; urgent ophthalmology referral for intravitreal anti-VEGF injections (e.g., ranibizumab, aflibercept, or bevacizumab)",
                    "Dry AMD progression; double the daily dose of AREDS2 vitamins and schedule follow-up in 6 months",
                    "Acute angle-closure glaucoma; perform immediate bedside laser peripheral iridotomy",
                    "Retinal vein occlusion; prescribe daily high-dose aspirin and schedule a carotid duplex",
                    "Corneal ulcer; prescribe topical ciprofloxacin drops every 15 minutes"
                ],
                "answer": 0,
                "exp": "The sudden onset of severe vision loss and metamorphopsia (straight lines appearing wavy) in a dry AMD patient is diagnostic of conversion to wet AMD. This is driven by choroidal neovascularization (abnormal blood vessels sprouting under the retina), which leaks fluid and blood. Urgent treatment with intravitreal anti-VEGF injections is highly effective in halting leakage and often restoring vision, preventing permanent macular scarring."
            },
            {
                "q": "What is the primary physiological driver of the abnormal, fragile blood vessel growth (choroidal neovascularization) in wet age-related macular degeneration?",
                "options": [
                    "Vascular Endothelial Growth Factor (VEGF)",
                    "Tumor Necrosis Factor-alpha (TNF-alpha)",
                    "Erythropoietin (EPO)",
                    "Insulin-like Growth Factor-1 (IGF-1)",
                    "Thyroid Stimulating Hormone (TSH)"
                ],
                "answer": 0,
                "exp": "Retinal ischemia and chronic inflammation stimulate the overexpression of Vascular Endothelial Growth Factor (VEGF). VEGF drives the proliferation of abnormal, fragile, leaky blood vessels from the choroid into the subretinal space, leading to fluid accumulation and hemorrhage."
            },
            {
                "q": "Which of the following clinical findings on dilated funduscopic examination is diagnostic of wet AMD, distinguishing it from stable dry AMD?",
                "options": [
                    "Subretinal fluid, gray-green choroidal neovascular membranes, and macular hemorrhage",
                    "Large yellow-white macular drusen without any fluid or blood",
                    "A pale optic disc with severe asymmetric cup-to-disc ratio",
                    "Neovascularization of the optic disc and diffuse retinal dot-and-blot hemorrhages",
                    "Bilateral dense nuclear sclerosis of the crystalline lens"
                ],
                "answer": 0,
                "exp": "Dilated fundus exam in wet AMD classically reveals subretinal or intraretinal fluid, subretinal hemorrhage (red blood in the macula), lipid exudates, and gray-green choroidal neovascular membranes, which are absent in dry AMD."
            }
        ]
    },
    # 10. Tinnitus management
    {
        "title": "Tinnitus and the Persistent Ringing",
        "age_range": (65, 85),
        "scenario": (
            "A {age}-year-old {gender} presents with a {duration}-month history of persistent, high-pitched ringing in both ears (tinnitus). The patient describes the noise as constant and most bothersome at night in a quiet bedroom, causing significant anxiety and insomnia. Audiometry shows bilateral symmetric high-frequency hearing loss (presbycusis)."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what represents the most appropriate, evidence-based management strategy?",
                "options": [
                    "Subjective tinnitus secondary to presbycusis; recommend a sound generator (white noise machine) to mask the sound, fit with hearing aids (which amplifies ambient sound to mask the ringing), and discuss Tinnitus Retraining Therapy (TRT) or CBT",
                    "Acoustic neuroma (vestibular schwannoma); refer the patient for immediate surgical resection of the auditory nerve",
                    "Objective tinnitus from a dural arteriovenous fistula; schedule urgent neurointerventional embolization",
                    "Idiopathic tinnitus; prescribe daily high-dose oral meclizine and alprazolam to suppress the auditory cortex",
                    "Cerumen impaction; perform aggressive bedside syringe irrigation with ice-cold saline"
                ],
                "answer": 0,
                "exp": "Subjective tinnitus is common in older adults with age-related hearing loss. The brain compensates for the lost auditory input by hyperactivating auditory pathways, creating a phantom ringing. Management is non-pharmacological: hearing aids (which amplify external sounds, masking the tinnitus), sound masking (white noise at night), and CBT to reduce the emotional distress associated with the noise."
            },
            {
                "q": "Which of the following clinical features, if present in a patient with tinnitus, represents a 'red flag' that requires an urgent MRI of the brain and internal auditory canals to rule out a retrocochlear tumor (e.g., acoustic neuroma)?",
                "options": [
                    "Unilateral (one-sided) tinnitus accompanied by asymmetric sensorineural hearing loss",
                    "Bilateral, symmetric, high-pitched constant ringing",
                    "Tinnitus that is most prominent in quiet environments at night",
                    "The absence of vertigo, dizziness, or facial weakness",
                    "Tinnitus that improves when wearing standard reading glasses"
                ],
                "answer": 0,
                "exp": "Unilateral tinnitus and asymmetric sensorineural hearing loss are classic 'red flags' for a vestibular schwannoma (acoustic neuroma), a benign tumor of CN VIII. Bilateral, symmetric tinnitus with symmetric hearing loss is typical of benign presbycusis."
            },
            {
                "q": "Which of the following represents a highly effective, evidence-based psychotherapeutic approach to reduce the severe distress, anxiety, and insomnia associated with chronic, refractory tinnitus?",
                "options": [
                    "Cognitive Behavioral Therapy (CBT)",
                    "Electroconvulsive Therapy (ECT)",
                    "Psychoanalysis for childhood trauma",
                    "Systemic desensitization using high-decibel sirens",
                    "Hypnotherapy to induce permanent auditory amnesia"
                ],
                "answer": 0,
                "exp": "CBT does not silence the tinnitus but helps patients change their emotional and behavioral responses to it. It teaches coping strategies, reduces the autonomic distress and anxiety associated with the sound, and improves sleep, leading to habituation."
            }
        ]
    }
]
