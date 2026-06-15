const fs = require('fs');
const path = require('path');

const htmlPath = 'c:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html';
const backupPath = 'c:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html.bak';
const htmlContent = fs.readFileSync(htmlPath, 'utf8');

// 1. Define the 150 flashcards (30 per topic)
const newTopics = [
  {
    section: 'Clinical Case Integration (Step 2 CK)',
    topic: 'Multi-system clinical vignettes',
    icon: 'activity',
    cards: [
      {
        q: "A 28-year-old African American female presents with painful red nodules on her shins, blurry vision, and painful joints. Chest X-ray reveals bilateral hilar lymphadenopathy. What is the most likely diagnosis and what biopsy finding confirms it?",
        a: "<b>Sarcoidosis</b> (Löfgren syndrome triad: erythema nodosum, bilateral hilar lymphadenopathy, migratory polyarthralgia). Biopsy reveals <b>non-caseating granulomas</b> containing multinucleated giant cells with Schaumann and asteroid bodies."
      },
      {
        q: "A 32-year-old female with a history of joint pain and a malar rash presents with generalized edema. Urinalysis shows 3+ proteinuria and red blood cell casts. Which autoantibodies are most specific, and what is the next best step in management?",
        a: "<b>Anti-Smith</b> and <b>anti-dsDNA</b> are highly specific for SLE. The next best step is a <b>renal biopsy</b> to determine the class of lupus nephritis and guide immunosuppressive therapy."
      },
      {
        q: "A 65-year-old male presents with fatigue, macroglossia, peripheral neuropathy, and nephrotic-range proteinuria. Echocardiography shows a restrictive cardiomyopathy with a \"speckled\" appearance. What diagnostic stain and birefringence finding confirms the diagnosis?",
        a: "<b>Congo Red stain</b> of abdominal fat pad or rectal biopsy, showing <b>apple-green birefringence</b> under polarized light, confirming amyloid deposition."
      },
      {
        q: "A 52-year-old male presents with hyperpigmented skin, new-onset diabetes mellitus, hepatomegaly, and severe pain in his 2nd and 3rd metacarpophalangeal (MCP) joints. What is the most common gene mutation, and what is the preferred initial treatment?",
        a: "<b>HFE gene mutation</b> (typically C282Y homozygous on Chromosome 6). The preferred treatment is therapeutic <b>phlebotomy</b> to maintain ferritin levels < 50 mcg/L."
      },
      {
        q: "A 40-year-old IV drug user presents with fever, a new cardiac murmur, painless erythematous macules on his palms, and painful nodules on his pads of fingers. Urinalysis shows hematuria. What is the most likely diagnosis and what are these cutaneous findings called?",
        a: "<b>Infective Endocarditis</b> with systemic embolization. Painless palmar macules: <b>Janeway lesions</b> (microabscesses). Painful digital nodules: <b>Osler's nodes</b> (immune complex deposition). Splinter hemorrhages under nails and Roth spots on retina may also be present."
      },
      {
        q: "A 45-year-old male presents with chronic sinusitis, nasal mucosal ulcerations, hemoptysis, and acute renal failure. Urinalysis shows RBC casts. What serum marker is diagnostic, and what does biopsy show?",
        a: "<b>c-ANCA (PR3-ANCA)</b>. Biopsy of lung or kidney shows <b>necrotizing granulomatous vasculitis</b> (kidney shows pauci-immune crescentic glomerulonephritis)."
      },
      {
        q: "A 50-year-old female presents with purpuric skin lesions, hemoptysis, and acute renal failure, without any history of upper respiratory or sinus involvement. What serum marker is associated, and how does it differ histologically from GPA?",
        a: "<b>p-ANCA (MPO-ANCA)</b>. Histology shows necrotizing vasculitis <b>without granulomas</b> (unlike GPA, which features prominent granulomatous inflammation)."
      },
      {
        q: "A 38-year-old male with a history of severe asthma and allergic rhinitis presents with foot drop (mononeuritis multiplex) and palpable purpura. Labs show marked peripheral eosinophilia. What is the diagnosis and most common ANCA association?",
        a: "<b>Eosinophilic Granulomatosis with Polyangiitis (EGPA / Churg-Strauss)</b>. Associated with <b>p-ANCA (MPO-ANCA)</b> in ~40-50% of cases."
      },
      {
        q: "A 29-year-old female presents with chronic diarrhea, weight loss, iron deficiency anemia refractory to oral iron, and a pruritic vesicular rash on her elbows and knees. What is the rash, and what antibodies should be checked?",
        a: "The rash is <b>dermatitis herpetiformis</b> (caused by IgA deposition in dermal papillae). Screen with <b>anti-tissue transglutaminase (tTG) IgA</b> and <b>total serum IgA</b> (due to association with selective IgA deficiency)."
      },
      {
        q: "A 24-year-old male of Mediterranean descent presents with recurrent painful oral aphthous ulcers, painful scrotal ulcers, anterior uveitis, and painful red skin nodules. Puncture of his skin with a sterile needle results in a pustule 24 hours later. What is this clinical phenomenon and diagnosis?",
        a: "<b>Behçet syndrome</b>. The phenomenon is a <b>positive pathergy test</b>, demonstrating exaggerated skin inflammatory response."
      },
      {
        q: "A 44-year-old female presents with tightening of the skin on her fingers, face, and chest, along with dysphagia, exertional dyspnea, and severe hypertension with acute renal failure. What are the specific antibody associations and the diagnosis?",
        a: "<b>Diffuse cutaneous systemic sclerosis</b> with <b>scleroderma renal crisis</b> and interstitial lung disease. Associated with <b>anti-Scl-70 (anti-topoisomerase I)</b> and <b>anti-RNA polymerase III</b> antibodies. (Limited systemic sclerosis / CREST is associated with <b>anti-centromere</b>)."
      },
      {
        q: "An 8-year-old boy presents with developmental delay, seizures, hypopigmented macules (ash-leaf spots), facial angiofibromas, and multiple subependymal nodules on brain MRI. What renal tumor is associated with this condition?",
        a: "<b>Renal angiomyolipoma</b> (benign tumor of fat, muscle, and blood vessels; carries risk of life-threatening retroperitoneal hemorrhage if > 4 cm)."
      },
      {
        q: "A 14-year-old girl presents with >6 café-au-lait spots, axillary freckling (Crowe sign), iris hamartomas (Lisch nodules), and scoliosis. What vascular tumor of the adrenal gland is associated with this autosomal dominant condition?",
        a: "<b>Pheochromocytoma</b> (NF1 is associated with an increased risk of pheochromocytoma, GISTs, and optic pathway gliomas)."
      },
      {
        q: "A 35-year-old female with Graves' disease is admitted for emergency appendectomy. In the recovery room, she develops a fever of 104°F (40°C), tachycardia of 150 bpm, severe agitation, and jaundice. What is the diagnosis and the immediate medical regimen?",
        a: "<b>Thyroid Storm</b> (triggered by surgery). Immediate regimen: <b>propranolol</b> (beta-blocker), <b>propylthiouracil (PTU)</b> (blocks synthesis & peripheral conversion), <b>potassium iodide</b> (blocks release), and <b>hydrocortisone</b> (reduces conversion and treats relative adrenal insufficiency)."
      },
      {
        q: "A 55-year-old male farmer presents with chronic diarrhea, weight loss, migratory arthralgias, skin hyperpigmentation, and memory impairment. Small bowel biopsy reveals PAS-positive macrophages containing rod-shaped bacilli. What is the causative organism and preferred treatment?",
        a: "<i>Tropheryma whipplei</i>. Treatment is IV <b>ceftriaxone</b> for 2 weeks, followed by oral <b>trimethoprim-sulfamethoxazole (TMP-SMX)</b> for 1 year."
      },
      {
        q: "A 48-year-old male presents with fever, weight loss, severe abdominal pain after eating, testicular pain, and livedo reticularis. Labs show elevated creatinine and active Hepatitis B infection. What is the diagnosis and what does angiography show?",
        a: "<b>Polyarteritis Nodosa (PAN)</b>. Angiography reveals <b>segmental microaneurysms and occlusions</b> in medium-sized visceral arteries (renal, mesenteric)."
      },
      {
        q: "A 28-year-old female with a history of three consecutive 1st-trimester miscarriages presents with acute right leg swelling. Labs show a prolonged activated partial thromboplastin time (aPTT) that does not correct with a 1:1 mixing study. What is the diagnosis and what is the mechanism of the lab anomaly?",
        a: "<b>Antiphospholipid Syndrome (APS)</b>. The prolonged aPTT is caused by <b>lupus anticoagulant</b> binding to phospholipids in the test reagent, interfering with the coagulation assay <i>in vitro</i> (despite being highly prothrombotic <i>in vivo</i>)."
      },
      {
        q: "A 45-year-old female presents with severe dry eyes, dry mouth, rampant dental caries, and bilateral parotid gland enlargement. What antibodies are associated, and what lymphoma risk is increased?",
        a: "<b>Anti-Ro/SSA</b> and <b>anti-La/SSB</b>. There is a 5% lifetime risk (a 40-fold increase) of developing <b>non-Hodgkin lymphoma</b> (specifically B-cell MALT lymphoma)."
      },
      {
        q: "A 72-year-old male presents with lower back pain, fatigue, and constipation. Labs show serum calcium of 11.5 mg/dL, creatinine of 2.1 mg/dL, and Hb of 9.2 g/dL. X-rays reveal lytic lesions in the lumbar spine. What is the diagnosis and what diagnostic test is required?",
        a: "<b>Multiple Myeloma</b> (CRAB: Hypercalcemia, Renal insufficiency, Anemia, Bone lesions). Requires <b>bone marrow biopsy</b> showing > 10% clonal plasma cells."
      },
      {
        q: "A 52-year-old female presents with proximal muscle weakness (difficulty climbing stairs) and a violaceous rash on her upper eyelids, erythematous papules on her knuckles, and a rash across her upper back. What are these cutaneous findings, and what screening is critical?",
        a: "Heliotrope rash (eyelids), Gottron's papules (knuckles), and Shawl sign (upper back), diagnostic of <b>Dermatomyositis</b>. <b>Age-appropriate cancer screening</b> is critical due to a strong association with internal malignancies (ovarian, lung, GI)."
      },
      {
        q: "A 34-year-old female presents with Raynaud's phenomenon, swollen hands, proximal muscle weakness, and joint pain. Labs show high antinuclear antibody (ANA) titers and highly elevated antibodies to U1 ribonucleoprotein. What is the diagnosis?",
        a: "<b>Mixed Connective Tissue Disease (MCTD)</b>, defined by overlapping features of SLE, systemic sclerosis, and polymyositis with specific <b>anti-U1-RNP</b> antibodies."
      },
      {
        q: "A 19-year-old male presents with abnormal liver function tests, dysarthria, resting tremor, parkinsonian gait, and new-onset depression and psychosis. Slit-lamp exam reveals Kayser-Fleischer rings. What is the primary biochemical defect, and how is it diagnosed?",
        a: "<b>ATP7B gene mutation</b> causing impaired copper transport and biliary excretion. Diagnosed by <b>low serum ceruloplasmin</b>, elevated 24-hour urinary copper, and increased hepatic copper on biopsy."
      },
      {
        q: "A 50-year-old male presents with painless jaundice and a mass in the head of the pancreas mimicking pancreatic cancer. Biopsy reveals dense lymphoplasmacytic infiltrate with storiform fibrosis and obliterative phlebitis. Serum IgG4 is elevated. What is the diagnosis and initial treatment?",
        a: "<b>IgG4-related disease</b> (autoimmune pancreatitis). The initial treatment is highly responsive to <b>corticosteroids</b> (prednisone)."
      },
      {
        q: "A 54-year-old male with chronic Hepatitis C presents with palpable purpura on his lower extremities, joint pain, peripheral neuropathy, and hematuria. Serum complement levels reveal low C4. What is the diagnosis and what is the underlying pathophysiology?",
        a: "<b>Mixed Cryoglobulinemia</b>. Pathophysiology involves immune complexes of immunoglobulins (mostly IgM rheumatoid factor bound to IgG and HCV antigen) depositing in small vessels, causing <b>leukocytoclastic vasculitis</b>."
      },
      {
        q: "A 62-year-old male presents with sudden, tearing chest pain radiating to his back. On exam, he is hypertensive with asymmetric radial pulses. He suddenly develops left-sided weakness and a rise in serum creatinine. What is the mechanism of the neurological and renal signs?",
        a: "The dissecting aortic flap has <b>extended into the right brachiocephalic/common carotid artery</b> (causing cerebral ischemia/stroke) and the <b>renal arteries</b> (causing acute kidney injury)."
      },
      {
        q: "A 70-year-old male presents with worsening bone pain, increased hat size, and progressive bilateral hearing loss. Cardiovascular exam reveals a hyperdynamic state and bilateral pulmonary rales. What is the mechanism of the hearing loss and cardiac symptoms?",
        a: "<b>Paget's disease of bone</b>. Hearing loss is due to <b>cranial nerve VIII entrapment</b> in the stenosed internal auditory canal. High-output heart failure is caused by <b>arteriovenous shunts</b> formed in the highly vascular pagetic bone."
      },
      {
        q: "A 42-year-old male presents with progressive enlargement of his hands, widening dental spaces, severe sweating, and worsening sleep apnea. He is found to have a cardiomyopathy and a blood glucose of 210 mg/dL. What is the initial screening test and the definitive diagnostic test?",
        a: "Screen by measuring <b>serum IGF-1 level</b> (elevated). Confirm with an <b>oral glucose tolerance test (OGTT)</b>, demonstrating failure of GH suppression (< 1 ng/mL) after a 75g glucose load."
      },
      {
        q: "A 6-year-old girl is brought to the ED with fatigue, pallor, petechiae, and oliguria. She had an episode of bloody diarrhea 5 days ago. Labs show Hb of 7.5 g/dL, platelets of 45,000/mcL, and creatinine of 2.8 mg/dL. Smear shows schistocytes. What is the diagnosis and management?",
        a: "<b>Hemolytic Uremic Syndrome (HUS)</b>. Management is <b>supportive</b> (fluid/electrolyte monitoring, transfusion if needed). <b>Avoid antibiotics and antidiarrheals</b>, as they increase Shiga toxin release and worsen renal outcomes."
      },
      {
        q: "A 30-year-old female presents with recurrent nosebleeds and red macules on her lips and fingers. She also has chronic dyspnea and clubbing. Chest CT shows a pulmonary arteriovenous malformation (AVM). What is this autosomal dominant syndrome and what major cardiac complication can it cause?",
        a: "<b>Hereditary Hemorrhagic Telangiectasia (HHT / Osler-Weber-Rendu)</b>. The pulmonary AVMs cause right-to-left shunting (leading to hypoxemia/cyanosis) and can result in <b>high-output heart failure</b> due to decreased systemic vascular resistance."
      },
      {
        q: "A 35-year-old male presents with episodic throbbing headaches, palpitations, sweating, and severe hypertension. Family history is significant for medullary thyroid cancer. What genetic syndrome is suspected, and what screening test should be performed?",
        a: "<b>Multiple Endocrine Neoplasia Type 2 (MEN 2A or 2B)</b>. Screen for pheochromocytoma by measuring <b>plasma free metanephrines</b> or <b>24-hour urinary metanephrines</b>."
      }
    ]
  },
  {
    section: 'Clinical Case Integration (Step 2 CK)',
    topic: 'Diagnostic reasoning & management algorithms',
    icon: 'git-branch',
    cards: [
      {
        q: "A 42-year-old female presents with severe epigastric pain radiating to her back, accompanied by nausea. What is the diagnostic criteria for acute pancreatitis, and what is the cornerstone of early management?",
        a: "Diagnosis requires <b>2 of 3</b>: 1) characteristic epigastric pain; 2) serum amylase or lipase <b>$\\\\ge 3$ times upper limit of normal</b>; 3) characteristic findings on abdominal imaging. Cornerstone of management is <b>aggressive IV fluid resuscitation</b> (preferably Lactated Ringer's) and early enteral nutrition. Prophylactic antibiotics are <b>not</b> recommended."
      },
      {
        q: "What is the diagnostic algorithm for a patient with suspected pulmonary embolism (PE) based on their Wells score?",
        a: "If Wells score is <b>low/moderate ($\\\\le 4$)</b>: check <b>D-dimer</b>. If D-dimer is normal, PE is ruled out; if elevated, perform <b>CT pulmonary angiography (CTPA)</b>. If Wells score is <b>high ($> 4$)</b>: proceed directly to <b>CTPA</b> without D-dimer. (Use V/Q scan if CTPA is contraindicated, e.g., renal failure, pregnancy, contrast allergy)."
      },
      {
        q: "A 62-year-old male is started on unfractionated heparin for a DVT. Five days later, his platelet count drops by 50% to 80,000/mcL. What is the immediate management algorithm?",
        a: "1) <b>Stop all heparin products immediately</b> (including flushes). 2) Start a non-heparin anticoagulant, preferably a <b>direct thrombin inhibitor</b> (e.g., argatroban, bivalirudin). 3) Send a HIT antibody assay (ELISA) followed by serotonin release assay. 4) <b>Do not give platelets</b> (prothrombotic) and <b>do not start warfarin</b> until platelets recover to $\\\\ge 150,000/\\\\text{mcL}$ (prevents venous limb gangrene)."
      },
      {
        q: "Explain the diagnostic and management algorithm for a patient presenting with new-onset ascites.",
        a: "Perform a diagnostic <b>paracentesis</b> to calculate the Serum-Ascites Albumin Gradient ($\\\\text{SAAG} = \\\\text{Serum Albumin} - \\\\text{Ascitic Albumin}$). If <b>SAAG $\\\\ge 1.1\\\\text{ g/dL}$</b>: portal hypertension (e.g., cirrhosis, heart failure); treat with salt restriction and diuretics (spironolactone + furosemide). If <b>SAAG $< 1.1\\\\text{ g/dL}$</b>: peritoneal cause (e.g., carcinomatosis, TB, pancreatitis); treat underlying cause."
      },
      {
        q: "A 65-year-old male with history of prostate cancer presents with progressive, severe back pain, lower extremity weakness, and urinary retention. What is the immediate management algorithm?",
        a: "1) Administer <b>high-dose intravenous glucocorticoids</b> (dexamethasone) immediately (before imaging, to reduce spinal edema). 2) Obtain an <b>urgent MRI of the entire spine</b>. 3) Consult <b>neurosurgery</b> or radiation oncology for decompression/radiation."
      },
      {
        q: "What is the first-line treatment for anaphylaxis, and how is it administered?",
        a: "Intramuscular <b>epinephrine $0.3\\\\text{ mg}$ (1:1000)</b> administered in the <b>anterolateral thigh</b>. Repeat every 5-15 minutes if symptoms persist or worsen. Give aggressive IV fluid boluses for hypotension refractory to epinephrine."
      },
      {
        q: "What is the immediate medical management for a patient presenting to the ED with crushing chest pain and ST-segment elevation on ECG (STEMI)?",
        a: "Administer <b>chewable aspirin $325\\\\text{ mg}$</b>, a <b>P2Y12 inhibitor</b> (e.g., clopidogrel, ticagrelor), and intravenous <b>unfractionated heparin</b>. Control pain and ischemia with sublingual <b>nitroglycerin</b> (unless contraindicated, e.g., right ventricular MI or PDE-5 inhibitor use) and IV <b>beta-blockers</b> (if hemodynamically stable). Arrange for <b>emergent coronary angiography/percutaneous coronary intervention (PCI)</b> within 90 minutes."
      },
      {
        q: "What is the management algorithm for a patient with a wide-complex tachycardia (monomorphic ventricular tachycardia) who is hemodynamically stable vs. hemodynamically unstable?",
        a: "If <b>unstable</b> (chest pain, dyspnea, hypotension, altered mental status): perform <b>immediate synchronized cardioversion</b>. If <b>stable</b>: administer antiarrhythmic medications (preferably <b>amiodarone</b> or <b>procainamide</b>; procainamide is preferred in stable WPW-associated tachycardia)."
      },
      {
        q: "What is the management algorithm for a patient with severe bradycardia (HR < 50 bpm) who is hemodynamically unstable?",
        a: "First-line medication is <b>atropine $1\\\\text{ mg}$ IV</b> (repeat every 3-5 mins, max $3\\\\text{ mg}$). If atropine is ineffective, initiate <b>transcutaneous pacing</b> or start an infusion of <b>epinephrine</b> or <b>dopamine</b>."
      },
      {
        q: "What is the step-by-step management algorithm for Diabetic Ketoacidosis (DKA) regarding fluids, insulin, and potassium?",
        a: "1) <b>Aggressive IV fluid resuscitation</b> with normal saline (NS). 2) Check potassium ($\\\\text{K}^+$): if <b>$\\\\text{K}^+ < 3.3\\\\text{ mEq/L}$</b>, hold insulin and replete $\\\\text{K}^+$; if <b>$\\\\text{K}^+$ 3.3–5.3</b>, start insulin infusion ($0.1\\\\text{ U/kg/hr}$) and add potassium ($20\\\\text{--}30\\\\text{ mEq/L}$) to fluids; if <b>$\\\\text{K}^+ > 5.3$</b>, start insulin only and check $\\\\text{K}^+$ every 2 hours. 3) Switch to dextrose-containing fluids when blood glucose is $< 200\\\\text{ mg/dL}$ (DKA) or $< 300\\\\text{ mg/dL}$ (HHS) to allow closure of the anion gap."
      },
      {
        q: "A patient with end-stage renal disease is found to have a serum potassium of 7.2 mEq/L. The ECG shows peaked T waves and QRS widening. What is the management algorithm?",
        a: "1) <b>Stabilize cardiac membrane</b>: Administer <b>intravenous calcium gluconate</b> (or calcium chloride) immediately. 2) <b>Shift potassium intracellularly</b>: Give <b>intravenous insulin + dextrose</b> and inhaled <b>albuterol</b> (or IV sodium bicarbonate if metabolic acidosis is present). 3) <b>Eliminate potassium</b>: Administer <b>loop diuretics</b>, <b>sodium zirconium cyclosilicate (Lokelma)</b>, or initiate <b>emergent hemodialysis</b>."
      },
      {
        q: "A patient presents with sudden onset right-sided weakness and aphasia starting 2 hours ago. What is the immediate diagnostic and management algorithm?",
        a: "1) Obtain a <b>non-contrast head CT</b> immediately to rule out intracranial hemorrhage. 2) Check blood glucose to rule out hypoglycemia. 3) If CT is negative for hemorrhage, and patient meets inclusion criteria, administer <b>intravenous alteplase (tPA)</b> (must be given within <b>3 to 4.5 hours</b> of symptom onset; keep blood pressure <b>$< 185/110\\\\text{ mmHg}$</b> before administration)."
      },
      {
        q: "Describe the escalational pharmacotherapy algorithm for a patient in status epilepticus (seizures lasting > 5 minutes).",
        a: "First-line (0-5 mins): IV <b>lorazepam</b> (or IM <b>midazolam</b> if no IV access). Second-line (5-20 mins): IV antiepileptic drug, e.g., <b>fosphenytoin</b>, <b>levetiracetam</b>, or <b>valproate</b>. Third-line (>20 mins): Continuous infusion of anesthetic agents (e.g., <b>propofol</b>, <b>midazolam</b>, or <b>ketamine</b>) with continuous EEG monitoring."
      },
      {
        q: "A patient presents with the \"worst headache of their life.\" The non-contrast head CT is normal. What is the next diagnostic step, and what is the management algorithm if positive?",
        a: "The next step is a <b>lumbar puncture</b> to look for <b>xanthochromia</b> (pink/yellow CSF from RBC lysis) or elevated RBC count that does not decrease from tube 1 to 4. If positive: manage blood pressure (target systolic $< 160\\\\text{ mmHg}$ using IV nicardipine/labetalol), administer <b>nimodipine</b> (prevents cerebral vasospasm/delayed ischemia), and obtain urgent neurosurgical consultation for coiling/clipping."
      },
      {
        q: "A 52-year-old male presents with fever, headache, altered mental status, and neck stiffness. What is the diagnostic and management algorithm?",
        a: "1) Draw blood cultures. 2) Immediately administer <b>empiric IV antibiotics + dexamethasone</b> (dexamethasone reduces neurological sequelae, especially in <i>S. pneumoniae</i> meningitis). 3) Perform head CT if signs of elevated ICP (papilledema, focal deficits) or immunocompromised. 4) Perform <b>lumbar puncture</b>. Empiric regimen: <b>ceftriaxone + vancomycin + ampicillin</b> (ampicillin covers <i>Listeria monocytogenes</i> in patients $> 50$ or immunocompromised)."
      },
      {
        q: "What is the management algorithm for hypernatremia (sodium > 145 mEq/L) based on volume status?",
        a: "If **hypovolemic and hemodynamically unstable**: resuscitate with <b>isotonic saline (0.9% NS)</b> until stable, then switch to a hypotonic solution (e.g., <b>5% dextrose in water (D5W)</b> or <b>0.45% saline</b>) to correct the free water deficit. If **euvolemic**: give free water orally or IV D5W. <b>Crucial rule</b>: Correct sodium slowly (rate <b>$< 10\\\\text{ mEq/L/day}$</b>) to prevent <b>cerebral edema</b>."
      },
      {
        q: "Describe the diagnostic and therapeutic algorithm for SIADH.",
        a: "Diagnostic criteria: hypotonic hyponatremia ($\\\\text{serum osm} < 275\\\\text{ mOsm/kg}$), high urine osmolality ($> 100\\\\text{ mOsm/kg}$), high urine sodium ($> 40\\\\text{ mEq/L}$), and clinical euvolemia. Management: 1) First-line: <b>fluid restriction</b> ($< 1\\\\text{ L/day}$). 2) Moderate: oral salt tablets + loop diuretics. 3) Severe (seizures, coma): <b>3% hypertonic saline</b> (correct slowly, <b>$< 8\\\\text{--}10\\\\text{ mEq/L/day}$</b>, to prevent <b>osmotic demyelination syndrome</b>)."
      },
      {
        q: "A 65-year-old female presents with sudden onset of severe right eye pain, headache, nausea, and blurry vision with halos around lights. The pupil is mid-dilated and non-reactive to light. What is the diagnostic and management algorithm?",
        a: "Diagnostic test is <b>tonometry</b> showing intraocular pressure (IOP) $> 30\\\\text{ mmHg}$. Management: immediate combination of topical drops (e.g., <b>timolol</b>, <b>apraclonidine</b>, <b>pilocarpine</b>), systemic <b>acetazolamide</b>, and urgent ophthalmology referral for definitive <b>bilateral laser peripheral iridotomy</b>."
      },
      {
        q: "In what specific order must medications be administered during a thyroid storm, and what is the pharmacological rationale?",
        a: "1) <b>Beta-blockers</b> (e.g., propranolol) first to block sympathetic hyperactivity. 2) <b>Thionamides</b> (e.g., PTU or methimazole) to block thyroid hormone synthesis. 3) <b>Iodine</b> (e.g., potassium iodide) administered <b>at least 1 hour AFTER</b> thionamides, to block hormone release (giving iodine first can fuel further hormone synthesis via the Wolff-Chaikoff effect). 4) <b>Glucocorticoids</b> (hydrocortisone) to reduce peripheral conversion of T4 to T3 and treat relative adrenal insufficiency."
      },
      {
        q: "What is the pharmacological preparation algorithm prior to surgical resection of a pheochromocytoma?",
        a: "1) Initiate <b>alpha-blockade</b> (e.g., phenoxybenzamine) for 7–14 days first to prevent hypertensive crisis. 2) Initiate <b>beta-blockade</b> (e.g., propranolol) only <b>after</b> adequate alpha-blockade to control reflex tachycardia. <b>Rule</b>: Never give a beta-blocker first, as it blocks beta-2-mediated vasodilation, leaving alpha-1 vasoconstriction unopposed, causing a catastrophic hypertensive crisis."
      },
      {
        q: "A patient presents 3 hours after ingestive overdose of acetaminophen. What is the management algorithm?",
        a: "1) If patient presents within 4 hours, administer <b>activated charcoal</b>. 2) Obtain a serum acetaminophen level at <b>exactly 4 hours</b> post-ingestion (or immediately if $> 4$ hours have passed). 3) Plot the level on the <b>Rumack-Matthew nomogram</b>. 4) If the level is above the treatment line, initiate <b>intravenous N-acetylcysteine (NAC)</b> (most effective within 8 hours of ingestion)."
      },
      {
        q: "A patient is rescued from a house fire presenting with headache, confusion, and cherry-red skin. Pulse oximetry is 98% on room air. What is the diagnostic test of choice and the management algorithm?",
        a: "Pulse oximetry is falsely normal because standard pulse oximeters cannot distinguish carboxyhemoglobin from oxyhemoglobin. Diagnostic test: <b>arterial or venous blood gas with co-oximetry</b> to measure <b>carboxyhemoglobin (COHb)</b>. Management: <b>100% high-flow oxygen</b> via non-rebreather mask (reduces CO half-life from 5 hours to 90 minutes). Use <b>hyperbaric oxygen</b> if COHb $> 25\\%$ (or $> 15\\%$ in pregnancy), or if neurological signs, myocardial ischemia, or severe acidosis are present."
      },
      {
        q: "A patient undergoing chemotherapy presents with a temperature of 101.3°F (38.5°C) and an absolute neutrophil count (ANC) of 300/mcL. What is the management algorithm?",
        a: "This is a medical emergency. 1) Obtain blood cultures (and other cultures/labs). 2) <b>Immediately (within 1 hour) administer empiric anti-pseudomonal monotherapy</b> (e.g., <b>cefepime</b>, <b>piperacillin-tazobactam</b>, or <b>meropenem</b>). Do not wait for culture results or imaging. Add vancomycin only if catheter infection, skin/soft tissue infection, hemodynamic instability, or pneumonia is suspected."
      },
      {
        q: "What are the key components of the 1-hour sepsis resuscitation bundle?",
        a: "1) Measure serum <b>lactate</b> level (re-measure if initial $> 2\\\\text{ mmol/L}$). 2) Obtain blood cultures <b>prior</b> to administration of antibiotics. 3) Administer broad-spectrum <b>IV antibiotics</b>. 4) Rapidly administer <b>$30\\\\text{ mL/kg}$ crystalloid fluid</b> for hypotension or lactate $\\\\ge 4\\\\text{ mmol/L}$. 5) Apply vasopressors (preferably <b>norepinephrine</b>) if the patient remains hypotensive during or after fluid resuscitation to maintain a Mean Arterial Pressure ($\\\\text{MAP}$) $\\\\ge 65\\\\text{ mmHg}$."
      },
      {
        q: "What are the diagnostic criteria and the ventilator management algorithm for Acute Respiratory Distress Syndrome (ARDS)?",
        a: "Diagnostic criteria (Berlin definition): 1) acute onset ($< 1$ week); 2) bilateral opacities on chest imaging not explained by heart failure; 3) hypoxemia defined by a ratio of $\\\\text{PaO}_2/\\\\text{FiO}_2 \\\\le 300\\\\text{ mmHg}$. Ventilator management: <b>low tidal volume ventilation ($6\\\\text{ mL/kg}$ of ideal body weight)</b> to prevent barotrauma, <b>high PEEP</b> to prevent atelectasis, and target oxygenation $\\\\text{SpO}_2$ 88–95% ($\\\\text{PaO}_2$ 55–80 mmHg)."
      },
      {
        q: "A 5-year-old child presents with high fever, sore throat, drooling, and stridor, sitting in a \"tripod\" position. What is the diagnostic and management algorithm?",
        a: "1) Keep the child calm and <b>avoid examining the throat with a tongue depressor</b> (can trigger fatal laryngospasm). 2) Transport the patient directly to the operating room for <b>controlled endotracheal intubation</b> under general anesthesia. 3) Confirm diagnosis with visualization of an erythematous, swollen epiglottis during intubation. 4) Administer IV antibiotics (e.g., ceftriaxone + vancomycin) after airway is secured."
      },
      {
        q: "What clinical parameters are used to monitor respiratory status in a patient with myasthenia gravis, and what is the management algorithm for a myasthenic crisis?",
        a: "Monitor respiratory status using <b>Forced Vital Capacity (FVC)</b> and <b>Negative Inspiratory Force (NIF)</b>. If FVC drops $< 20\\\\text{ mL/kg}$ or NIF is $>-30\\\\text{ cm H}_2\\\\text{O}$, intubate electively. Management of crisis: 1) **Hold anticholinesterase medications** (e.g., pyridostigmine) temporarily to reduce airway secretions. 2) Initiate <b>plasmapheresis (plasma exchange)</b> or <b>IVIG</b>. 3) Start high-dose corticosteroids."
      },
      {
        q: "A patient with chronic adrenal insufficiency presents with hypotension refractory to IV fluids, severe abdominal pain, and confusion. Labs show hyponatremia and hyperkalemia. What is the immediate management algorithm?",
        a: "1) Administer <b>intravenous hydrocortisone $100\\\\text{ mg}$</b> immediately (has both glucocorticoid and mineralocorticoid activity; do not delay for ACTH stimulation test results). 2) Administer aggressive <b>isotonic saline (0.9% NS) resuscitation</b> with 5% dextrose to correct hypotension, hyponatremia, and hypoglycemia."
      },
      {
        q: "How is Tumor Lysis Syndrome (TLS) prevented and managed?",
        a: "Prevention/Management: 1) <b>Aggressive IV hydration</b> to maintain high urine output. 2) For low/moderate risk: oral or IV <b>allopurinol</b> (xanthine oxidase inhibitor) to prevent uric acid formation. 3) For high risk or active TLS: IV <b>rasburicase</b> (recombinant urate oxidase) to convert uric acid to soluble allantoin. **Contraindication**: Rasburicase is contraindicated in <b>G6PD deficiency</b> due to the risk of severe acute hemolysis and methemoglobinemia."
      },
      {
        q: "What is the management algorithm for secondary hyperparathyroidism in chronic kidney disease?",
        a: "1) Restrict dietary phosphate. 2) Administer <b>phosphate binders</b> (e.g., <b>calcium carbonate/acetate</b> if calcium is low/normal; <b>sevelamer</b> or <b>lanthanum</b> if calcium is high, to prevent metastatic calcification). 3) Replete active vitamin D with <b>calcitriol</b> if parathyroid hormone (PTH) remains elevated. 4) Use calcimimetics (e.g., <b>cinacalcet</b>) to increase calcium-sensing receptor sensitivity on the parathyroid gland if refractory."
      }
    ]
  },
  {
    section: 'Clinical Case Integration (Step 2 CK)',
    topic: 'Pharmacotherapy in clinical context',
    icon: 'pill',
    cards: [
      {
        q: "Which specific beta-blockers have a proven mortality benefit in patients with Heart Failure with Reduced Ejection Fraction (HFrEF), and when should they be initiated?",
        a: "<b>Metoprolol succinate</b> (extended-release), <b>carvedilol</b>, and <b>bisoprolol</b>. They must be initiated only when the patient is <b>hemodynamically stable</b> (e.g., not during an acute decompensated flare with fluid overload) at a low dose and slowly titrated upward."
      },
      {
        q: "What is the mechanism by which ACE inhibitors and ARBs slow the progression of diabetic nephropathy, and what hemodynamic effect do they have on the glomerulus?",
        a: "They block angiotensin II-mediated vasoconstriction of the <b>efferent arteriole</b>, leading to <b>efferent arteriole vasodilation</b>. This decreases <b>intraglomerular capillary pressure ($\\\\text{P}_{\\\\text{gc}}$)</b>, reducing hyperfiltration and proteinuria."
      },
      {
        q: "What are the major toxicities of amiodarone, and what routine screening tests must be performed?",
        a: "1) <b>Pulmonary toxicity</b> (interstitial pneumonitis/fibrosis); monitor with baseline and annual <b>chest X-ray and Pulmonary Function Tests (PFTs)</b>. 2) <b>Thyroid dysfunction</b> (hypo- or hyperthyroidism due to high iodine content); monitor <b>Thyroid Function Tests (TFTs)</b> every 6 months. 3) <b>Hepatotoxicity</b>; monitor <b>Liver Function Tests (LFTs)</b> every 6 months. 4) Corneal microdeposits and blue-gray skin discoloration."
      },
      {
        q: "Which commonly prescribed medications can precipitate acute lithium toxicity, and what is the mechanism?",
        a: "<b>Thiazide diuretics</b> (e.g., chlorthalidone), <b>NSAIDs</b> (except aspirin), and <b>ACE inhibitors/ARBs</b>. They decrease renal clearance of lithium by increasing sodium and water resorption in the proximal tubule, causing lithium to be co-reabsorbed."
      },
      {
        q: "What electrolyte abnormality predisposes a patient to digoxin toxicity, and what are the classic clinical signs and treatment?",
        a: "<b>Hypokalemia</b> (digoxin binds to the $\\\\text{K}^+$-binding site of the $\\\\text{Na}^+/\\\\text{K}^+$ ATPase; less potassium means more digoxin binding). Signs: nausea, vomiting, confusion, cardiac arrhythmias (classic: paroxysmal atrial tachycardia with AV block), and <b>yellow-green visual halos</b>. Treat severe toxicity with <b>digoxin-specific antibody (Fab) fragments</b>."
      },
      {
        q: "What is the mechanism of action of statins, what are their two main severe adverse effects, and what is the screening guideline?",
        a: "Mechanism: competitive inhibition of <b>HMG-CoA reductase</b>. Adverse effects: <b>statin-induced myopathy</b> (ranging from myalgias to rhabdomyolysis, increased risk when combined with fibrates) and <b>hepatotoxicity</b>. Check baseline <b>transaminases (AST/ALT)</b> before starting; routine monitoring is not required unless symptoms develop."
      },
      {
        q: "Contrast the molecular targets of Direct Oral Anticoagulants (DOACs) and Warfarin.",
        a: "<b>Apixaban, rivaroxaban, and edoxaban</b> are direct inhibitors of <b>Factor Xa</b> (converting prothrombin to thrombin). <b>Dabigatran</b> is a direct inhibitor of <b>Factor IIa (thrombin)</b>. <b>Warfarin</b> inhibits <b>vitamin K epoxide reductase complex subunit 1 (VKORC1)</b>, blocking the synthesis of clotting factors <b>II, VII, IX, and X</b> and proteins <b>C and S</b>."
      },
      {
        q: "What is the primary mechanism of action of metformin, what is its most feared adverse effect, and what GFR threshold contraindicates its use?",
        a: "Mechanism: inhibits mitochondrial respiratory chain complex I, leading to <b>decreased hepatic gluconeogenesis</b> and increased peripheral insulin sensitivity. Feared adverse effect: <b>lactic acidosis</b>. Contraindicated if <b>$\\\\text{GFR} < 30\\\\text{ mL/min/1.73 m}^2$</b> (hold metformin before iodinated contrast and resume 48 hours later after verifying normal renal function)."
      },
      {
        q: "What are the specific cardiovascular and renal benefits of GLP-1 receptor agonists vs. SGLT2 inhibitors in type 2 diabetes?",
        a: "<b>GLP-1 receptor agonists</b> (e.g., semaglutide, liraglutide) reduce major adverse cardiovascular events (MACE) and promote weight loss. <b>SGLT2 inhibitors</b> (e.g., empagliflozin, dapagliflozin) reduce <b>heart failure hospitalizations</b> and slow the progression of <b>diabetic kidney disease</b> (nephroprotection) by blocking renal glucose and sodium reabsorption in the proximal tubule."
      },
      {
        q: "What is the mechanism of action of sulfonylureas, and why are they generally avoided in the elderly?",
        a: "Mechanism: bind to and close the <b>sulfonylurea receptor/ATP-sensitive potassium ($\\\\text{K}_{\\\\text{ATP}}$) channel</b> in pancreatic beta cells, depolarizing the cell membrane and stimulating <b>insulin secretion</b> independent of glucose levels. They are avoided in the elderly due to a high risk of <b>prolonged, severe hypoglycemia</b> (especially long-acting agents like glyburide or glimepiride)."
      },
      {
        q: "Which atypical (second-generation) antipsychotics carry the highest risk of metabolic syndrome, and what unique monitoring is required for clozapine?",
        a: "<b>Olanzapine</b> and <b>clozapine</b> carry the highest risk of weight gain, hyperglycemia, and dyslipidemia. Clozapine requires absolute neutrophil count (ANC) monitoring due to the risk of <b>agranulocytosis</b> (neutropenia)."
      },
      {
        q: "A 25-year-old female is brought to the ED after taking a large bottle of amitriptyline. Her ECG shows a QRS duration of 120 ms. What is the clinical triad of TCA toxicity, and what is the treatment for cardiotoxicity?",
        a: "Triad: <b>Cardiotoxicity</b> (QRS widening, arrhythmias due to cardiac sodium channel blockade), <b>Convulsions</b> (seizures), and <b>Coma</b>. Treat cardiotoxicity with <b>intravenous sodium bicarbonate ($\\\\text{NaHCO}_3$)</b> to increase extracellular sodium concentration and raise blood pH, reducing drug binding to cardiac sodium channels."
      },
      {
        q: "Contrast the clinical presentation and pharmacotherapy of Neuroleptic Malignant Syndrome (NMS) and Serotonin Syndrome.",
        a: "<b>NMS</b>: characterized by <b>\"lead-pipe\" muscle rigidity</b>, high fever, autonomic instability, and elevated creatine kinase (CK); caused by dopamine antagonists; treat with <b>dantrolene</b> or <b>bromocriptine</b>. <b>Serotonin Syndrome</b>: characterized by <b>hyperreflexia, neuromuscular clonus</b>, tremor, diarrhea; caused by serotonergic drugs; treat with <b>cyproheptadine</b>."
      },
      {
        q: "What are the key adverse effects of Methotrexate and Hydroxychloroquine, and how are they monitored?",
        a: "<b>Methotrexate</b>: causes macrocytic anemia (folate deficiency), hepatotoxicity, oral ulcers, and pulmonary fibrosis; supplement with <b>folic acid</b> and monitor CBC and LFTs regularly. <b>Hydroxychloroquine</b>: causes <b>retinal toxicity</b> (maculopathy); monitor with baseline and annual <b>ophthalmologic exams</b> (field testing, SD-OCT)."
      },
      {
        q: "How does the pharmacotherapy for an acute gout flare differ from chronic gout management?",
        a: "<b>Acute flare</b>: treat with <b>NSAIDs (indomethacin)</b>, <b>colchicine</b> (inhibits microtubule polymerization), or <b>corticosteroids</b> (oral or intra-articular). <b>Chronic management</b>: treat with <b>allopurinol</b> or <b>febuxostat</b> (xanthine oxidase inhibitors). <b>Crucial rule</b>: Do not initiate or stop allopurinol during an acute flare, as fluctuating uric acid levels can worsen and prolong the attack."
      },
      {
        q: "What are the endocrine, skeletal, and ophthalmic side effects of chronic systemic corticosteroid use?",
        a: "Endocrine: <b>hyperglycemia</b> (insulin resistance), cushingoid habitus, adrenal insufficiency (suppression of HPA axis). Skeletal: <b>osteoporosis</b> (decreased osteoblast activity, treated with bisphosphonates), <b>avascular necrosis</b> of the femoral head. Ophthalmic: <b>cataracts</b> and <b>glaucoma</b> (increased IOP)."
      },
      {
        q: "Explain the mechanism of action of Sildenafil, Bosentan, and Epoprostenol in the treatment of pulmonary arterial hypertension (PAH).",
        a: "<b>Sildenafil</b>: inhibits <b>phosphodiesterase-5 (PDE-5)</b>, increasing cGMP and promoting nitric oxide-mediated vasodilation. <b>Bosentan</b>: is an antagonist of <b>endothelin-1 receptors</b>, blocking vasoconstriction. <b>Epoprostenol</b>: is a <b>prostacyclin (PGI2) analog</b>, promoting direct vasodilation and inhibiting platelet aggregation."
      },
      {
        q: "Contrast the mechanism, onset of action, and systemic side effects of Tamsulosin and Finasteride in Benign Prostatic Hyperplasia (BPH).",
        a: "<b>Tamsulosin</b>: is an <b>alpha-1 blocker</b> that relaxes prostatic smooth muscle; has rapid onset (days); side effects include orthostatic hypotension and retrograde ejaculation. <b>Finasteride</b>: is a <b>5-alpha-reductase inhibitor</b> that blocks conversion of testosterone to dihydrotestosterone (DHT), shrinking the prostate gland; has delayed onset (6-12 months); side effects include erectile dysfunction and decreased libido."
      },
      {
        q: "Why is the co-administration of nitroglycerin and sildenafil strictly contraindicated?",
        a: "Nitroglycerin increases nitric oxide, which stimulates guanylyl cyclase to produce cGMP. Sildenafil inhibits PDE-5, the enzyme that degrades cGMP. Together, they cause a <b>synergistic accumulation of cGMP</b>, leading to profound, life-threatening <b>systemic vasodilation and hypotension</b>."
      },
      {
        q: "What is the current standard first-step maintenance and reliever therapy for mild-to-moderate asthma based on GINA guidelines?",
        a: "<b>Low-dose Inhaled Corticosteroid (ICS) + Formoterol</b> (a rapid, long-acting beta-2 agonist) used <b>as-needed (prn)</b> for symptom relief. This combined therapy is preferred over SABA monotherapy to reduce the risk of severe exacerbations by treating airway inflammation early."
      },
      {
        q: "Under what clinical criteria does long-term oxygen therapy improve survival in patients with Chronic Obstructive Pulmonary Disease (COPD)?",
        a: "1) Resting arterial oxygen tension <b>$\\\\text{PaO}_2 \\\\le 55\\\\text{ mmHg}$</b> or oxygen saturation <b>$\\\\text{SaO}_2 \\\\le 88\\%$</b>. 2) Resting <b>$\\\\text{PaO}_2$ 56–59 mmHg</b> or <b>$\\\\text{SaO}_2$ 89%</b> with concurrent <b>cor pulmonale</b>, right heart failure, or erythrocytosis (hematocrit $> 55\\%$)."
      },
      {
        q: "What is the administration protocol for oral bisphosphonates (e.g., alendronate), and what is the clinical rationale?",
        a: "Take the medication <b>first thing in the morning</b> on an empty stomach with a <b>full glass of plain water</b>, and <b>remain completely upright for at least 30 minutes</b> before consuming any food, beverage, or other medications. This prevents drug-induced <b>pill esophagitis</b> (chemical irritation of the esophageal mucosa) and maximizes poor absorption."
      },
      {
        q: "Why is Levodopa always co-administered with Carbidopa, and what are the unique side effects of Dopamine Agonists (e.g., pramipexole)?",
        a: "<b>Carbidopa</b> inhibits peripheral <b>dopa decarboxylase</b>, preventing the peripheral conversion of levodopa to dopamine. This increases the amount of levodopa that crosses the blood-brain barrier and decreases peripheral dopamine side effects (nausea, orthostatic hypotension). <b>Dopamine agonists</b> can cause <b>impulse control disorders</b> (compulsive gambling, shopping, hypersexuality) due to stimulation of the mesolimbic dopamine pathway."
      },
      {
        q: "What are the FDA black box warnings and severe systemic toxicities associated with fluoroquinolones (e.g., ciprofloxacin, levofloxacin)?",
        a: "<b>Tendonitis and tendon rupture</b> (Achilles tendon most common), <b>QT interval prolongation</b> (arrhythmias), <b>aortic aneurysm dissection/rupture</b>, peripheral neuropathy, and glycemic fluctuations. They are generally contraindicated in pregnancy, during lactation, and in pediatric patients."
      },
      {
        q: "What are the three primary adverse effects of aminoglycosides (e.g., gentamicin, amikacin), and how is renal safety monitored?",
        a: "1) <b>Nephrotoxicity</b> (acute tubular necrosis, typically reversible). 2) <b>Ototoxicity</b> (vestibular dysfunction and cochlear damage, often irreversible). 3) <b>Neuromuscular blockade</b> (contraindicated in myasthenia gravis). Monitor renal safety by measuring <b>serum trough levels</b> (high trough levels correlate with increased toxicity risk) and creatinine."
      },
      {
        q: "What is the mechanism of \"red man syndrome\" associated with vancomycin, and how is it managed? What parameters are monitored to prevent nephrotoxicity?",
        a: "\"Red man syndrome\" is a <b>non-immunologic, rate-dependent histamine release</b> caused by rapid infusion of vancomycin; manage by <b>slowing the infusion rate</b> and administering antihistamines. Prevent nephrotoxicity by monitoring <b>vancomycin trough levels</b> (target <b>$15\\\\text{--}20\\\\text{ mcg/mL}$</b> for severe infections like MRSA bacteremia, osteomyelitis, or pneumonia)."
      },
      {
        q: "Explain the mixed acid-base disorder seen in acute aspirin (salicylate) toxicity, and what is the role of sodium bicarbonate?",
        a: "Salicylates cause: 1) <b>Primary respiratory alkalosis</b> by directly stimulating the medullary respiratory center (hyperventilation). 2) <b>Primary high anion gap metabolic acidosis</b> by uncoupling oxidative phosphorylation, leading to anaerobic glycolysis and accumulation of lactic acid and ketoacids. <b>Sodium bicarbonate ($\\\\text{NaHCO}_3$)</b> is administered to alkalinize the blood and urine, which ionizes the salicylate ($\\\\text{A}^-$), trapping it in the urine to promote renal excretion and preventing it from crossing the blood-brain barrier."
      },
      {
        q: "Contrast the pupillary and autonomic signs of acute opioid overdose and acute opioid withdrawal, and identify the first-line treatments?",
        a: "<b>Overdose</b>: presents with <b>miosis (pinpoint pupils)</b>, respiratory depression, bradycardia, hypothermia, decreased bowel sounds; treat with IV/intranasal <b>naloxone</b> (opioid antagonist). <b>Withdrawal</b>: presents with <b>mydriasis (dilated pupils)</b>, lacrimation, rhinorrhea, piloerection (\"goosebumps\"), yawning, diarrhea, hyperactive bowel sounds; treat with <b>methadone</b>, <b>buprenorphine</b>, or alpha-2 agonists like <b>clonidine</b> for autonomic symptoms."
      },
      {
        q: "State the specific antidotes for cyanide poisoning, lead poisoning, and ethylene glycol/methanol toxicity.",
        a: "<b>Cyanide</b>: treat with <b>hydroxocobalamin</b> (binds cyanide to form cyanocobalamin) or a combination of <b>sodium nitrite</b> (induces methemoglobinemia, which binds cyanide) and <b>sodium thiosulfate</b> (promotes conversion to thiocyanate). <b>Lead</b>: treat with oral <b>succimer</b> (mild/moderate) or IV <b>dimercaprol + EDTA</b> (severe/encephalopathy). <b>Ethylene glycol/methanol</b>: treat with <b>fomepizole</b> (inhibits alcohol dehydrogenase, preventing formation of toxic metabolites)."
      },
      {
        q: "What is the mechanism of spironolactone-induced gynecomastia in male patients, and what alternative drug can be used?",
        a: "Spironolactone is a non-selective aldosterone antagonist that also binds to and blocks <b>androgen receptors</b> and stimulates <b>progesterone receptors</b>. This leads to gynecomastia, decreased libido, and erectile dysfunction. The alternative is <b>eplerenone</b>, which is a selective aldosterone antagonist with low affinity for sex hormone receptors."
      }
    ]
  },
  {
    section: 'Clinical Case Integration (Step 2 CK)',
    topic: 'Surgical vs medical decision making',
    icon: 'scissors',
    cards: [
      {
        q: "A 24-year-old male presents with 12 hours of periumbilical pain that has migrated to the right lower quadrant, accompanied by fever and guarding. What is the definitive management for uncomplicated acute appendicitis vs. appendiceal rupture with a stable abscess?",
        a: "For <b>uncomplicated acute appendicitis</b>: immediate <b>surgical appendectomy</b> (or intravenous antibiotics in select cases). For <b>ruptured appendicitis with a stable, localized abscess</b>: manage non-operatively first with <b>IV antibiotics and CT-guided percutaneous drainage</b>, followed by an <b>interval appendectomy</b> 6–8 weeks later."
      },
      {
        q: "Contrast the clinical presentation and management of Cholelithiasis, Acute Cholecystitis, Choledocholithiasis, and Acute Cholangitis.",
        a: "<b>Cholelithiasis</b>: transient postprandial RUQ pain, normal labs; treat with elective outpatient cholecystectomy. <b>Acute Cholecystitis</b>: persistent RUQ pain, positive Murphy's sign, fever, leukocytosis; treat with supportive care and laparoscopic cholecystectomy <b>within 72 hours</b>. <b>Choledocholithiasis</b>: gallstone in common bile duct causing obstructive jaundice (elevated bilirubin/ALP), no fever; treat with <b>ERCP</b> followed by cholecystectomy. <b>Acute Cholangitis</b>: Charcot's triad (fever, jaundice, RUQ pain) $\\\\pm$ Reynolds' pentad (plus hypotension, altered mental status); treat with <b>emergent ERCP for biliary decompression</b> + IV broad-spectrum antibiotics."
      },
      {
        q: "A 55-year-old female with a history of prior abdominal surgeries presents with nausea, vomiting, abdominal distension, and obstipation. What key clinical and radiographic findings dictate conservative medical management vs. emergent surgical laparotomy?",
        a: "<b>Conservative management</b> (NPO, IV fluids, NG tube decompression) is indicated for <b>partial SBO</b> (demonstrated by presence of air in the distal colon/rectum on X-ray) and stable patients. <b>Emergent laparotomy</b> is indicated for <b>complete SBO</b> (no distal gas) or signs of <b>strangulation/ischemia</b> (fever, tachycardia, leukocytosis, metabolic acidosis, continuous localized pain, or peritonitis)."
      },
      {
        q: "Explain the management criteria for uncomplicated diverticulitis vs. complicated diverticulitis with a large abscess vs. diverticulitis with perforation.",
        a: "<b>Uncomplicated</b>: managed outpatient with oral antibiotics and a clear liquid diet. <b>Complicated with abscess $\\\\ge 3\\\\text{ cm}$</b>: require hospitalization, IV antibiotics, and <b>CT-guided percutaneous drainage</b>. <b>Complicated with perforation/peritonitis</b>: require emergent surgical resection of the diseased segment with end-colostomy (<b>Hartmann's procedure</b>)."
      },
      {
        q: "A 72-year-old male with a history of peptic ulcer disease presents with sudden-onset, diffuse, severe abdominal pain. On exam, he has a rigid, silent abdomen with rebound tenderness. What is the diagnostic finding of choice and immediate management?",
        a: "Diagnostic finding: <b>pneumoperitoneum (free air under the diaphragm)</b> visible on upright chest X-ray or CT abdomen. Immediate management: <b>emergent surgical laparotomy</b>, IV broad-spectrum antibiotics (covering enteric gram-negative and anaerobic organisms), and aggressive fluid resuscitation."
      },
      {
        q: "What are the screening guidelines for Abdominal Aortic Aneurysm (AAA), and what are the specific indications for surgical repair?",
        a: "Screening: one-time <b>abdominal ultrasound</b> for men aged <b>65–75</b> who have <b>ever smoked</b>. Repair indications: 1) aneurysm size <b>$\\\\ge 5.5\\\\text{ cm}$</b>; 2) rapid expansion rate (<b>$> 0.5\\\\text{ cm}$ in 6 months</b> or $> 1\\\\text{ cm}$ in 1 year); 3) any <b>symptomatic</b> aneurysm (abdominal/back pain, tenderness, distal embolization) regardless of size."
      },
      {
        q: "What are the indications for carotid endarterectomy (CEA) based on stenosis severity in symptomatic vs. asymptomatic patients?",
        a: "<b>Symptomatic</b> (TIA/stroke in the ipsilateral carotid territory): CEA is indicated for <b>$70\\\\text{--}99\\%$ stenosis</b> (strong benefit) and <b>$50\\\\text{--}69\\%$ stenosis</b> (moderate benefit, depending on patient age and comorbidities). <b>Asymptomatic</b>: CEA is considered for <b>$60\\\\text{--}99\\%$ stenosis</b> if life expectancy is $> 5$ years and surgical complication rate is $< 3\\%$. Manage $< 50\\%$ medically with antiplatelets and statins."
      },
      {
        q: "Contrast the radiographic appearance, anatomy, and surgical indications for Epidural Hematomas (EDH) and Subdural Hematomas (SDH).",
        a: "<b>EDH</b>: biconvex (lens-shaped) hyperdensity, does not cross suture lines; rupture of <b>middle meningeal artery</b>; surgical decompression indicated if volume $> 30\\\\text{ cm}^3$, thickness $> 15\\\\text{ mm}$, midline shift $> 5\\\\text{ mm}$, or pupil abnormalities. <b>SDH</b>: crescent-shaped hyperdensity, crosses suture lines; rupture of <b>bridging veins</b>; surgical decompression indicated if thickness $> 10\\\\text{ mm}$, midline shift $> 5\\\\text{ mm}$, or neurological deterioration (GCS decrease $\\\\ge 2$). Small, asymptomatic hematomas can be monitored conservatively with serial CT scans."
      },
      {
        q: "What is the pediatric management algorithm for acute otitis media (AOM)?",
        a: "Administer <b>immediate amoxicillin</b> for: 1) age <b>$< 6$ months</b> (always); 2) age <b>$6\\\\text{--}23$ months</b> with <b>bilateral</b> AOM or severe symptoms (toxic-looking, severe otalgia, temp $\\\\ge 39^\\\\circ\\\\text{C}$); 3) age <b>$\\\\ge 2$ years</b> with severe symptoms. Offer <b>observation/watchful waiting</b> for 48–72 hours for unilateral AOM in children 6–23 months without severe symptoms, or unilateral/bilateral AOM in children $\\\\ge 2$ years without severe symptoms."
      },
      {
        q: "Describe the diagnostic and therapeutic algorithm for suspected Group A Streptococcal (GAS) pharyngitis using the Centor criteria.",
        a: "Centor criteria: <b>Fever</b> ($1$ pt), <b>Tonsillar exudates</b> ($1$ pt), <b>Tender anterior cervical adenopathy</b> ($1$ pt), <b>Absence of cough</b> ($1$ pt). If score <b>0–1</b>: no testing or treatment. If score <b>2–3</b>: perform <b>Rapid Antigen Detection Test (RADT)</b>; if positive, treat with oral penicillin/amoxicillin. If score <b>4</b>: treat empirically or perform RADT. (Note: in children, a negative RADT <b>must</b> be confirmed with a throat culture before withholding treatment; not required in adults)."
      },
      {
        q: "A patient is scheduled for elective splenectomy due to hereditary spherocytosis. What is the vaccination and prophylactic regimen, and what is the optimal timing?",
        a: "Vaccinate against encapsulated organisms: <b>Streptococcus pneumoniae</b>, <b>Neisseria meningitidis</b>, and <b>Haemophilus influenzae type b (Hib)</b>. Optimal timing: <b>$\\\\ge 14$ days prior</b> to surgery (or 14 days after emergency splenectomy). Daily prophylactic oral <b>penicillin</b> is recommended for children post-splenectomy for at least 5 years or until adulthood."
      },
      {
        q: "A patient presents with a stab wound to the abdomen. What clinical signs mandate immediate emergent laparotomy?",
        a: "1) **Hemodynamic instability** (systolic BP $< 90\\\\text{ mmHg}$). 2) **Peritonitis** (rigidity, rebound tenderness). 3) **Evisceration** (herniation of bowel/omentum). 4) Blood on nasogastric tube or rectal exam. (If hemodynamically stable and none of these are present, obtain a contrast-enhanced CT of the abdomen)."
      },
      {
        q: "Describe the diagnostic algorithm for blunt abdominal trauma based on hemodynamic stability and Focused Assessment with Sonography for Trauma (FAST) results.",
        a: "If the patient is **hemodynamically unstable**: perform a <b>FAST exam</b>. If <b>FAST positive</b> (free fluid in hepatorenal, splenorenal, pelvis, or pericardium), proceed directly to <b>emergent laparotomy</b>. If <b>FAST negative/indeterminate</b>, perform diagnostic peritoneal lavage or search for extra-abdominal blood loss. If the patient is **hemodynamically stable**: proceed to <b>abdominal CT with IV contrast</b> (regardless of FAST results)."
      },
      {
        q: "What is the diagnostic evaluation pathway for a palpable breast mass based on patient age?",
        a: "If age <b>$< 30$</b>: obtain a <b>breast ultrasound</b>. If simple cyst, aspirate if symptomatic; if solid/complex, perform a <b>core needle biopsy</b>. If age <b>$\\\\ge 30$</b>: obtain a <b>mammogram AND ultrasound</b>, followed by a <b>core needle biopsy</b> of any suspicious lesions. (Fine needle aspiration is not preferred for solid masses as it cannot evaluate tissue architecture)."
      },
      {
        q: "Outline the diagnostic algorithm for a newly discovered thyroid nodule $\\\\ge 1\\\\text{ cm}$.",
        a: "1) Measure <b>serum TSH level</b> and perform a <b>thyroid ultrasound</b>. 2) If TSH is <b>normal or elevated</b>: perform a <b>Fine Needle Aspiration (FNA)</b> biopsy based on ultrasound risk criteria (size $\\\\ge 1\\\\text{ cm}$ with high-suspicion features). 3) If TSH is <b>low</b>: obtain a <b>thyroid scintigraphy (radionuclide scan)</b>. If the nodule is \"hot\" (hyperfunctioning), it is benign; manage hyperthyroidism. If the nodule is \"cold\" (non-functioning), perform an <b>FNA</b>."
      },
      {
        q: "A 10-month-old infant presents with episodic severe abdominal pain, vomiting, and a sausage-shaped mass in the RUQ. What is the diagnostic test of choice and the management algorithm?",
        a: "Diagnostic test of choice is <b>abdominal ultrasound</b> showing a <b>\"target\" or \"donut\" sign</b>. Management: therapeutic <b>air or contrast enema</b> under fluoroscopic/ultrasonographic guidance. Perform <b>emergent surgical laparotomy</b> only if there are signs of peritonitis, bowel perforation (free air), or if the enema fails to reduce the intussusception."
      },
      {
        q: "A 4-week-old male infant presents with non-bilious projectile vomiting after every feed. On exam, he has an olive-shaped mass in the epigastrium. Labs show a hypokalemic, hypochloremic metabolic alkalosis. What is the immediate management algorithm?",
        a: "The immediate step is <b>NOT surgery</b>. First, <b>resuscitate with IV fluids (normal saline + dextrose + potassium)</b> to completely correct dehydration and electrolyte abnormalities (which reduces the risk of post-operative apnea). Once stable, perform a diagnostic ultrasound (pyloric muscle thickness $\\\\ge 4\\\\text{ mm}$, length $\\\\ge 15\\\\text{ mm}$), followed by surgical <b>pyloromyotomy</b>."
      },
      {
        q: "A 14-year-old male presents with sudden-onset, severe left testicular pain. On exam, the left testis is swollen, retracted upward, and the cremasteric reflex is absent. What is the management algorithm?",
        a: "This is a surgical emergency. <b>Immediate surgical exploration with detorsion and bilateral orchiopexy</b> (anchoring the testes to the scrotum to prevent recurrence). If surgical access is delayed, attempt manual detorsion (rotating \"like opening a book\"). <b>Rule</b>: Do not delay surgery to obtain a Doppler ultrasound if clinical suspicion is high and the presentation is within the 6-hour viability window."
      },
      {
        q: "Outline the medical vs. surgical management of kidney stones based on stone size and clinical complications.",
        a: "If stone is <b>$< 5\\\\text{ mm}$</b>: managed conservatively with hydration, analgesics, and an alpha-1 blocker (tamsulosin) to facilitate passage. If stone is <b>$5\text{--}10\\\\text{ mm}$</b>: medical expulsive therapy or elective urologic intervention. If stone is <b>$> 10\\\\text{ mm}$</b>, or if there is <b>refractory pain, acute kidney injury, or concurrent UTI/sepsis (obstructive uropathy)</b>: perform <b>urgent surgical decompression</b> via <b>retrograde ureteral stent insertion</b> or <b>percutaneous nephrostomy</b>, followed by lithotripsy."
      },
      {
        q: "Describe the initial stabilization and triage algorithm for a patient presenting with hematemesis.",
        a: "1) Secure airway if obtunded or actively vomiting. 2) Establish <b>two large-bore IVs</b> and start aggressive crystalloid fluid resuscitation. 3) Administer <b>IV proton pump inhibitor infusion</b> (pantoprazole). 4) If variceal bleed is suspected (e.g., history of cirrhosis), administer <b>IV octreotide</b> and prophylactic <b>IV ceftriaxone</b> (reduces mortality and infection risk). 5) Perform <b>urgent upper endoscopy (EGD) within 24 hours</b> for diagnosis and therapeutic intervention (banding, clipping, or thermal coagulation)."
      },
      {
        q: "A 68-year-old male with atrial fibrillation presents with sudden onset of severe right leg pain, pallor, coldness, and absent pulses. What is the immediate management algorithm?",
        a: "This is acute limb ischemia (the \"6 Ps\"). 1) Immediately administer an <b>intravenous heparin bolus followed by a continuous infusion</b> to prevent clot propagation. 2) Obtain urgent vascular surgery consultation for <b>emergent revascularization</b> (surgical embolectomy, catheter-directed thrombolysis, or bypass) within a 6-hour window to prevent irreversible tissue necrosis."
      },
      {
        q: "Under what clinical and anatomic circumstances is Coronary Artery Bypass Grafting (CABG) preferred over Percutaneous Coronary Intervention (PCI)?",
        a: "CABG is indicated and improves survival in patients with: 1) <b>Left main coronary artery stenosis $> 50\\%$</b>; 2) <b>Three-vessel coronary artery disease</b> (especially with depressed ejection fraction or diabetes); 3) <b>Two-vessel disease involving proximal Left Anterior Descending (LAD) artery</b> with depressed ejection fraction."
      },
      {
        q: "A 30-year-old pregnant female at 20 weeks gestation is diagnosed with a proximal DVT. What is the preferred anticoagulant therapy, and which agents are contraindicated?",
        a: "The drug of choice is <b>Low Molecular Weight Heparin (LMWH)</b> (e.g., enoxaparin) or unfractionated heparin, continued throughout pregnancy and for at least 6 weeks postpartum. **Contraindicated**: <b>Warfarin</b> is strictly contraindicated in pregnancy (highly teratogenic, causing fetal chondrodysplasia, nasal hypoplasia, and CNS hemorrhage). <b>DOACs</b> (apixaban, rivaroxaban) are not recommended due to cross-placental transfer."
      },
      {
        q: "What is the management algorithm for a primary spontaneous pneumothorax based on size and clinical stability?",
        a: "If **small ($< 2\\\\text{ cm}$ at the hilum) and clinically stable**: manage with <b>observation and supplemental oxygen</b> (oxygen accelerates pleural air absorption). If **large ($\\\\ge 2\\\\text{ cm}$) or clinically unstable**: perform <b>needle aspiration</b> or insert a <b>small-bore chest tube/catheter</b>. If recurrent or persistent air leak ($> 3\text{--}5$ days), perform video-assisted thoracoscopic surgery (VATS) with chemical pleurodesis."
      },
      {
        q: "What are the indications for performing a diagnostic thoracentesis in a patient with a pleural effusion, and what is the exception?",
        a: "Perform a diagnostic thoracentesis for any <b>new, unexplained pleural effusion</b> that is <b>$> 1\\\\text{ cm}$</b> in thickness on a lateral decubitus X-ray or ultrasound. **Exception**: Clinically apparent <b>congestive heart failure</b> with symmetric bilateral effusions; treat with diuretics first and perform thoracentesis only if the effusion is asymmetric, accompanied by fever/pleuritic chest pain, or fails to resolve after diuresis."
      },
      {
        q: "A 38-year-old obese female presents with episodes of sharp RUQ pain radiating to her right shoulder blade, lasting 2 hours after eating cheeseburgers. Ultrasound shows multiple gallstones without gallbladder wall thickening. What is the management plan?",
        a: "This is <b>biliary colic</b> (transient gallbladder obstruction). Management is conservative education (low-fat diet) and <b>elective outpatient laparoscopic cholecystectomy</b> to prevent future episodes of cholecystitis, choledocholithiasis, or gallstone pancreatitis."
      },
      {
        q: "Contrast the pharmacotherapy for non-severe, severe, and fulminant *Clostridioides difficile* infection (CDI), and state the indication for surgical intervention.",
        a: "<b>Non-severe/Severe</b>: treat with oral <b>vancomycin</b> ($125\\\\text{ mg}$ qid) or oral <b>fidaxomicin</b> ($200\\\\text{ mg}$ bid) for 10 days. <b>Fulminant</b> (hypotension, shock, ileus, or toxic megacolon): treat with <b>high-dose oral vancomycin ($500\\\\text{ mg}$ qid) + rectal vancomycin instillation + IV metronidazole</b>. Surgical intervention (<b>subtotal colectomy</b> or loop ileostomy) is indicated for toxic megacolon, bowel perforation, or clinical deterioration despite maximal medical therapy."
      },
      {
        q: "How does the management algorithm differ for Stanford Type A vs. Stanford Type B aortic dissection?",
        a: "<b>Stanford Type A</b> (involves ascending aorta): requires <b>emergent surgical repair</b> to prevent fatal complications (rupture, cardiac tamponade, acute aortic regurgitation, myocardial infarction). <b>Stanford Type B</b> (involves descending aorta only): managed <b>medically</b> first-line with <b>intravenous beta-blockers (esmolol, labetalol)</b> to target a heart rate $< 60$ bpm and systolic BP $100\text{--}120\\\\text{ mmHg}$ (reducing shear stress). Surgery (thoracic endovascular aortic repair - TEVAR) is indicated only if complicated by organ ischemia, rupture, or uncontrolled pain."
      },
      {
        q: "Outline the diagnostic pathway and treatment algorithm for suspected vertebral osteomyelitis.",
        a: "1) Obtain <b>blood cultures</b> and inflammatory markers (ESR/CRP). 2) Perform a <b>spine MRI</b> (most sensitive imaging). 3) If blood cultures are negative, perform a <b>CT-guided needle bone biopsy</b> to identify the pathogen prior to starting antibiotics. 4) Treat with <b>pathogen-directed IV antibiotics</b> for 6 weeks. <b>Surgical debridement</b> is indicated for neurological deficits (spinal cord compression), spinal instability, epidural abscess, or failure of medical therapy."
      },
      {
        q: "Contrast the management of a reducible inguinal hernia and a reducible femoral hernia.",
        a: "<b>Inguinal hernia</b>: can be monitored with watchful waiting if completely asymptomatic, or scheduled for elective surgical repair. <b>Femoral hernia</b>: requires <b>early elective surgical repair</b> even if asymptomatic, because the narrow femoral ring carries an extremely high risk of incarceration and strangulation ($30\text{--}40\\%$). (Any incarcerated/strangulated hernia requires <b>emergent surgical repair</b>)."
      }
    ]
  },
  {
    section: 'Clinical Case Integration (Step 2 CK)',
    topic: 'Interpretation of labs, imaging, biopsies in context',
    icon: 'microscope',
    cards: [
      {
        q: "State Light's criteria for classifying pleural effusions, and explain how to interpret the results.",
        a: "An effusion is classified as <b>exudative</b> if it meets <b>at least one</b> of the following: 1) ratio of pleural fluid protein to serum protein <b>$> 0.5$</b>; 2) ratio of pleural fluid LDH to serum LDH <b>$> 0.6$</b>; 3) pleural fluid LDH <b>$> 2/3$ the upper limit of normal</b> for serum LDH. If none are met, it is <b>transudative</b>. Exudative effusions are caused by local inflammation/malignancy/infection; transudates are due to systemic hydrostatic/oncotic pressure imbalances (HF, cirrhosis, nephrotic syndrome)."
      },
      {
        q: "What are the diagnostic criteria for synovial fluid analysis in non-inflammatory, inflammatory, septic, and crystal-induced arthropathies?",
        a: "<b>Non-inflammatory</b> (osteoarthritis): WBC $< 2000/\\\\text{mcL}$, clear color, high viscosity. <b>Inflammatory</b> (RA, reactive arthritis): WBC $2000\\\\text{--}50,000/\\\\text{mcL}$ with $> 50\\%$ PMNs. <b>Septic</b>: WBC <b>$> 50,000/\\\\text{mcL}$</b> (often $> 100,000$) with <b>$> 75\\\\text{--}90\\%$ PMNs</b>, purulent. <b>Gout</b>: <b>needle-shaped, negatively birefringent</b> crystals (yellow when parallel to slow-wave light). <b>Pseudogout (CPPD)</b>: <b>rhomboid-shaped, weakly positively birefringent</b> crystals (blue when parallel)."
      },
      {
        q: "Write the formula for the Serum-Ascites Albumin Gradient (SAAG), and state which conditions are associated with a high vs. low gradient.",
        a: "$\\\\text{SAAG} = \\\\text{Serum Albumin} - \\\\text{Ascitic Fluid Albumin}$. <b>High gradient ($\\\\text{SAAG} \\\\ge 1.1\\\\text{ g/dL}$)</b>: indicates portal hypertension; causes include <b>cirrhosis</b>, <b>congestive heart failure</b> (constrictive pericarditis), and <b>Budd-Chiari syndrome</b>. <b>Low gradient ($\\\\text{SAAG} < 1.1\\\\text{ g/dL}$)</b>: indicates non-portal hypertension; causes include <b>peritoneal carcinomatosis</b>, <b>tuberculosis</b>, <b>nephrotic syndrome</b>, and <b>pancreatic ascites</b>."
      },
      {
        q: "State the formula for the Fractional Excretion of Sodium (FENa) and explain how to interpret FENa values. Under what clinical circumstance is FENa unreliable, and what alternative test is used?",
        a: "$\\\\text{FENa} = \\\\frac{\\\\text{U}_{\\\\text{Na}} \\\\times \\\\text{P}_{\\\\text{Cr}}}{\\\\text{P}_{\\\\text{Na}} \\\\times \\\\text{U}_{\\\\text{Cr}}} \\\\times 100\\%$. <b>$\\\\text{FENa} < 1\\%$</b>: indicates <b>prerenal etiology</b> (volume depletion, hypoperfusion, where kidneys conserve sodium). <b>$\\\\text{FENa} > 2\\%$</b>: indicates <b>intrinsic renal etiology</b> (Acute Tubular Necrosis, where damaged tubules lose sodium reabsorption capacity). FENa is <b>unreliable in patients taking diuretics</b> (which artificially increase urine sodium); use <b>Fractional Excretion of Urea (FEUrea)</b> instead (<b>$< 35\\%$</b> indicates prerenal)."
      },
      {
        q: "Contrast the opening pressure, leukocyte count/predominance, protein, and glucose levels in CSF for bacterial, viral, and fungal/TB meningitis.",
        a: "<b>Bacterial</b>: high opening pressure ($> 250\\\\text{ mm H}_2\\\\text{O}$); WBC <b>$> 1,000/\\\\text{mcL}$ with PMN (neutrophil) predominance</b>; high protein ($> 250\\\\text{ mg/dL}$); <b>low glucose ($< 40\\\\text{ mg/dL}$</b> or ratio $< 0.4$). <b>Viral</b>: normal/mildly high opening pressure; WBC $10\\\\text{--}500/\\\\text{mcL}$ with <b>lymphocyte predominance</b>; normal/mildly high protein; <b>normal glucose</b>. <b>Fungal/TB</b>: high opening pressure; WBC $10\\\\text{--}500/\\\\text{mcL}$ with <b>lymphocyte predominance</b>; high protein ($> 100\\\\text{ mg/dL}$); <b>low glucose</b>."
      },
      {
        q: "Write the formula for the Alveolar-arterial (A-a) oxygen gradient, and explain how it helps differentiate causes of hypoxemia.",
        a: "$\\\\text{A-a Gradient} = \\\\text{PAO}_2 - \\\\text{PaO}_2$, where $\\\\text{PAO}_2 = \\\\text{FiO}_2(\\\\text{P}_{\\\\text{atm}} - \\\\text{P}_{\\\\text{H}_2\\\\text{O}}) - \\\\frac{\\\\text{PaCO}_2}{\\\\text{R}}$. (On room air at sea level: $\\\\text{PAO}_2 \\\\approx 150 - 1.25 \\\\times \\\\text{PaCO}_2$). <b>Normal A-a gradient hypoxemia</b> is caused by <b>alveolar hypoventilation</b> (CNS depression, muscle weakness) or <b>high altitude</b>. <b>Elevated A-a gradient hypoxemia</b> is caused by <b>V/Q mismatch</b> (PE, pneumonia, COPD), <b>shunt</b> (intracardiac or pulmonary AVM), or <b>diffusion impairment</b> (ILD)."
      },
      {
        q: "State Winter's formula and explain how to apply it to diagnose mixed acid-base disorders.",
        a: "$\\\\text{Expected }\\\\text{PaCO}_2 = 1.5 \\\\times [\\\\text{HCO}_3^-] + 8 \\\\pm 2$. Used in <b>primary metabolic acidosis</b> to assess for respiratory compensation. If <b>actual }\\\\text{PaCO}_2 > \\\\text{expected</b>: concurrent <b>respiratory acidosis</b> (hypoventilation/respiratory failure). If <b>actual }\\\\text{PaCO}_2 < \\\\text{expected</b>: concurrent <b>respiratory alkalosis</b> (hyperventilation)."
      },
      {
        q: "Write the formula for the Delta-Delta ($\\\\Delta/\\\\Delta$) ratio and explain how it is used to identify mixed metabolic disorders in patients with anion gap metabolic acidosis.",
        a: "$\\\\frac{\\\\Delta\\\\text{AG}}{\\\\Delta\\\\text{HCO}_3^-} = \\\\frac{\\\\text{AG} - 12}{24 - \\\\text{HCO}_3^-}$. <b>Ratio $< 1$</b>: indicates a concurrent <b>non-anion gap metabolic acidosis (NAGMA)</b> (the $\\\\text{HCO}_3^-$ drop is greater than the $\\\\text{AG}$ increase). <b>Ratio 1–2</b>: indicates a <b>pure anion gap metabolic acidosis</b>. <b>Ratio $> 2$</b>: indicates a concurrent <b>metabolic alkalosis</b> (the $\\\\text{HCO}_3^-$ is higher than expected because of a pre-existing alkalosis)."
      },
      {
        q: "Write the formula for the Urine Anion Gap (UAG) and explain how it differentiates renal vs. extra-renal causes of a normal anion gap metabolic acidosis (NAGMA).",
        a: "$\\\\text{UAG} = (\\\\text{U}_{\\\\text{Na}} + \\\\text{U}_{\\\\text{K}}) - \\\\text{U}_{\\\\text{Cl}}$. <b>Negative UAG ($< 0$)</b>: indicates <b>GI bicarbonate loss</b> (e.g., diarrhea); the kidneys are functioning normally and increasing acid excretion in the form of ammonium ($\\\\text{NH}_4^+$), which is excreted with chloride ($\\\\text{Cl}^-$), raising urine chloride. <b>Positive UAG ($> 0$)</b>: indicates <b>Renal Tubular Acidosis (RTA)</b>; the kidneys are unable to excrete acid/ammonium, resulting in low urine chloride."
      },
      {
        q: "What are the characteristic ECG changes associated with hyperkalemia, hypokalemia, hypercalcemia, and hypocalcemia?",
        a: "<b>Hyperkalemia</b>: peaked symmetric T waves, PR prolongation, flat P waves, QRS widening, sine wave. <b>Hypokalemia</b>: flat T waves, <b>prominent U waves</b> (following T wave), ST segment depression, prolonged QT/QU. <b>Hypercalcemia</b>: <b>shortened QT interval</b>. <b>Hypocalcemia</b>: <b>prolonged QT interval</b> (torsades risk)."
      },
      {
        q: "Identify the classic sequential chest X-ray findings in a patient with progressive congestive heart failure.",
        a: "1) <b>Cephalization</b> of pulmonary vasculature (pulmonary venous pressure $10\text{--}15\\\\text{ mmHg}$). 2) <b>Kerley B lines</b> (horizontal lines at lung bases representing interstitial edema; pressure $15\text{--}20\\\\text{ mmHg}$). 3) <b>Alveolar edema</b> (\"batwing\" or \"butterfly\" perihilar infiltrates; pressure $> 25\\\\text{ mmHg}$). 4) Cardiomegaly and pleural effusions (blunting of costophrenic angles)."
      },
      {
        q: "What are the characteristic non-contrast head CT findings for an acute ischemic stroke, an epidural hematoma, a subdural hematoma, and a subarachnoid hemorrhage?",
        a: "<b>Acute Ischemic Stroke</b>: may be normal in first 6–12 hours, followed by <b>dark hypodensity</b> in a vascular territory. <b>Epidural Hematoma</b>: hyperdense, <b>biconvex (lens-shaped) extra-axial collection</b> that does not cross suture lines. <b>Subdural Hematoma</b>: hyperdense, <b>crescent-shaped collection</b> that crosses suture lines. <b>Subarachnoid Hemorrhage</b>: <b>hyperdensity filling the sulci</b> and basal cisterns (\"star of death\")."
      },
      {
        q: "What are the diagnostic X-ray findings for a small bowel obstruction, sigmoid volvulus, and cecal volvulus?",
        a: "<b>Small Bowel Obstruction</b>: central dilated loops of small bowel ($> 3\\\\text{ cm}$), <b>air-fluid levels</b> on upright view, and absence of distal colonic/rectal gas. <b>Sigmoid Volvulus</b>: a massive, smooth, dilated loop of colon arising from the pelvis, showing the <b>\"coffee bean\" sign</b> pointing to the RUQ. <b>Cecal Volvulus</b>: a dilated comma-shaped loop of colon in the LUQ arising from the RLQ."
      },
      {
        q: "Match the following chronic liver diseases with their classic biopsy findings: Chronic Hepatitis B, Chronic Hepatitis C, Alcoholic Hepatitis, and Primary Biliary Cholangitis.",
        a: "<b>Hepatitis B</b>: <b>ground-glass hepatocytes</b> (cytoplasm filled with HBsAg). <b>Hepatitis C</b>: portal tract lymphoid aggregates and lobular microvesicular steatosis. <b>Alcoholic Hepatitis</b>: swollen hepatocytes containing eosinophilic <b>Mallory-Denk bodies</b> surrounded by neutrophils. <b>Primary Biliary Cholangitis</b>: portal tract granulomatous destruction of interlobular bile ducts (\"florid duct lesion\")."
      },
      {
        q: "Identify the characteristic light microscopy, immunofluorescence, and electron microscopy findings for Minimal Change Disease, Membranous Nephropathy, and Post-streptococcal Glomerulonephritis.",
        a: "<b>Minimal Change Disease</b>: normal light microscopy; negative IF; <b>effacement of podocyte foot processes</b> on EM. <b>Membranous Nephropathy</b>: thickened capillary wall with <b>\"spikes\" on silver stain</b>; granular IgG/C3 deposits on IF; <b>subepithelial deposits</b> on EM. <b>Post-streptococcal Glomerulonephritis</b>: hypercellular glomeruli with PMNs; granular \"lumpy-bumpy\" IgG/C3 on IF; <b>subepithelial \"humps\"</b> on EM."
      },
      {
        q: "Contrast the serum iron, total iron binding capacity (TIBC), ferritin, and transferrin saturation in Iron Deficiency Anemia, Anemia of Chronic Disease, and Hereditary Hemochromatosis.",
        a: "<b>Iron Deficiency Anemia</b>: low iron, <b>high TIBC</b>, <b>low ferritin</b> ($< 30\\\\text{ ng/mL}$), low transferrin saturation ($< 20\\%$). <b>Anemia of Chronic Disease</b>: low/normal iron, <b>low/normal TIBC</b>, <b>normal/high ferritin</b> (acute phase reactant), low/normal transferrin saturation. <b>Hemochromatosis</b>: high iron, low TIBC, <b>very high ferritin</b>, <b>high transferrin saturation ($> 45\text{--}50\\%$)</b>."
      },
      {
        q: "Differentiate the TSH and free T4 patterns in Primary Hypothyroidism, Subclinical Hypothyroidism, Primary Hyperthyroidism, and Central (Secondary) Hypothyroidism.",
        a: "<b>Primary Hypothyroidism</b>: <b>high TSH, low free T4</b>. <b>Subclinical Hypothyroidism</b>: <b>high TSH, normal free T4</b>. <b>Primary Hyperthyroidism</b>: <b>low TSH, high free T4</b>. <b>Central Hypothyroidism</b> (pituitary/hypothalamic failure): <b>low or normal TSH, low free T4</b>."
      },
      {
        q: "What is the classic cerebrospinal fluid (CSF) finding in a patient with Guillain-Barré Syndrome, and what is the term for this phenomenon?",
        a: "<b>Albuminocytologic dissociation</b> — characterized by <b>markedly elevated protein</b> levels ($100\text{--}1000\\\\text{ mg/dL}$) with a <b>completely normal white blood cell count</b> ($< 5\\\\text{ WBC/mcL}$)."
      },
      {
        q: "How do you interpret the following liver function test patterns: AST/ALT ratio > 2:1, AST and ALT > 1000 U/L, and elevated Alkaline Phosphatase with elevated GGT?",
        a: "<b>AST/ALT ratio $> 2:1$</b>: highly suggestive of <b>alcoholic liver disease</b> (alcohol suppresses hepatic Pyridoxal-5-phosphate/Vitamin B6, which is required for ALT synthesis). <b>AST & ALT $> 1000\\\\text{ U/L}$</b>: indicates <b>acute hepatocyte necrosis</b>; top causes are <b>acute viral hepatitis</b>, <b>ischemic hepatitis (\"shock liver\")</b>, or <b>acetaminophen/toxic injury</b>. <b>Elevated ALP + elevated GGT (Gamma-glutamyltransferase)</b>: confirms the elevated ALP is of <b>biliary origin</b> (cholestasis/obstruction) rather than bone origin."
      },
      {
        q: "Identify the clinical associations of the following erythrocyte abnormalities on a peripheral smear: Target cells, Schistocytes, Heinz bodies, and Howell-Jolly bodies.",
        a: "<b>Target cells</b>: thalassemias, sickle cell disease, liver disease, or splenectomy. <b>Schistocytes</b> (helmet cells): microangiopathic hemolytic anemia (<b>TTP, HUS, DIC</b>). <b>Heinz bodies</b>: <b>G6PD deficiency</b> (precipitated, denatured hemoglobin; visualized with crystal violet). <b>Howell-Jolly bodies</b>: functional hyposplenism or <b>splenectomy</b> (nuclear chromatin remnants normally removed by spleen)."
      },
      {
        q: "A 28-year-old female with SLE has new-onset hematuria and proteinuria. Renal biopsy shows diffuse proliferative glomerulonephritis (Class IV). What are the characteristic light microscopy and electron microscopy findings?",
        a: "Light microscopy shows hypercellular glomeruli with <b>\"wire loop\" capillary lesions</b> (thickening of basement membrane due to immune deposition). EM shows <b>subendothelial immune complex deposits</b>. (Requires aggressive treatment with corticosteroids + mycophenolate mofetil or cyclophosphamide)."
      },
      {
        q: "What are the three classic histopathological findings on a duodenal biopsy in a patient with Celiac disease?",
        a: "1) <b>Intraepithelial lymphocytosis</b> (increased lymphocytes in the mucosa). 2) <b>Crypt hyperplasia</b> (deepening of the crypts of Lieberkühn). 3) <b>Blunting and atrophy of the villi</b> (reducing surface area for absorption)."
      },
      {
        q: "A 52-year-old male with a 30 pack-year smoking history presents with painless, gross hematuria. Urinalysis shows $> 20$ RBCs/hpf. What is the next diagnostic workup, and why?",
        a: "The next step is a <b>cystoscopy</b> to directly visualize the bladder mucosa and a <b>CT urogram</b> to evaluate the kidneys and ureters. Painless gross hematuria in a patient $> 35$ with smoking history is <b>bladder cancer (urothelial carcinoma)</b> until proven otherwise."
      },
      {
        q: "A patient with chronic kidney disease presents with severe bone pain. Hand radiographs show subperiosteal bone resorption of the phalanges, and blood work shows elevated calcium, elevated PTH, and low phosphate. What is the bone disease and the biopsy appearance?",
        a: "<b>Osteitis fibrosa cystica</b> (caused by hyperparathyroidism). Biopsy shows bone resorption with fibrous tissue replacement and cystic spaces filled with blood and osteoclasts, known as <b>\"brown tumors\"</b>."
      },
      {
        q: "What is the clinical utility and limitation of B-type Natriuretic Peptide (BNP) in the evaluation of dyspnea, and how is it affected by obesity?",
        a: "BNP has high sensitivity; a value <b>$< 100\\\\text{ pg/mL}$</b> has a high negative predictive value to rule out acute decompensated heart failure. Limitations: BNP can be falsely elevated in <b>renal failure</b> (decreased clearance) and advanced age. Importantly, <b>obesity is associated with falsely lower BNP levels</b> due to increased clearance receptors on adipocytes."
      },
      {
        q: "Differentiate the histopathological biopsy findings of Crohn's disease and Ulcerative Colitis.",
        a: "<b>Crohn's disease</b>: <b>transmural inflammation</b> (involving all layers of the bowel wall), non-caseating granulomas, lymphoid aggregates, and fissuring ulcers. <b>Ulcerative Colitis</b>: inflammation <b>limited to the mucosa and submucosa</b>, prominent <b>crypt abscesses</b> (neutrophilic infiltration of crypts), mucosal congestion, and no granulomas."
      },
      {
        q: "A 64-year-old male is found to have a nodule on digital rectal exam (DRE) and a serum PSA of 7.2 ng/mL. What is the next step to establish the diagnosis?",
        a: "Perform a <b>transrectal (or transperineal) ultrasound-guided (TRUS) needle biopsy</b> of the prostate. A DRE nodule or elevated PSA requires tissue biopsy to confirm prostate cancer and determine the <b>Gleason score</b> for grading."
      },
      {
        q: "What are the current USPSTF screening guidelines for lung cancer, and what test is used?",
        a: "Annual screening with a <b>low-dose chest CT</b> in adults aged <b>50 to 80</b> who have a <b>$\\\\ge 20$ pack-year smoking history</b> AND currently smoke or have quit within the past 15 years. Discontinue screening once the person has not smoked for 15 years or develops a limiting life expectancy."
      },
      {
        q: "What is the initial screening test for primary aldosteronism (Conn's syndrome) in a hypertensive patient with hypokalemia, and what ratio is diagnostic?",
        a: "Measure morning <b>plasma aldosterone concentration (PAC)</b> and <b>plasma renin activity (PRA)</b>. A <b>$\\\\text{PAC}/\\\\text{PRA}$ ratio $> 20$</b> with an absolute PAC <b>$> 15\\\\text{ ng/dL}$</b> is a positive screen, indicating renin-independent aldosterone hypersecretion. Confirm with a saline infusion test."
      },
      {
        q: "Why can measuring G6PD enzyme activity during or immediately after an acute hemolytic episode yield a false-negative result, and what is the proper protocol?",
        a: "During an acute hemolytic flare, the older erythrocytes (which have the lowest G6PD enzyme levels and are most susceptible to hemolysis) are destroyed first. The remaining circulating cells are young red cells and reticulocytes, which have normal or elevated G6PD levels. The proper protocol is to <b>delay testing and measure G6PD activity 2–3 months after the acute episode</b> has completely resolved."
      }
    ]
  }
];

