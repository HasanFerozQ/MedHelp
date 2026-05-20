import json
import random

topic_slug = 'geri-pharmacokinetic-shifts'

templates = [
    # ─── TEMPLATE 1: VOLUME OF DISTRIBUTION (LIPOPHILIC VS HYDROPHILIC) ───
    {
        "q": "A {age}-old {gender} is admitted to the hospital with a mild infection and started on standard adult dosing of **{hydrophilic_drug}** (a hydrophilic medication). Within {duration} days, {pronoun} is found to have dangerously elevated serum concentrations of the drug and signs of mild toxic side effects. The patient's basic metabolic panel is unremarkable, and calculated creatinine clearance is stable. Which of the following normal age-related changes in body composition best explains this clinical presentation?",
        "options": [
            "Decreased total body water, resulting in a smaller volume of distribution and higher peak serum concentrations of hydrophilic drugs",
            "Increased total body fat, resulting in a larger volume of distribution and rapid clearance of hydrophilic drugs",
            "Decreased skeletal muscle mass, resulting in reduced tissue binding sites for hydrophilic compounds",
            "Increased total body water, resulting in rapid dilution and delayed renal excretion of hydrophilic drugs",
            "Decreased total body fat, resulting in systemic accumulation and prolonged half-life of hydrophilic drugs"
        ],
        "answer": 0,
        "exp": "This patient is experiencing toxicity from a standard dose of **{hydrophilic_drug}** due to normal age-related changes in body composition. Aging is characterized by a **decrease in total body water** and lean body mass, alongside an **increase in total body fat**. For **hydrophilic drugs** (e.g., {hydrophilic_drug}, lithium, digoxin, ethanol, gentamicin), a decrease in total body water results in a **decreased Volume of Distribution (V_d)**. Consequently, standard weight-based or adult doses lead to higher peak serum concentrations and a higher risk of toxicity. Conversely, for **lipophilic drugs** (e.g., diazepam, amiodarone, haloperidol), the increase in total body fat results in an **increased V_d**, leading to tissue accumulation and a significantly prolonged half-life (t_1/2)."
    },

    # ─── TEMPLATE 2: HEPATIC METABOLISM (PHASE I VS PHASE II) ───
    {
        "q": "A {age}-old {gender} presents with progressive daytime drowsiness, confusion, and unsteady gait. {possessive_cap} family notes that {pronoun} has had these symptoms since starting **{avoided_benzo}** for insomnia {med_weeks} weeks ago. {possessive_cap} physician decides to transition {pronoun} to a low dose of **{selected_benzo}**, which is expected to resolve the symptoms. Which of the following physiological changes of aging is the primary basis for this choice of medication?",
        "options": [
            "Phase I hepatic reactions (oxidation) decline significantly with age, whereas Phase II conjugation (glucuronidation) is relatively preserved",
            "Phase II conjugation reactions decline significantly with age, whereas Phase I oxidation is relatively preserved",
            "Renal tubular secretion of Phase II metabolites is accelerated compared to Phase I metabolites in older adults",
            "Older adults have increased sensitivity of peripheral benzodiazepine receptors to Phase I active metabolites",
            "Phase I hepatic metabolism is accelerated in older adults, causing toxic accumulation of active drug intermediates"
        ],
        "answer": 0,
        "exp": "This patient's sedation, confusion, and ataxia are caused by the accumulation of **{avoided_benzo}** (a long-acting benzodiazepine) and its active metabolites. Normal hepatic aging is characterized by a **decrease in liver mass and hepatic blood flow**, which selectively impairs **Phase I microsomal metabolism (oxidation, reduction, hydrolysis via CYP450)**. However, **Phase II conjugation (glucuronidation, acetylation, sulfation)** remains **relatively preserved** and unaffected by age. Benzodiazepines like **{avoided_benzo}** undergo Phase I oxidation, forming active metabolites with extremely long half-lives in older adults. To avoid this, clinicians choose the **'LOT' benzodiazepines (Lorazepam, Oxazepam, Temazepam)**, such as **{selected_benzo}**, because they bypass Phase I oxidation and undergo direct Phase II glucuronidation to inactive metabolites that are safely excreted."
    },

    # ─── TEMPLATE 3: RENAL DRUG EXCRETION AND GFR ESTIMATION ───
    {
        "q": "A {age}-old {gender} with a history of neuropathic pain is prescribed standard doses of **{renal_drug}**. Within a week, the patient is brought to the clinic presenting with severe sedation, cognitive slowing, and a myoclonus. The patient's serum creatinine is recorded as normal at **{cr} mg/dL**. However, a calculated creatinine clearance (CrCl) or GFR is **{gfr} mL/min/1.73m²**. Which of the following is the most appropriate explanation for this presentation and the best course of action?",
        "options": [
            "Renal excretion of {renal_drug} is reduced due to normal age-related decline in GFR, which is masked by a normal serum creatinine due to low muscle mass; reduce the drug dosage based on estimated GFR",
            "Active tubular secretion of {renal_drug} in the distal nephron is upregulated, causing acute renal toxicity; switch the patient to an oral NSAID",
            "The patient has a primary drug allergy to {renal_drug}; discontinue the drug permanently and initiate high-dose oral prednisone",
            "Age-related decrease in renal blood flow causes a secondary elevation in liver mass, accelerating Phase II drug clearance",
            "Highly protein-bound drugs like {renal_drug} have an increased affinity for serum albumin, requiring double the standard dosage to be effective"
        ],
        "answer": 0,
        "exp": "This patient is experiencing toxicity from **{renal_drug}** (a medication that is primarily eliminated unchanged by the kidneys). The primary explanation is the **normal age-related decline in glomerular filtration rate (GFR)** and renal blood flow, which decreases the clearance of renal-eliminated drugs. This decline is frequently **masked by a normal serum creatinine ({cr} mg/dL)** because serum creatinine is dependent on muscle mass. In older adults, age-related **sarcopenia** (loss of muscle mass) decreases the baseline production of creatinine, keeping its serum levels normal despite reduced GFR. Dosage adjustment is critical for renal-cleared medications (e.g., {renal_drug}, digoxin, lithium, metformin, vancomycin, DOACs) based on **estimated GFR/CrCl** rather than serum creatinine alone."
    },

    # ─── TEMPLATE 4: SERUM ALBUMIN DECLINE & FREE DRUG FRACTIONS ───
    {
        "q": "A {age}-old {gender} taking a chronic maintenance dose of **{bound_drug}** is admitted to the hospital with signs of drug toxicity, including {symptom}. Interestingly, the patient's total serum concentration of {bound_drug} is within the standard therapeutic reference range. The patient's serum albumin is noted to be **{albumin} g/dL** (normal 3.5-5.0 g/dL). Which of the following pharmacodynamic or pharmacokinetic shifts explains this finding?",
        "options": [
            "Age-related reduction in serum albumin levels leads to an increased free (active) fraction of highly protein-bound drugs, causing toxicity despite normal total drug levels",
            "Decreased albumin levels cause a compensatory upregulation of Phase I hepatic oxidation, creating toxic active metabolites",
            "Older adults have a reduced number of drug receptors, leaving more bound drug in the plasma to cause toxicity",
            "Decreased serum albumin increases the volume of distribution of hydrophilic drugs, causing acute renal tubular necrosis",
            "Serum albumin acts as a direct competitive antagonist at the receptor level; low levels increase drug binding affinity"
        ],
        "answer": 0,
        "exp": "This patient's toxicity is due to an **increased free (active) fraction of {bound_drug}**. {bound_drug} is a **highly protein-bound drug** (typically >90% bound to serum albumin). Normal aging is associated with a **gradual decline in serum albumin synthesis** (often aggravated by chronic disease or poor nutrition). When albumin levels are low ({albumin} g/dL), there are fewer binding sites available in the serum. This results in a higher proportion of **unbound (free) drug**, which is the pharmacologically active component that penetrates tissues and exerts drug effects (and toxicity). Because standard laboratory assays measure **total** drug levels (bound + free), the total concentration can appear completely normal while the active free fraction is toxic. Standard monitoring for highly bound drugs (e.g., warfarin, phenytoin, valproic acid) must account for serum albumin levels."
    },

    # ─── TEMPLATE 5: ANTICHOLINERGIC SENSITIVITY ───
    {
        "q": "A {age}-old {gender} is prescribed **{anticholinergic_drug}** for {indication}. Within {duration} days of starting the medication, the patient is brought to the emergency department with acute confusion, hallucinations, dry mouth, blurred vision, and a painful, distended abdomen. Physical exam reveals urinary retention and absent bowel sounds. Which of the following physiologic shifts is the primary driver of this severe adverse reaction?",
        "options": [
            "Age-related decline in central cholinergic neurons and acetylcholine synthesis, making the brain highly vulnerable to anticholinergic blockade",
            "Selective upregulation of peripheral muscarinic receptors in the bladder detrusor and salivary glands with age",
            "Increased permeability of the blood-brain barrier allowing greater penetration of hydrophilic compounds",
            "Compensatory increase in acetylcholinesterase activity in the synaptic cleft of older adults",
            "Impaired biliary excretion of anticholinergic drugs leading to systemic accumulation in the portal vein"
        ],
        "answer": 0,
        "exp": "This patient presents with classic **anticholinergic toxicity** (manifesting as 'mad as a hatter, red as a beet, dry as a bone, blind as a bat, hot as a hare, bowel and bladder lose their tone'). In older adults, this susceptibility is driven by a critical **pharmacodynamic shift**: there is a **normal age-related decline in baseline cholinergic neurons** and a **reduction in acetylcholine synthesis** in the central nervous system. Consequently, introducing a drug with anticholinergic properties (e.g., {anticholinergic_drug}, first-generation antihistamines, TCAs, paroxetine, bladder antispasmodics) easily tips the cholinergic balance, precipitating **delirium**, cognitive decline, and peripheral effects like dry mouth, constipation, urinary retention, and pupillary dilation. According to the Beers Criteria, these drugs should be avoided in older adults."
    },

    # ─── TEMPLATE 6: BETA-ADRENERGIC RECEPTOR SENSITIVITY ───
    {
        "q": "A {age}-old {gender} is participating in an exercise stress test. The physician notices that despite achieving a high level of physical exertion, the patient's maximum heart rate only reaches **{max_hr} bpm** (significantly lower than a younger adult). The patient is not taking any heart rate-limiting medications, and has a normal resting heart rate of {rest_hr} bpm. Which of the following cellular receptor-level shifts explains this normal age-related blunted physiologic response?",
        "options": [
            "Decreased beta-adrenergic receptor sensitivity and impaired post-receptor signal transduction (decreased adenylyl cyclase activation)",
            "Downregulation of vascular alpha-1 receptors with a compensatory upregulation of beta-2 receptors in the myocardium",
            "Increased binding affinity of beta-1 adrenergic receptors to circulating catecholamines, causing receptor saturation",
            "Progressive atrophy of the sinoatrial node with a complete loss of L-type calcium channels",
            "Accelerated degradation of intracellular cyclic adenosine monophosphate (cAMP) by phosphodiesterase enzymes"
        ],
        "answer": 0,
        "exp": "This patient's blunted heart rate response during exercise is a normal **pharmacodynamic and physiological change of aging**. The primary mechanism is a **decreased sensitivity of beta-adrenergic receptors** (specifically beta-1 receptors in the heart) to catecholamines (epinephrine and norepinephrine). While the absolute number of beta-receptors may remain relatively unchanged, there is **impaired post-receptor signal transduction** (including decreased coupling to G-proteins and reduced activation of adenylyl cyclase to produce cAMP). This leads to a blunted chronotropic (heart rate) and inotropic (contractility) response to sympathetic stimulation, explaining why older adults have a lower maximum heart rate ({max_hr} bpm) and a decreased cardiac reserve under stress. It also explains why they are less responsive to beta-blockers and beta-agonists."
    },

    # ─── TEMPLATE 7: INCREASED CNS DEPRESSANT SENSITIVITY ───
    {
        "q": "A {age}-old {gender} is prescribed a low dose of **{depressant_drug}** for mild transient insomnia. After the first dose, the patient experiences profound drowsiness, severe ataxia, and suffers a fall resulting in a minor head injury. Ophthalmic, cardiac, and basic metabolic examinations are normal. Which of the following pharmacodynamic changes explains the extreme sensitivity to this medication in this patient?",
        "options": [
            "Pharmacodynamic enhancement of GABA-A receptor sensitivity and decreased psychomotor reserve",
            "Upregulation of excitatory glutamate NMDA receptors in the cerebral cortex and cerebellum",
            "Selective loss of GABA-A receptors in the brain stem preventing drug binding",
            "Decreased crossing of lipophilic agents across the blood-brain barrier",
            "Atrophy of the locus coeruleus causing a compensatory rise in central noradrenergic activity"
        ],
        "answer": 0,
        "exp": "Older adults have an **increased sensitivity to central nervous system (CNS) depressants**, including benzodiazepines, Z-drugs (e.g., {depressant_drug}), anesthetics, and opioids. This is primarily a **pharmacodynamic shift** characterized by **enhanced receptor sensitivity** (particularly at the GABA-A receptor complex) and a **decreased psychomotor/cognitive reserve**. Even at very low doses, these medications can cause pronounced sedation, cognitive impairment, memory lapses, and motor instability (ataxia), leading to falls and hip fractures. According to the Beers Criteria, benzodiazepines and Z-drugs are strongly associated with adverse outcomes and should generally be avoided in older adults."
    },

    # ─── TEMPLATE 8: BARORECEPTOR REFLEX IMPAIRMENT & OH ───
    {
        "q": "A {age}-old {gender} with a history of benign prostatic hyperplasia is started on **{alpha_blocker}**. Within {duration} days of starting the medication, the patient experiences severe dizziness and syncope upon standing up from bed. Vital signs show a drop in blood pressure from **{supine_bp} supine** to **{standing_bp} standing** within 2 minutes, with a minimal compensatory heart rate increase. Which of the following homeostatic or pharmacodynamic changes explains this presentation?",
        "options": [
            "Age-related decline in baroreceptor reflex sensitivity and decreased arterial compliance",
            "Selective upregulation of alpha-1 adrenergic receptors in the vascular smooth muscle",
            "Hyper-responsiveness of the parasympathetic nervous system to postural changes",
            "Increased blood volume in the arterial circulation preventing rapid venous return",
            "Enhanced synthesis of aldosterone and renin in response to upright posture"
        ],
        "answer": 0,
        "exp": "This patient is experiencing drug-induced **orthostatic hypotension (OH)**, defined as a decrease in systolic BP ≥ 20 mmHg or diastolic BP ≥ 10 mmHg within 3 minutes of standing. The drop here (from {supine_bp} to {standing_bp}) is severe. Older adults are highly vulnerable to OH because of a **decline in baroreceptor reflex sensitivity** and **decreased arterial compliance**. In a younger patient, standing causes venous pooling, which triggers a baroreceptor-mediated reflex increase in sympathetic outflow (vasoconstriction and tachycardia). In older patients, this reflex is blunted, and the addition of an alpha-1 blocker (like {alpha_blocker}), vasodilator, TCA, or diuretic further blocks the vasoconstrictor response, leading to rapid blood pressure drop and syncope."
    },

    # ─── TEMPLATE 9: OPIOID SENSITIVITY AND CONSTIPATION ───
    {
        "q": "A {age}-old {gender} is prescribed a low-dose opioid (**{opioid_drug}**) for moderate post-operative pain after a total hip arthroplasty. Within {duration} days, the patient is brought back to the clinic presenting with severe abdominal distension, absence of bowel movements, and significant somnolence. Abdominal radiograph shows stool impaction in the colon. Which of the following best describes the pharmacodynamic or physiological changes predisposing this patient to these symptoms?",
        "options": [
            "Increased sensitivity of central mu-opioid receptors and age-related reduction in baseline gastrointestinal motility",
            "Downregulation of peripheral mu-opioid receptors in the intestinal myenteric plexus",
            "Impaired crossing of opioids across the blood-brain barrier causing purely peripheral adverse effects",
            "Accelerated hepatic clearance of opioids leading to rapid conversion to toxic metabolites",
            "Selective atrophy of the colon mucosa preventing the absorption of dietary fiber and water"
        ],
        "answer": 0,
        "exp": "Older adults have an **increased sensitivity to opioid therapy** (e.g., {opioid_drug}) due to both **pharmacodynamic and physiological changes**. Pharmacodynamically, there is an **increased sensitivity of central mu-opioid receptors**, leading to enhanced sedation, cognitive clouding, and respiratory depression at standard doses. Physiologically, aging is associated with a **reduction in baseline gastrointestinal motility** (due to enteric nervous system changes) and a higher prevalence of chronic constipation. Opioids bind to mu-receptors in the myenteric plexus, further slowing peristalsis and inhibiting fluid secretion. When these factors combine, older adults are at an extremely high risk for **severe constipation, fecal impaction, and bowel obstruction** unless a prophylactic bowel regimen (stimulant laxative + stool softener) is co-prescribed."
    },

    # ─── TEMPLATE 10: GASTRIC ACID SECRETION AND ABSORPTION CHANGES ───
    {
        "q": "A {age}-old {gender} is evaluated for persistent microcytic anemia. The patient has been taking oral **{acid_dependent_drug}** daily for the past {duration} months, but {possessive} hemoglobin and iron stores have not improved. The patient has no history of active bleeding, and endoscopic evaluation is negative. Which of the following physiological changes of aging in the gastrointestinal tract explains the failure of this therapy?",
        "options": [
            "Decreased gastric acid secretion leading to increased gastric pH, which reduces the solubility and absorption of acid-dependent drugs",
            "Accelerated gastric emptying and intestinal transit time preventing adequate contact with mucosal transport proteins",
            "Atrophy of the microvilli in the terminal ileum leading to general malabsorption of all divalent cations",
            "Upregulation of mucosal efflux transporters (P-glycoprotein) in the proximal duodenum",
            "Increased secretion of pancreatic bicarbonate neutralizing acidic medications in the stomach"
        ],
        "answer": 0,
        "exp": "This patient's lack of response to oral **{acid_dependent_drug}** (which requires an acidic environment for optimal absorption) is due to normal age-related changes in gastric physiology. Aging is associated with a **decline in gastric acid secretion** (hypochlorhydria, often worsened by subclinical atrophic gastritis or the use of PPIs/H2 blockers), leading to an **increased gastric pH**. Drugs like iron (e.g., {acid_dependent_drug}), calcium carbonate, and certain azole antifungals require an acidic environment to dissolve and convert into absorbable forms. With elevated gastric pH, absorption is significantly reduced, leading to therapeutic failure. In older adults, alternatives like **calcium citrate** (which is absorbed independently of gastric pH) should be used instead of calcium carbonate, and iron may require vitamin C supplementation or intravenous administration."
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
        duration = random.randint(3, 12)
        med_weeks = random.randint(2, 6)
        
        # Template 1: Hydrophilic / Lipophilic
        hydrophilic_drug = random.choice(["Gentamicin", "Lithium", "Digoxin", "Ethanol"])
        
        # Template 2: Phase I vs II Benzo
        selected_benzo = random.choice(["Lorazepam (Ativan)", "Oxazepam (Serax)", "Temazepam (Restoril)"])
        avoided_benzo = random.choice(["Diazepam (Valium)", "Chlordiazepoxide (Librium)", "Flurazepam (Dalmane)"])
        
        # Template 3: Renal Drug
        renal_drug = random.choice(["Gabapentin (Neurontin)", "Metformin (Glucophage)", "Digoxin (Lanoxin)", "Dabigatran (Pradaxa)"])
        cr = round(random.uniform(0.68, 1.08), 2)
        gfr = random.randint(48, 64)
        
        # Template 4: Albumin Bound
        bound_drug = random.choice(["Warfarin (Coumadin)", "Phenytoin (Dilantin)", "Valproic Acid (Depakene)"])
        symptom = "prolonged bleeding/ecchymosis" if bound_drug.startswith("Warfarin") else "nystagmus and ataxia"
        albumin = round(random.uniform(2.4, 3.1), 1)
        
        # Template 5: Anticholinergic
        anticholinergic_drug = random.choice(["Diphenhydramine (Benadryl)", "Amitriptyline (Elavil)", "Oxybutynin (Ditropan)"])
        indication = "insomnia" if anticholinergic_drug.startswith("Diphenhydramine") else ("neuropathy" if anticholinergic_drug.startswith("Amitriptyline") else "urinary urgency")
        
        # Template 6: Beta receptors
        max_hr = random.randint(125, 142)
        rest_hr = random.randint(62, 78)
        
        # Template 7: CNS depressant
        depressant_drug = random.choice(["Zolpidem (Ambien)", "Alprazolam (Xanax)", "Triazolam (Halcion)"])
        
        # Template 8: Baroreceptor
        alpha_blocker = random.choice(["Tamsulosin (Flomax)", "Doxazosin (Cardura)", "Prazosin (Minipress)"])
        supine_bp = f"{random.randint(142, 158)}/{random.randint(82, 92)}"
        standing_bp = f"{random.randint(110, 120)}/{random.randint(64, 72)}"
        
        # Template 9: Opioid
        opioid_drug = random.choice(["Morphine", "Oxycodone", "Hydromorphone"])
        
        # Template 10: Gastric acid
        acid_dependent_drug = random.choice(["Iron sulfate", "Calcium carbonate", "Ketoconazole"])
        
        # Format the question text
        q_text = t['q'].format(
            age=age, gender=gp['gender'], pronoun=gp['pronoun'], pronoun_cap=gp['pronoun_cap'], 
            possessive=gp['possessive'], possessive_cap=gp['possessive_cap'],
            duration=duration, med_weeks=med_weeks,
            hydrophilic_drug=hydrophilic_drug,
            selected_benzo=selected_benzo, avoided_benzo=avoided_benzo,
            renal_drug=renal_drug, cr=cr, gfr=gfr,
            bound_drug=bound_drug, symptom=symptom, albumin=albumin,
            anticholinergic_drug=anticholinergic_drug, indication=indication,
            max_hr=max_hr, rest_hr=rest_hr,
            depressant_drug=depressant_drug,
            alpha_blocker=alpha_blocker, supine_bp=supine_bp, standing_bp=standing_bp,
            opioid_drug=opioid_drug,
            acid_dependent_drug=acid_dependent_drug
        )
        
        # Format the options list
        opts_formatted = []
        for o in t['options']:
            o_fmt = o.format(
                hydrophilic_drug=hydrophilic_drug,
                selected_benzo=selected_benzo, avoided_benzo=avoided_benzo,
                renal_drug=renal_drug, bound_drug=bound_drug,
                anticholinergic_drug=anticholinergic_drug,
                depressant_drug=depressant_drug, alpha_blocker=alpha_blocker,
                opioid_drug=opioid_drug, acid_dependent_drug=acid_dependent_drug
            )
            opts_formatted.append(o_fmt)
            
        # Format the explanation
        exp_formatted = t['exp'].format(
            hydrophilic_drug=hydrophilic_drug,
            selected_benzo=selected_benzo, avoided_benzo=avoided_benzo,
            renal_drug=renal_drug, cr=cr, gfr=gfr,
            bound_drug=bound_drug, albumin=albumin,
            anticholinergic_drug=anticholinergic_drug,
            max_hr=max_hr, rest_hr=rest_hr,
            depressant_drug=depressant_drug, alpha_blocker=alpha_blocker,
            supine_bp=supine_bp, standing_bp=standing_bp,
            opioid_drug=opioid_drug, acid_dependent_drug=acid_dependent_drug
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

out_file = "c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260520_geri_pkpd_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Geriatrics: Pharmacokinetic/pharmacodynamic shifts\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\n")
    f.write("DECLARE\n")
    f.write("    v_topic_id UUID;\n")
    f.write("BEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'geri-pharmacokinetic-shifts' LIMIT 1;\n")
    f.write("    IF v_topic_id IS NULL THEN\n")
    f.write("        RAISE EXCEPTION 'Topic geri-pharmacokinetic-shifts not found.';\n")
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
