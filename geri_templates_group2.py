# Group 2 Geriatrics Templates
# Covers: PK/PD Shifts, Urinary Incontinence, Pressure Ulcers, Malnutrition

templates_pkpd = [
    # 1. Volume of distribution changes
    {
        "title": "Benzodiazepine Accumulation and Body Fat",
        "age_range": (65, 85),
        "scenario": (
            "A {age}-year-old {gender} is brought to the clinic by {possessive} child due to progressive daytime drowsiness and lethargy over the past 2 weeks. The child notes the patient was started on diazepam for anxiety {duration} days ago. Physical exam shows a healthy older adult with a body weight of 170 lbs. There are no focal motor deficits, but the patient has significant psychomotor slowing and unsteady gait."
        ),
        "questions": [
            {
                "q": "What is the primary age-related physiological mechanism explaining this clinical presentation?",
                "options": [
                    "An increased total body fat percentage expanding the volume of distribution for lipophilic drugs like diazepam, combined with decreased hepatic Phase I clearance, resulting in a prolonged elimination half-life and drug accumulation",
                    "A selective upregulation of GABA-A receptors in the elderly leading to increased receptor affinity for benzodiazepines",
                    "A decrease in total body fat percentage causing higher peak serum drug levels",
                    "A rapid acceleration of hepatic Phase I CYP450 metabolism leading to toxic levels of active metabolites",
                    "An increase in serum albumin levels resulting in a larger bound inactive fraction of diazepam"
                ],
                "answer": 0,
                "exp": "Aging is associated with a decrease in total body water/lean mass and an increase in total body fat percentage. Highly lipophilic drugs (like diazepam) distribute widely into adipose tissue, expanding their volume of distribution (Vd). This, combined with age-related GFR/hepatic clearance decline, prolongs their half-life, causing drug accumulation."
            },
            {
                "q": "Which of the following benzodiazepines is preferred in older adults because it bypasses Phase I CYP450 oxidation and undergoes direct Phase II conjugation, avoiding toxic accumulation?",
                "options": [
                    "Lorazepam",
                    "Diazepam",
                    "Chlordiazepoxide",
                    "Flurazepam",
                    "Clonazepam"
                ],
                "answer": 0,
                "exp": "The preferred benzodiazepines in the elderly are Lorazepam, Oxazepam, and Temazepam (the 'LOT' drugs) because they bypass Phase I hepatic oxidation (which declines with age) and undergo direct Phase II conjugation (glucuronidation), which remains preserved."
            },
            {
                "q": "Which of the following clinical tools is most appropriate for a pharmacist or physician to consult when evaluating a multi-drug regimen for potentially inappropriate medications in an elderly patient?",
                "options": [
                    "AGS Beers Criteria",
                    "Braden Scale Tool",
                    "Mini Nutritional Assessment",
                    "HAS-BLED Score",
                    "Gage Score"
                ],
                "answer": 0,
                "exp": "The AGS Beers Criteria is the gold-standard reference list of medications that should be avoided or used with caution in older adults due to high risk of adverse drug reactions, including falls and cognitive decline."
            }
        ]
    },
    # 2. Decreased albumin binding
    {
        "title": "Phenytoin Toxicity and Serum Albumin",
        "age_range": (65, 90),
        "scenario": (
            "A {age}-year-old {gender} with a history of focal epilepsy and severe osteoarthritis is admitted to the hospital due to acute onset of ataxia, slurred speech, and nystagmus. The patient has been taking phenytoin for epilepsy and has a history of chronic malnutrition. Labs show a total serum phenytoin level of 14 µg/mL (normal 10-20 µg/mL), but serum albumin is significantly reduced at 2.2 g/dL."
        ),
        "questions": [
            {
                "q": "What is the best explanation for this patient's phenytoin toxicity despite a normal total serum phenytoin level?",
                "options": [
                    "Decreased serum albumin levels lead to a reduced protein-bound fraction and a significantly increased free (active) fraction of phenytoin, which drives toxicity; measure the free phenytoin level and adjust the dose",
                    "The patient has developed an acute allergic cerebellar reaction to phenytoin that is independent of serum levels; discontinue the drug immediately",
                    "Hypoalbuminemia increases the renal clearance of phenytoin, leading to subtherapeutic anticonvulsant activity",
                    "A normal total level rule out phenytoin toxicity; the patient's symptoms are caused by an acute ischemic stroke in the posterior fossa",
                    "Malnutrition has caused an upregulation of phenytoin receptors in the central nervous system"
                ],
                "answer": 0,
                "exp": "Phenytoin is highly protein-bound (primarily to albumin). In patients with hypoalbuminemia (due to malnutrition or liver disease), the bound fraction decreases, leading to a higher 'free' (biologically active) fraction. Since standard assays measure total phenytoin, a normal level can mask a toxic free level. Dosing should be guided by free phenytoin levels or corrected using the Winter-Tozer equation."
            },
            {
                "q": "What is the standard formula used to estimate the corrected phenytoin concentration in a patient with hypoalbuminemia?",
                "options": [
                    "Winter-Tozer Equation",
                    "Cockcroft-Gault Equation",
                    "CKD-EPI Equation",
                    "Friedewald Equation",
                    "Henderson-Hasselbalch Equation"
                ],
                "answer": 0,
                "exp": "The Winter-Tozer equation is: Corrected Phenytoin = Total Phenytoin / ((0.2 * Albumin) + 0.1). It is used to estimate the active phenytoin level in patients with serum albumin < 3.2 g/dL."
            },
            {
                "q": "Which of the following represents a classic clinical sign of toxic phenytoin exposure that is easily assessed at the bedside?",
                "options": [
                    "Horizontal gaze nystagmus and cerebellar ataxia",
                    "Bilateral pupillary constriction (miosis) and bradycardia",
                    "Palpable purpura on the lower extremities",
                    "Acute urinary retention and abdominal distension",
                    "Generalized flaccid paralysis and hyperpyrexia"
                ],
                "answer": 0,
                "exp": "Phenytoin toxicity primarily manifests as cerebellar and vestibular symptoms: horizontal gaze nystagmus, slurred speech, dysmetria, and ataxia. In severe cases, it can progress to lethargy, coma, or seizures."
            }
        ]
    },
    # 3. Renal dosing adjustment
    {
        "title": "Gentamicin Toxicity and the Decreased GFR",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with a severe urinary tract infection is started on intravenous gentamicin therapy. The patient's baseline serum creatinine is 0.9 mg/dL. On post-treatment day 4, the patient develops severe tinnitus, vertigo, and a sudden drop in urine output. Serum creatinine has risen to 2.3 mg/dL."
        ),
        "questions": [
            {
                "q": "What is the primary cause of this patient's clinical deterioration, and how could it have been prevented?",
                "options": [
                    "Aminoglycoside-induced nephrotoxicity and ototoxicity; older adults have a physiological decline in GFR despite a 'normal' baseline creatinine due to sarcopenia, requiring GFR calculation and dosage adjustments",
                    "Acute bacterial pyelonephritis progression; gentamicin is ineffective and should have been replaced with high-dose ciprofloxacin",
                    "A normal age-related reaction to intravenous antibiotics; continue gentamicin and prescribe daily oral meclizine for vertigo",
                    "Allergic interstitial nephritis; immediate administration of high-dose systemic corticosteroids while continuing gentamicin",
                    "Bilateral acoustic neuroma formation triggered by the systemic inflammatory response"
                ],
                "answer": 0,
                "exp": "Aminoglycosides (gentamicin) are highly nephrotoxic and ototoxic, and are cleared exclusively by the kidney. Because baseline muscle mass is lower in the elderly (sarcopenia), serum creatinine can appear normal even with significant GFR decline. Failing to calculate GFR and adjust dosage leads to toxic accumulation."
            },
            {
                "q": "What is the primary site of cellular damage in aminoglycoside-induced nephrotoxicity?",
                "options": [
                    "Proximal convoluted tubule cells",
                    "Glomerular basement membrane",
                    "Distal convoluted tubule cells",
                    "Collecting duct aquaporin channels",
                    "Renal pelvis vascular endothelial cells"
                ],
                "answer": 0,
                "exp": "Aminoglycosides are filtered by the glomerulus and actively reabsorbed by the proximal convoluted tubule (PCT) cells, where they accumulate in lysosomes and cause necrosis (acute tubular necrosis/ATN)."
            },
            {
                "q": "Which of the following is the most sensitive method of monitoring for early vestibular ototoxicity in a patient receiving an extended course of aminoglycoside therapy?",
                "options": [
                    "Serial audiometry and vestibular function testing",
                    "Bedside finger-to-nose testing weekly",
                    "Ophthalmic evaluation for visual acuity changes",
                    "Continuous electrocardiogram (EKG) monitoring",
                    "Checking serum calcium levels daily"
                ],
                "answer": 0,
                "exp": "Vestibular and cochlear ototoxicity are often irreversible. Serial audiometry and vestibular function testing are the most sensitive methods to detect early, subclinical damage to the hair cells before permanent hearing loss or severe ataxia develops."
            }
        ]
    },
    # 4. Hepatic first-pass metabolism reduction
    {
        "title": "Morphine and Decreased First-Pass Metabolism",
        "age_range": (65, 90),
        "scenario": (
            "A {age}-year-old {gender} with severe chronic osteoarthritic hip pain is prescribed oral morphine sulfate. The patient has no history of renal or hepatic disease, and is started on a standard 'young adult' dose. 3 days later, the family brings the patient to the emergency department due to extreme somnolence, pinpoint pupils, and shallow breathing (respiratory rate 8/min)."
        ),
        "questions": [
            {
                "q": "What is the most likely pharmacological explanation for this patient's respiratory depression?",
                "options": [
                    "Age-related decrease in hepatic blood flow and liver mass, reducing the first-pass metabolism of morphine and leading to significantly higher systemic bioavailability and blood levels",
                    "A complete lack of renal excretion of morphine due to severe age-related structural glomuerular necrosis",
                    "An immediate, severe allergic hypersensitivity reaction to morphine; administer intravenous epinephrine",
                    "Increased pulmonary clearance of morphine leading to toxic alveolar concentrations",
                    "A progressive upregulation of mu-opioid receptors in the respiratory center of the brainstem"
                ],
                "answer": 0,
                "exp": "Aging is associated with a 30-40% reduction in hepatic blood flow and liver mass. For drugs with a high hepatic extraction ratio that undergo significant first-pass metabolism (like morphine, propranolol, or nitrates), this reduction leads to increased systemic bioavailability, higher serum levels, and a much higher risk of toxicity."
            },
            {
                "q": "Which of the following represents the immediate antidote of choice for this patient's opioid-induced respiratory depression?",
                "options": [
                    "Intravenous naloxone",
                    "Intravenous flumazenil",
                    "Intramuscular epinephrine",
                    "Intravenous acetylcysteine",
                    "Oral activated charcoal"
                ],
                "answer": 0,
                "exp": "Naloxone is a competitive mu-opioid receptor antagonist that rapidly reverses all opioid effects, including respiratory depression and sedation. It must be administered in small, titrated doses to avoid triggering acute withdrawal and severe pain."
            },
            {
                "q": "Which of the following oral opioids has no active metabolites and undergoes direct Phase II glucuronidation, making it generally safer in older adults with mild renal impairment?",
                "options": [
                    "Hydromorphone",
                    "Morphine",
                    "Meperidine",
                    "Codeine",
                    "Propoxyphene"
                ],
                "answer": 0,
                "exp": "Hydromorphone undergoes direct Phase II glucuronidation and has no major active neurotoxic metabolites, making it generally preferred over morphine (whose active metabolite morphine-6-glucuronide accumulates in renal impairment) or meperidine."
            }
        ]
    },
    # 5. Increased CNS receptor sensitivity
    {
        "title": "Benzodiazepine Sensitivity at the GABA Receptor",
        "age_range": (65, 85),
        "scenario": (
            "A {age}-year-old {gender} with a history of mild anxiety is started on a low-dose benzodiazepine (lorazepam 0.5 mg). Despite the low dose and normal liver/kidney function tests, the patient becomes highly disoriented, has slurred speech, and falls while attempting to walk to the bathroom. The family is confused because the dose was 'so low.'"
        ),
        "questions": [
            {
                "q": "What pharmacological principle best explains this exaggerated response in a healthy older adult?",
                "options": [
                    "Age-related pharmacodynamic changes: increased CNS sensitivity to psychotropic drugs due to alterations in blood-brain barrier permeability and GABA-A receptor response, causing an exaggerated clinical effect at lower doses",
                    "Rapid, toxic accumulation of lorazepam in the gallbladder causing secondary encephalopathy",
                    "Severe allergic vascular reaction leading to transient cerebellar ischemia",
                    "An accelerated rate of renal excretion causing a paradoxical central stimulation",
                    "Complete destruction of the cerebral cortex by the low-dose benzodiazepine"
                ],
                "answer": 0,
                "exp": "Older adults exhibit significant pharmacodynamic shifts, including an **increased sensitivity of the central nervous system** to benzodiazepines, sedative-hypnotics, and anticholinergics. This is driven by changes in receptor sensitivity and a more permeable blood-brain barrier, leading to exaggerated sedation and ataxia even with 'normal' or 'low' therapeutic serum drug concentrations."
            },
            {
                "q": "Which of the following represents a classic pharmacodynamic age-related change in older adults?",
                "options": [
                    "Increased sensitivity to sedative-hypnotics (benzodiazepines) and decreased sensitivity to beta-adrenergic agonists/antagonists",
                    "Decreased sensitivity to all psychotropic drugs and increased sensitivity to beta-blockers",
                    "Increased sensitivity to both benzodiazepines and beta-agonists",
                    "Complete insensitivity to all anticholinergic side effects",
                    "Upregulation of cardiac beta-1 receptors causing chronic tachycardia"
                ],
                "answer": 0,
                "exp": "Geriatric pharmacodynamics is characterized by: (1) increased sensitivity to CNS-depressants, sedative-hypnotics, and anticholinergics, and (2) decreased sensitivity to beta-adrenergic stimulation (desensitization of beta-receptors, making both beta-agonists like albuterol and beta-blockers like metoprolol less effective)."
            },
            {
                "q": "Which of the following is the specific benzodiazepine receptor antagonist that can be used to reverse benzodiazepine-induced sedation, though it carries a high risk of triggering seizures in chronic users?",
                "options": [
                    "Flumazenil",
                    "Naloxone",
                    "Physostigmine",
                    "Pralidoxime",
                    "Atropine"
                ],
                "answer": 0,
                "exp": "Flumazenil is a competitive antagonist at the benzodiazepine binding site on the GABA-A receptor. It is used to reverse benzodiazepine overdose but is contraindicated in patients with chronic benzodiazepine dependence due to the high risk of triggering severe, refractory withdrawal seizures."
            }
        ]
    },
    # 6. Narrow therapeutic index drugs
    {
        "title": "Digoxin Toxicity in the Aging Heart",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with a history of heart failure and chronic atrial fibrillation presents with a 3-day history of progressive nausea, anorexia, confusion, and visual changes, describing seeing 'yellow halos' around light fixtures. Current medications include digoxin. Labs show a serum digoxin level of 2.6 ng/mL (therapeutic range 0.5-0.9 ng/mL) and a serum creatinine of 1.8 mg/dL."
        ),
        "questions": [
            {
                "q": "What is the primary cause of this patient's digoxin toxicity, and how is it clinically managed?",
                "options": [
                    "Digoxin accumulation due to a physiological decline in GFR (as digoxin is cleared renally) combined with its narrow therapeutic index; discontinue digoxin, correct any electrolyte abnormalities, and administer digoxin-specific antibody fragments (Digibind) for severe toxicity",
                    "A normal age-related reaction to heart failure medications; continue digoxin and prescribe ondansetron for nausea",
                    "Primary digitalis allergy; immediately administer high-dose intravenous Vitamin K and schedule an emergent pacemaker",
                    "Digoxin destruction by the liver due to Phase II hepatic conjugation hyperactivation; double the digoxin dose",
                    "A cute ischemic stroke in the occipital lobe; activate the stroke team for tPA"
                ],
                "answer": 0,
                "exp": "Digoxin is a narrow therapeutic index drug cleared renally. Normal aging reduces GFR, leading to digoxin accumulation. Symptoms of toxicity include gastrointestinal distress (nausea/anorexia), cognitive changes, and visual disturbances (xanthopsia/yellow halos). Treatment involves stopping the drug and administering Digibind in severe cases."
            },
            {
                "q": "Which of the following electrolyte abnormalities significantly increases the risk of digoxin toxicity by promoting digoxin binding to the Na+/K+ ATPase pump?",
                "options": [
                    "Hypokalemia",
                    "Hyperkalemia",
                    "Hypernatremia",
                    "Hypocalcemia",
                    "Hypermagnesemia"
                ],
                "answer": 0,
                "exp": "Digoxin binds competitively to the potassium binding site of the Na+/K+ ATPase pump. Hypokalemia (commonly caused by concurrent loop diuretic use) reduces this competition, allowing more digoxin to bind, which dramatically increases the risk of toxicity even with 'borderline' therapeutic serum levels."
            },
            {
                "q": "What is the classic electrocardiogram (EKG) finding associated with therapeutic digoxin use (digitalis effect), which should not be confused with active digoxin toxicity?",
                "options": [
                    "Downsloping ST-segment depression with a 'scooped' appearance (sagging ST segment)",
                    "Severe prolongation of the QTc interval > 500 ms",
                    "Bizarre, alternating bundle branch block (electrical alternans)",
                    "Sudden-onset polymorphic ventricular tachycardia (torsades de pointes)",
                    "Complete absence of P waves with a regular ventricular response of 120 bpm"
                ],
                "answer": 0,
                "exp": "The 'digitalis effect' is characterized by a distinctive sagging or scooped ST-segment depression (resembling a Salvador Dali mustache) in lateral leads. It indicates therapeutic digitalis presence, not active toxicity. Toxicity causes arrhythmias (e.g., PVCs, bi-directional VT, heart block)."
            }
        ]
    },
    # 7. Drug clearance and half-life prolongation
    {
        "title": "NSAID Accumulation and Renal Impairment",
        "age_range": (65, 90),
        "scenario": (
            "A {age}-year-old {gender} presents with a 1-week history of severe epigastric pain, dark stools, and oliguria. The patient has been taking high-dose naproxen for chronic back pain for the past 2 weeks. Physical exam shows abdominal tenderness and bilateral pedal edema. Labs show Creatinine of 2.5 mg/dL (baseline 1.0) and severe anemia."
        ),
        "questions": [
            {
                "q": "What is the primary pharmacological basis for this patient's acute presentation?",
                "options": [
                    "NSAID-induced acute kidney injury (AKI) and gastric mucosal erosion; older adults have prolonged drug half-lives due to reduced clearance, increasing their susceptibility to prostaglandin-mediated side effects",
                    "A primary allergic reaction to naproxen causing acute liver failure and secondary uremia",
                    "Normal age-related gastric mucosal hypersecretion; continue naproxen and add daily high-dose ranitidine",
                    "Renal artery embolism; perform an immediate surgical embolectomy and double the naproxen dose",
                    "Complete genetic deletion of the cyclooxygenase-2 (COX-2) enzyme in the gastrointestinal tract"
                ],
                "answer": 0,
                "exp": "Older adults have a physiological decline in GFR, which prolongs the elimination half-life of NSAIDs. Chronic NSAID accumulation blocks renal prostaglandins (causing afferent vasoconstriction, AKI, and fluid retention) and gastric prostaglandins (impairing mucosal protection, causing bleeding ulcers)."
            },
            {
                "q": "Which of the following represents the primary mechanism of NSAID-induced gastric mucosal injury in older adults?",
                "options": [
                    "Inhibition of COX-1, decreasing the synthesis of protective prostaglandins (PGE2, PGI2) that stimulate bicarbonate and mucus secretion and maintain mucosal blood flow",
                    "Direct chemical necrosis of the gastric parietal cells due to the highly basic pH of NSAIDs",
                    "Inhibition of salivary amylase, leading to incomplete carbohydrate digestion in the stomach",
                    "Upregulation of gastrin receptors causing massive hydrochloric acid hypersecretion",
                    "Direct mucosal invasion by Helicobacter pylori stimulated by the NSAID molecule"
                ],
                "answer": 0,
                "exp": "NSAIDs block COX-1, the constitutive enzyme that synthesizes prostaglandins in the stomach. These prostaglandins are essential for mucosal defense: they stimulate mucus and bicarbonate secretion, maintain mucosal blood flow, and limit acid production. Loss of these prostaglandins leads to mucosal erosion and bleeding."
            },
            {
                "q": "Which of the following gastroprotective strategies is recommended if chronic NSAID use is absolutely unavoidable in an older adult with high GI risk?",
                "options": [
                    "Co-prescribe a proton pump inhibitor (e.g., omeprazole) or use a selective COX-2 inhibitor (e.g., celecoxib) at the lowest effective dose",
                    "Co-prescribe high-dose daily oral calcium carbonate and ensure absolute bed rest",
                    "Co-prescribe daily oral diphenhydramine and restrict all dietary fat",
                    "Ensure the patient takes the NSAID with a double shot of vinegar to promote stomach acidity",
                    "There are no effective strategies; NSAIDs are strictly contraindicated and cannot be used under any circumstances"
                ],
                "answer": 0,
                "exp": "For high-risk patients who must take an NSAID, co-prescribing a PPI (omeprazole) or using a selective COX-2 inhibitor (celecoxib, which spares gastric COX-1) reduces GI toxicity. However, COX-2 inhibitors still carry significant renal and cardiovascular risks."
            }
        ]
    },
    # 8. Altered bioavailability from decreased gastric acid
    {
        "title": "Achlorhydria and Iron Malabsorption",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with a history of chronic PPI use (omeprazole 40 mg daily for 5 years) presents with progressive fatigue and shortness of breath. The patient has a balanced diet and no history of bleeding. Labs show a microcytic anemia, low serum iron, and a very low ferritin level of 12 ng/mL."
        ),
        "questions": [
            {
                "q": "What is the primary cause of this patient's iron deficiency anemia, and how is it managed?",
                "options": [
                    "PPI-induced achlorhydria (lack of gastric acid) preventing the dissociation and reduction of dietary non-heme iron into its absorbable form; taper and discontinue omeprazole, and supplement with oral iron along with ascorbic acid (Vitamin C)",
                    "Severe occult gastrointestinal bleeding driven exclusively by a mechanical PPI toxicity in the duodenum",
                    "Normal age-related atrophy of the bone marrow erythroblasts; proceed with immediate blood transfusions",
                    "Genetic mutation of the transferrin receptor causing complete iron excretion in the urine",
                    "Primary malabsorption of all dietary proteins and fats due to a pancreatic atrophy"
                ],
                "answer": 0,
                "exp": "Non-heme iron in food is ferric (Fe3+). It requires an acidic gastric environment to be dissolved and reduced to ferrous (Fe2+), which is the form absorbed in the duodenum. PPIs raise gastric pH, preventing this process and causing iron deficiency. Co-administering Vitamin C (an acidifier) helps restore absorption."
            },
            {
                "q": "Which of the following forms of calcium supplements is preferred in older adults with achlorhydria (or those on PPIs) because it does not require an acidic gastric pH for dissolution and absorption?",
                "options": [
                    "Calcium citrate",
                    "Calcium carbonate",
                    "Calcium phosphate",
                    "Calcium gluconate",
                    "Oyster shell calcium"
                ],
                "answer": 0,
                "exp": "Calcium carbonate requires a highly acidic environment to dissolve and release ionized calcium. In patients with achlorhydria or on PPIs, its absorption is severely impaired. Calcium citrate does not require acid and is absorbed normally in these patients."
            },
            {
                "q": "Which of the following diagnostic tests is the most sensitive and specific to differentiate iron deficiency anemia from anemia of chronic disease in an older adult?",
                "options": [
                    "Serum ferritin level (ferritin < 30 ng/mL confirms iron deficiency)",
                    "Total serum iron level alone",
                    "Mean corpuscular volume (MCV) alone",
                    "Peripheral blood smear showing target cells",
                    "Bone marrow biopsy showing ring sideroblasts"
                ],
                "answer": 0,
                "exp": "Ferritin is the primary intracellular iron storage protein. A low serum ferritin (< 30 ng/mL) is highly specific for iron deficiency anemia. Anemia of chronic disease presents with normal or elevated ferritin because it is an acute-phase reactant, reflecting locked-away iron stores."
            }
        ]
    },
    # 9. Protein binding displacement with polypharmacy
    {
        "title": "Warfarin and Sulfonamide Interaction",
        "age_range": (65, 90),
        "scenario": (
            "A {age}-year-old {gender} taking warfarin for atrial fibrillation is diagnosed with a urinary tract infection and is prescribed trimethoprim-sulfamethoxazole (TMP-SMX). 4 days later, the patient is admitted with a massive epistaxis and severe hematuria. Labs show an INR of 8.5 (therapeutic range 2.0-3.0)."
        ),
        "questions": [
            {
                "q": "What is the primary pharmacological mechanism behind this dangerous drug interaction?",
                "options": [
                    "TMP-SMX displaces warfarin from its albumin binding sites (increasing the free active fraction) and inhibits CYP2C9 (the primary enzyme that metabolizes active S-warfarin), leading to toxic warfarin levels",
                    "TMP-SMX directly stimulates the synthesis of clotting factors in the liver, causing a paradoxical rebound anticoagulation",
                    "Sulfamethoxazole binds directly to Vitamin K in the gut, completely preventing its bacterial synthesis",
                    "TMP-SMX causes acute renal necrosis, preventing the renal excretion of warfarin",
                    "The drug combination causes a primary activation of the plasminogen receptors on the vascular endothelium"
                ],
                "answer": 0,
                "exp": "TMP-SMX is a highly protein-bound drug that displaces warfarin from albumin, raising its free active fraction. More importantly, SMX is a potent inhibitor of CYP2C9, the hepatic enzyme that metabolizes the active S-isomer of warfarin. This double mechanism causes rapid, severe warfarin accumulation and bleeding."
            },
            {
                "q": "Which of the following is the S-isomer of warfarin metabolized by in the liver, which represents the primary target of inhibition by drugs like amiodarone, metronidazole, and TMP-SMX?",
                "options": [
                    "CYP2C9",
                    "CYP3A4",
                    "CYP2D6",
                    "CYP1A2",
                    "Phase II glucuronosyltransferase"
                ],
                "answer": 0,
                "exp": "Active S-warfarin is metabolized primarily by the cytochrome P450 enzyme CYP2C9. Inhibitors of CYP2C9 (amiodarone, metronidazole, TMP-SMX, fluconazole) cause a rapid, dramatic rise in warfarin levels and INR."
            },
            {
                "q": "Which of the following is the most appropriate initial management step for an asymptomatic patient with an INR of 8.5 without significant bleeding?",
                "options": [
                    "Hold warfarin, administer oral low-dose Vitamin K (2.5-5 mg), and monitor INR closely",
                    "Administer a 4-factor prothrombin complex concentrate (PCC) bolus immediately",
                    "Administer 4 units of fresh frozen plasma (FFP) and schedule emergency dialysis",
                    "Double the dose of warfarin and prescribe daily oral iron supplements",
                    "There are no interventions; hold warfarin and discharge the patient home"
                ],
                "answer": 0,
                "exp": "For patients with INR > 5.0 to 10.0 without active bleeding, guidelines recommend holding warfarin and administering low-dose oral Vitamin K (1 to 2.5 mg) to slowly correct the INR. Intravenous Vitamin K and PCC/FFP are reserved for active, major, life-threatening bleeding."
            }
        ]
    },
    # 10. Pharmacogenomic considerations (CYP2D6)
    {
        "title": "Codeine Inefficacy and CYP2D6 Polymorphisms",
        "age_range": (65, 85),
        "scenario": (
            "A {age}-year-old {gender} undergoes a minor orthopedic procedure and is prescribed oral codeine for post-operative pain control. Despite taking the medication exactly as directed, the patient reports absolutely no pain relief. A genetic analysis reveals the patient is a CYP2D6 'poor metabolizer.'"
        ),
        "questions": [
            {
                "q": "What is the best pharmacological explanation for this patient's complete lack of pain relief?",
                "options": [
                    "Codeine is a prodrug that must be converted to its active metabolite (morphine) by the hepatic enzyme CYP2C9; poor metabolizers cannot perform this conversion, resulting in therapeutic failure",
                    "Codeine is an active drug that is rapidly inactivated by CYP2D6; poor metabolizers accumulate codeine, which causes a paradoxical pain sensitivity",
                    "The patient's opioid receptors have a primary genetic mutation that prevents all narcotic binding",
                    "The patient's codeine was rapidly excreted by upregulated renal organic cation transporters",
                    "None of the options; poor metabolizers have no response to any pain medications"
                ],
                "answer": 0,
                "exp": "Codeine is a prodrug with weak analgesic activity. It must be converted to **morphine** (which has high mu-opioid receptor affinity) by the hepatic enzyme **CYP2D6**. In CYP2D6 'poor metabolizers' (about 5-10% of Caucasians), this conversion is absent, leading to a complete lack of pain relief. Conversely, 'ultra-rapid metabolizers' convert too much codeine, risking morphine toxicity."
            },
            {
                "q": "Which of the following other common prodrug opioids requires hepatic conversion to its active metabolite by CYP2D6 to provide effective analgesia?",
                "options": [
                    "Tramadol",
                    "Morphine",
                    "Fentanyl",
                    "Methadone",
                    "Buprenorphine"
                ],
                "answer": 0,
                "exp": "Tramadol, like codeine, is a prodrug that must be converted to its active O-desmethyltramadol (M1) metabolite by CYP2D6 to provide meaningful mu-opioid receptor analgesia. Poor metabolizers will also fail to respond to tramadol."
            },
            {
                "q": "In a patient who is identified as a CYP2D6 'ultra-rapid metabolizer,' what represents the primary clinical danger if they are prescribed standard doses of codeine?",
                "options": [
                    "Life-threatening morphine toxicity (respiratory depression and coma) at standard therapeutic doses",
                    "Complete lack of drug absorption leading to severe therapeutic failure",
                    "Rapid development of a severe allergic rash (Stevens-Johnson syndrome)",
                    "Severe hepatorenal syndrome due to drug precipitation in the gallbladder",
                    "No danger; ultra-rapid metabolizers simply clear the drug faster without side effects"
                ],
                "answer": 0,
                "exp": "CYP2D6 ultra-rapid metabolizers convert codeine to morphine exceptionally quickly. This leads to rapid accumulation of morphine, putting the patient at risk of severe opioid toxicity, including respiratory depression and death, even at normal, prescribed doses."
            }
        ]
    }
]

