import json
import random

topic_slug = 'geri-aging-changes'

templates = [
    # ─── TEMPLATE 1: CARDIOVASCULAR SYSTEM AGING (ARTERIAL STIFFNESS & COMPLIANCE) ───
    {
        "q": "A {age}-old {gender} is evaluated during a routine health maintenance visit. {possessive_cap} resting blood pressure is {sbp}/{dbp} mmHg, which represents a widened pulse pressure compared to previous records. Rest of the physical exam is unremarkable. An echocardiogram shows mild concentric left ventricular hypertrophy with a normal ejection fraction of {ef}%. Rest of the study is normal. Which of the following is the primary underlying physiological mechanism for these cardiovascular changes in this healthy patient?",
        "options": [
            "Decreased compliance of large elastic arteries due to loss of elastin and increased collagen deposition",
            "Sclerosis of the sinoatrial node with a primary reduction in resting cardiac output",
            "Downregulation of vascular alpha-1 adrenergic receptors causing peripheral vasodilation",
            "Atherosclerotic calcification of the main renal arteries causing secondary renovascular hypertension",
            "Impaired myocardial relaxation due to chronic subclinical volume overload"
        ],
        "answer": 0,
        "exp": "This patient's widened pulse pressure ({sbp}/{dbp} mmHg) and concentric left ventricular hypertrophy are classic hallmarks of normal **cardiovascular aging**. The primary mechanism is the **loss of elastin** and **increased collagen deposition** in the media of large conduit arteries, leading to **increased arterial stiffness/decreased compliance**. This causes pulse wave reflection to return earlier in systole, boosting systolic blood pressure and widening the pulse pressure. The left ventricle hypertrophies compensatorily to overcome this increased afterload. Crucially, **resting ejection fraction ({ef}%) and resting cardiac output are preserved** in normal aging, though maximum cardiac output and maximum heart rate under stress/exercise are reduced due to decreased beta-adrenergic responsiveness."
    },

    # ─── TEMPLATE 2: RESPIRATORY SYSTEM AGING (ELASTIC RECOIL & CHEST WALL COMPLIANCE) ───
    {
        "q": "A {age}-old {gender} with no history of lung disease or smoking is evaluated for insurance clearance. Spirometry is performed and reveals:<br>• FEV1: <b>{fev1}% of predicted</b><br>• FVC: <b>{fvc}% of predicted</b><br>• FEV1/FVC ratio: <b>{ratio}%</b><br>• Total Lung Capacity (TLC): <b>{tlc}% of predicted (unchanged from baseline)</b><br>• Residual Volume (RV): <b>Increased</b><br>• Diffusing Capacity (DLCO): <b>Slightly decreased</b><br><br>Which of the following physiologic processes best explains these age-related changes in pulmonary function?",
        "options": [
            "Decreased lung elastic recoil combined with decreased chest wall compliance",
            "Loss of pulmonary surfactant production causing diffuse micro-atelectasis",
            "Anatomic airway remodeling characterized by bronchial smooth muscle hypertrophy",
            "Subclinical interstitial fibrosis leading to restrictive pulmonary physiology",
            "Acquired diaphragm paralysis with a compensatory increase in accessory muscle use"
        ],
        "answer": 0,
        "exp": "Physiological pulmonary aging is characterized by two main mechanical changes: (1) **decreased lung elastic recoil** (due to alterations in elastin/collagen fibers, leading to alveolar duct dilation and 'senile emphysema' without tissue destruction), and (2) **decreased chest wall compliance** (stiffening of the rib cage due to calcification of costochondral joints and spinal alterations). These changes lead to: (a) **increased Residual Volume (RV)** and Functional Residual Capacity (FRC) as airways close earlier during expiration, (b) **decreased FEV1 and FVC**, (c) a **normal or slightly decreased FEV1/FVC ratio** (often around {ratio}%), and (d) **unchanged Total Lung Capacity (TLC)**. DLCO is slightly decreased due to reduced alveolar surface area. Additionally, the A-a gradient increases with age due to ventilation-perfusion mismatch."
    },

    # ─── TEMPLATE 3: RENAL GFR & SARCOPENIA PARADOX ───
    {
        "q": "A {age}-old {gender} is being evaluated before starting a medication that is primarily cleared by the kidneys. The patient's serum creatinine is completely normal at **{cr} mg/dL**. However, a 24-hour urine collection or estimation formula indicates a Glomerular Filtration Rate (GFR) of **{gfr} mL/min/1.73m²** (normal >90). The patient is active and has no chronic conditions. Which of the following best explains the discrepancy between the normal serum creatinine and the significantly decreased GFR in this healthy older adult?",
        "options": [
            "Age-related loss of muscle mass (sarcopenia) resulting in decreased baseline creatinine production",
            "Compensatory upregulation of creatinine secretion by the organic anion transporters in the proximal tubule",
            "Increased extra-renal clearance of creatinine by the liver and intestines with age",
            "Higher dietary protein intake in older adults suppressing endogenous creatinine release",
            "Hypertrophy of remaining glomeruli maintaining a high creatinine filtration fraction"
        ],
        "answer": 0,
        "exp": "With normal aging, there is a progressive decline in **renal blood flow and glomerular filtration rate (GFR)**, typically dropping by about 1 mL/min/year after age 40. This healthy patient's GFR is {gfr} mL/min/1.73m², yet serum creatinine is normal ({cr} mg/dL). This discrepancy exists because serum creatinine is dependent on **muscle mass**. Aging is accompanied by **sarcopenia** (loss of skeletal muscle mass), which decreases the baseline production rate of creatinine. The reduced production of creatinine offsets the reduced renal clearance of creatinine, keeping the serum creatinine level within the 'normal' range. Clinicians must always calculate or estimate GFR (e.g., Cockcroft-Gault, CKD-EPI) rather than relying solely on serum creatinine when dosing renal-cleared medications in older patients."
    },

    # ─── TEMPLATE 4: RENAL ELECTROLYTE REGULATION (CONCENTRATING/DILUTING CAPACITY) ───
    {
        "q": "A {age}-old {gender} is admitted to the hospital for a mild urinary tract infection and is kept NPO for {npo_hours} hours. On admission, serum sodium is 140 mEq/L. Within {npo_hours} hours, the patient's sodium rises to **{na} mEq/L** (hypernatremia), and {pronoun} is noted to have a dry oral mucosa and a blunted thirst response. Which of the following age-related physiological changes directly predisposes this patient to rapid water balance and electrolyte disturbances?",
        "options": [
            "Decreased renal concentrating and diluting capacity combined with a blunted hypothalamic thirst mechanism",
            "Severe resistance of the collecting duct to antidiuretic hormone (ADH) secondary to aquaporin-2 deletion",
            "Increased baseline renin and aldosterone synthesis leading to excessive sodium reabsorption",
            "Hyper-responsiveness of cortical baroreceptors to intravascular volume changes",
            "Atrophy of the loop of Henle causing a complete loss of the medullary concentration gradient"
        ],
        "answer": 0,
        "exp": "Older adults are highly susceptible to both **hyponatremia** and **hypernatremia** due to normal age-related renal physiological changes. There is a **decreased concentrating and diluting capacity** of the kidney, caused by a reduced response to antidiuretic hormone (ADH/vasopressin) and a decrease in the medullary concentration gradient. This limits the kidney's ability to conserve water during deprivation or excrete water during excess. Furthermore, older adults have a **blunted hypothalamic thirst mechanism**, meaning they do not feel thirsty even when hyperosmolar. They also have lower baseline renin and aldosterone levels (hyporeninemic hypoaldosteronism state), making them prone to hyperkalemia and renal sodium wasting under stress."
    },

    # ─── TEMPLATE 5: NERVOUS SYSTEM & SLEEP ARCHITECTURE AGING ───
    {
        "q": "A {age}-old {gender} presents with a {duration}-month history of sleep disturbances. The patient reports taking longer to fall asleep, waking up {wake_count} times during the night, and waking up at **{wake_time} AM** unable to fall back asleep. {pronoun_cap} reports feeling sleepy in the early evening (around 8:00 PM). {pronoun_cap} denies depression, daytime napping, or loud snoring. Sleep study confirms a sleep efficiency of **{efficiency}%**. Which of the following alterations in sleep architecture is considered a normal physiological change of aging?",
        "options": [
            "Decreased slow-wave (N3) sleep, decreased REM sleep, and an advanced circadian phase",
            "Increased slow-wave (N3) sleep, decreased REM sleep, and a delayed circadian phase",
            "Selective loss of light (N1/N2) sleep with preserved slow-wave and REM sleep",
            "Prolonged REM latency with a persistent increase in total daily sleep requirement",
            "Absolute loss of hypothalamic circadian rhythmicity leading to irregular sleep-wake patterns"
        ],
        "answer": 0,
        "exp": "Normal aging is associated with significant changes in **sleep architecture**: (1) **decreased slow-wave sleep (Stage N3/deep sleep)** and **decreased REM sleep**, with a relative increase in light sleep (stages N1 and N2), leading to easily disrupted sleep and **sleep fragmentation** (waking up {wake_count} times, low sleep efficiency of {efficiency}%); (2) **increased sleep latency** (taking longer to fall asleep); and (3) an **advanced circadian phase** (advanced sleep phase syndrome), where melatonin secretion peaks earlier in the day, causing older adults to feel sleepy early in the evening (8:00 PM) and wake up early in the morning ({wake_time} AM). Total sleep requirement remains relatively stable (7-8 hours), but is harder to achieve in a single consolidated block."
    },

    # ─── TEMPLATE 6: SENSORY SYSTEM AGING (PRESBYCUSIS & PRESBYOPIA) ───
    {
        "q": "A {age}-old {gender} reports difficulty hearing conversations at family gatherings, especially in the presence of background noise. The patient also notes needing to hold books at arm's length to read them clearly. Physical examination shows bilateral, symmetric hearing loss restricted to high frequencies, and decreased near visual acuity. Which of the following mechanisms best explains these age-related sensory declines in this healthy patient?",
        "options": [
            "Loss of cochlear hair cells in the organ of Corti (presbycusis) and decreased lens elasticity (presbyopia)",
            "Calcification of the middle ear ossicles (presbycusis) and progressive corneal thickening (presbyopia)",
            "Atrophy of the auditory nerve (CN VIII) and loss of ciliary muscle contractile power",
            "Degeneration of the auditory cortex and loss of retinal photoreceptor density",
            "Sclerosis of the tympanic membrane and lipid deposition in the sclera (arcus senilis)"
        ],
        "answer": 0,
        "exp": "This patient is experiencing two classic sensory changes of aging: (1) **Presbycusis**: The most common cause of sensorineural hearing loss in older adults, characterized by progressive, symmetric, high-frequency hearing loss. The primary mechanism is the **loss of hair cells in the basal turn of the organ of Corti** (cochlea). (2) **Presbyopia**: The age-related loss of near vision (accommodation), requiring reading glasses. The primary mechanism is **decreased lens elasticity (stiffening of the lens)** and, to a lesser extent, mild weakening of the ciliary muscle, preventing the lens from becoming sufficiently round to focus on close objects."
    },

    # ─── TEMPLATE 7: GASTROINTESTINAL & HEPATIC AGING (DRUG METABOLISM & BEERS CRITERIA) ───
    {
        "q": "A physician is managing a {age}-old {gender} with mild chronic anxiety. The physician decides to prescribe a short course of a benzodiazepine. To minimize the risk of prolonged sedation and cumulative drug toxicity, the physician chooses **{selected_benzo}** rather than **{avoided_benzo}**. What is the primary age-related physiological basis for this pharmacological preference in older adults?",
        "options": [
            "Phase I hepatic oxidation reactions are reduced with age, while Phase II conjugation (glucuronidation) remains relatively preserved",
            "Older adults have increased renal clearance of Phase II conjugated metabolites compared to Phase I metabolites",
            "Older adults have a selective upregulation of GABA-A receptors that are only responsive to Phase II metabolized drugs",
            "Phase I hepatic metabolism is accelerated with age, causing rapid inactivation of {avoided_benzo}",
            "Hydrophilic benzodiazepines like {selected_benzo} have a larger volume of distribution in older adults, lowering peak toxicity risk"
        ],
        "answer": 0,
        "exp": "Hepatic aging is characterized by a **decrease in hepatic blood flow and liver mass**, which impairs **Phase I metabolism (oxidation, reduction, hydrolysis via CYP450)**. However, **Phase II metabolism (conjugation: glucuronidation, acetylation, sulfation)** is **relatively preserved/unaffected** by age. The benzodiazepines **Lorazepam, Oxazepam, and Temazepam (the 'LOT' drugs)** undergo direct Phase II glucuronidation to inactive metabolites and do not accumulate. In contrast, drugs like **{avoided_benzo}** (e.g., Diazepam, Chlordiazepoxide) undergo Phase I oxidation, forming long-acting active metabolites. Because of reduced Phase I clearance and an **increased volume of distribution for lipophilic drugs** (due to increased body fat percentage with age), {avoided_benzo} has an extremely prolonged half-life in older adults, causing accumulation, cognitive clouding, daytime drowsiness, and an increased risk of falls."
    },

    # ─── TEMPLATE 8: IMMUNOSENESCENCE & HEMATOLOGY CHANGES ───
    {
        "q": "A {age}-old {gender} is admitted to the hospital with acute bacterial pneumonia. On admission, the patient is febrile but has a normal white blood cell (WBC) count of 8,500/µL with {neutrophils}% neutrophils and a mild bandemia. A bone marrow biopsy performed for a separate, unrelated evaluation reveals a bone marrow cellularity of **{cellularity}%** (normal in young adults is 50-70%). Which of the following physiological changes of aging best explains these immunological and hematological findings?",
        "options": [
            "Thymic involution with a decline in naive T cells, along with replacement of red marrow with adipose tissue",
            "Complete depletion of pluripotent hematopoietic stem cells with a hyperactive secondary humoral immune response",
            "Hypertrophy of the lymphatic cortex leading to clonal expansion of naive B lymphocytes",
            "Selective loss of leukocyte adhesion molecules on the vascular endothelial surface",
            "Inability of remaining bone marrow stem cells to differentiate into myeloid-lineage progenitors"
        ],
        "answer": 0,
        "exp": "Healthy older adults undergo two major immune and hematological changes: (1) **Immunosenescence**: The age-related decline in immune function. A key driver is **thymic involution** (the thymus is replaced by fat), which leads to a **marked decrease in the production of naive T cells**. Consequently, the body has a reduced ability to respond to new pathogens and vaccines, relying on memory T cells. Older adults also mount less robust inflammatory responses (like presenting without a leukocytosis). (2) **Hematopoietic reserve decline**: Red (active) bone marrow is progressively **replaced by yellow (inactive/fatty) marrow**, reducing marrow cellularity to about **{cellularity}%** (roughly calculated as 100 - age). While baseline cell counts (RBCs, WBCs, platelets) are typically normal, the hematopoietic reserve is compromised under stress (such as acute infection or blood loss)."
    },

    # ─── TEMPLATE 9: INTEGUMENTARY AGING (SKIN FRAGILITY & THERMOREGULATION) ───
    {
        "q": "A {age}-old {gender} presents for a skin check. The physician notes dry, scaling skin on the lower extremities, and several dark purple macules on the dorsum of the hands and forearms (senile purpura) sustained after minor friction. The patient also complains of feeling excessively hot and dizzy during summer days. Which of the following age-related physiological changes in the integumentary system explains these clinical findings?",
        "options": [
            "Flattening of the dermo-epidermal junction, loss of dermal collagen, and atrophy of eccrine and sebaceous glands",
            "Hypertrophy of the stratum corneum, increased dermal vascularity, and hyperactive sweat gland function",
            "Autoimmune destruction of dermal elastin coupled with sweat gland hyperplasia",
            "Accumulation of subcutaneous adipose tissue with secondary occlusion of the cutaneous capillaries",
            "Upregulation of epidermal melanocytes causing chronic xerosis and capillary leakage"
        ],
        "answer": 0,
        "exp": "Normal skin aging involves: (1) **Epidermal thinning and flattening of the dermo-epidermal junction**, which reduces the mechanical shear resistance, causing the skin to tear easily. (2) **Decreased dermal collagen and elastin**, leading to wrinkles and skin fragility. The supporting connective tissue around cutaneous blood vessels is lost, causing vessels to rupture easily under minor pressure (resulting in **senile purpura** on hands/forearms). (3) **Atrophy of eccrine (sweat) glands** and **sebaceous (oil) glands**. Sebaceous gland atrophy leads to decreased sebum production, causing dry, itchy skin (**xerosis/pruritus senilis**). Eccrine gland atrophy leads to decreased sweat production and compromised cutaneous vasodilation, **impairing heat dissipation (thermoregulation)** and predisposing older adults to heat exhaustion/stroke."
    },

    # ─── TEMPLATE 10: ENDOCRINE & METABOLIC AGING (GLUCOSE TOLERANCE & SARCOPENIA) ───
    {
        "q": "A {age}-old {gender} undergoes a routine health evaluation. The patient has a fasting plasma glucose of **{fasting_glucose} mg/dL** (normal <100), and a 2-hour postprandial glucose of **{postprandial_glucose} mg/dL** (normal <140) after a standardized oral glucose tolerance test. A dual-energy X-ray absorptiometry (DEXA) scan shows an increase in visceral fat and a significant decrease in lean skeletal muscle mass. Which of the following processes is the primary physiological driver of these metabolic changes in this healthy older adult?",
        "options": [
            "Increased peripheral insulin resistance secondary to loss of skeletal muscle mass (sarcopenia) and increased visceral adiposity",
            "Autoimmune destruction of pancreatic beta cells leading to progressive insulin deficiency",
            "Accelerated renal excretion of insulin with secondary down-regulation of insulin receptors",
            "Upregulation of skeletal muscle glucose transporter type 4 (GLUT4) expression",
            "Impaired intestinal glucose transport due to mucosal atrophy of the duodenum and jejunum"
        ],
        "answer": 0,
        "exp": "During aging, fasting glucose levels rise only slightly (about 1 mg/dL per decade after age 30), but **postprandial glucose levels rise significantly** (around 5-10 mg/dL per decade), as seen here ({postprandial_glucose} mg/dL). The primary mechanism is **increased peripheral insulin resistance**. This is driven by age-related changes in body composition: **sarcopenia** (loss of lean skeletal muscle mass, which is the primary site of insulin-mediated glucose disposal) and **increased visceral adiposity** (which releases pro-inflammatory adipokines that impair insulin signaling). Pancreatic beta-cell insulin secretion capacity is also slightly reduced under high glucose loads, but insulin resistance is the dominant driver."
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
        duration = random.randint(2, 11)
        
        # Template 1 CV
        sbp = random.randint(142, 164)
        dbp = random.randint(72, 86)
        ef = random.randint(55, 68)
        
        # Template 2 Pulm
        fev1 = random.randint(72, 84)
        fvc = random.randint(74, 86)
        ratio = random.randint(70, 76)
        tlc = random.randint(92, 108)
        
        # Template 3 Renal GFR
        cr = round(random.uniform(0.72, 1.12), 2)
        gfr = random.randint(52, 68)
        
        # Template 4 Renal Sodium
        npo_hours = random.choice([12, 18, 24, 36])
        na = random.randint(148, 156)
        
        # Template 5 Sleep
        wake_count = random.randint(2, 5)
        wake_time = f"{random.randint(4, 5)}:00"
        efficiency = random.randint(68, 78)
        
        # Template 7 GI/Benzos
        selected_benzo = random.choice(["Lorazepam (Ativan)", "Oxazepam (Serax)", "Temazepam (Restoril)"])
        avoided_benzo = random.choice(["Diazepam (Valium)", "Chlordiazepoxide (Librium)", "Flurazepam (Dalmane)"])
        
        # Template 8 Immunosenescence
        neutrophils = random.randint(62, 78)
        cellularity = 100 - age
        
        # Template 10 Glucose/Endocrine
        fasting_glucose = random.randint(100, 112)
        postprandial_glucose = random.randint(146, 178)
        
        # Format the question text
        q_text = t['q'].format(
            age=age, gender=gp['gender'], pronoun=gp['pronoun'], pronoun_cap=gp['pronoun_cap'], 
            possessive=gp['possessive'], possessive_cap=gp['possessive_cap'],
            duration=duration, sbp=sbp, dbp=dbp, ef=ef,
            fev1=fev1, fvc=fvc, ratio=ratio, tlc=tlc,
            cr=cr, gfr=gfr, npo_hours=npo_hours, na=na,
            wake_count=wake_count, wake_time=wake_time, efficiency=efficiency,
            selected_benzo=selected_benzo, avoided_benzo=avoided_benzo,
            neutrophils=neutrophils, cellularity=cellularity,
            fasting_glucose=fasting_glucose, postprandial_glucose=postprandial_glucose
        )
        
        # Format the options list
        opts_formatted = []
        for o in t['options']:
            o_fmt = o.format(selected_benzo=selected_benzo, avoided_benzo=avoided_benzo)
            opts_formatted.append(o_fmt)
            
        # Format the explanation
        exp_formatted = t['exp'].format(
            sbp=sbp, dbp=dbp, ef=ef, ratio=ratio, cr=cr, gfr=gfr,
            wake_count=wake_count, wake_time=wake_time, efficiency=efficiency,
            selected_benzo=selected_benzo, avoided_benzo=avoided_benzo,
            cellularity=cellularity, postprandial_glucose=postprandial_glucose
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

out_file = "c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260520_geri_aging_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Geriatrics: Physiological aging — organ system changes\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\n")
    f.write("DECLARE\n")
    f.write("    v_topic_id UUID;\n")
    f.write("BEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'geri-aging-changes' LIMIT 1;\n")
    f.write("    IF v_topic_id IS NULL THEN\n")
    f.write("        RAISE EXCEPTION 'Topic geri-aging-changes not found.';\n")
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