// 2. Perform the replacement in flash-cards.html
// We look for "        },]," which ends the year4 array, right before 'usmle1': []
const targetStr = '        },],';

// We want to format the new topics array as formatted JS code.
// We want to avoid using JSON.stringify for everything directly because we want control over the format (tabs, brackets).
// Let's write a simple formatter.
const formattedTopicsList = [];

newTopics.forEach((t) => {
  const cardsCode = t.cards.map(c => {
    // Escape backslashes in q and a so they are double-escaped in the output code.
    // In our JS object above, we wrote e.g. "$\\\\ge 3$". In memory, that is "$\\ge 3$".
    // When we stringify it, JSON.stringify("$\\ge 3$") will output "\"$\\\\ge 3$\"".
    // So JSON.stringify is perfect for preserving the backslashes!
    return `            { q: ${JSON.stringify(c.q)}, a: ${JSON.stringify(c.a)} }`;
  }).join(',\n');

  const topicBlock = `{
          section: ${JSON.stringify(t.section)},
          topic: ${JSON.stringify(t.topic)},
          icon: ${JSON.stringify(t.icon)},
          cards: [
${cardsCode}
          ]
        }`;
  formattedTopicsList.push(topicBlock);
});

// Since the new topics need to be appended after the last item of year4,
// we replace:
// "        },],"
// with:
// "        },\n        " + formattedTopicsList.join(',\n        ') + "],"
const replacement = '        },\n        ' + formattedTopicsList.join(',\n        ') + '],';