templates_incontinence = [
    # 1. Stress incontinence
    {
        "title": "Leaking with a Cough",
        "age_range": (65, 85),
        "scenario": (
            "A {age}-year-old {gender} presents with a {duration}-month history of involuntary urine leakage. The patient notes that leakage occurs exclusively when {pronoun} coughs, sneezes, laughs, or lifts heavy grocery bags. Physical exam shows a positive cough stress test (urine leak visible when coughing in lithotomy position) and mild pelvic organ prolapse. Post-void residual is normal."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the best initial management strategy?",
                "options": [
                    "Stress urinary incontinence; recommend pelvic floor muscle training (Kegel exercises) and bladder training, and discuss lifestyle modifications (weight loss, managing chronic cough)",
                    "Urge urinary incontinence; initiate immediate high-dose oral oxybutynin and restrict all fluid intake",
                    "Overflow incontinence; perform immediate bladder catheterization and schedule a transurethral prostatectomy",
                    "Functional incontinence; recommend a bedside commode and initiate low-dose antipsychotic therapy",
                    "Detrusor sphincter dyssynergia; schedule the patient for immediate surgical urinary diversion"
                ],
                "answer": 0,
                "exp": "Stress urinary incontinence (SUI) is caused by urethral hypermobility or intrinsic sphincter deficiency, leading to leakage during spikes in intra-abdominal pressure (coughing, laughing). First-line treatment is non-pharmacological: pelvic floor muscle training (Kegels) and behavioral modifications."
            },
            {
                "q": "What is the primary anatomical cause of stress urinary incontinence in postmenopausal females?",
                "options": [
                    "Urethral hypermobility due to weakness of the pelvic floor muscles and loss of connective tissue support",
                    "Detrusor muscle hyperreflexia driven by upper motor neuron damage",
                    "Mechanical bladder outlet obstruction by a uterine fibroid",
                    "Atrophy of the bladder mucosal lining secondary to chronic urinary tract infections",
                    "Spasmodic contraction of the external urethral sphincter"
                ],
                "answer": 0,
                "exp": "In females, SUI is most commonly caused by urethral hypermobility, which is driven by weakness of the pelvic floor muscles and fascial support (often due to pregnancy, childbirth, and postmenopausal estrogen decline), preventing the urethra from closing firmly against intra-abdominal pressure spikes."
            },
            {
                "q": "Which of the following represents a second-line or definitive surgical treatment for severe, refractory stress urinary incontinence in females?",
                "options": [
                    "Mid-urethral sling procedure",
                    "Transurethral resection of the bladder neck",
                    "Intradetrusor botulinum toxin injection",
                    "Sacral neuromodulation (bladder pacemaker)",
                    "VP shunt placement"
                ],
                "answer": 0,
                "exp": "For females with stress incontinence refractory to pelvic floor exercises, the surgical insertion of a mid-urethral sling (tension-free vaginal tape/TVT) is a highly effective, standard procedure that provides mechanical support to the urethra during abdominal pressure spikes."
            }
        ]
    },
    # 2. Urge incontinence/overactive bladder
    {
        "title": "The Sudden, Overwhelming Urge",
        "age_range": (65, 90),
        "scenario": (
            "A {age}-year-old {gender} reports a progressive, {duration}-month history of severe urinary urgency. The patient notes that when the urge to urinate strikes, {pronoun} cannot delay it and frequently leaks large volumes of urine before reaching the toilet. The patient also complains of waking up 4 times a night to urinate. Urinalysis is normal and post-void residual is 40 mL."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the first-line evidence-based management?",
                "options": [
                    "Urge urinary incontinence (overactive bladder); initiate behavioral therapy (bladder training, timed voiding, Kegel exercises) and dietary modifications (avoiding caffeine, alcohol, and carbonated beverages)",
                    "Stress urinary incontinence; schedule the patient for an immediate mid-urethral sling procedure",
                    "Overflow urinary incontinence; prescribe daily oral tamsulosin and perform daily self-catheterization",
                    "Functional incontinence; prescribe oral oxybutynin and recommend wearing adult diapers at all times",
                    "Urinary tract infection; prescribe a 10-day course of oral nitrofurantoin and advise fluid restriction"
                ],
                "answer": 0,
                "exp": "Urge incontinence is characterized by detrusor overactivity, causing a sudden, uncontrollable urge to void followed by involuntary loss of urine. First-line management is behavioral therapy (bladder training to increase interval between voids, timed voiding, Kegels) and avoiding bladder irritants (caffeine, alcohol)."
            },
            {
                "q": "What is the primary underlying urodynamic mechanism driving urge urinary incontinence?",
                "options": [
                    "Detrusor muscle overactivity (involuntary contractions during the filling phase)",
                    "Urethral sphincter weakness leading to passive leakage",
                    "Impaired detrusor contractility (underactivity) causing urinary retention",
                    "Spasmodic closure of the bladder outlet during micturition",
                    "Passive overflow of urine from a chronically overdistended bladder"
                ],
                "answer": 0,
                "exp": "Urge incontinence is caused by detrusor overactivity, where the detrusor muscle of the bladder wall undergoes involuntary, spasmodic contractions during the filling phase, creating a sudden urge and bladder pressure that overrides the sphincter."
            },
            {
                "q": "If behavioral therapies fail for urge incontinence, which of the following drugs represents a safer pharmacological option in an older adult with mild cognitive impairment?",
                "options": [
                    "Mirabegron (beta-3 agonist)",
                    "Oxybutynin (anticholinergic)",
                    "Tolterodine (anticholinergic)",
                    "Fesoterodine (anticholinergic)",
                    "Amitriptyline (tricyclic)"
                ],
                "answer": 0,
                "exp": "Anticholinergic drugs (like oxybutynin or tolterodine) are avoided in the elderly because they cross the blood-brain barrier and cause cognitive decline, confusion, dry mouth, and constipation. Mirabegron is a beta-3 agonist that relaxes the detrusor muscle safely without anticholinergic side effects."
            }
        ]
    },
    # 3. Overflow incontinence from BPH
    {
        "title": "The Dribbling and the Full Bladder",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with a history of progressive benign prostatic hyperplasia (BPH) presents with a {duration}-week history of constant, involuntary dribbling of urine. The patient reports a weak urinary stream, hesitancy, and a feeling of incomplete emptying. Physical exam reveals a dull, palpable mass in the suprapubic region. A bedside bladder scan reveals a post-void residual (PVR) of 450 mL."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the immediate next step in management?",
                "options": [
                    "Overflow urinary incontinence secondary to BPH; perform immediate urinary catheterization to relieve the retention, and initiate tamsulosin or finasteride",
                    "Urge urinary incontinence; prescribe daily oral oxybutynin and recommend immediate pelvic floor exercises",
                    "Stress urinary incontinence; perform a right-sided mid-urethral sling procedure",
                    "Functional incontinence; advise the family to provide a bedside commode and avoid all catheters",
                    "Acute renal failure; schedule the patient for emergent hemodialysis and restrict all fluid intake"
                ],
                "answer": 0,
                "exp": "Overflow incontinence is caused by an underactive detrusor or mechanical bladder outlet obstruction (like BPH in males), leading to urinary retention. When bladder capacity is exceeded, urine leaks or dribbles out passively. PVR is elevated (typically > 200 mL). Immediate catheterization is required to prevent hydronephrosis and renal injury."
            },
            {
                "q": "Which of the following post-void residual (PVR) values is generally considered abnormal and highly suggestive of overflow incontinence or urinary retention?",
                "options": [
                    "A PVR value > 200 mL (with values > 100 mL being borderline)",
                    "A PVR value < 50 mL",
                    "A PVR value of exactly 75 mL",
                    "A PVR value between 50 and 100 mL only",
                    "PVR values cannot be used to evaluate urinary retention"
                ],
                "answer": 0,
                "exp": "A normal PVR is < 50 mL. A PVR > 100 mL is borderline abnormal, and a PVR > 200 mL is highly abnormal, indicating significant urinary retention and suggesting overflow incontinence or detrusor underactivity."
            },
            {
                "q": "Which of the following classes of BPH medications works by inhibiting the enzyme 5-alpha reductase, thereby blocking the conversion of testosterone to dihydrotestosterone (DHT) and slowly reducing prostate volume over 6 months?",
                "options": [
                    "5-alpha reductase inhibitors (e.g., finasteride, dutasteride)",
                    "Alpha-1 adrenergic antagonists (e.g., tamsulosin, doxazosin)",
                    "Anticholinergic agents (e.g., oxybutynin, tolterodine)",
                    "Beta-3 adrenergic agonists (e.g., mirabegron)",
                    "Loop diuretics (e.g., furosemide)"
                ],
                "answer": 0,
                "exp": "Finasteride and dutasteride are 5-alpha reductase inhibitors. They block the conversion of testosterone to its highly active prostatic metabolite DHT. This reduces prostate size by about 20-25% over 6 months, improving urinary flow."
            }
        ]
    },
    # 4. Functional incontinence
    {
        "title": "The Barrier to the Bathroom",
        "age_range": (70, 95),
        "scenario": (
            "A {age}-year-old {gender} with severe knee osteoarthritis and moderate Alzheimer's disease is admitted to a skilled nursing facility. The nursing staff notes that the patient has frequent episodes of urinary incontinence. The patient has a normal urinary stream and normal bladder scan. The physician notes that the patient is physically slow-moving and often cannot navigate the hallways to find the bathroom in time."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the best initial management strategy?",
                "options": [
                    "Functional urinary incontinence; recommend environmental modifications (e.g., bedside commode, clear pathways, highly visible bathroom signs, timed voiding, and assistive mobility devices)",
                    "Stress urinary incontinence; prescribe daily oral pseudoephedrine to increase bladder outlet resistance",
                    "Urge urinary incontinence; initiate a daily high-dose oral anticholinergic like oxybutynin",
                    "Overflow incontinence; perform indwelling Foley catheterization and schedule prostate surgery",
                    "Detrusor sphincter dyssynergia; schedule sacral neuromodulation surgery immediately"
                ],
                "answer": 0,
                "exp": "Functional incontinence occurs when a patient has normal bladder control but is prevented from toileting due to cognitive (dementia, confusion) or physical (osteoarthritis, parkinsonism, barriers) deficits. Management focuses on simplifying the environment, using bedside commodes, and scheduling voiding."
            },
            {
                "q": "Which of the following represents a classic environmental modification to manage functional incontinence in a patient with moderate dementia?",
                "options": [
                    "Placing a bedside commode near the patient's bed, leaving bathroom doors open, and using highly visible, simple signs",
                    "Installing complex biometric locks on the bathroom doors to keep them secure",
                    "Restricting all fluid intake after 12:00 PM to prevent bladder filling",
                    "Applying soft ankle restraints to prevent the patient from rising without a nurse",
                    "Dimming all lights in the hallways to promote a calming environment"
                ],
                "answer": 0,
                "exp": "For patients with cognitive barriers, making the toilet easily accessible and highly visible (leaving the door open, signs, nightlights, bedside commodes) is highly effective in reducing episodes of functional incontinence."
            },
            {
                "q": "Which of the following is a potential risk of managing urinary incontinence in older adults by using chronic indwelling urinary catheters (Foley)?",
                "options": [
                    "High risk of catheter-associated UTIs (CAUTIs), urethral trauma, bladder spasms, and a significant trigger for acute delirium",
                    "Systemic hypotension and immediate cardiovascular collapse",
                    "Selective necrosis of the pelvic floor muscles",
                    "Complete suppression of renal GFR leading to rapid-onset anuria",
                    "There are no risks; chronic catheters are the gold-standard recommendation for all elderly incontinence"
                ],
                "answer": 0,
                "exp": "Chronic Foley catheterization carries severe risks and is generally discouraged. It is a leading cause of CAUTIs, causes urethral and bladder trauma/spasms, restricts patient mobility, and is a major, documented trigger for acute delirium."
            }
        ]
    },
    # 5. Mixed incontinence
    {
        "title": "Mixed Stress and Urge Incontinence",
        "age_range": (65, 90),
        "scenario": (
            "A {age}-year-old {gender} presents with a {duration}-month history of urinary incontinence. The patient describes leaking small amounts of urine when coughing or laughing, but also complains of a sudden, overwhelming urge to urinate that frequently results in a large volume leak before {pronoun} can reach the bathroom. post-void residual is normal."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the best stepped treatment approach?",
                "options": [
                    "Mixed urinary incontinence (stress + urge); initiate comprehensive behavioral therapy (pelvic floor exercises, bladder training, timed voiding) as first-line, followed by targeted treatments for the most bothersome symptom",
                    "Stress urinary incontinence alone; perform an immediate mid-urethral sling and avoid all behavioral modifications",
                    "Urge incontinence alone; prescribe high-dose oral oxybutynin and restrict all daytime fluids",
                    "Overflow incontinence; insert a chronic indwelling Foley catheter and prescribe daily oral tamsulosin",
                    "Neurogenic bladder; schedule the patient for immediate surgical urinary diversion"
                ],
                "answer": 0,
                "exp": "Mixed incontinence involves components of both stress incontinence (leakage with intra-abdominal pressure) and urge incontinence (leakage with detrusor overactivity). First-line treatment is multi-component behavioral therapy, which targets both mechanisms. Further treatments (sling vs mirabegron) are tailored to the dominant/most bothersome symptom."
            },
            {
                "q": "Which of the following represents the first-line non-pharmacological behavioral therapy that is effective for both stress and urge incontinence?",
                "options": [
                    "Pelvic floor muscle training (Kegels) combined with bladder training (timed voiding)",
                    "Strict fluid restriction (limiting intake to less than 500 mL per day)",
                    "Urinary catheterization twice daily and avoiding all dietary fiber",
                    "Performing high-intensity abdominal crunches weekly",
                    "Taking daily hot baths to relax the bladder sphincter"
                ],
                "answer": 0,
                "exp": "Pelvic floor exercises strengthen the urethral support (helping stress incontinence) and reflexively inhibit detrusor contractions (helping urge incontinence). Bladder training helps increase bladder capacity, reducing urgency and frequency."
            },
            {
                "q": "When counselling a patient on pelvic floor muscle training (Kegel exercises), what represents the correct instruction to ensure the patient is contracting the correct muscles?",
                "options": [
                    "Contract the muscles used to stop the flow of urine mid-stream or prevent gas, without contracting the abdomen, buttocks, or thighs",
                    "Perform vigorous contractions of the rectus abdominis muscles while holding one's breath",
                    "Squeeze the gluteus maximus muscles as tightly as possible while standing on one's toes",
                    "Perform deep squatting exercises daily for at least 30 minutes",
                    "Apply continuous manual pressure to the suprapubic region during micturition"
                ],
                "answer": 0,
                "exp": "Effective Kegels require isolating the levator ani and pubococcygeus muscles. Patients should be taught to contract the muscles used to stop urination or flatus, while keeping their abdomen, thighs, and gluteal muscles completely relaxed."
            }
        ]
    },
    # 6. Drug-induced incontinence
    {
        "title": "The Incontinence from the Water Pill",
        "age_range": (65, 90),
        "scenario": (
            "A {age}-year-old {gender} with a history of heart failure presents with a sudden onset of severe urinary urgency, frequency, and involuntary leakage. The spouse notes that the symptoms began 5 days ago, shortly after the patient's daily dose of furosemide was doubled to treat a mild heart failure exacerbation. post-void residual is normal."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the best clinical management?",
                "options": [
                    "Drug-induced urinary incontinence secondary to furosemide; adjust the timing of the diuretic (e.g., avoid late afternoon dosing), ensure the patient has clear, rapid pathways to the bathroom, and review total diuretic necessity once fluid balance is restored",
                    "Acute bacterial cystitis; initiate a 10-day course of oral ciprofloxacin and discontinue furosemide abruptly",
                    "Normal complication of heart failure; continue furosemide and initiate high-dose oral oxybutynin immediately",
                    "Overflow incontinence; perform immediate urinary catheterization and schedule prostate surgery",
                    "Primary detrusor failure; schedule the patient for immediate surgical urinary diversion"
                ],
                "answer": 0,
                "exp": "Loop diuretics (furosemide) cause a rapid, large volume diuresis that can overwhelm the bladder's storage capacity and the patient's mobility, triggering or worsening urge/functional incontinence. Management focuses on timing the dose (morning, when awake and mobile), clearing paths, and adjusting doses."
            },
            {
                "q": "Which of the following other drug classes is associated with causing or worsening urinary urgency and incontinence in older adults by blocking the breakdown of acetylcholine, thereby stimulating detrusor muscle contractions?",
                "options": [
                    "Cholinesterase inhibitors (e.g., donepezil, donepezil/memantine)",
                    "Anticholinergic agents (e.g., diphenhydramine, amitriptyline)",
                    "Alpha-1 adrenergic antagonists (e.g., tamsulosin)",
                    "Calcium channel blockers (e.g., amlodipine)",
                    "Beta-blockers (e.g., metoprolol)"
                ],
                "answer": 0,
                "exp": "Cholinesterase inhibitors (donepezil) used in Alzheimer's boost acetylcholine. Acetylcholine binds to M3 receptors on the detrusor, causing contraction. This commonly triggers urinary urgency, frequency, and incontinence, which is sometimes inappropriately treated with anticholinergics (prescribing cascade)."
            },
            {
                "q": "Which of the following drug classes is associated with causing urinary retention and subsequent overflow incontinence in older adults due to direct blockade of detrusor muscle contraction?",
                "options": [
                    "Anticholinergic medications (e.g., amitriptyline, oxybutynin)",
                    "Alpha-1 blockers (e.g., doxazosin)",
                    "Beta-3 agonists (e.g., mirabegron)",
                    "Calcium channel blockers (e.g., amlodipine)",
                    "Proton pump inhibitors (e.g., omeprazole)"
                ],
                "answer": 0,
                "exp": "Anticholinergics block acetylcholine binding to M3 receptors on the detrusor, preventing it from contracting. In older patients (especially males with BPH), this leads to severe urinary retention, bladder overdistension, and overflow incontinence."
            }
        ]
    },
    # 7. Post-void residual assessment
    {
        "title": "Bedside Bladder Scan and Post-Void Residual",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with a history of BPH and vascular dementia presents with a 2-day history of lower abdominal pain, distension, and urinary dribbling. The physician suspects urinary retention and performs a bedside ultrasound bladder scan immediately after the patient attempts to urinate. The scan shows a fluid volume of 380 mL."
        ),
        "questions": [
            {
                "q": "What is the correct clinical interpretation of this bladder scan, and what is the next step in management?",
                "options": [
                    "Abnormal post-void residual (PVR > 200 mL) indicating significant urinary retention; perform catheterization to drain the urine, and evaluate for mechanical obstruction (BPH) or neurogenic bladder",
                    "Normal post-void residual (PVR < 500 mL is normal); reassure the patient and encourage increased fluid intake",
                    "The bladder scan is non-diagnostic; immediately perform an abdominal CT scan with contrast",
                    "The scan indicates acute appendicitis; refer the patient for emergent laparoscopic surgery",
                    "Immediately prescribe high-dose oral oxybutynin to contract the bladder neck"
                ],
                "answer": 0,
                "exp": "A post-void residual (PVR) is the volume of urine remaining in the bladder immediately after voiding. A PVR > 200 mL is highly abnormal and diagnostic of urinary retention/detrusor underactivity or obstruction. Immediate catheterization (straight cath or Foley) is required to relieve the retention."
            },
            {
                "q": "Which of the following represents the most common non-invasive technique used to measure post-void residual in the clinical setting?",
                "options": [
                    "Bedside portable ultrasound bladder scanner",
                    "Transurethral straight urinary catheterization",
                    "Abdominal magnetic resonance imaging (MRI)",
                    "Intravenous pyelogram (IVP)",
                    "Suprapubic needle aspiration"
                ],
                "answer": 0,
                "exp": "A portable bedside ultrasound bladder scanner is the preferred non-invasive method. It is rapid, painless, and carries zero risk of introducing a urinary tract infection, unlike straight catheterization (which is the gold-standard but invasive method)."
            },
            {
                "q": "In which of the following clinical scenarios is the measurement of post-void residual strictly indicated before initiating any pharmacotherapy for incontinence?",
                "options": [
                    "In any patient presenting with new-onset incontinence, particularly when overflow incontinence is suspected (e.g., males with BPH or neurogenic bladder)",
                    "In healthy young females presenting with simple stress incontinence only",
                    "In patients with simple acute cystitis presenting with hematuria",
                    "Only in patients who have recently undergone a ventriculoperitoneal shunt placement",
                    "Measurement is never indicated; pharmacotherapy can be initiated based on symptoms alone"
                ],
                "answer": 0,
                "exp": "A PVR must be checked in patients presenting with signs of retention or overflow incontinence (BPH, diabetes, neurogenic disorders) before starting medications like anticholinergics or beta-3 agonists, as these can trigger complete, painful urinary retention."
            }
        ]
    },
    # 8. Behavioral therapy & Kegel exercises
    {
        "title": "Pelvic Floor Rehabilitation",
        "age_range": (65, 85),
        "scenario": (
            "A {age}-year-old {gender} is evaluated for a {duration}-month history of mixed stress and urge urinary incontinence. The patient wishes to avoid medications and surgeries. The physician refers the patient to a pelvic floor physical therapist for a comprehensive behavioral rehabilitation program, including pelvic floor muscle training (Kegel exercises) and bladder training."
        ),
        "questions": [
            {
                "q": "Which of the following represents the primary mechanism of action and clinical evidence supporting Kegel exercises and bladder training in this patient?",
                "options": [
                    "They strengthen the levator ani and coccygeus muscles to improve urethral support (helping stress incontinence) and reflexively inhibit detrusor contractions (helping urge incontinence); they are highly effective and are the first-line recommendation for both conditions",
                    "They directly stimulate the kidneys to secrete less urine in the evening, thereby reducing nocturia",
                    "They cause physical hypertrophy of the external urethral sphincter, preventing all voiding",
                    "Behavioral therapies are placebo-based and have no documented efficacy; surgery is always required",
                    "They work by increasing vascular perfusion to the frontal lobes, improving central bladder control"
                ],
                "answer": 0,
                "exp": "Pelvic floor muscle training (PFMT/Kegels) strengthens the supportive muscles of the pelvic floor, particularly the levator ani, providing mechanical support to the bladder neck. PFMT also activates the guarding reflex, which inhibits detrusor overactivity. Bladder training (scheduled voiding with progressive interval increases) retrains the brain to delay voiding."
            },
            {
                "q": "Which of the following describes the correct technique for bladder training (scheduled voiding) in a patient with urge incontinence?",
                "options": [
                    "Urinate on a strict, predetermined schedule (e.g., every 2 hours) while awake, gradually increasing the interval by 15-30 minutes each week, and suppress the urge to void in between",
                    "Urinate only when the urge becomes completely unbearable, and restrict all walking",
                    "Drink 3 liters of water and attempt to hold urine for at least 8 consecutive hours",
                    "Use a straight catheter every 4 hours to bypass detrusor contractions completely",
                    "Urinate every 15 minutes continuously throughout the day without exception"
                ],
                "answer": 0,
                "exp": "Bladder training involves voiding on a set schedule regardless of urge. The starting interval is based on the patient's baseline frequency. If an urge occurs between intervals, the patient uses relaxation techniques and distraction to suppress it, gradually expanding the bladder capacity."
            },
            {
                "q": "Which of the following adjunctive techniques can be used by a physical therapist to help a patient identify and isolate the correct pelvic floor muscles during Kegel training?",
                "options": [
                    "Biofeedback and vaginal/anal surface electromyography",
                    "Abdominal ultrasound during heavy weightlifting",
                    "Intravenous pyelography with contrast",
                    "Continuous ambulatory EKG monitoring",
                    "Pelvic CT scan during valsalva maneuver"
                ],
                "answer": 0,
                "exp": "Biofeedback (using vaginal/anal probes or surface electrodes) is highly useful. It provides real-time visual or auditory feedback of muscle activity, ensuring the patient is contracting the pelvic floor (levator ani) rather than compensating with the gluteal or abdominal muscles."
            }
        ]
    },
    # 9. Anticholinergic risks in elderly (oxybutynin)
    {
        "title": "Oxybutynin and the Confused Elder",
        "age_range": (70, 95),
        "scenario": (
            "A {age}-year-old {gender} with a history of mild vascular dementia was started on oxybutynin 5 mg three times daily for urge incontinence 1 week ago. The family brings the patient to the clinic due to an acute worsening of confusion, severe dry mouth, and a new onset of severe constipation. MoCA score has dropped from 22 to 16."
        ),
        "questions": [
            {
                "q": "What is the primary pharmacological explanation for this clinical deterioration, and what is the best next step?",
                "options": [
                    "Oxybutynin is a non-selective anticholinergic that readily crosses the blood-brain barrier, causing central muscarinic blockade and acute cognitive decline, along with peripheral anticholinergic side effects; discontinue oxybutynin immediately",
                    "Normal progression of vascular dementia; continue oxybutynin and initiate daily oral donepezil and memantine",
                    "A cute ischemic stroke; perform an emergent head CT and initiate tPA",
                    "Oxybutynin allergy; discontinue the drug and initiate daily oral diphenhydramine 50 mg",
                    "Uremic encephalopathy due to primary renal necrosis from the drug; refer for hemodialysis"
                ],
                "answer": 0,
                "exp": "Oxybutynin is highly lipophilic and non-selective, crossing the blood-brain barrier to cause central cholinergic blockade. In older adults (especially those with pre-existing dementia, who have compromised acetylcholine levels), it triggers severe cognitive decline, confusion, dry mouth, and constipation. It should be stopped immediately."
            },
            {
                "q": "Which of the following neurotransmitters is blocked by oxybutynin, explaining both its therapeutic effect on the bladder and its adverse cognitive side effects?",
                "options": [
                    "Acetylcholine",
                    "Norepinephrine",
                    "Dopamine",
                    "Serotonin",
                    "GABA"
                ],
                "answer": 0,
                "exp": "Oxybutynin is a muscarinic acetylcholine receptor antagonist. It blocks acetylcholine in the bladder (M3 receptors, reducing detrusor contraction) and in the brain (M1/M2 receptors, compromising memory and attention, leading to delirium/cognitive decline)."
            },
            {
                "q": "Which of the following overactive bladder medications is a selective M3-receptor antagonist that has lower blood-brain barrier penetration than oxybutynin, though it should still be used with caution in older adults?",
                "options": [
                    "Darifenacin or Solifenacin",
                    "Tolterodine",
                    "Oxybutynin",
                    "Atropine",
                    "Scopolamine"
                ],
                "answer": 0,
                "exp": "Darifenacin and Solifenacin are M3-selective antagonists. Because the brain primarily utilizes M1 receptors for cognitive function, and these drugs have lower CNS penetration than oxybutynin, they carry a lower (though not zero) risk of causing central cognitive side effects."
            }
        ]
    },
    # 10. Catheter-associated UTI (CAUTI)
    {
        "title": "The Catheter-Associated Fever",
        "age_range": (70, 95),
        "scenario": (
            "A {age}-year-old {gender} in a long-term care facility has had an indwelling Foley catheter for 3 months due to 'convenience' and mild mobility barriers. The patient develops tachypnea, hypotension (BP 94/56 mmHg), and acute confusion. Urinalysis shows positive nitrites and many WBCs, and blood cultures grow Escherichia coli."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, the primary predisposing factor, and the most appropriate management?",
                "options": [
                    "Catheter-associated urinary tract infection (CAUTI) progressing to urosepsis; discontinue or replace the indwelling catheter, obtain urine culture from the new catheter, initiate broad-spectrum intravenous antibiotics, and support fluid volume",
                    "Simple asymptomatic bacteriuria; no antibiotics are indicated; flush the catheter with sterile saline and continue current care",
                    "Primary septic arthritis of the hip; perform emergent hip aspiration and continue current catheter care",
                    "Foley catheter allergy; immediately remove the catheter and administer intravenous diphenhydramine 50 mg",
                    "Chronic renal failure; schedule the patient for emergent hemodialysis and double the catheter size"
                ],
                "answer": 0,
                "exp": "This patient has urosepsis secondary to a Catheter-Associated UTI (CAUTI). Long-term indwelling catheters rapidly form a bacterial biofilm. The catheter must be replaced or removed, urine obtained for culture from the fresh catheter, and broad-spectrum antibiotics started immediately. Catheters should never be used for caregiver convenience."
            },
            {
                "q": "What is the primary mechanism by which indwelling urinary catheters facilitate bacterial colonization and infection of the urinary tract?",
                "options": [
                    "Bacterial biofilm formation along the inner and outer surfaces of the catheter tubing, which protects bacteria from host immune defenses and antibiotics",
                    "Direct chemical irritation of the renal glomeruli by the silicone catheter material",
                    "Catheters actively suppress the patient's bone marrow, reducing neutrophil production",
                    "The saline-filled anchoring balloon directly blocks the ureteral orifices, causing hydronephrosis",
                    "Bacterial precipitation of calcium within the bladder wall causing secondary cystitis"
                ],
                "answer": 0,
                "exp": "Within 24-48 hours of insertion, a mucopolysaccharide biofilm forms on the catheter surfaces. Bacteria (e.g., E. coli, Proteus, Pseudomonas) colonize this biofilm, which shields them from antibiotics and the host immune system, making colonization universal within 30 days."
            },
            {
                "q": "Which of the following represents a strictly appropriate, evidence-based clinical indication for the placement of an indwelling urinary catheter (Foley)?",
                "options": [
                    "Acute, painful urinary retention or bladder outlet obstruction, perioperative use in specific surgeries, or for healing of open stage III/IV sacral pressure ulcers in an incontinent patient",
                    "To easily obtain a urine sample for routine urinalysis in a cooperative patient",
                    "For the convenient management of chronic incontinence in a patient with mobility barriers",
                    "To closely monitor urine output in a stable patient on oral diuretics",
                    "To prevent nocturnal voiding in a patient with sleep onset insomnia"
                ],
                "answer": 0,
                "exp": "Foley catheters should be used only for: (1) acute retention/obstruction, (2) critical output monitoring, (3) specific surgeries, (4) healing of sacral wounds in incontinent patients, or (5) end-of-life comfort care. Using them for incontinence management or caregiver convenience is inappropriate."
            }
        ]
    }
]

