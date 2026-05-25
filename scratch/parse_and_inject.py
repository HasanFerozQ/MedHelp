import re
import sys

# Define the raw data provided by the user
raw_data = """
Section: Internal Medicine


Topic: Cardiology — ACS, heart failure, arrhythmias, valvular disease


Front: Most common cause of ACS?

Back: Rupture of an unstable atherosclerotic plaque with subsequent thrombus formation.

Front: Definition of Unstable Angina (UA)?

Back: Ischemic symptoms at rest, new-onset severe angina, or increasing intensity/frequency without cardiac biomarker elevation.

Front: Difference between NSTEMI and STEMI on EKG?

Back: NSTEMI shows ST-depression or T-wave inversion; STEMI shows ST-segment elevation or new LBBB.

Front: Gold standard biomarker for myocardial necrosis?

Back: Cardiac Troponin I or T.

Front: Timeframe for Troponin elevation after MI?

Back: Elevates in 3–12 hours, peaks at 24 hours, stays elevated for 5–14 days.

Front: Primary goal for "Door-to-Balloon" time in STEMI?

Back: Less than 90 minutes.

Front: Indication for Fibrinolytics in STEMI?

Back: PCI unavailable within 120 minutes of medical contact.

Front: Absolute contraindication for Fibrinolytics?

Back: Prior intracranial hemorrhage, active internal bleeding, or ischemic stroke within 3 months.

Front: Standard "MONA" therapy for ACS?

Back: Morphine, Oxygen (if <90%), Nitroglycerin, Aspirin.

Front: Role of Beta-blockers in ACS?

Back: Reduce myocardial oxygen demand by decreasing heart rate and contractility.

Front: Contraindications for Nitroglycerin in ACS?

Back: Right ventricular infarction, hypotension, or recent PDE-5 inhibitor use (e.g., Sildenafil).

Front: Post-MI complication occurring 2–7 days later with a new holosystolic murmur?

Back: Ventricular septal rupture or Papillary muscle rupture.

Front: Clinical sign of Right Ventricular (RV) Infarction?

Back: Hypotension, clear lungs, and JVD (Kussmaul’s sign).

Front: Treatment for RV Infarction?

Back: Aggressive IV fluid resuscitation; avoid nitrates.

Front: Definition of Dressler Syndrome?

Back: Post-MI autoimmune pericarditis occurring 2–10 weeks after the event.

Front: First-line long-term antiplatelet therapy post-ACS?

Back: Dual Antiplatelet Therapy (DAPT) with Aspirin and a P2Y12 inhibitor (e.g., Clopidogrel, Ticagrelor).

Section II: Heart Failure (HF)
Front: Primary distinction between HFrEF and HFpEF?

Back: HFrEF (Systolic) has LVEF ≤40%; HFpEF (Diastolic) has LVEF ≥50%.

Front: Most common cause of Left-sided Heart Failure?

Back: Ischemic heart disease and Hypertension.

Front: Most common cause of Right-sided Heart Failure?

Back: Left-sided heart failure.

Front: Key physical exam finding for Left HF?

Back: Pulmonary rales, S3 gallop, and displaced apical impulse.

Front: Key physical exam finding for Right HF?

Back: Jugular Venous Distention (JVD), hepatomegaly, and peripheral edema.

Front: Meaning of a Positive Hepatojugular Reflux?

Back: Suggests elevated pulmonary artery wedge pressure (Left heart congestion).

Front: Diagnostic utility of B-type Natriuretic Peptide (BNP)?

Back: High sensitivity to rule out HF in patients with acute dyspnea.

Front: Four pillars of Guideline-Directed Medical Therapy (GDMT) for HFrEF?

Back: ARNI (or ACEi/ARB), Beta-blocker, MRA (Spironolactone), and SGLT2 inhibitor.

Front: Which Beta-blockers are proven to reduce mortality in HFrEF?

Back: Carvedilol, Metoprolol succinate, and Bisoprolol.

Front: Indication for Spironolactone in HF?

Back: NYHA Class II-IV with LVEF ≤35%.

Front: Common side effect of ACE inhibitors?

Back: Cough and angioedema due to increased bradykinin.

Front: Mechanism of Sacubitril (in ARNI)?

Back: Neprilysin inhibitor that prevents breakdown of natriuretic peptides.

Front: Digoxin’s role in HF management?

Back: Symptom control and reduction of hospitalizations; does not improve mortality.

Front: Sign of Digoxin toxicity on EKG?

Back: Downsloping ST-segment depression ("Salvador Dali mustache") and arrhythmias.

Front: Criteria for Cardiac Resynchronization Therapy (CRT)?

Back: LVEF ≤35%, NYHA II-IV, and QRS duration ≥150ms with LBBB morphology.

Front: CXR findings in Acute Decompensated HF?

Back: Cephalization of vessels, Kerley B lines, pleural effusions, and cardiomegaly.


Section III: Arrhythmias

Front: Most common chronic arrhythmia?

Back: Atrial Fibrillation (AFib).

Front: EKG characteristics of AFib?

Back: Irregularly irregular rhythm with absent P-waves.

Front: Scoring system used to assess stroke risk in AFib?

Back: CHA2DS2-VASc score.

Front: Treatment for hemodynamically unstable AFib?

Back: Immediate synchronized electrical cardioversion.

Front: First-line pharmacological rate control for AFib?

Back: Beta-blockers or Non-dihydropyridine Calcium Channel Blockers (Diltiazem/Verapamil).

Front: Target INR for AFib patients on Warfarin?

Back: 2.0 to 3.0.

Front: Classic EKG finding in Atrial Flutter?

Back: "Sawtooth" flutter waves, typically seen in leads II, III, and aVF.

Front: First-line treatment for Paroxysmal Supraventricular Tachycardia (PSVT)?

Back: Vagal maneuvers followed by IV Adenosine.

Front: Characteristic EKG triad of Wolff-Parkinson-White (WPW)?

Back: Short PR interval, widened QRS, and a Delta wave.

Front: Avoided drugs in WPW with AFib?

Back: AV nodal blockers (ABCD: Adenosine, Beta-blockers, CCBs, Digoxin).

Front: Definition of Torsades de Pointes?

Back: Polymorphic Ventricular Tachycardia associated with a prolonged QT interval.

Front: Immediate treatment for Torsades de Pointes?

Back: IV Magnesium Sulfate.

Front: EKG finding in First-degree AV block?

Back: Fixed PR interval prolongation >200ms without dropped beats.

Front: Distinguishing feature of Mobitz Type I (Wenckebach)?

Back: Progressive PR interval lengthening until a QRS is dropped.

Front: Management of Mobitz Type II block?

Back: Permanent pacemaker (due to high risk of progression to 3rd-degree block).

Front: Definition of Third-degree (Complete) Heart Block?

Back: Complete dissociation between P-waves and QRS complexes.

Section IV: Valvular Disease

Front: Classic triad of Aortic Stenosis (AS)?

Back: Angina, Syncope, and Dyspnea (SAD).

Front: Murmur description for Aortic Stenosis?

Back: Harsh crescendo-decrescendo systolic murmur at the right upper sternal border radiating to carotids.

Front: Physical exam sign "Pulsus parvus et tardus" indicates?

Back: Severe Aortic Stenosis.

Front: Most common cause of Aortic Stenosis in patients <70 years old?

Back: Bicuspid aortic valve.

Front: Murmur description for Aortic Regurgitation (AR)?

Back: Early diastolic blowing decrescendo murmur at the left sternal border.

Front: What is "Water-hammer pulse" (Corrigan pulse)?

Back: Rapidly rising and falling arterial pulse seen in chronic Aortic Regurgitation.

Front: Most common cause of Mitral Stenosis (MS) worldwide?

Back: Rheumatic Heart Disease.

Front: Murmur description for Mitral Stenosis?

Back: Mid-diastolic rumbling murmur with an opening snap at the apex.

Front: Relationship between Opening Snap and MS severity?

Back: A shorter A2-to-opening snap interval indicates more severe stenosis.

Front: Murmur description for Mitral Regurgitation (MR)?

Back: Holosystolic, blowing murmur at the apex radiating to the axilla.

Front: Acute Mitral Regurgitation is a common complication of?

Back: Papillary muscle rupture post-MI or Infective Endocarditis.

Front: Murmur of Mitral Valve Prolapse (MVP)?

Back: Midsystolic click followed by a late systolic murmur.

Front: Maneuver that makes MVP and HOCM murmurs louder?

Back: Valsalva or standing (decreases preload).

Front: Murmur of Tricuspid Regurgitation?

Back: Holosystolic murmur at the left lower sternal border that increases with inspiration.

Front: Definitive diagnostic test for all valvular lesions?

Back: Echocardiography.

Section V: Cardiomyopathy & Pericardial Disease

Front: Most common type of cardiomyopathy?

Back: Dilated Cardiomyopathy.

Front: Characteristic finding on Echo for Hypertrophic Obstructive Cardiomyopathy (HOCM)?

Back: Asymmetric septal hypertrophy and Systolic Anterior Motion (SAM) of the mitral valve.

Front: First-line medication for symptomatic HOCM?

Back: Beta-blockers (to increase diastolic filling time).

Front: Classic EKG finding in Acute Pericarditis?

Back: Diffuse ST-segment elevation and PR-segment depression.

Front: Beck’s Triad for Cardiac Tamponade?

Back: Hypotension, JVD, and muffled heart sounds.

Front: Definition of Pulsus Paradoxus?

Back: A drop in systolic blood pressure >10 mmHg during inspiration.

Front: EKG finding in Cardiac Tamponade?

Back: Electrical alternans (alternating QRS amplitude).

Front: Kussmaul’s sign is most associated with which pericardial pathology?

Back: Constrictive Pericarditis.

Front: Treatment of choice for Cardiac Tamponade?

Back: Urgent pericardiocentesis.

Front: Common etiology of Restrictive Cardiomyopathy?

Back: Amyloidosis, Sarcoidosis, or Hemochromatosis.

Section VI: Clinical Pearls & Pharmacology

Front: Preferred treatment for Hypertensive Emergency?

Back: IV Labetalol, Nicardipine, or Nitroprusside (with controlled BP reduction).

Front: Calculation for Mean Arterial Pressure (MAP)?

Back: $MAP = \frac{SBP + 2(DBP)}{3}$

Front: Medication that improves survival in African Americans with HFrEF?

Back: Hydralazine plus Isosorbide Dinitrate.

Front: Mechanism of Statins?

Back: Inhibition of HMG-CoA reductase, the rate-limiting step in cholesterol synthesis.

Front: Most common side effect of Statin therapy?

Back: Myalgia or transaminitis (liver enzyme elevation).

Front: Treatment for cocaine-induced chest pain?

Back: Benzodiazepines and Nitrates; avoid Beta-blockers (risk of unopposed alpha-agonism).

Front: Duke Criteria is used for the diagnosis of?

Back: Infective Endocarditis.

Front: Major Duke Criteria?

Back: Positive blood cultures (typical organism) and Evidence of endocardial involvement (Echo showing vegetation).

Front: Physical signs of Endocarditis?

Back: Roth spots (retina), Janeway lesions (painless palms/soles), Osler nodes (painful fingertips), and Splinter hemorrhages.

Front: First-line treatment for most patients with Pericarditis?

Back: NSAIDs and Colchicine.

Front: Aortic Dissection: Type A vs Type B management?

Back: Type A (ascending) requires surgery; Type B (descending) is typically managed with medical BP control.

Front: Classic CXR finding in Aortic Dissection?

Back: Widened mediastinum.

Front: What is the "Bainbridge Reflex"?

Back: Increase in heart rate due to an increase in central venous pressure (atrial stretch).

Front: Most common cause of sudden cardiac death in young athletes?

Back: Hypertrophic Cardiomyopathy (HOCM).

Front: Screening recommendation for Abdominal Aortic Aneurysm (AAA)?

Back: One-time ultrasound for men aged 65–75 who have ever smoked.

Front: Definitive treatment for sick sinus syndrome?

Back: Permanent Pacemaker.

Front: Primary mechanism of action of Lidocaine as an antiarrhythmic?

Back: Class IB Sodium channel blocker; shortens action potential duration.

Front: Drug of choice for symptomatic Bradycardia?

Back: Atropine.

Front: Most common cause of Myocarditis in the US?

Back: Viral infections (e.g., Coxsackievirus B, Parvovirus B19).

Front: Gold standard for diagnosing Coronary Artery Disease?

Back: Coronary Angiography.

Front: Treatment for Hyperkalemia-induced EKG changes?

Back: IV Calcium gluconate (to stabilize the cardiac membrane).

Front: Which valvular lesion is associated with Head Bobbing (De Musset sign)?

Back: Chronic Aortic Regurgitation.

Front: EKG finding of a "Brugada Pattern"?

Back: Pseudo-RBBB and persistent ST elevation in leads V1–V2.

Front: Management of a patient with WPW and Atrial Fibrillation?

Back: Procainamide or Cardioversion (Avoid AV nodal blockers).

Front: Major side effect of Amiodarone?

Back: Pulmonary fibrosis, thyroid dysfunction (hypo/hyper), and hepatotoxicity.

Front: Goal BP for most patients according to ACC/AHA guidelines?

Back: Less than 130/80 mmHg.

Section I: ACS — Advanced Pearls & Subtypes

Front: Most sensitive EKG finding for Posterior Wall MI?

Back: ST-segment depression in leads V1–V3 with prominent R waves.

Front: What is the "de Winter" T-wave pattern?

Back: Upsloping ST-depression with tall, symmetric T-waves in precordial leads; indicates proximal LAD occlusion.

Front: Clinical utility of the HEART score?

Back: Risk stratifies patients with undifferentiated chest pain in the ED to identify those safe for discharge.

Front: Which score predicts 6-month mortality in patients admitted with ACS?

Back: The GRACE score (Global Registry of Acute Cardiac Events).

Front: Goal time for Fibrinolytics if PCI is unavailable?

Back: Door-to-needle time <30 minutes.

Front: Indication for urgent CABG in ACS?

Back: Failed PCI, cardiogenic shock, or mechanical complications (e.g., VSD, papillary muscle rupture).

Front: Significance of elevated Troponin in End-Stage Renal Disease (ESRD) without ACS?

Back: Chronic microinjury to the myocardium; however, a rising/falling trend still suggests acute ischemia.

Front: Recommended duration of P2Y12 inhibitor therapy after DES placement in ACS?

Back: At least 12 months.

Section II: Heart Failure — Nuanced Management

Front: Standard management for HFrEF patient with persistent symptoms on Triple Therapy?

Back: Add an SGLT2 inhibitor (e.g., Dapagliflozin) or consider ARNI if on ACEi/ARB.

Front: Contraindication for starting ARNI immediately after ACE inhibitor?

Back: Requires a 36-hour washout period to prevent angioedema.

Front: Electrolyte abnormality associated with Spironolactone?

Back: Hyperkalemia and metabolic acidosis.

Front: When to initiate Hydralazine-Isosorbide Dinitrate in HFrEF?

Back: Symptomatic African American patients despite optimal GDMT or patients unable to tolerate ACEi/ARBs due to renal failure.

Front: Mechanism of Ivabradine?

Back: Selective $I_f$ current inhibitor in the SA node; reduces heart rate without affecting contractility.

Front: Indication for Ivabradine?

Back: HFrEF (LVEF ≤35%) in sinus rhythm with resting heart rate ≥70 bpm despite maximally tolerated Beta-blockers.

Front: Key hemodynamic difference between Systolic and Diastolic HF?

Back: Systolic HF involves reduced contractility; Diastolic HF involves impaired ventricular relaxation/compliance.

Section III: Arrhythmias — EKG & Management

Front: First-line treatment for a patient with AFib and Wolff-Parkinson-White?

Back: Procainamide (avoid Adenosine, Beta-blockers, CCBs, and Digoxin).

Front: Pathophysiology of Ashman’s Phenomenon?

Back: Aberrantly conducted QRS (usually RBBB) following a short R-R interval preceded by a long R-R interval, common in AFib.

Front: Definition of "Holiday Heart Syndrome"?

Back: Acute AFib triggered by excessive alcohol consumption in a healthy individual.

Front: Classic EKG finding in MAT (Multifocal Atrial Tachycardia)?

Back: HR >100 bpm with ≥3 different P-wave morphologies; often seen in COPD patients.

Front: Initial treatment for MAT?

Back: Oxygenation and treatment of underlying pulmonary disease; CCBs for rate control if needed.

Front: Most specific EKG sign of Digoxin toxicity?

Back: Atrial tachycardia with variable AV block.

Front: Characteristic EKG of Wellens’ Syndrome?

Back: Deeply inverted or biphasic T-waves in V2–V3; indicates critical proximal LAD stenosis.

Section IV: Valvular Disease — Advanced Pearls

Front: Most common cause of chronic Aortic Regurgitation in developed countries?

Back: Aortic root dilation (e.g., hypertension, Marfan syndrome, aortic dissection).

Front: Meaning of "Austin Flint" murmur?

Back: Mid-to-late diastolic rumble at the apex heard in severe Aortic Regurgitation (due to regurgitant jet impinging on the mitral valve).

Front: Management of symptomatic severe Mitral Stenosis with favorable morphology?

Back: Percutaneous Mitral Balloon Valvotomy.

Front: Preferred diagnostic tool to assess for Mitral Valve vegetations or thrombus?

Back: Transesophageal Echocardiography (TEE).

Front: Characteristic murmur of Tricuspid Stenosis?

Back: Diastolic rumble at the left lower sternal border that increases with inspiration (Carvallo’s sign).

Front: Key indication for valve replacement in asymptomatic Aortic Stenosis?

Back: LVEF <50% or patient undergoing other cardiac surgery.

Front: Murmur change during Handgrip in Mitral Regurgitation?

Back: Murmur intensity increases due to increased afterload.

Section V: Comprehensive Integration

Front: First-line treatment for Symptomatic Bradycardia?

Back: Atropine 1mg IV; if ineffective, provide transcutaneous pacing or Dopamine/Epinephrine infusion.

Front: Classic CXR sign of Coarctation of the Aorta?

Back: Rib notching (due to collateral intercostal arteries) and the "3" sign.

Front: Most common primary cardiac tumor in adults?

Back: Atrial Myxoma (usually in the left atrium).

Front: Most common primary cardiac tumor in children?

Back: Rhabdomyoma (highly associated with Tuberous Sclerosis).

Front: Treatment for Type B Aortic Dissection?

Back: IV Beta-blockers (e.g., Esmolol) to reduce heart rate and shear stress, followed by vasodilators if needed.

Front: ECG sign for Hypercalcemia?

Back: Shortened QT interval.

Front: ECG sign for Hypocalcemia?

Back: Prolonged QT interval.

Front: Definitive management for Pulseless Electrical Activity (PEA)?

Back: CPR and Epinephrine; look for reversible causes (Hs and Ts).


Front: Effect of Valsalva maneuver on the murmur of Aortic Stenosis?

Back: Decreases (due to decreased preload).

Front: Effect of Squatting on the murmur of HOCM?

Back: Decreases (increased preload and afterload increase LV volume, reducing outflow obstruction).

Front: Murmur that increases with Sustained Handgrip?

Back: Mitral Regurgitation, Aortic Regurgitation, and VSD (due to increased afterload).

Front: Murmur that decreases with Sustained Handgrip?

Back: HOCM and Aortic Stenosis.

Front: Definition of the "Gallavardin Phenomenon"?

Back: Dissociation between the noisy and musical components of the Aortic Stenosis murmur, often heard at the apex.

Front: Clinical significance of a prominent 'a' wave in JVP?

Back: Right atrial contraction against a closed or stiff valve (Tricuspid Stenosis, Pulmonary HTN, or Right Ventricular Hypertrophy).

Front: Clinical significance of "Cannon a-waves"?

Back: Atrial contraction against a closed tricuspid valve (AV dissociation: V-Tach or 3rd-degree Heart Block).

Front: Clinical significance of a prominent 'v' wave in JVP?

Back: Tricuspid Regurgitation (blood flows back into the atrium during ventricular systole).

Section VII: Acute Coronary Syndrome — Management Nuance

Front: Next best step for a patient with chest pain and new Left Bundle Branch Block (LBBB)?

Back: Treat as an emergent STEMI (Immediate reperfusion therapy).

Front: First-line treatment for Prinzmetal (Vasospastic) Angina?

Back: Calcium Channel Blockers and Nitrates.

Front: Avoided medication in Prinzmetal Angina?

Back: Non-selective Beta-blockers (may worsen vasospasm due to unopposed alpha-1 activity).

Front: TIMI Risk Score parameters?

Back: Age ≥65, ≥3 CAD risk factors, Known CAD (>50% stenosis), Aspirin use in last 7 days, Severe angina (2+ in 24h), ST deviation, Elevated biomarkers.

Front: Management of a NSTEMI patient with refractory ischemia or hemodynamic instability?

Back: Immediate Cardiac Catheterization (within 2 hours).

Front: Common EKG finding in Acute Pulmonary Embolism (PE)?

Back: Sinus tachycardia (most common) or S1Q3T3 pattern (specific but rare).

Front: Most common cause of death within the first few hours of a myocardial infarction?

Back: Ventricular Fibrillation.

Section VIII: Heart Failure & Cardiomyopathy Specials

Front: Most common cause of Cor Pulmonale?

Back: Chronic Obstructive Pulmonary Disease (COPD).

Front: First-line treatment for Acute Pulmonary Edema?

Back: "LMNOP" (Loop diuretics, Morphine, Nitrates, Oxygen, Position/BiPAP).

Front: Lab test used to differentiate heart failure from primary lung disease?

Back: BNP or NT-proBNP.

Front: Classic EKG finding in Dilated Cardiomyopathy?

Back: Non-specific ST-T wave changes and Left Bundle Branch Block.

Front: Most common cause of Restrictive Cardiomyopathy in the US?

Back: Amyloidosis.

Front: Definitive diagnosis of Myocarditis?

Back: Endomyocardial Biopsy (though Cardiac MRI is often used first).

Front: Classic EKG in Arrhythmogenic Right Ventricular Cardiomyopathy (ARVC)?

Back: Epsilon wave (small notch at the end of the QRS in V1–V3).

Section IX: Arrhythmias & Electrophysiology

Front: Preferred treatment for hemodynamically stable Ventricular Tachycardia?

Back: IV Amiodarone or Procainamide.

Front: Next step for Pulseless Ventricular Tachycardia or Ventricular Fibrillation?

Back: Immediate unsynchronized defibrillation.

Front: Treatment for symptomatic Sinus Bradycardia if Atropine fails?

Back: Transcutaneous pacing.

Front: EKG finding of Trifascicular Block?

Back: RBBB, Left axis deviation (LAFB), and 1st-degree AV block.

Front: Medication used for chemical stress testing in patients who cannot exercise?

Back: Adenosine, Regadenoson, or Dobutamine.

Front: What does "Capture Beats" and "Fusion Beats" on EKG signify?

Back: Diagnostic of Ventricular Tachycardia (helps distinguish from SVT with aberrancy).

Section X: Valvular & Structural Disease

Front: Management of a pregnant patient with symptomatic Mitral Stenosis?

Back: Percutaneous Mitral Balloon Valvotomy.

Front: Most common complication of Mitral Stenosis?

Back: Atrial Fibrillation (due to left atrial enlargement).

Front: Best indicator of the severity of Mitral Regurgitation?

Back: Presence of an S3 gallop.

Front: Classic presentation of Atrial Myxoma?

Back: Fever, weight loss, and a "tumor plop" sound on auscultation (often mimics Mitral Stenosis).

Front: Indication for surgery in chronic Aortic Regurgitation?

Back: Symptomatic, or asymptomatic with LV dysfunction (EF <50%) or severe LV dilation.

Section XI: Miscellaneous Clinical Knowledge

Front: Classic finding on fundoscopy in a patient with Hypertension?

Back: AV nicking, silver/copper wiring, and cotton wool spots.

Front: Definition of Hypertensive Urgency?

Back: BP >180/120 mmHg without evidence of acute end-organ damage.

Front: Definition of Hypertensive Emergency?

Back: BP >180/120 mmHg with acute end-organ damage (e.g., encephalopathy, MI, stroke, renal failure).

Front: First-line treatment for Hypertriglyceridemia (>500 mg/dL)?

Back: Fibrates (to prevent pancreatitis).

Front: Most common site of origin for an embolus causing a stroke in a patient with AFib?

Back: Left Atrial Appendage.

Front: Management of Cardiac Tamponade while waiting for pericardiocentesis?

Back: Aggressive IV fluid bolus to increase preload.

Front: Significance of an S4 gallop?

Back: Atrial contraction into a stiff, non-compliant ventricle (e.g., LVH, restrictive cardiomyopathy).

Front: Next step for a patient with a "tearing" chest pain radiating to the back?

Back: CT Angiography of the chest/abdomen or TEE (if unstable).

Front: Mechanism of action of Ezetimibe?

Back: Inhibits cholesterol absorption at the brush border of the small intestine.

Front: Most common side effect of Niacin and how to prevent it?

Back: Prostaglandin-mediated flushing; prevented by pre-treatment with Aspirin.

Front: Class of antiarrhythmics that exhibit "Use-Dependence"?

Back: Class IC (e.g., Flecainide); their effect is stronger at higher heart rates.

Front: Major electrolyte side effect of Thiazide diuretics?

Back: Hypokalemia, Hyponatremia, and Hypercalcemia.

Front: Major electrolyte side effect of Loop diuretics?

Back: Hypokalemia, Hyponatremia, and Hypocalcemia.

Front: Antihypertensive class known to cause peripheral edema?

Back: Dihydropyridine Calcium Channel Blockers (e.g., Amlodipine).

Front: Drug-induced Lupus is most commonly associated with which cardiac medication?

Back: Hydralazine or Procainamide.

Front: Which anti-lipid medication can lead to gallstones?

Back: Fibrates (by increasing cholesterol excretion into bile).

Section XIII: Post-MI Complications & Timeframes
Front: Timing of Ventricular Free Wall Rupture post-MI?

Back: 5 days to 2 weeks.

Front: Clinical presentation of Ventricular Free Wall Rupture?

Back: Sudden onset of Cardiac Tamponade and PEA.

Front: Post-MI complication presenting with "Step-up" in oxygen saturation from RA to RV?

Back: Ventricular Septal Rupture.

Front: EKG finding of a Ventricular Aneurysm?

Back: Persistent ST-segment elevation several weeks after the MI.

Front: Most common cause of death in the "Late" phase (weeks) post-MI?

Back: Heart Failure or Ventricular Arrhythmias.

Section XIV: Advanced Arrhythmia & Syncope
Front: Definition of "Sick Sinus Syndrome"?

Back: Tachycardia-Bradycardia Syndrome due to SA node dysfunction.

Front: Standard of care for a patient with Brugada Syndrome and prior syncope?

Back: Implantable Cardioverter Defibrillator (ICD).

Front: First-line treatment for Vasovagal Syncope?

Back: Reassurance, avoidance of triggers, and physical counter-pressure maneuvers.

Front: Distinguishing feature of Orthostatic Hypotension on vitals?

Back: Drop in SBP >20 mmHg or DBP >10 mmHg upon standing.

Front: Management of symptomatic Carotid Sinus Hypersensitivity?

Back: Permanent pacemaker.

Section XV: Valvular Pathology — Rare & Specific Signs
Front: What is "Quincke’s Pulse"?

Back: Capillary pulsations in the fingertips/nailbeds seen in Aortic Regurgitation.

Front: What is "Duroziez’s Sign"?

Back: A systolic and diastolic bruit heard over the femoral artery when compressed by a stethoscope.

Front: Graham-Steell murmur description?

Back: Early diastolic murmur at the left sternal border due to Pulmonary Regurgitation in the setting of Pulmonary HTN.

Front: Primary valvular lesion associated with IV drug use?

Back: Tricuspid Regurgitation (Infective Endocarditis).

Front: Which valvular lesion presents with a "large V-wave" in the PCWP trace?

Back: Mitral Regurgitation.

Section XVI: Preventive Cardiology & Risk Scores
Front: Goal LDL for a patient with known CAD or high-risk diabetes?

Back: <70 mg/dL (or <55 mg/dL in very high-risk patients per newest guidelines).

Front: Components of the ASCVD Risk Calculator?

Back: Age, Sex, Race, BP, Cholesterol levels, Diabetes, and Smoking status.

Front: Indication for high-intensity statin regardless of LDL level?

Back: Clinical ASCVD or Diabetes with a 10-year risk >20%.

Front: First-line antihypertensive in a patient with Diabetes and Proteinuria?

Back: ACE inhibitor or ARB (for renal protection).

Section XVII: Clinical Pearls & "Red Flags"
Front: Significance of a "Pulsus Bisferiens"?

Back: Two systolic peaks; seen in Aortic Regurgitation or HOCM.

Front: Classic cause of "Water-Bottle" Heart on CXR?

Back: Large Pericardial Effusion.

Front: Management of a patient with suspected Aortic Dissection and Hypotension?

Back: Immediate TEE and surgical consult (suggests rupture into pericardium/tamponade).

Front: Classic EKG finding in Hypothermia?

Back: J-waves (Osborn waves) — an upward deflection at the R-ST junction.

Front: Key finding on Echo for Cardiac Amyloidosis?

Back: Increased wall thickness with "speckled" or "granular" myocardium.

Front: Treatment for a patient with persistent stable Angina despite Beta-blocker and Nitrate therapy?

Back: Add Ranolazine.

Front: Most common location of a Coarctation of the Aorta?

Back: Just distal to the origin of the left subclavian artery.

Front: Significance of a "Fixed Splitting of S2"?

Back: Atrial Septal Defect (ASD).

Front: First-line treatment for a hemodynamically stable patient with WPW and AFib?

Back: IV Procainamide.

Front: Most common cause of death in patients with Marfan Syndrome?

Back: Aortic Root Dissection.

Front: Mechanism of nitrates in relieving angina?

Back: Systemic venodilation resulting in decreased preload and reduced myocardial wall tension.

Front: Most common congenital heart defect found in adults?

Back: Bicuspid Aortic Valve.

Front: Physical exam finding for a small Ventricular Septal Defect (VSD)?

Back: Loud, harsh holosystolic murmur at the left lower sternal border; often palpated as a thrill.

Front: Murmur of a Patent Ductus Arteriosus (PDA)?

Back: Continuous "machine-like" murmur heard best at the left infraclavicular area.

Front: Management of a large PDA in an adult?

Back: Percutaneous or surgical closure to prevent pulmonary hypertension and endocarditis.

Front: Definition of Eisenmenger Syndrome?

Back: Reversal of a left-to-right shunt to right-to-left due to severe, irreversible pulmonary hypertension.

Front: Clinical signs of Eisenmenger Syndrome?

Back: Cyanosis, clubbing, and polycythemia.

Front: Why is the murmur of VSD or PDA "missing" in Eisenmenger Syndrome?

Back: The pressures in the systemic and pulmonary circulations have equalized, eliminating the pressure gradient.

Section XIX: Advanced Hemodynamics (Cath Lab & ICU)

Front: Normal Pulmonary Artery Wedge Pressure (PAWP)?

Back: 6–12 mmHg.

Front: Hemodynamic profile of Cardiogenic Shock?

Back: Low Cardiac Output, High PAWP (Preload), and High SVR (Afterload).

Front: Hemodynamic profile of Hypovolemic Shock?

Back: Low Cardiac Output, Low PAWP, and High SVR.

Front: Hemodynamic profile of Septic (Distributive) Shock?

Back: High Cardiac Output, Low PAWP, and Low SVR.

Front: Pulmonary capillary wedge pressure in non-cardiogenic pulmonary edema (ARDS)?

Back: Normal (typically <18 mmHg).

Section XX: Heart Disease in Pregnancy & Special Populations

Front: Most common cardiac complication during pregnancy in women with Mitral Stenosis?

Back: Acute pulmonary edema or Atrial Fibrillation due to increased plasma volume.

Front: Definition of Peripartum Cardiomyopathy?

Back: Dilated cardiomyopathy/HF occurring in the last month of pregnancy or within 5 months postpartum.

Front: Management of Peripartum Cardiomyopathy with LVEF <25%?

Back: Anticoagulation (high risk of thrombus) and standard HF therapy (avoiding ACEi/ARBs if still pregnant).

Front: Preferred anticoagulation for a pregnant patient with a mechanical heart valve?

Back: Low Molecular Weight Heparin (LMWH) in the first trimester; Warfarin may be used in the 2nd/3rd trimester.

Front: First-line antihypertensive for a pregnant patient?

Back: Labetalol, Nifedipine, or Methyldopa.

Section XXI: High-Yield Ethics & Decisions

Front: Next step for an asymptomatic 45-year-old with a Grade 1/6 mid-systolic murmur?

Back: Reassurance; no further workup needed for soft, short systolic murmurs in asymptomatic patients.

Front: Next step for any diastolic or continuous murmur found on exam?

Back: Echocardiogram (these are always pathologic until proven otherwise).

Front: When is S4 considered "normal"?

Back: In healthy older adults due to age-related decrease in ventricular compliance.

Front: Best initial test for suspected stable CAD in a patient with a baseline LBBB on EKG?

Back: Stress Echocardiogram or Nuclear Stress Test (exercise EKG is non-diagnostic with LBBB).

Front: Major advantage of a bioprosthetic (bovine/porcine) valve over a mechanical valve?

Back: No requirement for long-term anticoagulation.

Front: Major disadvantage of a bioprosthetic valve?

Back: Limited durability (typically lasts 10–15 years); prone to calcification.

Front: Preferred valve type for a 30-year-old patient?

Back: Mechanical valve (due to longevity), provided they can tolerate lifelong  Warfarin.
"""

