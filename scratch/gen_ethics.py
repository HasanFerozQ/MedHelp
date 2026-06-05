import json

cards = [
    {
        "q": "What are the four core principles of medical ethics?",
        "a": "<b>Autonomy</b>, <b>Beneficence</b>, <b>Non-maleficence</b>, and <b>Justice</b>."
    },
    {
        "q": "What is the definition of patient autonomy?",
        "a": "The ethical principle that respects a competent patient's right to <b>self-determination</b> and to make decisions about their own medical care."
    },
    {
        "q": "What three elements are required for a patient's medical decision to be considered autonomous?",
        "a": "The patient must have <b>decision-making capacity</b>, the decision must be <b>informed</b>, and it must be made <b>voluntarily</b> (free from coercion)."
    },
    {
        "q": "What is the clinical difference between 'capacity' and 'competence'?",
        "a": "<b>Capacity</b> is a clinical determination made by a physician for a specific decision. <b>Competence</b> is a legal status determined by a judge."
    },
    {
        "q": "What are the four components of clinical decision-making capacity?",
        "a": "The patient must be able to: (1) <b>communicate a choice</b>, (2) <b>understand</b> the clinical information, (3) <b>appreciate</b> the consequences/situation, and (4) <b>reason</b> through the options."
    },
    {
        "q": "Can a patient diagnosed with chronic schizophrenia or dementia have decision-making capacity?",
        "a": "<b>Yes</b>. Capacity is decision-specific and time-specific; a patient with psychiatric illness may still have capacity during a lucid interval or for simpler choices."
    },
    {
        "q": "What information must be disclosed to a patient to obtain valid informed consent?",
        "a": "The <b>diagnosis</b>, the <b>nature</b> and purpose of the treatment, the <b>risks and benefits</b>, any <b>alternatives</b> (including no treatment), and the risks of refusal."
    },
    {
        "q": "What is the ethical exception known as 'therapeutic privilege'?",
        "a": "A rare exception where a physician can withhold diagnostic or treatment information if disclosure would cause <b>immediate, severe psychological harm or decompensation</b> (e.g., acute suicidality)."
    },
    {
        "q": "Can a patient waive their right to informed consent?",
        "a": "<b>Yes</b>. A competent patient can waive this right and request that the physician make the decision or delegate it to a surrogate."
    },
    {
        "q": "What is informed refusal?",
        "a": "A competent patient's right to <b>refuse any medical treatment or intervention</b>, even if that refusal will result in permanent injury or death."
    },
    {
        "q": "What is the physician's first step when a competent patient refuses life-saving treatment?",
        "a": "<b>Explore the patient's reasons</b> for refusal, correct any misconceptions, and ensure they fully understand the consequences (including death)."
    },
    {
        "q": "What is the definition of beneficence?",
        "a": "The duty of the healthcare provider to act in the <b>best interest of the patient</b> and to promote their well-being."
    },
    {
        "q": "When a competent patient's choice conflicts with the physician's recommendation, which principle takes precedence?",
        "a": "<b>Autonomy</b> overrides beneficence. A competent patient has the right to make decisions that do not align with the physician's view of their best interest."
    },
    {
        "q": "When is paternalism (overriding autonomy for the patient's supposed benefit) ethically justified?",
        "a": "Only in <b>emergency situations</b> when the patient lacks capacity, no surrogate or advance directive is available, and delay would cause death or severe harm."
    },
    {
        "q": "What is the definition of non-maleficence?",
        "a": "The ethical duty to <b>do no harm</b> to the patient."
    },
    {
        "q": "What is the principle of double effect?",
        "a": "An action with a known harmful effect is ethical if the action is intended to achieve a <b>beneficial primary effect</b> (e.g., giving high-dose morphine to relieve terminal pain, even if it risks respiratory depression)."
    },
    {
        "q": "Is there an ethical or legal distinction between withholding (not starting) and withdrawing (stopping) life-sustaining treatment?",
        "a": "<b>No</b>. Withholding and withdrawing treatment are ethically and legally equivalent."
    },
    {
        "q": "Under what condition can a physician ethically withdraw or withhold life-sustaining treatment?",
        "a": "When the treatment is determined to be <b>medically futile</b>, when it no longer aligns with the patient's goals/values, or when requested by a competent patient or their surrogate."
    },
    {
        "q": "What is the definition of distributive justice?",
        "a": "The ethical obligation to distribute healthcare resources, benefits, and burdens <b>fairly and equitably</b> across society."
    },
    {
        "q": "What criteria should be used to allocate organs for transplantation under the principle of justice?",
        "a": "<b>Objective medical criteria</b>: urgency, likelihood of success, and time on the waiting list. (Social worth, wealth, or self-inflicted nature of disease must not be used)."
    },
    {
        "q": "In a mass casualty disaster triage, how are resources allocated?",
        "a": "Based on <b>utilitarian principles</b>: maximizing the total number of lives saved by prioritizing those who can survive with immediate, limited intervention."
    },
    {
        "q": "What is compensatory justice in healthcare?",
        "a": "Providing resources or special care to individuals or groups to <b>make up for past injustices or systemic disadvantages</b> they have suffered."
    },
    {
        "q": "How does the principle of justice apply to the design of clinical trials?",
        "a": "By ensuring <b>fair subject selection</b>: vulnerable populations should not be exploited, and the benefits and risks of the research must be shared equitably."
    },
    {
        "q": "If a patient demands a treatment that is medically futile, which ethical principles justify refusing the request?",
        "a": "<b>Non-maleficence</b> (avoiding useless risk/harm) and <b>Justice</b> (avoiding wasting limited healthcare resources)."
    },
    {
        "q": "How is the conflict between patient confidentiality and public safety resolved when a patient has a highly contagious disease?",
        "a": "<b>Justice and public safety override confidentiality</b>; the physician is ethically and legally obligated to report the case to public health authorities."
    },
    {
        "q": "What is the primary purpose of the Health Insurance Portability and Accountability Act (HIPAA)?",
        "a": "To protect the privacy and security of a patient's <b>Protected Health Information (PHI)</b>."
    },
    {
        "q": "What is Protected Health Information (PHI) under HIPAA?",
        "a": "Any health information that can be linked to a specific individual, including <b>name, date of birth, medical record number, and billing records</b>."
    },
    {
        "q": "Does a patient's right to confidentiality end when they die?",
        "a": "<b>No</b>. Under HIPAA, protected health information remains confidential for <b>50 years</b> after the patient's death."
    },
    {
        "q": "Is discussing a patient's clinical case in a hospital elevator with a colleague acceptable under HIPAA?",
        "a": "<b>No</b>. This is a confidentiality breach because unauthorized individuals in the elevator may overhear <b>identifiable patient information</b>."
    },
    {
        "q": "Can a physician disclose details of a patient's medical condition to their spouse without the patient's consent?",
        "a": "<b>No</b>. The physician cannot share PHI with family members, including spouses, without the patient's <b>explicit permission</b>."
    },
    {
        "q": "If a family member is present in the examination room, can the physician discuss the patient's diagnosis?",
        "a": "<b>Yes</b>, if the patient is present and <b>does not object</b>, or if the physician can reasonably infer consent based on the circumstances."
    },
    {
        "q": "When can a physician share PHI without patient consent for the purpose of coordinating care?",
        "a": "Between <b>healthcare providers</b> who are actively treating the patient, for purposes of treatment, payment, or healthcare operations."
    },
    {
        "q": "What is the physician's mandatory reporting obligation for suspected child abuse or neglect?",
        "a": "The physician must report <b>immediately</b> to Child Protective Services (CPS) or law enforcement. Only <b>reasonable suspicion</b> is required; proof is not needed."
    },
    {
        "q": "Is parental consent required for a physician to report suspected child abuse?",
        "a": "<b>No</b>. Parental consent is not required, and notifying the parents of the report is discouraged if it places the child in further danger."
    },
    {
        "q": "What legal protection does a physician have if a good-faith report of child abuse turns out to be false?",
        "a": "The physician has <b>complete civil and criminal immunity</b> from liability for reporting suspected abuse in good faith."
    },
    {
        "q": "What is the physician's obligation regarding suspected elder abuse or neglect?",
        "a": "The physician must report the suspicion <b>immediately</b> to Adult Protective Services (Services for the Aging) or law enforcement."
    },
    {
        "q": "Must a physician report intimate partner violence (IPV) in a competent adult to the police without the patient's consent?",
        "a": "<b>No</b>. Reporting IPV without consent is generally a violation of confidentiality and can endanger the patient. The physician should offer safety resources and counseling."
    },
    {
        "q": "What are the exceptions where IPV must be reported even without patient consent?",
        "a": "If the abuse involves a <b>gunshot wound, stab wound, severe injury from a weapon</b>, or if children or vulnerable elders are also being abused or neglected."
    },
    {
        "q": "What is the physician's obligation when treating a patient with a gunshot or stab wound?",
        "a": "The physician is legally mandated to report the injury to <b>law enforcement authorities immediately</b>, regardless of the patient's wishes."
    },
    {
        "q": "What is the ethical justification for mandatory reporting of certain infectious diseases to public health departments?",
        "a": "The principle of <b>Justice</b> (protecting public health and preventing the spread of dangerous pathogens overrides individual confidentiality)."
    },
    {
        "q": "Name three sexually transmitted infections that are typically reportable by law to public health authorities.",
        "a": "<b>HIV/AIDS</b>, <b>Syphilis</b>, <b>Gonorrhea</b>, and <b>Chlamydia</b>."
    },
    {
        "q": "Must active tuberculosis (TB) be reported to public health authorities?",
        "a": "<b>Yes</b>. Active TB is a highly infectious public health threat and is a mandatory reportable disease in all states."
    },
    {
        "q": "What is the physician's duty if an HIV-positive patient refuses to inform their sexual partner of their status?",
        "a": "The physician should encourage the patient to disclose, but if they refuse, the physician has a duty to protect and may notify the partner or public health authorities depending on state law."
    },
    {
        "q": "If a patient expresses a specific, credible plan to commit suicide, can the physician breach confidentiality?",
        "a": "<b>Yes</b>. The physician must breach confidentiality to ensure the patient's safety, typically via involuntary psychiatric hold/hospitalization."
    },
    {
        "q": "What is the legal precedent established by the Tarasoff v. Regents of the University of California case?",
        "a": "The <b>'Duty to Protect'</b> (or 'Duty to Warn'): a therapist/physician must take reasonable steps to protect a third party if a patient poses an imminent, specific threat of violence to them."
    },
    {
        "q": "What actions satisfy the Tarasoff 'duty to protect'?",
        "a": "<b>Notifying the police</b> and making a reasonable effort to <b>warn the intended victim</b> directly."
    },
    {
        "q": "Does the Tarasoff duty apply if a patient makes a vague, generalized threat like 'I hate everyone and want to hurt someone'?",
        "a": "<b>No</b>. The threat must be serious, imminent, and directed at a <b>specific, identifiable victim</b>."
    },
    {
        "q": "Under what circumstances must a death be reported to the Medical Examiner (ME) or Coroner?",
        "a": "Any death that is <b>violent, accidental, sudden/unexpected, suspicious</b>, or occurs within <b>24 hours of hospital admission</b>."
    },
    {
        "q": "If a patient dies on the operating table during a routine surgery, must this be reported to the Medical Examiner?",
        "a": "<b>Yes</b>. All perioperative, intraoperative, and anesthesia-related deaths must be reported to the ME."
    },
    {
        "q": "Can a family refuse a Medical Examiner autopsy if they object on religious grounds?",
        "a": "<b>No</b>. If a death falls under ME jurisdiction, the ME has the legal authority to perform an autopsy regardless of family objections."
    },
    {
        "q": "Can a physician disclose a patient's genetic mutation to their siblings if it places them at high risk?",
        "a": "<b>No</b>. Genetic information is protected PHI and cannot be disclosed to family members without the patient's <b>explicit consent</b>."
    },
    {
        "q": "What is the Genetic Information Nondiscrimination Act (GINA)?",
        "a": "A federal law that prohibits health insurance companies and employers from discriminating based on <b>genetic information</b>. (It does not apply to life or disability insurance)."
    },
    {
        "q": "What is the general rule for minor confidentiality in reproductive healthcare?",
        "a": "Minors have the right to confidential services for <b>contraception, pregnancy care, STI testing/treatment, and substance abuse counseling</b> in most states."
    },
    {
        "q": "When can adolescent confidentiality be breached by a physician?",
        "a": "In cases of suspected <b>child abuse, active suicidal ideation, homicidal threats</b>, or when state law requires parental notification for specific procedures (e.g., abortion)."
    },
    {
        "q": "Does checking a state's Prescription Drug Monitoring Program (PDMP) database require patient consent?",
        "a": "<b>No</b>. Checking the PDMP is a standard clinical practice for prescribing controlled substances and is permitted under HIPAA for <b>coordination of treatment</b>."
    },
    {
        "q": "What is a surrogate decision-maker?",
        "a": "An individual designated or legally authorized to make medical decisions on behalf of an <b>incapacitated patient</b>."
    },
    {
        "q": "What is the default legal hierarchy of surrogate decision-makers if no healthcare proxy is appointed?",
        "a": "<b>Spouse</b> &rarr; <b>adult children</b> &rarr; <b>parents</b> &rarr; <b>adult siblings</b> &rarr; other relatives or close friends."
    },
    {
        "q": "What is a Durable Power of Attorney for Healthcare (Healthcare Proxy)?",
        "a": "A legal document in which a patient designates a specific agent to make medical decisions if the patient loses <b>decision-making capacity</b>."
    },
    {
        "q": "Who has priority in decision-making: the patient's spouse or an appointed Healthcare Proxy who is a friend?",
        "a": "The <b>appointed Healthcare Proxy</b> has priority over all family members, including the spouse."
    },
    {
        "q": "What is a Living Will?",
        "a": "A written document outlining a patient's specific preferences regarding <b>life-sustaining treatments</b> if they become terminally ill or persistently vegetative."
    },
    {
        "q": "If a patient's Living Will conflicts with the current decision of their Healthcare Proxy, which usually takes precedence?",
        "a": "The <b>Healthcare Proxy</b>, because they can apply the patient's values to the specific, evolving clinical scenario, unless the living will contains an explicit directive for that exact situation."
    },
    {
        "q": "What is the substituted judgment standard?",
        "a": "The surrogate must make the decision that the <b>patient would have wanted</b>, based on the patient's previously expressed wishes, values, and beliefs."
    },
    {
        "q": "What is the best interest standard?",
        "a": "The surrogate must choose the option that provides the <b>greatest net benefit and least harm</b> to the patient, used when the patient's own wishes are unknown."
    },
    {
        "q": "When must the best interest standard be used instead of the substituted judgment standard?",
        "a": "When the patient has <b>never had capacity</b> (e.g., infants, young children) or when an adult patient's prior wishes and values are <b>entirely unknown</b>."
    },
    {
        "q": "What ethical standard governs parental decision-making for minor children?",
        "a": "The <b>best interest standard</b>, as children have not yet formed or articulated their own autonomous values."
    },
    {
        "q": "What should a physician do if parents refuse life-saving emergency therapy (e.g., blood transfusion) for their minor child?",
        "a": "<b>Administer the life-saving treatment</b> immediately, and seek an emergency court order if time permits. Parents cannot refuse life-saving care for minors based on religious beliefs."
    },
    {
        "q": "Is parental consent required to treat a minor in a life-threatening emergency?",
        "a": "<b>No</b>. Emergency care to prevent death or serious harm must proceed immediately under the <b>emergency exception to consent</b>."
    },
    {
        "q": "What is the mature minor doctrine?",
        "a": "A legal rule allowing minors (usually 15 years or older) who display adult-like maturity to <b>consent to or refuse medical treatments</b> without parental involvement."
    },
    {
        "q": "What conditions typically qualify a minor as an 'emancipated minor'?",
        "a": "Being <b>financially independent/self-supporting</b>, <b>married</b>, <b>active duty in the military</b>, or <b>a parent themselves</b>."
    },
    {
        "q": "Does an emancipated minor require parental consent for non-emergency medical procedures?",
        "a": "<b>No</b>. Emancipated minors have full legal rights to consent to all of their own medical care."
    },
    {
        "q": "Can a pregnant minor consent to her own prenatal care and make medical decisions for her child once it is born?",
        "a": "<b>Yes</b>. In most states, pregnant minors can consent to prenatal care, and once the child is born, the minor mother has full authority to make decisions for the child."
    },
    {
        "q": "What is a 'judicial bypass' in the context of minor abortion laws?",
        "a": "A legal pathway in states with parental consent laws where a minor can request a <b>judge's permission</b> for an abortion by showing they are mature enough or that it is in their best interest."
    },
    {
        "q": "Can a minor be tested and treated for a sexually transmitted infection without parental knowledge?",
        "a": "<b>Yes</b>. All 50 states allow minors to consent to confidential <b>STI testing and treatment</b> without parental consent or notification."
    },
    {
        "q": "What did the federal 'Baby Doe' regulations establish?",
        "a": "They require that disabled infants receive <b>all life-sustaining medical treatments</b> unless the treatment is medically futile or inhumane."
    },
    {
        "q": "What is qualitative futility?",
        "a": "When a treatment can preserve life but fails to achieve a quality of life that the patient would find acceptable or capable of enjoying (e.g., permanent unconsciousness)."
    },
    {
        "q": "What is quantitative futility?",
        "a": "When the probability that a medical intervention will achieve its physiological goal is <b>extremely low</b> (typically <1% chance of success)."
    },
    {
        "q": "What does a Do Not Resuscitate (DNR) order specify, and does it apply to other treatments?",
        "a": "It specifies that <b>CPR, intubation, and defibrillation</b> should not be performed in cardiac/respiratory arrest. It does <b>not</b> restrict other treatments like antibiotics, IV fluids, or pressors."
    },
    {
        "q": "If a surrogate demands CPR for a patient who has a valid, documented DNR order, what is the correct action?",
        "a": "<b>Honor the DNR order</b>. Educate the surrogate about the patient's documented wishes and do not perform CPR."
    },
    {
        "q": "If family members disagree on withdrawing life support for an incapacitated patient, what is the first step?",
        "a": "Hold a <b>family meeting</b> to clarify the patient's prognosis, focus discussions on what the patient would have wanted (substituted judgment), and seek consensus."
    },
    {
        "q": "What is the primary role of a hospital ethics committee during a dispute?",
        "a": "To act as an <b>advisory body</b> that provides consultation, clarifies ethical issues, and helps mediate disputes between families and the medical team."
    },
    {
        "q": "How should decisions be made for an incapacitated patient with no advance directive, family, or friends?",
        "a": "The physician should consult the <b>hospital ethics committee</b> or seek a <b>court-appointed guardian</b> to make treatment decisions."
    },
    {
        "q": "What is the legal definition of brain death?",
        "a": "The <b>irreversible cessation of all functions of the entire brain</b>, including the brainstem. It is recognized as legal death in all 50 states."
    },
    {
        "q": "Is family consent required to discontinue mechanical ventilation after a patient is declared brain dead?",
        "a": "<b>No</b>. Once brain death is legally declared, the patient is dead. Consent is not required to stop support, but the family should be notified and treated with compassion."
    },
    {
        "q": "How does a Persistent Vegetative State (PVS) differ legally from brain death?",
        "a": "In PVS, the brainstem is intact (spontaneous breathing, sleep-wake cycles occur), but cognitive function is lost. PVS is <b>not legal death</b>, and surrogate consent is required to withdraw support."
    },
    {
        "q": "If a deceased patient is a registered organ donor but the family objects, what is the legal standing of the donation?",
        "a": "The patient's <b>first-person consent is legally binding</b>, and the family cannot legally veto it (though transplant coordinators work to resolve conflicts sensitively)."
    },
    {
        "q": "Is it ethical to accept a $500 cash gift from a patient?",
        "a": "<b>No</b>. Large cash or valuable gifts must be declined as they can compromise professional objectivity and create an improper power dynamic."
    },
    {
        "q": "What types of patient-offered gifts are acceptable for a physician to accept?",
        "a": "<b>Small, inexpensive, or homemade gifts</b> (e.g., home-baked cookies, a small book) that express gratitude without expecting special treatment."
    },
    {
        "q": "Can a physician accept a pharmaceutical-company-sponsored trip or luxury dinner?",
        "a": "<b>No</b>. Accepting lavish gifts, trips, or meals from industry is unethical because it introduces financial bias into clinical decision-making."
    },
    {
        "q": "Are physicians allowed to accept small branded items (like pens or note pads) from pharmaceutical companies?",
        "a": "<b>No</b>. Current guidelines prohibit accepting any branded promotional items from industry to prevent subtle prescribing biases."
    },
    {
        "q": "Is a sexual or romantic relationship with a current patient ever acceptable?",
        "a": "<b>Never</b>. It is an absolute boundary violation and is always unethical due to the inherent power imbalance."
    },
    {
        "q": "Can a physician date a former patient?",
        "a": "It is highly discouraged. In <b>psychiatry</b>, there is an <b>absolute lifetime ban</b>. In other specialties, it depends on the time elapsed, nature of care, and risk of exploitation."
    },
    {
        "q": "Why is there a permanent lifetime ban on romantic relationships with former psychiatric patients?",
        "a": "Because of the intense <b>transference</b> and emotional vulnerability established during psychotherapy, which permanently skews the power dynamic."
    },
    {
        "q": "Is it ethical for a physician to prescribe controlled substances for themselves or close family members?",
        "a": "<b>No</b>. Self-prescribing or treating family members with controlled substances is unethical and prohibited due to lack of clinical objectivity."
    },
    {
        "q": "When is it acceptable for a physician to treat a family member?",
        "a": "Only in <b>emergencies</b> when no other physician is available, or for minor, routine, self-limiting conditions."
    },
    {
        "q": "What is the first step when a patient is non-compliant with their treatment regimen?",
        "a": "<b>Investigate the underlying causes</b> (e.g., cost, side effects, cultural beliefs, misunderstanding, or physical limitations) rather than judging or dismissing the patient."
    },
    {
        "q": "How should a physician handle an angry, shouting, or verbally abusive patient?",
        "a": "Remain calm, <b>de-escalate the situation</b>, listen to grievances, but set clear, firm boundaries regarding safe and respectful behavior."
    },
    {
        "q": "Under what conditions can a physician ethically terminate a patient-physician relationship?",
        "a": "When there is a <b>breakdown of the therapeutic relationship</b> (e.g., patient abuse, persistent non-compliance), provided it does not constitute patient abandonment."
    },
    {
        "q": "What is patient abandonment?",
        "a": "Severing the patient-physician relationship without giving the patient <b>sufficient notice</b> or providing resources to secure alternative medical care."
    },
    {
        "q": "What steps must a physician take to legally and ethically dismiss a patient from their practice?",
        "a": "Provide <b>written notice</b> (typically 30 days in advance), offer to transfer medical records, recommend new providers, and provide emergency coverage during the transition."
    },
    {
        "q": "Can a physician refuse to treat a patient because they have an infectious disease like HIV or Hepatitis C?",
        "a": "<b>No</b>. Refusing care solely based on infectious status is discrimination and is a violation of professional ethics."
    },
    {
        "q": "Should a hospital accommodate a patient's request for a physician of a specific race or gender?",
        "a": "<b>Yes, if feasible</b>, to build trust and comfort, unless the request is driven by abusive hostility or is an emergency where delay would harm the patient."
    },
    {
        "q": "When should a chaperone be present during physical exams?",
        "a": "During all <b>sensitive physical examinations</b> (breast, pelvic, genital, rectal) regardless of the gender of the patient or the physician."
    },
    {
        "q": "What is the difference between a boundary crossing and a boundary violation?",
        "a": "A <b>boundary crossing</b> is a non-exploitative deviation from standard practice that may benefit the patient. A <b>boundary violation</b> is harmful, exploitative, and unprofessional."
    },
    {
        "q": "Can a bilingual family member translate for a patient during a consent discussion?",
        "a": "<b>No</b>. A trained, professional <b>medical interpreter</b> must be used to ensure accuracy and objectivity, unless in an immediate, life-threatening emergency."
    },
    {
        "q": "Is a physician ethically required to disclose a medical error to a patient if the error caused no physical harm?",
        "a": "<b>Yes</b>. Integrity and truth-telling demand the disclosure of all significant medical errors, regardless of whether harm occurred."
    },
    {
        "q": "What are the essential elements of an ethical medical error disclosure?",
        "a": "A clear explanation of what happened, the consequences, an <b>apology/expression of regret</b>, and a plan to mitigate harm and prevent future recurrence."
    },
    {
        "q": "What should you do if you suspect a colleague is practicing medicine while impaired by drugs or alcohol?",
        "a": "Report the colleague <b>immediately</b> to hospital leadership, the chief of staff, or the state physician health program to protect patient safety."
    },
    {
        "q": "What is the ethical duty to report an incompetent or negligent colleague?",
        "a": "You are ethically obligated to report them to the clinical supervisor or licensing board if they pose a <b>threat to patient safety</b>."
    },
    {
        "q": "What is medical tourism and what ethical concerns does it raise?",
        "a": "Traveling abroad for cheaper medical care; raising concerns of <b>substandard care</b>, lack of follow-up, global spread of resistant pathogens, and organ trafficking."
    },
    {
        "q": "What is the physician's duty if they have a conscientious objection to a legal medical procedure (e.g., abortion)?",
        "a": "They may refuse to perform it but must <b>refer the patient</b> to a willing provider and cannot withhold care in an emergency."
    },
    {
        "q": "What is a 'double relationship' (or dual relationship) in clinical practice?",
        "a": "When a physician holds both a <b>professional clinical role</b> and a <b>secondary role</b> (e.g., business partner, social friend, or lover) with the same patient."
    },
    {
        "q": "If a family requests that a physician withhold a diagnosis of terminal cancer from a patient, how should the physician respond?",
        "a": "Respectfully decline the family's request, assess the <b>patient's desire for information</b>, and disclose the diagnosis to the patient if they want to know."
    },
    {
        "q": "Under what condition is therapeutic nondisclosure ethical?",
        "a": "Only when disclosing the information would cause <b>immediate, severe, and direct harm</b> (e.g., triggering acute psychosis or suicide), which is extremely rare."
    },
    {
        "q": "Can a competent, adult Jehovah's Witness refuse a life-saving blood transfusion?",
        "a": "<b>Yes</b>. A competent adult has the absolute right of autonomy to refuse any treatment, including blood products, even if it leads to death."
    },
    {
        "q": "Can parents refuse a life-saving blood transfusion for their minor child based on their Jehovah's Witness beliefs?",
        "a": "<b>No</b>. Parents cannot refuse life-saving medical care for their children. The physician must administer the transfusion and seek a court order."
    },
    {
        "q": "If an unconscious Jehovah's Witness patient requires blood, but carries a signed 'No Blood' wallet card, should blood be given?",
        "a": "<b>No</b>. A clear, signed, and dated directive refusing blood must be honored as a written expression of their autonomy."
    },
    {
        "q": "If an unconscious patient is bleeding out, has no identification, and there is no surrogate available, should you transfuse blood?",
        "a": "<b>Yes</b>. In an emergency with no known wishes, the physician must assume the patient would want life-saving treatment (beneficence)."
    },
    {
        "q": "What defines a conflict of interest in clinical medicine?",
        "a": "A situation where a physician's primary professional obligation to the patient is compromised by <b>secondary interests</b>, such as financial gain or personal prestige."
    },
    {
        "q": "If a clinical trial investigator receives funding from a pharmaceutical company, what ethical step is mandatory?",
        "a": "The investigator must <b>disclose the conflict of interest</b> to the Institutional Review Board (IRB), research participants, and in all publications."
    },
    {
        "q": "Is it ethical for a physician to receive a referral fee for directing patients to a specific specialist or facility?",
        "a": "<b>No</b>. Accepting referral fees (kickbacks) is unethical and illegal, as it compromises clinical objectivity and inflates healthcare costs."
    },
    {
        "q": "What is the primary role of an Institutional Review Board (IRB)?",
        "a": "To review, approve, and monitor clinical research to <b>protect the rights, safety, and welfare of human research subjects</b>."
    },
    {
        "q": "Name three populations classified as vulnerable in human subjects research.",
        "a": "<b>Children, prisoners, pregnant women, fetuses</b>, and individuals with cognitive impairment."
    },
    {
        "q": "What is the difference between 'consent' and 'assent' in pediatric clinical research?",
        "a": "Parents provide legal <b>consent/permission</b>, while children (usually age 7 or older) provide <b>assent</b>, which is their personal agreement to participate."
    },
    {
        "q": "When is the use of a placebo control group in a clinical trial ethical?",
        "a": "Only when <b>no effective standard treatment exists</b>, or when withholding active treatment poses no risk of serious or irreversible harm."
    },
    {
        "q": "If a physician owns shares in a medical device company, can they use those devices in their patients?",
        "a": "Yes, but they must <b>disclose the financial interest</b> to the patients and hospital, and ensure the choice of device is medically justified."
    },
    {
        "q": "What is physician-assisted suicide?",
        "a": "A practice where a physician prescribes a <b>lethal dose of medication</b> that the patient self-administers to end their life. (Legal in select US states)."
    },
    {
        "q": "What is active euthanasia, and is it legal in the United States?",
        "a": "When a physician directly administers a lethal substance to end a patient's life. It is <b>illegal in all 50 US states</b>."
    },
    {
        "q": "What is the formula for Quality-Adjusted Life Years (QALY)?",
        "a": "Calculated as: $\\\\text{QALY} = \\\\text{Years of Life} \\\\times \\\\text{Utility Value}$ where utility ranges from 0 (death) to 1 (perfect health)."
    },
    {
        "q": "If two patients match for a single donor kidney, how is the recipient chosen under the principle of justice?",
        "a": "Based on <b>objective medical compatibility, urgency, and waitlist time</b>. Social worth, occupation, or lifestyle must not be considered."
    },
    {
        "q": "Can a federal employee be prescribed medical marijuana by a physician in a state where it is legal?",
        "a": "Physicians can only <b>recommend or certify</b> medical marijuana; they cannot 'prescribe' it because marijuana is a Schedule I drug under federal law."
    },
    {
        "q": "Is it ethical to prescribe a placebo to a patient without their knowledge to prove their pain is psychogenic?",
        "a": "<b>No</b>. Deceptive prescribing of placebos violates patient autonomy and breaches trust in the patient-physician relationship."
    }
]

