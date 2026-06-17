const agingCards = [
  {
    "q": "What is the primary cellular mechanism underlying <b>replicative senescence</b> (<b>Hayflick limit</b>)?",
    "a": "<b>Progressive <b>telomere</b> shortening</b> with each cell division. When <b>telomeres</b> become critically short, <b>p53</b>/p21 pathway activates → permanent cell cycle arrest. <b>Telomerase</b> (active in stem/germ cells) prevents this."
  },
  {
    "q": "Compare programmed vs. damage/error theories of aging (high-yield distinction).",
    "a": "<ul><li><b><b>Programmed:</b> </b> Intrinsic genetic clock (telomere shortening, hormonal changes).</li><li><b><b>Damage/Error:</b> </b> Accumulation of insults (free radicals, DNA damage, protein misfolding). Most accepted hybrid is evolutionary senescence theory.</li></ul>"
  },
  {
    "q": "What is the free radical theory of aging? Key molecule?",
    "a": "<b>Reactive oxygen species (ROS)</b> from mitochondrial metabolism cause cumulative oxidative damage to DNA, proteins, and lipids. Antioxidants (superoxide dismutase, catalase) mitigate but decline with age."
  },
  {
    "q": "Define <b>frailty syndrome</b> in geriatrics. Key components (<b>FRAIL mnemonic</b>).",
    "a": "<b>F</b>atigue, <b>R</b>esistance (weakness), <b>A</b>erobics (endurance), <b>I</b>llness, <b>L</b>oss of weight. Multisystem decline leading to vulnerability to stressors."
  },
  {
    "q": "Physiological change in cardiovascular system with normal aging?",
    "a": "↑ Arterial stiffness (↓ compliance) → ↑ systolic BP, widened pulse pressure. Left ventricular wall thickens; ↓ maximal heart rate (↓ β-adrenergic response)."
  },
  {
    "q": "Age-related change in renal function? Clinical implication for drug dosing.",
    "a": "↓ Glomerular filtration rate (GFR) ~1 mL/min/year after age 30–40 (due to ↓ nephron number). Use Cockcroft-Gault or CKD-EPI (adjusted for age) for dosing renally cleared drugs."
  },
  {
    "q": "What is <b>presbycusis</b>? Most common type and cause.",
    "a": "<b>Sensorineural hearing loss</b> (high-frequency first) due to loss of cochlear hair cells and stria vascularis degeneration. Bilateral, progressive."
  },
  {
    "q": "Age-related pulmonary changes increasing infection risk?",
    "a": "↓ Lung elasticity, ↓ vital capacity, ↑ residual volume, ↓ cough reflex, ↓ mucociliary clearance → impaired clearance of pathogens."
  },
  {
    "q": "Gastrointestinal changes in elderly affecting nutrition?",
    "a": "↓ Saliva (xerostomia), ↓ taste/smell, ↓ gastric acid (atrophic gastritis), ↓ motility → constipation, malabsorption, weight loss risk."
  },
  {
    "q": "Musculoskeletal changes with aging? <b>Sarcopenia</b> definition.",
    "a": "↓ Muscle mass/strength (<b>sarcopenia</b>: loss &gt; age-expected), ↓ bone density (<b>osteopenia</b>/porosis), ↓ joint cartilage. Increased fall/fracture risk."
  },
  {
    "q": "Neurological changes in normal aging vs. dementia (key distinction).",
    "a": "Normal: Mild ↓ processing speed, mild memory retrieval issues, brain atrophy (esp. hippocampus). <b>Dementia:</b> Significant functional impairment, progressive deficits."
  },
  {
    "q": "Immune system change with aging (<b>immunosenescence</b>)? Clinical effect.",
    "a": "↓ Naive T cells, ↑ memory T cells, ↓ antibody affinity/diversity, chronic low-grade inflammation ('<b>inflammaging</b>') → poorer vaccine response, ↑ infections/autoimmunity/cancer."
  },
  {
    "q": "<b>Pharmacokinetic</b> change in elderly: Volume of distribution for lipophilic drugs?",
    "a": "↑ (due to ↑ body fat percentage) → prolonged half-life and effects of lipophilic drugs (e.g., diazepam, <b>amiodarone</b>)."
  },
  {
    "q": "<b>Pharmacodynamic</b> change in elderly: Sensitivity to <b>anticholinergics</b>?",
    "a": "↑ Sensitivity → delirium, urinary retention, constipation, dry mouth (<b>BEERS criteria</b> highlight avoidance)."
  },
  {
    "q": "What is the most common cause of delirium in hospitalized elderly?",
    "a": "<b>Multifactorial:</b> Infection (UTI/pneumonia), medications (<b>anticholinergics</b>, benzos), electrolyte imbalance, surgery, underlying dementia."
  },
  {
    "q": "Define polypharmacy. Key risk in geriatrics.",
    "a": "Use of ≥5 medications. Risks: Drug-drug interactions, adverse effects, falls, cognitive impairment, non-adherence."
  },
  {
    "q": "Age-related change in hepatic metabolism? Implication for Phase I drugs.",
    "a": "↓ <b>Phase I metabolism</b> (<b>CYP450</b> oxidation) more than Phase II (conjugation) → prolonged half-life of drugs like <b>benzodiazepines</b>, warfarin."
  },
  {
    "q": "What is the leading cause of accidental death in elderly?",
    "a": "<b>Falls</b> (leading to hip fracture, head injury). Risk factors: Orthostasis, gait instability, medications, vision/hearing loss."
  },
  {
    "q": "Physiological basis of orthostatic hypotension in elderly?",
    "a": "Blunted baroreceptor reflex, ↓ vascular compliance, ↓ renin-angiotensin response, volume depletion, autonomic dysfunction."
  },
  {
    "q": "What is the 'failure to thrive' in elderly? Key reversible causes.",
    "a": "Weight loss, weakness, apathy. Causes: Depression, medications, malignancy, chronic disease, social isolation, malnutrition."
  },
  {
    "q": "Cellular hallmark of aging: Accumulation of what in lysosomes?",
    "a": "<b>Lipofuscin</b> ('age pigment') — indigestible lipid-protein residues from autophagocytosis."
  },
  {
    "q": "Role of <b>sirtuins</b> in aging (high-yield mechanism)?",
    "a": "NAD+-dependent deacetylases. Promote longevity by DNA repair, stress resistance, metabolic regulation. Activated by calorie restriction/resveratrol."
  },
  {
    "q": "mTOR pathway in aging? Effect of inhibition?",
    "a": "mTOR promotes growth/anabolism. Hyperactivation accelerates aging; inhibition (<b>rapamycin</b>) extends lifespan in models via autophagy."
  },
  {
    "q": "What is <b>epigenetic drift</b> in aging?",
    "a": "Age-related changes in <b>DNA methylation</b>/histone modification patterns → altered gene expression without DNA sequence change."
  },
  {
    "q": "Compare <b>caloric restriction</b> vs. <b>intermittent fasting</b> effects on aging.",
    "a": "Both extend lifespan in models by ↓ mTOR/insulin signaling, ↑ <b>sirtuins</b>/autophagy, ↓ inflammation/oxidative stress."
  },
  {
    "q": "Most common dementia in elderly? Pathological hallmark.",
    "a": "<b>Alzheimer disease</b> — extracellular amyloid-β plaques + intracellular neurofibrillary (tau) tangles."
  },
  {
    "q": "<b>Vascular dementia</b> vs. Alzheimer: Key clinical difference.",
    "a": "<b>Vascular:</b> Stepwise decline, focal neuro deficits, history of strokes. <b>Alzheimer:</b> Gradual, prominent memory loss first."
  },
  {
    "q": "Parkinson disease in elderly: Classic triad.",
    "a": "Tremor (resting), Rigidity, Bradykinesia (TRAP). Due to dopaminergic neuron loss in substantia nigra."
  },
  {
    "q": "What is the <b>Beers Criteria</b>?",
    "a": "List of potentially inappropriate medications in older adults (risk of adverse effects outweigh benefits)."
  },
  {
    "q": "Age-related change in endocrine: Thyroid function?",
    "a": "Mild ↑ TSH, ↓ T3 (peripheral conversion); clinical hypothyroidism more common but overt function often preserved."
  },
  {
    "q": "<b>Osteoporosis</b> risk factors in elderly (high-yield)?",
    "a": "↓ Estrogen (post-<b>menopause</b>), ↓ vitamin D/calcium absorption, sedentary lifestyle, smoking, corticosteroids, low BMI."
  },
  {
    "q": "<b>Pressure ulcers</b> (<b>decubitus</b>) in elderly: Key prevention?",
    "a": "Regular repositioning, pressure-relieving mattresses, nutrition (protein), skin care. Common in immobile/frail patients."
  },
  {
    "q": "What is <b>sundowning</b>? Associated condition.",
    "a": "Worsening confusion/agitation in evening. Common in dementia (Alzheimer) patients in hospitals or unfamiliar settings."
  },
  {
    "q": "Physiological change in sleep architecture with aging?",
    "a": "↓ Slow-wave (deep) sleep, ↓ REM, ↑ sleep latency and fragmentation, advanced sleep phase (early to bed/early to rise)."
  },
  {
    "q": "Most common malignancy in elderly men vs. women (incidence)?",
    "a": "Men: Prostate. Women: Breast (then lung/colorectal). Overall, skin cancers and colorectal also high."
  },
  {
    "q": "Advance directives in geriatrics: Living will vs. durable power of attorney.",
    "a": "<b>Living will:</b> Specific treatment wishes. <b>DPOA:</b> Designates surrogate decision-maker."
  },
  {
    "q": "What is the 'geriatric giants' or '4 Is' of geriatrics?",
    "a": "Immobility, Instability (falls), Incontinence, Intellectual impairment (dementia/delirium)."
  },
  {
    "q": "<b>Pharmacokinetic</b> change: Decreased lean body mass effect on hydrophilic drugs?",
    "a": "↓ Volume of distribution → higher plasma concentration and effects (e.g., <b>digoxin</b>, <b>aminoglycosides</b>)."
  },
  {
    "q": "Why is creatinine clearance preferred over serum creatinine for GFR in elderly?",
    "a": "↓ Muscle mass → lower creatinine production → normal serum Cr despite low GFR."
  },
  {
    "q": "Key difference in presentation of MI in elderly vs. young?",
    "a": "Atypical: Dyspnea, fatigue, confusion, nausea more common than classic chest pain."
  },
  {
    "q": "What is the leading cause of vision loss in elderly?",
    "a": "<b><b>Age-related macular degeneration</b> (<b>AMD</b>)</b> (dry &gt; wet). Drusen deposits."
  },
  {
    "q": "<b>Cataracts</b> vs. <b>glaucoma</b> in elderly: Key features.",
    "a": "<b><b>Cataracts</b>:</b> Lens opacity, gradual blurry vision. <b><b>Glaucoma</b>:</b> Optic neuropathy, peripheral vision loss first (often asymptomatic early)."
  },
  {
    "q": "What is the most common cause of <b>aortic stenosis</b> in elderly (&gt;70)?",
    "a": "<b>Calcific (degenerative) <b>aortic stenosis</b></b>."
  },
  {
    "q": "Mitochondrial theory of aging: Key mechanism?",
    "a": "<b>Accumulation of mtDNA mutations</b> → dysfunctional electron transport chain → increased ROS production and energy failure."
  },
  {
    "q": "What is <b>proteostasis collapse</b> in aging?",
    "a": "Impaired protein quality control (chaperones, <b>ubiquitin</b>-<b>proteasome</b> system, autophagy) → accumulation of misfolded proteins (e.g., amyloid, tau)."
  },
  {
    "q": "Role of IGF-1/insulin signaling in longevity?",
    "a": "Reduced signaling (as in <b>caloric restriction</b>) activates FOXO transcription factors → ↑ stress resistance, autophagy, and lifespan."
  },
  {
    "q": "What is <b>inflammaging</b>?",
    "a": "Chronic low-grade systemic inflammation in aging due to ↑ pro-inflammatory cytokines (IL-6, <b>TNF</b>-α) and senescent cell <b>SASP</b>."
  },
  {
    "q": "<b>SASP</b> — what does it stand for and its effect?",
    "a": "<b>Senescence-Associated Secretory Phenotype</b>: Senescent cells secrete pro-inflammatory cytokines, proteases, and growth factors → promotes aging and cancer."
  },
  {
    "q": "Age-related skin changes increasing infection and injury risk?",
    "a": "Thinning of epidermis/dermis, ↓ collagen/elastin, ↓ subcutaneous fat, ↓ sweat/sebaceous glands → xerosis, fragility, <b>pressure ulcers</b>."
  },
  {
    "q": "Reproductive changes in aging males (<b>andropause</b>)?",
    "a": "Gradual ↓ testosterone (~1%/year after 30), ↓ spermatogenesis, erectile dysfunction, reduced muscle mass/libido."
  },
  {
    "q": "<b>Menopause</b>: Hormonal change and clinical consequences?",
    "a": "Ovarian failure → ↓ estrogen/progesterone, ↑ FSH/LH. Leads to hot flashes, <b>osteoporosis</b>, cardiovascular risk ↑, genitourinary syndrome."
  },
  {
    "q": "Most common endocrine disorder in elderly?",
    "a": "<b>Hypothyroidism</b> (often subclinical); also high prevalence of diabetes type 2 and <b>osteoporosis</b>."
  },
  {
    "q": "Age-related change in glucose tolerance?",
    "a": "Impaired due to ↑ insulin resistance, ↓ β-cell function, and reduced physical activity → higher prevalence of type 2 diabetes."
  },
  {
    "q": "What is <b>sarcopenia</b>? Diagnostic criteria (high-yield)?",
    "a": "Progressive loss of skeletal muscle mass + strength. Low muscle mass + low grip strength or slow gait speed."
  },
  {
    "q": "<b>Osteoporosis</b> vs <b>osteomalacia</b> in elderly?",
    "a": "<b><b>Osteoporosis</b>:</b> ↓ bone mass, normal mineralization. <b><b>Osteomalacia</b>:</b> defective mineralization (often vitamin D deficiency)."
  },
  {
    "q": "Most common cause of hip fracture in elderly?",
    "a": "<b>Osteoporosis</b> + fall. Intracapsular (femoral neck) or extracapsular (intertrochanteric)."
  },
  {
    "q": "Age-related immune change: Thymic involution effect?",
    "a": "↓ Thymic output of naive T cells → reduced response to new antigens and vaccines."
  },
  {
    "q": "Why do elderly have poorer response to vaccines?",
    "a": "<b>Immunosenescence</b>: ↓ naive lymphocytes, chronic inflammation, reduced antigen presentation, and lower antibody affinity."
  },
  {
    "q": "Most common infection in long-term care facilities?",
    "a": "<b>Urinary tract infection (UTI)</b>, followed by pneumonia and skin/soft tissue infections."
  },
  {
    "q": "Delirium vs dementia: Onset and attention?",
    "a": "<b>Delirium:</b> Acute onset, fluctuating, impaired attention. <b>Dementia:</b> Insidious, progressive, relatively preserved attention early."
  },
  {
    "q": "Most common reversible cause of dementia-like symptoms in elderly?",
    "a": "<b>Depression</b> ('pseudodementia'), medications, B12 deficiency, hypothyroidism, <b>normal pressure hydrocephalus</b>."
  },
  {
    "q": "<b>Normal pressure hydrocephalus</b> (<b>NPH</b>) classic triad?",
    "a": "Wet (urinary incontinence), Wobbly (gait apraxia/magnetic gait), Wacky (dementia). Treatable with VP shunt."
  },
  {
    "q": "<b>Lewy body dementia</b>: Key features vs Alzheimer?",
    "a": "Visual hallucinations, fluctuating cognition, <b>REM sleep</b> behavior disorder, parkinsonism, extreme sensitivity to antipsychotics."
  },
  {
    "q": "Frontotemporal dementia (<b>Pick disease</b>): Early prominent feature?",
    "a": "Personality/behavior changes or language impairment (primary progressive aphasia) with relative sparing of memory early on."
  },
  {
    "q": "Vascular (multi-infarct) dementia: Risk factors and course?",
    "a": "Hypertension, diabetes, smoking, prior strokes. Stepwise cognitive decline with focal neurological signs."
  },
  {
    "q": "What is the Clock Drawing Test used for in geriatrics?",
    "a": "Screening for visuospatial and executive dysfunction (useful in Alzheimer and <b>vascular dementia</b>)."
  },
  {
    "q": "Mini-Mental State Examination (MMSE) score suggestive of dementia?",
    "a": "<b>≤23/30</b> (adjust for education/age). <b>MoCA</b> is more sensitive for mild cognitive impairment."
  },
  {
    "q": "Pharmacologic treatment of <b>Alzheimer disease</b> (first-line)?",
    "a": "<b>Cholinesterase inhibitors</b> (<b>donepezil</b>, <b>rivastigmine</b>, <b>galantamine</b>) + <b>memantine</b> (NMDA antagonist) for moderate-severe."
  },
  {
    "q": "<b>Beers Criteria</b>: Why avoid <b>anticholinergics</b> in elderly?",
    "a": "High risk of confusion, dry mouth, constipation, urinary retention, and delirium."
  },
  {
    "q": "Why avoid <b>benzodiazepines</b> in elderly (high-yield)?",
    "a": "Increased risk of falls, fractures, cognitive impairment, delirium, and dependence."
  },
  {
    "q": "Most common adverse drug reaction in elderly?",
    "a": "<b>Falls</b> and delirium (often due to polypharmacy, sedatives, antihypertensives, <b>anticholinergics</b>)."
  },
  {
    "q": "Age-related change in <b>pharmacokinetics</b>: <b>Protein binding</b>?",
    "a": "↓ Albumin (especially in illness/malnutrition) → increased free fraction of highly protein-bound drugs (e.g., warfarin, <b>phenytoin</b>)."
  },
  {
    "q": "What is the <b>START/STOPP criteria</b> used for?",
    "a": "Screening tool to optimize prescribing in older adults (START = start indicated meds, STOPP = stop potentially inappropriate)."
  },
  {
    "q": "Leading cause of blindness in elderly in developed countries?",
    "a": "<b><b>Age-related macular degeneration</b> (<b>AMD</b>)</b>."
  },
  {
    "q": "Presbyopia: Cause and age of onset?",
    "a": "Loss of lens elasticity → impaired near vision. Begins around age 40–45."
  },
  {
    "q": "Most common cause of conductive hearing loss in elderly?",
    "a": "<b>Cerumen impaction</b> (reversible)."
  },
  {
    "q": "Physiological change in basal metabolic rate with aging?",
    "a": "Decreases due to loss of lean body mass (<b>sarcopenia</b>)."
  },
  {
    "q": "Why is vitamin D deficiency common in elderly?",
    "a": "↓ Skin synthesis (less 7-dehydrocholesterol), ↓ sun exposure, ↓ dietary intake, ↓ renal 1α-hydroxylation."
  },
  {
    "q": "Most common nutritional deficiency in elderly?",
    "a": "<b>Vitamin D</b>, followed by B12, folate, and protein-calorie malnutrition."
  },
  {
    "q": "What is the <b>Mediterranean diet</b> associated with in aging?",
    "a": "Reduced cognitive decline, cardiovascular disease, and overall mortality."
  },
  {
    "q": "Role of exercise in preventing frailty?",
    "a": "Resistance + aerobic training improves muscle mass, strength, balance, and reduces fall risk."
  },
  {
    "q": "What is the Comprehensive Geriatric Assessment (CGA)?",
    "a": "Multidimensional evaluation of medical, functional, psychological, and social issues in frail elderly to optimize care."
  },
  {
    "q": "Ethical principle most relevant when discussing goals of care in terminal elderly patients?",
    "a": "<b>Autonomy</b> — respect patient wishes via advance directives."
  },
  {
    "q": "What is the most common reason for institutionalization of elderly?",
    "a": "<b>Dementia</b> (especially when behavioral issues or caregiver burnout occur)."
  },
  {
    "q": "Age-related change in thermoregulation?",
    "a": "Impaired (↓ shivering, ↓ sweat response) → higher risk of hypothermia and hyperthermia."
  },
  {
    "q": "Why is aspiration pneumonia common in elderly?",
    "a": "↓ Cough/gag reflex, dysphagia (stroke, dementia, Parkinson), poor dentition, supine positioning."
  },
  {
    "q": "Parkinson disease dementia vs <b>Lewy body dementia</b> timing?",
    "a": "<b>Parkinson disease dementia:</b> Motor symptoms ≥1 year before dementia. <b>Lewy body:</b> Dementia early or concurrent with parkinsonism."
  },
  {
    "q": "What malignancy screening is recommended up to what age generally?",
    "a": "Individualized; colorectal up to 75–85, breast/mammogram up to 74–75 in average risk (USPSTF)."
  },
  {
    "q": "Most important modifiable risk factor for healthy aging?",
    "a": "<b>Smoking cessation</b>, followed by physical activity and blood pressure control."
  },
  {
    "q": "What is the concept of '<b>compression of morbidity</b>'?",
    "a": "Delaying the onset of chronic illness so that disability occupies a smaller proportion of total lifespan."
  },
  {
    "q": "Senile (actinic) purpura: Cause?",
    "a": "Dermal connective tissue atrophy and fragile blood vessels → easy bruising on forearms/hands."
  },
  {
    "q": "What is the role of senescent cells in aging and disease?",
    "a": "They accumulate and secrete <b>SASP</b> (pro-inflammatory factors) → chronic inflammation, tissue dysfunction, and promotion of cancer and degenerative diseases."
  },
  {
    "q": "Name two experimental 'senolytic' agents and their goal.",
    "a": "Dasatinib + Quercetin (D+Q). They selectively clear senescent cells to reduce inflammation and improve tissue function."
  },
  {
    "q": "Age-related change in hematopoietic system?",
    "a": "↓ Bone marrow cellularity, ↓ lymphoid progenitors, clonal hematopoiesis of indeterminate potential (CHIP) → increased risk of MDS, leukemia, and anemia."
  },
  {
    "q": "Most common cause of anemia in elderly?",
    "a": "<b>Anemia of chronic disease/inflammation</b>, followed by iron deficiency, B12/folate deficiency, and renal disease."
  },
  {
    "q": "Why is B12 deficiency common in elderly?",
    "a": "Atrophic gastritis → ↓ <b>intrinsic factor</b> and acid secretion → impaired absorption."
  },
  {
    "q": "What is the most common solid tumor in men over 70?",
    "a": "<b>Prostate cancer</b>."
  },
  {
    "q": "Most common cause of cancer death in elderly (both sexes)?",
    "a": "<b>Lung cancer</b>."
  },
  {
    "q": "Herpes zoster (shingles) risk in elderly? Prevention?",
    "a": "Reactivation of VZV due to <b>immunosenescence</b>. Prevention: Recombinant zoster vaccine (<b>Shingrix</b>) recommended ≥50 years."
  },
  {
    "q": "Pneumococcal vaccination in elderly: Preferred regimen?",
    "a": "<b>PCV20</b> alone or <b>PCV15</b> followed by <b>PPSV23</b>. Strong recommendation ≥65 years."
  },
  {
    "q": "Physiological change in autonomic nervous system with aging?",
    "a": "↓ Baroreceptor sensitivity and β-adrenergic responsiveness → orthostatic hypotension and blunted heart rate response."
  },
  {
    "q": "What is dysphagia in elderly often due to?",
    "a": "Stroke, dementia, Parkinson disease, esophageal motility disorders, or medication-induced (pill esophagitis)."
  },
  {
    "q": "Fecal incontinence in elderly: Most common cause?",
    "a": "Overflow incontinence from fecal impaction (often due to constipation)."
  },
  {
    "q": "Urinary incontinence types in elderly women: Most common?",
    "a": "<b>Stress incontinence</b> (urethral hypermobility) and urge incontinence (overactive bladder)."
  },
  {
    "q": "<b>Normal pressure hydrocephalus</b>: Classic imaging finding?",
    "a": "Ventricular enlargement out of proportion to cortical atrophy (hydrocephalus ex vacuo is not the case)."
  },
  {
    "q": "What drug class worsens cognition and increases fall risk in elderly?",
    "a": "<b>Anticholinergics</b> (e.g., diphenhydramine, <b>oxybutynin</b>, tricyclic antidepressants)."
  },
  {
    "q": "Why avoid first-generation antihistamines in elderly?",
    "a": "Strong anticholinergic effects → confusion, delirium, dry mouth, constipation, urinary retention."
  },
  {
    "q": "Most common drug-induced cause of delirium in hospitalized elderly?",
    "a": "<b><b>Anticholinergics</b>, <b>benzodiazepines</b>, and opioids</b>."
  },
  {
    "q": "What is the <b>CHADS2-VASc</b> score used for in elderly?",
    "a": "Stroke risk stratification in atrial fibrillation to guide anticoagulation decision."
  },
  {
    "q": "Why is anticoagulation decision complex in elderly with AF?",
    "a": "High stroke risk but also high bleeding risk (<b>HAS-BLED</b> score); fall risk must be weighed."
  },
  {
    "q": "<b>Age-related macular degeneration</b> (<b>AMD</b>): Wet vs dry?",
    "a": "<b>Dry (atrophic)</b>: Drusen, geographic atrophy (more common). <b>Wet (neovascular)</b>: Choroidal neovascularization, treated with anti-<b>VEGF</b>."
  },
  {
    "q": "<b>Glaucoma</b> screening in elderly: Preferred test?",
    "a": "Tonometry (intraocular pressure) + fundoscopy/optic nerve evaluation."
  },
  {
    "q": "Cataract surgery indication in elderly?",
    "a": "Visual impairment affecting daily function/quality of life."
  },
  {
    "q": "Most common cause of chronic kidney disease in elderly?",
    "a": "<b>Hypertension and diabetes mellitus</b>."
  },
  {
    "q": "Why adjust dosing of renally cleared drugs in elderly even with normal serum creatinine?",
    "a": "GFR declines with age while creatinine production decreases due to <b>sarcopenia</b>."
  },
  {
    "q": "What is the leading preventable cause of disability in elderly?",
    "a": "<b>Falls</b>."
  },
  {
    "q": "Components of a multifactorial fall prevention program?",
    "a": "Medication review, balance/gait training, vitamin D supplementation, home safety assessment, management of orthostasis/vision."
  },
  {
    "q": "Hip fracture in elderly: Most important predictor of 1-year mortality?",
    "a": "<b>Pre-fracture functional status and comorbidities</b> (mortality ~20–30% at 1 year)."
  },
  {
    "q": "What is the concept of 'de-prescribing' in geriatrics?",
    "a": "Systematic process of tapering or stopping medications where harms outweigh benefits."
  },
  {
    "q": "Polypharmacy definition and major consequence?",
    "a": "≥5 medications. Major consequence: Increased adverse drug events, drug interactions, falls, cognitive impairment, and hospitalization."
  },
  {
    "q": "Malnutrition screening tool commonly used in elderly?",
    "a": "<b>Mini Nutritional Assessment (MNA)</b> or MUST (Malnutrition Universal Screening Tool)."
  },
  {
    "q": "Why is protein requirement higher in elderly?",
    "a": "Anabolic resistance (reduced muscle protein synthesis response) → recommended 1.0–1.2 g/kg/day (higher in illness)."
  },
  {
    "q": "What is the Mediterranean-DASH Intervention for Neurodegenerative Delay (MIND) diet?",
    "a": "Hybrid diet shown to slow cognitive decline and reduce Alzheimer risk."
  },
  {
    "q": "Role of physical activity in healthy aging?",
    "a": "Reduces <b>sarcopenia</b>, improves cognition, cardiovascular health, mood, and reduces frailty and falls."
  },
  {
    "q": "What is 'successful aging' according to <b>Rowe and Kahn</b>?",
    "a": "Low probability of disease/disability + high cognitive and physical function + active engagement with life."
  },
  {
    "q": "Ethical issue in elderly care: Therapeutic nihilism?",
    "a": "Under-treatment of elderly patients assuming poor prognosis or limited benefit."
  },
  {
    "q": "When can a physician override an elderly patient's refusal of treatment?",
    "a": "Only if patient lacks decision-making capacity and no valid advance directive exists."
  },
  {
    "q": "What is the 'Do Not Hospitalize' (DNH) order?",
    "a": "Directive for nursing home residents preferring comfort care over hospital transfer."
  },
  {
    "q": "Hospice vs palliative care: Key difference?",
    "a": "<b>Hospice</b>: For terminal illness with ≤6 months prognosis, focuses on comfort (no curative intent). <b>Palliative</b>: Can be concurrent with curative treatment."
  },
  {
    "q": "Most common psychiatric disorder in elderly?",
    "a": "<b>Depression</b> (often underdiagnosed)."
  },
  {
    "q": "Geriatric depression scale (GDS): Advantage?",
    "a": "Validated screening tool for depression in elderly that avoids somatic symptoms."
  },
  {
    "q": "Pseudodementia: Key feature?",
    "a": "Depression mimicking dementia. Often reversible with antidepressant treatment; patients usually complain of memory loss."
  },
  {
    "q": "<b>REM sleep</b> behavior disorder: Strong association?",
    "a": "<b>Synucleinopathies</b> (Parkinson disease, <b>Lewy body dementia</b>, multiple system atrophy)."
  },
  {
    "q": "Age-related change in circadian rhythm?",
    "a": "Advanced sleep phase syndrome: Earlier sleep and wake times."
  },
  {
    "q": "What is <b>sundowning</b> and management?",
    "a": "Increased agitation/confusion in late afternoon/evening in dementia patients. Management: Consistent routine, light exposure, avoid overstimulation."
  },
  {
    "q": "Most common cause of death in elderly with advanced dementia?",
    "a": "<b>Pneumonia (aspiration)</b>."
  },
  {
    "q": "What is the '<b>DNR</b>' discussion timing in elderly with frailty?",
    "a": "Early goals-of-care discussion, especially before acute illness or surgery."
  },
  {
    "q": "Elder abuse: Most common type?",
    "a": "<b>Neglect</b>, followed by psychological and financial abuse."
  },
  {
    "q": "Physician mandatory reporting for elder abuse?",
    "a": "Required in most states when reasonable suspicion exists."
  },
  {
    "q": "What is the 'Silver Tsunami'?",
    "a": "Rapid increase in elderly population (baby boomers) straining healthcare systems."
  },
  {
    "q": "What is the evolutionary theory of aging (antagonistic <b>pleiotropy</b>)?",
    "a": "Genes that confer advantage early in life (reproduction) may have deleterious effects later → natural selection favors early benefits despite late costs."
  },
  {
    "q": "Disposable soma theory of aging?",
    "a": "Organism allocates limited resources between reproduction and somatic maintenance; aging results from prioritizing reproduction over long-term repair."
  },
  {
    "q": "Role of <b>AMPK</b> in aging and <b>caloric restriction</b>?",
    "a": "Energy sensor activated by low <b>ATP</b> → promotes autophagy, mitochondrial biogenesis, and longevity pathways."
  },
  {
    "q": "What is the role of NAD+ decline in aging?",
    "a": "Reduced NAD+ levels impair sirtuin activity, DNA repair (PARP), and mitochondrial function → accelerated aging."
  },
  {
    "q": "Hallmarks of aging: List the original 9 (López-Otín).",
    "a": "Genomic instability, <b>telomere</b> attrition, epigenetic alterations, loss of proteostasis, deregulated nutrient sensing, mitochondrial dysfunction, cellular senescence, stem cell exhaustion, altered intercellular communication."
  },
  {
    "q": "Most common cause of death in adults over 85?",
    "a": "<b>Heart disease</b>, followed by cancer, stroke, and <b>Alzheimer disease</b>."
  },
  {
    "q": "Age-related cardiovascular change: Aortic stiffness effect?",
    "a": "Isolated systolic hypertension and increased pulse pressure."
  },
  {
    "q": "Why is orthostatic hypotension more common in elderly?",
    "a": "Impaired baroreflex, reduced vascular compliance, decreased renin-angiotensin response, and polypharmacy."
  },
  {
    "q": "Respiratory change in elderly increasing pneumonia risk?",
    "a": "↓ Mucociliary clearance, ↓ cough reflex, ↓ respiratory muscle strength, and ↑ residual volume."
  },
  {
    "q": "<b>GI</b> change leading to constipation in elderly?",
    "a": "Decreased colonic motility, reduced fluid intake, medications (opioids, <b>anticholinergics</b>), and immobility."
  },
  {
    "q": "What is the most common endocrine tumor in elderly?",
    "a": "<b>Thyroid nodules</b> (most are benign)."
  },
  {
    "q": "Postmenopausal <b>osteoporosis</b>: Primary mechanism?",
    "a": "Estrogen deficiency → increased RANKL → enhanced osteoclast activity and bone resorption."
  },
  {
    "q": "<b>Paget disease</b> of bone: Classic lab finding?",
    "a": "Markedly elevated alkaline phosphatase with normal calcium and phosphate."
  },
  {
    "q": "Most common primary brain tumor in elderly?",
    "a": "<b>Glioblastoma multiforme</b>."
  },
  {
    "q": "Why are elderly more susceptible to drug-induced hyponatremia?",
    "a": "Reduced renal free water excretion + common use of thiazides, <b>SSRIs</b>, and <b>carbamazepine</b>."
  },
  {
    "q": "<b>Beers Criteria</b>: Why avoid sliding-scale insulin in elderly?",
    "a": "High risk of hypoglycemia without improving glycemic control."
  },
  {
    "q": "What is the strongest predictor of functional decline in elderly?",
    "a": "<b>Frailty</b>."
  },
  {
    "q": "Fried Frailty Phenotype: 5 criteria?",
    "a": "Unintentional weight loss, exhaustion, weakness (grip strength), slow walking speed, low physical activity."
  },
  {
    "q": "What is the Clinical Frailty Scale used for?",
    "a": "Quick bedside assessment of frailty severity and prognosis."
  },
  {
    "q": "Most effective intervention to reduce falls in community-dwelling elderly?",
    "a": "<b>Multifactorial exercise programs</b> (balance, strength, gait training)."
  },
  {
    "q": "Vitamin D supplementation in elderly: Benefit?",
    "a": "Reduces fall risk and hip fracture risk when combined with calcium."
  },
  {
    "q": "What is the concept of '<b>homeostenosis</b>'?",
    "a": "Reduced physiological reserve in multiple organ systems with aging → decreased ability to maintain homeostasis under stress."
  },
  {
    "q": "Why is fever less common in elderly infections?",
    "a": "Blunted febrile response due to altered hypothalamic set point and reduced cytokine production."
  },
  {
    "q": "Atypical presentation of pneumonia in elderly?",
    "a": "Confusion, functional decline, anorexia, or falls rather than classic fever/cough."
  },
  {
    "q": "Most common valvular disease in elderly?",
    "a": "<b>Aortic stenosis</b> (calcific degenerative)."
  },
  {
    "q": "Why is <b>digoxin</b> toxicity more common in elderly?",
    "a": "Reduced <b>renal clearance</b> and lower lean body mass → higher serum levels."
  },
  {
    "q": "What is the leading iatrogenic cause of morbidity in hospitalized elderly?",
    "a": "<b>Delirium</b>."
  },
  {
    "q": "CAM tool: Used for diagnosis of what?",
    "a": "<b>Confusion Assessment Method</b> — screening for delirium."
  },
  {
    "q": "Prevention of delirium in hospitalized elderly: Key strategies?",
    "a": "Orientation, early mobilization, sleep hygiene, hydration, avoid restraints and high-risk medications."
  },
  {
    "q": "What is the most common cause of reversible cognitive impairment in elderly?",
    "a": "<b>Medication side effects</b>."
  },
  {
    "q": "Advance care planning: Difference between living will and POLST?",
    "a": "Living will: general wishes. POLST: actionable medical orders for seriously ill patients."
  },
  {
    "q": "Ethical principle of 'substituted judgment'?",
    "a": "Surrogate decides based on what the patient would have wanted if competent."
  },
  {
    "q": "When is artificial nutrition ethically withholdable in advanced dementia?",
    "a": "When it does not improve quality of life or comfort (per patient values/goals)."
  },
  {
    "q": "Elder self-neglect: Most common form of elder mistreatment?",
    "a": "<b>Yes</b> — often associated with dementia, depression, or substance use."
  },
  {
    "q": "What is the '4 Ms' framework in Age-Friendly Health Systems?",
    "a": "What Matters, Medications, Mentation, Mobility."
  },
  {
    "q": "<b>Compression of morbidity</b> vs. expansion of morbidity?",
    "a": "Compression: shorter period of disability at end of life. Expansion: longer period of disability."
  },
  {
    "q": "Most important social determinant of healthy aging?",
    "a": "<b>Social engagement and support networks</b>."
  },
  {
    "q": "Why is loneliness a major health risk in elderly?",
    "a": "Equivalent to smoking 15 cigarettes/day in mortality risk; increases dementia, heart disease, and depression."
  },
  {
    "q": "What is 'ageism' in healthcare?",
    "a": "Stereotyping or discrimination against individuals based on age → leads to undertreatment or poor communication."
  },
  {
    "q": "Recommended physical activity for older adults (CDC)?",
    "a": "150 min moderate aerobic + 2 days strength training + balance exercises weekly."
  },
  {
    "q": "<b>Caloric restriction</b> mimetics: Examples?",
    "a": "<b>Metformin, rapamycin, resveratrol</b> — activate similar pathways as caloric restriction."
  },
  {
    "q": "What is the role of <b>klotho gene</b> in aging?",
    "a": "Klotho protein deficiency accelerates aging; overexpression extends lifespan in mice."
  },
  {
    "q": "<b>Telomerase</b> gene therapy in aging research: Potential benefit?",
    "a": "May delay <b>telomere</b> shortening and some age-related diseases (still experimental)."
  },
  {
    "q": "Most promising current intervention for healthy aging in humans?",
    "a": "<b>Exercise combined with optimal nutrition and social engagement</b>."
  },
  {
    "q": "What is the 'geriatric 5Ms' model?",
    "a": "Mobility, Medications, Mind (mentation), Multiccomplexity, Matters Most (what matters to the patient)."
  },
  {
    "q": "Final common pathway of many age-related diseases?",
    "a": "<b>Chronic inflammation (<b>inflammaging</b>) and cellular senescence</b>."
  }
];
module.exports = { agingCards };
