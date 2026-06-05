import json

# Define the 130 cards as a list of dicts
cards = [
    # ===== Section 1: Informed Consent Process & Components (Cards 1–25) =====
    {
        "q": "What is the primary ethical principle underlying the requirement for informed consent?",
        "a": "<b>Autonomy</b> — the patient's right to self-determination and to make decisions about their own body."
    },
    {
        "q": "What are the four essential clinical components required for a valid informed consent process?",
        "a": "1. <b>Disclosure</b> of information<br>2. Patient <b>voluntariness</b><br>3. Decision-making <b>capacity</b><br>4. Expression of <b>consent or refusal</b>."
    },
    {
        "q": "What five key pieces of information must a physician disclose during the informed consent process?",
        "a": "1. Nature and purpose of the <b>intervention</b><br>2. Expected <b>benefits</b><br>3. Key <b>risks</b> (common and severe)<br>4. Reasonable <b>alternatives</b><br>5. Risks of <b>refusing</b> treatment."
    },
    {
        "q": "How does the 'reasonable patient' standard for disclosure differ from the 'professional (reasonable physician)' standard?",
        "a": "The <b>reasonable patient</b> standard requires disclosing what a typical patient would find material to their decision, whereas the <b>professional</b> standard requires disclosing what a typical physician in the same community would disclose."
    },
    {
        "q": "Which standard of disclosure (reasonable patient vs. professional) is favored in modern bioethics and the majority of US states?",
        "a": "The <b>reasonable patient standard</b>, as it maximizes patient autonomy and self-determination."
    },
    {
        "q": "Who is legally and ethically responsible for obtaining informed consent from a patient?",
        "a": "The <b>physician/clinician performing the procedure</b>. This responsibility cannot be fully delegated to a nurse or assistant who does not know the procedure."
    },
    {
        "q": "What is the role of a nurse or other clinical staff during the signing of a consent form?",
        "a": "They act as a <b>witness to the patient's signature</b> and verify that the patient signed voluntarily and appears to have capacity, but they do not explain the procedure's risks/benefits."
    },
    {
        "q": "Is a signed consent form equivalent to having obtained informed consent?",
        "a": "<b>No</b>. Consent is a <b>shared decision-making process</b> and communication dialogue; the signed form is merely documentation of that process."
    },
    {
        "q": "When is written (signed) informed consent typically required?",
        "a": "For <b>major invasive procedures</b> (e.g., surgeries, biopsies), anesthesia, blood transfusions, chemotherapy, and participation in clinical research."
    },
    {
        "q": "When is verbal or implied consent acceptable for clinical interventions?",
        "a": "For <b>routine, low-risk, non-invasive interventions</b> (e.g., taking blood pressure, physical exams, routine blood draws)."
    },
    {
        "q": "Can a patient withdraw their consent after signing a consent form?",
        "a": "<b>Yes</b>. A patient can withdraw consent at <b>any time</b>, even immediately before or during the procedure (if it can be stopped safely)."
    },
    {
        "q": "What is the definition of 'informed refusal'?",
        "a": "The process where a patient refuses a proposed intervention after being fully informed of the <b>risks, benefits, alternatives, and the specific risk of refusing</b> (including death/disability)."
    },
    {
        "q": "What is the clinical standard of communication when there is a language barrier during consent?",
        "a": "A <b>certified medical interpreter</b> must be used. Using family members or untrained bilingual staff is inappropriate due to high risk of translation errors."
    },
    {
        "q": "How should informed consent be obtained from a patient with a severe hearing or visual impairment?",
        "a": "Using <b>auxiliary aids</b> (e.g., sign language interpreters, written materials in large print/Braille, communication boards) to ensure comprehension."
    },
    {
        "q": "What does 'voluntariness' mean in the context of informed consent?",
        "a": "The patient's decision must be made <b>free from coercion, manipulation, or undue influence</b> by family, friends, or the medical team."
    },
    {
        "q": "What is the difference between coercion and persuasion in informed consent?",
        "a": "<b>Persuasion</b> uses rational arguments to guide the patient toward a medically sound choice; <b>coercion</b> uses threats or force, which invalidates consent."
    },
    {
        "q": "If a patient is randomized to a treatment arm in a clinical trial, what must the consent process explicitly disclose?",
        "a": "The <b>experimental nature</b> of the study, the process of <b>randomization</b>, the use of placebos (if applicable), and the right to withdraw at any time without penalty."
    },
    {
        "q": "In a double-blind clinical trial, can the consent form promise that the patient will receive the active drug?",
        "a": "<b>No</b>. It must state that the patient has a specific probability (e.g., 50%) of receiving a <b>placebo</b> instead of the active drug."
    },
    {
        "q": "What specific risks must be disclosed when obtaining consent for a blood transfusion?",
        "a": "Risks of <b>acute/delayed transfusion reactions</b>, lung injury (TRALI), circulatory overload (TACO), and transmission of infectious agents (HIV, hepatitis B/C)."
    },
    {
        "q": "What is 'opt-out' HIV testing consent?",
        "a": "The practice where a patient is informed that an HIV test will be performed <b>unless they refuse</b> (consent is implied unless the patient actively opts out)."
    },
    {
        "q": "Who must obtain consent for general anesthesia?",
        "a": "The <b>anesthesiologist or CRNA</b> administering the anesthesia, as it is separate from the surgical consent."
    },
    {
        "q": "If a surgical resident or medical student is going to perform parts of a procedure, does this need to be disclosed to the patient?",
        "a": "<b>Yes</b>. Patients have a right to know <b>who is performing their surgery</b>, and resident/student participation must be disclosed during consent."
    },
    {
        "q": "What does the Genetic Information Nondiscrimination Act (GINA) protect, and why is it disclosed during genetic testing consent?",
        "a": "GINA protects patients from <b>employment and health insurance discrimination</b> based on genetic test results; this is disclosed to address patient fears of testing."
    },
    {
        "q": "If a patient agrees to a procedure but refuses to hear any of the risks, is the consent still valid?",
        "a": "<b>Yes</b>, if they voluntarily execute a <b>patient waiver</b> of the right to be informed, which must be carefully documented."
    },
    {
        "q": "What is the primary goal of the 'teach-back' method in the consent process?",
        "a": "To assess and confirm the <b>patient's understanding</b> by asking them to explain the procedure and its risks in their own words."
    },

    # ===== Section 2: Exceptions to Informed Consent (Cards 26–45) =====
    {
        "q": "What are the four major legal and clinical exceptions to the requirement for informed consent?",
        "a": "1. <b>Emergency doctrine</b> (implied consent)<br>2. <b>Patient waiver</b><br>3. <b>Therapeutic privilege</b><br>4. <b>Court-ordered treatment</b>."
    },
    {
        "q": "What is the 'emergency doctrine' (implied consent)?",
        "a": "A legal presumption that an incapacitated patient would <b>consent to life- or limb-saving treatment</b> in an emergency when no surrogate is available."
    },
    {
        "q": "What four conditions must be met for the emergency doctrine to apply?",
        "a": "1. Imminent threat to <b>life or limb</b><br>2. Patient <b>lacks capacity</b><br>3. No <b>surrogate</b> is immediately reachable<br>4. No <b>prior known objection</b> (e.g., advance directive)."
    },
    {
        "q": "If an unconscious trauma patient requires an emergency thoracotomy and no family is present, what is the correct action?",
        "a": "Proceed immediately under the <b>emergency doctrine (implied consent)</b>; do not delay care to look for family if it endangers the patient."
    },
    {
        "q": "If an unconscious patient has a known, legally valid card in their wallet stating 'No Blood Transfusions' due to religious beliefs, can blood be given in an emergency?",
        "a": "<b>No</b>. A clear, documented, prior refusal overrides the emergency doctrine/implied consent."
    },
    {
        "q": "If an incapacitated patient's surrogate is reachable by phone during an emergency, does the emergency doctrine still allow the physician to act without calling?",
        "a": "<b>No</b>. If a surrogate is <b>immediately reachable</b>, their consent must be obtained; the emergency exception only applies if no surrogate is available."
    },
    {
        "q": "What is a 'patient waiver' of informed consent?",
        "a": "A deliberate decision by a patient to <b>relinquish their right to receive information</b> or make a treatment decision, delegating it to the physician or a surrogate."
    },
    {
        "q": "Is a patient waiver valid if the patient was pressured into it?",
        "a": "<b>No</b>. A waiver must be <b>informed and voluntary</b>; the patient must understand they have a right to information before choosing to waive it."
    },
    {
        "q": "What is 'therapeutic privilege'?",
        "a": "An extremely narrow exception allowing a physician to <b>withhold clinical information</b> if disclosure would cause immediate, severe physical or psychological harm to the patient."
    },
    {
        "q": "Under what circumstance is therapeutic privilege invalid?",
        "a": "It cannot be used simply because the physician fears the patient will <b>refuse a recommended treatment</b> if they hear the risks."
    },
    {
        "q": "Why is the use of therapeutic privilege discouraged in modern clinical practice?",
        "a": "Because it promotes <b>paternalism</b>, undermines patient autonomy, and is rarely justified by actual clinical evidence of severe harm."
    },
    {
        "q": "If a minor presents with a life-threatening injury and parents cannot be reached, what exception allows treatment?",
        "a": "The <b>emergency doctrine (implied consent)</b> applies to minors just as it does to adults to prevent death or permanent disability."
    },
    {
        "q": "When is compulsory treatment justified under the public health exception?",
        "a": "When a patient has a highly infectious disease that poses an <b>imminent threat to public safety</b> (e.g., active tuberculosis, quarantine orders)."
    },
    {
        "q": "Can a patient with active, infectious pulmonary tuberculosis refuse treatment and leave the hospital?",
        "a": "<b>No</b>. Public health laws allow for <b>involuntary confinement and treatment</b> to protect the community from transmission."
    },
    {
        "q": "What is the legal basis for involuntary psychiatric treatment under an emergency hold?",
        "a": "The state's <b>police power</b> and <i>parens patriae</i> doctrine, allowing temporary detention to prevent immediate danger to self or others."
    },
    {
        "q": "Does involuntary psychiatric commitment automatically give physicians the right to perform non-psychiatric surgical procedures without consent?",
        "a": "<b>No</b>. Involuntary commitment only covers psychiatric stabilization; for invasive medical procedures, consent must still be obtained from the patient or surrogate."
    },
    {
        "q": "What is 'implied consent' in routine, non-emergency clinical interactions?",
        "a": "Consent inferred from the patient's <b>non-verbal actions</b> (e.g., extending their arm when the nurse holds up a syringe for a flu shot)."
    },
    {
        "q": "What is the scope of treatment allowed under the emergency doctrine?",
        "a": "It is strictly limited to interventions necessary to <b>stabilize the immediate life- or limb-threatening condition</b>; elective or non-urgent procedures are not permitted."
    },
    {
        "q": "If a patient becomes incapacitated during surgery and a new, non-emergency finding is discovered, can the surgeon treat it?",
        "a": "<b>No</b>. If it is not an emergency, the surgeon must wait until the patient wakes up to obtain consent, or contact the designated surrogate."
    },
    {
        "q": "How should a physician document the use of the emergency exception to informed consent?",
        "a": "Document the <b>urgency of the threat</b>, the patient's <b>lack of capacity</b>, the unsuccessful attempts to contact a surrogate, and the clinical necessity of the intervention."
    },

    # ===== Section 3: Decision-Making Capacity vs. Legal Competence (Cards 46–65) =====
    {
        "q": "What is the difference between decision-making capacity and legal competence?",
        "a": "<b>Capacity</b> is a clinical determination made by a physician for a specific decision; <b>competence</b> is a global legal status determined by a judge."
    },
    {
        "q": "Who is legally authorized to determine a patient's competence?",
        "a": "Only a <b>judge in a court of law</b>."
    },
    {
        "q": "Who is authorized to assess a patient's decision-making capacity in a clinical setting?",
        "a": "Any <b>licensed physician or clinician</b> caring for the patient."
    },
    {
        "q": "Is a determination of decision-making capacity global or task-specific?",
        "a": "<b>Task-specific</b>. A patient may have capacity to make a simple decision (e.g., taking an oral antibiotic) but lack capacity for a complex one (e.g., bypass surgery)."
    },
    {
        "q": "Is capacity a permanent state?",
        "a": "<b>No</b>. Capacity is dynamic and can <b>fluctuate over time</b> due to delirium, medication effects, intoxication, or metabolic derangements."
    },
    {
        "q": "Does a psychiatric diagnosis (e.g., schizophrenia) automatically mean a patient lacks capacity?",
        "a": "<b>No</b>. Patients with psychiatric illnesses are presumed to have capacity unless their illness actively impairs their decision-making for the specific choice."
    },
    {
        "q": "Can a patient with mild-to-moderate dementia have decision-making capacity?",
        "a": "<b>Yes</b>. If they can understand, appreciate, reason, and choose regarding the specific treatment, they have capacity."
    },
    {
        "q": "What is 'fluctuating capacity' and how should clinicians manage it?",
        "a": "A state where capacity comes and goes (e.g., delirium, sundowning). Clinicians should try to conduct the consent process during <b>lucid intervals</b>."
    },
    {
        "q": "When should a clinician formally assess a patient's decision-making capacity?",
        "a": "When the patient's choice seems <b>irrational</b>, when they abruptly change their mind without explanation, or when there is cognitive impairment/acute change in mental status."
    },
    {
        "q": "What is the 'sliding scale' concept of capacity assessment?",
        "a": "The level of capacity required is proportional to the risk: a <b>higher level of capacity</b> is required to refuse a life-saving treatment than to accept a low-risk one."
    },
    {
        "q": "If a judge declares a patient legally incompetent, who is appointed to make their medical decisions?",
        "a": "A <b>court-appointed guardian or conservator</b>."
    },
    {
        "q": "If an incompetent patient has a court-appointed guardian, should the physician still involve the patient in discussions?",
        "a": "<b>Yes</b>. The physician should seek the patient's <b>assent</b> and respect their preferences to the extent possible, even though the guardian provides legal consent."
    },
    {
        "q": "What is the default legal assumption regarding the capacity of adult patients?",
        "a": "All adults are <b>presumed to have capacity</b> unless there is clear clinical evidence to the contrary."
    },
    {
        "q": "How does acute drug or alcohol intoxication affect a patient's capacity?",
        "a": "It causes <b>temporary lack of capacity</b>. Unless it is an emergency, invasive procedures should be delayed until the patient is sober."
    },
    {
        "q": "What is the primary clinical difference between delirium and dementia regarding capacity?",
        "a": "<b>Delirium</b> causes a temporary, fluctuating impairment that may resolve; <b>dementia</b> causes a progressive, irreversible decline in capacity."
    },
    {
        "q": "Can a patient have capacity to designate a healthcare proxy but lack capacity to consent to complex surgery?",
        "a": "<b>Yes</b>. Designating a proxy requires a lower level of cognitive function than understanding complex surgical risks and alternatives."
    },
    {
        "q": "Is a psychiatric consultation required for all capacity assessments?",
        "a": "<b>No</b>. The primary treating physician is responsible. Psychiatry should be consulted for complex cases, active psychosis, or severe depression."
    },
    {
        "q": "If a patient lacks capacity and has no designated proxy or family, who makes medical decisions?",
        "a": "A <b>court-appointed guardian</b>, or in some jurisdictions, an independent hospital ethics committee or two independent physicians."
    },
    {
        "q": "What legal document designates a surrogate decision-maker in the event of incapacity?",
        "a": "A <b>Durable Power of Attorney for Healthcare (DPOA-HC)</b> (also called a Healthcare Proxy)."
    },
    {
        "q": "What is a 'Living Will' and how does it differ from a Durable Power of Attorney for Healthcare?",
        "a": "A <b>Living Will</b> specifies wishes for end-of-life care; a <b>DPOA-HC</b> designates a person to make decisions. DPOA-HC is generally more flexible."
    },

    # ===== Section 4: Clinical Criteria for Capacity Assessment (Cards 66–90) =====
    {
        "q": "What are the four clinical criteria used to assess decision-making capacity?",
        "a": "1. Communicate a <b>clear choice</b><br>2. <b>Understand</b> relevant information<br>3. <b>Appreciate</b> the situation and consequences<br>4. Engage in <b>rational reasoning</b>."
    },
    {
        "q": "What does the criterion 'communicate a choice' require?",
        "a": "The patient must state a <b>clear, stable preference</b> that does not constantly waver or change back and forth."
    },
    {
        "q": "How does a clinician assess if a patient 'understands' the medical information?",
        "a": "Ask the patient to <b>paraphrase</b> the diagnosis, recommended treatment, risks, benefits, and alternatives in their own words."
    },
    {
        "q": "What does the criterion 'appreciate the consequences' mean?",
        "a": "The patient must recognize that they are <b>actually sick</b> and understand how the treatment or refusal will directly affect their health and life."
    },
    {
        "q": "What does the criterion 'rational reasoning' require?",
        "a": "The patient must be able to explain the <b>logical steps</b> they took to arrive at their decision, weighing the pros and cons."
    },
    {
        "q": "How can a clinician test if a patient can 'communicate a choice'?",
        "a": "Ask: 'What have you decided to do about the treatment we discussed?'"
    },
    {
        "q": "How can a clinician test if a patient 'understands' the proposed treatment?",
        "a": "Ask: 'In your own words, what is the procedure we are proposing, and what are the main risks?'"
    },
    {
        "q": "How can a clinician test if a patient 'appreciates' their diagnosis?",
        "a": "Ask: 'Do you believe you have this heart condition? What do you think will happen if you do not get the surgery?'"
    },
    {
        "q": "How can a clinician test a patient's 'rational reasoning'?",
        "a": "Ask: 'How did you weigh the benefits of surgery against the risk of bleeding? Why do you prefer this choice?'"
    },
    {
        "q": "If a patient's decision is based on a delusion, which capacity criterion is violated?",
        "a": "<b>Appreciation</b> and <b>rational reasoning</b> (e.g., refusing dialysis because they believe their kidneys are being controlled by aliens)."
    },
    {
        "q": "Can an adult with capacity refuse a life-saving blood transfusion based on religious beliefs (e.g., Jehovah's Witness)?",
        "a": "<b>Yes</b>. If the patient understands and appreciates the risk (death) and their choice is consistent with their values, they have capacity."
    },
    {
        "q": "Does a patient's choice need to align with the physician's recommendation to be considered capacitous?",
        "a": "<b>No</b>. Patients have the right to make <b>idiosyncratic or unconventional decisions</b>, as long as their reasoning process is intact and not based on delusion."
    },
    {
        "q": "What clinical instrument is the gold standard structured interview for assessing capacity?",
        "a": "The <b>MacArthur Competence Assessment Tool for Treatment (MacCAT-T)</b>."
    },
    {
        "q": "Does a perfect score on a Mini-Mental State Examination (MMSE) guarantee decision-making capacity?",
        "a": "<b>No</b>. The MMSE is a general cognitive screen; a patient can have normal cognition but lack capacity due to delusions or poor appreciation of a specific illness."
    },
    {
        "q": "Does a very low score on a cognitive screen (e.g., MMSE &lt; 15) automatically prove a patient lacks capacity?",
        "a": "<b>No</b>. It indicates severe cognitive impairment, but the patient may still have capacity to make simple choices (e.g., refusing a urinary catheter)."
    },
    {
        "q": "How does severe depression affect capacity?",
        "a": "It impairs <b>appreciation</b>. Cognitive distortion (e.g., 'I deserve to die') makes the patient indifferent to negative consequences or death."
    },
    {
        "q": "How does acute mania affect capacity?",
        "a": "It impairs <b>rational reasoning</b> and <b>appreciation</b> due to grandiosity, flight of ideas, and underestimation of risk."
    },
    {
        "q": "How should capacity be assessed in a patient with expressive aphasia?",
        "a": "Use non-verbal communication aids, writing, or communication boards; expressive language deficits alone <b>do not equal lack of capacity</b>."
    },
    {
        "q": "If a patient simply parrots back what the doctor said, does this prove 'understanding'?",
        "a": "<b>No</b>. Parroting shows intact short-term memory, not understanding. The patient must explain the concepts in their <b>own words</b>."
    },
    {
        "q": "What is the primary documentation requirement for a capacity assessment?",
        "a": "Write a clinical note documenting the patient's <b>exact statements</b> and how they met or failed to meet each of the four capacity criteria."
    },
    {
        "q": "Why does a patient who is actively suicidal lack capacity to refuse life-saving medical care?",
        "a": "Suicidal intent impairs their ability to <b>appreciate the value of life</b> and weigh consequences rationally, invalidating their refusal."
    },
    {
        "q": "What is 'anosognosia' and how does it impact capacity?",
        "a": "The neurological inability to recognize one's own deficit (e.g., after a stroke). It directly impairs the patient's <b>appreciation</b> of their condition, usually negating capacity."
    },
    {
        "q": "If a patient lacks capacity, is the surrogate's decision-making power absolute?",
        "a": "<b>No</b>. The surrogate must follow the <b>substituted judgment</b> standard (what the patient would have wanted) or the <b>best interests</b> standard."
    },
    {
        "q": "What is the 'substituted judgment standard'?",
        "a": "The principle that a surrogate should make the decision the <b>patient would have made</b> if they had capacity, based on the patient's known values and wishes."
    },
    {
        "q": "What is the 'best interests standard' and when is it used?",
        "a": "The principle of choosing what is <b>objectively best</b> for the patient; used when the patient's prior wishes and values are completely unknown."
    },

    # ===== Section 5: Minors and Consent (Cards 91–110) =====
    {
        "q": "What is the general rule regarding medical consent for minors?",
        "a": "Minors (under age 18) are legally presumed to lack capacity; consent must be obtained from a <b>parent or legal guardian</b>."
    },
    {
        "q": "What is the ethical concept of 'assent' in pediatrics?",
        "a": "The <b>agreement of the child</b> to undergo a treatment, ethically recommended for children who are developmentally mature enough (typically age $\\\\ge$ 7)."
    },
    {
        "q": "What is the mature minor doctrine?",
        "a": "A common law doctrine allowing minors who show <b>adult-like maturity</b> to consent to certain medical treatments without parental involvement."
    },
    {
        "q": "What is an 'emancipated minor'?",
        "a": "A minor who has acquired the <b>legal rights of an adult</b>, including the right to consent to all medical treatments."
    },
    {
        "q": "What are the four typical criteria for minor emancipation?",
        "a": "1. <b>Marriage</b><br>2. <b>Parenthood</b> (being a parent)<br>3. Active duty <b>military service</b><br>4. <b>Financial independence</b> (living apart from parents and managing own finances)."
    },
    {
        "q": "Does a minor becoming pregnant automatically make them emancipated in all states?",
        "a": "<b>No</b>. Pregnancy permits consent for pregnancy-related care, but the minor is not fully emancipated for other, unrelated medical decisions."
    },
    {
        "q": "If an emancipated minor refuses a highly beneficial treatment, can their parents override that decision?",
        "a": "<b>No</b>. An emancipated minor has the same legal status as an adult; parents have <b>no legal authority</b> over their medical decisions."
    },
    {
        "q": "If parents refuse life-saving treatment (e.g., blood transfusion) for their child due to religious reasons, what is the physician's immediate obligation?",
        "a": "In an emergency, <b>administer the life-saving treatment</b>. In a non-emergency, seek a <b>court order</b> to override parental refusal."
    },
    {
        "q": "Can parents refuse standard, life-saving vaccinations for their child based on religious beliefs in a non-emergency?",
        "a": "<b>Yes</b>, unless there is a state mandate or public health emergency. Unlike acute life-saving care, courts rarely force routine preventative vaccines against parental wishes."
    },
    {
        "q": "Under what standard do courts override parental medical decisions?",
        "a": "The <b>best interests of the child</b> standard. If parental refusal puts the child at risk of death or serious permanent harm, the court will intervene."
    },
    {
        "q": "Can parents consent to a high-risk, non-therapeutic research study on their child?",
        "a": "<b>No</b>. Parents cannot subject their children to significant medical risk with <b>no expected benefit</b>; IRB/research guidelines strictly forbid this."
    },
    {
        "q": "In joint custody, does a clinician need the consent of both parents for routine medical care?",
        "a": "<b>No</b>. Consent from <b>either parent</b> is legally sufficient for routine care, though it is best practice to have both agree on major decisions."
    },
    {
        "q": "If parents are divorced and disagree on a major, non-emergency surgery for their child, how should the physician proceed?",
        "a": "Delay the surgery (if safe) and advise the parents to resolve the dispute, or seek guidance from a <b>hospital ethics committee</b> or court."
    },
    {
        "q": "Can a foster parent consent to major, elective surgery for a foster child?",
        "a": "<b>No</b>. Consent authority usually remains with the <b>state social worker</b> or biological parents, depending on the court order."
    },
    {
        "q": "Can a mature minor refuse life-saving oncology treatment?",
        "a": "<b>No</b>. Courts almost never grant minors the right to refuse life-saving care, though exceptions exist for terminally ill mature minors."
    },
    {
        "q": "If child abuse is suspected, is parental consent required for a forensic evaluation or hospital admission?",
        "a": "<b>No</b>. If abuse is suspected, the physician has a duty to protect the child, and parental refusal cannot prevent the evaluation."
    },
    {
        "q": "What is the 'Rule of Sevens' historically used in pediatric consent?",
        "a": "Under 7: lacks capacity; 7–14: rebuttable presumption of incapacity; 14–21: rebuttable presumption of capacity (now largely replaced by individual maturity assessments)."
    },
    {
        "q": "If a 16-year-old minor is living with their parents but is fully self-supporting and pays rent, are they emancipated?",
        "a": "<b>No</b>. Emancipation through financial independence typically requires <b>living apart</b> from parents in addition to self-support."
    },
    {
        "q": "Does a minor parent have the authority to consent to medical care for their own child?",
        "a": "<b>Yes</b>. A minor parent has full authority to make medical decisions for their child, even if they cannot consent to their own general care."
    },
    {
        "q": "If a 17-year-old minor is married but their spouse is also a minor, are they emancipated?",
        "a": "<b>Yes</b>. The minor's marriage itself grants <b>legal emancipation</b>, regardless of the spouse's age."
    },

    # ===== Section 6: Specific Exceptions for Minor Consent (Cards 111–130) =====
    {
        "q": "What are the six common clinical domains where minors can consent without parental knowledge or consent?",
        "a": "1. <b>Contraception</b><br>2. <b>Pregnancy care</b><br>3. <b>STI treatment</b><br>4. <b>Substance abuse</b> treatment<br>5. <b>Emergency care</b><br>6. <b>Mental health</b> counseling."
    },
    {
        "q": "Can a 15-year-old obtain a prescription for oral contraceptives without parental consent?",
        "a": "<b>Yes</b>, in almost all US states, to promote reproductive health and prevent unintended pregnancy."
    },
    {
        "q": "Does the exception for pregnancy care allow a minor to consent to a Caesarean section?",
        "a": "<b>Yes</b>. Minors can consent to <b>all medical care related to pregnancy</b>, including prenatal care, labor and delivery, and C-sections."
    },
    {
        "q": "What is the state-by-state rule regarding minor consent for abortion?",
        "a": "Most states require <b>parental notification or consent</b>, but they must provide a <b>judicial bypass</b> option where a judge can approve the abortion."
    },
    {
        "q": "What is a 'judicial bypass' in the context of minor abortion?",
        "a": "A legal process where a minor can ask a judge to authorize an abortion <b>without parental notification</b>, by proving they are mature enough or that the abortion is in their best interest."
    },
    {
        "q": "Can a minor receive testing and treatment for gonorrhea or chlamydia without parental knowledge?",
        "a": "<b>Yes</b>. All 50 states allow minors to consent to <b>STI diagnosis and treatment</b> to prevent public health spread."
    },
    {
        "q": "Can a minor consent to HIV pre-exposure prophylaxis (PrEP) or post-exposure prophylaxis (PEP) without parental consent?",
        "a": "<b>Yes</b>, in most states, under the STI prevention and treatment statutes."
    },
    {
        "q": "Can a 16-year-old consent to outpatient substance abuse treatment?",
        "a": "<b>Yes</b>. Outpatient drug and alcohol rehabilitation is widely permitted to <b>remove barriers</b> to addiction care."
    },
    {
        "q": "Does a minor's right to consent to substance abuse treatment cover involuntary inpatient admission?",
        "a": "<b>No</b>. Involuntary or inpatient rehabilitation typically requires <b>parental consent</b> or a court order."
    },
    {
        "q": "Can a 14-year-old consent to outpatient psychotherapy/counseling without parental knowledge?",
        "a": "<b>Yes</b>, in many states, though the number of sessions or scope may be limited by state law."
    },
    {
        "q": "If a minor consents to confidential STI treatment, does the physician have a right to inform the parents?",
        "a": "<b>No</b>. The minor has a <b>right to confidentiality</b> regarding services they are legally authorized to consent to."
    },
    {
        "q": "Under what circumstances must a physician breach a minor's confidentiality?",
        "a": "If the minor is at risk for <b>suicide, homicide, severe abuse/neglect</b>, or if they have a life-threatening illness that requires parental intervention."
    },
    {
        "q": "What billing issue often compromises minor confidentiality, and how should clinicians address it?",
        "a": "The <b>Explanation of Benefits (EOB)</b> sent to the parent's insurance. Clinicians should warn the minor and offer low-cost or free public health clinics."
    },
    {
        "q": "Can a minor consent to gender-affirming hormone therapy without parental consent?",
        "a": "<b>No</b>. Gender-affirming care is highly regulated and generally requires <b>parental consent</b> (and is restricted in several states)."
    },
    {
        "q": "Can a minor consent to receive the HPV vaccine without parental consent?",
        "a": "<b>Generally no</b>. While some states/cities (like California) allow minors of a certain age to consent to STD-preventing vaccines, most states require parental consent."
    },
    {
        "q": "Can a minor consent to elective cosmetic surgery?",
        "a": "<b>No</b>. Elective cosmetic procedures require <b>parental consent</b>."
    },
    {
        "q": "If a minor is sexually assaulted, can they consent to a forensic examination and emergency contraception?",
        "a": "<b>Yes</b>. Minors can consent to emergency care, STI treatment, and forensic exams post-assault without parental notification."
    },
    {
        "q": "Can a minor consent to outpatient psychiatric medication (e.g., antidepressants) without parental consent?",
        "a": "<b>Usually no</b>. While outpatient talk therapy is often permitted, prescribing psychiatric medication typically requires <b>parental consent</b>."
    },
    {
        "q": "If a minor patient requests confidential care, how should the physician document the visit?",
        "a": "Document the clinical findings and discussions in a <b>secure, confidential section</b> of the electronic health record to prevent parental access via patient portals."
    },
    {
        "q": "Does a minor's legal right to consent to STI care include consent for partner notification/treatment (EPT)?",
        "a": "<b>Yes</b>. Expedited Partner Therapy (EPT) is allowed, and the minor can facilitate treatment for their partner under public health provisions."
    }
]

