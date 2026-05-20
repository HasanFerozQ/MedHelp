import json
import random

topic_slug = 'geri-cognitive-disorders'

templates = [
    # TEMPLATE 1: ALZHEIMER'S DISEASE
    {
        "q": "A {age}-old {gender} is brought to the clinic by a family member due to progressive memory loss over the past {duration} years. The family reports that the patient frequently misplaces items, repeats questions, and has difficulty managing finances. Cognitive testing reveals a MoCA score of **{moca}/30**. A brain MRI shows bilateral **{mri_finding}** atrophy. Which of the following describes the characteristic histopathological findings and first-line pharmacological treatment for this condition?",
        "options": [
            "Extracellular amyloid-beta plaques and intracellular hyperphosphorylated tau neurofibrillary tangles; treat with cholinesterase inhibitors (e.g., Donepezil)",
            "Alpha-synuclein cytoplasmic inclusions (Lewy bodies) in the substantia nigra; treat with high-dose levodopa/carbidopa",
            "Ubiquitin and tau-positive inclusions in the frontotemporal lobes; treat with high-dose atypical antipsychotics",
            "Spongiform encephalopathy with vacuolation of neurons; treat with acyclovir and corticosteroids",
            "Perivascular lymphocytic cuffs and demyelinating plaques; treat with interferon-beta"
        ],
        "answer": 0,
        "exp": "This patient''s clinical presentation—insidious onset, slowly progressive memory impairment, and bilateral **{mri_finding}** (hippocampal/temporoparietal) atrophy on brain MRI—is diagnostic of **Alzheimer''s disease (AD)**, the most common cause of dementia in older adults. The hallmark histopathological features of AD include: (1) **Extracellular amyloid-beta plaques** (derived from amyloid precursor protein cleavage), and (2) **Intracellular neurofibrillary tangles** consisting of **hyperphosphorylated tau protein**. First-line pharmacological management for mild-to-moderate AD includes **cholinesterase inhibitors** (Donepezil, Galantamine, or Rivastigmine) to increase acetylcholine levels in the synaptic cleft. Memantine, an NMDA receptor antagonist, can be added for moderate-to-severe disease."
    },
    # TEMPLATE 2: VASCULAR DEMENTIA
    {
        "q": "A {age}-old {gender} with a history of hypertension, type 2 diabetes, hyperlipidemia, and a stroke 2 years ago is evaluated for worsening cognitive function. The family reports a **stepwise decline** in the patient''s memory, executive function, and motor planning over the past year, coinciding with episodes of focal weakness. Cognitive testing shows a MoCA score of **{moca}/30**. A brain MRI reveals **{mri_finding}**. Which of the following is the primary focus of management for this patient''s cognitive decline?",
        "options": [
            "Aggressive cardiovascular risk factor modification (blood pressure control, antiplatelet therapy, statin therapy) to prevent further ischemic events",
            "Initiation of high-dose corticosteroids to reduce cerebral vasculitis and white matter edema",
            "Empiric levodopa-carbidopa therapy to improve executive planning and motor speed",
            "Cholinesterase inhibitor monotherapy as a curative treatment to reverse white matter ischemic damage",
            "Urgent ventriculoperitoneal shunt placement to relieve CSF pressure built up in the ventricles"
        ],
        "answer": 0,
        "exp": "This patient''s clinical presentation—a history of stroke, cardiovascular risk factors (hypertension, diabetes, hyperlipidemia), a **stepwise decline** in cognitive function, and **{mri_finding}** (subcortical white matter hyperintensities, lacunar infarcts) on MRI—points to **Vascular Dementia (VaD)**. VaD is characterized by cognitive deficits that correlate temporally with cerebrovascular events. Unlike the insidious, gradual decline of Alzheimer''s, VaD often progresses in a stepwise or jagged manner. The primary focus of management is **secondary prevention of stroke** through aggressive cardiovascular risk factor modification (blood pressure target <130/80 mmHg, antiplatelets like aspirin, high-intensity statins, and glycemic control) to stop or slow the progression of further ischemic brain injury. Cholinesterase inhibitors have shown limited benefits and are not curative."
    },
    # TEMPLATE 3: DEMENTIA WITH LEWY BODIES (DLB)
    {
        "q": "A {age}-old {gender} is evaluated for a {duration}-year history of progressive cognitive impairment. The spouse reports that the patient''s cognitive function varies dramatically from day to day, with episodes of extreme confusion followed by lucidity. The patient has also experienced detailed, non-threatening **visual hallucinations** (seeing small children in the living room) and has developed a resting tremor, bradykinesia, and rigidity. The spouse notes that the patient violently acts out dreams during sleep. Which of the following is the most likely diagnosis, and what critical medication warning applies?",
        "options": [
            "Dementia with Lewy Bodies (DLB); avoid first-generation and typical antipsychotics due to extreme neuroleptic sensitivity (which can cause severe extrapyramidal symptoms, autonomic instability, and death)",
            "Alzheimer''s disease; avoid cholinesterase inhibitors as they accelerate hippocampal atrophy",
            "Frontotemporal dementia; avoid SSRIs as they exacerbate behavioral disinhibition and hyperorality",
            "Normal Pressure Hydrocephalus; avoid ventriculoperitoneal shunting due to high risk of subdural hematomas in Lewy body disease",
            "Parkinson''s disease dementia; avoid levodopa as it has no effect on motor symptoms when dementia is present"
        ],
        "answer": 0,
        "exp": "This patient presents with the classic tetrad of **Dementia with Lewy Bodies (DLB)**: (1) **Fluctuating cognition** with pronounced variations in attention and alertness, (2) **Recurrent visual hallucinations** (typically detailed, well-formed, and non-threatening), (3) **Spontaneous Parkinsonism** (rigidity, bradykinesia, resting tremor), and (4) **REM sleep behavior disorder** (acting out dreams). DLB is histopathologically characterized by **alpha-synuclein** cytoplasmic inclusions (Lewy bodies) in the cerebral cortex and brainstem. A critical clinical pearl is that patients with DLB exhibit **extreme neuroleptic sensitivity**. Administering typical (e.g., haloperidol) or certain atypical antipsychotics can lead to severe extrapyramidal side effects, irreversible parkinsonism, neuroleptic malignant syndrome, and increased mortality. If antipsychotics are absolutely necessary for distressing hallucinations, low-dose **quetiapine** or **pimavanserin** is preferred."
    },
    # TEMPLATE 4: FRONTOTEMPORAL DEMENTIA (FTD)
    {
        "q": "A {age}-old {gender} is brought to the clinic by a spouse due to striking behavioral changes over the past year. The spouse reports that the patient has become increasingly socially inappropriate, making crude jokes to strangers, showing a lack of empathy, and exhibiting a compulsive craving for sweet foods (**hyperorality**). Memory and visuospatial skills remain relatively intact on cognitive testing. A brain MRI reveals **{mri_finding}** atrophy. Which of the following is the most likely diagnosis, and what is the underlying pathophysiology?",
        "options": [
            "Frontotemporal Dementia (FTD, behavioral variant); characterized by degeneration of the frontal and temporal lobes with inclusions of hyperphosphorylated tau or TDP-43 proteins",
            "Alzheimer''s disease; characterized by selective destruction of the parietal and occipital lobes with amyloid-beta plaques",
            "Vascular dementia; characterized by diffuse demyelination of the internal capsule and cerebellum secondary to hypertension",
            "Dementia with Lewy Bodies; characterized by alpha-synuclein deposition restricted to the anterior cingulate cortex",
            "Creutzfeldt-Jakob disease; characterized by prion protein accumulation in the red nucleus and thalamus"
        ],
        "answer": 0,
        "exp": "This patient''s clinical profile—early and prominent changes in personality, social behavior (disinhibition, loss of empathy, apathy), and changes in dietary habits (**hyperorality**, craving sweets) with **relative preservation of memory** and visuospatial function—is classic for the **behavioral variant of Frontotemporal Dementia (FTD)** (formerly Pick''s disease). FTD typically has an earlier age of onset (50s-60s) compared to Alzheimer''s. Brain MRI characteristically shows **{mri_finding}** (bilateral frontal and/or anterior temporal lobe) atrophy. Histopathologically, FTD is a heterogeneous group of neurodegenerative diseases characterized by abnormal intracellular accumulations of either **tau protein** (forming Pick bodies) or **TDP-43 (TAR DNA-binding protein 43)**. Treatment is supportive, focusing on managing behavioral symptoms with SSRIs (e.g., sertraline) to reduce disinhibition and compulsions."
    },
    # TEMPLATE 5: MILD COGNITIVE IMPAIRMENT (MCI)
    {
        "q": "A {age}-old {gender} presents to the clinic with concerns of gradual memory decline over the past year. The patient reports having difficulty remembering names and occasionally forgetting appointments, but is still able to drive safely, manage complex finances independently, prepare meals, and complete all activities of daily living (ADLs) and instrumental ADLs (IADLs). Cognitive testing shows a MoCA score of **{moca}/30**. Which of the following defines this patient''s condition, and what is the recommended management strategy?",
        "options": [
            "Mild Cognitive Impairment (MCI); defined by objective cognitive decline on testing with preserved functional independence in ADLs/IADLs; manage with close clinical monitoring, risk factor optimization, and cognitive stimulation, as pharmacotherapy (cholinesterase inhibitors) is NOT indicated",
            "Early-stage Alzheimer''s dementia; initiate immediate double-dose Donepezil and Memantine combination therapy to reverse the cognitive decline",
            "Age-associated memory impairment; reassure the patient that no further follow-up is necessary as memory will not decline further",
            "Pseudodementia secondary to depression; initiate high-dose amitriptyline to treat the underlying mood disorder",
            "Normal Pressure Hydrocephalus; recommend a large-volume lumbar puncture to prevent progression to overt dementia"
        ],
        "answer": 0,
        "exp": "This patient is presenting with **Mild Cognitive Impairment (MCI)**. MCI is diagnosed when there is: (1) Concern regarding a change in cognition, (2) Objective impairment in one or more cognitive domains (e.g., memory, executive function) on standardized testing (such as a MoCA of **{moca}/30**), and (3) **Preserved functional independence in daily life** (i.e., the patient can still manage ADLs and complex IADLs like finances, driving, and medications independently, though they may require more effort or compensatory strategies). If functional independence is compromised, the diagnosis is dementia. The Beers Criteria and clinical guidelines **recommend against prescribing cholinesterase inhibitors or memantine for MCI**, as they do not delay progression to dementia and cause significant cholinergic side effects. Management focuses on optimizing cardiovascular risk factors, physical exercise, cognitive engagement, and monitoring for progression."
    },
    # TEMPLATE 6: NORMAL PRESSURE HYDROCEPHALUS (NPH)
    {
        "q": "A {age}-old {gender} is evaluated for progressive gait instability, cognitive decline, and urinary urgency/incontinence over the past 6 months. Physical exam reveals a **{gait_style}** gait, where the patient''s feet appear ''stuck to the floor.'' A brain MRI shows **{mri_finding}** out of proportion to sulcal atrophy. Which of the following diagnostic steps is most appropriate to confirm the diagnosis and predict response to definitive therapy?",
        "options": [
            "Perform a large-volume lumbar puncture (spinal tap test) measuring pre- and post-LP gait speed and cognitive function; improvement predicts success with ventriculoperitoneal (VP) shunt placement",
            "Order a continuous 24-hour EEG to rule out subclinical status epilepticus before initiating memantine",
            "Obtain a serum 14-3-3 protein level and perform a brain biopsy of the frontal lobe to rule out prion disease",
            "Initiate a trial of high-dose levodopa/carbidopa for 3 months; if symptoms improve, continue medical management",
            "Perform a cystometrogram followed by pelvic floor physical therapy as the primary treatment for the urinary incontinence"
        ],
        "answer": 0,
        "exp": "This patient presents with the classic triad of **Normal Pressure Hydrocephalus (NPH)**, often memorized as ''wet, wobbly, and wacky'': (1) Gait disturbance (characteristically a **{gait_style}** gait, where the patient has difficulty lifting their feet off the ground, often described as magnetic), (2) Cognitive decline (subcortical executive dysfunction), and (3) Urinary urgency or frank incontinence. Brain MRI shows **{mri_finding}** (ventriculomegaly out of proportion to cerebral sulcal atrophy). The diagnosis is confirmed, and response to treatment predicted, by performing a **large-volume lumbar puncture (LP)** (removing 30-50 mL of CSF) and testing gait speed, step count, and cognitive function before and after the tap. Improvement in gait is highly predictive of a response to the definitive treatment: surgical placement of a **ventriculoperitoneal (VP) shunt**."
    },
    # TEMPLATE 7: PSEUDODEMENTIA (DEPRESSIVE DEMENTIA)
    {
        "q": "A {age}-old {gender} presents with a 6-month history of memory difficulty, poor concentration, and low energy. During cognitive testing, the patient frequently responds with **''I don''t know''** to questions and makes minimal effort, but is eventually able to complete memory tasks when encouraged. The patient expresses great distress over {possessive} memory slips. {possessive_cap} spouse notes that the patient has lost interest in hobbies and has early morning awakenings. Which of the following is the most likely diagnosis, and what is the best management strategy?",
        "options": [
            "Pseudodementia (depression-induced cognitive impairment); manage by initiating antidepressant therapy (e.g., an SSRI like Sertraline or Mirtazapine) and psychotherapy, which can fully reverse the cognitive deficits",
            "Late-stage Alzheimer''s disease; manage by placing the patient in memory care and initiating high-dose antipsychotics",
            "Creutzfeldt-Jakob disease; manage with palliative care as this represents rapid neurodegeneration",
            "Frontotemporal dementia; manage with behavioral therapy and avoidance of antidepressants",
            "Vascular dementia; manage with aggressive antiplatelet therapy and immediate carotid endarterectomy"
        ],
        "answer": 0,
        "exp": "This patient is presenting with **pseudodementia** (also known as depressive dementia), which is cognitive impairment secondary to severe **major depressive disorder** in older adults. Key features distinguishing pseudodementia from true neurodegenerative dementia include: (1) Acute or subacute onset with prominent awareness of and distress over cognitive deficits, (2) Characteristic testing behavior where the patient displays **poor effort** and frequently answers **''I don''t know''** (whereas patients with true dementia often make errors or try to minimize their deficits), and (3) Co-existing vegetative signs of depression (anhedonia, insomnia, changes in appetite). Pseudodementia is **reversible**; treating the underlying depression with safe pharmacotherapy (e.g., SSRIs like Sertraline, or Mirtazapine if sleep/appetite stimulation is needed) and cognitive behavioral therapy can completely restore cognitive performance."
    },
    # TEMPLATE 8: CREUTZFELDT-JAKOB DISEASE (CJD)
    {
        "q": "A {age}-old {gender} is admitted to the hospital due to an alarmingly **rapid cognitive decline** over the past {duration} weeks, accompanied by ataxia, visual disturbances, and frequent involuntary muscle jerks (**myoclonus**) triggered by loud noises. An EEG demonstrates **{eeg_finding}**. Which of the following represents the most likely diagnosis and diagnostic marker?",
        "options": [
            "Creutzfeldt-Jakob Disease (CJD); confirmed by detecting 14-3-3 protein or RT-QuIC (real-time quaking-induced conversion) in the cerebrospinal fluid (CSF)",
            "Alzheimer''s disease (rapidly progressive variant); confirmed by identifying low CSF levels of tau protein",
            "Dementia with Lewy Bodies; confirmed by finding alpha-synuclein plaques on a routine non-contrast head CT scan",
            "Wernicke encephalopathy; confirmed by checking red blood cell transketolase activity and finding elevated levels",
            "Neurosyphilis; confirmed by obtaining a positive serum RPR and normal CSF protein"
        ],
        "answer": 0,
        "exp": "The clinical presentation—rapidly progressive dementia (over weeks to months), cerebellar ataxia, cortical visual loss, and **startle-induced myoclonus** (sudden muscle jerking in response to auditory or tactile stimuli)—is classic for **Creutzfeldt-Jakob Disease (CJD)**, the most common human prion disease. CJD is caused by the conformational change of normal cellular prion protein (PrPc) into an abnormal, protease-resistant pathogenic form (PrPsc), leading to spongiform degeneration of the brain. The EEG characteristically shows **{eeg_finding}** (periodic sharp wave complexes). Diagnostic confirmation is achieved via CSF analysis showing **14-3-3 protein** or a positive **RT-QuIC** assay (which directly detects prion seeding activity). Brain MRI typically demonstrates restricted diffusion in the cerebral cortex (''cortical ribboning'') and basal ganglia. CJD is uniformly fatal, and management is supportive."
    },
    # TEMPLATE 9: CHOLINESTERASE INHIBITOR SIDE EFFECTS
    {
        "q": "A {age}-old {gender} with mild Alzheimer''s disease was started on **{donepezil_drug} {donepezil_dose} mg** daily {duration} weeks ago. The patient is brought to the clinic due to recurrent episodes of lightheadedness, nausea, abdominal cramping, and one episode of syncope while standing. Physical exam is notable for a heart rate of **{hr} bpm**. Which of the following is the most likely mechanism of this patient''s symptoms, and what is the Beers Criteria warning regarding this drug class?",
        "options": [
            "Cholinergic excess causing bradycardia and gastrointestinal hypermotility; the Beers Criteria recommends caution and monitoring in patients with pre-existing conduction disease (e.g., sick sinus syndrome, bradycardia) due to risk of syncope and falls",
            "Anticholinergic toxicity causing urinary retention and paralytic ileus; discontinue the medication and initiate atropine therapy immediately",
            "NMDA receptor over-activation causing calcium influx and peripheral vasoconstriction; manage by switching to memantine monotherapy",
            "Atypical allergic hypersensitivity causing proximal muscle wasting and severe orthostatic hypotension",
            "Drug-induced hepatic encephalopathy causing autonomic neuropathy; manage by checking ammonia levels and initiating lactulose"
        ],
        "answer": 0,
        "exp": "This patient is experiencing adverse effects from **{donepezil_drug}**, a **cholinesterase inhibitor**. By inhibiting acetylcholinesterase, these drugs increase acetylcholine levels in the central and peripheral systems. This leads to **cholinergic excess** (parasympathetic activation), commonly causing gastrointestinal side effects (nausea, vomiting, diarrhea, abdominal cramps) and vagally-mediated **bradycardia (HR of {hr} bpm)**. In older adults, bradycardia can lead to orthostatic hypotension, syncope, and falls. The **Beers Criteria cautions** against the use of cholinesterase inhibitors in patients with a history of **bradycardia, syncope, or conduction block (e.g., sick sinus syndrome, second- or third-degree AV block)**. The drug should be discontinued or tapered, and bradycardia resolved, before considering alternative cognitive therapies."
    },
    # TEMPLATE 10: MEMANTINE PHARMACOLOGY AND INDICATION
    {
        "q": "A {age}-old {gender} with moderate-to-severe Alzheimer''s disease is started on **Memantine {memantine_dose} mg** daily as an add-on therapy to Donepezil. The family asks how this medication works and if it is appropriate for the patient. Which of the following describes the mechanism of action of Memantine and its clinical indication?",
        "options": [
            "Uncompetitive NMDA receptor antagonist that blocks pathological tonic levels of glutamate, preventing excitotoxic neuronal death; indicated for moderate-to-severe (but not mild) Alzheimer''s disease",
            "Reversible acetylcholinesterase inhibitor that increases cholinergic transmission in the neocortex; indicated for mild cognitive impairment",
            "GABA-A receptor agonist that enhances inhibitory neurotransmission and reduces anxiety; indicated for all stages of vascular dementia",
            "Monoamine oxidase inhibitor that increases dopamine concentration in the basal ganglia; indicated for Lewy body dementia with motor symptoms",
            "Beta-amyloid antibody that clears senile plaques from the cerebral vasculature; indicated for frontotemporal dementia"
        ],
        "answer": 0,
        "exp": "**Memantine** is a low-affinity, uncompetitive **N-methyl-D-aspartate (NMDA) receptor antagonist**. Pathologically in Alzheimer''s disease, chronic overexposure to **glutamate** leads to tonic activation of NMDA receptors, allowing excessive calcium influx into neurons (excitotoxicity), which leads to synaptic dysfunction and cell death. Memantine blocks these open NMDA receptor channels under pathological conditions, while still allowing normal, rapid physiological bursts of glutamate needed for learning and memory. Memantine is clinically indicated **only for moderate-to-severe Alzheimer''s disease** (either as monotherapy or combined with a cholinesterase inhibitor like Donepezil). It is not indicated for mild AD or Mild Cognitive Impairment, as studies have shown no significant clinical benefit in those populations."
    }
]

