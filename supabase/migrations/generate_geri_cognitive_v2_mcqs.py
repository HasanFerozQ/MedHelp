import json
import random

random.seed(42)

topic_slug = 'geri-cognitive-disorders'

# ============================================================
# 40 UNIQUE TEMPLATES - Geriatrics: Cognitive Disorders
# Covers: AD, VaD, DLB, FTD, MCI, NPH, CJD, Pseudodementia,
#         Delirium-on-Dementia, Medication-induced, Wernicke-Korsakoff,
#         CADASIL, PPA, FTD-ALS, Anti-amyloid Abs, Beers Criteria
# ============================================================

templates = [
    # ===== ALZHEIMER'S DISEASE (Templates 1-8) =====
    # T1: Classic AD presentation + histopathology
    {
        "q": "A {age}-year-old {gender} is brought to the clinic by a family member due to progressive memory loss over the past {duration} years. The family reports that the patient frequently misplaces items, repeats questions, and has difficulty managing finances. Cognitive testing reveals a MoCA score of **{moca}/30**. A brain MRI shows bilateral **{mri_ad}** atrophy. Which of the following describes the characteristic histopathological findings and first-line pharmacological treatment for this condition?",
        "options": [
            "Extracellular amyloid-beta plaques and intracellular hyperphosphorylated tau neurofibrillary tangles; treat with cholinesterase inhibitors (e.g., Donepezil)",
            "Alpha-synuclein cytoplasmic inclusions (Lewy bodies) in the substantia nigra; treat with high-dose levodopa/carbidopa",
            "Ubiquitin and tau-positive inclusions in the frontotemporal lobes; treat with high-dose atypical antipsychotics",
            "Spongiform encephalopathy with vacuolation of neurons; treat with acyclovir and corticosteroids",
            "Perivascular lymphocytic cuffs and demyelinating plaques; treat with interferon-beta"
        ],
        "answer": 0,
        "exp": "This patient''s clinical presentation—insidious onset, slowly progressive memory impairment, and bilateral **{mri_ad}** atrophy on brain MRI—is diagnostic of **Alzheimer''s disease (AD)**, the most common cause of dementia in older adults (60-80% of cases). The hallmark histopathological features include: (1) **Extracellular amyloid-beta (Aβ) plaques** derived from abnormal cleavage of amyloid precursor protein (APP) by β-secretase and γ-secretase, and (2) **Intracellular neurofibrillary tangles (NFTs)** consisting of **hyperphosphorylated tau protein**. These accumulate preferentially in the entorhinal cortex and hippocampus early in the disease. First-line pharmacological management for mild-to-moderate AD includes **cholinesterase inhibitors** (Donepezil, Galantamine, or Rivastigmine). Memantine (NMDA antagonist) is added for moderate-to-severe disease. (Ref: Hazzard''s Ch. 72; First Aid Step 2 CK)"
    },
    # T2: AD biomarkers - CSF and amyloid PET
    {
        "q": "A {age}-year-old {gender} presents with a {duration}-year history of progressive memory loss and word-finding difficulty. Cognitive testing shows impairment in delayed recall and executive function. MRI shows mild hippocampal atrophy. To support the clinical diagnosis and identify underlying Alzheimer''s pathology, a lumbar puncture is performed. Which of the following CSF biomarker profiles is most consistent with Alzheimer''s disease?",
        "options": [
            "Decreased CSF amyloid-beta 42 (Aβ42), increased total tau, and increased phosphorylated tau (p-tau)",
            "Increased CSF amyloid-beta 42 (Aβ42), decreased total tau, and decreased phosphorylated tau (p-tau)",
            "Normal CSF amyloid-beta 42 (Aβ42), markedly elevated 14-3-3 protein, and normal phosphorylated tau",
            "Elevated CSF amyloid-beta 42 (Aβ42), normal total tau, and elevated oligoclonal bands",
            "Decreased CSF amyloid-beta 42 (Aβ42), decreased total tau, and elevated CSF glucose"
        ],
        "answer": 0,
        "exp": "The characteristic CSF biomarker profile for **Alzheimer''s disease** is the **ATN framework**: (A) **Decreased CSF Aβ42** — amyloid-beta 42 is sequestered into brain plaques, reducing its CSF levels; (T) **Increased phosphorylated tau (p-tau 181 or p-tau 217)** — reflects tau tangle pathology; (N) **Increased total tau (t-tau)** — reflects neurodegeneration. This profile has high sensitivity (~95%) and specificity (~85%) for AD pathology. **Amyloid PET** (using florbetapir or flutemetamol) can also confirm cerebral amyloid deposition. Elevated 14-3-3 protein is characteristic of CJD, not AD. Oligoclonal bands suggest multiple sclerosis. These biomarkers are particularly useful in atypical presentations or when diagnostic certainty is needed for anti-amyloid therapy eligibility. (Ref: Hazzard''s Ch. 72; NIA-AA Research Framework 2018)"
    },
    # T3: AD genetics - early-onset vs late-onset
    {
        "q": "A {age2}-year-old {gender} presents with progressive memory loss, visuospatial disorientation, and difficulty with multistep tasks over the past {duration} years. Family history reveals that the patient''s mother developed dementia at age 52 and a sibling was diagnosed at age 48. Genetic testing is performed. Which of the following statements regarding the genetics of Alzheimer''s disease is most accurate?",
        "options": [
            "Early-onset familial AD (<65 years) is most commonly caused by autosomal dominant mutations in presenilin-1 (PSEN1) on chromosome 14, presenilin-2 (PSEN2) on chromosome 1, or amyloid precursor protein (APP) on chromosome 21; the APOE ε4 allele is the strongest genetic risk factor for late-onset sporadic AD",
            "Late-onset AD is caused exclusively by autosomal dominant mutations in the APOE gene on chromosome 19, with 100% penetrance in homozygous ε4 carriers",
            "Early-onset AD is caused by trinucleotide repeat expansions in the C9orf72 gene, which is also linked to amyotrophic lateral sclerosis",
            "The APOE ε2 allele is the strongest risk factor for both early-onset and late-onset AD and is associated with earlier age of onset",
            "Patients with Down syndrome (trisomy 21) have a decreased risk of AD due to overexpression of protective superoxide dismutase genes"
        ],
        "answer": 0,
        "exp": "**Early-onset familial Alzheimer''s disease** (<65 years, ~5% of AD cases) follows **autosomal dominant** inheritance and is most commonly caused by mutations in: (1) **PSEN1** (presenilin-1, chromosome 14) — the MOST common cause of early-onset familial AD, (2) **APP** (amyloid precursor protein, chromosome 21), or (3) **PSEN2** (presenilin-2, chromosome 1). These mutations increase production of the toxic Aβ42 fragment. **Late-onset sporadic AD** (>65 years, ~95% of cases) is influenced by the **APOE ε4 allele** (chromosome 19) — the strongest **genetic risk factor** (not deterministic). Each ε4 copy increases risk ~3-4x; homozygosity (ε4/ε4) increases risk ~12-15x. The **APOE ε2 allele is PROTECTIVE**. Patients with **Down syndrome (trisomy 21)** have an extra copy of APP, leading to increased Aβ production and nearly universal AD pathology by age 40. (Ref: Hazzard''s Ch. 72; First Aid Step 2 CK)"
    },
    # T4: AD staging - mild vs moderate vs severe
    {
        "q": "A {age}-year-old {gender} with Alzheimer''s disease is evaluated for disease progression. The caregiver reports that the patient now needs assistance with dressing (choosing appropriate clothing), frequently gets lost in familiar neighborhoods, cannot manage finances, but can still eat independently, walk without assistance, and maintain basic hygiene with reminders. Which stage of Alzheimer''s disease does this presentation represent, and what is the appropriate pharmacological approach?",
        "options": [
            "Moderate-stage AD; add memantine to the existing cholinesterase inhibitor regimen (combination therapy with donepezil + memantine)",
            "Mild-stage AD; continue cholinesterase inhibitor monotherapy and defer memantine until the patient becomes non-ambulatory",
            "Severe-stage AD; discontinue cholinesterase inhibitors and transition to comfort-focused palliative care only",
            "Mild Cognitive Impairment; no pharmacotherapy is indicated; manage with lifestyle modifications alone",
            "Moderate-stage AD; discontinue cholinesterase inhibitors and replace with high-dose atypical antipsychotics for behavioral management"
        ],
        "answer": 0,
        "exp": "This patient is in **moderate-stage Alzheimer''s disease**. AD staging is defined functionally: **Mild AD** — difficulty with complex IADLs (finances, medications, driving) but basic ADLs preserved and largely independent; **Moderate AD** — needs help with some basic ADLs (dressing, bathing), gets lost, impaired judgment, but can eat and ambulate; **Severe AD** — dependent for all ADLs, minimal verbal output, incontinent, bedbound. For moderate-to-severe AD, guidelines recommend **adding memantine** (NMDA receptor antagonist) to the existing cholinesterase inhibitor. The **donepezil + memantine combination** has shown modest but statistically significant benefits in cognition and global function compared to cholinesterase inhibitor alone. Antipsychotics should NOT be used as primary cognitive therapy. (Ref: AGS Geriatrics At Your Fingertips; Master the Boards Step 2 CK)"
    },
    # T5: AD non-pharmacological management
    {
        "q": "A {age}-year-old {gender} with mild-to-moderate Alzheimer''s disease lives at home with {possessive} spouse. The spouse asks about non-pharmacological strategies to improve the patient''s quality of life, maintain function, and reduce behavioral symptoms. Which of the following represents the most evidence-based approach?",
        "options": [
            "Structured daily routines, cognitive stimulation therapy (group activities, reminiscence), regular physical exercise, caregiver education, and environmental modifications (clear signage, nightlights, door alarms for wandering)",
            "Strict social isolation to reduce overstimulation, elimination of all physical activity to prevent falls, and locked room confinement during nighttime hours",
            "Intensive daily cognitive rehabilitation drills (e.g., 4 hours of memory flashcards) to reverse neurodegeneration and restore hippocampal volume",
            "Immediate placement in a skilled nursing facility regardless of disease stage to ensure professional supervision at all times",
            "High-dose melatonin (20 mg) and diphenhydramine (50 mg) nightly to ensure 12 hours of sleep and reduce daytime behavioral symptoms"
        ],
        "answer": 0,
        "exp": "**Non-pharmacological interventions** are the cornerstone of dementia care and should be implemented for ALL patients. Evidence-based strategies include: (1) **Structured daily routines** — predictability reduces anxiety and agitation; (2) **Cognitive stimulation therapy** — group-based activities including reminiscence, word games, and discussion have the strongest evidence for maintaining cognition; (3) **Regular physical exercise** — aerobic activity (walking, swimming) improves mood, reduces agitation, and may slow functional decline; (4) **Caregiver education** — training in communication techniques, behavioral management, and stress reduction; (5) **Environmental modifications** — clear signage, nightlights, door alarms, removing clutter to prevent falls and wandering; (6) **Music therapy** — reduces agitation and improves mood even in advanced disease. Social isolation, excessive sedation (especially with anticholinergics like diphenhydramine per Beers Criteria), and premature institutionalization are harmful. (Ref: AGS Geriatrics At Your Fingertips; Hazzard''s Ch. 73)"
    },
    # T6: AD BPSD - behavioral symptoms management
    {
        "q": "A {age}-year-old {gender} with moderate Alzheimer''s disease has developed increasing agitation, pacing, and verbal aggression, particularly in the late afternoon and evening (**sundowning**). The caregiver has tried structured routines and redirection with limited success. Which of the following is the most appropriate next step in management?",
        "options": [
            "Trial of a low-dose SSRI (e.g., citalopram or sertraline) for agitation, while continuing non-pharmacological strategies; if psychotic features (delusions, threatening hallucinations) are present, consider low-dose quetiapine with informed consent about the FDA black box warning for increased mortality risk",
            "Initiate high-dose haloperidol 10 mg daily as first-line treatment for sundowning behavior in all dementia patients",
            "Start lorazepam 2 mg three times daily for anxiety-related agitation, as benzodiazepines are the safest anxiolytic class in elderly patients with dementia",
            "Prescribe diphenhydramine 50 mg nightly to sedate the patient and eliminate sundowning episodes entirely",
            "Immediately initiate physical restraints during evening hours to prevent wandering and aggression"
        ],
        "answer": 0,
        "exp": "**Behavioral and Psychological Symptoms of Dementia (BPSD)** — including agitation, aggression, psychosis, and **sundowning** (worsening confusion/agitation in late afternoon/evening) — affect up to 90% of dementia patients. Management follows a stepwise approach: (1) **First-line: non-pharmacological** — structured routines, adequate lighting, reducing stimulation, music therapy, redirection; (2) **Second-line: pharmacotherapy** — **SSRIs** (citalopram ≤20mg in elderly, sertraline) have evidence for reducing agitation. **Antipsychotics** (quetiapine, risperidone) may be used for psychotic features (delusions, hallucinations) but carry an **FDA black box warning** for increased risk of cerebrovascular events and death in elderly patients with dementia. Must obtain informed consent. **AVOID per Beers Criteria**: benzodiazepines (paradoxical agitation, falls, respiratory depression), anticholinergics like diphenhydramine (worsen cognition, cause delirium), and physical restraints (increase agitation, injury, death). (Ref: AGS Beers Criteria 2023; Hazzard''s Ch. 73)"
    },
    # T7: AD caregiver burnout
    {
        "q": "A {age}-year-old {gender} with moderate Alzheimer''s disease is accompanied to the clinic by {possessive} primary caregiver (spouse). During the visit, the caregiver appears exhausted, tearful, and reports feeling overwhelmed, sleeping poorly, and having lost 15 pounds over the past 3 months. The caregiver says, ''I feel like I have no life anymore.'' Which of the following is the most important intervention at this visit?",
        "options": [
            "Screen the caregiver for depression and caregiver burnout; refer to caregiver support groups, arrange respite care (Adult Day Programs or in-home aides), and consider antidepressant therapy for the caregiver if depression is confirmed",
            "Reassure the caregiver that these feelings are normal and will resolve on their own once the patient is placed in a nursing home",
            "Focus exclusively on the patient''s cognitive testing and medication adjustments; the caregiver''s wellbeing is outside the scope of this visit",
            "Recommend that the caregiver increase the patient''s donepezil dose to reduce behavioral symptoms, which will indirectly relieve caregiver burden",
            "Advise the caregiver to hire full-time private nursing staff immediately, regardless of financial circumstances"
        ],
        "answer": 0,
        "exp": "**Caregiver burnout** is extremely common in dementia care and is a medical emergency in its own right. Over 40% of dementia caregivers develop clinical depression, and caregiver stress is independently associated with increased mortality. At every dementia visit, clinicians should: (1) **Screen the caregiver** for depression (PHQ-9), anxiety, and burnout; (2) **Refer to support groups** (e.g., Alzheimer''s Association, local support networks); (3) **Arrange respite care** — Adult Day Programs, in-home aides, or short-term residential respite to give the caregiver breaks; (4) **Treat caregiver depression** — SSRIs, counseling, and self-care strategies; (5) **Provide education** about disease progression, communication techniques, and advance care planning. Ignoring caregiver wellbeing leads to premature institutionalization of the patient and adverse health outcomes for both. (Ref: AGS Geriatrics At Your Fingertips; Hazzard''s Ch. 73; Alzheimer''s Association Guidelines)"
    },
    # T8: Early-onset AD vs late-onset
    {
        "q": "A {age2}-year-old {gender} with no significant past medical history presents with a {duration}-year history of progressive memory loss, word-finding difficulty, and visuospatial disorientation. Family history is remarkable for dementia in the patient''s mother (onset at age 50) and maternal uncle (onset at age 53). Brain MRI shows prominent parietal and posterior cortical atrophy. Which of the following is the most appropriate next step regarding the genetic evaluation of this patient?",
        "options": [
            "Genetic counseling and testing for autosomal dominant mutations in PSEN1 (most common cause of early-onset familial AD), PSEN2, and APP, given the strong family history and young age of onset",
            "APOE genotyping alone is sufficient for diagnosis, as the APOE ε4 allele is deterministic for early-onset AD",
            "No genetic testing is indicated because Alzheimer''s disease is never hereditary and all cases are sporadic",
            "Test for C9orf72 hexanucleotide repeat expansion, as this is the most common cause of all forms of Alzheimer''s disease",
            "Karyotyping to rule out Down syndrome (trisomy 21) in all patients presenting with early-onset dementia"
        ],
        "answer": 0,
        "exp": "**Early-onset Alzheimer''s disease (EOAD)** is defined as AD with symptom onset **before age 65** and accounts for ~5-10% of all AD cases. When there is a strong autosomal dominant family history (multiple affected members across generations with onset <65), genetic testing should be pursued after appropriate **genetic counseling**. The most common mutations are: (1) **PSEN1** (presenilin-1, chromosome 14) — accounts for ~80% of early-onset familial AD cases, with nearly 100% penetrance; (2) **APP** (chromosome 21) — ~10-15%; (3) **PSEN2** (chromosome 1) — rarest, variable penetrance. APOE ε4 is a **risk factor** for late-onset sporadic AD but is NOT deterministic and NOT routinely used for diagnosis. C9orf72 is associated with FTD and ALS, not AD. Posterior cortical atrophy (PCA) is a recognized variant of early-onset AD presenting with prominent visuospatial deficits. (Ref: Hazzard''s Ch. 72; First Aid Step 2 CK)"
    },
    # ===== VASCULAR DEMENTIA (Templates 9-14) =====
    # T9: Classic multi-infarct VaD
    {
        "q": "A {age}-year-old {gender} with a history of hypertension, type 2 diabetes, atrial fibrillation, and a prior stroke presents with a **stepwise decline** in cognitive function over the past {duration} years. The family reports episodes of sudden worsening followed by plateaus. Examination reveals {focal_sign}. Brain MRI shows **{mri_vad}**. Which of the following is the primary management strategy?",
        "options": [
            "Aggressive cardiovascular risk factor modification including blood pressure control (<130/80 mmHg), anticoagulation for atrial fibrillation, high-intensity statin therapy, and glycemic optimization to prevent further cerebrovascular events",
            "High-dose cholinesterase inhibitor monotherapy as first-line curative treatment for vascular dementia",
            "Immediate ventriculoperitoneal shunt placement to relieve cerebral edema from chronic ischemia",
            "Initiation of high-dose intravenous immunoglobulin (IVIG) to reduce cerebral vasculitis",
            "Empiric levodopa-carbidopa therapy to address the executive dysfunction and gait abnormalities"
        ],
        "answer": 0,
        "exp": "This patient has **vascular dementia (VaD)**, the second most common cause of dementia after Alzheimer''s disease. The hallmarks include: (1) **Stepwise cognitive decline** with sudden worsenings temporally related to cerebrovascular events followed by plateaus, (2) **Focal neurological signs** on examination, and (3) **Cerebrovascular disease on neuroimaging** (multiple infarcts, white matter hyperintensities). The **primary management** is **secondary stroke prevention** through aggressive cardiovascular risk factor modification: BP control (<130/80 per AHA/ASA), anticoagulation for atrial fibrillation (e.g., apixaban), high-intensity statins, glycemic control (HbA1c <7%), smoking cessation, and antiplatelet therapy if not anticoagulated. Cholinesterase inhibitors have shown only modest and inconsistent benefits in VaD and are NOT first-line. (Ref: Hazzard''s Ch. 72; Master the Boards Step 2 CK)"
    },
    # T10: Strategic single-infarct dementia
    {
        "q": "A {age}-year-old {gender} with a history of hypertension develops an **acute onset** of confusion, memory impairment, and apathy following a witnessed neurological event. CT angiography confirms an acute ischemic stroke. Brain MRI shows a single infarct in the **{strategic_location}**. Cognitive testing 3 months later reveals persistent executive dysfunction and memory impairment. Which of the following best explains this presentation?",
        "options": [
            "Strategic single-infarct dementia — a single stroke in a cognitively critical brain region (such as the thalamus, angular gyrus, or hippocampus) can cause significant cognitive impairment disproportionate to lesion size",
            "Multi-infarct dementia — requires at least five separate strokes in different vascular territories before cognitive impairment occurs",
            "Alzheimer''s disease — the stroke was coincidental and the cognitive decline is due to underlying neurodegenerative amyloid pathology unrelated to the infarct",
            "Normal Pressure Hydrocephalus — the single infarct disrupted CSF flow pathways, causing acute communicating hydrocephalus",
            "Creutzfeldt-Jakob Disease — the acute presentation and rapid cognitive decline indicate prion disease triggered by cerebral ischemia"
        ],
        "answer": 0,
        "exp": "**Strategic single-infarct dementia** is a recognized subtype of vascular cognitive impairment in which a **single stroke** in a **cognitively critical (''strategic'') brain region** produces significant cognitive impairment disproportionate to the small lesion size. Key strategic locations include: (1) **Bilateral thalamus** (especially the anterior and dorsomedial nuclei) — memory, executive function, and arousal; (2) **Angular gyrus** (dominant hemisphere) — Gerstmann syndrome (agraphia, acalculia, left-right confusion, finger agnosia) plus alexia and semantic processing deficits; (3) **Hippocampus** — acute amnesia; (4) **Caudate nucleus** — executive dysfunction, apathy, and behavioral changes; (5) **Anterior cerebral artery territory** — abulia, executive dysfunction. Management focuses on secondary stroke prevention and cognitive rehabilitation. (Ref: Hazzard''s Ch. 72; Current D&T Geriatrics)"
    },
    # T11: Subcortical vascular dementia (Binswanger's)
    {
        "q": "A {age}-year-old {gender} with a long history of poorly controlled hypertension and type 2 diabetes presents with a gradual decline in processing speed, executive function, and gait over the past {duration} years. The patient has become increasingly apathetic and emotionally labile. There is no clear stepwise pattern. Examination shows a {gait_vad} gait, pseudobulbar affect, and frontal release signs. Brain MRI reveals **extensive confluent periventricular and deep white matter hyperintensities** with relative preservation of cortical gray matter. Which of the following is the most likely diagnosis?",
        "options": [
            "Subcortical ischemic vascular dementia (Binswanger''s disease) — caused by chronic small vessel disease leading to diffuse white matter injury, executive dysfunction, gait disturbance, and emotional lability",
            "Alzheimer''s disease — characterized by progressive cortical atrophy with prominent hippocampal involvement and early memory loss",
            "Normal Pressure Hydrocephalus — defined by enlarged ventricles compressing periventricular white matter with the triad of gait apraxia, dementia, and urinary incontinence",
            "Multiple sclerosis — characterized by periventricular demyelinating plaques with relapsing-remitting neurological deficits in young adults",
            "Frontotemporal dementia — characterized by frontal and anterior temporal lobe atrophy with prominent behavioral changes and personality deterioration"
        ],
        "answer": 0,
        "exp": "**Subcortical ischemic vascular dementia (Binswanger''s disease)** is a subtype of vascular dementia caused by **chronic small vessel disease** (lipohyalinosis, arteriosclerosis) leading to **diffuse white matter injury** (leukoaraiosis). Key features include: (1) **Gradual rather than stepwise decline** (unlike multi-infarct dementia); (2) Prominent **executive dysfunction** (planning, organizing, multitasking) with relatively preserved episodic memory early on; (3) **Gait disturbance** (shuffling, wide-based, or apraxic gait); (4) **Psychomotor slowing**; (5) **Pseudobulbar affect** (involuntary laughing or crying); (6) **Urinary urgency/incontinence**. MRI shows extensive **confluent periventricular and deep white matter hyperintensities** on FLAIR/T2-weighted sequences. The primary risk factor is **chronic hypertension**. Management focuses on aggressive BP control and vascular risk factor modification. (Ref: Hazzard''s Ch. 72; Current D&T Geriatrics)"
    },
    # T12: VaD vs AD differential
    {
        "q": "A {age}-year-old {gender} presents with cognitive decline over the past {duration} years. The family asks how to differentiate Alzheimer''s disease from vascular dementia. Which of the following clinical features is MOST suggestive of **vascular dementia** rather than Alzheimer''s disease?",
        "options": [
            "Stepwise deterioration in cognition temporally related to cerebrovascular events, prominent executive dysfunction early in the course, focal neurological signs on examination, and evidence of cerebrovascular disease on neuroimaging",
            "Insidious onset with slowly progressive memory impairment as the earliest and most prominent symptom, with no focal neurological signs and bilateral hippocampal atrophy on MRI",
            "Fluctuating cognition with pronounced variations in attention, recurrent well-formed visual hallucinations, and spontaneous parkinsonism",
            "Early and prominent personality changes with disinhibition, loss of empathy, and hyperorality, with relative preservation of memory",
            "Rapid cognitive decline over weeks with startle myoclonus, cerebellar ataxia, and periodic sharp wave complexes on EEG"
        ],
        "answer": 0,
        "exp": "Differentiating **vascular dementia (VaD)** from **Alzheimer''s disease (AD)** is a high-yield clinical skill. Key distinguishing features of **VaD** include: (1) **Stepwise or fluctuating decline** temporally related to cerebrovascular events (vs. AD''s insidious, gradual progression); (2) **Early executive dysfunction** — impaired planning, judgment, and organization (vs. AD''s early episodic memory loss); (3) **Focal neurological signs** — hemiparesis, visual field cuts, gait abnormalities, pseudobulbar palsy (vs. AD which typically has no focal signs until late); (4) **Vascular risk factors** — hypertension, diabetes, atrial fibrillation, smoking; (5) **Neuroimaging** — multiple infarcts, white matter hyperintensities, strategic infarcts (vs. AD''s hippocampal/temporoparietal atrophy). The Hachinski Ischemic Score can help differentiate: score ≥7 suggests VaD, ≤4 suggests AD. (Ref: Hazzard''s Ch. 72; First Aid Step 2 CK)"
    },
    # T13: Mixed dementia (AD + VaD)
    {
        "q": "An {age}-year-old {gender} with a history of hypertension, diabetes, prior stroke, and a {duration}-year history of gradually progressive memory loss is evaluated for worsening cognition. Cognitive testing shows deficits in both **episodic memory** and **executive function**. Brain MRI reveals bilateral **hippocampal atrophy** AND **multiple periventricular white matter hyperintensities with old lacunar infarcts**. CSF biomarkers show decreased Aβ42 and elevated p-tau. Which of the following is the most likely diagnosis and management approach?",
        "options": [
            "Mixed dementia (coexisting Alzheimer''s disease and vascular dementia); manage with both cardiovascular risk factor modification AND cholinesterase inhibitor therapy, as the AD component may respond to pharmacotherapy",
            "Pure Alzheimer''s disease — the white matter changes are age-related and clinically insignificant; manage with cholinesterase inhibitors alone",
            "Pure vascular dementia — the hippocampal atrophy is a normal finding in elderly patients; manage with cardiovascular risk factor modification alone",
            "Normal Pressure Hydrocephalus — the combined imaging findings indicate obstructive hydrocephalus requiring VP shunt placement",
            "Creutzfeldt-Jakob Disease — the combination of memory and executive deficits with white matter changes suggests prion disease"
        ],
        "answer": 0,
        "exp": "**Mixed dementia** — the coexistence of **Alzheimer''s disease** and **cerebrovascular disease** — is the most common pathological finding in autopsy studies of elderly patients with dementia, accounting for up to 50% of cases in patients >80 years old. This patient demonstrates features of BOTH: AD features (gradually progressive memory loss, hippocampal atrophy, decreased CSF Aβ42 and elevated p-tau) AND VaD features (vascular risk factors, prior stroke, white matter hyperintensities, lacunar infarcts). Management should address BOTH pathologies: (1) **Cardiovascular risk factor modification** (BP control, statins, glycemic optimization, antiplatelets/anticoagulation as indicated) for the vascular component; (2) **Cholinesterase inhibitors ± memantine** for the Alzheimer''s component. Treating only one etiology is insufficient. (Ref: Hazzard''s Ch. 72; Current D&T Geriatrics)"
    },
    # T14: CADASIL
    {
        "q": "A {age3}-year-old {gender} with a history of recurrent migraines with aura since age 25 and a prior ischemic stroke at age 38 presents with progressive executive dysfunction, apathy, and gait unsteadiness over the past {duration} years. Family history reveals that the patient''s mother had recurrent strokes beginning at age 40 and developed dementia by age 50. Brain MRI shows **extensive white matter hyperintensities with characteristic involvement of the anterior temporal poles and external capsules**, with no significant atherosclerotic disease. Which of the following is the most likely diagnosis?",
        "options": [
            "CADASIL (Cerebral Autosomal Dominant Arteriopathy with Subcortical Infarcts and Leukoencephalopathy) — caused by mutations in the NOTCH3 gene on chromosome 19, leading to non-atherosclerotic small vessel disease",
            "Multiple sclerosis — a demyelinating disease characterized by periventricular plaques, optic neuritis, and relapsing-remitting course",
            "Fabry disease — an X-linked lysosomal storage disease causing stroke in young adults due to alpha-galactosidase A deficiency",
            "Moyamoya disease — progressive stenosis of the internal carotid arteries with collateral vessel formation on cerebral angiography",
            "Primary CNS vasculitis — inflammatory destruction of cerebral blood vessel walls requiring brain biopsy for diagnosis"
        ],
        "answer": 0,
        "exp": "**CADASIL** (Cerebral Autosomal Dominant Arteriopathy with Subcortical Infarcts and Leukoencephalopathy) is the most common hereditary cause of vascular dementia. Key features include: (1) **Autosomal dominant** inheritance — mutations in the **NOTCH3 gene** (chromosome 19p13) causing non-atherosclerotic degeneration of small vessel smooth muscle cells; (2) **Migraine with aura** — often the earliest symptom, beginning in the 20s-30s; (3) **Recurrent ischemic strokes** — typically lacunar, beginning in the 30s-50s; (4) **Progressive cognitive decline** — subcortical vascular dementia with executive dysfunction; (5) **Psychiatric symptoms** — depression, apathy, pseudobulbar affect. MRI shows **extensive white matter hyperintensities** with **characteristic involvement of the anterior temporal poles and external capsules** (a finding highly suggestive of CADASIL). Diagnosis is confirmed by NOTCH3 gene testing or skin biopsy showing granular osmiophilic material (GOM) in vessel walls. (Ref: Hazzard''s Ch. 72; Current D&T Geriatrics)"
    },
    # ===== DEMENTIA WITH LEWY BODIES (Templates 15-20) =====
    # T15: Classic DLB tetrad
    {
        "q": "A {age}-year-old {gender} is evaluated for a {duration}-year history of progressive cognitive impairment. The spouse reports that the patient''s cognitive function varies dramatically from day to day, with episodes of extreme confusion alternating with near-normal lucidity. The patient has reported detailed **visual hallucinations** of small animals in the house. Examination reveals cogwheel rigidity, bradykinesia, and a resting tremor. The spouse notes that the patient violently kicks and punches during sleep. Which of the following is the most likely diagnosis?",
        "options": [
            "Dementia with Lewy Bodies (DLB) — characterized by the core features of fluctuating cognition, recurrent visual hallucinations, spontaneous parkinsonism, and REM sleep behavior disorder",
            "Alzheimer''s disease with behavioral disturbance — visual hallucinations in AD typically occur only in the severe/end stage and are not a core diagnostic feature",
            "Parkinson''s disease with psychosis — the motor symptoms must precede cognitive decline by at least 1 year to differentiate from DLB",
            "Delirium due to underlying infection — the fluctuating cognition and hallucinations suggest an acute metabolic or infectious etiology",
            "Schizophrenia with late onset — visual hallucinations in the elderly are pathognomonic for late-onset schizophrenia"
        ],
        "answer": 0,
        "exp": "This patient presents with all four **core clinical features of Dementia with Lewy Bodies (DLB)**: (1) **Fluctuating cognition** — pronounced variations in attention and alertness, with episodes of confusion alternating with lucidity (''good days and bad days''); (2) **Recurrent visual hallucinations** — typically well-formed, detailed, and often non-threatening (people, animals, children); (3) **Spontaneous Parkinsonism** — rigidity, bradykinesia, resting tremor, postural instability (motor features are SPONTANEOUS, not drug-induced); (4) **REM sleep behavior disorder (RBD)** — loss of normal REM atonia, causing patients to physically act out dreams (kicking, punching, falling out of bed). DLB is the second most common neurodegenerative dementia after AD, accounting for 15-25% of cases. Histopathologically, it is characterized by **alpha-synuclein** inclusions (Lewy bodies) distributed throughout the cortex and brainstem. (Ref: Hazzard''s Ch. 72; First Aid Step 2 CK; McKeith Consensus Criteria 2017)"
    },
    # T16: DLB neuroleptic sensitivity
    {
        "q": "A {age}-year-old {gender} with recently diagnosed Dementia with Lewy Bodies is admitted to the hospital for management of distressing visual hallucinations. The on-call physician, unaware of the diagnosis, administers **haloperidol 5 mg IM**. Within hours, the patient develops severe rigidity, high fever (40.1°C), autonomic instability (labile blood pressure, tachycardia, diaphoresis), and obtundation. Which of the following best explains this life-threatening reaction?",
        "options": [
            "Neuroleptic sensitivity in DLB — patients with Lewy body disease have extreme sensitivity to dopamine D2 receptor blockade by antipsychotics, which can trigger severe extrapyramidal symptoms, neuroleptic malignant syndrome (NMS), irreversible parkinsonism, and death",
            "Serotonin syndrome caused by an interaction between haloperidol and the patient''s cholinesterase inhibitor medication",
            "Malignant hyperthermia triggered by the intramuscular injection technique rather than the medication itself",
            "Anticholinergic toxicity from haloperidol causing central hyperthermia, mydriasis, and urinary retention",
            "Sepsis from a hospital-acquired urinary tract infection coincidentally developing at the same time as the haloperidol administration"
        ],
        "answer": 0,
        "exp": "This is a classic and potentially fatal example of **neuroleptic sensitivity** in DLB. Patients with Lewy body disease (both DLB and Parkinson''s disease dementia) have an **extreme sensitivity to dopamine D2 receptor blockade** by antipsychotic medications. Administration of typical antipsychotics (haloperidol, chlorpromazine) or high-potency atypical antipsychotics can trigger: (1) **Severe extrapyramidal symptoms** — profound rigidity, akinesia; (2) **Neuroleptic malignant syndrome (NMS)** — hyperthermia, autonomic instability, altered consciousness, elevated CK; (3) **Irreversible parkinsonism**; (4) **Increased mortality** (2-3x). This occurs because the already depleted dopaminergic system in DLB cannot tolerate further D2 blockade. If antipsychotics are absolutely necessary, use only **low-dose quetiapine** (least D2 binding) or **pimavanserin** (selective 5-HT2A inverse agonist, FDA-approved for Parkinson''s disease psychosis, no D2 activity). **NEVER use haloperidol in DLB**. (Ref: Hazzard''s Ch. 72; AGS Beers Criteria; McKeith Consensus Criteria)"
    },
    # T17: DLB vs PDD - the 1-year rule
    {
        "q": "A {age}-year-old {gender} was diagnosed with Parkinson''s disease {pd_duration} years ago and has been managed with carbidopa-levodopa. Over the past year, the patient has developed progressive cognitive decline with impaired attention, executive dysfunction, and visual hallucinations. Which of the following BEST distinguishes this patient''s condition from Dementia with Lewy Bodies (DLB)?",
        "options": [
            "Parkinson''s Disease Dementia (PDD) — defined by the ''1-year rule'': if well-established Parkinson''s motor symptoms precede the onset of dementia by more than 1 year, the diagnosis is PDD; if dementia occurs before or within 1 year of parkinsonism, the diagnosis is DLB",
            "The distinction is based on the type of hallucinations: DLB causes visual hallucinations while PDD causes exclusively auditory hallucinations",
            "DLB and PDD are genetically distinct diseases with completely different pathological substrates — DLB involves tau protein while PDD involves alpha-synuclein",
            "PDD is diagnosed only when motor symptoms fail to respond to levodopa, whereas DLB always has levodopa-responsive parkinsonism",
            "The distinction is based on MRI findings: DLB shows cortical atrophy while PDD shows only brainstem atrophy"
        ],
        "answer": 0,
        "exp": "**DLB and Parkinson''s Disease Dementia (PDD)** are considered part of the same **Lewy body disease spectrum** — both are caused by **alpha-synuclein** aggregation (Lewy bodies). The clinical distinction is based on the **''1-year rule''**: (1) **DLB**: Dementia develops **before, simultaneously with, or within 1 year** of parkinsonism. Cognitive symptoms are the primary or co-equal presenting feature. (2) **PDD**: Well-established Parkinson''s disease motor symptoms (tremor, rigidity, bradykinesia) precede the onset of dementia by **more than 1 year** (typically 10+ years after PD diagnosis). In this case, the patient had PD for {pd_duration} years before developing dementia, making PDD the correct diagnosis. Both DLB and PDD can cause fluctuating cognition, visual hallucinations, and REM sleep behavior disorder. Both respond to cholinesterase inhibitors (rivastigmine has the best evidence). Both require avoidance of typical antipsychotics. (Ref: Hazzard''s Ch. 72; McKeith Consensus Criteria 2017)"
    },
    # T18: DLB diagnostic workup - DaTSCAN
    {
        "q": "A {age}-year-old {gender} presents with a {duration}-year history of fluctuating cognition, recurrent visual hallucinations, and mild parkinsonian features. The clinical team suspects Dementia with Lewy Bodies but wants to confirm the diagnosis with objective testing. Which of the following diagnostic investigations is MOST helpful as a supportive biomarker for DLB?",
        "options": [
            "DaTSCAN (ioflupane I-123 SPECT) showing reduced dopamine transporter uptake in the caudate nucleus and putamen, confirming presynaptic dopaminergic degeneration (an indicative biomarker for DLB)",
            "Brain MRI showing bilateral hippocampal atrophy — this finding is specific for DLB and not seen in Alzheimer''s disease",
            "Lumbar puncture showing elevated CSF amyloid-beta 42 — this is the gold standard biomarker for Lewy body pathology",
            "EEG showing generalized 3 Hz spike-and-wave complexes — this pattern is pathognomonic for DLB",
            "Serum alpha-synuclein antibody levels — a commercially available blood test that definitively diagnoses DLB in all cases"
        ],
        "answer": 0,
        "exp": "**DaTSCAN** (ioflupane I-123 SPECT imaging) is an **indicative biomarker** for DLB per the 2017 McKeith Consensus Criteria. It measures **dopamine transporter (DAT) density** in the striatum (caudate and putamen). In DLB, there is **reduced DAT uptake** reflecting presynaptic dopaminergic neuronal loss — a finding shared with Parkinson''s disease but NOT typically seen in Alzheimer''s disease. This makes DaTSCAN particularly useful for differentiating DLB from AD when the clinical picture is ambiguous. Other supportive biomarkers include: (1) **Polysomnography (PSG)** confirming REM sleep without atonia (RBD); (2) **MIBG myocardial scintigraphy** showing reduced cardiac sympathetic innervation; (3) **FDG-PET** showing occipital hypometabolism with preserved posterior cingulate (''cingulate island sign''). Hippocampal atrophy is more typical of AD than DLB. CSF Aβ42 is an AD biomarker. (Ref: McKeith et al. 2017 Consensus Criteria; Hazzard''s Ch. 72)"
    },
    # T19: DLB autonomic dysfunction
    {
        "q": "A {age}-year-old {gender} with known Dementia with Lewy Bodies presents with recurrent near-syncope when standing up from a seated position, severe constipation (bowel movements every 5-7 days), and new-onset urinary incontinence. Orthostatic vitals show a systolic blood pressure drop of **35 mmHg** upon standing with a heart rate increase of only 5 bpm. Which of the following best explains this constellation of symptoms?",
        "options": [
            "Autonomic dysfunction due to alpha-synuclein deposition in peripheral autonomic ganglia and brainstem autonomic nuclei, causing orthostatic hypotension, constipation, urinary dysfunction, and impaired heart rate response — a common and often underrecognized feature of Lewy body disease",
            "Medication-induced orthostatic hypotension from cholinesterase inhibitors alone — this resolves immediately upon drug discontinuation",
            "Dehydration due to inadequate oral intake — fluid replacement alone will completely resolve all symptoms including constipation and urinary incontinence",
            "Diabetic autonomic neuropathy — this diagnosis is most likely even without a history of diabetes mellitus",
            "Congestive heart failure with low cardiac output — the orthostatic changes indicate severely reduced ejection fraction requiring urgent echocardiography"
        ],
        "answer": 0,
        "exp": "**Autonomic dysfunction** is a common and often underrecognized feature of **Lewy body disease** (both DLB and PDD). Alpha-synuclein deposits accumulate in **peripheral autonomic ganglia**, the **intermediolateral cell column** of the spinal cord, and **brainstem autonomic nuclei** (dorsal motor nucleus of the vagus), causing: (1) **Orthostatic hypotension** — systolic drop ≥20 mmHg or diastolic drop ≥10 mmHg within 3 minutes of standing, with blunted heart rate response (neurogenic OH); (2) **Constipation** — due to reduced GI motility from vagal denervation; (3) **Urinary dysfunction** — urgency, frequency, incontinence; (4) **Excessive sweating or anhidrosis**; (5) **Sialorrhea** (drooling). Management of orthostatic hypotension includes: compression stockings, increased salt/fluid intake, elevating head of bed, and if needed, **midodrine** or **droxidopa** (FDA-approved for neurogenic OH). Fludrocortisone is second-line. (Ref: Hazzard''s Ch. 72; AGS Geriatrics At Your Fingertips)"
    },
    # T20: DLB pharmacotherapy
    {
        "q": "A {age}-year-old {gender} with Dementia with Lewy Bodies presents with worsening cognitive function, visual hallucinations that are now causing significant distress, and mild parkinsonian symptoms (bradykinesia and rigidity but no tremor). Which of the following represents the most appropriate pharmacological management plan?",
        "options": [
            "Rivastigmine (cholinesterase inhibitor) as first-line for both cognitive and behavioral symptoms; low-dose carbidopa-levodopa for motor symptoms if functionally limiting; pimavanserin or low-dose quetiapine if hallucinations are distressing and unresponsive to cholinesterase inhibitor therapy",
            "High-dose haloperidol for hallucinations, benztropine for rigidity, and memantine for cognitive symptoms",
            "Donepezil for cognition, high-dose trihexyphenidyl (anticholinergic) for motor symptoms, and olanzapine for hallucinations",
            "No pharmacotherapy is indicated for DLB; all treatment is non-pharmacological including environmental modifications and behavioral therapy only",
            "High-dose dopamine agonists (pramipexole 4.5 mg daily) as first-line for all DLB symptoms including cognition, hallucinations, and motor features"
        ],
        "answer": 0,
        "exp": "The pharmacological management of DLB requires a careful, balanced approach because treating one symptom domain can worsen another: **Cognitive/behavioral symptoms**: **Cholinesterase inhibitors** are first-line — **rivastigmine** has the strongest evidence for DLB (significant benefits for attention, hallucinations, and behavioral symptoms). **Motor symptoms**: **Low-dose carbidopa-levodopa** is preferred over dopamine agonists (agonists are more likely to worsen hallucinations and psychosis). Start at low doses and titrate slowly. **Hallucinations**: If non-distressing, reassurance and observation. If distressing, first optimize the cholinesterase inhibitor. If still problematic, use **pimavanserin** (5-HT2A inverse agonist, no D2 activity) or **low-dose quetiapine** (lowest D2 affinity among atypical antipsychotics). **NEVER USE**: haloperidol, olanzapine, risperidone (neuroleptic sensitivity), anticholinergics like benztropine/trihexyphenidyl (worsen cognition, cause delirium), or high-dose dopamine agonists (worsen psychosis). (Ref: Hazzard''s Ch. 72; McKeith Consensus 2017; AGS Geriatrics At Your Fingertips)"
    },
    # ===== FRONTOTEMPORAL DEMENTIA (Templates 21-26) =====
    # T21: Behavioral variant FTD
    {
        "q": "A {age4}-year-old {gender} is brought to the clinic by {possessive} spouse due to striking behavioral changes over the past {duration} years. The spouse reports that the patient has become increasingly socially inappropriate (making crude comments to strangers), shows a profound lack of empathy, has developed a compulsive craving for sweets (**hyperorality**), and repeatedly hoards items. Memory and visuospatial skills remain relatively intact on cognitive testing. Brain MRI reveals **{mri_ftd}** atrophy. Which of the following is the most likely diagnosis?",
        "options": [
            "Behavioral variant Frontotemporal Dementia (bvFTD) — characterized by early personality and behavioral changes (disinhibition, apathy, loss of empathy, hyperorality, compulsive behaviors) with relative preservation of memory and visuospatial skills; caused by frontal and anterior temporal lobe degeneration",
            "Alzheimer''s disease — characterized by early and prominent episodic memory loss with preservation of social behavior until late stages",
            "Bipolar disorder (manic episode) — characterized by elevated mood, pressured speech, decreased need for sleep, and grandiosity",
            "Dementia with Lewy Bodies — characterized by fluctuating cognition, visual hallucinations, and spontaneous parkinsonism",
            "Obsessive-compulsive disorder — characterized by ego-dystonic obsessions and compulsions that the patient recognizes as excessive"
        ],
        "answer": 0,
        "exp": "This patient''s presentation is classic for **behavioral variant Frontotemporal Dementia (bvFTD)**, the most common subtype of FTD. Diagnostic criteria (Rascovsky criteria) require at least 3 of the following 6 features: (1) **Early behavioral disinhibition** — socially inappropriate behavior, loss of manners; (2) **Early apathy/inertia** — loss of motivation, reduced initiative; (3) **Early loss of sympathy/empathy** — diminished response to others'' needs and feelings; (4) **Early perseverative, stereotyped, or compulsive/ritualistic behavior** — hoarding, repetitive movements; (5) **Hyperorality and dietary changes** — craving sweets, binge eating, attempting to eat inedible objects; (6) **Neuropsychological profile** showing **executive dysfunction with relative sparing of memory and visuospatial function**. Brain MRI shows **frontal and/or anterior temporal** atrophy, often asymmetric. FTD typically has an earlier onset (45-65 years) compared to AD (>65). Treatment is supportive: SSRIs for disinhibition and compulsive behaviors, trazodone for agitation. (Ref: Hazzard''s Ch. 72; Rascovsky Criteria 2011)"
    },
    # T22: Semantic variant PPA
    {
        "q": "A {age4}-year-old {gender} presents with a {duration}-year history of progressive difficulty understanding the meaning of words and recognizing objects. The patient speaks fluently with normal grammar and articulation but frequently asks, ''What does that word mean?'' and cannot name common objects (e.g., calls a ''hippopotamus'' an ''animal thing''). Episodic memory, visuospatial skills, and behavior are well preserved. Brain MRI shows **asymmetric anterior temporal lobe atrophy**, predominantly on the left side. Which of the following is the most likely diagnosis?",
        "options": [
            "Semantic variant Primary Progressive Aphasia (svPPA) — a subtype of frontotemporal dementia characterized by progressive loss of semantic knowledge (word meaning and object recognition) with preserved fluency, grammar, and speech production",
            "Alzheimer''s disease — characterized by early episodic memory loss rather than selective loss of semantic knowledge",
            "Broca''s aphasia from a left frontal stroke — characterized by nonfluent, effortful speech with agrammatism and preserved comprehension",
            "Wernicke''s aphasia from a left temporal stroke — characterized by fluent but nonsensical (jargon) speech with impaired comprehension and absent awareness of deficits",
            "Behavioral variant frontotemporal dementia — characterized by personality changes, disinhibition, and hyperorality rather than language deficits"
        ],
        "answer": 0,
        "exp": "**Semantic variant Primary Progressive Aphasia (svPPA)** is a subtype of FTD-spectrum disease characterized by **progressive loss of semantic knowledge** — the meanings of words and concepts. Key features include: (1) **Impaired confrontation naming** — cannot name objects, uses circumlocutions (''the thing you write with'' instead of ''pen''); (2) **Impaired single-word comprehension** — asks ''what does that mean?'' for previously known words; (3) **Surface dyslexia/dysgraphia** — reads/writes words by rules rather than by sight (e.g., reads ''yacht'' as ''yatched''); (4) **Preserved speech fluency and grammar** — sentences are grammatically correct but semantically empty; (5) **Preserved episodic memory and visuospatial skills** early on. Brain MRI shows **asymmetric anterior temporal lobe atrophy** (knife-edge atrophy of the temporal poles), typically left-predominant. Pathologically, svPPA is most commonly associated with **TDP-43 Type C** inclusions. No disease-modifying treatments exist; management is supportive with speech-language therapy. (Ref: Hazzard''s Ch. 72; Gorno-Tempini Classification 2011)"
    },
    # T23: Nonfluent/agrammatic variant PPA
    {
        "q": "A {age4}-year-old {gender} presents with a {duration}-year history of progressively worsening speech output. The patient speaks with great effort, producing short, grammatically simplified sentences (e.g., ''Me... go... store... yesterday'' instead of ''I went to the store yesterday''). Comprehension of simple sentences is preserved, but the patient struggles with syntactically complex sentences. Speech is halting with sound distortions (apraxia of speech). Brain MRI shows **left posterior frontal and insular atrophy**. Which of the following is the most likely diagnosis?",
        "options": [
            "Nonfluent/agrammatic variant Primary Progressive Aphasia (nfvPPA) — a subtype of frontotemporal dementia characterized by effortful, halting speech production with agrammatism and/or apraxia of speech, with left posterior frontal/insular atrophy",
            "Semantic variant PPA — characterized by loss of word meaning with preserved fluency and grammar",
            "Logopenic variant PPA — characterized by word-finding pauses in fluent speech with preserved grammar and impaired sentence repetition",
            "Broca''s aphasia from acute ischemic stroke — this diagnosis requires sudden onset rather than progressive worsening over years",
            "Behavioral variant FTD — characterized by personality changes and behavioral disinhibition rather than speech production deficits"
        ],
        "answer": 0,
        "exp": "**Nonfluent/agrammatic variant PPA (nfvPPA)** is characterized by: (1) **Agrammatism in language production** — simplified grammar, omission of function words and verb inflections, shortened sentence length; and/or (2) **Apraxia of speech** — effortful, halting speech with inconsistent sound errors and distortions, impaired speech motor planning. Comprehension of single words is preserved, but understanding of **syntactically complex sentences** is impaired (e.g., ''The dog that the cat chased was brown''). Brain MRI shows **left posterior frontal (inferior frontal gyrus/Broca''s area) and insular cortex atrophy**. Pathologically, nfvPPA is most commonly associated with **tau-positive pathology** (4R-tau, corticobasal degeneration or progressive supranuclear palsy pathology). Importantly, nfvPPA differs from acute Broca''s aphasia (stroke) by its **insidious, progressive** course. Treatment is speech-language therapy focused on compensatory communication strategies. (Ref: Gorno-Tempini Classification 2011; Hazzard''s Ch. 72)"
    },
    # T24: FTD genetics - C9orf72, MAPT, GRN
    {
        "q": "A {age4}-year-old {gender} with behavioral variant frontotemporal dementia has a family history of {possessive} father dying of ALS at age 55 and a paternal aunt developing FTD at age 52. Genetic testing is performed. Which of the following genetic findings is MOST likely in this family?",
        "options": [
            "C9orf72 hexanucleotide repeat expansion — the most common genetic cause of both familial FTD and familial ALS, explaining the co-occurrence of both diseases in this family through a shared genetic mechanism",
            "APOE ε4 homozygosity — the primary genetic cause of all frontotemporal dementia subtypes, regardless of family history",
            "Presenilin-1 (PSEN1) mutation on chromosome 14 — the most common cause of familial FTD with motor neuron disease",
            "Huntingtin (HTT) gene trinucleotide repeat expansion — the primary cause of behavioral FTD in families with co-occurring movement disorders",
            "NOTCH3 mutation on chromosome 19 — causing hereditary frontotemporal degeneration with subcortical infarcts"
        ],
        "answer": 0,
        "exp": "**C9orf72 hexanucleotide repeat expansion** (GGGGCC repeat in the C9orf72 gene on chromosome 9p21) is the **most common genetic cause of BOTH familial FTD (~25%) and familial ALS (~40%)**. It explains the well-recognized **FTD-ALS spectrum** — families may have members with FTD, ALS, or both (FTD-ALS overlap). The three major FTD genes are: (1) **C9orf72** — most common, autosomal dominant, associated with bvFTD, FTD-ALS, and psychotic features; (2) **MAPT** (microtubule-associated protein tau, chromosome 17) — causes tau-positive FTD (formerly FTDP-17); (3) **GRN** (progranulin, chromosome 17) — causes TDP-43-positive FTD, often with asymmetric atrophy. APOE ε4 is an AD risk factor, not FTD. PSEN1 causes early-onset AD. HTT causes Huntington''s disease. NOTCH3 causes CADASIL. Genetic counseling is essential before testing. (Ref: Hazzard''s Ch. 72; First Aid Step 2 CK)"
    },
    # T25: FTD vs AD differential
    {
        "q": "A family brings their {age4}-year-old relative to the clinic because of behavioral changes and cognitive decline. They want to know whether the condition is Alzheimer''s disease or frontotemporal dementia. Which of the following features is MOST suggestive of **frontotemporal dementia** rather than Alzheimer''s disease?",
        "options": [
            "Younger age of onset (typically 45-65 years), early personality and behavioral changes (disinhibition, apathy, loss of empathy) as the presenting symptom BEFORE significant memory loss, with frontal and anterior temporal lobe atrophy on MRI",
            "Onset after age 75, insidious progressive amnesia as the first and most prominent symptom, with bilateral hippocampal and temporoparietal atrophy on MRI",
            "Fluctuating cognition with pronounced day-to-day variation, recurrent detailed visual hallucinations, and spontaneous parkinsonism with resting tremor",
            "Acute stepwise cognitive decline temporally related to cerebrovascular events, with focal neurological deficits and multiple infarcts on brain MRI",
            "Rapidly progressive dementia over weeks with startle myoclonus, cerebellar ataxia, and periodic sharp wave complexes on EEG"
        ],
        "answer": 0,
        "exp": "Key features distinguishing **FTD from AD**: (1) **Age of onset**: FTD typically 45-65 years (the most common dementia in patients <60); AD typically >65 years; (2) **Presenting symptoms**: FTD — **behavioral/personality changes FIRST** (disinhibition, apathy, empathy loss, hyperorality) OR **language deficits first** (PPA variants); AD — **memory loss FIRST** (episodic memory, delayed recall); (3) **Cognitive profile**: FTD — executive dysfunction with **relative preservation of memory** and visuospatial function early on; AD — prominent memory and visuospatial impairment; (4) **Neuroimaging**: FTD — **frontal and/or anterior temporal** atrophy, often asymmetric; AD — **hippocampal and temporoparietal** atrophy; (5) **Insight**: FTD patients often have **poor insight** into their behavioral changes; AD patients may have early awareness of memory problems; (6) **Behavior**: FTD — disinhibition, compulsions, dietary changes; AD — typically preserved social behavior until moderate-severe stages. (Ref: Hazzard''s Ch. 72; Master the Boards Step 2 CK)"
    },
    # T26: FTD-ALS overlap
    {
        "q": "A {age4}-year-old {gender} with a {duration}-year history of behavioral changes (apathy, disinhibition, poor hygiene) is now developing progressive muscle weakness, fasciculations in the upper extremities, hyperreflexia, and difficulty swallowing (dysphagia). EMG shows evidence of widespread denervation with fibrillation potentials. Which of the following is the most likely unifying diagnosis?",
        "options": [
            "FTD-ALS (Frontotemporal Dementia with Amyotrophic Lateral Sclerosis) — a recognized overlap syndrome where behavioral/cognitive features of FTD co-occur with upper and lower motor neuron signs of ALS, most commonly associated with C9orf72 mutations",
            "Alzheimer''s disease with coincidental cervical myelopathy — the motor findings are unrelated to the cognitive decline",
            "Creutzfeldt-Jakob disease — prion disease causing both cognitive decline and motor neuron degeneration within weeks",
            "Multiple sclerosis — a demyelinating disease causing both cognitive decline and mixed upper and lower motor neuron signs",
            "Parkinson''s disease — causing both cognitive decline and progressive motor weakness with fasciculations"
        ],
        "answer": 0,
        "exp": "**FTD-ALS** is a well-recognized overlap syndrome in which features of **frontotemporal dementia** (behavioral changes, executive dysfunction, language impairment) co-occur with **amyotrophic lateral sclerosis** (upper motor neuron signs: hyperreflexia, spasticity, Babinski; AND lower motor neuron signs: muscle weakness, atrophy, fasciculations, fibrillation potentials on EMG). Key points: (1) **~15% of FTD patients** develop motor neuron disease; **~50% of ALS patients** develop some degree of cognitive/behavioral impairment; (2) The most common genetic cause is **C9orf72 hexanucleotide repeat expansion**; (3) When both FTD and ALS features are present, the prognosis is significantly worse (median survival 2-3 years) compared to either condition alone; (4) Pathologically, most FTD-ALS cases show **TDP-43** inclusions. EMG findings (widespread denervation, fibrillation potentials, positive sharp waves) confirm lower motor neuron involvement. Bulbar symptoms (dysphagia, dysarthria) are common and may necessitate early advance care planning and discussion of PEG tube placement. (Ref: Hazzard''s Ch. 72; Current D&T Geriatrics)"
    },
    # ===== MILD COGNITIVE IMPAIRMENT (Templates 27-30) =====
    # T27: Amnestic MCI
    {
        "q": "A {age}-year-old {gender} presents with concerns of gradual memory decline over the past year. The patient reports difficulty remembering recent conversations and occasionally forgetting appointments, but is still able to drive safely, manage complex finances independently, prepare meals, and complete all ADLs and IADLs without assistance. Cognitive testing shows a MoCA of **{moca2}/30** with impairment in **delayed recall** but normal performance in other domains. Which of the following is the most accurate diagnosis and its prognostic significance?",
        "options": [
            "Amnestic Mild Cognitive Impairment (aMCI) — objective memory impairment with preserved functional independence; carries the highest risk (~10-15% annual conversion rate) of progressing to Alzheimer''s disease dementia",
            "Early-stage Alzheimer''s dementia — functional independence is not relevant to the distinction between MCI and dementia",
            "Normal age-related memory decline — all elderly patients score 22-24/30 on MoCA and no further workup is needed",
            "Non-amnestic MCI — the memory impairment indicates this is the non-amnestic subtype with higher risk of converting to vascular dementia",
            "Pseudodementia — all memory complaints in elderly patients are attributable to depression until proven otherwise"
        ],
        "answer": 0,
        "exp": "**Amnestic MCI (aMCI)** is defined by: (1) **Subjective memory complaint** corroborated by an informant; (2) **Objective memory impairment** on cognitive testing (impaired delayed recall, as in this case); (3) **Preserved functional independence** — the patient can still manage ADLs (bathing, dressing, feeding) AND complex IADLs (finances, medications, driving, cooking) without assistance; (4) **NOT meeting criteria for dementia** (functional independence is the KEY distinguishing factor). aMCI carries the **highest risk of converting to Alzheimer''s disease dementia**, with annual conversion rates of **~10-15%** (compared to 1-2% in cognitively normal elderly). Risk factors for conversion include: APOE ε4 carrier status, abnormal AD biomarkers (low CSF Aβ42, high p-tau, positive amyloid PET), and greater degree of hippocampal atrophy. Importantly, **cholinesterase inhibitors are NOT recommended** for MCI — they do not prevent or delay conversion to dementia. Management focuses on exercise, cognitive engagement, cardiovascular risk factor modification, and regular monitoring. (Ref: AGS Geriatrics At Your Fingertips; Petersen MCI Criteria)"
    },
    # T28: Non-amnestic MCI
    {
        "q": "A {age}-year-old {gender} presents with difficulty planning complex tasks, organizing finances, and multitasking over the past year. Memory, language, and visuospatial function are intact on testing. The patient remains fully independent in all ADLs and IADLs but requires more effort than before for complex tasks. MoCA score is **{moca2}/30**, with deficits primarily in the **trail-making** and **abstraction** subtests. Which of the following is the most likely diagnosis, and what conditions is this subtype at risk of progressing to?",
        "options": [
            "Non-amnestic MCI (executive dysfunction subtype) — objective impairment in executive function with preserved memory and functional independence; at higher risk of progressing to vascular dementia, DLB, or frontotemporal dementia rather than Alzheimer''s disease",
            "Amnestic MCI — the executive dysfunction indicates this is the amnestic subtype at risk for Alzheimer''s disease",
            "Behavioral variant FTD — executive dysfunction with preserved memory always indicates FTD regardless of functional status",
            "Vascular dementia — executive dysfunction in the elderly is diagnostic of vascular dementia even without imaging evidence",
            "ADHD (attention-deficit/hyperactivity disorder) — new-onset executive dysfunction in elderly patients represents late-onset ADHD"
        ],
        "answer": 0,
        "exp": "**Non-amnestic MCI** is characterized by objective impairment in cognitive domains OTHER than memory — including **executive function** (planning, organization, multitasking, set-shifting), **language**, **attention**, or **visuospatial skills** — with **preserved functional independence**. This patient has the **executive dysfunction subtype** (impaired trail-making and abstraction, which test executive function). Non-amnestic MCI subtypes may progress to different dementias depending on the affected domain: (1) **Executive dysfunction** → higher risk of **vascular dementia** or **frontotemporal dementia**; (2) **Visuospatial impairment** → higher risk of **Dementia with Lewy Bodies**; (3) **Language impairment** → may progress to **Primary Progressive Aphasia** (FTD spectrum). This contrasts with **amnestic MCI**, which most commonly progresses to **Alzheimer''s disease**. Not all MCI patients progress — some remain stable and ~15-20% may even revert to normal cognition. (Ref: Petersen MCI Criteria; Hazzard''s Ch. 72)"
    },
    # T29: MCI risk factor modification
    {
        "q": "A {age}-year-old {gender} is diagnosed with Mild Cognitive Impairment. The patient asks about strategies to reduce the risk of progressing to dementia. Which of the following interventions has the STRONGEST evidence for reducing dementia risk in MCI patients?",
        "options": [
            "Regular aerobic physical exercise (e.g., 150 minutes per week of moderate-intensity activity such as brisk walking) — exercise has the strongest and most consistent evidence for reducing dementia risk and slowing cognitive decline in MCI",
            "Daily high-dose donepezil (23 mg) — cholinesterase inhibitors reliably prevent MCI from converting to dementia in all clinical trials",
            "Daily high-dose vitamin E (2000 IU) supplementation — vitamin E has been proven to reverse MCI and restore normal cognition",
            "Strict carbohydrate-free ketogenic diet — eliminating all carbohydrates prevents amyloid plaque formation and reverses cognitive decline",
            "Daily completion of crossword puzzles alone, without any physical activity — isolated cognitive tasks are equally effective as exercise in preventing dementia conversion"
        ],
        "answer": 0,
        "exp": "Among all interventions studied for MCI, **regular aerobic physical exercise** has the **strongest and most consistent evidence** for slowing cognitive decline and reducing dementia risk. The 2018 AAN practice guideline specifically recommends exercise (150 min/week of moderate-intensity aerobic activity) for MCI. Evidence-based strategies include: (1) **Exercise** (strongest evidence) — improves cerebral blood flow, neuroplasticity, BDNF levels, and cardiovascular health; (2) **Cardiovascular risk factor modification** — controlling hypertension, diabetes, hyperlipidemia, and obesity (these are modifiable risk factors for dementia); (3) **Mediterranean/MIND diet** — associated with reduced dementia risk in observational studies; (4) **Cognitive engagement** — social activities, learning new skills (complementary to exercise, not a substitute); (5) **Sleep optimization** — treating sleep apnea and insomnia. **NOT recommended**: Cholinesterase inhibitors (failed to show benefit in MCI trials), high-dose vitamin E (inconsistent evidence, potential cardiovascular risk), and ginkgo biloba (no proven benefit). (Ref: AAN MCI Practice Guideline 2018; AGS Geriatrics At Your Fingertips; Lancet Commission on Dementia 2020)"
    },
    # T30: MCI vs normal aging vs dementia
    {
        "q": "A {age}-year-old {gender} is worried about memory lapses. During the evaluation, the patient occasionally forgets where {pronoun} placed {possessive} car keys but always finds them eventually, occasionally takes longer to recall names of acquaintances, and processes new information slightly more slowly than before. All ADLs and IADLs are performed independently and efficiently. Cognitive testing shows a MoCA score of **27/30** with all domain scores within normal limits. Which of the following best characterizes this patient''s cognitive status?",
        "options": [
            "Normal age-associated cognitive changes — slower processing speed, occasional word-finding difficulty, and mild forgetfulness are expected in healthy aging and do NOT indicate MCI or dementia when cognitive testing is normal and function is fully preserved",
            "Mild Cognitive Impairment — any memory complaint in an elderly patient meets criteria for MCI regardless of cognitive test scores",
            "Early Alzheimer''s disease — misplacing keys is an early hallmark of Alzheimer''s disease that requires immediate treatment with donepezil",
            "Subclinical vascular dementia — slowed processing speed always indicates subcortical white matter ischemia requiring urgent MRI",
            "Pseudodementia — the patient''s concern about memory indicates underlying depression as the primary cause"
        ],
        "answer": 0,
        "exp": "**Normal age-associated cognitive changes** are common and should be distinguished from MCI and dementia. Normal aging involves: (1) **Slower processing speed** — takes longer to learn new information, which is the most consistent age-related cognitive change; (2) **Occasional word-finding difficulty** (''tip of the tongue'' phenomenon); (3) **Mild forgetfulness** — misplacing items but eventually finding them, forgetting names but recalling them later; (4) **Intact learning ability** — can learn new information, just takes more time and repetition. Critically, **cognitive testing is NORMAL** (MoCA ≥26 is generally considered normal) and **all functional abilities are fully preserved**. This contrasts with: **MCI** — objective impairment on cognitive testing (typically MoCA 18-25) with preserved functional independence; **Dementia** — objective cognitive impairment PLUS functional dependence (cannot manage ADLs or IADLs independently). Reassurance and education are appropriate; no pharmacotherapy is indicated. (Ref: AGS Geriatrics At Your Fingertips; Hazzard''s Ch. 72)"
    },
    # ===== OTHER COGNITIVE DISORDERS (Templates 31-36) =====
    # T31: Normal Pressure Hydrocephalus
    {
        "q": "A {age}-year-old {gender} is evaluated for progressive gait instability, cognitive decline, and urinary urgency/incontinence over the past {duration} months. Physical exam reveals a **{gait_nph}** gait pattern. Brain MRI shows **{mri_nph}** out of proportion to cortical sulcal atrophy. Which of the following is the most appropriate next diagnostic step?",
        "options": [
            "Large-volume lumbar puncture (removing 30-50 mL CSF) with pre- and post-procedure gait assessment and cognitive testing — improvement predicts successful treatment with ventriculoperitoneal (VP) shunt placement",
            "Emergent external ventricular drain placement due to acute obstructive hydrocephalus",
            "Trial of high-dose furosemide to reduce CSF production and relieve ventricular pressure",
            "Brain biopsy of the periventricular region to rule out lymphoma or gliomatosis cerebri",
            "Initiation of high-dose levodopa/carbidopa for 6 months before considering any surgical intervention"
        ],
        "answer": 0,
        "exp": "This patient presents with the classic triad of **Normal Pressure Hydrocephalus (NPH)** — ''wet, wobbly, and wacky'': (1) **Gait disturbance** (typically the earliest and most prominent symptom) — characteristically a **magnetic** gait (feet seem glued to the floor), broad-based, with short shuffling steps; (2) **Cognitive decline** — subcortical pattern with executive dysfunction, psychomotor slowing, and impaired attention; (3) **Urinary incontinence** — typically urgency-type initially, progressing to frank incontinence. MRI shows **ventriculomegaly** (Evans'' index >0.3) **disproportionate to sulcal atrophy** (distinguishing it from ex-vacuo hydrocephalus of neurodegeneration). The diagnostic and prognostic test is a **large-volume LP** (''tap test''), removing 30-50 mL of CSF and measuring gait speed and cognition before and after. Improvement in gait (the most responsive symptom) predicts a favorable response to definitive treatment: **VP shunt placement**. NPH is one of the few **reversible causes of dementia** if diagnosed early. (Ref: Hazzard''s Ch. 72; AGS Geriatrics At Your Fingertips)"
    },
    # T32: Pseudodementia
    {
        "q": "A {age}-year-old {gender} presents with a {duration2}-month history of memory difficulty, poor concentration, and low energy. During cognitive testing, the patient frequently responds **''I don''t know''** and makes minimal effort, but can complete tasks when encouraged. The patient appears tearful and expresses significant distress about {possessive} memory. {possessive_cap} spouse reports anhedonia, 10-pound weight loss, and early morning awakenings. Which of the following is the most likely diagnosis?",
        "options": [
            "Pseudodementia (depression-related cognitive impairment) — cognitive deficits secondary to major depressive disorder; characterized by poor effort on testing, ''I don''t know'' responses, acute/subacute onset, and marked distress about cognitive symptoms; fully reversible with antidepressant treatment",
            "Alzheimer''s disease — patients with AD typically express great distress and awareness of their memory impairment and give ''I don''t know'' responses on testing",
            "Frontotemporal dementia — weight loss and apathy in the elderly always indicate frontotemporal degeneration rather than depression",
            "Creutzfeldt-Jakob disease — the subacute onset over months suggests prion disease as the primary etiology",
            "Malingering — the patient is intentionally faking cognitive impairment for secondary gain"
        ],
        "answer": 0,
        "exp": "**Pseudodementia** (depressive cognitive impairment) refers to cognitive deficits occurring secondary to **major depressive disorder** in older adults. Key features distinguishing pseudodementia from true neurodegenerative dementia: PSEUDODEMENTIA: (1) **Acute or subacute onset** (weeks to months), often with identifiable precipitant; (2) **''I don''t know'' responses** — poor effort, gives up easily, but CAN perform when encouraged; (3) **Marked distress** about cognitive symptoms (patients with true dementia often minimize or are unaware); (4) **Vegetative symptoms** — anhedonia, weight change, sleep disturbance, fatigue; (5) **History of depression**. TRUE DEMENTIA: (1) Insidious onset over years; (2) Patients try to answer but make errors (''near-miss'' confabulations); (3) Often minimize or deny deficits; (4) Intact affect early on. Treatment: **SSRI** (sertraline or escitalopram) or **mirtazapine** (if appetite stimulation and sleep aid needed — avoid TCAs per Beers Criteria due to anticholinergic burden). Cognitive deficits are **fully reversible** with depression treatment. (Ref: Hazzard''s Ch. 72; AGS Geriatrics At Your Fingertips)"
    },
    # T33: CJD
    {
        "q": "A {age}-year-old {gender} is admitted due to an alarmingly **rapid cognitive decline** over the past {duration3} weeks, accompanied by cerebellar ataxia, cortical visual disturbances, and frequent involuntary muscle jerks (**startle myoclonus**). EEG shows **{eeg_cjd}**. Brain MRI with DWI demonstrates **restricted diffusion in the cortical ribbon and basal ganglia**. Which of the following is the most likely diagnosis and confirmatory test?",
        "options": [
            "Creutzfeldt-Jakob Disease (CJD) — a rapidly fatal prion disease; confirmed by CSF RT-QuIC assay (real-time quaking-induced conversion) or 14-3-3 protein, with characteristic MRI (cortical ribboning on DWI) and EEG (periodic sharp wave complexes)",
            "Rapidly progressive Alzheimer''s disease — confirmed by low CSF Aβ42 and treated with high-dose memantine",
            "Autoimmune encephalitis — confirmed by serum VDRL and treated with IV penicillin",
            "Viral encephalitis (HSV) — confirmed by CSF HSV PCR and treated with IV acyclovir; would show temporal lobe enhancement, not cortical ribboning",
            "Status epilepticus — the EEG findings and myoclonus indicate seizure activity requiring emergent benzodiazepines and phenytoin"
        ],
        "answer": 0,
        "exp": "**Creutzfeldt-Jakob Disease (CJD)** is the most common human prion disease, caused by the conformational conversion of normal cellular prion protein (PrPc) into a pathogenic, protease-resistant form (PrPsc), leading to **spongiform neurodegeneration**. Key diagnostic features: (1) **Rapidly progressive dementia** — decline over **weeks to months** (NOT years); (2) **Startle myoclonus** — sudden jerks triggered by noise or touch; (3) **Cerebellar ataxia** — gait unsteadiness, dysmetria; (4) **Cortical visual disturbance** — Heidenhain variant; (5) **EEG: periodic sharp wave complexes** (or triphasic waves); (6) **MRI: cortical ribboning** (restricted diffusion along the cortical ribbon on DWI) and **basal ganglia hyperintensity** on DWI/FLAIR — the most sensitive MRI finding; (7) **CSF: RT-QuIC** (real-time quaking-induced conversion) — highest sensitivity and specificity (~92% and ~100%); **14-3-3 protein** — elevated but less specific. CJD is **uniformly fatal** (median survival 5-12 months). There is no treatment; care is **supportive/palliative**. (Ref: Hazzard''s Ch. 72; First Aid Step 2 CK)"
    },
    # T34: Delirium superimposed on dementia
    {
        "q": "A {age}-year-old {gender} with known moderate Alzheimer''s disease is brought to the emergency department due to an **acute change** in mental status over the past 24 hours. At baseline, the patient was conversational and ambulatory with assistance. Now the patient is inattentive, disoriented, agitated, and having visual hallucinations that wax and wane. Vitals show temperature 38.8°C, HR {hr}, and oxygen saturation 93%. Which of the following is the MOST important next step?",
        "options": [
            "Evaluate for an underlying medical cause of delirium (infection, medications, metabolic derangement) using the Confusion Assessment Method (CAM) to confirm delirium; obtain urinalysis, chest X-ray, CBC, BMP, and review the medication list for deliriogenic drugs",
            "Increase the donepezil dose to treat the acute worsening of Alzheimer''s disease symptoms",
            "Administer haloperidol 10 mg IV for acute psychosis, as the visual hallucinations indicate a new psychiatric disorder",
            "Obtain an emergent brain MRI to rule out acute stroke, as the acute change in cognition indicates a large vessel occlusion",
            "Reassure the family that fluctuating confusion is a normal feature of moderate Alzheimer''s disease and does not require workup"
        ],
        "answer": 0,
        "exp": "**Delirium superimposed on dementia** is extremely common (affects up to 50% of hospitalized dementia patients) and is a medical emergency. Key distinguishing features: DELIRIUM: **acute** onset (hours to days), **fluctuating** course, **inattention** (cardinal feature), altered level of consciousness, often **reversible** once the underlying cause is treated. DEMENTIA: **insidious** onset (months to years), **progressive** course, **preserved attention** (until late stages), clear consciousness. When a patient with known dementia develops an **acute change** from baseline, always assume **delirium until proven otherwise**. The **Confusion Assessment Method (CAM)** is the standard screening tool (requires acute onset + inattention + EITHER disorganized thinking OR altered consciousness). Workup must identify the underlying cause: (1) **Infection** (UTI, pneumonia) — most common precipitant; (2) **Medications** (anticholinergics, benzodiazepines, opioids); (3) **Metabolic** (electrolyte abnormalities, uremia, hepatic encephalopathy); (4) **Pain, constipation, urinary retention**. Treatment is treating the underlying cause. AVOID antipsychotics unless patient is dangerous. (Ref: AGS Beers Criteria; Hazzard''s Ch. 71; Inouye Delirium Prevention)"
    },
    # T35: Medication-induced cognitive impairment
    {
        "q": "An {age}-year-old {gender} with a history of overactive bladder, insomnia, and chronic back pain is evaluated for a {duration2}-month history of progressive confusion, memory impairment, and visual hallucinations. Current medications include oxybutynin 5 mg TID, diphenhydramine 50 mg nightly, and diazepam 5 mg TID. The patient was cognitively normal prior to starting these medications. Which of the following medications is the MOST important to discontinue first, and why?",
        "options": [
            "All three medications have high anticholinergic burden or sedative properties and should be deprescribed; oxybutynin and diphenhydramine are strongly anticholinergic (Beers Criteria ''avoid'') and can cause cognitive impairment, confusion, and hallucinations; diazepam (long-acting benzodiazepine) increases fall and fracture risk — all should be tapered and replaced with safer alternatives",
            "Continue all current medications, as drug-induced cognitive impairment is extremely rare in elderly patients and these symptoms indicate early Alzheimer''s disease",
            "Discontinue only oxybutynin and replace with a higher dose of diphenhydramine for both bladder symptoms and sleep, as diphenhydramine is the safest medication in elderly patients",
            "Discontinue only diazepam and replace with lorazepam 2 mg TID, as shorter-acting benzodiazepines have no cognitive side effects in the elderly",
            "Add donepezil to counteract the cognitive side effects of the current medications while continuing all three drugs unchanged"
        ],
        "answer": 0,
        "exp": "**Medication-induced cognitive impairment** is a common and **reversible** cause of confusion in elderly patients. This patient is on THREE high-risk medications per the **AGS Beers Criteria**: (1) **Oxybutynin** — a first-generation antimuscarinic with HIGH **anticholinergic burden**; crosses the blood-brain barrier and is strongly associated with cognitive impairment, confusion, delirium, and hallucinations. Safer alternatives: mirabegron (β3-agonist, no anticholinergic effects) or behavioral bladder training; (2) **Diphenhydramine** — a first-generation antihistamine with STRONG anticholinergic properties; Beers Criteria: **AVOID** in elderly (causes sedation, cognitive impairment, delirium, falls). Safer sleep alternative: sleep hygiene, melatonin, trazodone; (3) **Diazepam** — a long-acting benzodiazepine (half-life ~100 hours in elderly); Beers Criteria: **AVOID** all benzodiazepines in elderly (increased risk of falls, fractures, cognitive impairment, paradoxical agitation). The **Anticholinergic Cognitive Burden (ACB) Scale** can quantify cumulative anticholinergic load. Adding donepezil to counteract anticholinergics is inappropriate — the correct approach is to **stop the offending agents**. (Ref: AGS Beers Criteria 2023; Hazzard''s Ch. 73)"
    },
    # T36: Wernicke-Korsakoff in elderly
    {
        "q": "A {age}-year-old {gender} with a history of chronic alcohol use disorder and poor nutritional status presents with acute confusion, horizontal nystagmus, bilateral lateral rectus palsy (CN VI), and unsteady gait. After treatment of the acute phase, the patient develops severe anterograde amnesia (unable to form new memories) and begins **confabulating** (fabricating elaborate stories to fill memory gaps without awareness of doing so). Which of the following is the most important initial treatment, and what complication must be avoided?",
        "options": [
            "IV thiamine (vitamin B1) must be administered BEFORE any glucose-containing fluids — glucose metabolism consumes thiamine, and giving glucose first can precipitate or worsen Wernicke encephalopathy; the acute phase (Wernicke) is reversible but the chronic amnestic phase (Korsakoff syndrome) is often permanent",
            "IV dextrose 50% (D50) should be given first to treat presumed hypoglycemia, followed by oral thiamine supplementation at discharge",
            "High-dose IV corticosteroids to reduce cerebral edema from alcohol-related neuroinflammation",
            "Emergent MRI-guided brain biopsy of the mammillary bodies to confirm the diagnosis before initiating any treatment",
            "Oral folate supplementation alone is sufficient to reverse both the acute encephalopathy and the chronic amnesia"
        ],
        "answer": 0,
        "exp": "This patient has **Wernicke-Korsakoff syndrome**, caused by **thiamine (vitamin B1) deficiency** — most commonly due to chronic alcohol use with malnutrition, but also seen in elderly patients with malabsorption, prolonged vomiting, or anorexia. **Wernicke encephalopathy** (acute phase) presents with the classic triad: (1) **Encephalopathy** (confusion, altered mental status); (2) **Oculomotor dysfunction** (nystagmus, lateral rectus palsy/CN VI, conjugate gaze palsy); (3) **Cerebellar ataxia** (wide-based, unsteady gait). Only ~16% present with the complete triad. **Korsakoff syndrome** (chronic phase) develops if Wernicke''s is untreated or inadequately treated: **anterograde amnesia** (cannot form new memories), **retrograde amnesia**, and **confabulation** (filling memory gaps with fabricated stories without awareness). CRITICAL: **IV thiamine MUST be given BEFORE glucose**. Glucose metabolism requires thiamine as a cofactor; administering glucose to a thiamine-depleted patient diverts the remaining thiamine stores, potentially precipitating or worsening Wernicke encephalopathy. Wernicke''s is **reversible** with prompt IV thiamine; Korsakoff''s is often **irreversible** (~20% recovery). (Ref: Hazzard''s Ch. 72; First Aid Step 2 CK)"
    },
    # ===== PHARMACOLOGY & MANAGEMENT (Templates 37-40) =====
    # T37: Cholinesterase inhibitors - mechanism and side effects
    {
        "q": "A {age}-year-old {gender} with mild Alzheimer''s disease is started on **{chei_drug} {chei_dose} mg** daily. Three weeks later, the patient presents with nausea, diarrhea, abdominal cramping, and a heart rate of **{hr2} bpm**. Which of the following best explains the mechanism of action of this drug class and its adverse effect profile?",
        "options": [
            "Cholinesterase inhibitors (donepezil, galantamine, rivastigmine) inhibit acetylcholinesterase, increasing acetylcholine at synapses; peripheral cholinergic excess causes GI symptoms (nausea, vomiting, diarrhea) and vagotonic bradycardia; the Beers Criteria cautions use in patients with bradycardia, sick sinus syndrome, or syncope history",
            "These drugs block muscarinic receptors, causing anticholinergic toxicity (tachycardia, urinary retention, dry mouth, constipation)",
            "These drugs are NMDA receptor antagonists that cause glutamate-mediated excitotoxicity leading to GI disturbance and cardiac arrhythmias",
            "These drugs are selective serotonin reuptake inhibitors (SSRIs) and the GI symptoms represent serotonin syndrome",
            "These drugs are dopamine agonists that cause peripheral vasodilation and reflex bradycardia"
        ],
        "answer": 0,
        "exp": "**Cholinesterase inhibitors (ChEIs)** — donepezil, galantamine, and rivastigmine — are first-line pharmacotherapy for **mild-to-moderate Alzheimer''s disease**. **Mechanism**: Inhibit acetylcholinesterase (AChE), preventing breakdown of acetylcholine (ACh) in the synaptic cleft, thereby increasing cholinergic neurotransmission. In AD, there is a deficit of ACh due to loss of cholinergic neurons in the nucleus basalis of Meynert. **Adverse effects** are due to peripheral cholinergic (parasympathetic) excess: (1) **GI**: nausea, vomiting, diarrhea, anorexia, abdominal cramps (most common, ~20%); (2) **Cardiovascular**: **bradycardia**, AV block, syncope (vagotonic effect); (3) **Other**: vivid dreams, insomnia (donepezil), muscle cramps. The **Beers Criteria** warns: use ChEIs with caution in patients with **bradycardia, sick sinus syndrome, cardiac conduction abnormalities, or history of syncope/falls**. Rivastigmine patch formulation reduces GI side effects compared to oral forms. All ChEIs provide modest symptomatic benefit (~1-2 point improvement on MMSE) but do NOT alter disease progression. (Ref: AGS Beers Criteria 2023; Hazzard''s Ch. 72)"
    },
    # T38: Memantine pharmacology
    {
        "q": "A {age}-year-old {gender} with moderate-to-severe Alzheimer''s disease is currently on donepezil. The family asks about adding memantine. Which of the following CORRECTLY describes memantine''s mechanism of action, indication, and evidence for combination therapy?",
        "options": [
            "Memantine is a low-affinity, uncompetitive NMDA receptor antagonist that blocks pathological tonic glutamate signaling (excitotoxicity) while preserving physiological synaptic transmission; it is indicated ONLY for moderate-to-severe AD (not mild AD or MCI); combination with a cholinesterase inhibitor provides modest additional benefit over monotherapy",
            "Memantine is a high-affinity competitive NMDA agonist that enhances glutamate signaling to improve synaptic plasticity; it is indicated for all stages of AD including MCI",
            "Memantine is a cholinesterase inhibitor that works synergistically with donepezil by inhibiting butyrylcholinesterase; it is indicated as first-line monotherapy for mild AD",
            "Memantine is an amyloid-beta monoclonal antibody that clears senile plaques; it is indicated only for early-stage AD with confirmed amyloid pathology on PET",
            "Memantine is a GABA-B receptor agonist that reduces neuronal excitability; it is indicated for all forms of dementia including vascular, Lewy body, and frontotemporal"
        ],
        "answer": 0,
        "exp": "**Memantine** is a **low-affinity, voltage-dependent, uncompetitive NMDA receptor antagonist**. In AD, chronic **glutamate excitotoxicity** occurs: excessive tonic activation of NMDA receptors leads to sustained calcium influx, causing synaptic dysfunction and neuronal death. Memantine''s unique mechanism: it preferentially blocks these **pathological tonic glutamate signals** (low-level, sustained) while **preserving normal physiological synaptic transmission** (brief, high-level glutamate bursts needed for learning and memory). This is possible because of its **low affinity and rapid off-rate** — it is displaced from the channel by the larger, faster glutamate signals of normal neurotransmission. **Clinical indication**: **Moderate-to-severe AD only** (MMSE ≤20 or CDR ≥2). It is NOT indicated for mild AD or MCI — clinical trials showed no significant benefit in these populations. **Combination therapy**: Memantine + cholinesterase inhibitor (e.g., donepezil) provides modest additional benefits in cognition, ADLs, and global function compared to ChEI alone in moderate-to-severe AD. Common side effects: dizziness, headache, constipation, confusion (generally well-tolerated). (Ref: Hazzard''s Ch. 72; Master the Boards Step 2 CK; AGS Geriatrics At Your Fingertips)"
    },
    # T39: Anti-amyloid antibodies (lecanemab)
    {
        "q": "A {age5}-year-old {gender} with early-stage Alzheimer''s disease confirmed by positive amyloid PET scan asks about newer anti-amyloid immunotherapy. The physician discusses lecanemab. Which of the following CORRECTLY describes this medication, its mechanism, and the most important adverse effect to monitor?",
        "options": [
            "Lecanemab is a humanized monoclonal antibody that targets soluble amyloid-beta protofibrils, reducing amyloid plaque burden; it modestly slows cognitive decline in early AD; the most important adverse effect is ARIA (Amyloid-Related Imaging Abnormalities) — cerebral edema (ARIA-E) and microhemorrhages (ARIA-H) — requiring regular MRI monitoring; APOE ε4 homozygotes have the highest ARIA risk",
            "Lecanemab is a small-molecule beta-secretase (BACE) inhibitor taken orally that completely halts amyloid production and reverses cognitive decline in all stages of AD",
            "Lecanemab is a tau protein vaccine that prevents neurofibrillary tangle formation; it is indicated for severe AD and has no significant side effects",
            "Lecanemab is a cholinesterase inhibitor delivered via monthly intrathecal injection that provides superior efficacy to oral donepezil",
            "Lecanemab is an NMDA receptor antagonist antibody that blocks glutamate excitotoxicity; it requires no imaging monitoring and is safe in all APOE genotypes"
        ],
        "answer": 0,
        "exp": "**Lecanemab (Leqembi)** is a humanized IgG1 monoclonal antibody that targets **soluble amyloid-beta (Aβ) protofibrils** — the most toxic form of aggregated amyloid. It received **full FDA approval** in 2023 based on the CLARITY-AD trial, which showed it reduced amyloid plaque burden and **slowed cognitive decline by ~27%** over 18 months in early symptomatic AD (MCI due to AD or mild AD dementia). Key points: (1) **Indication**: Early-stage AD with **confirmed amyloid pathology** (positive amyloid PET or CSF biomarkers); NOT indicated for moderate-severe AD; (2) **Administration**: IV infusion every 2 weeks; (3) **ARIA (Amyloid-Related Imaging Abnormalities)**: The most important adverse effect — **ARIA-E** (vasogenic edema, ~13%) and **ARIA-H** (microhemorrhages/superficial siderosis, ~17%). Most ARIA is asymptomatic but can cause headache, confusion, or seizures. Requires **regular MRI monitoring** (baseline, then periodically); (4) **APOE ε4 homozygotes** have the highest ARIA risk (~35%); APOE genotyping is recommended before treatment; (5) Anticoagulant use increases bleeding risk with ARIA-H. (Ref: CLARITY-AD Trial; FDA Prescribing Information; Hazzard''s Ch. 72)"
    },
    # T40: Beers Criteria high-risk medications in dementia
    {
        "q": "An {age}-year-old {gender} with moderate Alzheimer''s disease is being treated with multiple medications. According to the **AGS Beers Criteria**, which of the following medication combinations poses the GREATEST risk for worsening cognition, falls, and mortality in this patient?",
        "options": [
            "Chronic use of an antipsychotic (e.g., quetiapine for nonspecific behavioral symptoms), a benzodiazepine (e.g., lorazepam for anxiety), and a strongly anticholinergic medication (e.g., oxybutynin for overactive bladder) — all carry Beers Criteria warnings for dementia patients: antipsychotics have a black box warning for increased mortality, benzodiazepines increase fall/fracture risk and paradoxical agitation, and anticholinergics worsen cognitive impairment",
            "Combination of donepezil (cholinesterase inhibitor) and memantine (NMDA antagonist) — this combination is listed as ''avoid'' in the Beers Criteria due to dangerous drug-drug interactions",
            "Acetaminophen 650 mg scheduled every 6 hours with a daily multivitamin — both are considered high-risk medications in dementia patients per Beers Criteria",
            "Low-dose sertraline (50 mg) for depression with melatonin 3 mg at bedtime — SSRIs and melatonin are among the most dangerous drug classes in elderly patients with dementia",
            "Amlodipine 5 mg for hypertension with metformin 500 mg for diabetes — these cardiovascular medications are contraindicated in all patients with cognitive impairment"
        ],
        "answer": 0,
        "exp": "The **AGS Beers Criteria** identifies medications that pose disproportionate risks in older adults, especially those with dementia. The three most dangerous classes in dementia: (1) **Antipsychotics** — carry an **FDA BLACK BOX WARNING** for increased risk of cerebrovascular events and **death** (1.6-1.7x mortality) in elderly patients with dementia-related psychosis. Should be used only for severe, distressing, or dangerous psychotic symptoms after non-pharmacological approaches fail, with informed consent and regular reassessment. Should NOT be used for insomnia, wandering, or mild agitation; (2) **Benzodiazepines** — increase risk of **falls, hip fractures** (2x risk), excessive sedation, **paradoxical agitation**, respiratory depression, and worsening cognitive impairment. Avoid ALL benzodiazepines (short and long-acting) in dementia; (3) **Strongly anticholinergic medications** — oxybutynin, diphenhydramine, hydroxyzine, amitriptyline, paroxetine — directly worsen cognition by blocking muscarinic ACh receptors. The **Anticholinergic Burden Scale (ACB ≥3)** is associated with significant cognitive decline and delirium. Donepezil + memantine is NOT a Beers concern — this is a recommended combination. Acetaminophen and melatonin are generally safe. (Ref: AGS Beers Criteria 2023; Hazzard''s Ch. 73)"
    }
]