# Let's clean the data and parse it into structured JSON topics
# We want to parse it as a list of topics under the section 'Internal Medicine'
# The topics will be gathered under individual objects:
# {
#   section: 'Internal Medicine',
#   topic: topic_name,
#   icon: 'heart',
#   cards: [ { q: front, a: back }, ... ]
# }

def clean_text(text):
    # Escape double quotes properly and trim
    return text.strip().replace('"', '\\"')

topics = []
current_topic = None
current_section = "Internal Medicine"

lines = [line.strip() for line in raw_data.split('\n')]
idx = 0
while idx < len(lines):
    line = lines[idx]
    if not line:
        idx += 1
        continue
    
    # Check for new Section/Topic declarations
    # Match Section XX: Topic Name or Topic: Topic Name or Section: Internal Medicine
    # Wait, the user has:
    # "Section: Internal Medicine" at the start
    # "Topic: Cardiology — ACS, heart failure, arrhythmias, valvular disease"
    # And then "Section II: Heart Failure (HF)", "Section III: Arrhythmias", "Section I: ACS — Advanced Pearls & Subtypes"
    # In all these cases, they represent a topic under "Internal Medicine".
    # Let's map any line starting with "Section" or "Topic" to a topic name, EXCEPT "Section: Internal Medicine" which sets the section category.
    
    if line.startswith("Section: Internal Medicine"):
        current_section = "Internal Medicine"
        idx += 1
        continue
    
    is_header = False
    topic_title = None
    
    if line.startswith("Topic:"):
        topic_title = line[len("Topic:"):].strip()
        is_header = True
    elif re.match(r"^Section\s+[IVXLCDM]+\s*:", line, re.IGNORECASE):
        topic_title = re.sub(r"^Section\s+[IVXLCDM]+\s*:\s*", "", line, flags=re.IGNORECASE).strip()
        is_header = True
    
    if is_header and topic_title:
        current_topic = {
            "section": current_section,
            "topic": topic_title,
            "icon": "heart",
            "cards": []
        }
        topics.append(current_topic)
        idx += 1
        continue
        
    # Check for Front / Back cards
    if line.startswith("Front:"):
        front_text = line[len("Front:"):].strip()
        # Find corresponding Back line
        back_text = ""
        idx += 1
        while idx < len(lines):
            sub_line = lines[idx]
            if sub_line.startswith("Back:"):
                back_text = sub_line[len("Back:"):].strip()
                break
            elif sub_line:
                front_text += " " + sub_line
            idx += 1
        
        if current_topic is not None:
            current_topic["cards"].append({
                "q": front_text,
                "a": back_text
            })
    
    idx += 1