genders_pool = [
    {"gender": "female", "pronoun": "she", "pronoun_cap": "She", "possessive": "her", "possessive_cap": "Her"},
    {"gender": "male", "pronoun": "he", "pronoun_cap": "He", "possessive": "his", "possessive_cap": "His"},
    {"gender": "woman", "pronoun": "she", "pronoun_cap": "She", "possessive": "her", "possessive_cap": "Her"},
    {"gender": "man", "pronoun": "he", "pronoun_cap": "He", "possessive": "his", "possessive_cap": "His"}
]

mri_findings_ad = ["hippocampal and temporoparietal", "medial temporal lobe and parietal"]
mri_findings_vad = ["multiple lacunar infarcts and diffuse white matter hyperintensities", "periventricular ischemic changes and old subcortical infarcts"]
mri_findings_ftd = ["bilateral frontal and anterior temporal lobe", "asymmetric frontotemporal"]
mri_findings_nph = ["ventriculomegaly", "enlarged lateral ventricles"]

gait_styles_nph = ["magnetic", "broad-based, magnetic", "apraxic (magnetic)"]
eeg_findings_cjd = ["periodic sharp wave complexes", "triphasic periodic complexes"]

donepezil_drugs = [
    {"name": "Donepezil", "dose": "10"},
    {"name": "Aricept", "dose": "5"},
    {"name": "Galantamine", "dose": "16"},
    {"name": "Rivastigmine", "dose": "9.5"}
]

