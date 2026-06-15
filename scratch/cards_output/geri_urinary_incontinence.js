// TOPIC: Urinary incontinence — urge, stress, overflow, functional types
// SECTION: Geriatrics
// CARD COUNT: 82

const cards_geri_urinary_incontinence = [
  {
    q: "What is the epidemiology and clinical significance of urinary incontinence (UI) in the elderly?",
    a: "<b>Prevalence:</b> Affects approximately <b>30-40%</b> of community-dwelling older adults and up to <b>50-70%</b> of nursing home residents.<br><b>Clinical Impact:</b> Associated with a significantly increased risk of <b>falls</b>, <b>fractures</b>, <b>skin breakdown (decubitus ulcers)</b>, <b>urinary tract infections (UTIs)</b>, <b>depression</b>, and early <b>nursing home placement</b>."
  },
  {
    q: "How does the gender distribution of urinary incontinence (UI) change in older age groups?",
    a: "<b>Gender Distribution:</b> In younger adults, UI is predominantly a female disorder. However, in adults aged <b>&gt; 80 years</b>, the ratio approaches <b>1:1</b> due to the high prevalence of <b>benign prostatic hyperplasia (BPH)</b>, prostate surgeries, and <b>detrusor underactivity</b> in older men."
  },
  {
    q: "What are the main clinical distinctions between transient and established urinary incontinence in older adults?",
    a: "<b>Transient Incontinence:</b><ul><li><b>Onset:</b> Sudden or acute</li><li><b>Etiology:</b> Reversible external factors (e.g., medications, acute infection, delirium)</li><li><b>Duration:</b> Short-lived once the underlying cause is resolved</li></ul><b>Established Incontinence:</b><ul><li><b>Onset:</b> Gradual and progressive</li><li><b>Etiology:</b> Structural or neurological abnormalities of the lower urinary tract</li><li><b>Duration:</b> Chronic and persistent requiring targeted long-term management</li></ul>"
  },
  {
    q: "What are the autonomic and somatic pathways involved in normal bladder filling and emptying?",
    a: "<b>Bladder Filling (Sympathetic/Somatic):</b><ul><li>Sympathetic nerves (T10-L2) relax the detrusor muscle via <b>beta-3 adrenergic receptors</b> and contract the internal sphincter via <b>alpha-1 adrenergic receptors</b></li><li>Somatic pudendal nerve (S2-S4) contracts the external urethral sphincter voluntarily</li></ul><b>Bladder Emptying (Parasympathetic/Somatic):</b><ul><li>Parasympathetic nerves (S2-S4) contract the detrusor muscle via <b>M3 muscarinic receptors</b> and inhibit sympathetic tone to relax the internal sphincter</li><li>Somatic pudendal nerve relaxes the external urethral sphincter</li></ul>"
  },
  {
    q: "What is the DIAPPERS mnemonic used for in the evaluation of urinary incontinence?",
    a: "It is used to identify the common <b>transient (reversible) causes</b> of urinary incontinence in older patients:<br><ul><li><b>D:</b> Delirium</li><li><b>I:</b> Infection (symptomatic UTI)</li><li><b>A:</b> Atrophic vaginitis/urethritis</li><li><b>P:</b> Pharmaceuticals</li><li><b>P:</b> Psychological disorders (especially depression)</li><li><b>E:</b> Excessive urine output</li><li><b>R:</b> Restricted mobility</li><li><b>S:</b> Stool impaction</li></ul>"
  },
  {
    q: "How does Delirium (the 'D' in DIAPPERS) lead to transient urinary incontinence?",
    a: "<b>Mechanism:</b> Delirium causes acute cognitive impairment, disorientation, and altered consciousness. The patient loses the awareness of bladder fullness, the ability to locate the toilet, or the motor planning required to void, leading to involuntary leakage. Continence is restored once the <b>delirium</b> resolves."
  },
  {
    q: "Why should asymptomatic bacteriuria not be treated as a cause of transient urinary incontinence (the 'I' in DIAPPERS)?",
    a: "<b>Infection Rule:</b> Only <b>symptomatic urinary tract infection (UTI)</b> (dysuria, fever, acute urgency, suprapubic pain) is a cause of transient incontinence. <b>Asymptomatic bacteriuria</b> is common in the elderly and should <b>not</b> be treated, as treatment does not improve incontinence and promotes antibiotic resistance."
  },
  {
    q: "How does Atrophic vaginitis/urethritis (the 'A' in DIAPPERS) cause transient urinary incontinence, and how is it managed?",
    a: "<b>Pathophysiology:</b> Estrogen deficiency causes thinning, mucosal dryness, and loss of elasticity in the urethra and vagina. This leads to localized irritation and decreased urethral closure pressure, causing both <b>stress</b> and <b>urge incontinence</b>.<br><b>Management:</b> <b>Topical vaginal estrogen</b> therapy (cream, ring, or tablet)."
  },
  {
    q: "Which class of pharmaceuticals (the 'P' in DIAPPERS) is notorious for causing urinary retention and subsequent overflow incontinence?",
    a: "<b>Anticholinergic/Antimuscarinic drugs:</b> (e.g., first-generation antihistamines like <b>diphenhydramine</b>, tricyclic antidepressants like <b>amitriptyline</b>, muscle relaxants).<br><b>Mechanism:</b> They block parasympathetic <b>M3 receptors</b> on the detrusor muscle, preventing it from contracting and leading to urinary retention and <b>overflow incontinence</b>."
  },
  {
    q: "How do diuretics and alpha-adrenergic antagonists (the 'P' in DIAPPERS) contribute to transient urinary incontinence?",
    a: "<b>Diuretics:</b> Cause rapid fluid excretion, leading to <b>polyuria</b>, urinary frequency, and urgency that can overwhelm the patient's mobility limits.<br><b>Alpha-adrenergic antagonists:</b> (e.g., <b>tamsulosin</b>, <b>terazosin</b>) relax the smooth muscle of the bladder neck and urethra, which can precipitate or worsen <b>stress urinary incontinence</b> in women."
  },
  {
    q: "How do calcium channel blockers and opioids (the 'P' in DIAPPERS) cause transient urinary incontinence?",
    a: "<b>Calcium Channel Blockers:</b> Decrease smooth muscle contractility, leading to <b>detrusor underactivity</b>, urinary retention, and <b>overflow incontinence</b>.<br><b>Opioids:</b> Inhibit detrusor contractility and cause urinary retention; they also cause constipation, leading to fecal impaction which mechanically obstructs the bladder neck."
  },
  {
    q: "How do psychological disorders (the 'P' in DIAPPERS) contribute to transient urinary incontinence in older adults?",
    a: "<b>Mechanism:</b> Severe <b>depression</b> or psychosis can lead to psychomotor retardation, profound apathy, and neglect of personal hygiene. The patient may ignore bladder fullness signals or lack the motivation to reach the restroom, resulting in functional incontinence."
  },
  {
    q: "What are the common causes of excessive urine output (the 'E' in DIAPPERS) that lead to transient urinary incontinence?",
    a: "<b>Causes:</b><ol><li><b>Uncontrolled diabetes mellitus:</b> Glycosuria-induced osmotic diuresis</li><li><b>Hypercalcemia:</b> Causes nephrogenic diabetes insipidus</li><li><b>Congestive heart failure (CHF):</b> Mobilization of dependent edema when supine at night</li><li><b>Excessive fluid intake:</b> Especially bladder irritants like alcohol or caffeine</li></ol>"
  },
  {
    q: "How does restricted mobility (the 'R' in DIAPPERS) cause transient urinary incontinence in the elderly?",
    a: "<b>Mechanism:</b> Physical limitations (e.g., severe arthritis, hip fracture, deconditioning, restraints, or stroke) prevent the patient from reaching the toilet in a timely manner. The incontinence is transient if the mobility impairment can be improved with <b>physical therapy</b>, assistive devices, or removal of restraints."
  },
  {
    q: "How does stool impaction (the 'S' in DIAPPERS) cause urinary incontinence?",
    a: "<b>Pathophysiology:</b> A large mass of hard stool in the rectum mechanically compresses the bladder neck and urethra. This leads to urinary retention, bladder distension, and <b>overflow incontinence</b>. It can also cause detrusor hyperreflexia due to rectal distension, mimicking <b>urge incontinence</b>.<br><b>Management:</b> Manual disimpaction followed by a regular bowel regimen."
  },
  {
    q: "A 78-year-old woman is admitted for a hip fracture and receives scheduled oxycodone. On day 3, she develops acute urinary incontinence and confusion. What are the two most likely transient causes of her incontinence?",
    a: "<b>1. Stool Impaction:</b> Secondary to opioid-induced constipation, causing mechanical bladder outlet obstruction.<br><b>2. Delirium/Restricted Mobility:</b> Secondary to postoperative state, acute pain, hip fracture immobilization, and opioid medication administration."
  },
  {
    q: "A 69-year-old man presents with new-onset urinary leakage. He was recently started on amitriptyline for diabetic neuropathy. What is the pathophysiology of his incontinence?",
    a: "<b>Mechanism:</b> Amitriptyline has strong <b>anticholinergic properties</b>. It blocks muscarinic M3 receptors on the detrusor muscle, preventing it from contracting. This results in urinary retention, bladder overdistension, and <b>overflow urinary incontinence</b>."
  },
  {
    q: "What key historical details should be obtained during the initial evaluation of urinary incontinence?",
    a: "<b>Key History Details:</b><ul><li><b>Leakage patterns:</b> Triggers (coughing vs. sudden urge)</li><li><b>Frequency:</b> Daytime voids and <b>nocturia</b></li><li><b>Volume:</b> Large gushes vs. continuous dribbling</li><li><b>Associated symptoms:</b> Dysuria, hematuria, pelvic pain, or hesitancy</li><li><b>Comorbidities:</b> Neurological diseases, diabetes, CHF, mobility limitations</li><li><b>Medication review:</b> Anticholinergics, diuretics, alpha-blockers</li></ul>"
  },
  {
    q: "What is a voiding (bladder) diary, and how is it utilized in the evaluation of urinary incontinence?",
    a: "<b>Definition:</b> A patient-kept record tracking fluid intake, voiding frequency, volume of urine voided, and timing/triggers of incontinence episodes.<br><b>Duration:</b> Typically maintained for <b>3 consecutive days</b>.<br><b>Clinical Utility:</b> Differentiates between polyuria, nocturnal polyuria, and true storage defects; provides objective baseline data to guide behavioral therapy."
  },
  {
    q: "What are the key components of the physical examination for older men and women presenting with urinary incontinence?",
    a: "<b>Components for Both:</b><ul><li><b>Abdominal exam:</b> Palpation and percussion for a distended bladder</li><li><b>Neurological exam:</b> Cognitive screening (MMSE/MoCA), lower extremity reflexes, gait, perineal sensation, and anal sphincter tone</li></ul><b>Women:</b><ul><li><b>Pelvic exam:</b> Assessment for <b>atrophic vaginitis</b> (dry, pale mucosa) and <b>pelvic organ prolapse</b> (cystocele, rectocele)</li><li><b>Cough stress test:</b> Witnessing immediate leakage with coughing</li></ul><b>Men:</b><ul><li><b>Digital Rectal Exam (DRE):</b> Assessment of <b>prostate size</b>, symmetry, and nodules (BPH vs. prostate cancer)</li></ul>"
  },
  {
    q: "What are the initial laboratory tests recommended for all patients presenting with urinary incontinence?",
    a: "<b>Initial Labs:</b><ol><li><b>Urinalysis:</b> To screen for hematuria (malignancy), glycosuria (diabetes), and signs of infection (nitrites, leukocyte esterase)</li><li><b>Urine Culture:</b> Performed if urinalysis shows signs of infection or if the patient has acute dysuria/fever</li><li><b>Basic Metabolic Panel:</b> To evaluate renal function (Creatinine/eGFR) if urinary retention is suspected</li></ol>"
  },
  {
    q: "What is a post-void residual (PVR) volume, and what are the two main methods to measure it?",
    a: "<b>Definition:</b> The volume of urine remaining in the bladder immediately after voluntary voiding (within 10-15 minutes).<br><b>Measurement Methods:</b><ul><li><b>Bladder Ultrasound:</b> Preferred, non-invasive, quick, and carries no risk of infection</li><li><b>In-and-Out Urethral Catheterization:</b> Invasive but provides the most precise measurement and allows for obtaining a sterile urine sample</li></ul>"
  },
  {
    q: "How are post-void residual (PVR) volumes interpreted in older adults?",
    a: "<b>Normal PVR:</b> <b>&lt; 50 mL</b> is normal (up to 100 mL is often accepted in patients &gt; 65 years). It indicates adequate bladder emptying and rules out obstruction or underactivity.<br><b>Abnormal PVR:</b> <b>&gt; 200 mL</b> indicates significant urinary retention and is suggestive of <b>detrusor underactivity</b> or <b>bladder outlet obstruction</b>.<br><b>Gray Zone:</b> <b>50-200 mL</b> is indeterminate and requires clinical correlation and serial monitoring."
  },
  {
    q: "What are the main components of a urodynamic study?",
    a: "<b>Urodynamic Components:</b><ul><li><b>Uroflowmetry:</b> Measures the speed and pattern of urine flow</li><li><b>Cystometry (Cystometrogram):</b> Measures bladder pressure and volume during filling to assess detrusor stability and compliance</li><li><b>Urethral Pressure Profilometry:</b> Evaluates urethral sphincter function</li><li><b>Pressure-Flow study:</b> Compares bladder pressure to urine flow rate during voiding</li></ul>"
  },
  {
    q: "What are the clinical indications for referring a patient for urodynamic testing?",
    a: "<b>Indications:</b><ul><li>Failure to respond to initial empiric conservative therapy</li><li>Prior pelvic surgery (e.g., hysterectomy, prostatectomy) or pelvic radiation</li><li>Diagnostic uncertainty (mixed symptoms)</li><li>Suspected neurogenic bladder (e.g., spinal cord injury, MS)</li><li>Prior to any planned surgical intervention for urinary incontinence</li></ul>"
  },
  {
    q: "What is the primary pathophysiology of Urge Urinary Incontinence (UUI)?",
    a: "<b>Pathophysiology:</b> <b>Detrusor overactivity</b>, characterized by involuntary, uninhibited detrusor muscle contractions during the bladder filling phase. It can be idiopathic or neurogenic (secondary to loss of central inhibitory control from stroke, dementia, or Parkinson disease)."
  },
  {
    q: "What is the difference between Urge Urinary Incontinence (UUI) and Overactive Bladder (OAB) in terms of definition and pathophysiology?",
    a: "<b>Urge Urinary Incontinence (UUI):</b> Pathophysiologically driven by <b>detrusor overactivity</b> (involuntary detrusor contractions during filling), resulting in involuntary leakage of urine immediately following a sudden, compelling urge to void.<br><b>Overactive Bladder (OAB):</b> A clinical syndrome defined by urinary <b>urgency</b>, usually accompanied by frequency and nocturia, with or without incontinence (OAB 'wet' vs. 'dry'). OAB is the clinical symptom complex, whereas UUI requires involuntary urine leakage."
  },
  {
    q: "What is the classic clinical presentation of a patient with Urge Urinary Incontinence (UUI)?",
    a: "<b>Presentation:</b><ul><li>Sudden, intense, and compelling desire to void that is difficult to defer</li><li>Involuntary urine loss immediately following the urge</li><li>Often results in a <b>large volume</b> of urine loss</li><li>Frequent <b>nocturia</b> and high daytime voiding frequency</li></ul>"
  },
  {
    q: "What are the first-line, non-pharmacological therapies for Urge Urinary Incontinence (UUI)?",
    a: "<b>First-Line Therapies:</b><ul><li><b>Bladder training:</b> Voiding on a strict schedule, gradually increasing intervals</li><li><b>Urgency suppression:</b> Using distraction and pelvic floor contraction (quick flicks) when an urge strikes</li><li><b>Pelvic Floor Muscle Training (PFMT):</b> Kegel exercises to strengthen the pelvic floor</li><li><b>Dietary modifications:</b> Restricting bladder irritants (caffeine, alcohol, carbonated drinks, spicy foods)</li></ul>"
  },
  {
    q: "What is the mechanism of action of antimuscarinic medications in the treatment of urge incontinence?",
    a: "<b>Mechanism:</b> They competitively block <b>M3 muscarinic receptors</b> on the detrusor muscle. This inhibits acetylcholine-induced detrusor contractions, increasing bladder capacity and reducing the frequency and intensity of involuntary contractions."
  },
  {
    q: "What are three commonly prescribed antimuscarinic medications for urge urinary incontinence?",
    a: "<b>Drugs:</b><ol><li><b>Oxybutynin</b> (available in oral, transdermal patch, and topical gel formulations)</li><li><b>Tolterodine</b></li><li><b>Solifenacin</b></li></ol>"
  },
  {
    q: "Why does oxybutynin have the highest incidence of anticholinergic side effects among OAB medications?",
    a: "<b>Reason:</b> Oxybutynin is a highly lipophilic, neutral tertiary amine that easily crosses the <b>blood-brain barrier</b>. It has high affinity for both M1 and M3 receptors, leading to significant central side effects (confusion, memory impairment) and peripheral side effects (dry mouth, constipation)."
  },
  {
    q: "What are the classic peripheral and central side effects of antimuscarinic drugs used for urinary incontinence?",
    a: "<b>Side Effects:</b><ul><li><b>Dry mouth:</b> (most common reason for discontinuation)</li><li><b>Constipation:</b> (can worsen urinary retention)</li><li><b>Blurry vision/Dry eyes:</b> Due to pupillary dilation and decreased tear production</li><li><b>Tachycardia:</b> Due to vagal block</li><li><b>Cognitive impairment:</b> Confusion, delirium, memory loss (especially in the elderly)</li></ul>"
  },
  {
    q: "What are the Beers Criteria recommendations regarding the use of oral antimuscarinic drugs for OAB in older adults?",
    a: "<b>Beers Recommendation:</b> <b>Avoid</b> oral antimuscarinics in older adults, particularly those with cognitive impairment, dementia, or a history of falls. They cause significant <b>anticholinergic adverse effects</b>, increase the risk of delirium, accelerate cognitive decline, and elevate fall risks."
  },
  {
    q: "How does trospium chloride differ from other antimuscarinic drugs regarding cognitive safety in the elderly?",
    a: "<b>Trospium Difference:</b> Trospium is a <b>quaternary amine</b>. Due to its positive charge and hydrophilic nature, it does <b>not</b> cross the blood-brain barrier. It has a significantly lower risk of causing central nervous system side effects (delirium, cognitive impairment) compared to tertiary amines (oxybutynin)."
  },
  {
    q: "What is the mechanism of action of mirabegron?",
    a: "<b>Mechanism:</b> It is a selective <b>beta-3 adrenergic receptor agonist</b>. Activating beta-3 receptors on the detrusor muscle stimulates adenylyl cyclase, leading to detrusor muscle relaxation during the bladder filling phase, which increases bladder capacity without affecting voiding pressure."
  },
  {
    q: "What is the primary clinical advantage of mirabegron over antimuscarinic medications in elderly patients?",
    a: "<b>Advantage:</b> Mirabegron does <b>not</b> possess anticholinergic activity. It does not cause dry mouth, constipation, or <b>cognitive impairment</b>, making it a preferred and safer pharmacological option for older adults, especially those with mild cognitive impairment or dementia."
  },
  {
    q: "What is the most important vital sign to monitor in a patient taking mirabegron, and what is its main contraindication?",
    a: "<b>Vital Sign:</b> <b>Blood pressure</b> (can cause dose-dependent increases in BP).<br><b>Contraindication:</b> <b>Severe, uncontrolled hypertension</b> (defined as systolic BP <b>&gt; 180 mmHg</b> or diastolic BP <b>&gt; 110 mmHg</b>)."
  },
  {
    q: "A 74-year-old woman with a history of mild dementia presents with severe urge urinary incontinence that has not responded to bladder training. Which medication is the most appropriate next step?",
    a: "<b>Medication:</b> <b>Mirabegron</b> 25-50 mg daily.<br><b>Rationale:</b> Antimuscarinics (e.g., oxybutynin) must be avoided due to the Beers Criteria and risk of worsening her dementia. <b>Mirabegron</b> avoids cognitive side effects while treating detrusor overactivity."
  },
  {
    q: "What is the indication for intradetrusor injection of onabotulinumtoxinA (Botox), and what is its major side effect?",
    a: "<b>Indication:</b> Refractory <b>urge urinary incontinence</b> that has failed conservative therapy and at least two oral/transdermal medications.<br><b>Major Side Effect:</b> <b>Urinary retention</b> (elevated PVR, requiring temporary clean intermittent catheterization in 5-10% of patients) and <b>urinary tract infections</b>."
  },
  {
    q: "What are the neuromodulation therapies used for refractory urge urinary incontinence?",
    a: "<b>Neuromodulation Options:</b><ul><li><b>Percutaneous Tibial Nerve Stimulation (PTNS):</b> Weekly outpatient sessions delivering retrograde electrical stimulation to the sacral plexus via the tibial nerve</li><li><b>Sacral Neuromodulation (SNM):</b> Surgical implantation of a stimulator (like a bladder pacemaker) directly stimulating the <b>S3 nerve root</b></li></ul>"
  },
  {
    q: "What is the primary pathophysiology of Stress Urinary Incontinence (SUI)?",
    a: "<b>Pathophysiology:</b> Inadequate urethral closure pressure during periods of increased intra-abdominal pressure. It is caused by either <b>urethral hypermobility</b> (poor pelvic floor support of the urethra) or <b>intrinsic sphincter deficiency (ISD)</b> (weakness of the urethral sphincter itself)."
  },
  {
    q: "What are the two primary pathophysiological mechanisms of Stress Urinary Incontinence (SUI)?",
    a: "<b>1. Urethral Hypermobility:</b> Weakness of the pelvic floor muscles and endopelvic fascia (due to aging, obesity, childbirth) causes the bladder neck and urethra to rotate and descend during increased intra-abdominal pressure, letting urine escape.<br><b>2. Intrinsic Sphincter Deficiency (ISD):</b> Weakness of the urethral sphincter muscle itself (due to prior pelvic surgeries, radiation, or severe tissue atrophy) prevents proper coaptation (closure), leading to leakage even without hypermobility."
  },
  {
    q: "What is the classic clinical presentation of Stress Urinary Incontinence (SUI)?",
    a: "<b>Presentation:</b><ul><li>Involuntary leakage of urine immediately during activities that increase intra-abdominal pressure (e.g., <b>coughing, sneezing, laughing, lifting, climbing stairs</b>)</li><li>Absence of a prior sensation of urgency</li><li>Leakage of <b>small volumes</b> of urine</li></ul>"
  },
  {
    q: "How is the cough stress test performed and interpreted for stress urinary incontinence?",
    a: "<b>Procedure:</b> The patient is examined with a comfortably full bladder. The examiner visualizes the urethral meatus while the patient coughs vigorously in the supine or standing position.<br><b>Interpretation:</b> Immediate, spurt-like leakage of urine synchronized with the cough is diagnostic of <b>stress urinary incontinence</b>. Delayed leakage suggests cough-induced detrusor contraction."
  },
  {
    q: "What are the first-line, non-pharmacological management strategies for Stress Urinary Incontinence (SUI)?",
    a: "<b>First-Line Management:</b><ul><li><b>Pelvic Floor Muscle Training (PFMT / Kegel exercises):</b> Strengthens the levator ani muscle group</li><li><b>Biofeedback:</b> Helps patients isolate and contract pelvic floor muscles correctly</li><li><b>Weight loss:</b> Reduces intra-abdominal pressure in overweight/obese women</li><li><b>Smoking cessation:</b> Reduces chronic coughing, a major trigger of SUI</li></ul>"
  },
  {
    q: "How is a patient instructed to perform Pelvic Floor Muscle Training (Kegel exercises)?",
    a: "<b>Instructions:</b> The patient is taught to isolate the muscle group used to stop the flow of flatus or urine (without contracting the glutes or abdominals). The exercises consist of contracting the muscles for <b>5-10 seconds</b> followed by 10 seconds of relaxation, repeated 10-15 times per set, 3 times daily, for at least <b>6-8 weeks</b>."
  },
  {
    q: "What is the role of lifestyle modifications (weight loss and smoking cessation) in managing SUI?",
    a: "<b>Weight Loss:</b> Reduces baseline intra-abdominal pressure, relieving mechanical stress on the pelvic floor muscles.<br><b>Smoking Cessation:</b> Decreases chronic coughing, which is a major physical trigger that causes sudden increases in intra-abdominal pressure and leads to leakage."
  },
  {
    q: "What is the role of duloxetine in the management of stress urinary incontinence?",
    a: "<b>Mechanism:</b> It is a serotonin-norepinephrine reuptake inhibitor (SNRI) that increases neurotransmitter levels at the pudendal nerve, stimulating <b>pudendal nerve motor neurons</b> and increasing urethral sphincter contractility.<br><b>Status:</b> Used off-label in the US; limited by side effects (nausea, headache, dry mouth, insomnia)."
  },
  {
    q: "How does topical vaginal estrogen assist in the management of stress urinary incontinence?",
    a: "<b>Mechanism:</b> In postmenopausal women, estrogen deficiency leads to thinning and atrophy of the urethral mucosal lining. <b>Topical vaginal estrogen</b> increases mucosal thickness, improves urethral vascularity, and enhances urethral coaptation, helping to restore closure pressure."
  },
  {
    q: "What is a pessary, and how is it used to manage stress urinary incontinence?",
    a: "<b>Pessary:</b> A removable intravaginal device (e.g., ring with knob, incontinence dish) that is inserted into the vagina.<br><b>Mechanism:</b> The knob supports the urethra and bladder neck, preventing descent and compressing the urethra against the pubic bone during increases in intra-abdominal pressure."
  },
  {
    q: "What are the maintenance requirements and potential complications of using a vaginal pessary?",
    a: "<b>Maintenance:</b> Must be regularly removed, cleaned, and reinserted (typically weekly to monthly depending on type), and the vagina must be inspected for erosions.<br><b>Complications:</b> Vaginal discharge, odor, mucosal ulceration, vaginal bleeding, and discomfort."
  },
  {
    q: "What is the gold standard surgical intervention for stress urinary incontinence due to urethral hypermobility?",
    a: "<b>Surgical Option:</b> <b>Midurethral sling procedures</b> (e.g., Tension-free Vaginal Tape [<b>TVT</b>] or Transobturator Tape [<b>TOT</b>]). They use a synthetic mesh tape to support the mid-urethra, acting as a backstop during increases in intra-abdominal pressure."
  },
  {
    q: "What surgical procedure is preferred for stress urinary incontinence caused by intrinsic sphincter deficiency (ISD) in patients who are not candidates for a sling?",
    a: "<b>Procedure:</b> <b>Urethral bulking agents</b> (e.g., periurethral injection of collagen or synthetic hydrogel).<br><b>Mechanism:</b> Thickens the urethral wall and enhances mucosal coaptation, improving the seal of the urethral sphincter."
  },
  {
    q: "What is the primary pathophysiology of Overflow Urinary Incontinence (OUI)?",
    a: "<b>Pathophysiology:</b> Chronic urinary retention leads to progressive bladder overdistension. Once intravesical pressure exceeds the maximal urethral pressure, involuntary leakage occurs. It is caused by <b>detrusor underactivity</b>, <b>bladder outlet obstruction</b>, or both."
  },
  {
    q: "What causes detrusor underactivity in older adults?",
    a: "<b>Causes:</b><ul><li><b>Neurogenic bladder:</b> Diabetic autonomic neuropathy, spinal cord injury, multiple sclerosis, low motor neuron lesions</li><li><b>Myogenic damage:</b> Chronic bladder overdistension leading to fibrosis of the detrusor muscle fibers</li><li><b>Medications:</b> Anticholinergic drugs, calcium channel blockers</li></ul>"
  },
  {
    q: "What are the most common causes of bladder outlet obstruction in older men and older women?",
    a: "<b>Men:</b> <b>Benign prostatic hyperplasia (BPH)</b> (most common), prostate cancer, urethral stricture.<br><b>Women:</b> Severe <b>pelvic organ prolapse</b> (e.g., large cystocele obstructing the urethra), urethral stricture, or prior over-tight anti-incontinence surgery."
  },
  {
    q: "What is the classic clinical presentation of Overflow Urinary Incontinence (OUI)?",
    a: "<b>Presentation:</b><ul><li>Continuous dribbling of small volumes of urine</li><li>Sensation of incomplete bladder emptying</li><li>Urinary hesitancy, weak stream, and straining to void</li><li>Lower abdominal fullness or palpable bladder</li><li><b>Nocturia</b> and frequent small voids</li></ul>"
  },
  {
    q: "What is the diagnostic cutoff of post-void residual (PVR) volume that confirms overflow incontinence or urinary retention?",
    a: "<b>Diagnostic Cutoff:</b> A PVR <b>&gt; 200 mL</b>. In many clinical scenarios of overflow incontinence, the PVR can exceed 400-500 mL, and a palpable suprapubic mass (distended bladder) may be present."
  },
  {
    q: "What is the first-line intervention for chronic urinary retention and overflow incontinence due to detrusor underactivity?",
    a: "<b>Management:</b> <b>Clean Intermittent Catheterization (CIC)</b>. It is performed 3-4 times daily to keep bladder volumes below 400-500 mL, protecting the upper urinary tract from hydronephrosis and reducing infection risk."
  },
  {
    q: "Why is Clean Intermittent Catheterization (CIC) preferred over an indwelling urethral (Foley) catheter for long-term management?",
    a: "<b>Reasons:</b><ul><li>Significantly lower risk of <b>catheter-associated urinary tract infections (CAUTIs)</b></li><li>Avoids bladder spasms and urethral erosion/strictures</li><li>Preserves patient autonomy and improves quality of life</li><li>Avoids chronic colonization/encrustation associated with indwelling catheters</li></ul>"
  },
  {
    q: "What is the mechanism of action, onset, and examples of selective alpha-1 blockers in BPH-induced overflow incontinence?",
    a: "<b>Mechanism:</b> Block <b>alpha-1a receptors</b> in the prostatic urethra and bladder neck, relaxing prostatic smooth muscle and reducing outlet resistance.<br><b>Onset:</b> Rapid (typically within <b>3-7 days</b>).<br><b>Examples:</b> <b>Tamsulosin</b>, <b>alfuzosin</b>, and <b>silodosin</b>."
  },
  {
    q: "What are the primary side effects, precautions, and risks of alpha-1 blockers in the elderly?",
    a: "<b>Side Effects:</b> Orthostatic hypotension, dizziness, headache, and retrograde ejaculation.<br><b>Precautions/Risks:</b> Increased risk of <b>falls</b> due to orthostasis. Can cause <b>intraoperative floppy iris syndrome (IFIS)</b>, requiring the drug to be held prior to cataract surgery."
  },
  {
    q: "What is the mechanism of action, onset of action, and target prostate size for 5-alpha reductase inhibitors (5-ARIs) in overflow incontinence?",
    a: "<b>Mechanism:</b> Inhibits <b>5-alpha reductase</b> to block the conversion of testosterone to <b>dihydrotestosterone (DHT)</b>, inducing epithelial cell apoptosis and reducing prostate volume by 20-25%.<br><b>Onset of Action:</b> Slow (takes <b>6-12 months</b> for maximum clinical effect).<br><b>Target Prostate Size:</b> Indicated for significantly enlarged prostates (volume <b>&gt; 40 mL</b> or palpably enlarged)."
  },
  {
    q: "How do 5-alpha reductase inhibitors (5-ARIs) affect serum prostate-specific antigen (PSA) levels, and how is this managed clinically?",
    a: "<b>PSA Effect:</b> 5-ARIs (e.g., <b>finasteride</b>, <b>dutasteride</b>) reduce serum PSA levels by approximately <b>50%</b>.<br><b>Clinical Management:</b> To interpret a PSA level in a patient who has been taking a 5-ARI for &gt; 6 months, the measured PSA value must be <b>multiplied by 2</b> to obtain the true corrected value."
  },
  {
    q: "What are the main side effects of 5-alpha reductase inhibitors?",
    a: "<b>Side Effects:</b> Erectile dysfunction, decreased libido, ejaculatory disorders, and <b>gynecomastia</b>. There is also a small risk of developing high-grade prostate cancer."
  },
  {
    q: "A 72-year-old man with a history of BPH and a prostate volume of 55 mL presents with overflow incontinence. He complains of dizziness when standing. Which class of BPH medication is preferred for him?",
    a: "<b>Preferred Class:</b> <b>5-alpha reductase inhibitor (e.g., finasteride)</b>.<br><b>Rationale:</b> Alpha-blockers (like tamsulosin) may worsen his orthostatic dizziness. <b>Finasteride</b> is effective for his enlarged prostate (&gt; 40 mL) and does not cause orthostatic hypotension."
  },
  {
    q: "What is Functional Urinary Incontinence (FUI)?",
    a: "<b>Definition:</b> Involuntary loss of urine in a patient who has normal lower urinary tract function but cannot reach the toilet in time due to <b>physical</b>, <b>cognitive</b>, or <b>environmental barriers</b>."
  },
  {
    q: "What are the common physical, cognitive, and environmental causes of functional urinary incontinence?",
    a: "<b>Causes:</b><ul><li><b>Physical:</b> Severe osteoarthritis, Parkinson disease gait impairment, stroke-induced hemiplegia, or use of physical restraints</li><li><b>Cognitive:</b> Advanced Alzheimer dementia, severe delirium (inability to recognize the need to void)</li><li><b>Environmental:</b> Bed too high, lack of clear lighting, bathroom too far, or clothing with complex buttons/zippers</li></ul>"
  },
  {
    q: "How does timed voiding differ from prompted voiding in the management of functional incontinence?",
    a: "<b>Timed Voiding:</b> Incontinence management on a fixed, pre-determined schedule (e.g., every 2 hours), regardless of the patient's urge. The patient voids whether they feel the need or not.<br><b>Prompted Voiding:</b> Caregivers check the patient regularly, ask if they are wet or dry, prompt them to try to void, and praise them when they use the toilet successfully. (Preferred for patients with cognitive impairment)."
  },
  {
    q: "What environmental modifications can help manage Functional Urinary Incontinence?",
    a: "<b>Modifications:</b><ul><li>Placing a <b>bedside commode</b> near the patient's bed</li><li>Using easily removable clothing (e.g., pants with <b>elastic waistbands</b> or velcro closures)</li><li>Installing grab bars in the bathroom and ensuring adequate lighting at night</li><li>Removing trip hazards like throw rugs along the path to the bathroom</li></ul>"
  },
  {
    q: "What is the clinical definition of nocturia, and what are the major etiologies in older adults?",
    a: "<b>Definition:</b> Waking up <b>1 or more times</b> during the night to void.<br><b>Etiologies:</b><ul><li><b>Nocturnal polyuria:</b> Overproduction of urine at night</li><li><b>Reduced bladder capacity:</b> OAB, BPH, or pelvic organ prolapse</li><li><b>Sleep disturbances:</b> Primary insomnia, chronic pain, or sleep apnea</li></ul>"
  },
  {
    q: "What is nocturnal polyuria, and how is it diagnosed and initially managed?",
    a: "<b>Definition:</b> Nighttime urine production exceeding <b>&gt; 20-33%</b> of the total 24-hour urine volume.<br><b>Diagnosis:</b> <b>24-hour voiding diary</b>.<br><b>Initial Management:</b><ul><li>Evening fluid restriction (especially caffeine/alcohol after 4 PM)</li><li>Late afternoon <b>leg elevation</b> and/or compression stockings to mobilize peripheral edema</li><li>Administering loop diuretics in the <b>mid-afternoon</b> (6 hours before bedtime)</li></ul>"
  },
  {
    q: "Why is desmopressin used with extreme caution for nocturia in older adults, and what monitoring is required?",
    a: "<b>Cautions:</b> High risk of causing severe, life-threatening <b>hyponatremia</b> (dilutional hyponatremia due to water retention).<br><b>Monitoring:</b> Serum sodium must be checked at <b>baseline</b>, within <b>3-7 days</b> of starting therapy or dose titration, at <b>1 month</b>, and periodically thereafter."
  },
  {
    q: "What do cystometry, urethral pressure profilometry, and voiding cystourethrogram (VCUG) measure in the evaluation of urinary incontinence?",
    a: "<b>Cystometry:</b> Measures detrusor compliance, capacity, and the presence of uninhibited contractions (confirms <b>detrusor overactivity</b>).<br><b>Urethral Pressure Profilometry:</b> Measures pressure along the urethra to evaluate sphincter strength.<br><b>Voiding Cystourethrogram (VCUG):</b> Visualizes the anatomy of the bladder neck, urethra, and vesicoureteral reflux during micturition."
  },
  {
    q: "What are the key strategies for preventing Catheter-Associated Urinary Tract Infections (CAUTIs), and how is asymptomatic bacteriuria managed in catheterized patients?",
    a: "<b>CAUTI Prevention:</b><ul><li>Avoid unnecessary catheters; assess daily and remove ASAP</li><li>Maintain a closed drainage system with the bag <b>below the level of the bladder</b> at all times</li><li>Use aseptic insertion technique</li></ul><b>Asymptomatic Bacteriuria Management:</b> Do <b>not</b> screen or treat asymptomatic bacteriuria in patients with chronic indwelling catheters or established incontinence, as this does not improve incontinence and increases antibiotic resistance."
  },
  {
    q: "What is mixed urinary incontinence (MUI), and what is the recommended strategy for its clinical management?",
    a: "<b>Definition:</b> Involuntary leakage of urine associated with symptoms of both <b>stress urinary incontinence</b> (leakage with exertion/coughing) and <b>urge urinary incontinence</b> (leakage with urgency).<br><b>Management Strategy:</b><ul><li><b>First-Line:</b> Behavioral therapy and pelvic floor muscle training (PFMT) with bladder training, which effectively targets both components.</li><li><b>Targeted Therapy:</b> If symptoms persist, identify the <b>most bothersome symptom</b> (stress or urge) and treat it first. If urge is most bothersome, add mirabegron or an antimuscarinic; if stress is most bothersome, proceed to a pessary or surgical consultation (midurethral sling).</li></ul>"
  },
  {
    q: "What are the key risk factors and the initial management of acute postoperative urinary retention (POUR) in elderly patients?",
    a: "<b>Risk Factors:</b> Advanced age (&gt;70 years), male sex, pre-existing BPH, spinal or epidural anesthesia, long surgery duration, joint replacements (hip/knee), and perioperative administration of anticholinergics or opioids.<br><b>Management Sequence:</b><ol><li>Perform a <b>bladder ultrasound scan</b> to estimate urine volume.</li><li>If volume is <b>&gt;400–500 mL</b>, perform <b>in-and-out urethral catheterization</b> to decompress the bladder.</li><li>If retention recurs or is severe (&gt;800 mL), place a short-term indwelling Foley catheter and conduct a voiding trial (tamsulosin initiation + clip-and-trial) in 3–5 days.</li><li>Optimize analgesia, minimize opioids/anticholinergics, and encourage early ambulation.</li></ol>"
  },
  {
    q: "What is a sensory neurogenic bladder, in which chronic disease is it commonly seen, and how is it managed?",
    a: "<b>Pathophysiology:</b> Loss of sensory afferent signals from the bladder to the brain. The patient loses the sensation of bladder fullness, leading to infrequent voiding, chronic bladder overdistension, and eventual detrusor myogenic failure (leading to overflow incontinence).<br><b>Common Cause:</b> Long-standing <b>diabetic neuropathy</b> (autonomic neuropathy).<br><b>Management:</b> <b>Timed voiding</b> (instructing the patient to void by the clock, e.g., every 3–4 hours during the day, regardless of the presence of urge) and double voiding to prevent chronic overdistension and preserve detrusor function."
  },
  {
    q: "What is the clinical significance of testing the bulbocavernosus reflex and the anal wink during the physical examination for urinary incontinence?",
    a: "<b>Anatomy:</b> Both reflexes test the integrity of the <b>sacral spinal cord segments (S2–S4)</b> and the pudendal nerve.<br><b>Bulbocavernosus Reflex:</b> Squeezing the glans penis or clitoris should cause contraction of the anal sphincter.<br><b>Anal Wink (Perineal Reflex):</b> Stroking the perianal skin should cause visible contraction of the external anal sphincter.<br><b>Clinical Significance:</b> An absent reflex suggests a <b>lower motor neuron lesion</b> or peripheral neuropathy (e.g., cauda equina syndrome, diabetic neuropathy, sacral plexopathy), pointing to a neurogenic etiology for the bladder dysfunction (e.g., detrusor underactivity)."
  },
  {
    q: "What are the only acceptable clinical indications for long-term chronic indwelling (Foley) catheterization in the elderly?",
    a: "Due to the high risk of <b>urosepsis</b> and urethral damage, chronic indwelling catheters are strictly restricted to:<ul><li><b>Wound healing:</b> Presence of stage 3 or 4 sacral/perineal pressure ulcers that cannot heal due to constant contamination with urine</li><li><b>Intractable urinary retention:</b> Severe bladder outlet obstruction or detrusor underactivity that is not manageable by surgery and where <b>clean intermittent catheterization (CIC)</b> is impossible or refused</li><li><b>Palliative/End-of-life care:</b> To maximize comfort in terminally ill patients</li></ul>"
  },
  {
    q: "How does moderate-to-severe dementia affect the neurological control of micturition and contribute to incontinence?",
    a: "<b>Pathophysiology:</b> Progressive damage to the frontal cortex leads to the loss of <b>frontal inhibitory pathways</b> that normally suppress the sacral micturition reflex. This causes **detrusor hyperreflexia** (uninhibited detrusor contractions at low bladder volumes), leading to sudden urge incontinence.<br><b>Cognitive Barriers:</b> The patient fails to recognize bladder fullness, cannot find or identify the toilet, and loses the motor skills needed to undress, resulting in a combination of urge and functional incontinence.<br><b>Management:</b> Caregiver-directed <b>prompted voiding</b> and scheduled toileting every 2 hours."
  }
];

module.exports = cards_geri_urinary_incontinence;