# ============================================================
# Randomization pools
# ============================================================
genders_pool = [
    {"gender": "female", "pronoun": "she", "pronoun_cap": "She", "possessive": "her", "possessive_cap": "Her"},
    {"gender": "male", "pronoun": "he", "pronoun_cap": "He", "possessive": "his", "possessive_cap": "His"},
    {"gender": "woman", "pronoun": "she", "pronoun_cap": "She", "possessive": "her", "possessive_cap": "Her"},
    {"gender": "man", "pronoun": "he", "pronoun_cap": "He", "possessive": "his", "possessive_cap": "His"}
]

mri_ad_pool = ["hippocampal and temporoparietal", "medial temporal lobe and parietal", "hippocampal and posterior cortical"]
mri_vad_pool = ["multiple lacunar infarcts and diffuse white matter hyperintensities", "periventricular ischemic changes and old subcortical infarcts", "bilateral basal ganglia lacunes and confluent periventricular white matter disease"]
mri_ftd_pool = ["bilateral frontal and anterior temporal lobe", "asymmetric frontotemporal", "predominantly left frontal and temporal"]
mri_nph_pool = ["ventriculomegaly", "enlarged lateral ventricles", "disproportionate ventricular enlargement"]
gait_nph_pool = ["magnetic", "broad-based, shuffling (magnetic)", "apraxic (magnetic)"]
gait_vad_pool = ["shuffling, wide-based", "apraxic", "small-stepped and unsteady"]
eeg_cjd_pool = ["periodic sharp wave complexes", "triphasic periodic complexes", "generalized periodic discharges"]
focal_sign_pool = ["a right-sided hemiparesis and right Babinski sign", "left-sided facial droop and pronator drift", "right visual field cut (homonymous hemianopia) and mild dysarthria", "left-sided upper extremity weakness and hyperreflexia"]
strategic_location_pool = ["left thalamus (anterior and dorsomedial nuclei)", "dominant (left) angular gyrus", "bilateral hippocampi", "left caudate nucleus"]

