import json

# Define the 80 cards
cards = [
    {
        "q": "What structural arterial change is the hallmark of cardiovascular aging, and what is its primary cellular mechanism?",
        "a": "<b>Arterial stiffening</b> (arteriosclerosis) is the hallmark change.<br><b>Mechanism:</b><ul><li>Gradual degradation and loss of <b>elastin fibers</b> in the medial layer of large arteries</li><li>Replacement of elastin with non-compliant <b>collagen cross-linking</b> (promoted by advanced glycation end-products)</li><li>Microcalcification of the arterial wall</li></ul>"
    },
    {
        "q": "How does arterial stiffening in the elderly alter central pulse wave reflection, and what is the effect on left ventricular afterload?",
        "a": "<b>Pulse wave reflection alteration:</b><ul><li>In young elastic arteries, the pressure wave reflected from peripheral bifurcation sites returns during <b>diastole</b>, boosting coronary perfusion pressure.</li><li>In stiff arteries, the pulse wave velocity increases, causing the reflected wave to return early during <b>systole</b>.</li></ul><b>Effect:</b><ul><li>Late-systolic pressure augmentation increases <b>left ventricular afterload</b>, promoting myocardial oxygen demand and <b>concentric left ventricular hypertrophy</b>.</li></ul>"
    },
    {
        "q": "What are the age-related changes in left ventricular diastolic relaxation (lusitropy), and how do they manifest on Doppler echocardiography?",
        "a": "<b>Diastolic relaxation changes:</b><ul><li>Impaired calcium reuptake into the sarcoplasmic reticulum (via <b>SERCA2a</b> deceleration) and delayed cross-bridge detachment prolong active relaxation.</li><li>Increased myocardial stiffness (collagen deposition, titin isoform changes) decreases passive compliance.</li></ul><b>Echocardiographic manifestation:</b><ul><li>Reversal of the normal filling pattern, resulting in an <b>E/A ratio &lt; 1</b> (early diastolic filling velocity [E] is less than late/atrial filling velocity [A]).</li></ul>"
    },
    {
        "q": "Why does the elderly heart depend heavily on the 'atrial kick' for left ventricular filling, and what clinical event can precipitously cause heart failure?",
        "a": "<b>Dependence on atrial kick:</b><ul><li>Due to age-related impaired early diastolic relaxation, up to <b>30–40% of stroke volume</b> (compared to ~15% in youth) depends on late diastolic filling from atrial contraction.</li></ul><b>Precipitating event:</b><ul><li>Onset of <b>atrial fibrillation</b>. Loss of the atrial kick leads to an immediate drop in cardiac output and acute <b>pulmonary congestion</b>.</li></ul>"
    },
    {
        "q": "How does the maximum heart rate change with age, what is the formula to estimate it, and what physiological change drives this decline?",
        "a": "<b>Maximum heart rate decline:</b><ul><li>Estimated maximum heart rate decreases progressively with age.</li><li><b>Formula:</b> Max HR = 220 − age</li></ul><b>Physiological drivers:</b><ul><li>Loss of pacemaker cells in the <b>sinoatrial (SA) node</b> (up to 90% lost by age 75, replaced by fibrous tissue).</li><li>Intrinsic reduction in SA node responsiveness to <b>&beta;-adrenergic stimulation</b>.</li></ul>"
    },
    {
        "q": "How does the aging cardiovascular system adapt to maintain cardiac output during exercise despite a blunted maximum heart rate?",
        "a": "<b>Adaptation mechanisms:</b><ul><li>Younger individuals increase cardiac output primarily via sympathetic-mediated tachycardia and contractility.</li><li>Elderly individuals rely on the <b>Frank-Starling mechanism</b> (increasing end-diastolic volume/preload to increase stroke volume).</li></ul><b>Implication:</b> Elderly patients are highly sensitive to <b>preload depletion</b> (dehydration, venodilators)."
    },
    {
        "q": "Why is the chronotropic response to exercise or stress blunted in older adults, and what receptor-level changes are responsible?",
        "a": "<b>Blunted chronotropic response:</b><ul><li>Reduced maximum heart rate and impaired peak cardiac output under stress.</li></ul><b>Receptor-level changes:</b><ul><li><b>Reduced &beta;-adrenergic receptor density</b> and impaired G-protein coupling.</li><li>Decreased downstream <b>cyclic AMP (cAMP)</b> generation.</li><li>Chronic high levels of circulating norepinephrine (due to reduced reuptake) cause receptor <b>desensitization</b>.</li></ul>"
    },
    {
        "q": "How does venous compliance change in the elderly, and what does this imply for orthostatic tolerance?",
        "a": "<b>Venous changes:</b><ul><li><b>Decreased venous compliance</b> and stiffening of venous walls.</li><li><b>Impaired baroreceptor reflex</b> response to pooling.</li></ul><b>Implication:</b><ul><li>Standing causes gravity-induced venous pooling in the lower extremities and splanchnic circulation, but blunted compensatory venoconstriction and tachycardia fail to restore blood pressure, precipitating <b>orthostatic hypotension</b>.</li></ul>"
    },
    {
        "q": "Define isolated systolic hypertension (ISH) in the elderly and state its prevalence relative to other hypertensive patterns in this age group.",
        "a": "<b>Definition:</b> Systolic blood pressure (SBP) <b>&gt;= 140 mmHg</b> with a diastolic blood pressure (DBP) <b>&lt; 90 mmHg</b>.<br><b>Prevalence:</b><ul><li>It is the <b>most common pattern</b> of hypertension in individuals aged &gt; 65 years, accounting for over 60–80% of cases.</li></ul>"
    },
    {
        "q": "What is the primary pathophysiology underlying isolated systolic hypertension (ISH) in older adults?",
        "a": "<b>Pathophysiology:</b><ul><li><b>Aortic stiffening</b> (loss of elastin, increased collagen) reduces the buffering capacity (Windkessel effect) of the aorta.</li><li>The stroke volume is ejected into a rigid arterial tree, causing a sharp rise in <b>systolic blood pressure</b>.</li><li>Due to lack of elastic recoil, diastolic pressure drops, leading to low <b>diastolic blood pressure</b> and a wide <b>pulse pressure</b>.</li></ul>"
    },
    {
        "q": "What is the 'J-curve' phenomenon in the treatment of hypertension in elderly patients, and which organ is most vulnerable to it?",
        "a": "<b>J-curve phenomenon:</b><ul><li>The observation that aggressive lowering of blood pressure, particularly <b>diastolic blood pressure (DBP) &lt; 60–65 mmHg</b>, increases the risk of adverse cardiovascular events.</li></ul><b>Vulnerable organ:</b><ul><li>The <b>heart/myocardium</b>, because coronary blood flow occurs almost exclusively during <b>diastole</b> and is dependent on diastolic perfusion pressure.</li></ul>"
    },
    {
        "q": "How did the SPRINT trial influence systolic blood pressure targets in ambulatory, non-institutionalized older adults (age &ge; 75)?",
        "a": "<b>SPRINT Trial Implications:</b><ul><li>Targeting an intensive <b>systolic BP &lt; 130 mmHg</b> (compared to standard &lt; 140 mmHg) significantly reduced cardiovascular events and all-cause mortality in ambulatory older adults.</li><li>This support forms the basis for the current <b>AHA/ACC target of &lt; 130/80 mmHg</b> for older adults.</li></ul>"
    },
    {
        "q": "What clinical concerns and adverse outcomes are associated with aggressive blood pressure lowering in frail elderly patients?",
        "a": "<b>Adverse outcomes of aggressive targets:</b><ul><li><b>Orthostatic hypotension</b> and syncope &rarr; falls and fractures</li><li><b>Acute kidney injury (AKI)</b> (hypoperfusion of aging kidneys)</li><li>Electrolyte abnormalities (hyponatremia, hypokalemia)</li><li>Cognitive impairment or confusion due to cerebral hypoperfusion</li></ul>"
    },
    {
        "q": "Why is chlorthalidone generally preferred over hydrochlorothiazide (HCTZ) for hypertension in the elderly, and what is the key monitoring concern?",
        "a": "<b>Preference:</b><ul><li><b>Chlorthalidone</b> has a longer half-life (48–72 hours vs 12 hours for HCTZ), provides 24-hour BP control, and has stronger clinical trial evidence for reducing cardiovascular events (e.g., ALLHAT trial).</li></ul><b>Monitoring concern:</b><ul><li>Chlorthalidone carries a higher risk of <b>hypokalemia</b>, <b>hyponatremia</b>, and <b>acute kidney injury</b>. Close monitoring of electrolytes and basic metabolic panels (BMP) is required.</li></ul>"
    },
    {
        "q": "A 72-year-old man with isolated systolic hypertension is started on amlodipine. What is the mechanism of his subsequent bilateral ankle edema, and how should it be managed?",
        "a": "<b>Mechanism of edema:</b><ul><li>Dihydropyridine CCBs cause selective <b>pre-capillary arteriolar vasodilation</b> without post-capillary venodilatation, increasing transcapillary hydrostatic pressure and causing fluid extravasation.</li></ul><b>Management:</b><ul><li>Reduce the dose or discontinue amlodipine.</li><li>Alternatively, add an <b>ACE inhibitor or ARB</b> (causes post-capillary venodilation, normalizing capillary pressure). Do not use loop diuretics to treat CCB-induced edema.</li></ul>"
    },
    {
        "q": "When are ACE inhibitors or ARBs specifically indicated as first-line therapy for hypertension in elderly patients?",
        "a": "<b>Indications:</b><ul><li>Presence of <b>Diabetes mellitus</b> (microalbuminuria/nephropathy protection)</li><li><b>Chronic kidney disease (CKD)</b> with proteinuria (reduces intraglomerular pressure by dilating efferent arteriole)</li><li><b>Heart failure</b> (HFrEF or post-MI)</li></ul>"
    },
    {
        "q": "Why are alpha-1 blockers (e.g., doxazosin, terazosin) avoided as first-line monotherapy for hypertension in elderly patients according to the Beers Criteria?",
        "a": "<b>Reasons to avoid:</b><ul><li>High risk of causing severe <b>orthostatic hypotension</b> and syncope, leading to falls and fractures.</li><li>ALLHAT trial showed increased risk of heart failure when doxazosin was used as first-line therapy.</li></ul>"
    },
    {
        "q": "Under what specific clinical circumstances are beta-blockers appropriate for hypertension management in an elderly patient?",
        "a": "<b>Specific clinical indications:</b><ul><li><b>Heart failure</b> (with reduced ejection fraction - carvedilol, metoprolol succinate, bisoprolol)</li><li><b>Ischemic heart disease</b> / post-myocardial infarction (reduces myocardial oxygen demand)</li><li><b>Atrial fibrillation</b> (for ventricular rate control)</li></ul>"
    },
    {
        "q": "Define the diagnostic criteria for orthostatic hypotension (OH) based on blood pressure measurements.",
        "a": "<b>Diagnostic criteria:</b><ul><li>A sustained reduction of at least <b>20 mmHg in systolic blood pressure (SBP)</b> OR at least <b>10 mmHg in diastolic blood pressure (DBP)</b> within <b>3 minutes</b> of standing up from a supine or sitting position.</li></ul>"
    },
    {
        "q": "A 74-year-old woman presents with lightheadedness upon standing. Supine BP is 140/80 mmHg, HR is 68 bpm. Standing BP is 115/75 mmHg, HR is 88 bpm. What is the diagnosis and etiology?",
        "a": "<b>Diagnosis:</b> <b>Orthostatic hypotension</b> (SBP fell by 25 mmHg).<br><b>Etiology:</b> Non-neurogenic (likely <b>volume depletion</b> or medication-related).<br><b>Reasoning:</b> The heart rate increased by 20 bpm (a compensatory response to intravascular volume loss, indicating intact baroreceptor reflexes)."
    },
    {
        "q": "An 80-year-old man with Parkinson's disease has a supine BP of 150/90 mmHg, HR 70 bpm. On standing, his BP drops to 110/70 mmHg and HR is 74 bpm. What is the diagnosis and type?",
        "a": "<b>Diagnosis:</b> <b>Neurogenic orthostatic hypotension</b> (nOH).<br><b>Reasoning:</b> BP dropped significantly (SBP fell by 40 mmHg) but the heart rate increased by <b>&lt; 15 bpm</b> (blunted chronotropic response). This demonstrates <b>autonomic failure</b> (impaired baroreflex mediated vasoconstriction and heart rate elevation), classic in Parkinson's, Multiple System Atrophy, and Pure Autonomic Failure."
    },
    {
        "q": "What are the key neurodegenerative diseases associated with neurogenic orthostatic hypotension (nOH)?",
        "a": "<b>Associated diseases:</b><ul><li><b>Parkinson's disease</b></li><li><b>Dementia with Lewy Bodies</b></li><li><b>Multiple System Atrophy</b> (Shy-Drager syndrome)</li><li><b>Pure Autonomic Failure</b></li></ul><b>Pathophysiology:</b> Synucleinopathy-induced loss of postganglionic sympathetic neurons or central autonomic pathways."
    },
    {
        "q": "What non-neurological chronic disease is the most common cause of autonomic neuropathy and neurogenic orthostatic hypotension?",
        "a": "<b>Disease:</b> <b>Diabetes mellitus</b>.<br><b>Mechanism:</b> Long-standing hyperglycemia leads to axonal degeneration of small autonomic fibers, impairing the sympathetic vasoconstrictor response to standing."
    },
    {
        "q": "How does elevating the head of the bed (HOB) at night manage orthostatic hypotension, and what is the physiological rationale?",
        "a": "<b>Management:</b> Elevating the HOB by <b>10–20 degrees (or 30 cm)</b>.<br><b>Rationale:</b><ul><li>Prevents the kidneys from perceiving the supine position as hypervolemia, which normally triggers nocturnal pressure natriuresis (fluid loss).</li><li>Decreases <b>supine hypertension</b>.</li><li>Reduces morning volume depletion, minimizing morning orthostatic hypotension.</li></ul>"
    },
    {
        "q": "What are the non-pharmacological physical maneuvers and compression strategies recommended for orthostatic hypotension?",
        "a": "<b>Strategies:</b><ul><li><b>Physical counterpressure maneuvers:</b> Leg crossing, squatting, tensing thigh/abdominal muscles, toe-standing.</li><li><b>Compression garments:</b> <b>Abdominal binders</b> (highly effective due to large splanchnic venous reservoir) and <b>waist-high compression stockings</b>. (Knee-high stockings are generally ineffective).</li></ul>"
    },
    {
        "q": "What lifestyle modifications regarding diet, fluid intake, and environment are advised for patients with orthostatic hypotension?",
        "a": "<b>Modifications:</b><ul><li><b>Fluid/salt intake:</b> Drink 2–2.5 L of water daily and increase salt intake to 6–10 g/day (unless contraindicated by severe HF/CKD).</li><li><b>Dietary timing:</b> Avoid large, carbohydrate-rich meals.</li><li><b>Environment:</b> Avoid hot baths, saunas, and prolonged standing.</li><li><b>Alcohol:</b> Avoid alcohol (potent vasodilator).</li></ul>"
    },
    {
        "q": "What is the mechanism of action of Midodrine, when should it be dosed, and what is a key contraindication?",
        "a": "<b>Mechanism:</b> Direct-acting <b>alpha-1 adrenergic agonist</b> &rarr; increases peripheral vascular resistance (venous and arterial constriction).<br><b>Dosing:</b> Taken during daytime hours (e.g., morning, noon, late afternoon), never within <b>4 hours of bedtime</b>.<br><b>Contraindication:</b> Severe <b>supine hypertension</b>."
    },
    {
        "q": "What is the mechanism of action of Fludrocortisone, and what side effects must be monitored in an elderly patient?",
        "a": "<b>Mechanism:</b> Synthetic <b>mineralocorticoid</b> (aldosterone analog) &rarr; increases renal sodium reabsorption and plasma volume.<br><b>Side effects to monitor:</b><ul><li><b>Supine hypertension</b></li><li>Congestive <b>heart failure exacerbation</b> and peripheral edema (due to volume expansion)</li><li><b>Hypokalemia</b> (potassium wasting)</li></ul>"
    },
    {
        "q": "What is the mechanism of action of Droxidopa, and what is its specific FDA-approved indication?",
        "a": "<b>Mechanism:</b> Synthetic amino acid precursor that is directly metabolized to <b>norepinephrine</b> by dopa-decarboxylase, replenishing depleted norepinephrine stores in sympathetic nerve terminals.<br><b>Indication:</b> Symptomatic <b>neurogenic orthostatic hypotension</b> (nOH) associated with Parkinson's, MSA, or Pure Autonomic Failure."
    },
    {
        "q": "What is Pyridostigmine's mechanism in orthostatic hypotension, and what is its main clinical advantage over midodrine?",
        "a": "<b>Mechanism:</b> <b>Acetylcholinesterase inhibitor</b> &rarr; increases acetylcholine at autonomic ganglionic synapses, enhancing sympathetic transmission specifically during standing.<br><b>Advantage:</b> It increases standing blood pressure <b>without worsening supine hypertension</b> (since ganglionic transmission is activity-dependent and silent when supine)."
    },
    {
        "q": "Define postprandial hypotension (PPH) in the elderly and state its timing.",
        "a": "<b>Definition:</b> A drop in systolic blood pressure of <b>&gt;= 20 mmHg</b> within <b>2 hours</b> of starting a meal.<br><b>Significance:</b> Common cause of falls, syncope, and transient ischemic attacks in older adults."
    },
    {
        "q": "What is the pathophysiology of postprandial hypotension (PPH) in older adults?",
        "a": "<b>Pathophysiology:</b><ul><li>Ingestion of food (especially carbohydrates) triggers release of vasodilatory GI peptides (e.g., neurotensin, VIP) and insulin, causing <b>splanchnic blood pooling</b>.</li><li>In healthy individuals, this is compensated by increased cardiac output and peripheral vasoconstriction.</li><li>In elderly patients, <b>impaired baroreceptor sensitivity</b> and autonomic dysfunction fail to compensate, leading to systemic hypotension.</li></ul>"
    },
    {
        "q": "How is postprandial hypotension managed non-pharmacologically?",
        "a": "<b>Management:</b><ul><li>Eat <b>frequent, smaller, low-carbohydrate meals</b> (minimizes insulin-mediated splanchnic pooling).</li><li>Drink <b>350–500 mL of water 15–30 minutes before meals</b> (increases sympathetic tone and blood pressure).</li><li>Avoid postprandial physical activity or alcohol.</li></ul>"
    },
    {
        "q": "What pharmacological agent can be used to treat postprandial hypotension, and what is its mechanism?",
        "a": "<b>Drug:</b> <b>Acarbose</b> (an alpha-glucosidase inhibitor).<br><b>Mechanism:</b> Delays the digestion of carbohydrates in the small intestine, blunting the rapid rise in glucose and insulin, which reduces splanchnic vasodilation and pooling."
    },
    {
        "q": "What is Carotid Sinus Hypersensitivity (CSH), and what is the difference between CSH and Carotid Sinus Syndrome (CSS)?",
        "a": "<b>Carotid Sinus Hypersensitivity (CSH):</b><ul><li>An asymptomatic abnormal response to carotid sinus massage (asystole &gt;= 3 seconds or SBP drop &gt;= 50 mmHg).</li></ul><b>Carotid Sinus Syndrome (CSS):</b><ul><li>The presence of CSH <b>accompanied by clinical symptoms</b> (syncope, presyncope, unexplained falls) triggered by activities that stimulate the carotid sinus (e.g., turning head, shaving, tight collars).</li></ul>"
    },
    {
        "q": "What are the three subtypes of Carotid Sinus Syndrome (CSS) and their diagnostic findings?",
        "a": "<b>CSS Subtypes:</b><ol><li><b>Cardioinhibitory:</b> Carotid massage induces <b>asystole &gt;= 3 seconds</b> (due to sinus arrest or AV block).</li><li><b>Vasodepressor:</b> Carotid massage induces a <b>systolic BP drop &gt;= 50 mmHg</b> without significant bradycardia.</li><li><b>Mixed:</b> Combination of both cardiac slowing and vasodepressor response.</li></ol>"
    },
    {
        "q": "What are the contraindications to performing carotid sinus massage in an elderly patient?",
        "a": "<b>Contraindications:</b><ul><li>History of <b>stroke</b> or <b>Transient Ischemic Attack (TIA)</b> within the past 3 months.</li><li>Presence of a <b>carotid bruit</b> (unless carotid ultrasound has ruled out significant stenosis).</li><li>Known severe <b>carotid artery stenosis</b> (&gt;70%).</li><li>History of ventricular tachyarrhythmias.</li></ul>"
    },
    {
        "q": "What is the primary treatment for symptomatic cardioinhibitory Carotid Sinus Syndrome (CSS) in the elderly?",
        "a": "<b>Treatment:</b><ul><li>Implantation of a <b>permanent dual-chamber pacemaker</b> (Class I recommendation for recurrent syncope with documented cardioinhibitory response).</li></ul>"
    },
    {
        "q": "How does the presentation of vasovagal syncope differ in elderly patients compared to younger individuals?",
        "a": "<b>Differences:</b><ul><li>Younger patients typically have a classic <b>prodrome</b> (nausea, warmth, diaphoresis, pallor).</li><li>Elderly patients often present <b>without a prodrome</b> (sudden syncope) or present with 'unexplained falls', leading to higher injury rates and diagnostic confusion.</li></ul>"
    },
    {
        "q": "Define Heart Failure with Preserved Ejection Fraction (HFpEF) based on left ventricular ejection fraction (LVEF).",
        "a": "<b>Definition:</b> Clinical signs and symptoms of heart failure accompanied by a left ventricular ejection fraction <b>&gt;= 50%</b>."
    },
    {
        "q": "Identify the primary epidemiological group most affected by HFpEF and the key predisposing comorbidities.",
        "a": "<b>Epidemiology:</b> Predominant in <b>older women</b>.<br><b>Predisposing comorbidities:</b><ul><li><b>Hypertension</b> (most common risk factor)</li><li>Obesity</li><li>Diabetes mellitus</li><li>Chronic kidney disease (CKD)</li><li>Atrial fibrillation</li></ul>"
    },
    {
        "q": "What is the core pathophysiology driving symptoms in HFpEF?",
        "a": "<b>Pathophysiology:</b><ul><li><b>Concentric LV hypertrophy/remodeling</b> (stimulated by chronic HTN).</li><li>Impaired active diastolic relaxation (lusitropy) and increased passive myocardial stiffness (collagen accumulation).</li><li>Stiff LV shifts the pressure-volume curve upward &rarr; small increases in volume lead to dramatic increases in <b>LV end-diastolic pressure (LVEDP)</b> &rarr; transmitted back to pulmonary veins &rarr; <b>pulmonary congestion</b>.</li></ul>"
    },
    {
        "q": "What clinical features and physical exam findings are characteristic of HFpEF, and what is the significance of an S4 gallop?",
        "a": "<b>Clinical features:</b> Exertional dyspnea, orthopnea, paroxysmal nocturnal dyspnea, bilateral ankle edema, jugular venous distension.<br><b>Physical exam findings:</b> <b>S4 gallop</b> (atrial gallop).<br><b>Significance of S4:</b> Caused by atrial contraction forcing blood into a <b>stiff, non-compliant left ventricle</b>. (Note: S4 is absent in patients with atrial fibrillation)."
    },
    {
        "q": "What initial biomarkers and echocardiographic findings are required to support a diagnosis of HFpEF?",
        "a": "<b>Diagnostic findings:</b><ul><li><b>Biomarkers:</b> Elevated natriuretic peptides: <b>NT-proBNP &gt; 125 pg/mL</b> (sinus rhythm) or &gt; 365 pg/mL (atrial fibrillation).</li><li><b>Echocardiogram:</b> LVEF <b>&gt;= 50%</b> + evidence of structural remodeling (LV mass index or Left Atrial Volume Index &gt; 34 mL/m²) + diastolic dysfunction (e.g., <b>E/e' ratio &gt;= 9</b>).</li></ul>"
    },
    {
        "q": "What is the HFA-PEFF diagnostic algorithm, and what are its three main domains?",
        "a": "<b>HFA-PEFF Algorithm:</b> A stepwise scoring system for diagnosing HFpEF.<br><b>Three domains scored:</b><ol><li><b>Functional:</b> Echocardiography (e.g., septal and lateral e' velocities, E/e' ratio).</li><li><b>Morphological:</b> Left atrial volume index, LV mass index, relative wall thickness.</li><li><b>Biomarker:</b> NT-proBNP or BNP levels.</li></ol>"
    },
    {
        "q": "What is the H2FPEF score, and what clinical variables does it use to estimate the probability of HFpEF?",
        "a": "<b>H2FPEF Score:</b> A clinical scoring tool to estimate probability of HFpEF.<br><b>Variables:</b><ul><li><b>H:</b> Heavy (BMI &gt; 30 kg/m²)</li><li><b>H:</b> Hypertensive (using &ge; 2 BP medications)</li><li><b>F:</b> Fibrillation (atrial fibrillation)</li><li><b>P:</b> Pulmonary hypertension (PASP &gt; 35 mmHg)</li><li><b>E:</b> Elder (age &gt; 60 years)</li><li><b>F:</b> Filling pressures (E/e' &gt; 9)</li></ul>"
    },
    {
        "q": "What class of medications has the strongest (Class I) recommendation to reduce cardiovascular death and HF hospitalizations in patients with HFpEF, and what are the key drug names?",
        "a": "<b>Medication class:</b> <b>SGLT2 Inhibitors</b>.<br><b>Drug names:</b> <b>Empagliflozin</b> and <b>Dapagliflozin</b>.<br><b>Evidence:</b> Supported by the EMPEROR-Preserved and DELIVER clinical trials."
    },
    {
        "q": "What did the TOPCAT trial reveal about the role of spironolactone (mineralocorticoid receptor antagonist) in HFpEF?",
        "a": "<b>TOPCAT Trial Findings:</b><ul><li>Spironolactone did not significantly reduce the primary composite outcome of cardiovascular death or HF hospitalization.</li><li>However, it showed a <b>modest reduction in heart failure hospitalizations</b>.</li><li>Use requires careful monitoring for <b>hyperkalemia</b> and worsening renal function.</li></ul>"
    },
    {
        "q": "What did the PARAGON-HF trial show regarding Sacubitril/Valsartan (ARNI) use in HFpEF, and which subgroups benefit most?",
        "a": "<b>PARAGON-HF Findings:</b><ul><li>Sacubitril/Valsartan narrowly missed statistical significance for the primary endpoint in the overall HFpEF population.</li><li><b>Subgroup benefits:</b> Patients with an LVEF in the lower range (e.g., <b>50–57%</b>) and <b>women</b> showed significant reduction in HF hospitalizations.</li></ul>"
    },
    {
        "q": "What are the primary differences in pharmacotherapy recommendations between HFpEF and HFrEF?",
        "a": "<b>Treatment differences:</b><ul><li><b>HFrEF:</b> Strong, mortality-reducing evidence for 'four-pillar' therapy: <b>Beta-blockers, ACEi/ARB/ARNI, MRAs, and SGLT2 inhibitors</b>.</li><li><b>HFpEF:</b> No therapy has been shown to reduce mortality. <b>SGLT2 inhibitors</b> are first-line for hospitalization risk reduction. Beta-blockers, ACEi, and ARBs do not improve outcomes and are used primarily for managing comorbidities (HTN, CAD, AF).</li></ul>"
    },
    {
        "q": "Why is managing congestive symptoms with diuretics challenging in HFpEF, and what loop diuretics are commonly used?",
        "a": "<b>Challenge:</b><ul><li>The stiff LV in HFpEF is highly <b>preload-dependent</b>. Over-diuresis can cause a sudden fall in stroke volume, leading to hypotension and AKI.</li></ul><b>Common agents:</b><ul><li><b>Furosemide</b>, <b>Torsemide</b>, and <b>Bumetanide</b>. Torsemide has more predictable oral bioavailability in the setting of gut congestion.</li></ul>"
    },
    {
        "q": "Why is the development of atrial fibrillation particularly devastating for a patient with HFpEF?",
        "a": "<b>Reasons for poor tolerance:</b><ul><li><b>Loss of atrial kick:</b> Stiff LV relies heavily on atrial contraction for filling.</li><li><b>Tachycardia:</b> High heart rates shorten <b>diastole</b>, reducing the time available for ventricular filling, which increases LVEDP and worsens pulmonary congestion.</li></ul>"
    },
    {
        "q": "What blood pressure target is recommended for patients with HFpEF, and why?",
        "a": "<b>BP Target:</b> <b>&lt; 130/80 mmHg</b>.<br><b>Rationale:</b> Aggressive blood pressure control prevents progressive concentric LV hypertrophy, improves arterial compliance, and reduces the frequency of acute HF hospitalizations."
    },
    {
        "q": "What role does exercise training play in the management of HFpEF?",
        "a": "<b>Role:</b><ul><li>Improves peak oxygen consumption (VO₂ max) and quality of life.</li><li><b>Mechanism:</b> Promotes peripheral adaptations (improved skeletal muscle oxygen extraction and vascular function) rather than improving LVEF.</li></ul>"
    },
    {
        "q": "Explain why beta-blockers may cause worsening fatigue or chronotropic incompetence in elderly patients with HFpEF?",
        "a": "<b>Mechanism:</b><ul><li>Many HFpEF patients have baseline <b>chronotropic incompetence</b> (inability to increase heart rate with exercise).</li><li>Beta-blockers blunt the heart rate response further, preventing the patient from increasing cardiac output during exertion, leading to worsening dyspnea and fatigue.</li></ul>"
    },
    {
        "q": "How does the prevalence of atrial fibrillation change with age, and what is its prevalence in octogenarians?",
        "a": "<b>Prevalence:</b> Increases exponentially with age.<br><b>Octogenarians:</b> Approximately <b>10%</b> of individuals aged &gt; 80 years have atrial fibrillation."
    },
    {
        "q": "What scoring system is used to evaluate stroke risk in elderly patients with atrial fibrillation, and how does age contribute to the score?",
        "a": "<b>Scoring system:</b> <b>CHA₂DS₂-VASc</b> score.<br><b>Age contribution:</b><ul><li>Age <b>&gt;= 75 years</b>: <b>2 points</b> (strongest risk factor alongside stroke history).</li><li>Age <b>65–74 years</b>: <b>1 point</b>.</li></ul>"
    },
    {
        "q": "Why are Direct Oral Anticoagulants (DOACs) preferred over warfarin for stroke prevention in elderly patients with atrial fibrillation?",
        "a": "<b>DOAC preference:</b><ul><li>Significantly lower risk of <b>intracranial hemorrhage</b>.</li><li>Predictable pharmacokinetics (no regular INR monitoring needed).</li><li>Fewer food and drug-drug interactions.</li></ul><b>Preferred agents:</b> Apixaban (often preferred in older adults due to favorable safety/GI bleeding profile)."
    },
    {
        "q": "What is the HAS-BLED score, and how should it be used when considering anticoagulation in an elderly patient?",
        "a": "<b>HAS-BLED:</b> A scoring system to assess bleeding risk in patients on anticoagulation.<br><b>Clinical application:</b><ul><li>It should <b>not</b> be used to withhold anticoagulation.</li><li>Instead, it identifies <b>modifiable bleeding risk factors</b> (e.g., uncontrolled hypertension, labile INR, concurrent NSAID or antiplatelet use) that need to be addressed.</li></ul>"
    },
    {
        "q": "What did clinical trials (e.g., AFFIRM) establish regarding rate control versus rhythm control in elderly patients with atrial fibrillation?",
        "a": "<b>Findings:</b><ul><li><b>Rate control</b> is non-inferior to rhythm control regarding mortality and stroke prevention, and is associated with fewer adverse drug events.</li><li>Rate control is generally the <b>preferred first-line strategy</b> in asymptomatic or minimally symptomatic elderly patients.</li></ul>"
    },
    {
        "q": "What is the recommended target resting heart rate for rate control in atrial fibrillation in asymptomatic patients according to the RACE II trial?",
        "a": "<b>Target heart rate:</b> A lenient rate control target of <b>&lt; 110 bpm</b> at rest is acceptable (non-inferior to strict control &lt; 80 bpm and associated with fewer bradycardic events)."
    },
    {
        "q": "Identify the first-line pharmacotherapy options for rate control in an elderly patient with atrial fibrillation and comorbid HFpEF.",
        "a": "<b>Options:</b><ul><li><b>Beta-blockers:</b> Metoprolol succinate or carvedilol.</li><li><b>Non-dihydropyridine calcium channel blockers:</b> Diltiazem or verapamil (safe in HFpEF; contraindicated in HFrEF).</li></ul>"
    },
    {
        "q": "Should anticoagulation be withheld in an elderly patient solely due to high fall risk?",
        "a": "<b>Recommendation:</b> <b>No</b>.<br><b>Rationale:</b> A patient must fall approximately <b>300 times per year</b> for the risk of subdural hemorrhage to outweigh the stroke prevention benefits of anticoagulation. Anticoagulation should be continued while aggressive fall prevention strategies are implemented."
    },
    {
        "q": "What is the most common valvular disease in elderly patients, and what is its pathophysiology?",
        "a": "<b>Valvular disease:</b> <b>Calcific (senile) aortic stenosis</b>.<br><b>Pathophysiology:</b> Active cellular process similar to atherosclerosis: lipid accumulation, chronic inflammation, osteoblast-like phenotypic transformation, and <b>calcification</b> of the valve leaflets without commissural fusion."
    },
    {
        "q": "Identify the classic triad of symptoms associated with severe aortic stenosis in the elderly and the survival prognosis of each if untreated.",
        "a": "<b>Classic Triad (SAD):</b><ol><li><b>Syncope</b> (survival: <b>3 years</b>)</li><li><b>Angina</b> (survival: <b>5 years</b>)</li><li><b>Dyspnea / Heart Failure</b> (survival: <b>2 years</b>)</li></ol>"
    },
    {
        "q": "Describe the classic physical exam findings of severe aortic stenosis in an older adult.",
        "a": "<b>Physical exam findings:</b><ul><li>Harsh <b>crescendo-decrescendo systolic murmur</b> at the right second intercostal space radiating to the carotids.</li><li><b>Pulsus parvus et tardus</b> (weak and delayed carotid upstroke).</li><li><b>Soft or absent second heart sound (S2)</b> (due to calcified, rigid aortic leaflets).</li><li>Paradoxical splitting of S2.</li></ul>"
    },
    {
        "q": "What is low-flow, low-gradient aortic stenosis, and what diagnostic test is used to evaluate it?",
        "a": "<b>Definition:</b> Echocardiogram shows AVA &lt; 1.0 cm², but mean gradient &lt; 40 mmHg and LVEF &lt; 50% (due to low stroke volume).<br><b>Diagnostic test:</b> <b>Dobutamine stress echocardiography</b>.<br><b>Purpose:</b> Distinguishes true severe AS (gradient increases, valve area remains small) from pseudo-severe AS (valve area increases with increased cardiac output) and assesses contractile reserve."
    },
    {
        "q": "What are the indications for choosing Transcatheter Aortic Valve Replacement (TAVR) over Surgical Aortic Valve Replacement (SAVR) in an elderly patient?",
        "a": "<b>TAVR indications:</b><ul><li>Age <b>&gt;= 80 years</b> OR high/prohibitive surgical risk (Society of Thoracic Surgeons score &gt; 8%).</li><li>Favorable transfemoral access anatomy.</li><li>Frailty or significant comorbidities that limit surgical recovery.</li></ul>"
    },
    {
        "q": "How does the clinical presentation of coronary artery disease (CAD) in the elderly differ from that in younger patients?",
        "a": "<b>Atypical presentations:</b><ul><li>Chest pain is frequently absent.</li><li>Patients present with <b>anginal equivalents</b>: <b>dyspnea</b> (most common), exertional fatigue, confusion, diaphoresis, or epigastric pain.</li><li>Silent myocardial infarction is common, often discovered incidentally on ECG.</li></ul>"
    },
    {
        "q": "Why is exercise stress testing often less useful or contraindicated in elderly patients suspected of CAD, and what is the alternative?",
        "a": "<b>Limitations:</b> Physical limitations (osteoarthritis, sarcopenia, deconditioning) prevent patients from reaching 85% of their age-predicted maximum heart rate. Baseline ECG changes (LBBB, pacemaker) make interpretation difficult.<br><b>Alternative:</b> <b>Pharmacological stress testing</b> (e.g., vasodilator stress with regadenoson/dipyridamole, or dobutamine stress echocardiography)."
    },
    {
        "q": "What dual antiplatelet therapy (DAPT) duration is recommended after PCI in elderly patients, and what strategies minimize bleeding?",
        "a": "<b>Duration:</b> A shortened DAPT duration (e.g., <b>1 to 3 months</b> followed by P2Y12 inhibitor monotherapy) is increasingly used in older adults at high bleeding risk.<br><b>Bleeding mitigation strategies:</b><ul><li>Use <b>clopidogrel</b> instead of prasugrel/ticagrelor (lower bleeding risk).</li><li>Co-prescribe a <b>Proton Pump Inhibitor (PPI)</b>.</li><li>Prefer <b>radial artery access</b> over femoral access for PCI.</li></ul>"
    },
    {
        "q": "Explain why elderly patients are highly susceptible to digoxin toxicity, and list the key clinical symptoms.",
        "a": "<b>Susceptibility:</b><ul><li>Digoxin is renally cleared; age-related <b>decline in GFR</b> increases serum half-life.</li><li>Reduced skeletal muscle mass (Vd) increases serum concentration.</li></ul><b>Symptoms:</b><ul><li><b>GI:</b> Anorexia, nausea, vomiting, abdominal pain.</li><li><b>Neurological:</b> Confusion, fatigue.</li><li><b>Visual:</b> Yellow-green color vision changes (<b>xanthopsia</b>), halos.</li><li><b>Cardiac:</b> Bradycardia, AV block, ventricular arrhythmias (classic: <b>bidirectional ventricular tachycardia</b>).</li></ul>"
    },
    {
        "q": "What electrolyte abnormality increases the risk of digoxin toxicity, and how does this occur?",
        "a": "<b>Electrolyte abnormality:</b> <b>Hypokalemia</b>.<br><b>Mechanism:</b> Digoxin competes with potassium for binding to the <b>Na+/K+-ATPase pump</b>. In the presence of hypokalemia, there is less competition, allowing more digoxin to bind, which increases toxic effects even at 'normal' serum digoxin levels."
    },
    {
        "q": "Describe the 'Triple Whammy' drug interaction that causes acute kidney injury in elderly patients.",
        "a": "<b>The Triple Whammy:</b><ol><li><b>ACE inhibitor / ARB:</b> Dilates the efferent arteriole, reducing glomerular filtration pressure.</li><li><b>Diuretic:</b> Causes volume depletion, reducing renal perfusion pressure.</li><li><b>NSAID:</b> Inhibits prostaglandins, causing afferent arteriolar vasoconstriction, further reducing renal perfusion.</li></ol><b>Result:</b> Precipitous drop in GFR, leading to <b>acute kidney injury (AKI)</b>."
    },
    {
        "q": "What is the interaction between non-dihydropyridine CCBs (diltiazem, verapamil) and statins, and what dosing adjustment is required?",
        "a": "<b>Interaction:</b> Diltiazem and verapamil are moderate <b>CYP3A4 inhibitors</b>. They increase plasma concentrations of CYP3A4-metabolized statins (<b>simvastatin, atorvastatin, lovastatin</b>), increasing the risk of <b>myopathy and rhabdomyolysis</b>.<br><b>Dosing adjustment:</b> Limit Simvastatin dose to <b>&lt;= 10–20 mg/day</b> when co-prescribed with these CCBs (or switch to rosuvastatin/pravastatin, which are not metabolized by CYP3A4)."
    },
    {
        "q": "Which common classes of drugs cause QTc prolongation in elderly patients, and what is the risk?",
        "a": "<b>QTc-prolonging drug classes:</b><ul><li><b>Macrolides</b> (clarithromycin, erythromycin) and <b>Fluoroquinolones</b> (levofloxacin, ciprofloxacin)</li><li><b>Azole antifungals</b> (fluconazole)</li><li><b>Antipsychotics</b> (haloperidol, ziprasidone)</li><li><b>Tricyclic antidepressants</b> (amitriptyline)</li><li><b>Antiarrhythmics</b> (amiodarone, sotalol)</li></ul><b>Risk:</b> Development of <b>Torsades de Pointes</b> (polymorphic ventricular tachycardia) and sudden cardiac death."
    },
    {
        "q": "What drug-drug interactions must be managed when initiating amiodarone in an elderly patient on warfarin and digoxin?",
        "a": "<b>Amiodarone Interactions:</b><ul><li><b>Warfarin:</b> Amiodarone inhibits CYP2C9, increasing warfarin levels. <b>Management:</b> Empirical <b>reduction of warfarin dose by 30–50%</b> upon starting amiodarone; monitor INR.</li><li><b>Digoxin:</b> Amiodarone inhibits P-glycoprotein, reducing digoxin clearance. <b>Management:</b> Empirical <b>reduction of digoxin dose by 50%</b>; monitor digoxin levels.</li></ul>"
    },
    {
        "q": "Why are NSAIDs contraindicated or used with extreme caution in patients with heart failure (HFpEF or HFrEF)?",
        "a": "<b>Reasons for caution:</b><ul><li>NSAIDs inhibit renal prostaglandins, promoting <b>sodium and water retention</b>.</li><li>This volume expansion can precipitate acute heart failure decompensation.</li><li>NSAIDs also increase systemic vascular resistance (afterload), worsening cardiac workload.</li></ul>"
    },
    {
        "q": "What is the clinical significance of a soft or absent S2 in the evaluation of a systolic murmur in an elderly patient?",
        "a": "<b>Significance:</b><ul><li>A normal S2 indicates mobile valve leaflets (murmur is likely benign aortic sclerosis).</li><li>A <b>soft or absent S2</b> suggests calcified, rigid aortic leaflets that cannot snap shut, which is a strong physical sign of <b>severe aortic stenosis</b>.</li></ul>"
    },
    {
        "q": "How does the presence of chronic kidney disease (CKD) affect the utility of BNP/NT-proBNP in the diagnosis of heart failure in elderly patients?",
        "a": "<b>Effect:</b><ul><li>Natriuretic peptides are partially cleared by the kidneys.</li><li>In patients with GFR &lt; 60 mL/min, baseline <b>BNP and NT-proBNP levels are elevated</b> in the absence of acute heart failure.</li><li><b>Diagnostic adjustment:</b> A higher cutoff is required (e.g., <b>NT-proBNP &gt; 900 pg/mL</b> for age &gt; 75 years or in severe CKD) to confirm acute heart failure.</li></ul>"
    }
]

# Write out the JS file
filepath = r"c:/Users/Hasan-PC/Desktop/MedHelp/scratch/cards_output/geri_cardiovascular_elderly.js"
print(f"Total cards defined in python array: {len(cards)}")

with open(filepath, "w", encoding="utf-8") as f:
    f.write("// TOPIC: Cardiovascular disease in elderly — isolated systolic HTN, orthostatic hypotension, HFpEF\n")
    f.write("// SECTION: Geriatrics / Cardiovascular\n")
    f.write(f"// CARD COUNT: {len(cards)}\n\n")
    f.write("const cards_geri_cardiovascular_elderly = [\n")
    for i, c in enumerate(cards):
        q_escaped = c['q'].replace('"', '\\"')
        a_escaped = c['a'].replace('"', '\\"')
        comma = "," if i < len(cards) - 1 else ""
        f.write(f'  {{\n    q: "{q_escaped}",\n    a: "{a_escaped}"\n  }}{comma}\n')
    f.write("];\n\nmodule.exports = cards_geri_cardiovascular_elderly;\n")

print("File written successfully!")
