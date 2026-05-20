import json
import random

topic_slug = 'geri-incontinence'

templates = [
    # ─── TEMPLATE 1: URGE INCONTINENCE (DETRUSOR OVERACTIVITY) ───
    {
        "q": "A {age}-old {gender} presents to the clinic with a {duration}-month history of urinary frequency, nocturia, and an intense, sudden desire to urinate that is frequently followed by involuntary leakage of large volumes of urine before reaching the bathroom. The patient reports having to wear {pads} protective pads daily due to these episodes. {pronoun_cap} denies any leakage with coughing, laughing, or standing up. Physical and neurological examinations are unremarkable, and a urinalysis shows no signs of infection. Post-void residual (PVR) volume is normal at **{pvr} mL**. What is the most likely diagnosis, and what is the recommended first-line management?",
        "options": [
            "Urge Incontinence (Detrusor Overactivity); first-line treatment is non-pharmacological behavioral therapy (bladder training, pelvic floor muscle training) and fluid modification",
            "Stress Incontinence (Urethral Hypermobility); first-line treatment is surgical insertion of a midurethral sling",
            "Overflow Incontinence (Detrusor Underactivity); first-line treatment is clean intermittent catheterization",
            "Functional Incontinence; first-line treatment is scheduled toileting and a bedside commode",
            "Urge Incontinence; first-line treatment is immediate initiation of high-dose oral oxybutynin"
        ],
        "answer": 0,
        "exp": "This patient's clinical presentation—sudden, intense urges to urinate followed immediately by involuntary loss of large volumes of urine, along with nocturia and urinary frequency—is classic for **Urge Urinary Incontinence (UUI)**, which is physiologically caused by **detrusor muscle overactivity** (uninhibited bladder contractions during the filling phase). A normal post-void residual (PVR) volume (typically <50-100 mL, here {pvr} mL) rules out overflow/retention patterns. For all forms of chronic urinary incontinence, the recommended **first-line management** is **non-pharmacological behavioral therapy**, which includes: (1) **bladder training** (timed voiding with progressive increases in intervals), (2) **pelvic floor muscle training** (Kegel exercises) to facilitate detrusor inhibition, (3) **dietary/fluid modifications** (limiting bladder irritants like caffeine, alcohol, and carbonated beverages, and avoiding excessive fluid intake, especially before bedtime), and (4) weight loss if applicable. Pharmacotherapy (e.g., antimuscarinics or beta-3 agonists) is reserved as a second-line option."
    },

    # ─── TEMPLATE 2: STRESS INCONTINENCE (SPHINCTER WEAKNESS / HYPERMOBILITY) ───
    {
        "q": "A {age}-old {gender} presents with a {duration}-month history of involuntary urinary leakage. The patient reports that the leakage occurs exclusively in small amounts when **coughing, sneezing, laughing, lifting heavy grocery bags, or rising from a chair**. {pronoun_cap} denies any sudden, overwhelming urges to void or nocturnal wetting. Neurological exam is normal, and urinalysis is negative. Pelvic examination is notable for {pelvic_finding}. Post-void residual (PVR) volume is **{pvr} mL** (normal). Which of the following is the most likely diagnosis, and what is the initial management of choice?",
        "options": [
            "Stress Urinary Incontinence (SUI) due to urethral hypermobility or intrinsic sphincter deficiency; initial management is pelvic floor muscle training (Kegel exercises)",
            "Urge Urinary Incontinence due to detrusor overactivity; initial management is scheduled oral tolterodine therapy",
            "Overflow Urinary Incontinence due to detrusor underactivity; initial management is indwelling urethral catheterization",
            "Functional Incontinence; initial management is physical therapy for severe osteoarthritis and joint replacement",
            "Stress Urinary Incontinence; initial management is immediate surgical placement of an artificial urinary sphincter"
        ],
        "answer": 0,
        "exp": "This patient is presenting with **Stress Urinary Incontinence (SUI)**, which is characterized by involuntary leakage of small amounts of urine associated with **activities that increase intra-abdominal pressure** (such as coughing, sneezing, laughing, lifting, or sudden positional changes) in the absence of detrusor contractions. SUI is caused by **urethral hypermobility** (weakness of the pelvic floor muscles and vaginal connective tissue support, often associated with multiple vaginal deliveries or pelvic surgery) or **intrinsic sphincter deficiency** (weakness of the urethral sphincter itself, sometimes exacerbated by atrophic urethritis). A normal PVR of {pvr} mL confirms the absence of urinary retention. The **initial management of choice** for SUI is **pelvic floor muscle training (Kegel exercises)** to strengthen the levator ani muscle complex, which can be augmented by biofeedback, a vaginal pessary, or urethral inserts. If conservative measures fail, surgical intervention (e.g., **midurethral sling**) is highly effective."
    },

    # ─── TEMPLATE 3: OVERFLOW INCONTINENCE (DETRUSOR UNDERACTIVITY / OBSTRUCTION) ───
    {
        "q": "A {age}-old {gender} is evaluated for a progressive, {duration}-month history of urinary problems. The patient reports a weak urinary stream, having to strain to initiate voiding, a feeling of incomplete bladder emptying, and frequent **constant dribbling** of small amounts of urine throughout the day and night. On physical examination, the abdomen is notable for a non-painful, palpable mass in the suprapubic area. Urinalysis shows no active infection. A post-void residual (PVR) volume is measured and found to be **{pvr} mL**. Which of the following is the most likely diagnosis, and what is the primary pathophysiological mechanism?",
        "options": [
            "Overflow Urinary Incontinence; caused by detrusor muscle underactivity (impaired contractility) or bladder outlet obstruction",
            "Urge Urinary Incontinence; caused by hypersensitivity of bladder mucosal nociceptors and detrusor overactivity",
            "Stress Urinary Incontinence; caused by a loss of bladder neck support and urethral hypermobility",
            "Functional Urinary Incontinence; caused by severe cognitive impairment preventing motor planning for voiding",
            "Mixed Urinary Incontinence; caused by coexisting pelvic floor laxity and detrusor-sphincter dyssynergia"
        ],
        "answer": 0,
        "exp": "This patient's clinical presentation—weak stream, hesitancy, straining, sensation of incomplete emptying, constant dribbling, a palpable suprapubic mass (representing a distended bladder), and a significantly elevated post-void residual (PVR) volume of **{pvr} mL** (PVR > 200 mL is diagnostic of urinary retention/overflow)—is diagnostic of **Overflow Urinary Incontinence**. The two primary pathophysiological mechanisms of overflow incontinence are: (1) **detrusor muscle underactivity** (impaired detrusor contractility, often due to autonomic neuropathy as in diabetes, sacral nerve injury, or chronic overdistension), and (2) **bladder outlet obstruction** (commonly caused by benign prostatic hyperplasia [BPH], severe pelvic organ prolapse, urethral stricture, or fecal impaction compressing the urethra). Management must address the underlying cause (e.g., alpha-blockers/surgery for BPH, or clean intermittent catheterization for detrusor underactivity)."
    },

    # ─── TEMPLATE 4: FUNCTIONAL INCONTINENCE ───
    {
        "q": "A {age}-old {gender} with a history of severe, deforming osteoarthritis of both knees and moderate Alzheimer''s dementia resides in an assisted living facility. The facility staff reports that the patient has had {accidents} urinary accidents weekly over the past {duration} months. The staff notes that the patient is fully aware of the need to void and calls for help, but because of **extreme physical slowness in rising, using {possessive} walker, and navigating to the bathroom**, the patient leaks a large volume of urine before reaching the toilet. Urological evaluation reveals normal bladder capacity, no leakage with Valsalva, and a normal post-void residual volume of **{pvr} mL**. Urinalysis is completely negative. Which of the following is the most likely diagnosis, and what is the most appropriate management strategy?",
        "options": [
            "Functional Urinary Incontinence; manage with environmental modifications (bedside commode, clear pathway), scheduled toileting, and physical therapy for mobility",
            "Urge Urinary Incontinence; manage with immediate initiation of long-acting oral oxybutynin (10 mg daily)",
            "Stress Urinary Incontinence; manage with surgical referral for a pubovaginal or midurethral sling",
            "Overflow Urinary Incontinence; manage with indwelling Foley catheter placement and scheduled bladder flushes",
            "Mixed Urinary Incontinence; manage with intravesical botulinum toxin injections and pelvic floor electrostimulation"
        ],
        "answer": 0,
        "exp": "This patient is presenting with **Functional Urinary Incontinence**. Functional incontinence is characterized by involuntary urinary leakage associated with **physical, cognitive, or environmental barriers** that prevent the patient from reaching or using the toilet in a timely manner, despite having a **completely intact and normal urological system** (as evidenced by a normal bladder capacity, no stress leakage, and a normal PVR of {pvr} mL). Contributing factors here include severe osteoarthritic mobility restrictions and cognitive delays. The **most appropriate management strategy** focuses on addressing these external barriers rather than urological drugs. Interventions include: (1) **environmental modifications** (placing a bedside commode close to the bed, ensuring a well-lit, unobstructed pathway to the toilet, and using easy-to-remove clothing like elastic-waist pants), (2) **behavioral strategies** (scheduled or prompted toileting every 2-3 hours), and (3) **physical therapy** to optimize mobility and transfer skills."
    },

    # ─── TEMPLATE 5: MIXED urinary INCONTINENCE ───
    {
        "q": "A {age}-old {gender} presents with a {duration}-month history of daily urinary incontinence. The patient describes two distinct types of leakage episodes: (1) sudden, intense surges of urinary urgency where {pronoun} is unable to reach the bathroom in time, and (2) leakage of small amounts of urine when **coughing, sneezing vigorously, or lifting heavy objects**. The patient finds both types of episodes highly distressing. Physical exam is notable for {pelvic_finding}. Urinalysis is negative, and post-void residual is normal at **{pvr} mL**. What is the most likely diagnosis, and how should management be structured?",
        "options": [
            "Mixed Urinary Incontinence (coexisting urge and stress incontinence); identify and target the most bothersome/predominant symptom first using conservative behavioral measures",
            "Pure Stress Urinary Incontinence; initiate immediate surgical intervention as behavioral therapies are ineffective in combined presentations",
            "Pure Urge Urinary Incontinence; prescribe high-dose oral darifenacin and advise the patient to restrict daily fluid intake to less than 500 mL",
            "Overflow Urinary Incontinence; initiate scheduled clean intermittent catheterization four times daily",
            "Functional Urinary Incontinence; provide a bedside commode and advise the patient to avoid all physical exertion"
        ],
        "answer": 0,
        "exp": "This patient is presenting with **Mixed Urinary Incontinence (MUI)**, which is defined as the co-occurrence of both **Urge Urinary Incontinence** (leakage preceded by sudden urgency) and **Stress Urinary Incontinence** (leakage with increased intra-abdominal pressure like coughing/sneezing). A normal post-void residual of {pvr} mL rules out overflow patterns. When managing Mixed Incontinence, the optimal strategy is to **identify which component (urge or stress) is the most bothersome or predominant for the patient**, and **target that predominant symptom first** using conservative, non-pharmacological behavioral measures (e.g., pelvic floor muscle training, bladder training, and fluid modification), which are highly effective for *both* components. If pharmacological or surgical therapies are added later, they must be tailored sequentially to the unresolved symptoms (e.g., adding a beta-3 agonist for residual urge symptoms, or considering a sling for residual stress leaks)."
    },

    # ─── TEMPLATE 6: REVERSIBLE CAUSES OF INCONTINENCE (DIAPPERS / TOILED) ───
    {
        "q": "A {age}-old {gender} with mild baseline cognitive impairment is admitted to the hospital for {hospital_reason}. On hospital day 3, the patient suddenly develops new-onset urinary incontinence, wetting the bed multiple times. The medical team reviews the patient''s clinical status and medications, which were recently adjusted to include **{culprit_drug}**. A physical examination is notable for {exam_finding}. Urinalysis shows no leukocyte esterase or nitrites. Which of the following frameworks is most useful for evaluating this patient''s acute incontinence, and what is the most likely reversible cause?",
        "options": [
            "The <b>DIAPPERS</b> mnemonic (Delirium, Infection, Atrophic vaginitis, Pharmaceuticals, Psychological, Excess output, Restricted mobility, Stool impaction); the most likely cause is drug-induced incontinence due to {culprit_drug}",
            "The <b>MDS</b> assessment framework; the most likely cause is irreversible age-related detrusor muscle necrosis",
            "The <b>CAM</b> delirium protocol; the most likely cause is an acute ischemic stroke affecting the micturition center in the pons",
            "The <b>CHARDE</b> criteria; the most likely cause is acute bacterial pyelonephritis requiring intravenous meropenem",
            "The <b>Beers Criteria</b>; the most likely cause is permanent spinal cord compression requiring urgent surgical decompression"
        ],
        "answer": 0,
        "exp": "This patient is experiencing **acute, transient urinary incontinence**. In older adults, new-onset incontinence should always prompt an evaluation for **reversible, transient causes** before attributing it to a chronic urological disease. The classic clinical mnemonic for these reversible causes is **DIAPPERS** (or **TOILED**): **D**elirium, **I**nfection (UTI), **A**trophic urethritis/vaginitis, **P**harmaceuticals, **P**sychological disorders (e.g., severe depression), **E**xcessive fluid output (e.g., hyperglycemia, hypercalcemia, congestive heart failure), **R**estricted mobility, and **S**tool impaction. In this patient, the acute onset is directly related to **{culprit_drug}**, which is a **{drug_class}** that causes incontinence by {mechanism}. Discontinuing the offending medication and addressing any other transient factors in the DIAPPERS checklist is the primary management strategy."
    },

    # ─── TEMPLATE 7: PVR MEASUREMENT & CATHETERIZATION DECISIONS ───
    {
        "q": "A {age}-old {gender} with a history of advanced Parkinson''s disease is brought to the clinic due to worsening urinary incontinence characterized by frequent nocturnal bedwetting and constant daytime dribbling. The patient''s daughter notes that the patient has also had {falls} falls this month and is experiencing abdominal discomfort. A bedside bladder scan is performed immediately after the patient voids, demonstrating a post-void residual (PVR) volume of **{pvr} mL**. What is the most appropriate next step in the clinical evaluation and management of this patient?",
        "options": [
            "Obtain a renal ultrasound to evaluate for hydronephrosis, perform a comprehensive review to discontinue anticholinergic/sedative medications, and initiate clean intermittent catheterization",
            "Prescribe oral oxybutynin (5 mg three times daily) to suppress bladder contractions and schedule a follow-up PVR in 6 months",
            "Refer the patient for immediate emergency bilateral nephrostomy tube placement to prevent permanent acute kidney injury",
            "Perform an urgent high-volume lumbar puncture (CSF tap test) to rule out occult normal pressure hydrocephalus",
            "Reassure the patient and family that a post-void residual of {pvr} mL is normal in Parkinson''s disease, and double the dose of carbidopa-levodopa"
        ],
        "answer": 0,
        "exp": "This patient is presenting with signs of **Overflow Urinary Incontinence** secondary to severe urinary retention, as evidenced by a post-void residual (PVR) volume of **{pvr} mL**. In older adults, a PVR **<50 mL** is completely normal; a PVR **<100-200 mL** is generally acceptable; whereas a PVR **>200 mL** is highly abnormal and indicates **urinary retention** (detrusor underactivity or bladder outlet obstruction). When a patient has severe urinary retention ({pvr} mL), they are at high risk for upper urinary tract compression, leading to **hydronephrosis and acute or chronic kidney injury (obstructive uropathy)**. The most appropriate next steps are: (1) **order a renal ultrasound** to check for hydronephrosis/renal injury, (2) **discontinue any offending medications** that impair detrusor contractility (e.g., anticholinergics, tricyclic antidepressants, calcium channel blockers, or antihistamines), and (3) establish bladder drainage, typically via **clean intermittent catheterization (CIC)** or, if not feasible, an indwelling Foley catheter. **Antimuscarinics like oxybutynin are strictly contraindicated** here, as they would further paralyze the detrusor muscle and worsen the retention."
    },

    # ─── TEMPLATE 8: ANTIMUSCARINIC TOXICITY VS MIRABEGRON (BEERS CRITERIA) ───
    {
        "q": "A {age}-old {gender} with mild cognitive impairment and urge urinary incontinence is currently taking **oxybutynin** (a non-selective antimuscarinic) to control bladder urgency. Over the past {duration} weeks, the patient''s family has noticed a significant decline in the patient''s memory, new-onset daytime confusion, severe dry mouth, and worsening constipation. The physician decides to discontinue the oxybutynin. Which of the following is the most appropriate replacement medication to manage this patient''s urge incontinence while avoiding cognitive side effects, and what is its mechanism of action?",
        "options": [
            "Mirabegron; a selective beta-3 adrenergic receptor agonist that relaxes the detrusor muscle during the storage phase without anticholinergic side effects",
            "Tolterodine; a highly selective M3 muscarinic receptor antagonist that is actively excluded from crossing the blood-brain barrier",
            "Bethanechol; a potent muscarinic receptor agonist that stimulates detrusor contractions and enhances salivary secretions",
            "Finasteride; a selective 5-alpha reductase inhibitor that blocks the peripheral conversion of testosterone to dihydrotestosterone",
            "Duloxetine; a dual serotonin and norepinephrine reuptake inhibitor (SNRI) that increases urethral striated sphincter tone"
        ],
        "answer": 0,
        "exp": "This patient is experiencing classic **antimuscarinic (anticholinergic) toxicity** from **oxybutynin**, a drug listed on the Beers Criteria as highly inappropriate for older adults. Antimuscarinics work by blocking M2 and M3 receptors on the detrusor muscle to reduce contractions. However, they also block central cholinergic receptors (especially in patients with pre-existing mild cognitive impairment or dementia), causing **cognitive decline, delirium, and confusion**, alongside peripheral effects like dry mouth, constipation, blurred vision, and urinary retention. To manage urge urinary incontinence without these side effects, **Mirabegron** is the preferred second-line agent. Mirabegron is a **selective beta-3 adrenergic receptor agonist** that binds to beta-3 receptors on the detrusor muscle, stimulating adenylyl cyclase and increasing cAMP, which **relaxes the detrusor muscle during the bladder-filling phase**, increasing bladder capacity. Because it has **no anticholinergic properties**, it does not cause cognitive impairment or dry mouth (though it can cause a mild increase in blood pressure, so BP should be monitored)."
    },

    # ─── TEMPLATE 9: BPH-INDUCED OVERFLOW INCONTINENCE ───
    {
        "q": "A {age}-old {gender} presents to the clinic with a {duration}-year history of progressive urinary hesitancy, straining to void, nocturia up to {nocturia} times per night, and frequent involuntary leakage of urine characterized by a **constant slow dribbling** throughout the day. A digital rectal examination (DRE) reveals a smooth, firm, nontender, symmetrically enlarged prostate estimated at **{prostate_size} grams** with a lost median sulcus. Bladder scan shows a post-void residual (PVR) of **{pvr} mL**. What is the most appropriate initial pharmacological approach to address both the urinary retention and the prostate enlargement?",
        "options": [
            "Initiate a combination of an alpha-1 adrenergic antagonist (e.g., tamsulosin) to rapidly relax prostatic smooth muscle, and a 5-alpha reductase inhibitor (e.g., finasteride) to reduce prostate size over time",
            "Prescribe monotherapy with oral oxybutynin (5 mg twice daily) to suppress the constant detrusor overactivity and dribbling",
            "Initiate high-dose bethanechol therapy (50 mg three times daily) to stimulate detrusor contractions and bypass the obstruction",
            "Initiate immediate, scheduled clean intermittent catheterization twice daily as pharmacological therapy is ineffective for prostatic enlargement",
            "Prescribe low-dose oral furosemide (20 mg daily) to be taken at bedtime to increase nocturnal urine flow rates"
        ],
        "answer": 0,
        "exp": "This patient is presenting with **Overflow Urinary Incontinence** secondary to **bladder outlet obstruction** caused by **Ben benign prostatic hyperplasia (BPH)**. Key diagnostic clues include progressive obstructive symptoms (hesitancy, straining), constant dribbling (overflow), a symmetrically enlarged prostate ({prostate_size} g) on DRE, and an elevated PVR of **{pvr} mL**. The most effective pharmacological approach for moderate-to-severe BPH with urinary retention is **combination therapy**: (1) an **alpha-1 adrenergic antagonist** (such as **tamsulosin**, alfuzosin, or doxazosin) which selectively blocks alpha-1A receptors in the bladder neck and prostatic urethra, relaxing smooth muscle and providing **rapid symptomatic relief** (within days), and (2) a **5-alpha reductase inhibitor** (such as **finasteride** or dutasteride) which blocks the conversion of testosterone to dihydrotestosterone (DHT), the primary mediator of prostate growth. This **reduces prostate size by approximately 20-25% over 6-12 months**, preventing long-term complications like acute urinary retention and the need for surgery (e.g., TURP)."
    },

    # ─── TEMPLATE 10: NEUROGENIC BLADDER (ATONIC VS SPASTIC) ───
    {
        "q": "A {age}-old {gender} with a {duration}-year history of poorly controlled type 2 diabetes mellitus presenting with severe peripheral neuropathy is evaluated for new-onset urinary incontinence. The patient reports that {pronoun} no longer feels the sensation of bladder fullness and frequently leaks large volumes of urine without warning. {possessive_cap} daughter notes that {pronoun} frequently has a distended abdomen. Bladder scan reveals a post-void residual (PVR) of **{pvr} mL**. Urinalysis is negative. Which of the following best describes the pathophysiological basis of this patient''s incontinence, and what is the primary management strategy?",
        "options": [
            "Diabetic cystopathy (neurogenic bladder atony) due to autonomic neuropathy, causing detrusor muscle underactivity and overflow incontinence; manage with scheduled voiding and clean intermittent catheterization",
            "Detrusor sphincter dyssynergia due to an acute spinal cord stroke, causing stress incontinence; manage with immediate surgical sphincterotomy",
            "Detrusor hyperreflexia due to diabetic microvascular cerebral infarcts, causing urge incontinence; manage with high-dose oral tolterodine",
            "Functional incontinence due to diabetic retinopathy and poor vision; manage with a bedside commode and bright environmental lighting",
            "Intrinsic sphincter deficiency due to diabetic muscle wasting, causing stress incontinence; manage with periurethral bulking injections"
        ],
        "answer": 0,
        "exp": "This patient's presentation—loss of the sensation of bladder fullness, chronic painless bladder distension, a very high post-void residual (PVR) volume of **{pvr} mL**, and overflow incontinence in the setting of long-standing diabetes—is a classic case of **diabetic cystopathy**, which is a form of **neurogenic bladder atony**. The pathophysiological basis is **diabetic autonomic neuropathy**, which selectively damages the sensory afferent and motor efferent parasympathetic fibers supplying the bladder. This leads to: (1) a loss of bladder sensation, resulting in infrequent voiding and chronic overdistension, and (2) **detrusor muscle underactivity (atony)**, which prevents complete bladder contraction, causing massive urinary retention and **overflow incontinence**. The primary management strategies are **behavioral and drainage-focused**: (1) **scheduled/timed voiding** (e.g., every 3-4 hours by the clock, rather than waiting for sensory urges), (2) double voiding techniques, and (3) **clean intermittent catheterization (CIC)** to safely empty the bladder and protect the upper urinary tracts from obstructive injury."
    }
]

