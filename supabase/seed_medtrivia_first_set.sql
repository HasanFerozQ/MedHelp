-- Run in Supabase SQL Editor (postgres). Inserts today's set (America/New_York) + 10 questions.
-- Safe to re-run: upsert replaces questions for that date unless set is already live.

SELECT public.upsert_trivia_set_with_questions(
  (now() AT TIME ZONE 'America/New_York')::date,
  'MedTrivia Daily #1',
  $json$
[
  {
    "question_order": 1,
    "prompt": "A 24-year-old female presents to urgent care with dysuria and urinary frequency for 3 days. No fever, chills, or flank pain. Recently sexually active with a new partner. Urine culture grows Gram-negative rods that are catalase-positive and show swarming motility on agar. Dipstick is positive for nitrites and leukocyte esterase. Urine pH is 8.2. Which medication matches inhibition of bacterial DNA gyrase and topoisomerase IV?",
    "options": ["Amoxicillin", "Ciprofloxacin", "Trimethoprim-sulfamethoxazole", "Nitrofurantoin"],
    "correct_index": 1,
    "rationale": "Findings suggest Proteus mirabilis (swarming motility, alkaline urine from urease). Fluoroquinolones inhibit DNA gyrase/topoisomerase IV; ciprofloxacin is the matching option."
  },
  {
    "question_order": 2,
    "prompt": "A 67-year-old male has 2 hours of crushing substernal chest pain radiating to the left arm, with dyspnea and diaphoresis. ECG shows ST elevations in II, III, aVF. Vitals: HR 58, BP 90/60. Exam: JVD with clear lungs and bradycardia. Which coronary artery is most likely occluded?",
    "options": ["Left anterior descending (LAD) coronary artery", "Left circumflex (LCx) coronary artery", "Right coronary artery (RCA)", "Left main coronary artery"],
    "correct_index": 2,
    "rationale": "Inferior STEMI (II, III, aVF) points to RCA in most right-dominant patients. Hypotension + bradycardia + JVD with clear lungs suggests right ventricular involvement, often proximal RCA."
  },
  {
    "question_order": 3,
    "prompt": "A 72-year-old woman has progressive left-hand resting tremor for 6 months, disappearing with intentional movement. Exam: pill-rolling tremor, stooped posture, shuffling gait with reduced arm swing, and cogwheel rigidity. What is the underlying pathology?",
    "options": ["Atrophy of the caudate nucleus", "Loss of dopaminergic neurons in the substantia nigra pars compacta", "Demyelination of corticospinal tracts", "Degeneration of upper and lower motor neurons"],
    "correct_index": 1,
    "rationale": "Classic Parkinson disease features (rest tremor, bradykinesia/shuffling gait, cogwheel rigidity) are due to degeneration of dopaminergic neurons in the substantia nigra pars compacta."
  },
  {
    "question_order": 4,
    "prompt": "An 8-year-old boy has severe right ear pain and mild fever after a weekend of swimming. Pain worsens with pinna movement and tragus pressure. Otoscopy shows erythematous, edematous external auditory canal with purulent discharge; tympanic membrane intact. Most likely organism?",
    "options": ["Streptococcus pneumoniae", "Pseudomonas aeruginosa", "Moraxella catarrhalis", "Aspergillus niger"],
    "correct_index": 1,
    "rationale": "Acute otitis externa (swimmer's ear) presents with tragal/pinna tenderness and swollen external canal after water exposure. Pseudomonas aeruginosa is the most common cause."
  },
  {
    "question_order": 5,
    "prompt": "A 68-year-old man has sudden painless right-eye vision loss ('curtain falling') for 45 minutes. History: atrial fibrillation and severe carotid stenosis. Fundoscopy: pale retina with cherry-red spot at macula. Diagnosis?",
    "options": ["Central retinal vein occlusion (CRVO)", "Acute angle-closure glaucoma", "Central retinal artery occlusion (CRAO)", "Rhegmatogenous retinal detachment"],
    "correct_index": 2,
    "rationale": "Sudden painless monocular vision loss with cherry-red spot on pale retina is classic for CRAO, often embolic from carotid disease or atrial fibrillation."
  },
  {
    "question_order": 6,
    "prompt": "A 28-year-old at 34 weeks gestation has severe headache, visual spots, facial/hand swelling. BP 164/112 confirmed. Urine protein/creatinine ratio 0.45. Platelets and creatinine are normal. Most accurate diagnosis?",
    "options": ["Gestational hypertension", "Preeclampsia with severe features", "Chronic hypertension", "Eclampsia"],
    "correct_index": 1,
    "rationale": "New-onset hypertension after 20 weeks plus proteinuria indicates preeclampsia; severe-range BP and neurologic symptoms (headache/visual disturbance) indicate severe features."
  },
  {
    "question_order": 7,
    "prompt": "A 23-year-old man has 7 months of social withdrawal, functional decline, hallucinations, bizarre persecutory/somatic delusions, and disorganized speech. Affect is flat. Most likely diagnosis?",
    "options": ["Schizophreniform disorder", "Schizoaffective disorder", "Brief psychotic disorder", "Schizophrenia"],
    "correct_index": 3,
    "rationale": "Duration over 6 months with positive and negative psychotic symptoms and marked dysfunction fits schizophrenia."
  },
  {
    "question_order": 8,
    "prompt": "A 45-year-old overweight woman develops severe RUQ pain radiating to right scapula after a fatty meal, with fever, nausea/vomiting, leukocytosis, and positive Murphy sign. Bilirubin and ALP are normal. Most likely diagnosis?",
    "options": ["Acute cholangitis", "Acute cholecystitis", "Choledocholithiasis", "Acute pancreatitis"],
    "correct_index": 1,
    "rationale": "Postprandial RUQ pain, fever, leukocytosis, and Murphy sign indicate acute cholecystitis (usually cystic duct obstruction). Normal bilirubin/ALP argues against common bile duct obstruction."
  },
  {
    "question_order": 9,
    "prompt": "An 8-year-old boy has cola-colored urine, periorbital edema, and hypertension 2 weeks after sore throat. UA: RBC casts, dysmorphic RBCs, 3+ protein. Labs: low C3, elevated ASO titer. Diagnosis?",
    "options": ["Minimal change disease", "Post-streptococcal glomerulonephritis (PSGN)", "IgA nephropathy", "Goodpasture syndrome"],
    "correct_index": 1,
    "rationale": "Nephritic syndrome after recent streptococcal pharyngitis with low complement and elevated ASO is classic PSGN."
  },
  {
    "question_order": 10,
    "prompt": "A 58-year-old man with severe COPD exacerbation has ABG: pH 7.28, PaCO2 62 mmHg, PaO2 51 mmHg, HCO3- 28 mEq/L. What acid-base disorder is present?",
    "options": ["Uncompensated respiratory alkalosis", "Partially compensated metabolic acidosis", "Partially compensated respiratory acidosis", "Fully compensated respiratory acidosis"],
    "correct_index": 2,
    "rationale": "Acidemia with elevated PaCO2 indicates primary respiratory acidosis. Mildly elevated bicarbonate shows renal compensation has started but not normalized pH, so partial compensation."
  }
]
$json$::jsonb,
  true
) AS set_id;