print(f"Parsed {len(topics)} topics successfully.")

# Let's serialize the topics into correct JavaScript format
# We'll use double backslashes in LaTeX so it outputs correctly in JS (e.g. \\frac instead of \frac)
# We will enclose the strings in double quotes, and escape inner double quotes.
js_lines = []
js_lines.append("      'year3': [")

for t_idx, topic in enumerate(topics):
    js_lines.append("        {")
    js_lines.append(f"          section: '{topic['section']}',")
    # Let's escape quotes in the topic title
    topic_escaped = topic['topic'].replace('"', '\\"')
    js_lines.append(f"          topic: \"{topic_escaped}\",")
    js_lines.append(f"          icon: '{topic['icon']}',")
    js_lines.append("          cards: [")
    
    for c_idx, card in enumerate(topic['cards']):
        q_escaped = card['q'].replace('"', '\\"')
        a_escaped = card['a'].replace('"', '\\"')
        # Replace mathematical backslashes with double backslashes for LaTeX
        # E.g. \frac should be \\frac. In the user text, they provided \frac.
        # Let's ensure \frac is written as \\frac in the JS file.
        # If we have \frac, let's write it as \\frac.
        # In Python strings, backslashes might be single or double depending on escaping.
        # Let's replace any single backslash in LaTeX with two backslashes.
        # We can look for common LaTeX terms like \frac or other commands:
        a_escaped = a_escaped.replace('\\frac', '\\\\frac')
        a_escaped = a_escaped.replace('$MAP = \\frac', '$MAP = \\\\frac')
        
        comma = "," if c_idx < len(topic['cards']) - 1 else ""
        js_lines.append(f"            {{ q: \"{q_escaped}\", a: \"{a_escaped}\" }}{comma}")
        
    comma = "," if t_idx < len(topics) - 1 else ""
    js_lines.append("          ]")
    js_lines.append(f"        }}{comma}")

js_lines.append("      ],")

# Let's write the generated JS to scratch/year3_parsed.js
parsed_js_content = "\n".join(js_lines)
with open(r'c:\Users\Hasan-PC\Desktop\MedHelp\scratch\year3_parsed.js', 'w', encoding='utf-8') as f:
    f.write(parsed_js_content)

print("Successfully parsed and wrote year3_parsed.js")
