// TOPIC: End-of-life & palliative care — goals of care, advance directives, hospice, pain management
// SECTION: Geriatrics & Palliative Care
// CARD COUNT: 80

const cards_geri_end_of_life = [
  {
    q: `What is the core definition of **palliative care**, and when should it be initiated in the course of a serious illness?`,
    a: `<b>Palliative care</b> is interdisciplinary medical care focused on the <b>relief of suffering</b> and optimizing quality of life.<br><b>Key features:</b><ul><li>Offered at <b>any stage</b> of a serious, life-limiting illness</li><li>Delivered <b>concurrently with curative or life-prolonging treatments</b></li><li>Initiated ideally at the <b>time of diagnosis</b> of a serious illness (rather than waiting for end-of-life)</li></ul>`
  },
  {
    q: `How does **hospice care** differ from **palliative care**?`,
    a: `While hospice is a form of palliative care, they differ in clinical scope and eligibility:<br><b>Palliative Care:</b> Can be provided at <b>any stage</b> of illness and concurrently with <b>curative treatment</b>.<br><b>Hospice Care:</b> Reserved for the <b>terminal stage</b> (life expectancy <b>&lt;= 6 months</b>), requiring the patient to <b>forgo curative treatments</b>.`
  },
  {
    q: `What are the two primary eligibility criteria for the **Medicare Hospice Benefit**?`,
    a: `<b>Eligibility Criteria:</b><ol><li>A physician (usually two) certifies that the patient has a <b>terminal illness</b> with a <b>life expectancy of &lt;= 6 months</b> if the disease runs its normal course.</li><li>The patient (or surrogate) elects hospice care and <b>waives Medicare coverage for curative treatments</b> related to the terminal diagnosis.</li></ol>`
  },
  {
    q: `What core services are covered under the **Medicare Hospice Benefit**?`,
    a: `<b>Covered Services:</b><ul><li><b>Interdisciplinary team:</b> Physicians, nurses, social workers, chaplains, and bereavement counselors</li><li><b>Medications:</b> For symptom management and pain relief related to the terminal illness</li><li><b>Durable Medical Equipment (DME):</b> Hospital beds, wheelchairs, oxygen, and walkers</li><li><b>Levels of care:</b> General inpatient, continuous home, routine home, and respite care</li><li><b>Bereavement support:</b> For the family for at least <b>12 months</b> after the patient's death</li></ul>`
  },
  {
    q: `What are the four levels of care defined by the **Medicare Hospice Benefit**?`,
    a: `<b>Hospice Levels of Care:</b><ul><li><b>Routine Home Care:</b> Care provided in the patient's place of residence.</li><li><b>Continuous Home Care:</b> Short-term nursing care (minimum <b>8 hours/day</b>) during acute symptom crises to maintain the patient at home.</li><li><b>General Inpatient Care (GIP):</b> Inpatient stay for acute pain or symptom management that cannot be managed in other settings.</li><li><b>Respite Care:</b> Short-term inpatient stay (up to <b>5 consecutive days</b>) to provide temporary relief to the primary family caregiver.</li></ul>`
  },
  {
    q: `A 64-year-old female is diagnosed with **metastatic non-small cell lung cancer**. She wishes to continue palliative chemotherapy. Is she eligible for **hospice care**? Is she eligible for **palliative care**?`,
    a: `<b>Hospice Care:</b> <b>Ineligible</b>, because she is pursuing curative/disease-modifying treatment (chemotherapy).<br><b>Palliative Care:</b> <b>Eligible</b>, as palliative care can be provided alongside chemotherapy to manage symptoms and side effects.`
  },
  {
    q: `If a patient on the **Medicare Hospice Benefit** survives past **6 months**, what must happen for them to continue receiving services?`,
    a: `The hospice medical director or physician must <b>recertify</b> that the patient is still terminally ill with a <b>life expectancy of &lt;= 6 months</b>. If recertified, hospice benefits can be extended indefinitely (divided into initial 90-day periods, followed by subsequent 60-day periods).`
  },
  {
    q: `What are the six steps of the **SPIKES protocol** for breaking bad news?`,
    a: `<b>SPIKES Protocol:</b><ol><li><b>Setting up:</b> Arrange a private, quiet space, sit down, involve key family members, and establish eye contact.</li><li><b>Perception:</b> Ask open-ended questions to assess what the patient knows (e.g., "What is your understanding of your illness?").</li><li><b>Invitation:</b> Ask how much detail the patient wants to know.</li><li><b>Knowledge:</b> Give information in small, digestible chunks without medical jargon, checking for understanding.</li><li><b>Empathy:</b> Respond to the patient's emotions with validating, empathetic statements.</li><li><b>Strategy & Summary:</b> Summarize and outline a collaborative next-step plan.</li></ol>`
  },
  {
    q: `What does the **REMAP** protocol stand for in goals of care conversations?`,
    a: `<b>REMAP Protocol:</b><ul><li><b>R - Reframe:</b> Reframe the clinical situation (e.g., "We are in a different place now with your illness...").</li><li><b>E - Expect emotion:</b> Validate and empathize with the patient/family's response.</li><li><b>M - Map out:</b> Map what is important to the patient (values, fears, acceptable quality of life).</li><li><b>A - Address concerns:</b> Directly address barriers or fears.</li><li><b>P - Propose:</b> Propose a clinical plan that aligns with the mapped values.</li></ul>`
  },
  {
    q: `In palliative care, what is the significance of the question **"What matters most?"**?`,
    a: `It is the core question used to elicit the patient's <b>values, goals, and fears</b>, allowing the clinical team to align medical interventions with the patient's definition of <b>quality of life</b> rather than focusing solely on physiologic markers.`
  },
  {
    q: `How does a **Living Will** differ from a **Durable Power of Attorney for Healthcare (DPAHC)**?`,
    a: `<b>Living Will:</b> A document specifying <b>particular treatments</b> the patient wants or does not want (e.g., CPR, intubation, feeding tubes) if they lose decision-making capacity.<br><b>DPAHC:</b> Designates a specific person (<b>healthcare proxy/agent</b>) to make medical decisions if the patient becomes incapacitated.`
  },
  {
    q: `What is a **POLST (Physician Orders for Life-Sustaining Treatment)** or **MOLST (Medical Orders for Life-Sustaining Treatment)** form?`,
    a: `<b>POLST/MOLST</b> is a set of <b>actionable medical orders</b> signed by a clinician (physician, NP, or PA) that translates a patient's preferences into immediately executable orders across all care settings (including EMS). Unlike a living will, it is an <b>actual order</b> rather than a statement of wishes.`
  },
  {
    q: `What key treatment categories are typically addressed on a **POLST** or **MOLST** form?`,
    a: `<b>POLST/MOLST Categories:</b><ul><li><b>Section A:</b> Cardiopulmonary Resuscitation (<b>CPR</b> vs. <b>DNR/No CPR</b>)</li><li><b>Section B:</b> Medical Interventions (<b>Full treatment</b> vs. <b>Selective treatment</b> vs. <b>Comfort-focused care</b>)</li><li><b>Section C:</b> Artificially Administered Nutrition (<b>Long-term feeding tube</b> vs. <b>Trial period</b> vs. <b>No artificial nutrition</b>)</li><li><b>Section D:</b> Antibiotics (<b>Full use</b> vs. <b>Limited/Comfort use</b> vs. <b>No antibiotics</b>)</li></ul>`
  },
  {
    q: `What is the clinical distinction between a **DNR (Do Not Resuscitate)** order, a **DNI (Do Not Intubate)** order, and a **DNR-DNI** order?`,
    a: `<b>DNR:</b> No chest compressions, shocks, or resuscitation medications in the event of <b>cardiac arrest</b>.<br><b>DNI:</b> No endotracheal intubation or mechanical ventilation in the event of <b>respiratory failure</b> (non-invasive ventilation like BiPAP may still be allowed).<br><b>DNR-DNI:</b> Neither resuscitation nor intubation is to be performed; the focus is on comfort.`
  },
  {
    q: `What is the **Five Wishes** document?`,
    a: `The <b>Five Wishes</b> is a legally valid advance directive in most states that addresses a patient's medical, personal, emotional, and spiritual wishes. It covers:<br><ul><li>Who makes decisions (the <b>healthcare proxy</b>)</li><li>The kind of medical treatment wanted/not wanted</li><li>How comfortable the patient wants to be</li><li>How the patient wants to be treated</li><li>What the patient wants loved ones to know</li></ul>`
  },
  {
    q: `Under what circumstances does an advance directive (like a Living Will or DPAHC) become legally active?`,
    a: `An advance directive becomes active <b>only when</b> the patient is determined by a physician (or sometimes two, depending on state law) to <b>lack clinical decision-making capacity</b>. If the patient has capacity, their current verbal decisions override any advance directive.`
  },
  {
    q: `When an incapacitated patient has a designated **healthcare proxy**, what decision-making standard is the proxy legally and ethically obligated to use first?`,
    a: `The proxy must use the <b>substituted judgment standard</b>, which requires them to make the decision the patient <i>would</i> have made if they were currently able to speak, based on the patient's known values, beliefs, and prior statements.`
  },
  {
    q: `When is the **best interests standard** applied in surrogate decision-making?`,
    a: `The <b>best interests standard</b> is applied when the patient's preferences and values are <b>unknown or cannot be inferred</b> (e.g., patient was never competent, or never expressed opinions on life-sustaining treatment). The surrogate must choose the option that maximizes benefit and minimizes harm to the patient.`
  },
  {
    q: `If a surrogate decision-maker makes a request that directly contradicts the patient's written, specific wishes in a **Living Will**, how should the clinical team respond?`,
    a: `The clinical team must respect the patient's autonomy. The written <b>Living Will</b> reflects the patient's own direct wishes and generally <b>trumps</b> the surrogate's contradictory preferences, unless there is evidence the patient changed their mind after writing the document. The clinician should hold a family meeting to resolve the conflict.`
  },
  {
    q: `What is the first-line management for a **futility dispute** between a patient's family demanding ongoing life support and the medical team who believes it is futile?`,
    a: `<b>Management Steps:</b><ol><li>Conduct a multidisciplinary <b>family meeting</b> to clarify goals of care, address fears, and resolve misunderstandings.</li><li>Obtain a <b>palliative care consultation</b> or involve the hospital <b>ethics committee</b> for mediation.</li><li>If unresolved, attempt to <b>transfer the patient</b> to another facility willing to provide the care.</li><li>If transfer is impossible, the team may unilaterally withdraw futile care after appropriate notice and committee review (depending on state law).</li></ol>`
  },
  {
    q: `What is the difference between clinical **decisional capacity** and legal **competence**?`,
    a: `<b>Decisional Capacity:</b> A <b>clinical determination</b> made by the treating physician for a specific decision at a specific time; it is dynamic and can fluctuate.<br><b>Competence:</b> A <b>legal determination</b> made by a judge regarding a person's global ability to manage their affairs; it remains constant until legally reversed.`
  },
  {
    q: `What are the four essential clinical elements of **decisional capacity**?`,
    a: `<b>Four Elements of Capacity:</b><ol><li><b>Understanding:</b> Ability to comprehend the medical facts and options.</li><li><b>Appreciation:</b> Ability to apply the information to one's own situation.</li><li><b>Reasoning:</b> Ability to logically evaluate the risks, benefits, and consequences of each option.</li><li><b>Expressing a choice:</b> Ability to communicate a consistent decision.</li></ol>`
  },
  {
    q: `A patient with severe dementia and a urinary tract infection is refusing a urinary catheter. Her capacity varies depending on the time of day (sundowning). How should the clinician assess her capacity?`,
    a: `Capacity is <b>decision-specific and time-specific</b>. The clinician should assess capacity at the <b>time the decision needs to be made</b> (e.g., during her most lucid window in the morning) rather than assuming she globally lacks capacity due to dementia.`
  },
  {
    q: `How should pain be assessed in a nonverbal patient or one with advanced dementia who cannot use a numeric pain scale?`,
    a: `Use a validated behavioral observation scale, such as the <b>PAINAD (Pain Assessment in Advanced Dementia)</b> scale, which scores behaviors rather than relying on self-report.`
  },
  {
    q: `What five categories of patient behavior are evaluated on the **PAINAD scale**?`,
    a: `<b>PAINAD Scale Categories:</b><ul><li><b>Breathing:</b> Normal vs. noisy, short hyperventilation, Cheyne-Stokes.</li><li><b>Negative vocalization:</b> None vs. occasional moan/groan vs. repeated troubled calling out/crying.</li><li><b>Facial expression:</b> Smiling/neutral vs. sad/frightened/frown vs. grimacing.</li><li><b>Body language:</b> Relaxed vs. tense/pacing/rigid vs. fists clenched/pulling away.</li><li><b>Consolability:</b> No need to console vs. distracted by voice/touch vs. unable to console.</li></ul>`
  },
  {
    q: `Describe the three steps of the **WHO Pain Relief Ladder**.`,
    a: `<b>WHO Pain Ladder:</b><ul><li><b>Step 1 (Mild Pain):</b> Non-opioid analgesics (e.g., <b>acetaminophen</b>, <b>NSAIDs</b>) +/- adjuvants.</li><li><b>Step 2 (Moderate Pain):</b> Weak opioids (e.g., <b>codeine</b>, <b>tramadol</b>) +/- non-opioids +/- adjuvants.</li><li><b>Step 3 (Severe Pain):</b> Strong opioids (e.g., <b>morphine</b>, <b>fentanyl</b>, <b>oxycodone</b>, <b>hydromorphone</b>) +/- non-opioids +/- adjuvants.</li></ul>`
  },
  {
    q: `What is the preferred first-line opioid for both pain and dyspnea in serious illness, and what is its standard starting route in patients with swallowing difficulties?`,
    a: `<b>Morphine</b> is the preferred first-line agent. In patients with dysphagia or who are actively dying, it is administered via the <b>sublingual (concentrated oral solution)</b> or <b>subcutaneous (SC) / intravenous (IV)</b> routes.`
  },
  {
    q: `When is a **transdermal fentanyl patch** indicated for pain, and why is it contraindicated for acute or breakthrough pain?`,
    a: `<b>Indication:</b> Steady-state, chronic pain in patients who are already <b>opioid-tolerant</b>.<br><b>Contraindications:</b> Contraindicated in <b>opioid-naive</b> patients and for <b>acute/breakthrough pain</b> due to slow onset (takes <b>12-24 hours</b> to reach therapeutic levels) and long half-life.`
  },
  {
    q: `Why is **hydromorphone** or **fentanyl** preferred over **morphine** in patients with renal impairment?`,
    a: `Morphine has active metabolites (<b>morphine-3-glucuronide</b> and <b>morphine-6-glucuronide</b>) that are renally cleared and accumulate in renal failure, causing <b>neurotoxicity</b> (myoclonus, delirium, seizures). <b>Hydromorphone</b> has fewer neurotoxic metabolites, and <b>fentanyl</b> has no active metabolites, making them safer in renal failure.`
  },
  {
    q: `What are the two primary pharmacologic and safety concerns when prescribing **methadone** for pain control in palliative care?`,
    a: `<b>Methadone Concerns:</b><ul><li><b>Unpredictable half-life:</b> Ranges from <b>8 to 59 hours</b> (much longer than its analgesic duration), leading to drug accumulation and delayed respiratory depression.</li><li><b>QTc prolongation:</b> Can cause torsades de pointes; requires baseline and periodic <b>EKG monitoring</b>.</li></ul>`
  },
  {
    q: `What is the recommended starting dose and titration strategy for opioids in an elderly, opioid-naive patient with serious illness ("start low and go slow")?`,
    a: `<b>Opioid Titration Principles:</b><ul><li>Start with low-dose immediate-release opioids (e.g., <b>morphine 2.5–5 mg PO</b> or <b>1–2 mg IV</b>).</li><li>Titrate dose upward by <b>25% to 50%</b> for mild-to-moderate pain, and by <b>50% to 100%</b> for severe, uncontrolled pain.</li><li>Offer breakthrough doses at <b>10% to 15%</b> of the total 24-hour daily scheduled dose, every 1–2 hours PRN.</li></ul>`
  },
  {
    q: `What is the equianalgesic conversion ratio between **oral (PO) morphine** and **intravenous (IV) morphine**?`,
    a: `The conversion ratio is <b>3:1</b>.<br><b>Equianalgesic Dose:</b> <b>30 mg PO morphine</b> = <b>10 mg IV morphine</b>.`
  },
  {
    q: `What are the equianalgesic oral doses for **oxycodone** and **hydromorphone** compared to **30 mg of oral morphine**?`,
    a: `<b>Equianalgesic Oral Doses:</b><ul><li><b>Oral Morphine:</b> 30 mg</li><li><b>Oral Oxycodone:</b> 20 mg</li><li><b>Oral Hydromorphone:</b> 7.5 mg</li></ul>`
  },
  {
    q: `What oral morphine equivalent daily dose (MEDD) is roughly equal to a **transdermal fentanyl patch of 25 μg/hr**?`,
    a: `A <b>fentanyl patch 25 μg/hr</b> is approximately equivalent to <b>60 mg/day of oral morphine</b> (or 20 mg/day of IV morphine).`
  },
  {
    q: `What is the most common, persistent side effect of opioid therapy that never improves with tolerance, and how should it be managed?`,
    a: `<b>Opioid-induced constipation (OIC)</b>.<br><b>Management:</b> All patients on scheduled opioids must be started on a scheduled bowel regimen (e.g., stimulant laxative <b>senna</b> +/- osmotic laxative like <b>polyethylene glycol</b>). Docusate alone is insufficient.`
  },
  {
    q: `What class of medication are **methylnaltrexone** and **naloxegol**, and when are they indicated in palliative care?`,
    a: `<b>Class:</b> Peripherally acting mu-opioid receptor antagonists (<b>PAMORAs</b>). They block gut opioid receptors without crossing the blood-brain barrier.<br><b>Indication:</b> Refractory <b>opioid-induced constipation</b> that has failed standard laxative regimens.`
  },
  {
    q: `A 72-year-old patient with end-stage heart failure has refractory dyspnea at the end of life. What is the first-line evidence-based pharmacologic intervention?`,
    a: `<b>Low-dose opioids</b> (e.g., <b>morphine 2.5–5 mg PO/sublingual</b> or <b>1–2 mg IV/SC</b> every 4 hours PRN or scheduled) are the most effective pharmacologic treatment for refractory dyspnea.`
  },
  {
    q: `Under what circumstance is **supplemental oxygen** indicated for dyspnea in a dying patient, and what is a superior non-pharmacologic alternative for non-hypoxemic patients?`,
    a: `<b>Supplemental Oxygen:</b> Indicated <b>only if the patient is hypoxic (SpO2 &lt; 90%)</b>.<br><b>Alternative:</b> For non-hypoxic patients, a <b>cool fan</b> blowing air across the face (trigeminal nerve stimulation) is equally effective and less restricting.`
  },
  {
    q: `What is the pathophysiology of the **"death rattle"** (terminal respiratory secretions), and what is the first-line non-pharmacologic management?`,
    a: `<b>Pathophysiology:</b> Oscillating movement of secretions in the hypopharynx during respiration in a patient too weak to swallow or cough.<br><b>First-line Management:</b> Reposition the patient (e.g., <b>side-lying/lateral decubitus</b> or elevating the head of the bed). <b>Avoid deep tracheal suctioning</b> as it causes distress.`
  },
  {
    q: `What pharmacologic agents are used to manage terminal respiratory secretions (**"death rattle"**), and which is preferred to minimize central side effects?`,
    a: `<b>Pharmacologic Treatment:</b> Anticholinergic (antisecretory) agents such as <b>glycopyrrolate</b> or sublingual <b>atropine</b> drops.<br><b>Preferred Agent:</b> <b>Glycopyrrolate</b> is preferred because it is a quaternary amine that <b>does not cross the blood-brain barrier</b>, minimizing the risk of central anticholinergic delirium.`
  },
  {
    q: `A patient on hospice develops nausea due to delayed gastric emptying (gastroparesis). What is the first-line pharmacologic agent?`,
    a: `<b>Metoclopramide</b> is preferred because of its prokinetic mechanism (dopamine and 5-HT4 receptor agonist) which stimulates gastric motility.`
  },
  {
    q: `What is the preferred antiemetic for end-of-life nausea caused by chemical trigger zone activation (e.g., uremia, hypercalcemia, or opioids)?`,
    a: `<b>Haloperidol</b> (a potent dopamine receptor antagonist) is highly effective for chemical- or metabolic-induced nausea.`
  },
  {
    q: `A patient with metastatic breast cancer to the brain presents with headache, projectile vomiting, and nausea. What is the most appropriate first-line medication?`,
    a: `<b>Dexamethasone</b> (corticosteroid) is first-line because it reduces peritumoral edema, thereby decreasing <b>increased intracranial pressure</b>.`
  },
  {
    q: `How does **terminal delirium** (agitated delirium in the final hours/days of life) present, and what is the first-line pharmacologic agent?`,
    a: `<b>Presentation:</b> Fluctuating consciousness, hallucinations, agitation, and restlessness.<br><b>First-line Agent:</b> <b>Haloperidol</b> is the preferred antipsychotic. (Benzodiazepines like <b>midazolam</b> can be added for refractory agitation or active dying).`
  },
  {
    q: `What is the role of **palliative sedation**, and what drug is most commonly used for it?`,
    a: `<b>Palliative Sedation:</b> The intentional induction of a state of decreased consciousness to relieve <b>refractory symptoms</b> (e.g., severe dyspnea, pain, or delirium) that cannot be controlled by other means.<br><b>Drug:</b> <b>Midazolam</b> (infusion) is the most commonly used agent.`
  },
  {
    q: `Describe the ethical **Principle of Double Effect** as it applies to administering high doses of opioids or sedatives at the end of life.`,
    a: `The principle states that if an action has two foreseeable outcomes (one good, one bad), the action is ethically permissible if the <b>primary intent</b> is the good outcome (e.g., relieving pain/dyspnea), even if the bad outcome (e.g., hastening death via respiratory depression) is foreseen but not intended.`
  },
  {
    q: `Is there an ethical or legal distinction between **withholding** (not starting) and **withdrawing** (stopping) life-sustaining treatment?`,
    a: `<b>No.</b> Ethically and legally, withholding and withdrawing treatment are <b>equivalent</b>. If a treatment does not align with a patient's goals or offers no clinical benefit, stopping it is as acceptable as never starting it.`
  },
  {
    q: `Why is **artificial nutrition and hydration (ANH)** generally not recommended in the active dying phase?`,
    a: `<b>ANH</b> in dying patients:<ul><li>Does <b>not</b> prolong survival or improve quality of life.</li><li>Increases the risk of <b>aspiration pneumonia</b> and fluid overload (leading to <b>pulmonary edema</b>, ascites, and worsening secretions).</li><li>Can cause pain from IV/NG tube insertion and require physical restraints.</li></ul>`
  },
  {
    q: `How should a physician counsel a family concerned that their dying loved one is "starving to death" without an IV or feeding tube?`,
    a: `<b>Counseling Points:</b><ul><li>Explain that loss of appetite is a <b>normal, natural part of the dying process</b> as the body shuts down.</li><li>Reassure them that dehydration stimulates the release of <b>endorphins</b> and ketones, acting as a natural analgesic.</li><li>Encourage alternative ways to show care, such as <b>mouth care (moistening lips)</b>, massage, and presence.</li></ul>`
  },
  {
    q: `What is the role of routine laboratory monitoring (e.g., BMP, CBC) and daily vital sign checks in hospice care?`,
    a: `They should be <b>discontinued</b>. Routine labs and vitals do not enhance patient comfort and often lead to unnecessary interventions (e.g., blood draws, correcting laboratory values that are clinically irrelevant in terminal illness).`
  },
  {
    q: `When discussing prognosis with a terminally ill patient, how should the clinician communicate the estimated time remaining?`,
    a: `Use a <b>range of time</b> (e.g., "hours to days," "days to weeks," or "weeks to months") rather than giving an exact date, and explain that prognosis is based on the rate of functional decline.`
  },
  {
    q: `What is the minimum duration of **bereavement support** that must be offered to the family of a deceased patient under the Medicare Hospice Benefit?`,
    a: `Bereavement services must be offered for at least <b>12 months</b> (1 year) following the patient's death.`
  },
  {
    q: `How does **Medical Aid in Dying (MAID)** differ from **palliative sedation**?`,
    a: `<b>MAID:</b> The physician prescribes a lethal dose of medication that the patient <b>self-administers</b> with the explicit intent to end their own life. Only legal in certain states.<br><b>Palliative Sedation:</b> The physician administers sedatives (e.g., midazolam) to <b>relieve refractory symptoms</b> in a dying patient; the intent is symptom relief, not death.`
  },
  {
    q: `What are the physiological signs of **imminent death** (occurring hours to days before death)?`,
    a: `<b>Signs of Imminent Death:</b><ul><li><b>Mottling</b> of the skin (livedo reticularis, starting in lower extremities)</li><li><b>Cooling</b> of the extremities and weak peripheral pulses</li><li><b>Cheyne-Stokes breathing</b> (periods of apnea alternating with hyperventilation)</li><li><b>Decreased urine output</b> (oliguria/anuria)</li><li>Decreased level of consciousness and responsiveness</li></ul>`
  },
  {
    q: `A 78-year-old dying patient exhibits deep, rapid, gasping respirations. Is this a normal sign of imminent death?`,
    a: `<b>No.</b> This is <b>Kussmaul breathing</b>, which is a compensatory sign of <b>severe metabolic acidosis</b> (e.g., DKA, severe renal failure). The normal respiratory pattern of imminent death is <b>Cheyne-Stokes breathing</b> or agonal, shallow respirations.`
  },
  {
    q: `A patient on hospice has an **implantable cardioverter-defibrillator (ICD)**. What should be done with this device?`,
    a: `The ICD should be <b>deactivated</b> to prevent painful, distressing, and medically futile shocks as the patient actively dies. This is ethically equivalent to withholding other life-prolonging treatments.`
  },
  {
    q: `What is the clinical definition of **opioid tolerance** required before initiating a **transdermal fentanyl patch**?`,
    a: `The patient must have been taking at least <b>60 mg oral morphine daily</b> (or equianalgesic dose of another opioid) for at least <b>7 consecutive days</b>.`
  },
  {
    q: `A patient with advanced dementia becomes acutely agitated and screams. What is the first step in clinical evaluation?`,
    a: `Assess for and treat **underlying physical causes** of discomfort (e.g., urinary retention, fecal impaction, unrecognized pain, or infection) before prescribing psychotropic medications.`
  },
  {
    q: `Why is **meperidine** contraindicated for chronic pain management in palliative care?`,
    a: `Meperidine is metabolized to <b>normeperidine</b>, which has a long half-life and accumulates (especially in renal impairment). Normeperidine is a central nervous system stimulant that causes <b>neurotoxicity</b> (myoclonus, tremors, and seizures).`
  },
  {
    q: `What is the legal status of **Medical Aid in Dying (MAID)** in the United States, and what are the general requirements for a patient to utilize it?`,
    a: `<b>Status:</b> Legalized via statute or court ruling in several states (e.g., Oregon, Washington, California, Colorado, Vermont).<br><b>Requirements:</b> Patient must be an adult with <b>decisional capacity</b>, diagnosed with a terminal illness with a <b>prognosis of &lt;= 6 months</b>, and must <b>self-administer</b> the medication.`
  },
  {
    q: `Under what circumstances is a court-appointed **legal guardian** required to make decisions for an incapacitated patient?`,
    a: `Only when the patient <b>lacks decisional capacity</b>, has <b>no advance directive</b>, and has <b>no available or willing family members or surrogate decision-makers</b> (often termed "unrepresented" or "unbefriended" patients).`
  },
  {
    q: `What are the primary components of a **Comfort Measures Only (CMO)** order set?`,
    a: `<b>CMO Components:</b><ul><li>Discontinue vital signs, routine labs, fingersticks, and pulse oximetry.</li><li>Discontinue non-essential medications (e.g., statins, antihypertensives, multivitamins).</li><li>Provide scheduled and PRN medications for <b>pain, dyspnea, secretions, and agitation</b>.</li><li>Focus on intensive <b>mouth care, positioning, and skin care</b>.</li></ul>`
  },
  {
    q: `A patient with a prognosis of weeks to months develops severe depression. Which antidepressant class is preferred, and why?`,
    a: `<b>Psychostimulants</b> (e.g., <b>methylphenidate</b>) are preferred because they work within <b>24-48 hours</b>.<br><b>Note:</b> Standard SSRIs are not preferred in patients with very short life expectancies because they take <b>4-6 weeks</b> to achieve therapeutic effect.`
  },
  {
    q: `If a patient with terminal dyspnea also has severe anxiety, how should pharmacologic therapy be adjusted?`,
    a: `Continue <b>low-dose opioids</b> (first-line for dyspnea) and add a low-dose benzodiazepine (e.g., <b>lorazepam 0.5–1 mg</b> PO/IV/SC) as an adjuvant to treat the anxiety component.`
  },
  {
    q: `What is the risk of using **benzodiazepines** (e.g., lorazepam) as monotherapy for **terminal delirium**?`,
    a: `Benzodiazepines can cause a <b>paradoxical reaction</b> (worsening agitation and confusion) and do not address the underlying pathophysiology of delirium. Antipsychotics (e.g., <b>haloperidol</b>) are first-line.`
  },
  {
    q: `What is the first-line pharmacologic treatment for **bone pain** secondary to metastatic cancer in palliative care?`,
    a: `<b>NSAIDs</b> (e.g., <b>naproxen</b>, <b>ibuprofen</b>, or <b>ketorolac</b>) are highly effective because bone pain is largely mediated by prostaglandins. Radiation therapy (external beam) is also a highly effective local option.`
  },
  {
    q: `If a patient's family requests that the physician "not tell" the patient about a terminal cancer diagnosis, what is the correct initial step?`,
    a: `Ask the family about their <b>cultural values and fears</b> driving the request, then ask the patient directly <b>how much information they want to receive</b> and who they wish to make their decisions.`
  },
  {
    q: `Can a patient on the **Medicare Hospice Benefit** go to the emergency department or get hospitalized?`,
    a: `<b>Yes, but:</b> The admission must be coordinated and approved by the hospice agency if it is related to the <b>terminal diagnosis</b>. If the patient goes independently for the terminal illness without hospice approval, they may be billed or considered to have <b>revoked</b> their hospice benefit.`
  },
  {
    q: `What is the definition of **medical futility**?`,
    a: `An intervention that has <b>no realistic chance of achieving its intended physiologic goal</b> or providing a meaningful benefit to the patient, as determined by the clinical consensus of the medical team.`
  },
  {
    q: `Does a patient's **autonomy** allow them or their surrogates to demand any medical treatment they wish?`,
    a: `<b>No.</b> Autonomy is the right to refuse treatment, but it <b>does not obligate</b> physicians to provide treatments that are medically inappropriate, harmful, or futile.`
  },
  {
    q: `When is the use of **non-invasive positive pressure ventilation (NIV/BiPAP)** appropriate in palliative care?`,
    a: `NIV/BiPAP is appropriate for symptom relief in patients with <b>reversible acute respiratory failure</b> (e.g., COPD exacerbation or pulmonary edema) who have a clear limit of therapy, or as a <b>bridge</b> to allow the patient to communicate with family.`
  },
  {
    q: `Why can a **transdermal fentanyl patch** not be used to treat breakthrough pain?`,
    a: `Fentanyl patches provide a slow, continuous release of medication and cannot be adjusted rapidly. Breakthrough pain must be treated with a <b>short-acting, immediate-release</b> opioid (oral, sublingual, or IV).`
  },
  {
    q: `What is the first-line management for opioid-induced **pruritus**?`,
    a: `<b>Management:</b><ul><li><b>Opioid rotation:</b> Switch to a different opioid (e.g., morphine to hydromorphone).</li><li><b>PAMORAs:</b> Oral <b>methylnaltrexone</b> or low-dose <b>naloxone</b> infusion (blocks peripheral histamine release without reversing central analgesia).</li><li>Antihistamines (though limited by sedation).</li></ul>`
  },
  {
    q: `What is the difference between the **substituted judgment standard** and the **best interests standard**?`,
    a: `<b>Substituted Judgment:</b> Making the decision the patient <b>would have made</b> based on their values and prior statements.<br><b>Best Interests:</b> Making the decision that a <b>reasonable person</b> would choose to maximize benefit and minimize harm (used when the patient's values/wishes are unknown).`
  },
  {
    q: `What is the primary clinical indicator for initiating **palliative sedation**?`,
    a: `The presence of one or more <b>refractory symptoms</b> (symptoms that cannot be controlled despite aggressive, standard palliative interventions) in a patient who is in the <b>actively dying phase</b>.`
  },
  {
    q: `A patient's family asks if they can care for the patient at home until death. What hospice level of care supports this, and what does it provide?`,
    a: `<b>Routine Home Hospice:</b> Supports home care by providing:<ul><li>Interdisciplinary team visits (nursing, social work, chaplain)</li><li>Delivery of <b>durable medical equipment</b> (e.g., hospital bed, oxygen)</li><li>Comfort medications and teaching for family caregivers</li><li>24/7 on-call nurse telephone access</li></ul>`
  },
  {
    q: `In patients with a terminal illness, what is the role of **preventive therapies** such as statins, anticoagulants for DVT prophylaxis, and aspirin?`,
    a: `They should generally be <b>discontinued</b>. The focus shifts entirely to comfort, and these preventive therapies have no short-term benefit but add pill burden and potential side effects (e.g., bleeding from aspirin/anticoagulants).`
  },
  {
    q: `What is the difference between a **DNR** order and a **POLST**?`,
    a: `<b>DNR:</b> A specific order addresssing only <b>cardiopulmonary resuscitation</b> in the event of cardiac or respiratory arrest.<br><b>POLST:</b> A comprehensive document that includes a DNR order but also specifies <b>other medical interventions</b> (hospitalization, intubation, feeding tubes, antibiotics) for patients with advanced illness.`
  },
  {
    q: `A 62-year-old male with end-stage renal disease refuses hemodialysis and elects hospice. He develops severe uremic pruritus. What is the first-line pharmacologic treatment for uremic pruritus?`,
    a: `<b>Gabapentin</b> or <b>pregabalin</b> are highly effective first-line treatments for uremic pruritus, alongside topical emollients. (Naltrexone or UV-B phototherapy are other options).`
  },
  {
    q: `What is the clinical significance of **livedo reticularis (mottling)** in a patient near the end of life?`,
    a: `Mottling is a sign of <b>poor peripheral perfusion</b> due to cardiovascular collapse in an actively dying patient. It typically starts on the knees and feet and is a strong predictor of death within <b>hours to days</b>.`
  }
];

module.exports = cards_geri_end_of_life;