# Write to file
# We need to write it exactly as:
# const CARDS_ETHICS_PRINCIPLES = [
# { q: "...", a: "..." },
# ...
# ];
# We should format it correctly, handle single quotes, double quotes, and the LaTeX escaping.
# In Python, we want raw string output with 4 backslashes for LaTeX. Let's make sure we do that.

with open("c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\scratch\\cards_ethics_principles.js", "w", encoding="utf-8") as f:
    f.write("const CARDS_ETHICS_PRINCIPLES = [\n")
    for idx, card in enumerate(cards):
        # Escape double quotes in the question and answer
        q_escaped = card["q"].replace('"', '\\"')
        a_escaped = card["a"].replace('"', '\\"')
        
        # If there are backslashes (like in QALY formula), they might be escaped.
        # Let's inspect the QALY card.
        # "a": "Calculated as: $\\text{QALY} = \\text{Years of Life} \\times \\text{Utility Value}$ where utility ranges from 0 (death) to 1 (perfect health)."
        # In python memory, it has single backslashes (\\text, \\times).
        # We need it to be outputted as 4 backslashes: $\\\\text{QALY} = \\\\text{Years of Life} \\\\times \\\\text{Utility Value}$
        # If we do .replace('\\', '\\\\\\\\'), then:
        # \\ in memory is one backslash. We want to replace it with four backslashes.
        # Let's write a targeted replacement for the backslashes in the formula.
        if "\\" in a_escaped:
            # Replace each single backslash with four backslashes
            a_escaped = a_escaped.replace('\\', '\\\\\\\\')
            
        comma = "," if idx < len(cards) - 1 else ""
        f.write(f'  {{ q: "{q_escaped}", a: "{a_escaped}" }}{comma}\n')
    f.write("];\n")

print(f"Successfully generated {len(cards)} cards.")
