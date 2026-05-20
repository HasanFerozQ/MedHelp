import json
import random

topic_slug = 'geri-malnutrition'

templates = [
    # TEMPLATE 1: DIAGNOSTIC CRITERIA & INITIAL WORKUP OF UNINTENTIONAL WEIGHT LOSS
    {
        "q": "A {age}-old {gender} is brought to the clinic by {possessive} family due to concern for weight loss. The family reports that {pronoun} has lost **{weight_loss} lbs** ({weight_loss_kg} kg) over the past **{duration} months**, which was completely unintentional. This represents a **{pct_loss}% decline** in {possessive} baseline body weight of {baseline} lbs. {pronoun_cap} has no specific symptoms other than mild fatigue. Which of the following defines the clinical threshold for significant unintentional weight loss in an elderly patient, and what is the most appropriate initial diagnostic step?",
        "options": [
            "Loss of ≥5% of body weight in 6 months or ≥10% in 12 months; obtain a detailed history and physical examination, nutritional assessment (e.g., Mini Nutritional Assessment), and baseline laboratory testing (CBC, CMP, TSH, CRP, urinalysis)",
            "Loss of ≥15% of body weight in 3 months; immediately order a whole-body CT scan and schedule an upper and lower endoscopy",
            "Loss of ≥5 lbs regardless of baseline weight or duration; prescribe Megestrol acetate to stimulate appetite before initiating any diagnostic workup",
            "Loss of ≥20% of body weight in 1 year; place a percutaneous endoscopic gastrostomy (PEG) tube immediately to prevent further decline",
            "Loss of ≥10% of body weight in 1 month; initiate total parenteral nutrition (TPN) and admit to the hospital for observation"
        ],
        "answer": 0,
        "exp": "This patient meets the clinical criteria for **significant unintentional weight loss**, which is defined as an **involuntary weight loss of ≥5% of baseline body weight in 6 months or ≥10% in 12 months**. Unintentional weight loss in older adults is associated with increased morbidity, disability, and mortality. The initial diagnostic approach should always begin with a **comprehensive history, physical examination, and detailed nutritional assessment** (such as the Mini Nutritional Assessment, MNA), along with a search for common organic, psychosocial, or medication-related causes (e.g., the ''9 Ds'' of geriatric weight loss). Baseline laboratory tests should include a **complete blood count (CBC), complete metabolic panel (CMP), thyroid-stimulating hormone (TSH) to rule out hyperthyroidism, C-reactive protein (CRP) or ESR as markers of inflammation/occult malignancy, and a urinalysis**. Advanced imaging (e.g., CT scans) or invasive procedures (e.g., endoscopies) should be guided by specific clinical signs, symptoms, or abnormal baseline lab results rather than ordered as a blanket screen."
    },
    # TEMPLATE 2: SARCOPENIA VS CACHEXIA VS STARVATION
    {
        "q": "A {age}-old {gender} with a history of advanced chronic heart failure and chronic kidney disease presents with progressive weakness and muscle wasting. On physical examination, there is severe temporal wasting and loss of supraclavicular fat. Laboratory analysis shows a **C-reactive protein (CRP) of {crp} mg/L** (normal: <5) and an **IL-6 level of {il6} pg/mL** (normal: <5). The patient''s condition does **not** significantly improve with increased caloric intake alone. Which of the following best describes the pathophysiology of this patient''s weight loss, and how does it differ from age-related sarcopenia?",
        "options": [
            "Cachexia, an inflammatory cytokine-driven state characterized by accelerated muscle and fat loss that is not fully reversed by nutritional support; whereas sarcopenia is the age-related loss of muscle mass and function without systemic inflammation",
            "Sarcopenia, an acute starvation state driven by hypothalamic dysfunction that resolves completely with high-protein nutritional shakes",
            "Simple starvation, a state of inadequate intake where metabolic rate is elevated and muscle protein synthesis is preserved",
            "Protein-losing enteropathy, characterized by selective fat loss and normal inflammatory cytokines, managed with low-fat diet",
            "Senile anorexia, an autoimmune destruction of adipocytes presenting with low inflammatory markers and treated with immunosuppressants"
        ],
        "answer": 0,
        "exp": "This patient exhibits **cachexia**, a complex metabolic syndrome associated with underlying illness (such as cancer, advanced heart failure, COPD, or chronic kidney disease) and characterized by **loss of muscle with or without loss of fat mass**. The hallmark of cachexia is **systemic inflammation**, driven by pro-inflammatory cytokines such as tumor necrosis factor-alpha (TNF-alpha, formerly known as cachectin), interleukin-6 (IL-6), and interferon-gamma. These cytokines cause protein degradation, suppress appetite, and increase energy expenditure. Crucially, **cachexia cannot be fully reversed by conventional nutritional support** because the underlying metabolic alterations and hypercatabolism persist. In contrast, **sarcopenia** is the progressive, age-related loss of skeletal muscle mass, strength, and function (independent of systemic inflammation or underlying wasting disease). **Starvation** is a state of pure caloric deprivation without inflammation, in which energy expenditure decreases and the body conserves protein; starvation is fully reversible with nutritional repletion."
    },
    # TEMPLATE 3: APPRORIATE WORKUP FOR ORGANIC CAUSES (MALIGNANCY SCREENING)
    {
        "q": "A {age}-old {gender} presents with a {weight_loss}-lb unintentional weight loss over {duration} months. {pronoun_cap} also reports a recent change in bowel habits, intermittent abdominal discomfort, and feeling early satiety. Physical exam is notable for mild abdominal tenderness but no palpable masses. Hemoglobin is **{hb} g/dL** (normal: 13.5-17.5 in men, 12.0-15.5 in women) with an MCV of **{mcv} fL** (normal: 80-100). Fecal occult blood test (FOBT) is positive. Which of the following is the most appropriate next step in the diagnostic workup?",
        "options": [
            "Schedule an upper endoscopy (EGD) and colonoscopy to evaluate for gastrointestinal malignancy or pathology",
            "Prescribe oral iron supplements and advise the patient to return in 3 months to recheck the hemoglobin",
            "Perform a whole-body PET/CT scan to search for occult malignancy before obtaining any endoscopic evaluation",
            "Initiate high-dose corticosteroid therapy empirically to treat suspected giant cell arteritis or polymyalgia rheumatica",
            "Recommend increased oral intake of calorie-dense foods and prescribe Megestrol acetate to stimulate appetite"
        ],
        "answer": 0,
        "exp": "The patient presents with significant unintentional weight loss, GI symptoms (early satiety, abdominal discomfort, change in bowel habits), **microcytic anemia (Hb of {hb} g/dL and MCV of {mcv} fL)**, and a **positive fecal occult blood test (FOBT)**. These findings are highly suspicious for **gastrointestinal pathology, specifically a GI malignancy** (such as colorectal cancer or gastric cancer). Gastrointestinal disorders account for approximately 30-45% of organic causes of unintentional weight loss in older adults. The most appropriate next step is to perform an **upper endoscopy (EGD) and a colonoscopy** to directly visualize the GI mucosa and obtain tissue biopsies. Prescribing iron supplements without identifying the source of chronic blood loss is a common error and delays cancer diagnosis. Advanced imaging like PET or CT scans may be indicated later for staging if a malignancy is found, but endoscopies are the primary diagnostic tools for these clinical findings."
    },
    # TEMPLATE 4: THE "9 DS" OF GERIATRIC WEIGHT LOSS (DEPRESSION FOCUS)
    {
        "q": "A {age}-old {gender} is brought to the clinic by a caregiver due to a {weight_loss}-lb weight loss over the past {duration} months. The patient has advanced osteoarthritis and hypertension. The caregiver reports that the patient has become increasingly withdrawn, no longer participates in social activities, has early morning awakenings, and frequently complains that food ''tastes like cardboard.'' The patient score on the Geriatric Depression Scale (GDS) is **{gds_score}/15**. A thorough physical exam and baseline laboratory workup (CBC, CMP, TSH, CRP) are normal. Which of the following is the most likely cause of weight loss, and what is the best management strategy?",
        "options": [
            "Depression (one of the ''9 Ds'' of geriatric weight loss); manage with non-pharmacological support and initiate Mirtazapine, which serves as both an antidepressant and appetite/weight stimulant",
            "Atypical hyperthyroidism (apathetic thyrotoxicosis); initiate methimazole therapy immediately despite the normal TSH",
            "Age-related dysgeusia (taste loss) alone; recommend adding high amounts of sodium and spices to all foods",
            "Early-stage pancreatic cancer; obtain a high-resolution pancreatic protocol CT scan of the abdomen",
            "Dementia-related anorexia; initiate memantine therapy and recommend placement of a nasogastric tube"
        ],
        "answer": 0,
        "exp": "This patient's clinical presentation—including social withdrawal, insomnia (early morning awakenings), complaints of tasteless food (anhedonia affecting taste), and a high **Geriatric Depression Scale (GDS) score of {gds_score}/15** (with a score >5 indicating probable depression)—strongly points to **depression** as the cause of unintentional weight loss. Depression is the **most common psychological cause** of weight loss in older adults (under the classic ''9 Ds'' framework: Dementia, Depression, Disease [chronic], Dentition, Dysphagia, Dysgeusia, Drugs, Diarrhea, Dysfunction). The management strategy should address the depression both non-pharmacologically (social engagement, therapy) and pharmacologically. **Mirtazapine** (a noradrenergic and specific serotonergic antidepressant) is the drug of choice in this clinical scenario because its side effect profile includes **somnolence (aids sleep if taken at bedtime) and increased appetite/weight gain**, addressing multiple symptoms simultaneously. SSRIs like Fluoxetine should generally be avoided in weight-losing elderly patients as they can cause weight loss and nausea."
    },
    # TEMPLATE 5: APPRORIATE INTERVENTIONS - PEG TUBE AVOIDANCE IN DEMENIA
    {
        "q": "A {age}-old {gender} with advanced, end-stage Alzheimer''s dementia is admitted to the hospital with aspiration pneumonia and severe protein-calorie malnutrition. The patient has a BMI of **{bmi}**, has lost {weight_loss} lbs over the past {duration} months, and is refusing to swallow food or liquids, spitting out meals. The family asks about placing a **percutaneous endoscopic gastrostomy (PEG) tube** to supply nutrition and extend life. Based on current clinical guidelines and evidence, which of the following is the most appropriate recommendation for the management of this patient?",
        "options": [
            "Recommend against PEG tube placement; instead, utilize careful hand-feeding (comfort feeding) as tube feeding does not prolong survival, reduce aspiration risk, or improve quality of life in advanced dementia",
            "Recommend immediate PEG tube placement, as it is the only way to prevent recurrent aspiration pneumonia and promote decubitus ulcer healing",
            "Recommend placing a temporary nasogastric (NG) tube and transitioning to a permanent PEG tube within 2 weeks",
            "Recommend total parenteral nutrition (TPN) through a peripherally inserted central catheter (PICC) line as a safer alternative to PEG tube placement",
            "Agree to PEG tube placement only if the patient has a surrogate decision-maker who signs a consent form stating they understand it is solely for cosmetic purposes"
        ],
        "answer": 0,
        "exp": "For patients with **advanced, end-stage dementia**, clinical guidelines from the American Geriatrics Society (AGS), American Academy of Hospice and Palliative Medicine, and the Choosing Wisely campaign **strongly recommend against the placement of percutaneous feeding tubes (PEG or NG)**. Multiple high-quality clinical studies have demonstrated that tube feeding in patients with advanced dementia **does NOT prolong survival, does NOT prevent aspiration pneumonia** (as patients still aspirate oral secretions and gastric contents), **does NOT improve nutritional status or heal pressure injuries**, and is associated with significant complications (e.g., tube displacement, local infection, diarrhea, and the frequent need for physical restraints to prevent the patient from pulling the tube out). The recommended approach is **careful, patient-centered hand-feeding (comfort feeding)**, offering small amounts of preferred foods slowly, which focuses on comfort, quality of life, and human interaction while respecting natural disease progression."
    },
    # TEMPLATE 6: REFEEDING SYNDROME PATHOPHYSIOLOGY & ELECTROLYTES
    {
        "q": "A {age}-old {gender} with severe chronic malnutrition secondary to severe self-neglect and isolated living conditions is admitted to the hospital. {pronoun_cap} has a BMI of **{bmi}** and is started on high-calorie enteral feeds. Within {duration} days of initiating nutrition, the patient develops muscle weakness, confusion, new-onset cardiac arrhythmias, and respiratory distress. Laboratory evaluation reveals: **phosphate {phos} mg/dL** (normal: 2.5-4.5), **potassium {potass} mEq/L** (normal: 3.5-5.0), and **magnesium {mag} mEq/L** (normal: 1.5-2.5). Which of the following describes the pathophysiology of this condition and the most critical initial management step?",
        "options": [
            "Refeeding Syndrome; glucose intake triggers an insulin surge causing intracellular shifts of phosphate, potassium, and magnesium; manage by stopping or slowing feeds, checking/replating thiamine, and aggressively correcting electrolytes",
            "Acute kidney injury; excessive protein load causes fluid and electrolyte retention; manage with urgent hemodialysis",
            "Hyperosmolar hyperglycemic state (HHS); high glucose intake causes extracellular shifts of fluid; manage with high-rate saline infusion",
            "Adrenal crisis; stress of refeeding causes cortisol depletion; manage with high-dose intravenous hydrocortisone",
            "Sepsis from contaminated enteral formula; manage with broad-spectrum intravenous antibiotics and central venous line insertion"
        ],
        "answer": 0,
        "exp": "This patient is suffering from **Refeeding Syndrome**, a potentially fatal condition that occurs when nutritional replenishment is initiated in patients with severe, chronic malnutrition (e.g., due to starvation, alcoholism, anorexia nervosa, or prolonged illness). During prolonged starvation, the body''s intracellular stores of electrolytes (especially phosphorus, potassium, and magnesium) are depleted, though serum levels may remain normal. When carbohydrate/glucose intake is reintroduced, it stimulates a **massive insulin surge**. Insulin drives glucose and these intracellular electrolytes (**phosphate, potassium, and magnesium**) from the extracellular space into the cells. This results in severe extracellular **hypophosphatemia (phosphate of {phos} mg/dL), hypokalemia (potassium of {potass} mEq/L), and hypomagnesemia (magnesium of {mag} mEq/L)**. The drop in phosphate impairs cellular energy (ATP) production, leading to respiratory failure, muscle weakness, confusion, and lethal cardiac arrhythmias. The most critical management is to **''start low and go slow''** with nutrition, check and administer **thiamine** (to prevent Wernicke encephalopathy), monitor electrolytes closely (every 12-24 hours), and aggressively replace phosphate, potassium, and magnesium."
    },
    # TEMPLATE 7: APPETITE STIMULANTS IN ELDERLY (RISKS VS BENEFITS)
    {
        "q": "A {age}-old {gender} with a {weight_loss}-lb unintentional weight loss over the past year and severe chronic anorexia is evaluated in the clinic. The family is extremely anxious about the patient''s declining intake and requests a prescription for **Megestrol acetate** to boost appetite. The patient has a history of deep vein thrombosis (DVT) 2 years ago, chronic venous stasis, and moderate bilateral lower extremity edema. Which of the following represents the best response to the family''s request regarding the use of Megestrol acetate in this patient?",
        "options": [
            "Megestrol acetate is contraindicated due to a high risk of thromboembolism (DVT/PE), fluid retention, and adrenal insufficiency, while providing minimal long-term benefit on lean body mass; consider alternative strategies",
            "Megestrol acetate should be prescribed immediately at the maximum dose, as it is the most effective drug for building healthy muscle tissue in malnourished patients",
            "Megestrol acetate is safe and highly recommended for all elderly patients, but it must be co-administered with low-molecular-weight heparin to prevent DVT",
            "Megestrol acetate is an excellent first-line therapy, but it should only be used if the patient also has active hypercalcemia of malignancy",
            "Megestrol acetate is preferred over oral nutritional supplements because it is more cost-effective and has no known adverse effects in patients over 80"
        ],
        "answer": 0,
        "exp": "**Megestrol acetate** (a synthetic progestational agent) is widely prescribed as an appetite stimulant, but it is listed in the **Beers Criteria** as a potentially inappropriate medication in older adults due to its **unfavorable risk-to-benefit ratio**. In the elderly, megestrol acetate does not significantly increase lean body mass (the weight gain is primarily fat and fluid retention) and does not improve quality of life or survival. More importantly, it carries significant risks: (1) **thromboembolism (DVT/PE)**, (2) **fluid retention and exacerbation of heart failure**, (3) **adrenal insufficiency** (due to its glucocorticoid-like activity, which can lead to cardiovascular collapse if stopped abruptly during stress), and (4) increased mortality in nursing home residents. In this patient with a history of DVT and venous stasis, megestrol acetate is strictly contraindicated. First-line management should focus on treating underlying causes, providing nutrient-dense finger foods, and optimizing social settings during meals."
    },
    # TEMPLATE 8: LAB MARKERS OF MALNUTRITION (ALBUMIN VS PREALBUMIN VS CRP)
    {
        "q": "A {age}-old {gender} is evaluated for malnutrition. Laboratory studies show: serum albumin **{albumin} g/dL** (normal: 3.5-5.0), prealbumin **{prealbumin} mg/dL** (normal: 20-40), and C-reactive protein (CRP) **{crp} mg/L** (normal: <5). Which of the following is the correct interpretation of these laboratory markers, and how does the elevated CRP affect the assessment of nutritional status?",
        "options": [
            "Albumin and prealbumin are negative acute-phase reactants; their synthesis in the liver is downregulated during systemic inflammation (indicated by elevated CRP), making them markers of inflammatory severity rather than pure nutritional status",
            "A low prealbumin always indicates severe protein deficiency and requires immediate TPN administration, regardless of the CRP level",
            "Albumin is an acute marker that changes daily, whereas prealbumin has a 20-day half-life and reflects long-term nutritional changes",
            "CRP is a nutritional marker that directly binds to dietary protein; its elevation indicates a high-protein diet that offsets the low albumin",
            "A low albumin with high CRP confirms a diagnosis of primary hypothyroidism and should be treated with levothyroxine"
        ],
        "answer": 0,
        "exp": "Serum proteins like **albumin** and **prealbumin (transthyretin)** have traditionally been used as biochemical markers of nutritional status. However, they are **negative acute-phase reactants**. This means that in the presence of systemic inflammation or infection (signaled by an **elevated CRP**), the liver downregulates the synthesis of these proteins in favor of positive acute-phase reactants (such as CRP, fibrinogen, and haptoglobin). Therefore, **a low albumin and prealbumin in an inflammatory state reflect the severity of the inflammatory response rather than the patient''s actual nutritional status or protein stores**. Additionally, albumin has a long half-life (~20 days), making it insensitive to acute nutritional changes, whereas prealbumin has a shorter half-life (~2 days), making it more useful for monitoring nutritional recovery *once inflammation has resolved* (CRP returns to normal)."
    },
    # TEMPLATE 9: MICRONUTRIENT DEFICIENCY IN GERIATRIC MALNUTRITION
    {
        "q": "A {age}-old {gender} presenting with significant unintentional weight loss is found to have poor oral intake and self-neglect. On physical exam, the patient is noted to have a **beefy red, painful tongue (glossitis)**, angular cheilitis, and hyperpigmentation of skin creases. Neurological exam reveals **decreased vibration and proprioception in the lower extremities** and mild cognitive impairment. Laboratory results show a macrocytic anemia with hypersegmented neutrophils. Which of the following micronutrient deficiencies is the most likely cause of this presentation, and what is the best diagnostic test to confirm it?",
        "options": [
            "Vitamin B12 (cobalamin) deficiency; confirm by checking serum Vitamin B12 level, and if borderline, obtain serum methylmalonic acid (MMA) and homocysteine levels",
            "Vitamin D deficiency; confirm by checking 1,25-dihydroxyvitamin D levels and obtaining an X-ray of the long bones",
            "Iron deficiency anemia; confirm by checking serum ferritin level and obtaining a bone marrow biopsy",
            "Zinc deficiency; confirm by checking serum zinc levels and performing a skin biopsy of the angular cheilitis",
            "Thiamine (Vitamin B1) deficiency; confirm by checking red blood cell transketolase activity and performing a lumbar puncture"
        ],
        "answer": 0,
        "exp": "This patient''s clinical presentation—macrocytic anemia, hypersegmented neutrophils, **glossitis (beefy red tongue)**, angular cheilitis, and **subacute combined degeneration of the spinal cord (loss of vibration and proprioception in the lower extremities due to posterior and lateral column demyelination)**—is classic for **Vitamin B12 (cobalamin) deficiency**. Cobalamin deficiency is common in older adults due to malnutrition, atrophic gastritis (causing decreased gastric acid and intrinsic factor production), or the use of medications like metformin or PPIs. Diagnostic confirmation involves checking the **serum Vitamin B12 level**. In patients with borderline B12 levels (200-400 pg/mL) who have clinical symptoms, obtaining **methylmalonic acid (MMA)** and **homocysteine** levels is crucial; elevated levels of both confirm cellular B12 deficiency (whereas in folate deficiency, only homocysteine is elevated)."
    },
    # TEMPLATE 10: DYSPHAGIA EVALUATION & DIETARY MODIFICATIONS
    {
        "q": "A {age}-old {gender} with a history of advanced Parkinson''s disease and a {weight_loss}-lb weight loss over the past 6 months is evaluated for progressive difficulty swallowing. The caregiver reports that the patient frequently coughs and clears {possessive} throat during meals, and has a ''wet-sounding'' voice after drinking water. Which of the following is the most appropriate initial evaluation, and what dietary recommendation is typically indicated to reduce aspiration risk?",
        "options": [
            "Perform a bedside swallow evaluation followed by a Videofluoroscopic Swallow Study (VFSS) or Fiberoptic Endoscopic Evaluation of Swallowing (FEES); recommend feeding modifications such as thickened liquids (honey or nectar consistency) and altered food textures (mechanical soft or pureed)",
            "Order a chest CT scan and perform a bronchoscopy to check for silent aspiration before modifying the diet",
            "Advise the patient to drink large quantities of thin liquids quickly to wash down solid food and clear the throat",
            "Prescribe a course of prophylactic oral antibiotics to prevent aspiration pneumonia and continue a regular diet",
            "Recommend immediate PEG tube placement as the patient has a neurodegenerative dysphagia that cannot be compensated for"
        ],
        "answer": 0,
        "exp": "This patient is exhibiting classic signs of **oropharyngeal dysphagia** (coughing during meals, throat clearing, and a ''wet-sounding'' post-swallow voice), which is common in neurodegenerative conditions like Parkinson''s disease, stroke, and dementia. Oropharyngeal dysphagia carries a high risk of **silent or overt aspiration**, leading to aspiration pneumonia, malnutrition, and weight loss. The initial evaluation should include a **bedside swallow assessment** by a speech-language pathologist (SLP). To objectively evaluate the mechanics of the swallow, identify silent aspiration, and test compensatory strategies, a **Videofluoroscopic Swallow Study (VFSS, also known as a modified barium swallow)** or a **Fiberoptic Endoscopic Evaluation of Swallowing (FEES)** is indicated. Management involves dietary modifications such as **thickened liquids** (nectar or honey consistency to slow the bolus transit time) and **altered food textures** (e.g., pureed or mechanical soft) along with chin-tuck maneuvers during swallowing."
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

while counter < 300:
    for t_idx, t in enumerate(templates):
        if counter >= 300:
            break
        age = random.randint(66, 96)
        gp = random.choice(genders_pool)
        duration = random.randint(3, 9)
        weight_loss = random.randint(12, 35)
        weight_loss_kg = round(weight_loss * 0.453592, 1)
        baseline = random.randint(120, 190)
        pct_loss = round((weight_loss / baseline) * 100, 1)
        
        # cachexia inflammatory markers
        crp = round(random.uniform(12.5, 45.0), 1)
        il6 = round(random.uniform(8.0, 28.0), 1)
        
        # Microcytic anemia
        hb = round(random.uniform(8.5, 11.2), 1)
        mcv = random.randint(68, 77)
        
        # Depression
        gds_score = random.randint(7, 14)
        
        # Nutrition and refeeding indicators
        bmi = round(random.uniform(14.5, 18.2), 1)
        phos = round(random.uniform(1.2, 2.1), 1)
        potass = round(random.uniform(2.6, 3.2), 1)
        mag = round(random.uniform(1.0, 1.4), 1)
        
        # Nutrition labs
        albumin = round(random.uniform(1.9, 3.1), 1)
        prealbumin = random.randint(9, 17)

        q_text = t['q'].format(
            age=age, gender=gp['gender'], pronoun=gp['pronoun'], pronoun_cap=gp['pronoun_cap'],
            possessive=gp['possessive'], possessive_cap=gp['possessive_cap'],
            duration=duration, weight_loss=weight_loss, weight_loss_kg=weight_loss_kg,
            baseline=baseline, pct_loss=pct_loss, crp=crp, il6=il6, hb=hb, mcv=mcv,
            gds_score=gds_score, bmi=bmi, phos=phos, potass=potass, mag=mag,
            albumin=albumin, prealbumin=prealbumin
        )

        opts_formatted = []
        for o in t['options']:
            o_fmt = o.format(
                duration=duration, weight_loss=weight_loss,
                crp=crp, il6=il6, hb=hb, mcv=mcv, gds_score=gds_score, bmi=bmi,
                phos=phos, potass=potass, mag=mag, albumin=albumin, prealbumin=prealbumin
            )
            opts_formatted.append(o_fmt)

        exp_formatted = t['exp'].format(
            duration=duration, weight_loss=weight_loss,
            crp=crp, il6=il6, hb=hb, mcv=mcv, gds_score=gds_score, bmi=bmi,
            phos=phos, potass=potass, mag=mag, albumin=albumin, prealbumin=prealbumin
        )

        correct_opt = opts_formatted[t['answer']]
        random.shuffle(opts_formatted)
        new_ans_idx = opts_formatted.index(correct_opt)

        q_esc = q_text.replace("'", "''")
        opts_json = json.dumps(opts_formatted).replace("'", "''")
        exp_esc = exp_formatted.replace("'", "''")

        mcq_str = f"    (v_topic_id, '{q_esc}', '{opts_json}'::jsonb, {new_ans_idx}, '{exp_esc}')"

        if q_text not in seen_questions:
            seen_questions.add(q_text)
            mcqs.append(mcq_str)
            counter += 1

out_file = r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260520_geri_malnutrition_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Geriatrics: Malnutrition & unintentional weight loss\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\nDECLARE\n    v_topic_id UUID;\nBEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'geri-malnutrition' LIMIT 1;\n")
    f.write("    IF v_topic_id IS NULL THEN\n        RAISE EXCEPTION 'Topic geri-malnutrition not found.';\n    END IF;\n\n")
    f.write("    DELETE FROM mcqs WHERE topic_id = v_topic_id;\n\n")
    f.write("    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES\n")
    for i, m in enumerate(mcqs):
        if i < len(mcqs) - 1:
            f.write(m + ",\n")
        else:
            f.write(m + ";\n")
    f.write("END $$;\nCOMMIT;\n")

print(f"Generated {len(mcqs)} MCQs to {out_file}")