mcqs = []
seen_questions = set()
counter = 0

while counter < 400:
    for t_idx, t in enumerate(templates):
        if counter >= 400:
            break
        age = random.randint(66, 94)
        gp = random.choice(genders_pool)
        duration = random.randint(2, 5)
        moca = random.randint(14, 23)
        
        mri_ad = random.choice(mri_findings_ad)
        mri_vad = random.choice(mri_findings_vad)
        mri_ftd = random.choice(mri_findings_ftd)
        mri_nph = random.choice(mri_findings_nph)
        
        gait_nph = random.choice(gait_styles_nph)
        eeg_cjd = random.choice(eeg_findings_cjd)
        
        don_drug = random.choice(donepezil_drugs)
        hr = random.randint(46, 54)
        mem_dose = random.choice(["10", "20", "28"])

        # Determine which MRI finding to insert based on template index
        mri_val = mri_ad
        if t_idx == 1:
            mri_val = mri_vad
        elif t_idx == 3:
            mri_val = mri_ftd
        elif t_idx == 5:
            mri_val = mri_nph

        format_kwargs = {
            "age": age, "gender": gp['gender'], "pronoun": gp['pronoun'], "pronoun_cap": gp['pronoun_cap'],
            "possessive": gp['possessive'], "possessive_cap": gp['possessive_cap'],
            "duration": duration, "moca": moca, "mri_finding": mri_val,
            "gait_style": gait_nph, "eeg_finding": eeg_cjd,
            "donepezil_drug": don_drug['name'], "donepezil_dose": don_drug['dose'], "hr": hr,
            "memantine_dose": mem_dose
        }

        q_text = t['q'].format(**format_kwargs)

        opts_formatted = []
        for o in t['options']:
            o_fmt = o.format(**format_kwargs)
            opts_formatted.append(o_fmt)

        exp_formatted = t['exp'].format(**format_kwargs)

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