if (!htmlContent.includes(targetStr)) {
  console.error('ERROR: Could not find the target string "        },]," in flash-cards.html');
  process.exit(1);
}

// Keep a backup of the original html file
fs.writeFileSync(backupPath, htmlContent, 'utf8');
console.log('Created backup of flash-cards.html at flash-cards.html.bak');

const updatedHtmlContent = htmlContent.replace(targetStr, replacement);

// 3. Validate the syntax of the generated HTML content
const match = updatedHtmlContent.match(/const\s+FLASH_DATA\s*=\s*([\s\S]*?});/);
if (!match) {
  console.error('ERROR: Could not find FLASH_DATA definition in the updated HTML!');
  process.exit(1);
}

try {
  // Try to parse the FLASH_DATA definition to ensure it is valid JS syntax.
  // We replace 'const FLASH_DATA =' with 'var FLASH_DATA =' and evaluate it.
  const evalCode = match[0].replace('const FLASH_DATA =', 'global.FLASH_DATA =');
  eval(evalCode);
  console.log('FLASH_DATA syntax validation: SUCCESS!');
  
  if (global.FLASH_DATA && global.FLASH_DATA.year4) {
    const totalTopics = global.FLASH_DATA.year4.length;
    console.log(`Validation details: Total topics in year4 is now ${totalTopics}.`);
    
    // Print details of the last 5 topics
    const last5 = global.FLASH_DATA.year4.slice(-5);
    last5.forEach((t, idx) => {
      console.log(`  Inserted Topic ${idx + 1}: [${t.section}] "${t.topic}" -> ${t.cards.length} cards`);
    });
  } else {
    console.error('ERROR: global.FLASH_DATA is undefined or lacks year4!');
    process.exit(1);
  }
} catch (e) {
  console.error('ERROR: FLASH_DATA validation failed! Syntax error present in generated code.');
  console.error(e.message);
  process.exit(1);
}

// 4. Overwrite flash-cards.html if validation succeeds
fs.writeFileSync(htmlPath, updatedHtmlContent, 'utf8');
console.log('Successfully updated flash-cards.html!');