templates_pressure_ulcers = [
    # 1. Stage I pressure injury
    {
        "title": "The Non-Blanchable Erythema",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with advanced Parkinson's disease is evaluated in a skilled nursing facility. The patient is largely bed-bound and relies on staff for repositioning. During a skin assessment, the nurse identifies a 3 cm area of dark red skin over the sacrum. The skin is completely intact, but does not blanch (turn white) when pressed with a finger."
        ),
        "questions": [
            {
                "q": "What is the correct staging of this pressure injury, and what is the best initial management?",
                "options": [
                    "Stage I pressure injury (non-blanchable erythema of intact skin); implement a strict repositioning schedule (every 2 hours), use pressure-redistributing support surfaces, keep the skin clean and dry, and avoid placing the patient directly on the sacrum",
                    "Stage II pressure injury; apply a hydrocolloid dressing and debride the area using a sharp curette",
                    "Stage III pressure injury; consult plastic surgery for immediate split-thickness skin grafting",
                    "Deep tissue pressure injury; perform emergency bedside surgical debridement down to the bone",
                    "This is a benign vascular nevus; reassure the staff and repeat the skin exam in 6 months"
                ],
                "answer": 0,
                "exp": "A Stage I pressure injury is characterized by intact skin with localized non-blanchable erythema (does not turn white when pressed). Management is preventive and non-invasive: pressure offloading (repositioning every 2 hours, specialized mattresses), keeping the skin clean/dry, and monitoring closely."
            },
            {
                "q": "Which of the following represents the primary pathophysiology of pressure injuries?",
                "options": [
                    "External pressure exceeding capillary filling pressure (typically 32 mmHg) over a bony prominence, leading to localized microvascular ischemia, tissue hypoxia, and subsequent necrosis",
                    "Autoimmune destruction of the subcutaneous fat cells by circulating IgA antibodies",
                    "Axonal degeneration of the sensory nerve fibers supplying the epidermis",
                    "Localized bacterial infection of the hair follicles spreading laterally",
                    "Primary venous stasis causing lymphatic fluid accumulation and skin breakdown"
                ],
                "answer": 0,
                "exp": "Pressure injuries occur when external pressure (especially over bony prominences like the sacrum, heels, or trochanters) exceeds capillary perfusion pressure (~32 mmHg). This compresses the microvasculature, cutting off blood flow and causing ischemic tissue damage and necrosis."
            },
            {
                "q": "Which of the following bony prominences is the most common anatomical site for the development of pressure injuries in bed-bound patients?",
                "options": [
                    "Sacrum and coccyx",
                    "Medial clavicle",
                    "Dorsal spinous process of C7",
                    "Patella",
                    "Lateral epicondyle of the humerus"
                ],
                "answer": 0,
                "exp": "The sacrum and coccyx are the most common sites (accounting for 30-40% of all pressure injuries), followed by the heels (calcaneus), ischial tuberosities (in seated patients), and greater trochanters (in patients positioned on their side)."
            }
        ]
    },
    # 2. Stage II pressure injury
    {
        "title": "The Shallow Open Crater",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} who is recovering from a stroke is evaluated. The nurse identifies an open wound over the left greater trochanter. The wound is shallow, with a red-pink wound bed without slough or bruising. The skin is partially lost, presenting as a shallow open ulcer or an intact/ruptured serum-filled blister."
        ),
        "questions": [
            {
                "q": "What is the correct staging of this pressure injury?",
                "options": [
                    "Stage II pressure injury (partial-thickness skin loss involving the epidermis and/or dermis)",
                    "Stage I pressure injury",
                    "Stage III pressure injury",
                    "Stage IV pressure injury",
                    "Unstageable pressure injury"
                ],
                "answer": 0,
                "exp": "A Stage II pressure injury involves partial-thickness loss of skin with exposed dermis. The wound bed is viable, pink or red, and moist, and may present as an intact or ruptured serum-filled blister. It does not contain slough, eschar, or deep tissue involvement."
            },
            {
                "q": "Which of the following dressings is most appropriate for a clean, minimally exudative Stage II pressure injury to maintain a moist wound environment and protect the viable dermis?",
                "options": [
                    "Hydrocolloid or transparent film dressing",
                    "Dry sterile gauze packed tightly into the wound bed",
                    "Enzymatic debriding ointment (collagenase) covered by a wet-to-dry gauze",
                    "Topical 10% povidone-iodine solution left open to the air",
                    "Calcium alginate dressing packed deeply into the wound"
                ],
                "answer": 0,
                "exp": "For clean, minimally draining Stage II pressure injuries, hydrocolloid or semipermeable transparent film dressings are ideal. They maintain a moist wound environment (which accelerates re-epithelialization), protect the wound from bacterial contamination, and require infrequent changes."
            },
            {
                "q": "Which of the following clinical features, if present in the wound bed of a trochanteric ulcer, would strictly EXCLUDE a diagnosis of a Stage II pressure injury and point to a deeper tissue injury?",
                "options": [
                    "Presence of yellow slough, black eschar, or a dark purple/maroon localized discoloration",
                    "A moist, red-pink wound bed",
                    "An intact, serum-filled blister",
                    "The absence of exposed muscle or bone",
                    "Normal, healthy surrounding skin"
                ],
                "answer": 0,
                "exp": "Stage II injuries involve only the epidermis and dermis. The presence of slough, eschar, or dark purple/maroon skin (indicative of deep tissue pressure injury) indicates a deeper level of tissue destruction, excluding Stage II."
            }
        ]
    },
    # 3. Stage III pressure injury
    {
        "title": "The Deep Crater",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} is admitted to the hospital from home with a deep, open wound over the sacrum. The wound is a deep crater, showing full-thickness skin loss. Subcutaneous fat is visible within the wound bed, but no bone, tendon, or muscle is exposed. Some yellow slough is present at the base of the wound."
        ),
        "questions": [
            {
                "q": "What is the correct staging of this pressure injury?",
                "options": [
                    "Stage III pressure injury (full-thickness skin loss exposing subcutaneous fat, without exposed bone, tendon, or muscle)",
                    "Stage II pressure injury",
                    "Stage IV pressure injury",
                    "Unstageable pressure injury",
                    "Deep tissue pressure injury"
                ],
                "answer": 0,
                "exp": "A Stage III pressure injury involves full-thickness skin loss. Subcutaneous fat is visible, and granulation tissue and epibole (rolled wound edges) are often present. Slough or eschar may be visible, but bone, tendon, ligament, cartilage, or muscle are **not** exposed."
            },
            {
                "q": "What is the term used to describe the tissue destruction that extends under the intact skin edges along the periphery of a Stage III or IV pressure injury?",
                "options": [
                    "Undermining or tunneling",
                    "Epibole",
                    "Escharing",
                    "Granulation",
                    "Debridement"
                ],
                "answer": 0,
                "exp": "Undermining refers to tissue destruction that arches under the visible wound margins along the skin edges. Tunneling refers to a narrow channel of tissue destruction extending in any direction from the wound bed into deep tissues. Both require careful assessment and packing."
            },
            {
                "q": "For a Stage III pressure injury with significant yellow slough and moderate purulent exudate, which of the following dressings is most appropriate to manage the drainage and promote autolytic debridement?",
                "options": [
                    "Calcium alginate or hydrofiber dressing",
                    "Dry sterile cotton gauze left in place for 7 days",
                    "Transparent adhesive film dressing alone",
                    "Topical hydrogen peroxide solution twice daily",
                    "A thick layer of petroleum jelly covered by plastic wrap"
                ],
                "answer": 0,
                "exp": "Calcium alginate or hydrofiber dressings are highly absorptive, turning into a gel when in contact with wound exudate. They are ideal for moderately-to-heavily draining wounds, maintaining moisture while preventing periwound maceration and facilitating autolytic debridement."
            }
        ]
    },
    # 4. Stage IV pressure injury
    {
        "title": "Exposed Bone and Tendon",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with advanced vascular dementia is evaluated. The physician identifies a very deep, massive wound over the left ischial tuberosity. The wound shows full-thickness tissue loss. At the base of the deep crater, the physician can clearly see and palpate the ischial bone and a glistening white tendon. A significant amount of foul-smelling purulent drainage is present."
        ),
        "questions": [
            {
                "q": "What is the correct staging of this pressure injury, and what is the primary diagnostic concern regarding the exposed bone?",
                "options": [
                    "Stage IV pressure injury (full-thickness tissue loss with exposed bone, tendon, or muscle); the primary concern is osteomyelitis (bone infection), which requires bone biopsy or MRI, and long-term systemic antibiotics",
                    "Stage III pressure injury; the primary concern is acute gluteal muscle hematoma",
                    "Unstageable pressure injury; the primary concern is acute gas gangrene",
                    "Deep tissue pressure injury; the primary concern is systemic septic shock",
                    "Stage II pressure injury; the primary concern is superficial candidiasis"
                ],
                "answer": 0,
                "exp": "Stage IV pressure injuries involve full-thickness tissue loss with directly exposed or palpable bone, tendon, ligament, cartilage, or muscle. When bone is exposed, the risk of osteomyelitis is extremely high. Diagnosis requires a bone biopsy (gold-standard) or MRI, and treatment involves surgical debridement and prolonged antibiotics."
            },
            {
                "q": "Which of the following imaging modalities is the most sensitive and specific non-invasive test to diagnose osteomyelitis in a patient with a Stage IV sacral pressure injury?",
                "options": [
                    "Magnetic Resonance Imaging (MRI) of the pelvis",
                    "Plain X-ray of the pelvis",
                    "Ultrasound of the suprapubic region",
                    "Computed Tomography (CT) scan without contrast",
                    "Triple-phase technetium bone scan"
                ],
                "answer": 0,
                "exp": "MRI has high sensitivity (>90%) and specificity for diagnosing osteomyelitis in the setting of pressure injuries, as it can detect early bone marrow edema and distinguish between soft tissue infection and true bone involvement."
            },
            {
                "q": "Which of the following represents the most appropriate wound care approach for a Stage IV pressure injury with extensive necrotic tissue and exposed bone?",
                "options": [
                    "Surgical (sharp) debridement of all necrotic and non-viable tissue, followed by targeted wound packing and potential surgical closure/flap reconstruction",
                    "Strict non-intervention; allow the necrotic tissue to detach naturally over 6 months",
                    "Applying a tight pressure patch and keeping the wound completely dry",
                    "Intradermal injections of collagen and localized laser therapy",
                    "Bedside application of high-concentration nitric acid to burn off the necrotic tissue"
                ],
                "answer": 0,
                "exp": "Stage IV ulcers with necrosis require prompt surgical (sharp) debridement to remove all non-viable tissue, which acts as a breeding ground for bacteria. This is followed by specialized packing (e.g., negative pressure wound therapy/NPWT) to promote granulation, and eventually surgical flap reconstruction."
            }
        ]
    },
    # 5. Unstageable pressure injury
    {
        "title": "The Covered Wound Base",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} is admitted to the hospital with a large wound over the sacrum. The wound base is completely covered by a thick, leathery, black layer of dry, adherent eschar and yellow slough. The physician cannot visualize the depth of the wound bed or see if there is exposed muscle or bone underneath."
        ),
        "questions": [
            {
                "q": "What is the correct staging of this pressure injury, and what is the primary management rule regarding this wound type?",
                "options": [
                    "Unstageable pressure injury (depth obscured by slough or eschar); the wound cannot be staged until the eschar/slough is removed to expose the wound base; debridement is required unless it is a dry, stable eschar on the heel",
                    "Stage IV pressure injury; immediate surgical flap reconstruction without debridement",
                    "Stage I pressure injury; apply a hydrocolloid dressing and monitor",
                    "Deep tissue pressure injury; immediately apply a dry sterile dressing and keep strictly dry",
                    "Stage II pressure injury; perform immediate sharp curettage in the clinic"
                ],
                "answer": 0,
                "exp": "A pressure injury is unstageable if the true depth of tissue damage is completely obscured by slough or eschar. The wound must be debrided (chemically, autolytically, or surgically) to expose the base before it can be staged. Exception: stable, dry, intact eschar on the heels serves as a natural barrier and should not be debrided."
            },
            {
                "q": "In which of the following anatomical locations is a stable, dry, intact eschar (without erythema or fluctuance) generally left alone and NOT debrided?",
                "options": [
                    "The heel (calcaneus)",
                    "The sacrum",
                    "The greater trochanter",
                    "The ischial tuberosity",
                    "The occiput"
                ],
                "answer": 0,
                "exp": "Dry, stable, intact eschars on the heels serve as the body's natural, sterile biological cover. Because perfusion to the heel is relatively poor, debriding a stable eschar can expose bone and increase infection risk. If it becomes fluctuant, draining, or erythematous, debridement is indicated."
            },
            {
                "q": "Which of the following debridement methods utilizes the patient's own endogenous enzymes (such as collagenase) to slowly liquefy necrotic tissue under a moisture-retaining dressing (e.g., hydrocolloid)?",
                "options": [
                    "Autolytic debridement",
                    "Sharp surgical debridement",
                    "Enzymatic debridement",
                    "Mechanical debridement (wet-to-dry gauze)",
                    "Biologic debridement (maggot therapy)"
                ],
                "answer": 0,
                "exp": "Autolytic debridement is a highly selective, painless method that uses moisture-retaining dressings (hydrocolloids, hydrogels) to trap the body's own proteolytic enzymes, slowly digesting necrotic tissue. It is slow but safe for stable patients."
            }
        ]
    },
    # 6. Braden Scale risk assessment
    {
        "title": "The Braden Scale Risk Score",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with advanced vascular dementia and severe mobility impairment is admitted to the hospital. As part of the admission protocol, the nurse performs a formal pressure injury risk assessment using the **Braden Scale**. The patient is found to be incontinent of urine, occasionally moves with assistance, has poor nutritional intake, and has a total Braden score of 12."
        ),
        "questions": [
            {
                "q": "What is the correct clinical interpretation of this Braden Scale score, and what is the appropriate management?",
                "options": [
                    "The score indicates a high risk for pressure injuries (Braden score 10-12 = high risk); implement an aggressive pressure injury prevention protocol (turning schedule, specialized mattress, moisture barriers, and nutritional support)",
                    "The score indicates a very low risk (Braden score > 18); reassure the family and repeat the assessment in 1 month",
                    "The score is normal; no active intervention is needed; continue standard nursing care",
                    "The score indicates acute renal failure; perform immediate suprapubic catheterization",
                    "The score is diagnostic of a Stage IV pressure injury; consult plastic surgery immediately"
                ],
                "answer": 0,
                "exp": "The Braden Scale ranges from 6 to 23. Lower scores indicate higher risk: 15-18 = mild risk, 13-14 = moderate risk, 10-12 = high risk, and < 9 = severe risk. A score of 12 represents high risk, requiring an immediate, structured prevention protocol."
            },
            {
                "q": "Which of the following represents the six subscales evaluated in the Braden Scale risk assessment tool?",
                "options": [
                    "Sensory perception, moisture, activity, mobility, nutrition, and friction/shear",
                    "Age, weight, blood pressure, cognitive status, creatinine, and heart rate",
                    "ADLs, IADLs, gait speed, grip strength, balance, and cognitive function",
                    "Skin color, turgor, temperature, capillary refill, sensation, and hair distribution",
                    "None of the options; the Braden Scale evaluates only the patient's age and weight"
                ],
                "answer": 0,
                "exp": "The Braden Scale systematically evaluates six risk factors: (1) sensory perception (ability to respond to pressure discomfort), (2) moisture (degree of skin exposure to moisture), (3) activity (degree of physical activity), (4) mobility (ability to change body position), (5) nutrition (usual food intake), and (6) friction and shear."
            },
            {
                "q": "Which of the following subscales on the Braden Scale is uniquely scored from 1 to 3, while all other subscales are scored from 1 to 4?",
                "options": [
                    "Friction and shear",
                    "Sensory perception",
                    "Moisture",
                    "Nutrition",
                    "Activity"
                ],
                "answer": 0,
                "exp": "The 'Friction and Shear' subscale is scored only from 1 (problem) to 3 (no apparent problem). All other five subscales are scored from 1 (most compromised) to 4 (normal), making the minimum total score 6 and maximum 23."
            }
        ]
    },
    # 7. Nutrition optimization for wound healing
    {
        "title": "Nutritional Support for Wound Healing",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with a Stage III pressure injury over the sacrum is being managed in a rehabilitation unit. The wound has shown slow healing over the past 3 weeks. Labs show a serum albumin of 2.4 g/dL and prealbumin of 11 mg/dL. The physician consults a clinical dietitian to optimize the patient's nutritional status for wound healing."
        ),
        "questions": [
            {
                "q": "What is the recommended nutritional target for protein and calorie intake to promote pressure injury healing in this malnourished patient?",
                "options": [
                    "1.25 to 1.5 grams of protein per kg of body weight per day, and 30 to 35 calories per kg of body weight per day, along with Vitamin C and Zinc supplementation",
                    "0.6 to 0.8 grams of protein per kg per day, and 15 to 20 calories per kg per day to prevent kidney strain",
                    "A strict low-protein, pure carbohydrate diet with daily intravenous normal saline boluses",
                    "No nutritional adjustments are needed; wound healing is independent of nutritional status",
                    "Megadose protein (3-4 g/kg/day) combined with daily megestrol acetate"
                ],
                "answer": 0,
                "exp": "Wound healing requires significant metabolic resources. Guidelines recommend a high-protein diet (1.25-1.5 g/kg/day) to support collagen synthesis and positive nitrogen balance, along with high caloric intake (30-35 kcal/kg/day). Vitamin C and Zinc are cofactors for collagen synthesis and are supplemented in deficient patients."
            },
            {
                "q": "Which of the following blood markers is considered a more sensitive and rapid indicator of acute nutritional status and protein synthesis than albumin, due to its much shorter half-life (typically 2 days)?",
                "options": [
                    "Prealbumin (transthyretin)",
                    "Serum albumin",
                    "Hemoglobin",
                    "Total cholesterol",
                    "Serum creatinine"
                ],
                "answer": 0,
                "exp": "Prealbumin (transthyretin) has a half-life of only 2 days, making it highly sensitive to acute changes in nutritional status. Serum albumin has a half-life of 20 days and is also affected by inflammation/fluid shifts, making it a poor marker of acute nutritional changes."
            },
            {
                "q": "Which of the following vitamins or minerals serves as an essential cofactor for the enzymes prolyl hydroxylase and lysyl hydroxylase, which are required for collagen cross-linking and wound tensile strength?",
                "options": [
                    "Vitamin C (ascorbic acid)",
                    "Vitamin B12 (cobalamin)",
                    "Vitamin D (calcitriol)",
                    "Folic acid",
                    "Selenium"
                ],
                "answer": 0,
                "exp": "Vitamin C is a required cofactor for the hydroxylation of proline and lysine residues in procollagen. Hydroxylation is essential for the triple-helix stability and cross-linking of collagen. Vitamin C deficiency (scurvy) leads to severely compromised wound healing and capillary fragility."
            }
        ]
    },
    # 8. Pressure redistribution and repositioning
    {
        "title": "Repositioning and Support Surfaces",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with severe spastic quadriparesis secondary to a prior cervical spinal cord injury is admitted. The patient has a high risk of pressure injuries. The physician writes orders for a comprehensive pressure redistribution protocol, targeting repositioning frequency and the selection of specialized support surfaces."
        ),
        "questions": [
            {
                "q": "According to clinical guidelines, what is the recommended minimum repositioning frequency for a bed-bound older adult, and what specialized support surface is indicated?",
                "options": [
                    "Reposition at least every 2 hours in bed (and every 15-30 minutes in a wheelchair), using a high-specification reactive foam mattress or an alternating pressure active support surface",
                    "Reposition every 8 hours in bed, and use a standard high-density vinyl hospital mattress",
                    "Reposition weekly, and place the patient in a tight soft-padded brace to prevent movement",
                    "Repositioning is not recommended; it increases the risk of skin shear and trochanteric injury",
                    "Keep the patient in a prone position 24 hours a day on a hard plastic board"
                ],
                "answer": 0,
                "exp": "To prevent tissue ischemia, bed-bound patients should be repositioned at least every 2 hours. Wheelchair-bound patients should be shifted every 15-30 minutes. Specialized pressure-redistributing mattresses (foam, alternating pressure, air-fluidized) help distribute the patient's weight, keeping localized pressures below capillary perfusion thresholds."
            },
            {
                "q": "When positioning a patient in a lateral (side-lying) position to prevent pressure injuries, what is the recommended angle of inclination to avoid direct pressure on the greater trochanter?",
                "options": [
                    "A 30-degree lateral tilted position, using pillows to support the back and legs",
                    "A strict 90-degree lateral position, keeping the patient directly on their hip bone",
                    "A 180-degree prone position with no pillows",
                    "A 45-degree upright seated position in the bed",
                    "The patient should never be placed in a lateral position"
                ],
                "answer": 0,
                "exp": "A 30-degree lateral tilt position is recommended. A strict 90-degree side-lying position places the patient's entire lateral weight directly on the greater trochanter, which is a high-risk bony prominence that frequently breaks down. Pillows should be placed between the knees and ankles to prevent contact."
            },
            {
                "q": "Which of the following specialized support surfaces is strictly indicated for patients with severe, multiple Stage III/IV pressure injuries who are failing standard therapy, or those with extensive skin grafts?",
                "options": [
                    "Air-fluidized therapy bed (low-air-loss or high-fluidized)",
                    "Standard hospital spring mattress covered by a plastic sheet",
                    "Water-filled vinyl mattress with no heating elements",
                    "A hard wooden traction board covered by a cotton sheet",
                    "An electric heating pad applied directly to the sacrum"
                ],
                "answer": 0,
                "exp": "Air-fluidized beds utilize pressurized air flowing through silicone-coated ceramic beads, creating a fluid-like state. This reduces interface pressures well below capillary perfusion pressure, making them highly effective for patients with severe, non-healing Stage III/IV injuries."
            }
        ]
    },
    # 9. Wound debridement approaches
    {
        "title": "Selecting the Right Debridement Method",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with a large, chronic sacral pressure injury is evaluated. The wound is 5 cm in diameter, and the base is covered by a mixture of 60% thick, black, adherent eschar and 40% yellow, stringy slough. The patient has a normal WBC count and no signs of systemic infection (cellulitis or sepsis)."
        ),
        "questions": [
            {
                "q": "Which of the following represents the most appropriate debridement strategy for this stable patient?",
                "options": [
                    "Surgical (sharp) debridement for rapid removal of extensive eschar, or conservative enzymatic debridement (e.g., collagenase) for a slower, selective approach; autolytic debridement can be used as an adjunct",
                    "Wet-to-dry gauze dressings (mechanical debridement) as the primary, non-selective, first-line choice for all black eschars",
                    "Applying high-concentration nitric acid to burn off the eschar in the clinic",
                    "Strict non-intervention; allow the eschar to detach naturally without any wound dressings",
                    "Biologic debridement (maggot therapy) is strictly contraindicated in all pressure injuries"
                ],
                "answer": 0,
                "exp": "Necrotic tissue must be removed to promote healing and prevent infection. Sharp surgical debridement is fastest and best for large necrotic areas or active infection. Enzymatic debridement (collagenase) or autolytic debridement (hydrogels/hydrocolloids) are selective, slower alternatives for stable patients. Mechanical debridement (wet-to-dry) is non-selective, painful, and generally discouraged because it pulls off viable granulation tissue."
            },
            {
                "q": "Why is the use of 'wet-to-dry' gauze dressings (mechanical debridement) generally discouraged in modern wound care guidelines for clean, granulating wounds?",
                "options": [
                    "It is non-selective, causing significant pain and tearing away viable new granulation tissue and epithelial cells during removal",
                    "It causes rapid, severe systemic hypernatremia due to saline absorption",
                    "It is extremely expensive and requires a dedicated surgical team to change",
                    "It completely blocks the penetration of all systemic antibiotics into the wound bed",
                    "It has a high risk of causing direct thermal injury to the surrounding skin"
                ],
                "answer": 0,
                "exp": "Wet-to-dry dressings are non-selective: when the dry gauze is pulled off, it tears away whatever tissue has adhered to it, including fragile, viable granulation tissue and new epithelial cells, delaying healing and causing significant pain."
            },
            {
                "q": "Which of the following debridement methods utilizes sterile, medical-grade larvae (maggots) of the green bottle fly (Lucilia sericata) to selectively consume necrotic tissue and secrete antimicrobial enzymes?",
                "options": [
                    "Biologic debridement",
                    "Autolytic debridement",
                    "Enzymatic debridement",
                    "Mechanical debridement",
                    "Ultrasonic debridement"
                ],
                "answer": 0,
                "exp": "Biologic debridement (larval therapy) uses sterile larvae. Maggots selectively ingest necrotic tissue, sparing viable tissue. They also secrete enzymes that degrade bacteria (including MRSA) and stimulate tissue growth, making it a highly effective, selective debridement method."
            }
        ]
    },
    # 10. Device-related pressure injuries
    {
        "title": "Pressure from the Oxygen Tubing",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with severe COPD is admitted to the hospital for an acute exacerbation and is placed on continuous high-flow nasal cannula oxygen. 4 days later, during a routine assessment, the nurse identifies a painful, linear, non-blanchable red area of skin directly behind both ears, conforming exactly to the path of the plastic oxygen tubing."
        ),
        "questions": [
            {
                "q": "What is the correct diagnosis of this skin injury, and what is the best management?",
                "options": [
                    "Device-related pressure injury behind the ears; apply soft foam padding under the tubing, adjust the tension of the cannula, rotate the device if possible, keep the skin dry, and monitor closely",
                    "Contact dermatitis from a plastic allergy; discontinue oxygen therapy immediately and prescribe high-dose systemic prednisone",
                    "Superficial fungal infection (intertrigo); apply topical ketoconazole ointment and continue tight oxygen tubing",
                    "Normal age-related ear remodeling; no active intervention or changes are needed",
                    "Seigniorage necrosis; perform urgent plastic surgery reconstruction of the auricles"
                ],
                "answer": 0,
                "exp": "Medical device-related pressure injuries (MDRPIs) result from the use of devices designed for diagnostic or therapeutic purposes. The pressure conforms to the pattern/shape of the device. Management involves offloading the pressure: using protective foam barriers (e.g., silicone pads), loosening straps, rotating devices, and ensuring skin protection."
            },
            {
                "q": "Which of the following common medical devices is a frequent cause of device-related pressure injuries in hospitalized older adults, requiring daily skin checks under the device?",
                "options": [
                    "Foley catheters, cervical collars, endotracheal tubes, and tight pulse oximeter probes",
                    "Intravenous saline bags hanging on an IV pole",
                    "Standard bedside heart monitors",
                    "Manual blood pressure cuffs when deflated",
                    "Standard plastic bedpans when left under the bed"
                ],
                "answer": 0,
                "exp": "MDRPIs can be caused by any device in direct, sustained contact with the skin: cervical collars (injuring the chin/occiput), endotracheal tubes (injuring the lips), Foley catheters (injuring the thigh/urethra), and pulse oximeter probes (injuring fingers)."
            },
            {
                "q": "Why are device-related pressure injuries particularly challenging to diagnose in patients with severe cognitive impairment or aphasia?",
                "options": [
                    "The patients cannot verbally communicate their pain or discomfort under the device, requiring meticulous visual skin checks by nursing staff",
                    "The devices cause rapid, severe retrograde amnesia in these patients",
                    "Dementia directly prevents the skin from showing non-blanchable erythema",
                    "The devices precipitate rapidly in the brain, causing secondary seizures",
                    "There are no challenges; the injuries are immediately visible without examining the patient"
                ],
                "answer": 0,
                "exp": "Cognitively impaired or aphasic patients cannot report localized pain or pressure discomfort. This places the burden entirely on the clinical staff to perform daily, systematic skin inspections under all medical devices, tubes, and collars."
            }
        ]
    }
]