# Write to the file
filepath = r"c:\Users\Hasan-PC\Desktop\MedHelp\scratch\cards_ethics_consent.js"

with open(filepath, "w", encoding="utf-8") as f:
    f.write("const CARDS_ETHICS_CONSENT = [\n")
    for i, c in enumerate(cards):
        # We format as { q: "...", a: "..." }
        # Let's ensure proper escaping for javascript quotes
        q_escaped = c["q"].replace('"', '\\"').replace("'", "\\'")
        a_escaped = c["a"].replace('"', '\\"').replace("'", "\\'")
        comma = "," if i < len(cards) - 1 else ""
        f.write(f'  {{ q: "{q_escaped}", a: "{a_escaped}" }}{comma}\n')
    f.write("];\n")

print(f"Successfully generated {len(cards)} cards at: {filepath}")

# Validate unique questions
questions = [c["q"] for c in cards]
unique_qs = set(questions)
print(f"Total cards: {len(cards)}")
print(f"Unique questions: {len(unique_qs)}")
if len(cards) != len(unique_qs):
    print("WARNING: Duplicate questions found!")
    # Find duplicates
    seen = set()
    for q in questions:
        if q in seen:
            print(f"Duplicate: {q}")
        seen.add(q)
else:
    print("All cards are unique!")
