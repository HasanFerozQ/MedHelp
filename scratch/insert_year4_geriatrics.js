const fs = require('fs');
const path = require('path');

const htmlPath = 'c:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html';
const backupPath = 'c:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html.bak2';
const htmlContent = fs.readFileSync(htmlPath, 'utf8');

// 1. Define the 250 flashcards
const newTopics = [
  {
    section: 'Geriatrics',
    topic: 'Physiological aging — organ system changes, pharmacokinetic/pharmacodynamic shifts',
    icon: 'calendar',
    cards: [
      { q: "What cardiovascular change in physiological aging is primarily responsible for isolated systolic hypertension in the elderly?", a: "<b>Arterial stiffening</b> due to loss of elastin and increased deposition of collagen in the arterial wall, leading to decreased compliance of large arteries." },
      { q: "How does aging affect the maximal heart rate, and what is the underlying mechanism?", a: "Maximal heart rate <b>decreases</b> due to a decrease in <b>beta-adrenergic responsiveness</b> and age-related loss of pacemaker cells in the sinoatrial node." },
      { q: "What is the effect of physiological aging on the glomerular filtration rate (GFR)?", a: "GFR <b>decreases</b> by approximately $1\\\\text{ mL/min/1.73 m}^2$ per year starting around age 40, due to renal cortex atrophy and nephron loss." },
      { q: "State the Cockcroft-Gault formula used to estimate creatinine clearance (CrCl) in the elderly.", a: "$$\\\\text{CrCl} = \\\\frac{(140 - \\\\text{age}) \\\\times \\\\text{weight (kg)}}{72 \\\\times \\\\text{Serum Creatinine (mg/dL)}} \\\\times [0.85 \\\\text{ if female}]$$" },
      { q: "Why are elderly individuals highly susceptible to severe dehydration and hyponatremia?", a: "Due to a <b>blunted thirst sensation</b> and a age-related decrease in renal concentrating ability (reduced response to ADH and lower medullary tonicity)." },
      { q: "How does chest wall compliance and lung parenchymal elasticity change in the elderly?", a: "Chest wall compliance <b>decreases</b> (stiffening of rib cage), while lung parenchymal elasticity <b>decreases</b> (elastic recoil loss), leading to increased residual volume and physiologic dead space." },
      { q: "What change in sleep architecture is characteristic of normal aging?", a: "A decrease in <b>slow-wave (Stage 3/4) sleep</b>, leading to less deep sleep, increased nocturnal awakenings, and daytime sleepiness." },
      { q: "How does aging affect gastric acid secretion, and what is a potential nutritional consequence?", a: "Gastric acid secretion <b>decreases</b> (achlorhydria/hypochlorhydria), which impairs the absorption of <b>vitamin B12</b> (cobalamin), iron, and calcium." },
      { q: "Explain the changes in body composition associated with aging.", a: "A decrease in <b>total body water</b>, a decrease in <b>lean muscle mass</b> (sarcopenia), and an increase in <b>body fat percentage</b>." },
      { q: "What is the pharmacokinetic consequence of increased body fat in the elderly regarding lipophilic drugs (e.g., diazepam)?", a: "An <b>increased volume of distribution ($V_d$)</b>, which significantly prolongs the half-life ($t_{1/2}$) and duration of action of the drug." },
      { q: "What is the pharmacokinetic consequence of decreased total body water in the elderly regarding hydrophilic drugs (e.g., digoxin)?", a: "A <b>decreased volume of distribution ($V_d$)</b>, leading to higher initial serum concentrations and an increased risk of toxicity." },
      { q: "How is hepatic drug metabolism affected by normal aging?", a: "<b>Phase I metabolism</b> (oxidation, reduction, hydrolysis via cytochrome P450) is typically **decreased** due to reduced hepatic blood flow and liver mass, whereas **Phase II metabolism** (conjugation) is relatively **spared**." },
      { q: "Which phase of hepatic metabolism is preferred for drugs selected for elderly patients, and why?", a: "<b>Phase II metabolism</b> (conjugation, e.g., glucuronidation) because its activity is not significantly altered by aging, reducing the risk of drug accumulation." },
      { q: "How does renal drug clearance change in the elderly, and why is serum creatinine alone a poor marker of renal function?", a: "Renal clearance **decreases**. Serum creatinine remains stable because the age-related decrease in GFR is balanced by a **decrease in muscle mass** (lower creatinine production)." },
      { q: "Explain the pharmacodynamic shift in the elderly regarding central nervous system (CNS) active drugs.", a: "There is an **increased sensitivity** to CNS drugs (e.g., benzodiazepines, opioids, anticholinergics) due to increased blood-brain barrier permeability and altered receptor density." },
      { q: "How does baroreceptor sensitivity change with age, and what clinical vulnerability does this create?", a: "Baroreceptor sensitivity **decreases**, leading to an impaired heart rate response to orthostatic changes and a high risk of **orthostatic hypotension**." },
      { q: "What age-related pulmonary change predisposes the elderly to aspiration pneumonia?", a: "A **decreased cough reflex** and impaired mucociliary clearance." }
    ]
  },
  {
    section: 'Geriatrics',
    topic: 'Falls & gait disorders — risk assessment, prevention, workup',
    icon: 'footprints',
    cards: [
      { q: "Differentiate between intrinsic and extrinsic risk factors for falls in the elderly.", a: "<b>Intrinsic:</b> muscle weakness, history of falls, visual impairment, cognitive decline, urinary urgency. <b>Extrinsic:</b> home hazards (throw rugs, poor lighting, loose cords), inappropriate footwear, and polypharmacy." },
      { q: "Explain the Timed Up and Go (TUG) test and how its results are interpreted.", a: "The patient is timed rising from a chair, walking 3 meters, turning, walking back, and sitting. **< 10 seconds** is normal; **> 12--15 seconds** indicates a high risk for falls." },
      { q: "Describe the classic gait abnormality seen in patients with Parkinson's disease.", a: "A **shuffling, short-stepped gait** (festination) with decreased arm swing, forward-flexed posture, and difficulty initiating movement or turning." },
      { q: "Contrast the gait of cerebellar ataxia with that of sensory ataxia.", a: "<b>Cerebellar ataxia:</b> wide-based, unstable, \"drunken\" gait with irregular steps. <b>Sensory ataxia:</b> wide-based gait with high steps and hard heel strikes (stomping), which **worsens significantly in the dark** or with eyes closed (positive Romberg)." },
      { q: "What defines orthostatic hypotension (OH) on physical examination?", a: "A decrease in systolic blood pressure of <b>$\\\\ge 20\\\\text{ mmHg}$</b> or a decrease in diastolic blood pressure of <b>$\\\\ge 10\\\\text{ mmHg}$</b> within 3 minutes of standing from a supine position." },
      { q: "What is carotid sinus hypersensitivity, and how does it present in the elderly?", a: "An exaggerated baroreceptor response to carotid sinus stimulation (e.g., turning head, tight collar) causing a **ventricular pause $> 3$ seconds** or a systolic blood pressure drop **$> 50\\\\text{ mmHg}$**, presenting as recurrent syncope or falls." },
      { q: "What is the single most effective exercise intervention to prevent falls in community-dwelling older adults?", a: "Balance and strength training, with **Tai Chi** being highly recommended to improve postural stability and coordination." },
      { q: "What dietary supplement has been shown to reduce falls in older adults with documented deficiency?", a: "<b>Vitamin D</b> supplementation, which improves muscle strength and balance in deficient individuals." },
      { q: "How should a standard cane be sized and fitted for an elderly patient?", a: "The top of the cane should align with the patient's **wrist crease** when standing upright with their arms hanging naturally. The cane is held in the hand **opposite** to the weak or painful leg." },
      { q: "What class of medications is most strongly associated with falls in the elderly?", a: "<b>Psychotropic medications</b> (benzodiazepines, antipsychotics, antidepressants, and sedatives) due to side effects of sedation, ataxia, and cognitive impairment." },
      { q: "Explain the 'fall cascade' in geriatric patients.", a: "A fall leads to a **fear of falling**, which causes **restricted activity**, leading to **deconditioning and muscle weakness**, which further **increases the risk of future falls**." },
      { q: "Describe the gait seen in patients with hemiparesis (e.g., post-stroke).", a: "A **circumduction gait**, where the patient swings the affected leg outward and forward in a semi-circle to clear the ground, due to distal weakness and spasticity." },
      { q: "What is the role of a home safety evaluation in fall prevention?", a: "An occupational therapist evaluates the home to identify and eliminate hazards (e.g., adding grab bars in bathrooms, securing rug edges, improving lighting, removing clutter)." },
      { q: "What is the standard cardiovascular workup for an older adult presenting with unexplained recurrent falls?", a: "Check **orthostatic vitals**, obtain an **ECG** to screen for conduction blocks or arrhythmias, and perform **echocardiography** if structural heart disease is suspected." },
      { q: "How does severe peripheral neuropathy contribute to falls?", a: "It impairs **proprioceptive feedback** from the feet, making the patient unable to sense foot position on the ground, requiring visual compensation." },
      { q: "Name a cognitive risk factor that is independently associated with an increased risk of falls.", a: "<b>Dementia</b> (or mild cognitive impairment), which impairs judgment, hazard recognition, and spatial navigation." },
      { q: "Describe the gait associated with severe knee or hip osteoarthritis.", a: "An **antalgic gait**, characterized by a shortened stance phase on the affected limb to minimize weight-bearing and pain." }
    ]
  },
  {
    section: 'Geriatrics',
    topic: 'Delirium vs dementia — differentiation, workup, management',
    icon: 'brain',
    cards: [
      { q: "Contrast the onset, course, and reversibility of delirium vs. dementia.", a: "<b>Delirium:</b> acute onset (hours to days), fluctuating course, and **reversible** once the underlying trigger is treated. <b>Dementia:</b> insidious onset (months to years), progressive course, and **irreversible**." },
      { q: "How does attention and consciousness differ in delirium vs. dementia?", a: "<b>Delirium:</b> severely impaired attention and **altered state of consciousness** (fluctuating alertness). <b>Dementia:</b> normal attention and **clear consciousness** until the late stages." },
      { q: "What are the three main motor subtypes of delirium, and which has the worst prognosis?", a: "1) **Hyperactive** (agitation, hallucinations). 2) **Hypoactive** (lethargy, withdrawal). 3) **Mixed**. **Hypoactive delirium** has the worst prognosis because it is frequently unrecognized or mistaken for depression." },
      { q: "State the four features of the Confusion Assessment Method (CAM) and what is required for a positive diagnosis.", a: "1) Acute onset and fluctuating course. 2) Inattention. 3) Disorganized thinking. 4) Altered level of consciousness. Diagnosis requires **1 and 2, plus either 3 or 4**." },
      { q: "What are the most common infectious triggers of delirium in the elderly?", a: "<b>Urinary Tract Infections (UTI)</b> (often presenting without dysuria or fever) and **pneumonia**." },
      { q: "What is the initial diagnostic workup for a patient with new-onset delirium?", a: "Obtain a complete history, review medications, check vitals, blood glucose, electrolytes, renal/liver function, CBC, **urinalysis with culture**, and chest X-ray. Head CT is **not** routinely indicated unless trauma or focal deficits are present." },
      { q: "What is the role of physical restraints in the management of a delirious patient?", a: "Physical restraints should be **avoided**; they increase agitation, worsen delirium, and significantly increase the risk of injury, strangulation, and pressure ulcers." },
      { q: "Explain the first-line management strategy for delirium.", a: "Identify and **treat the underlying cause** (e.g., infection, dehydration, medication) and implement **non-pharmacological environmental interventions** (reorientation, visible clocks, family presence, preserving sleep-wake cycles)." },
      { q: "Under what specific circumstances should pharmacotherapy be used for delirium, and what is the drug of choice?", a: "Only when the patient is in **severe distress** or poses an **immediate safety hazard** to themselves or others. The drug of choice is a low-dose atypical or typical antipsychotic (e.g., **haloperidol**, **quetiapine**)." },
      { q: "Why are benzodiazepines generally avoided in the treatment of delirium, and what is the exception?", a: "They can cause paradoxical agitation and **worsen or prolong delirium**. The exception is when delirium is caused by **alcohol or sedative-hypnotic withdrawal**." },
      { q: "How does the sleep-wake cycle differ in delirium vs. dementia?", a: "<b>Delirium:</b> extreme disruption of sleep-wake cycle (frequently reversed). <b>Dementia:</b> gradual disturbance of sleep patterns (sundowning) but less acutely disrupted." },
      { q: "What is 'sundowning' in geriatric medicine?", a: "The phenomenon where neuropsychiatric symptoms (agitation, confusion, anxiety) in patients with dementia **worsen in the late afternoon or evening**." },
      { q: "Name three medications from the Beers Criteria that commonly trigger delirium in the elderly.", a: "1) First-generation antihistamines (diphenhydramine). 2) Tricyclic antidepressants (amitriptyline). 3) Benzodiazepines (alprazolam)." },
      { q: "How does sensory impairment (vision/hearing loss) impact delirium, and how is it addressed?", a: "Sensory deprivation **increases the risk of delirium**. Address it by ensuring the patient has access to their **hearing aids** and **eyeglasses**." },
      { q: "What is the prognosis of an older adult who develops delirium during a hospitalization?", a: "Associated with **increased mortality**, longer hospital stays, a higher rate of discharge to nursing homes, and accelerated cognitive decline." },
      { q: "Why is urinary retention a critical concern in a patient with acute delirium?", a: "Urinary retention (or fecal impaction) is a common, painful, and easily correctable physical **trigger for delirium**." },
      { q: "What is the difference in EEG findings between delirium and dementia?", a: "<b>Delirium:</b> shows generalized **slowing of background activity** (except in alcohol withdrawal, which shows fast activity). <b>Dementia:</b> shows normal background activity or mild focal abnormalities early on." }
    ]
  },
  {
    section: 'Geriatrics',
    topic: 'Urinary incontinence — urge, stress, overflow, functional types',
    icon: 'droplet',
    cards: [
      { q: "What is the pathophysiology and presentation of Urge Incontinence?", a: "Pathophysiology: **detrusor muscle overactivity** (involuntary contractions). Presentation: sudden, overwhelming urge to urinate, followed by immediate leakage, often with frequency and nocturia." },
      { q: "What is the first-line treatment for urge incontinence, and what pharmacotherapy options exist?", a: "First-line: **bladder training** and pelvic floor muscle exercises. Pharmacotherapy: **antimuscarinics** (oxybutynin, tolterodine - Beers caution due to anticholinergic side effects) or beta-3 agonists (**mirabegron** - preferred in elderly)." },
      { q: "What is the pathophysiology and presentation of Stress Incontinence?", a: "Pathophysiology: **urethral hypermobility** or intrinsic sphincter deficiency. Presentation: leakage of small amounts of urine during activities that increase intra-abdominal pressure (coughing, sneezing, laughing, lifting)." },
      { q: "What is the first-line treatment for stress incontinence?", a: "**Pelvic floor muscle training (Kegel exercises)**, biofeedback, and lifestyle modifications (weight loss, smoking cessation). Surgical options include a midurethral sling." },
      { q: "What is the pathophysiology and presentation of Overflow Incontinence?", a: "Pathophysiology: **detrusor underactivity** (neurogenic bladder) or **bladder outlet obstruction** (e.g., BPH, stricture). Presentation: constant dribbling, weak stream, incomplete emptying, and hesitancy." },
      { q: "What diagnostic parameter confirms overflow incontinence, and what is its threshold?", a: "An elevated **Post-Void Residual (PVR) volume**, typically defined as **$> 200\\\\text{ mL}$** (normal is $< 50\\\\text{ mL}$)." },
      { q: "How is overflow incontinence managed based on the underlying cause?", a: "If obstruction: relieve obstruction (e.g., alpha-blockers or surgery for BPH). If detrusor underactivity: **clean intermittent catheterization** is preferred. Cholinergic agonists (bethanechol) are rarely used." },
      { q: "Define Functional Incontinence and provide examples of its causes.", a: "Incontinence due to **physical or cognitive barriers** that prevent the patient from reaching the toilet in time, despite a normal urinary tract. Causes: severe osteoarthritis, stroke, dementia, or physical restraints." },
      { q: "State the DIAPPERS mnemonic used to identify reversible causes of urinary incontinence.", a: "<b>D</b>elirium, <b>I</b>nfection, <b>A</b>trophic vaginitis, <b>P</b>harmaceuticals, <b>P</b>sychological, <b>E</b>xcess urine output, <b>R</b>estricted mobility, <b>S</b>tool impaction." },
      { q: "How do loop diuretics contribute to urinary incontinence in the elderly?", a: "They cause rapid, large-volume diuresis, leading to **detrusor muscle overload** and urgency, which exceeds the patient's mobility limits." },
      { q: "Why are antimuscarinic drugs used with extreme caution in older adults for urge incontinence?", a: "They have systemic **anticholinergic side effects**, increasing the risk of dry mouth, constipation, blurred vision, urinary retention, cognitive decline, and falls." },
      { q: "What is the role of a pessary in the management of urinary incontinence?", a: "A vaginal device used in females with pelvic organ prolapse to support the bladder neck and reduce **stress urinary incontinence**." },
      { q: "How does stool impaction cause urinary incontinence?", a: "The large mass of stool in the rectum mechanically compresses the bladder neck, leading to **bladder outlet obstruction and overflow incontinence**." },
      { q: "What is the role of scheduled toileting in functional incontinence?", a: "A caregiver takes the patient to the toilet at set intervals (e.g., every 2 hours), minimizing episodes of leakage due to immobility or cognitive impairment." },
      { q: "How does estrogen deficiency contribute to urinary incontinence in postmenopausal females?", a: "Causes **atrophy of the urethral and vaginal epithelium**, reducing urethral closure pressure and predisposing to stress and urge incontinence." },
      { q: "What is the clinical significance of a positive urine culture in an asymptomatic elderly patient with chronic incontinence?", a: "It represents **Asymptomatic Bacteriuria** and should **not** be treated with antibiotics. Treatment does not improve incontinence and increases drug resistance." },
      { q: "Contrast the bladder capacity changes in normal aging vs. urge incontinence.", a: "Normal aging decreases bladder capacity slightly, but in **urge incontinence (detrusor overactivity)**, the capacity is functionally reduced due to premature contractions." }
    ]
  },
  {
    section: 'Geriatrics',
    topic: 'Immobility & pressure ulcers — staging, prevention, management',
    icon: 'bed',
    cards: [
      { q: "Describe the clinical features of a Stage 1 pressure injury.", a: "**Intact skin** with **non-blanchable erythema** of a localized area, usually over a bony prominence. (In dark skin, it may present with persistent red/blue/purple discoloration)." },
      { q: "Describe the clinical features of a Stage 2 pressure injury.", a: "**Partial-thickness skin loss** with exposed dermis. The wound bed is viable, pink or red, moist, and may present as an intact or ruptured **serum-filled blister**." },
      { q: "Describe the clinical features of a Stage 3 pressure injury.", a: "**Full-thickness loss of skin** where **adipose (fat) is visible** in the ulcer, and granulation tissue and epibole (rolled wound edges) are often present. Bone, tendon, and muscle are **not** exposed." },
      { q: "Describe the clinical features of a Stage 4 pressure injury.", a: "**Full-thickness skin and tissue loss** with **exposed or directly palpable fascia, muscle, tendon, ligament, cartilage, or bone**." },
      { q: "What defines an Unstageable pressure injury?", a: "**Full-thickness skin and tissue loss** in which the extent of tissue damage within the ulcer cannot be confirmed because it is **obscured by slough or eschar**." },
      { q: "What is a Deep Tissue Pressure Injury?", a: "Intact or non-intact skin with localized area of persistent **non-blanchable deep red, maroon, or purple discoloration**, or epidermal separation revealing a dark wound bed, indicating deep tissue damage." },
      { q: "What is the primary pathophysiology behind the development of a pressure ulcer?", a: "Prolonged **capillary occlusion** by external pressure (exceeding arteriolar pressure of 32 mmHg) leading to ischemia, tissue hypoxia, necrosis, and ulceration." },
      { q: "What are the two most critical mechanical factors that contribute to pressure ulcers besides pressure?", a: "1) **Friction:** mechanical forces rubbing the skin. 2) **Shear:** sliding force generated when the head of the bed is elevated, stretching and tearing subcutaneous vessels." },
      { q: "What is the standard turning schedule recommended to prevent pressure ulcers in bedridden patients?", a: "Repositioning the patient **at least every 2 hours** in bed, and every 15 minutes when sitting in a chair." },
      { q: "What scale is most commonly used in clinical practice to assess pressure ulcer risk?", a: "The **Braden Scale**, which scores sensory perception, moisture, activity, mobility, nutrition, and friction/shear. Lower scores indicate higher risk." },
      { q: "How should a dry, intact eschar on the heel of an older adult be managed?", a: "It should **not** be debrided. Intact, dry, stable eschars on heels serve as a natural barrier and should be left alone unless signs of infection develop." },
      { q: "When should systemic antibiotics be used for a pressure ulcer?", a: "Only when there is clinical evidence of **spreading cellulitis, osteomyelitis, or bacteremia**. Topical antibiotics are generally avoided." },
      { q: "What nutritional parameter is critical for wound healing in pressure ulcers?", a: "Adequate **protein and calorie intake**, along with hydration. Zinc and Vitamin C supplementation may be considered if a deficiency is suspected." },
      { q: "Name three systemic complications of chronic immobility in the elderly.", a: "1) Deep Vein Thrombosis (DVT). 2) Atelectasis/pneumonia. 3) Joint contractures." },
      { q: "What is debridement, and what are its different types?", a: "The removal of necrotic tissue. Types: **surgical/sharp** (fastest, preferred for infection), **enzymatic** (chemical ointments), **autolytic** (moisture-retaining dressings), and **mechanical**." },
      { q: "How does fecal/urinary incontinence contribute to pressure ulcer risk?", a: "Causes **moisture-associated skin damage (maceration)**, which weakens the epidermal barrier and increases vulnerability to friction and pressure." },
      { q: "What type of mattress is recommended for patients at high risk for pressure ulcers?", a: "A **pressure-redistributing surface** (such as high-specification foam, static air, gel, or alternating-pressure mattresses)." }
    ]
  },
  {
    section: 'Geriatrics',
    topic: 'Malnutrition & unintentional weight loss',
    icon: 'utensils',
    cards: [
      { q: "What defines clinically significant unintentional weight loss in the elderly?", a: "A loss of <b>$> 5\\%$</b> of baseline body weight in **6 months**, or <b>$> 10\\%$</b> in **12 months**." },
      { q: "State the \"9 Ds\" mnemonic used to identify causes of weight loss in the elderly.", a: "<b>D</b>ementia, <b>D</b>ysphagia, <b>D</b>ysgeusia, <b>D</b>entition, <b>D</b>iarrhea, <b>D</b>epression, <b>D</b>isease (chronic), <b>D</b>rugs, <b>D</b>ysfunction (physical)." },
      { q: "How is albumin and prealbumin interpreted in the nutritional assessment of an older adult?", a: "They are **poor markers of nutritional status** because their synthesis is suppressed by inflammation (acute phase reactants). They reflect **disease severity** rather than protein intake." },
      { q: "What is the Mini Nutritional Assessment (MNA)?", a: "A validated screening tool for older adults that evaluates food intake, weight loss, mobility, psychological stress, neuropsychological problems, and BMI." },
      { q: "What is the primary intervention for a patient diagnosed with dysphagia?", a: "Perform a **formal swallowing evaluation** (speech therapy) and modify food texture (e.g., pureed foods, thickened liquids)." },
      { q: "Why are appetite stimulants (e.g., megestrol acetate, dronabinol) generally avoided in geriatric weight loss?", a: "They have **minimal efficacy** in increasing lean body mass and carry significant risks (megestrol increases **thrombosis** and mortality; dronabinol causes **confusion**)." },
      { q: "What is the clinical recommendation regarding tube feeding (PEG) in patients with advanced dementia?", a: "PEG tubes are **not recommended**; they do not prolong life, prevent aspiration pneumonia, improve comfort, or heal pressure ulcers. **Careful hand-feeding** is preferred." },
      { q: "How does sarcopenia differ from cachexia?", a: "<b>Sarcopenia:</b> age-related loss of muscle mass and function. <b>Cachexia:</b> cytokine-mediated inflammatory state causing wasting of both fat and muscle, driven by severe disease (e.g., cancer, end-stage heart failure)." },
      { q: "What is the first step in managing an older patient with weight loss due to poor dentition?", a: "Referral to a **dentist** for denture adjustment or repair, and temporary modification of food consistency." },
      { q: "Name three drugs from the Beers Criteria that can cause anorexia or weight loss in the elderly.", a: "1) Digoxin (causes anorexia). 2) SSRIs (can suppress appetite). 3) Donepezil (GI side effects, nausea)." },
      { q: "What is the role of depression in geriatric weight loss, and how should it be screened?", a: "Depression is a major cause of anorexia in the elderly. Screen using the **Geriatric Depression Scale (GDS)**." },
      { q: "How does age-related decline in taste and smell (dysgeusia/anosmia) affect nutrition?", a: "Decreases the enjoyment of food, leading to reduced intake. Can be managed by adding spices and flavor enhancers (excluding excess sodium)." },
      { q: "What is the significance of 'early satiety' in the workup of older adults with weight loss?", a: "Can indicate delayed gastric emptying or an underlying gastrointestinal malignancy, warranting diagnostic workup (e.g., endoscopy)." },
      { q: "Why is metabolic screening (TSH) included in the initial lab workup for unintentional weight loss?", a: "To rule out **apathetic hyperthyroidism**, which presents in the elderly as weight loss and depression without the classic hyperadrenergic signs." },
      { q: "What is the preferred approach to daily calorie intake optimization in a malnourished older adult?", a: "Offering **small, frequent meals** (5-6 times a day) and providing **nutrient-dense snacks** rather than trying to increase large meal sizes." },
      { q: "How does caregiver dependency affect nutritional status?", a: "If the caregiver is overburdened or has cognitive decline, they may fail to buy food or prepare meals, leading to patient neglect and malnutrition." },
      { q: "What is the impact of chronic kidney disease on nutritional status in the elderly?", a: "Uremia induces anorexia, dysgeusia, and nausea, worsening malnutrition." }
    ]
  },
  {
    section: 'Geriatrics',
    topic: 'Polypharmacy & Beers Criteria — high-risk drug classes in elderly',
    icon: 'pill',
    cards: [
      { q: "Define Polypharmacy and state its clinical consequences.", a: "The concomitant use of <b>$\\\\ge 5$ medications</b>. Consequences include increased risk of adverse drug events, drug-drug interactions, cognitive decline, falls, and non-adherence." },
      { q: "Explain the concept of a 'prescribing cascade.'", a: "Occurs when an **adverse drug reaction** is misinterpreted as a **new medical condition**, leading to the prescription of a new drug to treat it, exposing the patient to further toxicity." },
      { q: "Why are first-generation antihistamines (e.g., diphenhydramine) listed on the Beers Criteria?", a: "They are **highly anticholinergic**, which increases the risk of confusion, delirium, dry mouth, constipation, urinary retention, blurred vision, and falls." },
      { q: "What is the Beers Criteria recommendation regarding benzodiazepines in the elderly, and what are the risks?", a: "**Avoid all benzodiazepines** (short, intermediate, and long-acting). Risks include cognitive impairment, delirium, motor ataxia, falls, fractures, and motor vehicle accidents." },
      { q: "Why is the use of NSAIDs (e.g., indomethacin, ketorolac) chronically avoided in the elderly?", a: "Due to high risk of **gastrointestinal bleeding**, **acute kidney injury**, and fluid retention which can **exacerbate heart failure**." },
      { q: "Why are skeletal muscle relaxants (e.g., cyclobenzaprine, carisoprodol) avoided in older adults?", a: "They are poorly tolerated due to **sedation** and significant **anticholinergic side effects**, increasing fall risk." },
      { q: "What is the Beers Criteria warning for atypical antipsychotics in patients with dementia?", a: "**Avoid** using them for dementia-related behavioral symptoms due to an **increased risk of stroke and all-cause mortality**." },
      { q: "Why is the sulfonylurea Glyburide contraindicated in older adults?", a: "It has active metabolites and a long half-life, causing a high risk of **severe, prolonged hypoglycemia**." },
      { q: "What class of antihypertensives is avoided as first-line treatment for hypertension in the elderly due to orthostatic risk?", a: "<b>Alpha-1 blockers</b> (doxazosin, prazosin, terazosin) due to a high risk of **first-dose syncope and orthostatic hypotension**." },
      { q: "Explain the risk of combining an SSRI/SNRI with tramadol in the elderly.", a: "Increases the risk of **serotonin syndrome** and causes **hyponatremia** (SIADH)." },
      { q: "What is the Beers recommendation for Proton Pump Inhibitors (PPIs) regarding duration of use?", a: "Avoid scheduled use for **$> 8$ weeks** unless high risk (severe esophagitis, chronic NSAID use), due to risks of **C. difficile infection**, **osteoporosis/fractures**, and B12 deficiency." },
      { q: "Why is Digoxin avoided as first-line therapy for heart failure or atrial fibrillation in the elderly?", a: "Decreased renal clearance increases the risk of toxicity; when used, doses should not exceed **$0.125\\\\text{ mg/day}$**." },
      { q: "What is the Beers Criteria recommendation for Nitrofurantoin in older adults?", a: "Avoid long-term suppression; avoid in patients with a **$\\\\text{GFR} < 30\\\\text{ mL/min}$** due to decreased efficacy and risk of pulmonary/hepatic toxicity." },
      { q: "Explain the drug-drug interaction risk of combining Spironolactone ($> 25\\\\text{ mg/day}$) with an ACE inhibitor in CKD.", a: "Significantly increases the risk of severe **hyperkalemia**." },
      { q: "Why are TCAs (e.g., amitriptyline) avoided in older adults?", a: "They are highly sedative, cause orthostatic hypotension, and have **strong anticholinergic properties**." },
      { q: "What is the Beers Criteria position on using sliding-scale insulin in the elderly?", a: "**Avoid sliding-scale regimens** that contain only short/rapid-acting insulin without basal insulin, due to a high risk of hypoglycemia without improving glycemic control." },
      { q: "Define 'deprescribing' in geriatric practice.", a: "The systematic process of identifying and discontinuing medications where the **harm outweighs the benefit** in the context of the patient's goals of care." }
    ]
  },
  {
    section: 'Geriatrics',
    topic: 'Cognitive disorders — Alzheimer\'s, vascular, Lewy body, frontotemporal dementia, MCI',
    icon: 'brain',
    cards: [
      { q: "Define Mild Cognitive Impairment (MCI) and contrast it with dementia.", a: "<b>MCI:</b> objective cognitive impairment in one or more domains, but **functional independence (ADLs/iADLs) is preserved**. <b>Dementia:</b> cognitive decline that **significantly interferes with daily functioning**." },
      { q: "What is the typical presentation and pathology of Alzheimer's Disease?", a: "Presentation: progressive, early short-term memory loss, followed by language and visuospatial deficits. Pathology: **extracellular beta-amyloid plaques** and **intracellular tau neurofibrillary tangles**." },
      { q: "What classes of medications are used to treat Alzheimer's disease, and what are examples?", a: "1) **Cholinesterase inhibitors** (donepezil, galantamine, rivastigmine). 2) **NMDA receptor antagonists** (memantine)." },
      { q: "What is the clinical presentation and course of Vascular Dementia?", a: "Presentation: **step-wise, abrupt cognitive decline** associated with focal neurological deficits. Course: correlates with recurrent cerebrovascular events (strokes/TIAs)." },
      { q: "What is the clinical triad that characterizes Dementia with Lewy Bodies (DLB)?", a: "1) **Cognitive fluctuations** (variable attention/alertness). 2) **Recurrent visual hallucinations** (typically detailed, well-formed). 3) **Spontaneous parkinsonism** (rigidity, bradykinesia)." },
      { q: "What is the Beers Criteria warning regarding antipsychotic use in Dementia with Lewy Bodies?", a: "These patients have **extreme sensitivity to neuroleptics**; administration can cause severe, irreversible parkinsonism, somnolence, or even death." },
      { q: "Contrast the presentation of Frontotemporal Dementia (FTD) with Alzheimer's disease.", a: "<b>FTD:</b> presents at a younger age (50-60s) with early, prominent **changes in personality, behavior (disinhibition)**, or language, with **memory preserved** early on. <b>Alzheimer's:</b> presents with memory loss first." },
      { q: "What is the clinical triad of Normal Pressure Hydrocephalus (NPH)? Mnemonic included.", a: "Triad: **gait instability** (magnetic/apraxic), **cognitive decline**, and **urinary urgency/incontinence**. Mnemonic: **\"Wet, Wacky, and Wobbly\"**." },
      { q: "How is Normal Pressure Hydrocephalus diagnosed and treated?", a: "Diagnosis: wide ventricles on MRI out of proportion to sulcal atrophy; confirmed by improvement in gait after **large-volume lumbar puncture (30-50 mL)**. Treatment: **ventriculoperitoneal (VP) shunt**." },
      { q: "What screening tests are recommended for the initial evaluation of suspected cognitive decline?", a: "Cognitive screens (e.g., **MMSE**, **MoCA**, or **Mini-Cog**) and laboratory tests to rule out reversible causes (**TSH, Vitamin B12**, BMP, CBC, and syphilis serology in select cases)." },
      { q: "Explain the pathologic inclusion found in Frontotemporal Dementia.", a: "Inclusions containing **hyperphosphorylated tau protein** (Pick bodies) or **TDP-43**." },
      { q: "What is the pathology of Dementia with Lewy Bodies?", a: "Intracellular aggregates of **alpha-synuclein** (Lewy bodies) located in the cerebral cortex and subcortical nuclei." },
      { q: "Describe the 'Mini-Cog' screening test.", a: "Consists of a **3-word recall** (1 point per word) and a **clock-drawing test** (2 points for normal, 0 for abnormal). A score of 0-2 suggests dementia; 3-5 is low likelihood." },
      { q: "How does vascular risk factor management impact vascular dementia?", a: "Aggressive control of hypertension, diabetes, hyperlipidemia, and smoking cessation slows progression by preventing further ischemic strokes." },
      { q: "Explain the mechanism of action of Memantine.", a: "An **NMDA receptor antagonist** that blocks pathological glutamate excitotoxicity, protecting neurons from calcium-induced apoptosis." },
      { q: "How do cholinesterase inhibitors affect heart rate, and what is a potential side effect?", a: "They increase vagal tone, which can cause **bradycardia** and syncope. Contraindicated in patients with sick sinus syndrome or severe conduction blocks." },
      { q: "Why is a head MRI (or CT) recommended in the workup of dementia?", a: "To rule out structural, treatable causes such as **subdural hematoma**, **brain tumor**, or **normal pressure hydrocephalus**." }
    ]
  },
  {
    section: 'Geriatrics',
    topic: 'Functional assessment — ADLs, iADLs, Comprehensive Geriatric Assessment, frailty scoring',
    icon: 'clipboard-list',
    cards: [
      { q: "Define Activities of Daily Living (ADLs) and state the basic components (Mnemonic).", a: "Basic self-care tasks required to survive in a home. Mnemonic: **DEATH** -- **D**ressing, **E**ating, **A**mbulating, **T**oileting, **H**ygiene (bathing/showering)." },
      { q: "Define Instrumental Activities of Daily Living (iADLs) and state the basic components (Mnemonic).", a: "Complex tasks required to live independently in a community. Mnemonic: **SHAFT** -- **S**hopping, **H**ousekeeping, **A**ccounting (managing money), **F**ood preparation, **T**ransportation/Telephone (also managing medications)." },
      { q: "What is a Comprehensive Geriatric Assessment (CGA)?", a: "A multidimensional, interdisciplinary evaluation of an older adult's medical, cognitive, functional, social, and environmental status to develop an integrated care plan." },
      { q: "What is the clinical definition of 'frailty'?", a: "A biologic syndrome of **decreased physiological reserve** and vulnerability to stressors, resulting from cumulative declines across multiple physiologic systems." },
      { q: "State the 5 criteria of the Fried Frailty Phenotype and how it is scored.", a: "1) Unintentional weight loss. 2) Exhaustion. 3) Weak grip strength. 4) Slow walking speed. 5) Low physical activity. **$\\\\ge 3$** = frail; **1--2** = pre-frail; **0** = robust." },
      { q: "Why is assessing iADLs critical when evaluating a patient with early cognitive decline?", a: "Because **iADLs are lost first** in dementia (cognitive demands are higher than for ADLs); loss of iADLs separates dementia from mild cognitive impairment." },
      { q: "What is the Clinical Frailty Scale (CFS)?", a: "A 9-point visual scale used to assess frailty based on clinical description and level of independence, ranging from 1 (very fit) to 9 (terminally ill)." },
      { q: "What does the 'Get Up and Go' test measure in a functional assessment?", a: "Gait, balance, and transfer ability; useful as a screening tool for mobility limitation and fall risk." },
      { q: "What are the components of the environmental safety assessment in a CGA?", a: "Evaluating the home for lighting, stairs, throw rugs, grab bars, fire alarms, and access to emergency services." },
      { q: "How does functional status predict mortality compared to chronological age?", a: "Functional status (independence in ADLs/iADLs) is a **much stronger predictor** of mortality, hospitalization, and nursing home placement than chronological age." },
      { q: "Explain the term 'social support network' in the context of a CGA.", a: "Evaluating the availability and capability of family, friends, or community resources to assist the patient with daily needs and avoid caregiver burnout." },
      { q: "What is the Katz Index?", a: "A standardized scale used to measure **ADL independence** (scoring 1 for independence, 0 for dependence in bathing, dressing, toileting, transferring, continence, and feeding)." },
      { q: "What is the Lawton Scale?", a: "A standardized scale used to measure **iADL independence** across 8 domains (using phone, shopping, food prep, housekeeping, laundry, transit, medications, finances)." },
      { q: "How is cognitive function formally assessed during a CGA?", a: "Using validated instruments like the **Montreal Cognitive Assessment (MoCA)** or the **Mini-Mental State Examination (MMSE)**." },
      { q: "What is the role of a pharmacist in a Comprehensive Geriatric Assessment?", a: "To perform a medication reconciliation, identify polypharmacy, detect drug-drug interactions, and recommend deprescribing using the Beers Criteria." },
      { q: "How does frailty impact a patient's response to surgery or chemotherapy?", a: "Frail patients have a **significantly higher risk** of post-operative complications, delirium, functional decline, and mortality." }
    ]
  },
  {
    section: 'Geriatrics',
    topic: 'Osteoporosis & fracture prevention — DEXA criteria, bisphosphonates, fall cascade',
    icon: 'bone',
    cards: [
      { q: "At what age is osteoporosis screening with DEXA routinely recommended for females?", a: "Routinely recommended for all females aged <b>$\\\\ge 65$ years old</b> (and younger females with equivalent fracture risk)." },
      { q: "What is the definition of a T-score on a DEXA scan?", a: "A score comparing the patient's bone mineral density to that of a **young, healthy adult female reference population** (expressed in standard deviations)." },
      { q: "What T-score ranges define normal, osteopenia, and osteoporosis?", a: "<b>Normal:</b> T-score $\\\\ge -1.0$. <b>Osteopenia:</b> T-score between $-1.0$ and $-2.5$. <b>Osteoporosis:</b> T-score <b>$\\\\le -2.5$</b>." },
      { q: "What is the definition of severe (established) osteoporosis?", a: "A T-score **$\\\\le -2.5$** plus the presence of **at least one fragility fracture**." },
      { q: "Define a 'fragility fracture.'", a: "A fracture resulting from low-energy trauma, such as a **fall from standing height** or lower, which would not normally cause a bone to break." },
      { q: "What is the FRAX tool, and when is it used?", a: "An online calculator that estimates the **10-year probability of a major osteoporotic fracture** and hip fracture based on clinical risk factors and T-score." },
      { q: "What are the pharmacological treatment thresholds for osteoporosis?", a: "1) T-score **$\\\\le -2.5$**. 2) History of **hip or vertebral fragility fracture**. 3) Osteopenia with a FRAX 10-year risk **$\\\\ge 20\\%$** for major fracture or **$\\\\ge 3\\%$** for hip fracture." },
      { q: "What is the first-line pharmacotherapy for osteoporosis, and what is its mechanism?", a: "<b>Bisphosphonates</b> (e.g., alendronate, risedronate). Mechanism: **bind to hydroxyapatite** and inhibit **osteoclast**-mediated bone resorption." },
      { q: "State the potential severe, rare side effects of long-term bisphosphonate therapy.", a: "<b>Atypical femur fractures</b> and **osteonecrosis of the jaw (ONJ)**." },
      { q: "What is the 'drug holiday' concept in bisphosphonate therapy?", a: "A temporary suspension of bisphosphonate therapy (typically after 3-5 years for zoledronic acid, 5 years for alendronate) to reduce the risk of atypical fractures." },
      { q: "How is Denosumab administered, and what is its mechanism?", a: "Administered as a subcutaneous injection every 6 months. Mechanism: monoclonal antibody against **RANK-L**, preventing osteoclast maturation." },
      { q: "Why is Teriparatide unique compared to bisphosphonates?", a: "Teriparatide is an **anabolic agent** (recombinant PTH analog) that stimulates **osteoblast bone formation** (when given pulsatile), whereas bisphosphonates are antiresorptive." },
      { q: "Explain the 'fall cascade' in relation to osteoporosis.", a: "A patient has osteoporosis. They fall due to gait/balance issues, resulting in a **hip fracture**, which causes **immobility**, leading to **pneumonia or DVT**, resulting in **death**." },
      { q: "What calcium and Vitamin D daily intakes are recommended for older adults with osteoporosis?", a: "Calcium: **$1,200\\\\text{ mg/day}$** (preferably dietary). Vitamin D: **$800\\\\text{--}1,000\\\\text{ IU/day}$**." },
      { q: "Why is a secondary osteoporosis workup recommended for new diagnoses?", a: "To rule out treatable causes like **hyperparathyroidism**, **Vitamin D deficiency**, **Celiac disease**, multiple myeloma, or hyperthyroidism." },
      { q: "How does chronic corticosteroid use affect bone health?", a: "Induces osteoblast apoptosis, decreases calcium absorption, and increases renal calcium excretion, causing **glucocorticoid-induced osteoporosis**." }
    ]
  },
  {
    section: 'Geriatrics',
    topic: 'Sensory changes — presbycusis, presbyopia, functional consequences',
    icon: 'eye',
    cards: [
      { q: "Define Presbycusis and describe its classic clinical features.", a: "Age-related hearing loss. Features: **progressive, bilateral, symmetric high-frequency sensorineural hearing loss**, leading to difficulty understanding speech in noisy environments." },
      { q: "What is the primary pathophysiology of presbycusis?", a: "Loss of **sensory hair cells in the organ of Corti** (specifically at the basal turn of the cochlea) and atrophy of the stria vascularis." },
      { q: "Define Presbyopia and explain its pathophysiology.", a: "Age-related vision loss. Pathophysiology: **decreased lens elasticity** and loss of ciliary muscle power, reducing the eye's ability to focus on near objects." },
      { q: "What is the treatment for presbyopia?", a: "**Converging (convex) lenses** (reading glasses) to help refract light onto the retina." },
      { q: "What are Cataracts, and what are the clinical symptoms?", a: "Painless opacification of the lens. Symptoms: **glare (especially at night)**, halos around lights, decreased color sensitivity, and progressive blurry vision." },
      { q: "Explain the visual loss pattern in Age-Related Macular Degeneration (AMD).", a: "Loss of **central vision** (causing difficulty reading or recognizing faces), with peripheral vision remaining intact." },
      { q: "Contrast Dry and Wet Macular Degeneration.", a: "<b>Dry AMD:</b> slowly progressive, characterized by extracellular lipid deposits called **drusen**. <b>Wet AMD:</b> rapid onset, characterized by **choroidal neovascularization** (vessel leakage; treated with anti-VEGF)." },
      { q: "Describe the vision loss pattern in Glaucoma.", a: "Loss of **peripheral vision** (\"tunnel vision\") due to optic nerve damage, often associated with elevated intraocular pressure." },
      { q: "How does sensory loss (vision/hearing) impact cognitive decline in the elderly?", a: "Sensory impairment is a **strong, independent risk factor for accelerated cognitive decline** due to social isolation and reduced cognitive stimulation." },
      { q: "Why does presbycusis make it harder to hear consonants vs. vowels?", a: "Consonants (e.g., s, t, f, g) are high-frequency sounds, which are lost first in presbycusis, whereas vowels are low-frequency, making speech sound muffled." },
      { q: "How does vision loss increase the risk of hip fractures?", a: "By impairing **depth perception** and contrast sensitivity, making it difficult to detect obstacles and home hazards, leading to falls." },
      { q: "What is the clinical test used to assess wet macular degeneration at home?", a: "The **Amsler grid**, which detects metamorphopsia (straight lines appearing wavy or distorted)." },
      { q: "How does age-related changes in the cornea and pupil affect night driving?", a: "Decreased corneal clarity and **senile miosis** (smaller pupils) reduce the amount of light reaching the retina, making it difficult to see in low-light conditions." },
      { q: "What is the first-line treatment for a patient with severe cataracts impairing ADLs?", a: "**Surgical cataract extraction** with implantation of an intraocular lens." },
      { q: "Describe the functional impact of hearing loss on social relationships.", a: "Leads to **social withdrawal**, depression, and paranoia, as patients struggle to follow conversations and feel excluded." },
      { q: "Explain how age-related decrease in vestibular function contributes to falls.", a: "Impairs the **vestibulo-ocular reflex (VOR)**, leading to instability during head movements and loss of balance." }
    ]
  },
  {
    section: 'Geriatrics',
    topic: 'Cardiovascular in elderly — isolated systolic HTN, orthostatic hypotension, HFpEF',
    icon: 'heart',
    cards: [
      { q: "Define Isolated Systolic Hypertension (ISH) and state its diagnostic criteria.", a: "Hypertension where the systolic blood pressure is elevated but diastolic is normal. Criteria: **systolic BP $\\\\ge 130\\\\text{ mmHg}$** and **diastolic BP $< 80\\\\text{ mmHg}$**." },
      { q: "What is the primary pathophysiology of Isolated Systolic Hypertension in older adults?", a: "Age-related **stiffening of the aorta** and large compliance arteries due to elastin degradation and collagen cross-linking, increasing pulse wave velocity." },
      { q: "What is the preferred first-line pharmacotherapy for isolated systolic hypertension in the elderly?", a: "Low-dose **thiazide-like diuretics** (e.g., chlorthalidone) or long-acting **dihydropyridine calcium channel blockers** (e.g., amlodipine)." },
      { q: "Why must blood pressure not be lowered too aggressively in older adults with ISH?", a: "To prevent **orthostatic hypotension** and maintain adequate perfusion to the brain and kidneys (avoid dropping diastolic BP $< 60\\\\text{ mmHg}$)." },
      { q: "Define Orthostatic Hypotension (OH) and state its diagnostic criteria.", a: "A decrease in SBP of <b>$\\\\ge 20\\\\text{ mmHg}$</b> or DBP of <b>$\\\\ge 10\\\\text{ mmHg}$</b> within 3 minutes of standing." },
      { q: "What are the common causes of orthostatic hypotension in older adults?", a: "Age-related autonomic dysfunction, volume depletion (dehydration), and medications (alpha-1 blockers, diuretics, vasodilators, tricyclic antidepressants)." },
      { q: "What non-pharmacological interventions are used to manage orthostatic hypotension?", a: "Medication review (discontinuing triggers), increasing fluid and salt intake (if not contraindicated), compression stockings, abdominal binders, and rising slowly in stages." },
      { q: "Name two medications used for refractory orthostatic hypotension, and their mechanisms.", a: "1) **Midodrine** (alpha-1 agonist; vasoconstriction). 2) **Fludrocortisone** (aldosterone analog; sodium retention/plasma volume expansion)." },
      { q: "Define Heart Failure with Preserved Ejection Fraction (HFpEF) and its ejection fraction threshold.", a: "Heart failure signs/symptoms with a normal or near-normal left ventricular ejection fraction, defined as **$\\\\ge 50\\%$**." },
      { q: "What is the primary pathophysiology of HFpEF in the elderly?", a: "**Diastolic dysfunction**; the ventricular wall is stiff and non-compliant, leading to impaired relaxation and elevated diastolic filling pressures." },
      { q: "What class of medications has recently been shown to improve outcomes (reducing hospitalization/CV mortality) in patients with HFpEF?", a: "<b>SGLT2 inhibitors</b> (e.g., empagliflozin, dapagliflozin)." },
      { q: "What is the role of diuretics in the management of HFpEF?", a: "Used to manage **fluid overload and congestion**, but must be titrated carefully to avoid hypotension, as these patients are highly preload-dependent." },
      { q: "How does the clinical presentation of myocardial infarction (MI) differ in the elderly?", a: "Frequently **atypical**; older adults may present with dyspnea, fatigue, syncope, or acute confusion, rather than classic crushing chest pain." },
      { q: "Explain the term 'pseudohypertension' in the elderly.", a: "A falsely elevated blood pressure reading caused by **severely calcified arteries** that cannot be compressed by the BP cuff." },
      { q: "What is Osler's maneuver, and when is it used?", a: "Palpating the radial artery when the BP cuff is inflated above systolic pressure. If the artery remains palpable (rigid), it indicates **pseudohypertension**." },
      { q: "Why are older adults highly sensitive to volume depletion during hot weather or illness?", a: "Due to decreased GFR, reduced renal response to ADH, and a **blunted thirst mechanism**." }
    ]
  },
  {
    section: 'Geriatrics',
    topic: 'End-of-life & palliative care — goals of care, advance directives, hospice criteria, pain management',
    icon: 'heart',
    cards: [
      { q: "Define 'goals of care' in end-of-life planning.", a: "A patient-centered discussion to align medical interventions with the patient's values, preferences, and quality-of-life definitions." },
      { q: "Contrast a Living Will with a Durable Power of Attorney for Healthcare.", a: "<b>Living Will:</b> document specifying which medical treatments a patient wants or rejects (e.g., mechanical ventilation, feeding tube). <b>Durable Power of Attorney:</b> designates a specific **healthcare proxy (decision maker)** if the patient loses capacity." },
      { q: "What is a POLST (Physician Orders for Life-Sustaining Treatment) form?", a: "A set of actionable **medical orders** (signed by a physician) based on the patient's preferences, which is legally binding across all care settings (including EMS)." },
      { q: "What are the eligibility criteria for enrolling in hospice care?", a: "A physician certifies that the patient has a terminal illness with a life expectancy of <b>$\\\\le 6$ months</b> if the disease runs its normal course, and the patient **waives curative treatments**." },
      { q: "Where is hospice care typically delivered?", a: "It can be delivered **anywhere the patient resides** (home, assisted living, nursing home) or in a dedicated inpatient hospice facility." },
      { q: "What is the gold standard class of medications for moderate-to-severe pain in palliative care?", a: "<b>Opioids</b> (e.g., morphine, oxycodone, fentanyl)." },
      { q: "What side effect of opioid therapy is permanent (does not develop tolerance) and must be treated proactively?", a: "<b>Opioid-induced constipation</b>. All patients started on scheduled opioids must also start a **stimulant laxative** (e.g., senna) $\\\\pm$ stool softener (docusate)." },
      { q: "How is dyspnea (air hunger) managed in a dying patient on comfort care?", a: "With **low-dose opioids** (e.g., morphine), which reduce the perception of breathlessness and decrease respiratory drive." },
      { q: "What is the 'death rattle,' and how is it managed pharmacologically?", a: "Noisy breathing caused by salivary secretions pooling in the posterior pharynx of an obtunded patient. Managed with **anticholinergics** (e.g., sublingual atropine drops or subcutaneous glycopyrrolate)." },
      { q: "What is palliative sedation?", a: "The supervised use of sedative medications (e.g., midazolam) to reduce consciousness to control refractory, intolerable symptoms at the end of life." },
      { q: "Is it ethical to withdraw mechanical ventilation if it results in the patient's death?", a: "<b>Yes</b>. Withdrawing life-sustaining treatment at the request of a patient or proxy is ethically and legally permissible, as it allows the underlying disease to run its course." },
      { q: "Explain the 'double effect' principle in palliative care.", a: "An action (e.g., giving morphine for pain) is ethical even if it carries a foreseeable secondary risk (e.g., respiratory depression), provided the **intent is solely to relieve pain**." },
      { q: "What is the criteria for transitioning from palliative care to hospice?", a: "Palliative care can be given alongside curative therapy at any stage of disease, whereas **hospice** requires a prognosis of $\\\\le 6$ months and cessation of curative intent." },
      { q: "How should dry mouth (xerostomia) be managed in a terminally ill patient?", a: "Frequent ice chips, oral swabs, artificial saliva, and keeping lips moist with petroleum jelly, rather than IV fluids which can cause fluid overload." },
      { q: "Why are bulk-forming laxatives (e.g., psyllium) avoided for opioid-induced constipation in palliative care?", a: "They require high fluid intake to work; in debilitated patients, they can cause **bowel obstruction**." },
      { q: "What is the role of a healthcare proxy when a patient has active capacity?", a: "The proxy has **no authority**; the patient retains complete autonomy and makes all decisions as long as they have decision-making capacity." }
    ]
  },
  {
    section: 'Geriatrics',
    topic: 'Elder abuse — types, red flags, mandatory reporting',
    icon: 'shield-alert',
    cards: [
      { q: "List the six primary types of elder abuse.", a: "1) Physical abuse. 2) Sexual abuse. 3) Emotional/psychological abuse. 4) Neglect (caregiver failure). 5) Financial exploitation. 6) Self-neglect." },
      { q: "What is the most common type of elder abuse?", a: "<b>Neglect</b> (caregiver failure to provide essential care, food, shelter, hygiene, or medical care)." },
      { q: "State three clinical red flags for physical abuse in an older adult.", a: "1) Bruises in different stages of healing, especially on the upper arms or trunk. 2) Unexplained fractures. 3) Burns or restraint marks." },
      { q: "State three clinical red flags for caregiver neglect.", a: "1) Poor hygiene or soiled clothing. 2) Untreated medical conditions (e.g., missing medications). 3) Multiple Stage 3/4 pressure ulcers without a care plan." },
      { q: "What behavior by a caregiver during an interview should raise suspicion for elder abuse?", a: "The caregiver **refusing to leave the patient alone** or insisting on answering all questions on behalf of the patient." },
      { q: "What is financial exploitation, and what are its signs?", a: "The unauthorized or improper use of an older adult's funds, property, or assets. Signs include sudden bank withdrawals, changed wills, or unpaid bills." },
      { q: "Are healthcare professionals legally required to report suspected elder abuse?", a: "<b>Yes</b>. In almost all jurisdictions, healthcare professionals are **legally mandated reporters** of suspected elder abuse." },
      { q: "To what agency should suspected elder abuse in the community be reported?", a: "<b>Adult Protective Services (APS)</b>." },
      { q: "What is the immediate management if an older patient is suspected to be in imminent, life-threatening danger at home?", a: "Arrange for **hospitalization** or notify emergency services (911) immediately to remove the patient from the dangerous environment." },
      { q: "Does a clinician need definitive proof of abuse before filing a report?", a: "<b>No</b>. Clinicians only need a **reasonable suspicion** of abuse; the investigation is conducted by APS." },
      { q: "If an older adult has intact cognitive capacity but refuses to allow a report of suspected abuse, what should the clinician do?", a: "The clinician **must still report** the suspected abuse to APS, as mandatory reporting laws override patient consent." },
      { q: "What is self-neglect, and how is it managed?", a: "When an older adult cannot meet their own basic needs (hygiene, nutrition, medical care) due to physical or cognitive decline. Managed by APS and social services." },
      { q: "State a red flag for medication-related elder abuse.", a: "A patient presenting with sedation or toxicity due to **medication over-administration** (used as a chemical restraint), or uncontrolled pain/disease due to **medication theft**." },
      { q: "How does cognitive impairment (dementia) affect a patient's risk for elder abuse?", a: "It **significantly increases the risk** due to dependency on caregivers, impaired memory (unable to report abuse), and potential behavioral challenges." },
      { q: "What is the role of an ombudsman in elder abuse prevention?", a: "A government-appointed advocate who investigates complaints of abuse or poor care specifically in **long-term care facilities (nursing homes)**." },
      { q: "Why is unexplained weight loss or dehydration a red flag for neglect?", a: "It suggests the caregiver is withholding food or water, or failing to assist a dependent patient with feeding." }
    ]
  },
  {
    section: 'Geriatrics',
    topic: 'Social determinants — caregiver burden, housing, nursing home vs community care',
    icon: 'users',
    cards: [
      { q: "Define caregiver burden and state its clinical impact on the caregiver.", a: "The physical, emotional, and financial strain of caring for a disabled older adult. Clinical impact includes high rates of depression, anxiety, insomnia, and increased mortality." },
      { q: "What screening tool is commonly used to assess caregiver burden?", a: "The **Zarit Burden Interview** (a questionnaire assessing the caregiver's perceived strain)." },
      { q: "What is 'respite care,' and why is it recommended?", a: "Temporary institutional or home-based care provided to an older adult to **give the primary caregiver a break**, reducing caregiver burnout." },
      { q: "Contrast the care provided in Assisted Living vs. a Nursing Home (Skilled Nursing Facility).", a: "<b>Assisted Living:</b> provides assistance with iADLs (meals, transit, housekeep) but preserves independence. <b>Nursing Home:</b> provides 24-hour skilled nursing care and assistance with basic ADLs." },
      { q: "What is 'aging in place'?", a: "The ability of an older adult to live in their own home and community safely, independently, and comfortably as they age, using home modifications and community support." },
      { q: "What is the impact of social isolation on mortality in the elderly?", a: "Social isolation is a **strong risk factor** for all-cause mortality, with an impact comparable to smoking, obesity, or physical inactivity." },
      { q: "What is a Continuing Care Retirement Community (CCRC)?", a: "A housing facility that offers a tier of care options (independent living, assisted living, and skilled nursing) on a single campus, allowing patients to stay as their needs increase." },
      { q: "What is the primary funding source for long-term custodial care in a nursing home?", a: "<b>Medicaid</b> (once the patient meets financial eligibility limits via asset spend-down). Medicare **does not** cover long-term custodial care." },
      { q: "How does Medicare fund Skilled Nursing Facility (SNF) care?", a: "Medicare Part A covers up to **100 days** of SNF care per benefit period, but **only** if it follows a qualifying hospital stay of $\\\\text{at least } 3$ days for rehabilitation." },
      { q: "What is the 'Long-Term Care Ombudsman' program?", a: "A federally mandated advocacy program that investigates and resolves complaints made by or on behalf of residents in nursing homes and assisted living facilities." },
      { q: "How does housing quality (e.g., poor heating, mold) impact health in the elderly?", a: "Increases the risk of hypothermia, respiratory infections (COPD/asthma exacerbations), and falls." },
      { q: "What is the role of Adult Day Care programs?", a: "Provide social activities, meals, and basic health monitoring during the day, offering structured community care for the patient and respite for the caregiver." },
      { q: "Name a tool used to screen for social isolation in clinical practice.", a: "The **Berkman-Syme Social Network Index** or the UCLA Loneliness Scale." },
      { q: "Why is assessing transportation access critical in a geriatric social history?", a: "Lack of transportation leads to **missed medical appointments**, inability to get medications/groceries, and worsens social isolation." },
      { q: "What is the 'Medicaid Waiver' program (HCBS)?", a: "Home and Community-Based Services waivers that allow states to fund in-home care for low-income seniors to **prevent nursing home placement**." },
      { q: "How does caregiver burnout affect the patient's care?", a: "Burned-out caregivers are at high risk for neglecting the patient, leading to medication errors, poor hygiene, malnutrition, and eventual emergency hospitalization." }
    ]
  }
];