templates_malnutrition = [
    # 1. Protein-energy malnutrition
    {
        "title": "The Wasted Muscle and the Normal Albumin",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} residing in a long-term care facility is evaluated due to progressive weakness and weight loss. Over the past 6 months, the patient has experienced an unintentional weight loss of 12% of body weight. Physical exam shows prominent temporal wasting, loss of subcutaneous fat over the triceps, and bilateral ankle edema. Labs show serum albumin of 2.2 g/dL."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what is the relationship between serum albumin and malnutrition in the elderly?",
                "options": [
                    "Protein-Energy Malnutrition (PEM); serum albumin is a marker of severity and systemic inflammation/poor prognosis, but has low sensitivity/specificity as a sole diagnostic marker for malnutrition; perform a comprehensive nutritional assessment",
                    "Acute nephrotic syndrome; the low albumin is driven by primary glomerular loss, and muscle wasting is secondary to renal uremia",
                    "Normal age-related muscle redistribution; continue standard diet and prescribe daily oral megestrol acetate",
                    "Primary hepatic cirrhosis; the low albumin is driven by complete liver failure; refer for liver transplantation",
                    "PEM; immediately administer high-dose intravenous albumin infusions as the primary nutritional therapy"
                ],
                "answer": 0,
                "exp": "Protein-energy malnutrition presents with muscle/fat wasting and edema. While albumin is historically associated with malnutrition, it has a long half-life (20 days) and is a negative acute-phase reactant (drops during inflammation, infection, or fluid overload). A low albumin indicates poor prognosis and chronic illness, but is not a sensitive or specific diagnostic tool for malnutrition on its own."
            },
            {
                "q": "Which of the following clinical screening tools is the most widely validated and recommended method to identify malnutrition or risk of malnutrition in older adults in clinical and community settings?",
                "options": [
                    "Mini Nutritional Assessment (MNA)",
                    "Confusion Assessment Method (CAM)",
                    "Braden Scale",
                    "Katz Index of ADLs",
                    "Zarit Burden Interview"
                ],
                "answer": 0,
                "exp": "The Mini Nutritional Assessment (MNA) is the gold-standard screening and assessment tool for geriatric nutrition. It evaluates dietary intake, weight loss, mobility, acute stress, neuropsychological problems, and BMI (or calf circumference)."
            },
            {
                "q": "Which of the following physiological changes of normal aging contributes directly to the 'anorexia of aging' (the physiological decline in appetite and food intake)?",
                "options": [
                    "Decreased sensitivity to taste and smell, slower gastric emptying (causing early satiety), and altered satiety hormones (increased cholecystokinin)",
                    "A rapid acceleration of salivary amylase production causing early satiety",
                    "An increase in hypothalamic appetite-stimulating neuropeptide Y levels",
                    "Complete atrophy of the small intestinal mucosal absorptive villi",
                    "A primary hyperthyroid state causing chronic loss of appetite"
                ],
                "answer": 0,
                "exp": "The 'anorexia of aging' is driven by: (1) sensory declines (loss of taste and smell, making food less appealing), (2) GI changes (delayed gastric emptying, prolonging antral distension and causing early satiety), and (3) hormonal shifts (increased levels of the satiety hormone cholecystokinin/CCK, and decreased levels of the hunger hormone ghrelin)."
            }
        ]
    },
    # 2. Dysphagia screening
    {
        "title": "Difficulty Swallowing and Aspiration Risk",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with a history of advanced Parkinson's disease presents with a 2-week history of recurrent coughing, choking, and throat-clearing during meals, particularly when drinking water. The family notes the patient has had two episodes of 'bronchitis' over the past 3 months. Physical exam shows a quiet, wet voice after swallowing."
        ),
        "questions": [
            {
                "q": "What is the primary diagnostic concern, and what is the best initial clinical step?",
                "options": [
                    "Oropharyngeal dysphagia with high risk of aspiration pneumonia; perform a bedside swallow evaluation (or formal speech therapy consult), keep the patient NPO or recommend thickened liquids, and obtain a videofluoroscopic swallowing study (VFSS)",
                    "Gastroesophageal reflux disease (GERD); prescribe high-dose nightly omeprazole and continue standard thin liquids",
                    "A cute ischemic stroke; perform an emergent head CT and activate the stroke team for tPA",
                    "Parkinson's tremor of the vocal cords; increase the levodopa-carbidopa dose and recommend rapid drinking to bypass the tremor",
                    "Simple age-related dry throat; prescribe high-volume oral saline gargles twice daily"
                ],
                "answer": 0,
                "exp": "Coughing/choking with fluids and a 'wet' voice are classic signs of oropharyngeal dysphagia, highly common in Parkinson's, stroke, or dementia. The immediate risk is aspiration pneumonia. Management involves bedside screening, speech therapy referral, modified diets (thickened liquids, chin-tuck maneuver), and a videofluoroscopic swallow study (modified barium swallow)."
            },
            {
                "q": "Which of the following represents the gold-standard diagnostic imaging test used to objectively evaluate the physiology of swallowing, detect silent aspiration, and test the efficacy of compensatory maneuvers?",
                "options": [
                    "Videofluoroscopic Swallowing Study (VFSS) or Fiberoptic Endoscopic Evaluation of Swallowing (FEES)",
                    "Esophagogastroduodenoscopy (EGD) with esophageal biopsy",
                    "High-resolution esophageal manometry",
                    "Barium swallow (esophagram) in the supine position",
                    "CT scan of the neck with intravenous contrast"
                ],
                "answer": 0,
                "exp": "A VFSS (modified barium swallow) is a real-time fluoroscopic x-ray that visualizes the oral, pharyngeal, and upper esophageal phases of swallowing, allowing direct visualization of aspiration. FEES is an endoscopic alternative that can be performed at the bedside."
            },
            {
                "q": "Which of the following dietary modifications is commonly recommended by speech-language pathologists for patients with severe liquid-induced oropharyngeal dysphagia to reduce the risk of rapid aspiration?",
                "options": [
                    "Thickening liquids to nectar-like or honey-like consistency",
                    "Restricting all fluids and providing hydration via subcutaneous saline infusions only",
                    "Encouraging the patient to drink thin liquids rapidly through a straw",
                    "Serving all liquids at boiling temperatures to stimulate the pharyngeal reflex",
                    "Tapering all liquid intake to a maximum of 200 mL per day"
                ],
                "answer": 0,
                "exp": "Thickened liquids flow more slowly than thin liquids, giving the patient more time to coordinate the swallowing reflex, close the epiglottis, and protect the airway, thereby reducing the risk of aspiration."
            }
        ]
    },
    # 3. Enteral nutrition decisions in advanced dementia
    {
        "title": "Enteral Nutrition in Late-Stage Dementia",
        "age_range": (80, 95),
        "scenario": (
            "A {age}-year-old {gender} with advanced, late-stage Alzheimer's disease is admitted to the hospital due to progressive dysphagia, food refusal, and severe weight loss. The patient is non-verbal and requires assistance with all ADLs. The family is highly distressed and asks if a percutaneous endoscopic gastrostomy (PEG) tube should be placed to 'prevent starvation.'"
        ),
        "questions": [
            {
                "q": "According to clinical guidelines and scientific evidence, what is the most appropriate clinical and ethical recommendation regarding PEG tube placement in advanced dementia?",
                "options": [
                    "Strongly recommend against PEG tube placement; evidence shows it does not prolong survival, prevent aspiration pneumonia, improve nutritional markers, or reduce pressure ulcers in advanced dementia; recommend careful hand-feeding (comfort feeding) instead",
                    "Strongly recommend immediate PEG tube placement; it is the standard of care to prolong life and prevent aspiration in late-stage dementia",
                    "Recommend placing the PEG tube on a trial basis for 6 months, while keeping the patient strictly NPO",
                    "Advise the family that refusing a feeding tube is legally classified as elder neglect and requires an APS report",
                    "Recommend transitioning the patient to total parenteral nutrition (TPN) via a central venous catheter"
                ],
                "answer": 0,
                "exp": "The American Geriatrics Society (AGS) and American Academy of Hospice and Palliative Medicine (AAHPM) strongly advise against feeding tubes in advanced dementia. Studies show PEG tubes do not extend life, reduce aspiration (saliva is still aspirated), or improve quality of life. The recommended alternative is careful, patient-centered manual hand-feeding (comfort feeding), prioritizing comfort and human contact."
            },
            {
                "q": "Why does a PEG feeding tube fail to prevent aspiration pneumonia in patients with advanced dementia?",
                "options": [
                    "Aspiration in advanced dementia is primarily caused by the aspiration of oropharyngeal secretions (saliva) and gastric reflux, which is unaffected or even increased by enteral feeding tubes",
                    "The PEG tube catheter material directly degrades the epiglottal tissue, causing permanent closure failure",
                    "PEG tubes actively suppress the patient's cough reflex by blocking vagal feedback",
                    "Bacteria migrate directly from the stomach up the outer tube shaft into the larynx",
                    "None of the options; PEG tubes are 100% effective in preventing aspiration"
                ],
                "answer": 0,
                "exp": "Feeding tubes do not prevent aspiration. Patients with advanced dementia have impaired swallowing mechanics and aspirate their own saliva/oropharyngeal secretions. Furthermore, tube feeding can increase gastric volume and gastroesophageal reflux, leading to aspiration of gastric contents."
            },
            {
                "q": "What is the primary goal of 'comfort feeding' (careful hand-feeding) in a patient with late-stage dementia who is refusing food?",
                "options": [
                    "To offer food and fluids by mouth in small amounts, prioritizing the patient's comfort, pleasure, and dignity, without focusing on strict caloric targets or survival prolongation",
                    "To force-feed the patient a minimum of 2000 calories daily using specialized syringe feeding",
                    "To systematically restrict all food to accelerate the dying process and relieve suffering",
                    "To prepare the patient's esophagus for the future insertion of a surgical feeding tube",
                    "To verify that the patient's swallowing reflex is completely absent before starting TPN"
                ],
                "answer": 0,
                "exp": "Comfort feeding focuses on the quality of life. Food is offered slowly in small, appetizing portions, respecting the patient's cues (turning head away, closing mouth). The goal is to provide pleasure, comfort, and human interaction, recognizing that aggressive nutritional targets are inappropriate in terminal dementia."
            }
        ]
    },
    # 4. Refeeding syndrome risk
    {
        "title": "Refeeding Syndrome and Phosphate Shifts",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with a history of chronic severe malnutrition (secondary to severe depression and self-neglect) is admitted to the hospital. The patient has not had a significant meal in 3 weeks. The clinical team initiates aggressive enteral feeding. 48 hours later, the patient develops profound muscle weakness, confusion, and a new onset of ventricular arrhythmias."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, the primary electrolyte abnormality, and the best next step in management?",
                "options": [
                    "Refeeding syndrome; profound hypophosphatemia (along with hypokalemia and hypomagnesemia); hold/slow nutritional repletion, monitor and aggressively replete electrolytes (especially phosphate), and initiate cardiac monitoring",
                    "Acute uremic encephalopathy; severe hyperphosphatemia; perform emergent hemodialysis and double the rate of nutritional feed",
                    "Donepezil-induced cholinergic crisis; severe hyperkalemia; administer intravenous atropine and continue feeding",
                    "Simple food poisoning; severe hypernatremia; prescribe high-dose oral metoclopramide and continue aggressive feeding",
                    "Anaphylactic reaction to the enteral formula; administer intramuscular epinephrine and continue feeding"
                ],
                "answer": 0,
                "exp": "Refeeding syndrome occurs when nutrition is reintroduced to a severely malnourished patient. The shift from a catabolic (starvation) state to an anabolic state triggers a massive surge in **insulin**, which drives **phosphate**, potassium, and magnesium into cells. This causes severe extracellular hypophosphatemia, leading to cellular ATP depletion, muscle weakness, diaphragmatic failure, arrhythmias, and death. Management requires 'starting low and going slow' with calories, and aggressive electrolyte monitoring."
            },
            {
                "q": "What is the cellular mechanism by which a surge in insulin during refeeding leads to profound hypophosphatemia?",
                "options": [
                    "Insulin stimulates the intracellular transport of glucose, which requires phosphorylation (consuming phosphate to form glucose-6-phosphate), and drives phosphate directly into the intracellular compartment alongside potassium",
                    "Insulin directly stimulates the kidneys to excrete 100% of filtered phosphate in the urine",
                    "Insulin binds to serum phosphate, forming an insoluble macro-complex that precipitates in bone",
                    "Insulin blocks the intestinal absorption of dietary phosphate by downregulating the NaPi-IIb transporter",
                    "None of the options; insulin has no effect on phosphate transport"
                ],
                "answer": 0,
                "exp": "Starvation depletes body phosphate stores. When carbohydrate refeeding occurs, insulin is released. Insulin stimulates cellular glucose uptake. To metabolize glucose, cells must phosphorylate it (glucose-6-phosphate), which consumes the remaining inorganic phosphate and drives it into cells, causing a sudden, catastrophic drop in serum phosphate."
            },
            {
                "q": "Which of the following vitamins must be administered PRIOR to and during the refeeding process to prevent the development of Wernicke's encephalopathy in a chronically malnourished patient?",
                "options": [
                    "Thiamine (Vitamin B1)",
                    "Vitamin B12 (cobalamin)",
                    "Vitamin C (ascorbic acid)",
                    "Vitamin D (calcitriol)",
                    "Folic acid"
                ],
                "answer": 0,
                "exp": "Thiamine is an essential cofactor for carbohydrate metabolism (specifically the pyruvate dehydrogenase and transketolase enzymes). Malnourished patients are thiamine-depleted. Refeeding with carbohydrates without thiamine supplementation can rapidly deplete the remaining thiamine, triggering Wernicke's encephalopathy (confusion, ataxia, ophthalmoplegia)."
            }
        ]
    },
    # 5. Cachexia vs sarcopenia vs wasting
    {
        "title": "Understanding Weight Loss: Cachexia vs Sarcopenia",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with advanced stage IV lung cancer presents with a 20 lb weight loss over the past 3 months. The patient notes a complete loss of appetite and feeling profoundly fatigued. Physical exam shows generalized muscle wasting and loss of fat. Labs are notable for a significantly elevated C-reactive protein (CRP) and erythrocyte sedimentation rate (ESR)."
        ),
        "questions": [
            {
                "q": "What is the correct diagnosis, and what is the primary pathophysiological driver of this condition compared to simple starvation or sarcopenia?",
                "options": [
                    "Cancer cachexia; a complex metabolic syndrome driven by systemic inflammation and pro-inflammatory cytokines (e.g., TNF-alpha, IL-6) that accelerate muscle protein breakdown and suppress appetite; it cannot be fully reversed by nutritional supplementation alone",
                    "Primary sarcopenia; an age-related loss of muscle mass driven exclusively by a lack of physical exercise and normal hormonal decline",
                    "Simple starvation; a pure caloric deficiency driven by food unavailability that is completely reversed by enteral feeding",
                    "Vascular wasting syndrome; microvascular ischemia of the skeletal muscles causing local cell death",
                    "Megestrol toxicity; a drug-induced muscle breakdown that resolves upon starting high-dose prednisone"
                ],
                "answer": 0,
                "exp": "Cachexia is a metabolic syndrome associated with an underlying inflammatory illness (cancer, COPD, heart failure). It is driven by cytokines (TNF-alpha, also known as 'cachectin', IL-1, IL-6) that cause chronic inflammation, skeletal muscle proteolysis, and lipolysis. Unlike simple starvation (where fat is lost and muscle is spared, and is reversible with food), cachexia involves active muscle loss and does not reverse with caloric repletion alone."
            },
            {
                "q": "Which of the following cytokines is historically referred to as 'cachectin' due to its prominent role in driving the anorexia, muscle wasting, and lipid mobilization associated with cachexia?",
                "options": [
                    "Tumor Necrosis Factor-alpha (TNF-alpha)",
                    "Interleukin-10 (IL-10)",
                    "Transforming Growth Factor-beta (TGF-beta)",
                    "Interferon-beta",
                    "Erythropoietin"
                ],
                "answer": 0,
                "exp": "TNF-alpha was originally isolated and named 'cachectin' because of its ability to induce wasting and anorexia in animal models. It suppresses lipoprotein lipase, prevents fat storage, and stimulates the ubiquitin-proteasome pathway in muscle."
            },
            {
                "q": "What is the primary difference between sarcopenia and cachexia in terms of skeletal muscle loss and inflammation?",
                "options": [
                    "Sarcopenia is the age-related loss of muscle mass and strength without prominent systemic inflammation, while cachexia is an inflammatory-driven wasting syndrome associated with an underlying disease",
                    "Sarcopenia involves a massive increase in systemic cytokines, while cachexia is completely non-inflammatory",
                    "Sarcopenia affects only smooth muscle, while cachexia affects only cardiac muscle",
                    "Sarcopenia is completely reversible with protein supplements alone, while cachexia has no muscle involvement",
                    "There is no difference; the two terms are identical and synonymous in geriatric medicine"
                ],
                "answer": 0,
                "exp": "Sarcopenia is the physiologic, age-related decline in muscle mass and strength (often non-inflammatory or low-grade 'inflammaging'). Cachexia is a pathological, highly inflammatory wasting syndrome driven by a severe chronic illness (cancer, uremia, severe HF) that causes rapid muscle and fat breakdown."
            }
        ]
    },
    # 6. Anorexia of aging
    {
        "title": "Anorexia of Aging and Satiety Shifts",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} presents with a {duration}-month history of progressive appetite loss and gradual weight loss of 6 lbs. The patient reports feeling full after eating only a few bites of food (early satiety). Physical exam shows normal vitals and no signs of depression. The patient reports that food has lost its taste and smell, making eating feel like a chore."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what represents the underlying physiological mechanism?",
                "options": [
                    "Anorexia of aging; driven by a physiological decline in taste and smell sensitivity, delayed gastric emptying causing prolonged antral distension, and an increase in satiety hormones like cholecystokinin (CCK)",
                    "Early-stage gastric adenocarcinoma; driven by mechanical obstruction of the pylorus",
                    "Primary hyperthyroidism; driven by accelerated metabolic rate and secondary hyperphagia",
                    "Late-onset anorexia nervosa; driven by body dysmorphic disorder and intense fear of weight gain",
                    "Normal age-related increase in appetite; no changes are required as the patient's intake is normal"
                ],
                "answer": 0,
                "exp": "The 'anorexia of aging' is a recognized physiological syndrome characterized by a decrease in appetite and food intake in older adults. It is driven by: (1) sensory decline (loss of smell/taste), (2) delayed gastric emptying (leading to prolonged antral distension and early satiety), and (3) hormonal alterations (elevated basal levels of satiety hormones like CCK, and reduced ghrelin)."
            },
            {
                "q": "Which of the following gastrointestinal hormones is decreased in older adults, contributing directly to a lack of appetite and hunger stimulation?",
                "options": [
                    "Ghrelin",
                    "Cholecystokinin (CCK)",
                    "Leptin",
                    "Glucagon-like peptide-1 (GLP-1)",
                    "Secretin"
                ],
                "answer": 0,
                "exp": "Ghrelin is a peptide hormone secreted by the stomach that stimulates appetite ('the hunger hormone') via the hypothalamus. Aging is associated with a decrease in ghrelin levels or responsiveness, contributing to the physiological anorexia of aging."
            },
            {
                "q": "Which of the following represents the preferred first-line intervention for an older adult with anorexia of aging to improve caloric intake and prevent sarcopenia?",
                "options": [
                    "Offer small, frequent, nutrient- and calorie-dense meals, enhance food flavors with spices and herbs, promote social dining environments, and avoid restrictive diets",
                    "Prescribe oral megestrol acetate 400 mg daily as the primary first-line therapy",
                    "Initiate strict bed rest to reduce daily energy expenditure and preserve muscle mass",
                    "Advise the patient to drink high-volume water during meals to promote stomach stretching",
                    "Recommend a strict low-fat, low-carbohydrate, pure protein diet"
                ],
                "answer": 0,
                "exp": "First-line management for anorexia of aging is non-pharmacological. Megestrol acetate (appetite stimulant) is a Beers Criteria drug associated with high risks of deep vein thrombosis, fluid retention, and death, and should be avoided. Small, frequent, flavorful, nutrient-dense meals are preferred."
            }
        ]
    },
    # 7. Vitamin D deficiency in institutionalized elderly
    {
        "title": "Vitamin D Deficiency and Bone Pain",
        "age_range": (70, 95),
        "scenario": (
            "A {age}-year-old {gender} residing in a skilled nursing facility is evaluated due to generalized bone pain, diffuse proximal muscle weakness, and a history of 2 near-falls over the past {duration} months. The patient has minimal sunlight exposure. Labs show a serum 25-hydroxyvitamin D level of **10 ng/mL** and a parathyroid hormone (PTH) level of 110 pg/mL (normal 15-65)."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what represents the best management?",
                "options": [
                    "Vitamin D deficiency with secondary hyperparathyroidism; initiate high-dose oral Vitamin D3 (cholecalciferol) supplementation and optimize calcium intake",
                    "Primary hyperparathyroidism from a parathyroid adenoma; schedule the patient for immediate surgical parathyroidectomy",
                    "Severe osteoporosis alone; initiate daily oral alendronate immediately without supplementing Vitamin D",
                    "Multiple myeloma; schedule immediate pelvic radiation therapy and hold all calcium",
                    "Normal age-related bone remodeling; no interventions are indicated as the labs represent normal aging"
                ],
                "answer": 0,
                "exp": "Institutionalized elders are at high risk for Vitamin D deficiency due to lack of sunlight (UVB) exposure and poor dietary intake. A 25-OH-D level < 20 ng/mL confirms deficiency. This leads to reduced calcium absorption, triggering a compensatory increase in PTH (secondary hyperparathyroidism) to maintain serum calcium by pulling it from bones, causing osteomalacia, muscle weakness, and falls. Treatment involves high-dose Vitamin D3."
            },
            {
                "q": "What is the primary role of parathyroid hormone (PTH) in maintaining serum calcium levels during Vitamin D deficiency?",
                "options": [
                    "Stimulates osteoclast bone resorption, increases renal calcium reabsorption, and stimulates renal 1-alpha-hydroxylase to activate Vitamin D",
                    "Directly blocks calcium absorption in the proximal convoluted tubule",
                    "Inhibits osteoclast activity and stimulates osteoblasts to deposit calcium into the bone matrix",
                    "Increases renal phosphate reabsorption and decreases renal calcium clearance",
                    "Directly stimulates the parathyroid glands to release more calcitonin"
                ],
                "answer": 0,
                "exp": "During hypocalcemia, PTH is released. It acts to raise serum calcium by: (1) stimulating osteoclasts to resorb bone, (2) increasing calcium reabsorption in the distal renal tubule, and (3) stimulating the kidney to synthesize active 1,25-(OH)2-D3 (calcitriol), which increases intestinal calcium absorption."
            },
            {
                "q": "Which form of Vitamin D is the primary circulating form measured in clinical practice to determine a patient's overall Vitamin D storage status?",
                "options": [
                    "25-hydroxyvitamin D [calcidiol]",
                    "1,25-dihydroxyvitamin D [calcitriol]",
                    "Cholecalciferol [Vitamin D3]",
                    "Ergocalciferol [Vitamin D2]",
                    "7-dehydrocholesterol"
                ],
                "answer": 0,
                "exp": "Serum 25-hydroxyvitamin D (calcidiol) has a long half-life (2-3 weeks) and its levels directly reflect total body stores. Active 1,25-dihydroxyvitamin D (calcitriol) has a short half-life (4-6 hours) and is often normal or elevated in deficiency due to secondary hyperparathyroidism, making it a poor marker of storage status."
            }
        ]
    },
    # 8. Depression-related weight loss
    {
        "title": "Depression-Related Weight Loss in the Elder",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} is evaluated due to a progressive, unintentional weight loss of 15 lbs over the past 4 months. The patient moved into a retirement community 6 months ago. The patient reports a complete loss of appetite, anhedonia, waking up at 3:00 AM daily, and feeling like a 'useless burden.' Physical and laboratory evaluations are otherwise normal."
        ),
        "questions": [
            {
                "q": "What is the most likely diagnosis, and what represents the most appropriate management?",
                "options": [
                    "Geriatric major depressive disorder; initiate mirtazapine (or an SSRI like sertraline) and coordinate social and psychotherapeutic support",
                    "Late-stage Alzheimer's disease; initiate donepezil and memantine immediately and schedule a brain MRI",
                    "Cancer cachexia; refer the patient for immediate broad-spectrum chemotherapy and radiation",
                    "Normal age-related adjustment; reassure the patient that these feelings are normal and repeat the visit in 1 year",
                    "Primary hyperthyroidism; initiate daily oral methimazole and schedule a thyroidectomy"
                ],
                "answer": 0,
                "exp": "Depression in older adults frequently presents with somatic symptoms like severe anorexia, weight loss, and insomnia, rather than overt sadness. Anhedonia and feeling like a burden are key indicators. SSRIs (sertraline) or mirtazapine (which has specific side effects of weight gain and sedation) are preferred pharmacotherapies."
            },
            {
                "q": "Which of the following antidepressants is specifically preferred in older adults presenting with concurrent severe insomnia, weight loss, and anorexia, due to its specific side effect profile of sedation and appetite stimulation?",
                "options": [
                    "Mirtazapine",
                    "Sertraline",
                    "Fluoxetine",
                    "Amitriptyline",
                    "Bupropion"
                ],
                "answer": 0,
                "exp": "Mirtazapine is an atypical antidepressant that acts as an alpha-2 antagonist. Its H1 antihistaminic properties cause significant sedation (helping insomnia when taken at bedtime) and appetite stimulation/weight gain, making it highly effective for depressed, malnourished geriatric patients."
            },
            {
                "q": "Which of the following clinical screening tools is a widely validated, 15-item or 30-item questionnaire used specifically to identify depression in older adults, accounting for somatic overlap?",
                "options": [
                    "Geriatric Depression Scale (GDS)",
                    "Hamilton Depression Rating Scale (HAM-D)",
                    "Mini Nutritional Assessment (MNA)",
                    "Confusion Assessment Method (CAM)",
                    "Braden Scale"
                ],
                "answer": 0,
                "exp": "The Geriatric Depression Scale (GDS) is a validated, yes/no questionnaire developed specifically for the elderly. It excludes somatic symptoms (like fatigue or sleep changes, which can be normal aging or physical illness) to focus on cognitive/affective symptoms of depression."
            }
        ]
    },
    # 9. Medication-induced anorexia
    {
        "title": "Donepezil-Induced Nausea and Anorexia",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with moderate Alzheimer's disease was started on donepezil 10 mg daily 3 months ago. The patient's family brings {possessive} to the clinic due to persistent nausea, loss of appetite, and an unintentional weight loss of 8 lbs over the past 2 months. MoCA score is 16/30. Physical exam shows normal vitals and no acute abdomen."
        ),
        "questions": [
            {
                "q": "What is the most likely cause of this patient's anorexia and weight loss, and what is the best clinical management?",
                "options": [
                    "Donepezil-induced GI toxicity; evaluate the medication's continuing clinical benefit, and consider a dose reduction to 5 mg, transitioning to a different agent, or tapering and discontinuing donepezil",
                    "Normal progression of Alzheimer's disease; double the donepezil dose to 20 mg daily and prescribe oral megestrol acetate",
                    "Primary pancreatic malignancy; perform an emergent abdominal CT with contrast and refer for oncology",
                    "Donepezil allergy; discontinue the drug immediately and initiate high-dose daily oral prednisone",
                    "A cute bowel obstruction; immediately refer the patient to the emergency department for exploratory surgery"
                ],
                "answer": 0,
                "exp": "Cholinesterase inhibitors (donepezil, rivastigmine, galantamine) frequently cause dose-limiting gastrointestinal side effects: nausea, vomiting, diarrhea, anorexia, and weight loss. This is driven by cholinergic hyperstimulation of M3 receptors on GI smooth muscle. Doses should be reduced or stopped if they compromise nutritional status."
            },
            {
                "q": "What is the primary pharmacological mechanism by which cholinesterase inhibitors trigger gastrointestinal side effects like nausea, diarrhea, and anorexia?",
                "options": [
                    "Inhibition of acetylcholinesterase increases synaptic acetylcholine, which binds to muscarinic (M3) receptors on the gastrointestinal tract, stimulating smooth muscle contraction, hypermotility, and secretion",
                    "Direct chemical erosion of the gastric mucosal lining due to the highly acidic pH of the drug",
                    "Blockade of central dopamine D2 receptors in the chemoreceptor trigger zone",
                    "Direct inhibition of pancreatic lipase, preventing the digestion of dietary fats",
                    "Upregulation of the satiety hormone cholecystokinin in the duodenum"
                ],
                "answer": 0,
                "exp": "Donepezil blocks the breakdown of acetylcholine. The increased acetylcholine stimulates muscarinic M3 receptors in the gut, which increases gastrointestinal smooth muscle tone, peristalsis, and secretions, leading to cramping, nausea, vomiting, and diarrhea."
            },
            {
                "q": "Which of the following medications, commonly used in older adults for type 2 diabetes mellitus, is a frequent cause of nausea, early satiety, anorexia, and significant weight loss?",
                "options": [
                    "Metformin",
                    "Glipizide",
                    "Pioglitazone",
                    "Insulin glargine",
                    "Sitagliptin"
                ],
                "answer": 0,
                "exp": "Metformin is notorious for causing gastrointestinal side effects in older adults, including metallic taste, abdominal bloating, nausea, diarrhea, and weight loss. Dosing should be initiated low and titrated slowly, or switched if intolerable."
            }
        ]
    },
    # 10. MNA screening
    {
        "title": "Mini Nutritional Assessment: Screening Risk",
        "age_range": (65, 95),
        "scenario": (
            "A {age}-year-old {gender} with moderate osteoarthritis is evaluated in the clinic. As part of a preventive health screen, the physician administers the **Mini Nutritional Assessment (MNA)** short form. The patient lives alone, reports eating only 1 full meal a day, and has experienced a mild cognitive decline. The MNA short form score is calculated as **7 points**."
        ),
        "questions": [
            {
                "q": "What is the correct clinical interpretation of this MNA score, and what represents the most appropriate next step in management?",
                "options": [
                    "The patient is malnourished (MNA score 0-7 points = malnourished); complete the full MNA assessment, consult a registered dietitian, evaluate for reversible causes, and initiate nutritional supplementation",
                    "The patient is at risk of malnutrition (MNA score 8-11 points); reassure the patient and repeat the screen in 1 year",
                    "The patient has normal nutritional status (MNA score 12-14 points); no interventions are indicated",
                    "The score indicates acute renal failure; perform immediate suprapubic urinary catheterization",
                    "The MNA is non-quantitative; diagnostic staging must be based exclusively on serum albumin levels"
                ],
                "answer": 0,
                "exp": "The MNA short form is scored from 0 to 14: 12-14 = normal, 8-11 = at risk of malnutrition, 0-7 = malnourished. A score of 7 confirms malnutrition, requiring a full MNA assessment, clinical evaluation (depression, teeth, drugs), a dietitian consult, and initiating nutritional supplements."
            },
            {
                "q": "Which of the following represents the correct score ranges for the Mini Nutritional Assessment (MNA) short form tool?",
                "options": [
                    "12 to 14 points: Normal; 8 to 11 points: At risk of malnutrition; 0 to 7 points: Malnourished",
                    "15 to 20 points: Normal; 10 to 14 points: Moderate risk; < 10 points: Severe starvation",
                    "A score of exactly 30/30 is normal; scores < 24 indicate severe muscle wasting",
                    "MNA does not use numerical scoring; it is a visual assessment of muscle mass",
                    "None of the options; MNA is scored from 0 to 100"
                ],
                "answer": 0,
                "exp": "The MNA short form consists of 6 questions (food intake decline, weight loss, mobility, acute psychological stress/disease, neuropsychological problems, and BMI). The maximum score is 14. 12-14 is normal, 8-11 is at risk, and 0-7 is malnourished."
            },
            {
                "q": "If a patient's weight and height cannot be measured (e.g., bed-bound patient with severe contractures) to calculate Body Mass Index (BMI), which of the following is recommended by the MNA guidelines as a sensitive surrogate for muscle mass depletion?",
                "options": [
                    "Calf circumference (calf circumference < 31 cm indicates nutritional depletion)",
                    "Mid-upper arm span length",
                    "Abdominal girth at the level of the umbilicus",
                    "Visual inspection of the temporal wasting alone",
                    "Thickness of the calcaneal skin folds measured by calipers"
                ],
                "answer": 0,
                "exp": "When BMI cannot be calculated, the MNA short form substitutes BMI with calf circumference. A calf circumference less than 31 cm represents significant skeletal muscle depletion and is highly suggestive of malnutrition."
            }
        ]
    }
]