chei_drugs = [
    {"name": "Donepezil", "dose": "10"},
    {"name": "Donepezil", "dose": "5"},
    {"name": "Galantamine", "dose": "16"},
    {"name": "Galantamine", "dose": "24"},
    {"name": "Rivastigmine", "dose": "9.5"},
    {"name": "Rivastigmine", "dose": "6"}
]

mcqs = []
seen_questions = set()

# Generate 10 variants per template = 400 MCQs
for t_idx, t in enumerate(templates):
    variants_generated = 0
    attempts = 0
    while variants_generated < 10 and attempts < 100:
        attempts += 1
        age = random.randint(66, 94)
        age2 = random.randint(48, 62)  # Early-onset AD
        age3 = random.randint(42, 55)  # CADASIL
        age4 = random.randint(52, 68)  # FTD
        age5 = random.randint(62, 78)  # Anti-amyloid eligibility
        gp = random.choice(genders_pool)
        duration = random.randint(2, 5)
        duration2 = random.randint(3, 8)  # months for pseudodementia
        duration3 = random.randint(2, 6)  # weeks for CJD
        moca = random.randint(14, 22)
        moca2 = random.randint(22, 25)  # MCI range
        hr = random.randint(88, 110)
        hr2 = random.randint(46, 54)  # bradycardia
        pd_duration = random.randint(8, 15)

        chei = random.choice(chei_drugs)

        format_kwargs = {
            "age": age, "age2": age2, "age3": age3, "age4": age4, "age5": age5,
            "gender": gp["gender"], "pronoun": gp["pronoun"], "pronoun_cap": gp["pronoun_cap"],
            "possessive": gp["possessive"], "possessive_cap": gp["possessive_cap"],
            "duration": duration, "duration2": duration2, "duration3": duration3,
            "moca": moca, "moca2": moca2,
            "mri_ad": random.choice(mri_ad_pool),
            "mri_vad": random.choice(mri_vad_pool),
            "mri_ftd": random.choice(mri_ftd_pool),
            "mri_nph": random.choice(mri_nph_pool),
            "gait_nph": random.choice(gait_nph_pool),
            "gait_vad": random.choice(gait_vad_pool),
            "eeg_cjd": random.choice(eeg_cjd_pool),
            "focal_sign": random.choice(focal_sign_pool),
            "strategic_location": random.choice(strategic_location_pool),
            "chei_drug": chei["name"], "chei_dose": chei["dose"],
            "hr": hr, "hr2": hr2,
            "pd_duration": pd_duration
        }

        try:
            q_text = t["q"].format(**format_kwargs)
        except KeyError:
            continue

        if q_text in seen_questions:
            continue

        opts_formatted = []
        for o in t["options"]:
            try:
                o_fmt = o.format(**format_kwargs)
            except KeyError:
                o_fmt = o
            opts_formatted.append(o_fmt)

        try:
            exp_formatted = t["exp"].format(**format_kwargs)
        except KeyError:
            exp_formatted = t["exp"]

        correct_opt = opts_formatted[t["answer"]]
        random.shuffle(opts_formatted)
        new_ans_idx = opts_formatted.index(correct_opt)

        q_esc = q_text.replace("'", "''")
        opts_json = json.dumps(opts_formatted).replace("'", "''")
        exp_esc = exp_formatted.replace("'", "''")

        mcq_str = f"    (v_topic_id, '{q_esc}', '{opts_json}'::jsonb, {new_ans_idx}, '{exp_esc}')"

        seen_questions.add(q_text)
        mcqs.append(mcq_str)
        variants_generated += 1