genders_pool = [
    {"gender": "female", "pronoun": "she", "pronoun_cap": "She", "possessive": "her", "possessive_cap": "Her"},
    {"gender": "male", "pronoun": "he", "pronoun_cap": "He", "possessive": "his", "possessive_cap": "His"},
    {"gender": "woman", "pronoun": "she", "pronoun_cap": "She", "possessive": "her", "possessive_cap": "Her"},
    {"gender": "man", "pronoun": "he", "pronoun_cap": "He", "possessive": "his", "possessive_cap": "His"}
]

mcqs = []
seen_questions = set()
counter = 0

# Target: 400 MCQs
while counter < 400:
    for t_idx, t in enumerate(templates):
        if counter >= 400:
            break
            
        age = random.randint(65, 95)
        gp = random.choice(genders_pool)
        
        # Randomize variables based on template
        duration = random.randint(2, 6)
        
        # Template 1: Urge
        pads = random.randint(2, 5)
        
        # Template 2: Stress pelvic exam finding
        pelvic_finding = random.choice([
            "anterior vaginal wall prolapse (cystocele) and urethral hypermobility during Valsalva maneuver",
            "urethral hypermobility with no significant pelvic organ prolapse",
            "moderate uterine prolapse and thin, pale vaginal mucosa consistent with vulvovaginal atrophy",
            "hypermobile bladder neck with a positive Q-tip test (angle >30 degrees)"
        ])
        
        # Randomize PVRs based on type
        if t_idx in [2, 6, 8, 9]: # Overflow / Retention templates
            pvr = random.randint(250, 650)
        else: # Urge, Stress, Functional, Mixed
            pvr = random.randint(20, 85)
            
        # Template 4: Functional accidents
        accidents = random.randint(3, 7)
        
        # Template 6: DIAPPERS
        hospital_reason = random.choice([
            "a mild community-acquired pneumonia",
            "a chronic heart failure exacerbation",
            "an elective total knee arthroplasty",
            "a mild cellulitis of the left lower extremity"
        ])
        culprit_drug = random.choice([
            "Furosemide (Lasix)", 
            "Diphenhydramine (Benadryl)", 
            "Amitriptyline (Elavil)", 
            "Amlodipine (Norvasc)",
            "Oxybutynin (Ditropan)"
        ])
        if culprit_drug.startswith("Furosemide"):
            drug_class = "potent loop diuretic"
            mechanism = "rapidly increasing bladder filling and causing urinary urgency and flow rates that exceed the patient's mobility limits"
            exam_finding = "clear lungs, mild baseline ankle edema, and no abdominal distension"
        elif culprit_drug.startswith("Diphenhydramine") or culprit_drug.startswith("Amitriptyline") or culprit_drug.startswith("Oxybutynin"):
            drug_class = "highly anticholinergic agent"
            mechanism = "blocking detrusor muscarinic receptors, causing acute urinary retention and subsequent overflow leakage"
            exam_finding = "dry oral mucosa, sluggish pupils, and a palpable, non-painful suprapubic mass"
        else:
            drug_class = "dihydropyridine calcium channel blocker"
            mechanism = "detrusor muscle relaxation, leading to impaired bladder emptying and overflow dribbling"
            exam_finding = "trace bilateral ankle edema and a non-painful bladder palpable to the umbilicus"
            
        # Template 7: Parkinson's falls
        falls = random.randint(2, 5)
        
        # Template 9: BPH
        nocturia = random.randint(3, 6)
        prostate_size = random.randint(45, 85)
        
        # Format the question text
        q_text = t['q'].format(
            age=age, gender=gp['gender'], pronoun=gp['pronoun'], pronoun_cap=gp['pronoun_cap'], 
            possessive=gp['possessive'], possessive_cap=gp['possessive_cap'],
            duration=duration, pads=pads, pelvic_finding=pelvic_finding, pvr=pvr,
            accidents=accidents, hospital_reason=hospital_reason, culprit_drug=culprit_drug,
            exam_finding=exam_finding, drug_class=drug_class, mechanism=mechanism,
            falls=falls, nocturia=nocturia, prostate_size=prostate_size
        )
        
        # Format the options list
        opts_formatted = []
        for o in t['options']:
            o_fmt = o.format(
                culprit_drug=culprit_drug, pvr=pvr
            )
            opts_formatted.append(o_fmt)
            
        # Format the explanation
        exp_formatted = t['exp'].format(
            pvr=pvr, culprit_drug=culprit_drug, drug_class=drug_class, mechanism=mechanism,
            prostate_size=prostate_size
        )
        
        # Shuffle options and track correct index
        correct_opt = opts_formatted[t['answer']]
        random.shuffle(opts_formatted)
        new_ans_idx = opts_formatted.index(correct_opt)
        
        # Escape single quotes and format options as valid JSON
        q_text_escaped = q_text.replace("'", "''")
        opts_json_escaped = json.dumps(opts_formatted).replace("'", "''")
        exp_escaped = exp_formatted.replace("'", "''")
        
        mcq_str = f"    (v_topic_id, '{q_text_escaped}', '{opts_json_escaped}'::jsonb, {new_ans_idx}, '{exp_escaped}')"
        
        if q_text not in seen_questions:
            seen_questions.add(q_text)
            mcqs.append(mcq_str)
            counter += 1

out_file = "c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260520_geri_incontinence_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Geriatrics: Urinary incontinence — urge, stress, overflow, functional types\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\n")
    f.write("DECLARE\n")
    f.write("    v_topic_id UUID;\n")
    f.write("BEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'geri-incontinence' LIMIT 1;\n")
    f.write("    IF v_topic_id IS NULL THEN\n")
    f.write("        RAISE EXCEPTION 'Topic geri-incontinence not found.';\n")
    f.write("    END IF;\n\n")
    
    f.write("    -- Clear existing MCQs for this topic to avoid duplicates\n")
    f.write("    DELETE FROM mcqs WHERE topic_id = v_topic_id;\n\n")
    
    f.write("    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES\n")
    
    for i, m in enumerate(mcqs):
        if i < len(mcqs) - 1:
            f.write(m + ",\n")
        else:
            f.write(m + ";\n")
            
    f.write("END $$;\n")
    f.write("COMMIT;\n")

print(f"Generated {len(mcqs)} MCQs to {out_file}")
