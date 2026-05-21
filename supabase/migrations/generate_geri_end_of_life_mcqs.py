import json
import random

random.seed(42)

topic_slug = 'geri-end-of-life'

# ============================================================
# Pools of Variables for Randomization
# ============================================================
female_names = [
    "Margaret", "Eleanor", "Dorothy", "Ruth", "Mildred", "Frances", "Elizabeth",
    "Helen", "Alice", "Florence", "Gladys", "Marie", "Lillian", "Evelyn", "Jean",
    "Rose", "Irene", "Shirley", "Hazel", "Gertrude", "Louise", "Grace", "Ruby",
    "Virginia", "Catherine", "Martha", "Edna", "Phyllis", "Clara", "Edith", "Beatrice",
    "Esther", "Lois", "Bernice", "Martha", "Norma", "Phyllis", "Gladys", "Alice"
]

male_names = [
    "James", "John", "Robert", "William", "Charles", "Thomas", "Walter", "Arthur",
    "Albert", "Harold", "Richard", "Joseph", "Henry", "George", "Edward", "Raymond",
    "Paul", "Donald", "Harry", "Ralph", "Kenneth", "David", "Eugene", "Howard",
    "Frank", "Lawrence", "Herbert", "Roy", "Clarence", "Stanley", "Bernard",
    "Leonard", "Edwin", "Herbert", "Carl", "Earl", "Roy", "Fred", "Louis"
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
cancer_types_pool = [
    "metastatic non-small cell lung cancer",
    "stage IV pancreatic adenocarcinoma",
    "metastatic colorectal cancer",
    "advanced glioblastoma",
    "stage IV ovarian cancer",
    "advanced metastatic breast cancer"
]
opioids_pool = ["morphine", "codeine", "oxycodone"]
alternative_opioids_pool = ["fentanyl", "hydromorphone", "methadone"]
laxatives_pool = ["senna", "bisacodyl"]
secretions_meds_pool = ["glycopyrrolate", "scopolamine transdermal patch", "hyoscyamine"]
fast_stages_pool = ["7c", "7d", "7e"]
relations_pool = ["daughter", "son", "spouse", "brother", "sister"]
doses_pool = [60, 90, 120, 150]
fentanyl_doses_pool = [25, 50, 75, 100]

# ============================================================
# 35 UNIQUE TEMPLATES — Geriatrics: End-of-life & palliative care
# ============================================================
templates = [
    # ===== GOALS OF CARE (Templates 1-8) =====
    # T1: Advanced dementia & artificial nutrition/hydration
    {
        "q": "A {age}-year-old {gender} named {name} with advanced dementia (FAST stage {fast_stage}) is admitted to the hospital with a third episode of aspiration pneumonia in the past {months} months. {possessive_cap} {relation} is highly distressed, noting that the patient is eating very little, and asks about placing a percutaneous endoscopic gastrostomy (PEG) feeding tube. According to the American Geriatrics Society (AGS) guidelines, which of the following is the most appropriate counseling and clinical recommendation?",
        "options": [
            "Recommend continuing careful hand-feeding and comfort-focused care; explain that PEG tube placement in advanced dementia does not prolong survival, reduce the risk of aspiration pneumonia, improve nutritional parameters, or enhance patient comfort",
            "Recommend immediate PEG tube placement to prevent malnutrition, as feeding tubes have been shown to significantly prolong life and prevent decubitus ulcers in advanced dementia",
            "Suggest starting total parenteral nutrition (TPN) through a central line as a safer and more effective alternative to tube feeding in advanced dementia",
            "Recommend a temporary nasogastric (NG) tube for 6 months to see if {pronoun} recovers {possessive} baseline cognitive function and swallowing capacity",
            "Advise the family that a PEG tube is legally mandatory once a patient with dementia is unable to meet their daily caloric needs orally"
        ],
        "answer": 0,
        "exp": "For patients with advanced dementia (FAST stage 7), clinical evidence demonstrates that **percutaneous endoscopic gastrostomy (PEG) feeding tubes do not prolong survival, reduce aspiration risk, improve nutritional status, or enhance comfort**. Feeding tubes are associated with significant complications, including local infection, tube migration, diarrhea, abdominal bloating, and increased use of physical/chemical restraints to prevent the patient from pulling the tube. Instead, **careful hand-feeding (assisted oral feeding)** should be continued, focusing on patient comfort and flavor preferences. Palliative care consultation is highly valuable to support the family. (Ref: Hazzard's Ch. 82; AGS Feeding Tubes Position Statement; UWorld Step 2 CK)"
    },
    # T2: SPIKES protocol for delivering bad news
    {
        "q": "A {age}-year-old {gender} named {name} has recently undergone staging workup for progressive dyspnea and weight loss, revealing {cancer_type}. The primary care physician needs to deliver this diagnosis. Which of the following best describes the correct clinical application of the 'S' (Setting) and 'P' (Perception) steps of the SPIKES protocol for delivering bad news?",
        "options": [
            "Arrange a private, quiet setting with comfortable seating, ask the patient who else they would like to have present, and then ask open-ended questions to assess what the patient already knows or suspects about their medical condition before giving any information",
            "Deliver the diagnosis immediately in the hospital hallway to ensure timely communication, and skip assessing the patient's understanding to save time",
            "Ensure the patient is alone to prevent family interference, and immediately show the CT scans to explain the tumor size in detail",
            "Use highly technical medical jargon to establish clinical authority, and then ask the patient to repeat the staging classification",
            "Schedule the meeting in a noisy clinic waiting area to reduce the patient's anxiety, and ask the patient's family to step out during the disclosure"
        ],
        "answer": 0,
        "exp": "The **SPIKES protocol** is a 6-step framework for delivering bad news: (1) **S - Setting**: Arrange a private, quiet environment, sit down, make eye contact, and invite key family members. (2) **P - Perception**: Assess what the patient understands about their illness using open-ended questions (e.g., 'What is your understanding of why we did the CT scan?'). (3) **I - Invitation**: Ask how much detail the patient wants to know. (4) **K - Knowledge**: Deliver the information in small, clear chunks without jargon. (5) **E - Empathy**: Address emotions with empathetic responses. (6) **S - Strategy & Summary**: Formulate a clear plan and summarize. (Ref: Oxford Handbook of Palliative Care; UWorld Step 2 CK; First Aid Step 2 CK)"
    },
    # T3: Resolving family conflict/surrogate dispute
    {
        "q": "A {age}-year-old {gender} named {name} is admitted to the ICU in a coma following a severe anoxic brain injury. {pronoun_cap} has no written advance directives. {possessive_cap} {relation}1 insists that the patient was a 'fighter' and wants 'everything done,' including prolonged mechanical ventilation and hemodialysis. However, {possessive} {relation}2 insists that the patient previously stated {pronoun} would 'never want to be kept alive on machines.' What is the most appropriate next step for the medical team to resolve this conflict?",
        "options": [
            "Facilitate a multidisciplinary family meeting involving palliative care, social work, and ethics to redirect the discussion toward the patient's values, previously expressed wishes, and what the patient would decide for themselves (substituted judgment)",
            "Follow the directions of the {relation}1 because they are requesting active treatment, which is legally favored over withdrawal of care",
            "Administer a trial of mechanical ventilation and dialysis indefinitely until the surrogates reach a unanimous written agreement",
            "File an emergency petition to obtain a court order to appoint a neutral guardian, bypassing both family members immediately",
            "Consult the hospital ethics committee to unilaterally withdraw all life support against the express wishes of the {relation}1"
        ],
        "answer": 0,
        "exp": "When surrogate decision-makers disagree on the plan of care and no clear written advance directive exists, the most appropriate initial step is to **facilitate a multidisciplinary family meeting**. This meeting should include the primary medical team, palliative care, social work, chaplaincy, and ethics if needed. The goal is to defuse tension, provide clear prognostic information, and redirect the surrogates to focus on the **substituted judgment standard** (what the patient *would* want based on their known values and statements) rather than their own personal desires or guilt. Unilateral withdrawal or immediate court intervention should be avoided unless extensive mediation fails. (Ref: Hazzard's Ch. 21 & 82; UWorld Step 2 CK)"
    },
    # T4: CPR outcomes and prognosis in frail older adults
    {
        "q": "A {age}-year-old {gender} named {name} with advanced multi-organ dysfunction, severe frailty, and end-stage congestive heart failure is discussing cardiopulmonary resuscitation (CPR) preferences during an annual wellness visit. What is the most accurate, evidence-based information the clinician should provide to {name} regarding the outcomes of CPR in this clinical context?",
        "options": [
            "The probability of surviving to hospital discharge after in-hospital CPR is very low (typically less than 10%, and under 2% in patients with advanced multi-organ failure), and survivors often sustain rib fractures, ischemic brain injury, and severe functional decline",
            "CPR is highly successful in older adults, with over 50% of octogenarians returning to their baseline functional and cognitive state after cardiac arrest",
            "Bystander CPR is completely ineffective in older adults and should never be attempted outside of a hospital setting",
            "Intubation and chest compressions are routinely performed in hospice settings because they are required to qualify for Medicare coverage",
            "The survival rate after CPR is identical across all age groups and is unaffected by the presence of underlying terminal illnesses"
        ],
        "answer": 0,
        "exp": "In older adults, particularly those with **severe frailty, advanced dementia, or metastatic cancer**, the outcomes of CPR are very poor. The probability of **survival to hospital discharge** after in-hospital cardiac arrest is **less than 10-15%** overall, and **under 2-3%** for patients with end-stage chronic diseases. Furthermore, CPR in this population frequently causes **severe morbidity**, including rib and sternal fractures, liver/spleen lacerations, prolonged mechanical ventilation, and hypoxic-ischemic brain damage. Providing this realistic prognostic information is crucial to help patients make informed decisions about their resuscitation status. (Ref: Hazzard's Ch. 82; Current Diagnosis & Treatment: Geriatrics Ch. 11; UWorld Step 2 CK)"
    },
    # T5: Terminal weaning / mechanical ventilation withdrawal
    {
        "q": "A {age}-year-old {gender} named {name} with end-stage respiratory failure due to severe COPD has decided, in conjunction with {possessive} family, to undergo withdrawal of mechanical ventilation (terminal weaning) and focus entirely on comfort. What is the most appropriate pharmacological strategy to manage the expected tachypnea, dyspnea, and air hunger during this process?",
        "options": [
            "Administer an intravenous infusion of morphine titrated to comfort, as opioids are the gold standard for relieving terminal dyspnea by reducing respiratory drive and the perception of air hunger",
            "Start an intravenous drip of albuterol and saline to dilate the airways and increase oxygen delivery to the brainstem",
            "Administer high-dose intravenous furosemide and hold all sedative medications to ensure the respiratory drive remains fully stimulated",
            "Infuse intravenous naloxone to prevent opioid-induced respiratory depression and maintain spontaneous breathing",
            "Use deep endotracheal suctioning every 10 minutes as the primary non-pharmacological method to clear secretions and relieve dyspnea"
        ],
        "answer": 0,
        "exp": "During the withdrawal of mechanical ventilation (terminal weaning), the primary clinical goal is to prevent **dyspnea, tachypnea, and air hunger**. **Intravenous opioids (such as morphine)** are the **first-line agents** and gold standard for this purpose. Opioids act centrally to reduce the perception of air hunger, blunt the respiratory drive, and decrease systemic vascular resistance (reducing pulmonary congestion). Benzodiazepines (e.g., midazolam or lorazepam) can be added as adjuncts to manage concurrent anxiety or agitation. Deep suctioning is painful and stimulates airway reflexes, worsening distress, and should be avoided. (Ref: Palliative Care: A Practical Guide Ch. 5; Oxford Handbook of Palliative Care; UWorld Step 2 CK)"
    },
    # T6: Malignant bowel obstruction management
    {
        "q": "A {age}-year-old {gender} named {name} with inoperable, recurrent peritoneal carcinomatosis from {cancer_type} is admitted with a malignant bowel obstruction. {pronoun_cap} has severe, crampy abdominal pain, distension, and frequent vomiting of feculent material. Surgery is ruled out. Which of the following pharmacological regimens is most appropriate to manage {possessive} symptoms?",
        "options": [
            "Initiate intravenous octreotide to reduce gastrointestinal secretions and peristalsis, and intravenous dexamethasone to decrease tumor-associated edema; avoid prokinetics like metoclopramide",
            "Prescribe oral metoclopramide at high doses to stimulate gastric emptying and force the bowel obstruction to clear",
            "Initiate a aggressive bowel regimen with oral senna, docusate, and polyethylene glycol to dissolve the obstruction",
            "Administer a continuous intravenous infusion of loperamide to stop the vomiting by halting all intestinal motility",
            "Insert a nasogastric tube for permanent decompression and advise that no medications can manage these symptoms"
        ],
        "answer": 0,
        "exp": "Malignant bowel obstruction in advanced, inoperable cancer is managed medically with a focus on symptom control: (1) **Octreotide (somatostatin analog)** is highly effective; it reduces gastrointestinal secretions, splanchnic blood flow, and peristalsis, thereby relieving cramping pain, nausea, and vomiting. (2) **Corticosteroids (dexamethasone)** reduce tumor-associated inflammation and edema, which may partially restore patency. (3) **Anticholinergics (e.g., hyoscyamine, glycopyrrolate)** reduce colic. **Prokinetics like metoclopramide are contraindicated** in complete mechanical obstruction as they increase colic and risk bowel perforation. (Ref: Oxford Handbook of Palliative Care; Hazzard's Ch. 82; UWorld Step 2 CK)"
    },
    # T7: ICU utility vs. Palliative unit in end-stage disease
    {
        "q": "A {age}-year-old {gender} named {name} with metastatic {cancer_type} is admitted to the emergency department with severe, refractory pain and respiratory distress due to extensive pulmonary metastases. {possessive_cap} oncologist estimates {possessive} prognosis is days to weeks. The emergency physician is considering ICU admission for intubation and line placement. What is the most appropriate clinical reasoning regarding ICU utility vs. palliative care unit admission in this scenario?",
        "options": [
            "Admit the patient to a palliative care unit or inpatient hospice bed, as ICU admission would subject the patient to painful, invasive interventions that are non-beneficial and run counter to comfort-focused goals of care",
            "Admit the patient to the ICU immediately, as all patients with respiratory distress must be intubated regardless of underlying terminal illnesses",
            "Recommend home discharge with a prescription for oral NSAIDs, as there are no inpatient resources available for comfort care",
            "Initiate a trial of ICU-level care for 2 weeks to see if the pulmonary metastases regress with aggressive mechanical ventilation",
            "Advise the patient that they must undergo cardiopulmonary resuscitation in the ICU before they can qualify for palliative care services"
        ],
        "answer": 0,
        "exp": "For patients with end-stage terminal illnesses (such as metastatic cancer with a prognosis of days to weeks), **admission to an ICU is generally non-beneficial** and can cause significant harm by subjecting the patient to painful, invasive, and futile interventions (e.g., intubation, central venous lines, arterial lines) that do not align with comfort-focused goals. Instead, the patient should be admitted to a **dedicated palliative care unit or inpatient hospice facility** where the interdisciplinary team can aggressively manage pain, dyspnea, and delirium in a supportive environment. (Ref: Hazzard's Ch. 82; Palliative Care: A Practical Guide; UWorld Step 2 CK)"
    },
    # T8: Shared decision making in advanced heart failure
    {
        "q": "A {age}-year-old {gender} named {name} with NYHA Class IV ischemic cardiomyopathy has had {hospitalizations} hospitalizations for decompensated heart failure in the past {months} months. Despite optimal medical therapy (beta-blocker, ACE inhibitor, mineralocorticoid receptor antagonist, and SGLT2 inhibitor), {pronoun} has dyspnea at rest and is increasingly fatigued. Which of the following is the most appropriate communication strategy regarding prognosis and goals of care?",
        "options": [
            "Initiate a proactive, shared decision-making discussion to review the progressive nature of end-stage heart failure, explain the poor 1-year prognosis, and explore {possessive} values regarding future therapies (e.g., home inotropes, ICD deactivation, or hospice care)",
            "Avoid discussing prognosis to prevent taking away the patient's hope, and reassure {pronoun} that {possessive} heart failure will completely resolve with a new medication dose",
            "Advise the patient that they must immediately receive a left ventricular assist device (LVAD) or heart transplant, as there are no comfort-focused options for heart failure",
            "Unilaterally deactivate the patient's implantable cardioverter-defibrillator (ICD) during the clinic visit without discussing it with the patient or family",
            "Tell the patient that because they have heart failure instead of cancer, they are ineligible for any palliative care or hospice services"
        ],
        "answer": 0,
        "exp": "Advanced heart failure (NYHA Class IV) carries a poor prognosis (approx. 50% 1-year mortality). Clinicians should initiate **proactive, shared decision-making discussions** about: (1) The progressive nature of the disease, (2) Expected prognosis, (3) Preferences for life-sustaining treatments (e.g., intubation, chest compressions), (4) **ICD deactivation** (to prevent painful shocks during dying), (5) **Palliative treatments** (e.g., low-dose opioids for dyspnea, home inotropic support), and (6) **Hospice eligibility**. Avoiding these discussions leads to crisis-driven, non-aligned ICU interventions. (Ref: Hazzard's Ch. 39 & 82; AGS Geriatrics At Your Fingertips; UWorld Step 2 CK)"
    },

    # ===== ADVANCE DIRECTIVES (Templates 9-17) =====
    # T9: Living Will vs. DPOA-HC / Healthcare Proxy
    {
        "q": "A {age}-year-old {gender} named {name} is admitted with a massive hemorrhagic stroke and is unable to communicate. {pronoun_cap} has a valid Living Will stating {pronoun} does 'not want mechanical ventilation or artificial life support under any circumstances.' However, {possessive} designated Durable Power of Attorney for Healthcare (DPOA-HC), {possessive} {relation}, is highly emotional and insists that the medical team intubate the patient and place {pronoun} on a ventilator. Which of the following is the correct ethical and legal priority?",
        "options": [
            "The Living Will represents the patient's autonomous wishes and takes legal precedence over the surrogate's contradictory request; the physician must explain this to the surrogate, refuse intubation, and focus on comfort-focused care",
            "The DPOA-HC has absolute authority to override any written documents, so the medical team must immediately intubate the patient",
            "The physician should perform the intubation but secretly plan to extubate the patient once the surrogate leaves the hospital",
            "The living will is only legally binding if it was signed in the presence of a judge, so it should be ignored in the acute hospital setting",
            "The medical team should refer the case to the state medical board to decide, maintaining mechanical ventilation in the interim"
        ],
        "answer": 0,
        "exp": "A **Living Will** is a legal document that outlines a patient's specific medical preferences (e.g., refusing intubation, feeding tubes) if they lose decision-making capacity and have a terminal condition or persistent vegetative state. A **Durable Power of Attorney for Healthcare (DPOA-HC)** designates a surrogate decision-maker. Ethically and legally, **the surrogate's role is to enforce the patient's known wishes (substituted judgment)**, not their own desires. If a surrogate requests an intervention (e.g., intubation) that directly contradicts a clear, specific directive in the patient's valid Living Will, the **Living Will takes precedence**. The clinician should counsel the surrogate, review the document together, and align the care plan with the patient's documented wishes. (Ref: Hazzard's Ch. 21; UWorld Step 2 CK; First Aid Step 2 CK)"
    },
    # T10: POLST/MOLST vs. Living Will
    {
        "q": "A {age}-year-old {gender} named {name} is transitioning from an acute care hospital to a long-term care facility. {possessive_cap} physician recommends completing a Physician Orders for Life-Sustaining Treatment (POLST) form. How does a POLST/MOLST differ from a standard Living Will?",
        "options": [
            "A POLST is a set of actionable medical orders signed by a clinician that is immediately binding across all care settings (including emergency services), whereas a Living Will is a legal document expressing general wishes that requires translation into medical orders",
            "A Living Will is a set of binding medical orders signed by a physician, while a POLST is a non-binding legal draft written by an attorney",
            "A POLST is only valid inside a courtroom and has no authority in a nursing home or hospital setting",
            "A POLST requires the patient to name a healthcare proxy, whereas a Living Will is designed to assign power of attorney",
            "A POLST only addresses organ donation, while a Living Will addresses all cardiopulmonary resuscitation preferences"
        ],
        "answer": 0,
        "exp": "The **POLST (Physician Orders for Life-Sustaining Treatment)** or **MOLST (Medical Orders for Life-Sustaining Treatment)** is a clinical tool designed for patients with serious illness or frailty. Unlike a **Living Will** (which is a legal document describing future preferences and requires translation into orders), a POLST: (1) Consists of **actionable medical orders** signed by a physician, nurse practitioner, or physician assistant, (2) Is **immediately binding across all settings**, including by emergency medical services (EMS) in the home, (3) Focuses on current medical decisions (resuscitation, intubation, feeding tubes, antibiotics). A living will is often not accessible or immediately actionable by EMS. (Ref: AGS Geriatrics At Your Fingertips; Hazzard's Ch. 82; UWorld Step 2 CK)"
    },
    # T11: Substituted judgment standard
    {
        "q": "A {age}-year-old {gender} named {name} has developed severe, irreversible septic shock and multi-organ failure. {pronoun_cap} is unresponsive. {possessive_cap} designated healthcare proxy, {possessive} {relation}, is asked whether to initiate hemodialysis. The proxy states: 'We never discussed kidney failure or dialysis, but I know how much {pronoun} loved {possessive} independence and always said {pronoun} would never want to live in a vegetative state or dependent on machines. Based on that, I know {pronoun} would say no to dialysis.' Which ethical decision-making standard is the proxy applying?",
        "options": [
            "Substituted judgment; where the surrogate makes the decision they believe the patient would have made for themselves based on the patient's known values, goals, and prior statements",
            "Best interest standard; where the surrogate chooses the option that a reasonable person would select to maximize objective clinical benefit",
            "Autologous proxy standard; where the physician makes the decision and the surrogate simply signs the consent form",
            "Therapeutic privilege; where the surrogate defers all decision-making to the medical team's personal values",
            "Distributive justice; where treatment is withheld based on the financial cost to the hospital and society"
        ],
        "answer": 0,
        "exp": "The **substituted judgment standard** is the primary ethical standard used by surrogate decision-makers when a patient lacks capacity but has left some indication of their values or preferences. Under this standard, the surrogate does not choose what they personally want, nor what they think is best for the patient; instead, they **step into the patient's shoes** and make the decision that the **patient would make for themselves** based on their known personality, lifestyle, values, religious beliefs, and previous statements. (Ref: UWorld Step 2 CK; First Aid Step 2 CK)"
    },
    # T12: Best interest standard
    {
        "q": "A {age}-year-old {gender} named {name} is admitted with a perforated sigmoid colon and fecal peritonitis. {pronoun_cap} is severely demented, non-verbal, and has no designated healthcare proxy, no advance directives, and no living relatives or friends. A decision must be made regarding emergency laparostomy. Since the patient's previous values and wishes are completely unknown, which ethical decision-making standard must guide the surrogate or temporary guardian?",
        "options": [
            "Best interest standard; where the decision-maker selects the option that maximizes clinical benefit and minimizes harm, choosing what a reasonable person would want in this situation",
            "Substituted judgment standard; where the decision-maker guesses what the patient would have wanted based on general statistical demographics",
            "Physician autonomy standard; where the surgeon proceeds with their own personal preference without any oversight",
            "Paternalistic beneficence standard; where the medical team is legally required to perform all possible surgeries regardless of prognosis",
            "Subliminal surrogate standard; where the decision is deferred until a relative is located via ancestry databases"
        ],
        "answer": 0,
        "exp": "When an incapacitated patient's **preferences, values, and previous wishes are completely unknown** (e.g., a patient with no family, friends, or advance directives), the surrogate or court-appointed guardian must use the **best interest standard**. Under this standard, the decision-maker must select the option that **maximizes the patient's well-being and minimizes pain and suffering**, effectively choosing what a **reasonable person** would want in that specific clinical scenario, weighing the benefits against the burdens of the intervention. (Ref: UWorld Step 2 CK; First Aid Step 2 CK)"
    },
    # T13: Default surrogate decision-maker hierarchy
    {
        "q": "A {age}-year-old {gender} named {name} is hospitalized with severe encephalopathy and lacks decision-making capacity. {pronoun_cap} has no designated Durable Power of Attorney for Healthcare and no written advance directives. According to typical state statutory default surrogate consent laws, in what order of priority should the medical team contact relatives to obtain consent for a medical procedure?",
        "options": [
            "Spouse, followed by adult children, parents, and then adult siblings",
            "Adult children, followed by spouse, siblings, and then parents",
            "Oldest sibling, followed by the oldest child, spouse, and then parents",
            "The primary care physician has default priority, followed by the spouse and children",
            "Any relative who arrives at the hospital first has absolute legal priority over all others"
        ],
        "answer": 0,
        "exp": "When a patient lacks decision-making capacity and has not designated a healthcare proxy (DPOA-HC), clinicians must look to state-specific **default surrogate consent statutes**. In the vast majority of states, the default hierarchy is: (1) **Spouse** (or registered domestic partner), (2) **Adult children** (usually requiring consensus if multiple), (3) **Parents**, (4) **Adult siblings**, (5) Other adult relatives (e.g., grandparents, aunts/uncles). If no relatives are available, some states allow a close friend who has knowledge of the patient's values to act as a surrogate. (Ref: First Aid Step 2 CK; Hazzard's Ch. 21)"
    },
    # T14: Assessing clinical decision-making capacity
    {
        "q": "A {age}-year-old {gender} named {name} with mild cognitive impairment is hospitalized for a foot wound with osteomyelitis. The orthopedic surgeon recommends amputation, warning that refusal carries a high risk of sepsis and death. {name} states: 'I understand what you are saying, but I refuse the surgery. I want to go home and die with my feet intact. I have lived a full life.' The surgeon believes the patient lacks capacity due to cognitive decline. Which of the following is correct regarding the clinical assessment of decision-making capacity?",
        "options": [
            "Decision-making capacity is a clinical determination made by the treating physician for a specific decision, based on four key criteria: communicating a choice, understanding the clinical situation, appreciating the consequences of the choice, and reasoning logically",
            "Cognitive impairment (e.g., dementia) automatically disqualifies a patient from having decision-making capacity for any medical decisions",
            "Capacity is a legal status that can only be determined by a court-appointed judge, whereas competence is determined by the physician",
            "A patient who makes a decision that contradicts medical advice (e.g., refusing a life-saving surgery) is automatically deemed to lack capacity",
            "The Mini-Mental State Examination (MMSE) score is the sole legal standard for determining capacity; a score below 24 indicates lack of capacity"
        ],
        "answer": 0,
        "exp": "**Decision-making capacity is a clinical determination** made by the treating physician for a **specific decision** at a **specific time**. It is not global (a patient may have capacity to consent to a blood draw but not a complex surgery) and is not ruled out by cognitive impairment. The **four components of capacity** are: (1) **Communicating a choice**: The patient can state their decision consistently. (2) **Understanding**: The patient understands the diagnosis, proposed treatment, and alternatives. (3) **Appreciation**: The patient appreciates the consequences (e.g., death if surgery is refused). (4) **Reasoning**: The patient can logically explain why they are making their choice. **Competence is a legal term** determined by a judge. (Ref: Hazzard's Ch. 21; UWorld Step 2 CK; First Aid Step 2 CK)"
    },
    # T15: Unilateral DNR orders by physicians (medical futility)
    {
        "q": "A {age}-year-old {gender} named {name} has advanced, multi-organ failure and is actively dying in the ICU. {possessive_cap} heart rate is slowing, and cardiac arrest is imminent. The medical team believes that CPR would be physiologically futile (unable to restore circulation or ventilation). However, the patient's family insists that 'everything, including chest compressions and shocks, must be done.' Which of the following is the most appropriate and ethically accepted action for the physician?",
        "options": [
            "Discuss the physiological futility of CPR with the family, attempt to build consensus, involve the hospital ethics committee, and if agreement cannot be reached and state/institutional policy allows, write a unilateral DNR order while continuing all other palliative measures",
            "Immediately perform CPR for at least 2 hours to satisfy the family, even if it causes extensive chest trauma and is clinically futile",
            "Threaten the family with legal action to force them to sign a DNR form, and discontinue all comfort measures immediately",
            "unilaterally write a DNR order and refuse to discuss it with the family, as physicians have absolute authority over all decisions",
            "Immediately transfer the patient to a different hospital's emergency department during cardiac arrest to shift the ethical burden"
        ],
        "answer": 0,
        "exp": "In cases of **physiological futility** (where CPR cannot restore cardiopulmonary function, which is common in active multi-organ failure), physicians are **not ethically obligated to perform non-beneficial treatments**. However, writing a **unilateral DNR order** requires caution: (1) Clear, empathetic communication with the family to explain that CPR will not work and will only cause pain. (2) Attempting to build consensus. (3) Involving the **hospital ethics committee** for mediation. (4) If consensus fails, and institutional/state guidelines allow, the physician can write the DNR order. If the family objects, they should be offered the option to transfer the patient to another facility. (Ref: Hazzard's Ch. 82; UWorld Step 2 CK)"
    },
    # T16: Patient Self-Determination Act (PSDA)
    {
        "q": "A {age}-year-old {gender} named {name} is admitted to a skilled nursing facility for rehabilitation following a hip fracture. During the admission process, the administrative staff provides {name} with written information regarding {possessive} right to formulate advance directives. Which of the following federal statutes mandates this requirement?",
        "options": [
            "The Patient Self-Determination Act (PSDA) of 1990; which requires Medicare- and Medicaid-funded healthcare institutions to inform patients of their rights under state law to accept or refuse treatment and to formulate advance directives",
            "The Health Insurance Portability and Accountability Act (HIPAA); which governs the privacy of advance directives",
            "The Emergency Medical Treatment and Active Labor Act (EMTALA); which requires emergency stabilization regardless of advance directives",
            "The Americans with Disabilities Act (ADA); which makes advance directives mandatory for all disabled individuals",
            "The Medicare Access and CHIP Reauthorization Act (MACRA); which ties physician reimbursement to the number of living wills signed"
        ],
        "answer": 0,
        "exp": "The **Patient Self-Determination Act (PSDA) of 1990** is a federal law that applies to all healthcare institutions (hospitals, nursing homes, hospice programs, HMOs) receiving Medicare or Medicaid funding. The PSDA requires these facilities to: (1) **Provide written information to patients** upon admission regarding their rights under state law to make decisions about their medical care, including the right to accept or refuse treatment and the right to formulate advance directives. (2) **Document** in the medical record whether the patient has an advance directive. (3) **Educate staff and the community** about advance directives. (Ref: PSDA 1990; Hazzard's Ch. 21; UWorld Step 2 CK)"
    },
    # T17: Refusal of life-sustaining treatment by a competent patient
    {
        "q": "A {age}-year-old {gender} named {name} has stage G5 chronic kidney disease and has been undergoing hemodialysis for {years} years. {pronoun_cap} presents to {possessive} nephrologist and states that {pronoun} is exhausted by the therapy, experiences severe fatigue, and wishes to discontinue hemodialysis permanently, understanding that doing so will lead to death within {weeks} weeks. Psychiatry confirms {pronoun} has no active depression or delirium, and {pronoun} demonstrates full capacity. What is the most appropriate clinical action?",
        "options": [
            "Respect the patient's autonomous decision to refuse life-sustaining treatment; discontinue hemodialysis, and initiate a comprehensive palliative care plan to manage uremic symptoms (e.g., pruritus, dyspnea, nausea) and ensure a comfortable death",
            "Obtain a court order to force the patient to undergo dialysis, as suicide is illegal and hemodialysis is life-sustaining",
            "Involuntary admit the patient to a psychiatric facility for suicidal ideation, and continue dialysis against {possessive} will",
            "Prescribe high-dose oral antidepressants and continue hemodialysis until the medications achieve therapeutic levels in 6 weeks",
            "Inform the patient that because they are choosing to stop dialysis, they are ineligible for any medical care or pain management"
        ],
        "answer": 0,
        "exp": "A **competent patient has the absolute ethical and legal right to refuse any medical treatment**, including life-sustaining interventions (such as mechanical ventilation, feeding tubes, or hemodialysis). The physician's duties are to: (1) Confirm the patient's **decision-making capacity**, (2) Ensure the patient is **fully informed** of the consequences (death), (3) Address any treatable issues (e.g., pain, depression) that might be influencing the decision, and (4) **Respect the refusal, transition to comfort-focused care, and manage symptoms** (in uremia: dyspnea, nausea, pruritus, agitation) to ensure a peaceful death. (Ref: Hazzard's Ch. 82; UWorld Step 2 CK)"
    },

    # ===== HOSPICE CRITERIA (Templates 18-25) =====
    # T18: Medicare hospice benefit eligibility criteria
    {
        "q": "A {age}-year-old {gender} named {name} has end-stage dementia and is being considered for hospice care. Which of the following correctly outlines the eligibility criteria for a patient to enroll in the Medicare Hospice Benefit?",
        "options": [
            "The patient must have a terminal illness with a prognosis of 6 months or less if the disease runs its normal course, certified by two physicians (the primary care physician and the hospice medical director), and the patient must agree to waive curative treatment for the terminal condition",
            "The patient must have a terminal prognosis of less than 30 days, certified by a court-appointed judge, and must undergo a trial of chemotherapy first",
            "The patient must be completely bedbound and requiring mechanical ventilation to qualify for any hospice services",
            "The patient must agree to sign a waiver stating they will never visit an emergency department or hospital for any reason",
            "Hospice eligibility is determined solely by the patient's age; all individuals aged >= 85 are automatically enrolled"
        ],
        "answer": 0,
        "exp": "To qualify for the **Medicare Hospice Benefit**, the patient must meet three core criteria: (1) **Terminal prognosis of 6 months or less** if the terminal illness runs its normal course. (2) **Certification** of the terminal illness by **two physicians** (typically the patient's attending physician and the hospice medical director; subsequent recertifications require only the hospice physician). (3) **Election of the benefit**: The patient (or surrogate if they lack capacity) must sign a statement choosing hospice care and **waiving Medicare coverage for curative treatments** of the terminal condition. (Ref: AGS Geriatrics At Your Fingertips; Hazzard's Ch. 82; UWorld Step 2 CK)"
    },
    # T19: Palliative care vs. Hospice care
    {
        "q": "A {age}-year-old {gender} named {name} is diagnosed with Stage IV lung adenocarcinoma. {pronoun_cap} wants to receive specialized medical care to manage {possessive} severe pain and dyspnea, but {pronoun} also wishes to undergo a new palliative chemotherapy regimen that may slow tumor progression. Which of the following is correct regarding the distinction between palliative care and hospice care for this patient?",
        "options": [
            "Palliative care can be initiated at any stage of a serious illness and can be provided concurrently with curative/disease-modifying treatments (like chemotherapy), whereas hospice care is a subset of palliative care for patients with a terminal prognosis of <= 6 months who waive curative therapy",
            "Hospice care allows the patient to undergo aggressive curative surgeries, whereas palliative care is strictly limited to patients in their last 48 hours of life",
            "Palliative care is only provided in long-term nursing homes, while hospice care is exclusively provided in acute care hospitals",
            "There is no difference; the two terms are identical and both require the patient to waive all medications including pain control",
            "Hospice care is funded by private insurance only, whereas palliative care is a mandatory benefit under Medicare Part A"
        ],
        "answer": 0,
        "exp": "**Palliative care** is specialized medical care focused on providing relief from the symptoms and stress of a serious illness, with the goal of improving quality of life. It **can be initiated at any stage of a serious illness** (regardless of prognosis) and can be **provided concurrently with curative, life-prolonging, or disease-modifying therapies** (e.g., chemotherapy, radiation, dialysis). **Hospice care** is a specific delivery model of palliative care for patients with a **prognosis of <= 6 months** who are no longer pursuing curative or disease-modifying treatments. (Ref: Hazzard's Ch. 82; AGS Geriatrics At Your Fingertips; UWorld Step 2 CK)"
    },
    # T20: Levels of hospice care: Respite care
    {
        "q": "A {age}-year-old {gender} named {name} has advanced Parkinson's disease and is enrolled in home hospice care. {possessive_cap} primary caregiver, {possessive} spouse, is experiencing severe physical exhaustion and caregiver burnout. The hospice nurse suggests utilizing the 'Respite Care' benefit. Which of the following is correct regarding the Medicare hospice respite care benefit?",
        "options": [
            "The patient can be admitted to an approved inpatient facility (e.g., nursing home or hospice unit) for up to 5 consecutive days to provide temporary relief to the primary caregiver, funded by the Medicare hospice benefit",
            "Respite care allows the caregiver to hire a full-time private nurse to live in their home permanently at no cost",
            "Respite care requires the patient to be admitted to the hospital ICU to undergo diagnostic testing for caregiver stress",
            "The respite benefit can only be used once in a patient's lifetime and is limited to a maximum of 12 hours",
            "Respite care is a cash benefit paid directly to the caregiver to purchase vacation packages"
        ],
        "answer": 0,
        "exp": "Under the Medicare Hospice Benefit, **Respite Care** is one of the four levels of hospice care. It is designed to provide temporary relief to the patient's primary caregiver (usually a family member). Respite care allows the patient to be transferred to an Medicare-approved inpatient facility (such as a nursing home, assisted living, or inpatient hospice unit) for **up to 5 consecutive days per episode**. There is no limit on the number of times it can be used, but it must be scheduled in advance and is not intended for acute symptom management. (Ref: AGS Geriatrics At Your Fingertips; Hazzard's Ch. 82)"
    },
    # T21: Levels of hospice care: General Inpatient (GIP) care
    {
        "q": "A {age}-year-old {gender} named {name} is receiving home hospice care for terminal pancreatic cancer. {pronoun_cap} develops severe, refractory bone pain and hyperactive delirium with agitation that cannot be safely or effectively managed at home despite multiple increases in transdermal and sublingual opioid doses. What is the most appropriate next step under the Medicare hospice benefit?",
        "options": [
            "Transfer the patient to a General Inpatient (GIP) hospice bed for short-term, intensive management of acute, refractory symptoms that cannot be controlled in the home setting",
            "Disenroll the patient from hospice immediately and admit them to the hospital ICU for emergency intubation and chemotherapy",
            "Instruct the family to increase the opioid dose tenfold at home and use physical restraints to manage the delirium",
            "Refuse any change in care level, as home hospice patients are legally prohibited from leaving their residence",
            "Prescribe oral acetaminophen and advise the family that delirium is a normal part of dying that cannot be treated"
        ],
        "answer": 0,
        "exp": "Under the Medicare Hospice Benefit, **General Inpatient (GIP) care** is indicated for **short-term management of acute, refractory symptoms** (e.g., severe pain, uncontrollable delirium, intractable nausea, severe dyspnea) that **cannot be managed in other settings** (such as the home). GIP can be provided in an inpatient hospice unit, a skilled nursing facility, or a hospital. The focus remains entirely palliative, utilizing intensive nursing and medical adjustments to stabilize symptoms. Once the symptoms are controlled, the patient is transitioned back to home hospice care. (Ref: AGS Geriatrics At Your Fingertips; Hazzard's Ch. 82; UWorld Step 2 CK)"
    },
    # T22: Revocation of the Medicare hospice benefit
    {
        "q": "A {age}-year-old {gender} named {name} has been enrolled in hospice care for {months} months due to terminal metastatic colon cancer. {pronoun_cap} learns that {pronoun} has been accepted into a new clinical trial evaluating a novel targeted immunotherapy that requires monthly hospital infusions and tumor biopsies. Which of the following is correct regarding {possessive} right to pursue this treatment?",
        "options": [
            "The patient has the absolute right to revoke the Medicare hospice benefit at any time to pursue curative or clinical trial therapies, returning to standard Medicare Part A and B coverage",
            "Once enrolled in hospice, the patient is legally prohibited from revoking the benefit and must remain in hospice until death",
            "The patient can enroll in the clinical trial and receive chemotherapy while remaining on the hospice benefit, as hospice funds all experimental therapies",
            "Revoking hospice requires a court hearing and approval by a panel of three independent medical ethicists",
            "If the patient revokes the hospice benefit, they face a permanent financial penalty and cannot re-enroll in hospice in the future"
        ],
        "answer": 0,
        "exp": "A patient (or their surrogate if the patient lacks capacity) has the **absolute right to revoke the election of the hospice benefit at any time**. Revocation immediately terminates the hospice benefit, and the patient **returns to standard Medicare coverage** (Parts A and B). This allows them to pursue curative treatments, clinical trials, or seek care from any provider. If the clinical trial is unsuccessful or the patient chooses to focus on comfort again, they **can re-enroll in hospice at any time**, provided they still meet the eligibility criteria (prognosis <= 6 months). (Ref: AGS Geriatrics At Your Fingertips; Hazzard's Ch. 82)"
    },
    # T23: Interdisciplinary team (IDT) role in hospice
    {
        "q": "A {age}-year-old {gender} named {name} with advanced dementia is enrolled in hospice. {possessive_cap} family is struggling with emotional distress, spiritual questions, and practical challenges regarding daily care. Under the Medicare hospice benefit, how is the care delivery structured to address these multi-dimensional needs?",
        "options": [
            "Hospice care is delivered by an Interdisciplinary Team (IDT) consisting of a hospice physician, nurse, social worker, chaplain, bereavement counselor, and trained volunteers, who collaborate to address physical, emotional, social, and spiritual needs",
            "Hospice care is delivered exclusively by a single primary nurse, with no social work or spiritual support provided due to federal funding limits",
            "The medical director makes all decisions in isolation and is prohibited by law from communicating with the nursing staff",
            "Hospice care excludes all spiritual or emotional support, focusing strictly on the administration of intravenous pain medications",
            "The patient's family is required to hire and pay for their own independent social workers and chaplains, as these are not covered by hospice"
        ],
        "answer": 0,
        "exp": "The core of the hospice model is the **Interdisciplinary Team (IDT)**. Federal regulations mandate that hospice care must be directed and coordinated by an IDT to address the physical, psychological, social, and spiritual needs of the patient and family. The IDT includes: (1) **Hospice Medical Director/Physician**, (2) **Registered Nurses**, (3) **Social Workers**, (4) **Chaplains/Spiritual Counselors**, (5) **Bereavement Counselors**, (6) **Hospice Aides**, and (7) **Trained Volunteers**. The team meets regularly to update a personalized plan of care. (Ref: Hazzard's Ch. 82; AGS Geriatrics At Your Fingertips)"
    },
    # T24: Non-cancer hospice criteria: Advanced Heart Failure
    {
        "q": "A {age}-year-old {gender} named {name} with end-stage congestive heart failure is evaluated for hospice eligibility. Which of the following clinical indicators best supports a prognosis of 6 months or less to qualify {name} for the Medicare hospice benefit?",
        "options": [
            "NYHA Class IV heart failure symptoms (dyspnea or fatigue at rest), optimal management with guideline-directed medical therapy, ejection fraction < 20% (if known), and recurrent hospitalizations or emergency department visits for heart failure exacerbations",
            "An ejection fraction of 45% with dyspnea occurring only during strenuous exercise (NYHA Class II)",
            "A history of a single myocardial infarction 10 years ago with normal current exercise tolerance and no current medications",
            "The presence of asymptomatic left bundle branch block on an electrocardiogram with normal echocardiography",
            "The patient's refusal to take any medications, despite having asymptomatic hypertension and normal cardiac function"
        ],
        "answer": 0,
        "exp": "For patients with non-cancer diagnoses like congestive heart failure, documenting a prognosis of <= 6 months can be challenging. Guidelines for hospice eligibility in **advanced heart failure** require: (1) **NYHA Class IV symptoms** (significant dyspnea, fatigue, or chest pain at rest or with minimal activity). (2) **Optimal medical management** (patient is treated with diuretics, ACEi/ARB/ARNI, beta-blockers, etc., or has documented intolerance). (3) **Clinical indicators of decline**, such as **recurrent hospitalizations or ED visits** for heart failure, cardiac cachexia, or refractory arrhythmias. An ejection fraction < 20% is supportive but not strictly mandatory. (Ref: AGS Geriatrics At Your Fingertips; Hazzard's Ch. 39 & 82)"
    },
    # T25: Non-cancer hospice criteria: Advanced COPD
    {
        "q": "A {age}-year-old {gender} named {name} with end-stage chronic obstructive pulmonary disease (COPD) is being evaluated for hospice eligibility. Which of the following clinical findings is most indicative of a 6-month prognosis to support hospice enrollment?",
        "options": [
            "Severe, disabling dyspnea at rest, poor response to bronchodilators, oxygen dependence, and recurrent emergency department visits or hospitalizations for acute respiratory failure",
            "An FEV1 of 75% of predicted on spirometry with dyspnea only when climbing multiple flights of stairs",
            "A history of smoking 1 pack of cigarettes daily for 40 years, with normal current pulse oximetry on room air",
            "A single episode of mild bronchitis that resolved completely with a 5-day course of oral azithromycin",
            "The presence of chronic cough without dyspnea, hypoxemia, or need for daily inhaler therapy"
        ],
        "answer": 0,
        "exp": "Hospice eligibility guidelines for **advanced COPD** focus on documenting severe lung dysfunction and progressive decline. Key indicators include: (1) **Severe, disabling dyspnea at rest** or with minimal exertion, with little to no response to bronchodilators. (2) **Oxygen dependence** (chronic hypoxemia at rest, pO2 <= 55 mmHg or O2 saturation <= 88% on supplemental oxygen). (3) **FEV1 <= 30% of predicted** (if spirometry is available, though not required). (4) **Progressive decline**, shown by **recurrent hospitalizations or emergency visits** for respiratory failure or pulmonary infections, weight loss, or cor pulmonale (right-sided heart failure). (Ref: AGS Geriatrics At Your Fingertips; Hazzard's Ch. 82)"
    },

    # ===== PAIN MANAGEMENT & SYMPTOM CONTROL (Templates 26-35) =====
    # T26: Opioid selection in renal impairment
    {
        "q": "A {age}-year-old {gender} named {name} with stage G4 chronic kidney disease (eGFR 22 mL/min) and metastatic prostate cancer is experiencing severe, constant bone pain. Which of the following opioids should be **avoided** due to the risk of metabolite accumulation and neurotoxicity, and which is the **preferred** alternative for long-term pain management?",
        "options": [
            "Avoid morphine (due to accumulation of active metabolites morphine-3-glucuronide and morphine-6-glucuronide, causing myoclonus, seizures, and respiratory depression); prefer fentanyl or hydromorphone",
            "Avoid fentanyl (due to direct renal tubular necrosis); prefer morphine or codeine",
            "Avoid transdermal buprenorphine (due to high renal clearance); prefer oral meperidine",
            "Avoid methadone (because it is highly dialyzable); prefer oral codeine",
            "Avoid hydromorphone (due to its lack of analgesic effect in renal failure); prefer codeine"
        ],
        "answer": 0,
        "exp": "In patients with **renal impairment (CKD stage G4/G5)**, several opioids are hazardous. **Morphine and codeine must be avoided**. Morphine is metabolized to **morphine-3-glucuronide (M3G)** (which causes neurotoxicity: myoclonus, hyperalgesia, delirium, seizures) and **morphine-6-glucuronide (M6G)** (a potent analgesic that accumulates, causing profound respiratory depression and sedation). Codeine also accumulates. **Preferred opioids in renal failure are fentanyl, hydromorphone, and methadone**. Fentanyl is metabolized to inactive metabolites and is not cleared renally. Hydromorphone has metabolites (H3G) but is safer than morphine when used cautiously. Methadone has primarily fecal excretion. (Ref: Hazzard's Ch. 82; AGS Beers Criteria 2023; Oxford Handbook of Palliative Care; UWorld Step 2 CK)"
    },
    # T27: Opioid rotation and incomplete cross-tolerance
    {
        "q": "A {age}-year-old {gender} named {name} has been taking oral morphine {dose} mg daily for metastatic bone pain. {pronoun_cap} has developed severe, intractable myoclonus and sedation, prompting the clinician to rotate {possessive} opioid to oral oxycodone. The equianalgesic ratio is: **30 mg oral morphine = 20 mg oral oxycodone**. Which of the following represents the most appropriate clinical reasoning and step in calculating the new oxycodone dose?",
        "options": [
            "Calculate the equianalgesic oxycodone dose (which is {oxy_eq} mg/day), and then reduce this dose by 25-50% to account for incomplete cross-tolerance, resulting in a starting dose of approximately {oxy_final} mg/day split into scheduled doses",
            "Prescribe the exact equianalgesic dose of oxycodone ({oxy_eq} mg/day) without any reduction, as cross-tolerance is always complete",
            "Double the calculated equianalgesic dose of oxycodone to prevent a withdrawal syndrome",
            "Switch to oral acetaminophen 10 g daily, as opioids cannot be rotated safely in older adults",
            "Prescribe oxycodone on an as-needed basis only, discontinuing all scheduled baseline pain medications"
        ],
        "answer": 0,
        "exp": "When rotating opioids due to side effects (like myoclonus from morphine) or poor pain control, clinicians must adjust for **incomplete cross-tolerance**. Because receptors are not identical across different opioids, a patient tolerant to one opioid will be highly sensitive to a new one. The step-by-step method is: (1) Calculate the 24-hour total dose of the current opioid. (2) Convert to the new opioid using equianalgesic tables. (3) **Reduce the calculated equianalgesic dose of the new opioid by 25% to 50%** to prevent overdose/respiratory depression. (4) Divide into scheduled doses and provide 10-15% of the daily dose as a short-acting PRN opioid for breakthrough pain. (Ref: Palliative Care: A Practical Guide Ch. 6; Oxford Handbook of Palliative Care; UWorld Step 2 CK)"
    },
    # T28: Breakthrough pain management
    {
        "q": "A {age}-year-old {gender} named {name} with advanced lung cancer is managed for constant chest wall pain with a long-acting transdermal fentanyl patch at a dose of {fentanyl_dose} mcg/hour (equivalent to approximately {morphine_eq} mg of oral morphine daily). {pronoun_cap} reports experiencing sudden, severe pain spikes (breakthrough pain) 3 to 4 times a day, particularly when coughing. What is the most appropriate breakthrough pain regimen to prescribe?",
        "options": [
            "Prescribe short-acting oral immediate-release morphine (approx. {bt_dose} mg, which represents 10-15% of the total 24-hour baseline morphine-equivalent dose) to be taken every 4 hours as needed for breakthrough pain",
            "Increase the fentanyl patch dose to 400 mcg/hour immediately to eliminate the need for any breakthrough medications",
            "Prescribe long-acting oral methadone to be taken every 4 hours as needed for breakthrough pain",
            "Recommend taking over-the-counter ibuprofen 800 mg every 2 hours, as opioids should not be used for breakthrough pain",
            "Instruct the patient to apply a second fentanyl patch only during the episodes of coughing and remove it after 30 minutes"
        ],
        "answer": 0,
        "exp": "For patients on a stable, long-acting opioid regimen (like transdermal fentanyl or extended-release morphine) who experience **breakthrough pain**, the standard of care is to prescribe a **short-acting, immediate-release opioid** (e.g., immediate-release morphine, oxycodone, or hydromorphone). The breakthrough dose is calculated as **10% to 15% of the total 24-hour baseline oral morphine-equivalent (OME) dose**, administered on an **as-needed (PRN)** basis. For example, if a patient is on 100 mg of OME per day, the breakthrough dose should be 10-15 mg of immediate-release morphine PRN. (Ref: Oxford Handbook of Palliative Care; UWorld Step 2 CK)"
    },
    # T29: Opioid-induced constipation (OIC) prophylaxis
    {
        "q": "A {age}-year-old {gender} named {name} with metastatic breast cancer is started on scheduled oral morphine for pain control. Which of the following best describes the management of opioid-induced constipation (OIC) in this patient?",
        "options": [
            "Initiate a prophylactic stimulant laxative (e.g., {laxative}) combined with an osmotic laxative (e.g., polyethylene glycol); explain that tolerance to opioid-induced constipation does not develop, so prophylaxis is required for the duration of opioid therapy",
            "Recommend a 'wait-and-see' approach, initiating laxatives only if the patient has not had a bowel movement for 10 days",
            "Prescribe oral docusate sodium monotherapy, as surfactant stool softeners are highly effective in fully preventing OIC",
            "Advise the patient to significantly increase dietary fiber to 60 g daily, which is sufficient to overcome OIC without laxatives",
            "Explain that tolerance to constipation develops within 2 weeks of starting opioids, so laxatives are only needed temporarily"
        ],
        "answer": 0,
        "exp": "**Opioid-induced constipation (OIC)** is a universal side effect caused by opioids binding to mu-receptors in the enteric nervous system, reducing peristalsis and secretions. Unlike other side effects (nausea, sedation), **tolerance to constipation does not develop**. Therefore, **prophylactic laxatives must be started concurrently** with opioid initiation and continued throughout therapy. The preferred regimen is a **stimulant laxative (senna or bisacodyl)** to stimulate peristalsis, often paired with an **osmotic laxative (polyethylene glycol)**. Docusate (stool softener) alone is ineffective. For refractory OIC, peripheral mu-opioid receptor antagonists (PAMORAs, e.g., methylnaltrexone) are indicated. (Ref: Hazzard's Ch. 82; UWorld Step 2 CK)"
    },
    # T30: Opioid-induced neurotoxicity (OIN) vs. pain progression
    {
        "q": "A {age}-year-old {gender} named {name} with advanced renal failure is receiving high-dose oral morphine for cancer pain. Over the past 48 hours, {pronoun} has become increasingly agitated and confused. Physical examination reveals diffuse myoclonus (muscle jerking) and severe, generalized pain triggered even by light touch (allodynia). What is the underlying pathophysiology of these symptoms, and what is the most appropriate management?",
        "options": [
            "Opioid-induced neurotoxicity (OIN) due to accumulation of the morphine metabolite morphine-3-glucuronide (M3G); manage by rotating to a different opioid (e.g., fentanyl or methadone) and ensuring gentle hydration",
            "Severe progression of the cancer metastases requiring an immediate 50% increase in the morphine dose",
            "Acute ischemic stroke requiring emergent administration of intravenous tissue plasminogen activator (tPA)",
            "A normal age-related change in pain perception that should be managed with physical therapy",
            "Acetaminophen toxicity; administer intravenous N-acetylcysteine immediately"
        ],
        "answer": 0,
        "exp": "**Opioid-induced neurotoxicity (OIN)** is a syndrome characterized by cognitive impairment, delirium, agitation, myoclonus, seizures, and **hyperalgesia/allodynia** (paradoxical worsening of pain). It is primarily caused by the accumulation of active metabolites, particularly **morphine-3-glucuronide (M3G)**, which accumulates in patients with **renal impairment**. Hyperalgesia is often mistaken for cancer pain progression, leading to dangerous dose increases that worsen the neurotoxicity. Management includes: (1) **Opioid rotation** to an alternative agent (e.g., fentanyl, methadone), (2) Dose reduction, (3) **Hydration** to facilitate renal clearance of metabolites. (Ref: Oxford Handbook of Palliative Care; Hazzard's Ch. 82; UWorld Step 2 CK)"
    },
    # T31: Pharmacological management of dyspnea at end of life
    {
        "q": "A {age}-year-old {gender} named {name} with end-stage metastatic lung cancer is actively dying in the hospice unit. {pronoun_cap} has severe dyspnea, using accessory muscles of respiration. Pulse oximetry shows oxygen saturation of 93% on room air. What is the most appropriate first-line pharmacological intervention to relieve {possessive} dyspnea?",
        "options": [
            "Administer low-dose immediate-release morphine (oral or intravenous), as opioids are the first-line pharmacotherapy for terminal dyspnea by reducing the perception of air hunger and blunting the respiratory drive",
            "Initiate high-flow nasal cannula oxygen at 40 L/min to raise {possessive} oxygen saturation to 100%",
            "Administer intravenous albuterol and start an epinephrine nebulizer to dilate the pulmonary vasculature",
            "Prescribe oral acetazolamide to induce a metabolic acidosis and stimulate deep hyperventilation",
            "Initiate a continuous intravenous infusion of midazolam at a high dose to induce general anesthesia"
        ],
        "answer": 0,
        "exp": "For the management of **dyspnea (air hunger) at the end of life**, **low-dose opioids (predominantly morphine)** are the **first-line pharmacological treatment of choice**. Opioids work by: (1) Reducing the central perception of dyspnea, (2) Blunting the ventilatory response to hypoxia and hypercapnia, and (3) Reducing anxiety and pulmonary congestion (vasodilation). **Oxygen is only indicated if the patient is hypoxic** (O2 saturation < 90-92%); studies show oxygen is no more effective than room air for non-hypoxic dyspnea. Non-pharmacological measures include a cool fan blowing air across the face. (Ref: Hazzard's Ch. 82; UWorld Step 2 CK)"
    },
    # T32: Management of terminal secretions ("death rattle")
    {
        "q": "A {age}-year-old {gender} named {name} is in the active phase of dying. {pronoun_cap} is comatose. The family is extremely distressed by the onset of loud, wet, gurgling respirations ('death rattle'). What is the most appropriate clinical management for this symptom?",
        "options": [
            "Reposition the patient (turn them on their side or elevate the head of the bed), reassure the family that the patient is not distresses or choking, and administer an anticholinergic agent (e.g., {secretions_med}) to dry secretions; avoid deep suctioning",
            "Perform deep endotracheal suctioning every 15 minutes to manually clear all accumulated bronchial secretions",
            "Insert a laryngeal mask airway (LMA) and initiate positive pressure ventilation to blow the secretions back into the alveoli",
            "Administer intravenous furosemide 80 mg every 2 hours to dry the lungs, and restrict all oral hygiene measures",
            "Initiate a rapid intravenous infusion of normal saline to dilute the secretions and make them easier for the comatose patient to expectorate"
        ],
        "answer": 0,
        "exp": "The **terminal 'death rattle'** is caused by the movement of saliva or secretions in the hypopharynx of a dying patient who has lost the swallowing and cough reflexes. It is highly distressing to the family but does not cause distress to the comatose patient. Management: (1) **Family reassurance** (explain that the patient is not choking). (2) **Repositioning** (lateral recumbent position or semi-Fowler's position to allow gravity drainage). (3) **Anticholinergic drugs** (e.g., **glycopyrrolate**, **scopolamine patch**, **hyoscyamine**, or sublingual atropine drops) to reduce further secretion production. **Deep suctioning should be avoided** as it is highly invasive, causes discomfort/agitation, and stimulates further secretion production via mucosal trauma. (Ref: UWorld Step 2 CK; Hazzard's Ch. 82)"
    },
    # T33: Management of terminal delirium
    {
        "q": "A {age}-year-old {gender} named {name} is in the final days of life in an inpatient hospice unit. {pronoun_cap} develops acute hyperactive delirium, characterized by severe agitation, plucking at the air, and distressing visual hallucinations. Non-pharmacological interventions are maximized. Which of the following is the most appropriate first-line pharmacological treatment?",
        "options": [
            "Low-dose haloperidol (or atypical antipsychotics like olanzapine or quetiapine), as antipsychotics are the first-line pharmacotherapy for distressing hyperactive terminal delirium",
            "Continuous infusion of lorazepam monotherapy, as benzodiazepines are the preferred agents to resolve geriatric delirium",
            "Oral diphenhydramine at high doses to sedate the patient and prevent falls",
            "Intravenous physostigmine to reverse the age-related cholinergic excess in the central nervous system",
            "Oral methylphenidate to stimulate the prefrontal cortex and restore normal sleep-wake cycles"
        ],
        "answer": 0,
        "exp": "**Terminal delirium** affects up to 88% of patients in their final days. Hyperactive delirium (agitation, hallucinations, cognitive distress) should be managed pharmacologically if it causes distress to the patient or safety risks. **Low-dose haloperidol** (or atypical antipsychotics like olanzapine) is the **first-line drug of choice** because it targets dopamine receptors without causing excessive respiratory depression. **Benzodiazepines (e.g., lorazepam) should be avoided as monotherapy** because they frequently cause **paradoxical agitation** and worsen delirium in older adults, though they can be added as adjuncts for severe, refractory agitation or when terminal sedation is indicated. (Ref: Hazzard's Ch. 82; UWorld Step 2 CK)"
    },
    # T34: Uremic nausea management
    {
        "q": "A {age}-year-old {gender} named {name} has decided to withdraw from hemodialysis and is receiving palliative care. {pronoun_cap} develops severe, persistent uremic nausea and vomiting. Which of the following antiemetics is most appropriate as first-line therapy, and what is its primary site of action?",
        "options": [
            "Haloperidol; which acts as a potent dopamine (D2) receptor antagonist in the chemoreceptor trigger zone (CTZ) of the brainstem, which is stimulated by uremic toxins",
            "Metoclopramide; which acts as a pure serotonin antagonist in the cerebral cortex",
            "Ondansetron; which acts as an anticholinergic agent in the vestibular nuclei",
            "Aprepitant; which blocks histamine receptors in the stomach wall",
            "Scopolamine; which acts as a prokinetic agent in the gastroduodenal junction"
        ],
        "answer": 0,
        "exp": "Nausea and vomiting at the end of life must be treated based on the underlying etiology. In **uremia (end-stage renal failure)**, uremic toxins accumulate and stimulate the **chemoreceptor trigger zone (CTZ)** in the area postrema of the medulla. The CTZ is rich in dopamine (D2) and serotonin (5-HT3) receptors. **Haloperidol** is a highly effective, first-line antiemetic for **chemical/toxin-induced nausea** due to its potent central D2-receptor antagonism. Metoclopramide (prokinetic) is preferred for gastroparesis. Scopolamine is preferred for vestibular nausea. (Ref: Oxford Handbook of Palliative Care; Hazzard's Ch. 82)"
    },
    # T35: Bowel obstruction management in advanced inoperable cancer
    {
        "q": "A {age}-year-old {gender} named {name} with terminal peritoneal carcinomatosis has an inoperable malignant bowel obstruction. {pronoun_cap} has severe colic (cramping abdominal pain) and nausea. Which of the following antiemetics/prokinetics should be **avoided** in this patient, and why?",
        "options": [
            "Avoid metoclopramide; because as a prokinetic agent, it stimulates gastric and intestinal motility against a fixed, complete obstruction, which can cause severe colic, abdominal pain, and bowel perforation",
            "Avoid ondansetron; because it cause immediate cardiovascular collapse in patients with cancer",
            "Avoid dexamethasone; because it stimulates intestinal secretions and worsens abdominal distension",
            "Avoid octreotide; because it accelerates gastric emptying and increases stool volume",
            "Avoid glycopyrrolate; because it causes severe diarrhea by hyperactivating the parasympathetic nervous system"
        ],
        "answer": 0,
        "exp": "In patients with a **complete, inoperable malignant bowel obstruction**, prokinetic agents such as **metoclopramide must be avoided**. Metoclopramide increases upper gastrointestinal motility and contracts the stomach and duodenum. Stimulating peristalsis against a closed, mechanical obstruction leads to **severe cramping pain (colic)** and increases the risk of **gastrointestinal perforation**. Instead, management should focus on antisecretory agents (octreotide), anti-inflammatory steroids (dexamethasone), and anticholinergic antispasmodics (glycopyrrolate) to reduce secretions and colic. (Ref: Oxford Handbook of Palliative Care; Hazzard's Ch. 82; UWorld Step 2 CK)"
    }
]

# ============================================================
# Generate and Randomize 350 MCQs
# ============================================================
mcqs = []
seen_questions = set()

# We need exactly 350 MCQs. With 35 templates, generating exactly 10 unique variants of each template yields 350 MCQs.
for t_idx, t in enumerate(templates):
    variants_generated = 0
    attempts = 0
    
    while variants_generated < 10 and attempts < 100:
        attempts += 1
        
        # Select gender and related pronoun fields
        gp = random.choice(genders_pool)
        gender = gp["gender"]
        name = random.choice(gp["names"])
        pronoun = gp["pronoun"]
        pronoun_cap = gp["pronoun_cap"]
        possessive = gp["possessive"]
        possessive_cap = gp["possessive_cap"]
        
        # Select random variables
        age = random.choice(ages_pool)
        cancer_type = random.choice(cancer_types_pool)
        relation1 = random.choice(relations_pool)
        relation2 = random.choice([r for r in relations_pool if r != relation1])
        months = random.choice([3, 4, 6, 8])
        years = random.choice([2, 3, 4, 5])
        weeks = random.choice([2, 3, 4])
        hospitalizations = random.choice([2, 3, 4])
        fast_stage = random.choice(fast_stages_pool)
        
        # Custom logic for template-specific math variables (e.g., T27, T28)
        dose = random.choice(doses_pool)
        oxy_eq = int((dose * 2) / 3)  # 30 morphine = 20 oxycodone -> oxy = morphine * 2/3
        # Reduce by 25-50% (say, 30% reduction -> multiply by 0.7)
        oxy_final = int(oxy_eq * 0.7)
        
        fentanyl_dose = random.choice(fentanyl_doses_pool)
        morphine_eq = fentanyl_dose * 2  # standard rough conversion: 25 mcg/hr patch ~= 50 mg/day oral morphine (varies, but we use consistent numbers)
        bt_dose = int(morphine_eq * 0.1) # 10% of daily dose
        
        format_kwargs = {
            "age": age,
            "gender": gender,
            "name": name,
            "pronoun": pronoun,
            "pronoun_cap": pronoun_cap,
            "possessive": possessive,
            "possessive_cap": possessive_cap,
            "relation": relation1,
            "relation1": relation1,
            "relation2": relation2,
            "cancer_type": cancer_type,
            "months": months,
            "years": years,
            "weeks": weeks,
            "hospitalizations": hospitalizations,
            "fast_stage": fast_stage,
            "dose": dose,
            "oxy_eq": oxy_eq,
            "oxy_final": oxy_final,
            "fentanyl_dose": fentanyl_dose,
            "morphine_eq": morphine_eq,
            "bt_dose": bt_dose,
            "secretions_med": random.choice(secretions_meds_pool),
            "laxative": random.choice(laxatives_pool)
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
    out_file = f"c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260521_geri_end_of_life_mcqs_p{part_num}.sql"
    with open(out_file, "w", encoding="utf-8") as f:
        f.write(f"-- US MD/MBBS (4th Year) clinical case blocks - Geriatrics: End-of-life & palliative care — goals of care, advance directives, hospice criteria, pain management - Part {part_num} ({(part_num-1)*100+1}-{((part_num-1)*100)+len(part_mcqs)})\n")
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