const lineSeparator = htmlContent.includes('\r\n') ? '\r\n' : '\n';
const lines = htmlContent.split(/\r?\n/);
let targetLineIndex = -1;
for (let i = 0; i < lines.length; i++) {
  if (lines[i].includes("'usmle1': []")) {
    targetLineIndex = i;
    break;
  }
}

if (targetLineIndex === -1) {
  console.error("ERROR: Could not find line containing 'usmle1': []");
  process.exit(1);
}

const lineBefore = lines[targetLineIndex - 1];
if (!lineBefore.includes('}]') && !lineBefore.includes('},]')) {
  console.error("ERROR: Unexpected line before 'usmle1': []: " + lineBefore);
  process.exit(1);
}

console.log("Found target end of year4 array at line " + targetLineIndex + ": " + lineBefore);

// Keep a backup of the original html file
fs.writeFileSync(backupPath, htmlContent, 'utf8');
console.log('Created backup of flash-cards.html at flash-cards.html.bak2');

// Serialize newTopics into properly escaped JS object literals
function serializeCard(card) {
  const q = card.q.replace(/\\/g, '\\\\').replace(/'/g, "\\'");
  const a = card.a.replace(/\\/g, '\\\\').replace(/'/g, "\\'");
  return `{ q: '${q}', a: '${a}' }`;
}

const formattedTopicsList = newTopics.map(topic => {
  const cardsStr = topic.cards.map(c => '          ' + serializeCard(c)).join(',\n');
  const topicName = topic.topic.replace(/\\/g, '\\\\').replace(/'/g, "\\'");
  return `{\n          section: '${topic.section}',\n          topic: '${topicName}',\n          icon: '${topic.icon}',\n          cards: [\n${cardsStr}\n          ]\n        }`;
});

const replacement = '        },\n        ' + formattedTopicsList.join(',\n        ') + '],';

lines[targetLineIndex - 1] = replacement;
const updatedHtmlContent = lines.join(lineSeparator);

// 3. Validate the syntax of the generated HTML content
const match = updatedHtmlContent.match(/const\s+FLASH_DATA\s*=\s*([\s\S]*?});/);
if (!match) {
  console.error('ERROR: Could not find FLASH_DATA definition in the updated HTML!');
  process.exit(1);
}

try {
  const evalCode = match[0].replace('const FLASH_DATA =', 'global.FLASH_DATA =');
  eval(evalCode);
  console.log('FLASH_DATA syntax validation: SUCCESS!');
  
  if (global.FLASH_DATA && global.FLASH_DATA.year4) {
    const totalTopics = global.FLASH_DATA.year4.length;
    console.log(`Validation details: Total topics in year4 is now ${totalTopics}.`);
    
    // Print details of the last 15 topics
    const last15 = global.FLASH_DATA.year4.slice(-15);
    last15.forEach((t, idx) => {
      console.log(`  Inserted Topic ${idx + 1}: [${t.section}] "${t.topic}" -> ${t.cards.length} cards`);
    });
  } else {
    console.error('ERROR: global.FLASH_DATA is undefined or lacks year4!');
    process.exit(1);
  }
} catch (e) {
  console.error('ERROR: FLASH_DATA validation failed! Syntax error present in generated code.');
  console.error(e.message);
  process.exit(1);
}

// 4. Overwrite flash-cards.html if validation succeeds
fs.writeFileSync(htmlPath, updatedHtmlContent, 'utf8');
console.log('Successfully updated flash-cards.html!');