out_file = r"c:\Users\Hasan-PC\Desktop\MedHelp\supabase\migrations\20260520_geri_cognitive_mcqs.sql"

with open(out_file, "w", encoding="utf-8") as f:
    f.write("-- US MD/MBBS (4th Year) clinical case blocks - Geriatrics: Cognitive disorders — Alzheimer's, vascular, Lewy body, frontotemporal dementia, MCI\n")
    f.write("BEGIN;\n\n")
    f.write("DO $$\nDECLARE\n    v_topic_id UUID;\nBEGIN\n")
    f.write("    SELECT id INTO v_topic_id FROM topics WHERE slug = 'geri-cognitive-disorders' LIMIT 1;\n")
    f.write("    IF v_topic_id IS NULL THEN\n        RAISE EXCEPTION 'Topic geri-cognitive-disorders not found.';\n    END IF;\n\n")
    f.write("    DELETE FROM mcqs WHERE topic_id = v_topic_id;\n\n")
    f.write("    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES\n")
    for i, m in enumerate(mcqs):
        if i < len(mcqs) - 1:
            f.write(m + ",\n")
        else:
            f.write(m + ";\n")
    f.write("END $$;\nCOMMIT;\n")

print(f"Generated {len(mcqs)} MCQs to {out_file}")