print(f"Total unique MCQs generated: {len(mcqs)}")

# Split into 4 parts of 100
parts = [mcqs[i:i+100] for i in range(0, len(mcqs), 100)]

for part_num, part_mcqs in enumerate(parts, 1):
    out_file = f"c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\supabase\\migrations\\20260520_geri_cognitive_mcqs_p{part_num}.sql"
    with open(out_file, "w", encoding="utf-8") as f:
        f.write(f"-- US MD/MBBS (4th Year) clinical case blocks - Geriatrics: Cognitive disorders - Alzheimer's, vascular, Lewy body, frontotemporal dementia, MCI - Part {part_num} ({(part_num-1)*100+1}-{part_num*100})\n")
        f.write("BEGIN;\n\n")
        f.write("DO $$\nDECLARE\n    v_topic_id UUID;\nBEGIN\n")
        f.write(f"    SELECT id INTO v_topic_id FROM topics WHERE slug = '{topic_slug}' LIMIT 1;\n")
        f.write(f"    IF v_topic_id IS NULL THEN\n        RAISE EXCEPTION 'Topic {topic_slug} not found.';\n    END IF;\n\n")
        
        if part_num == 1:
            f.write("    DELETE FROM mcqs WHERE topic_id = v_topic_id;\n\n")
        
        f.write("    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES\n")
        for i, m in enumerate(part_mcqs):
            if i < len(part_mcqs) - 1:
                f.write(m + ",\n")
            else:
                f.write(m + ";\n")
        f.write("END $$;\nCOMMIT;\n")
    
    print(f"Part {part_num}: {len(part_mcqs)} MCQs -> {out_file}")

print(f"\nDone! Total: {len(mcqs)} MCQs in {len(parts)} files.")
