BEGIN;

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM topics WHERE slug = 'neurology' LIMIT 1;

    -- CASE 01: Ischemic Stroke (ACA/MCA)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sudden Left-Sided Weakness', 'A 70-year-old male with a history of HTN and AFib presents with sudden-onset weakness in his left arm and face. He also has a "gaze preference" to the right.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the first imaging test that must be performed?', '["MRI Brain", "Non-contrast CT Head", "Carotid Ultrasound", "ECG"]', 1, 'CT head is needed immediately to rule out hemorrhage before considering thrombolytics.'),
    (v_case_id, 'Based on the arm and face weakness, which vessel is most likely involved?', '["Anterior Cerebral Artery (ACA)", "Middle Cerebral Artery (MCA)", "Posterior Cerebral Artery (PCA)", "Vertebrobasilar artery"]', 1, 'MCA supplies the lateral motor/sensory cortex (face and arm). ACA supplies the medial cortex (leg).'),
    (v_case_id, 'If the patient arrived 1 hour after symptom onset and CT is negative for blood, what is the best treatment?', '["Aspirin only", "IV Alteplase (tPA)", "Heparin", "Surgery"]', 1, 'tPA is indicated within the 3-4.5 hour window if no contraindications exist.');

    -- CASE 02: Hemorrhagic Stroke (Subarachnoid)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, '"Worst Headache of My Life"', 'A 50-year-old female presents with the sudden onset of an excruciating headache, which she describes as a "thunderclap." On exam, she has neck stiffness and is photophobic.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Migraine", "Subarachnoid Hemorrhage (SAH)", "Tension headache", "Meningitis"]', 1, '"Worst headache of life" = SAH until proven otherwise.'),
    (v_case_id, 'If the initial CT head is negative but suspicion remains high, what is the next step?', '["MRI", "Lumbar Puncture (LP)", "Repeat CT in 24h", "Discharge"]', 1, 'LP is the next step; look for xanthochromia (yellow tint from RBC breakdown).'),
    (v_case_id, 'What is the most common cause of non-traumatic SAH?', '["AVM", "Ruptured Saccular (Berry) Aneurysm", "Hypertension", "Coagulopathy"]', 1, 'Usually at the bifurcations in the Circle of Willis.');

    -- CASE 03: Parkinson Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Resting Tremor and "Pill-rolling"', 'A 65-year-old male presents with a "shaking" in his right hand that is most noticeable when he is watching TV. On exam, he has a masked face, a shuffling gait, and "cogwheel" rigidity.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying pathophysiology?', '["Loss of GABA neurons in the striatum", "Loss of dopaminergic neurons in the substantia nigra pars compacta", "Plaques and tangles", "Demyelination"]', 1, 'Leads to an imbalance in the basal ganglia pathways.'),
    (v_case_id, 'What is the gold-standard treatment for symptoms?', '["Donepezil", "Levodopa/Carbidopa", "Haloperidol", "Propranolol"]', 1, 'Levodopa is the precursor to dopamine; Carbidopa prevents peripheral conversion.'),
    (v_case_id, 'What is the name of the histological inclusion body seen in Parkinson''s?', '["Negri body", "Lewy body (alpha-synuclein)", "Neurofibrillary tangle", "Pick body"]', 1, 'Intracellular eosinophilic inclusions.');

    -- CASE 04: Multiple Sclerosis (MS)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Vision Loss and "Electric Shock" Sensation', 'A 28-year-old female presents with sudden painful loss of vision in her right eye. She also mentions that when she bends her neck forward, she feels an electric shock sensation down her back (Lhermitte sign).', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Stroke", "Multiple Sclerosis", "Brain tumor", "Guillain-Barre"]', 1, 'Dissemination of neurological deficits in time and space in a young female.'),
    (v_case_id, 'What is the finding on MRI of the brain?', '["Single large mass", "Periventricular white matter plaques (Dawson fingers)", "Hemorrhage", "Atrophy of the hippocampus"]', 1, 'Represent areas of focal demyelination.'),
    (v_case_id, 'What finding on CSF analysis is characteristic of MS?', '["High protein, normal cells", "Oligoclonal bands of IgG", "Low glucose", "Bacteria"]', 1, 'Indicates intrathecal antibody production.');

    -- CASE 05: Alzheimer Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Progressive Memory Loss in an 80-year-old', 'An 82-year-old female is brought by her daughter because she is getting lost in her own neighborhood and forgetting the names of her grandchildren. The symptoms have been worsening over 3 years.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Vascular dementia", "Alzheimer Disease", "Frontotemporal dementia", "Normal pressure hydrocephalus"]', 1, 'The most common cause of dementia in the elderly; insidious onset and progressive.'),
    (v_case_id, 'What are the two hallmark pathological findings?', '["Lewy bodies", "Extracellular Amyloid-beta plaques and intracellular Tau tangles", "Pick bodies", "Demyelination"]', 1, 'Neurofibrillary tangles (Tau) and Senile plaques (Amyloid).'),
    (v_case_id, 'Which class of medications is used to slow symptomatic decline?', '["Dopamine agonists", "Cholinesterase inhibitors (e.g., Donepezil)", "Antipsychotics", "Antibiotics"]', 1, 'Boosts acetylcholine levels in the brain.');

    -- CASE 06: Guillain-Barr\u00e9 Syndrome (GBS)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Ascending Paralysis after a Viral Illness', 'A 30-year-old male presents with "heavy" legs and difficulty walking. Over the next 24 hours, the weakness spreads to his arms. He had a diarrheal illness 2 weeks ago. On exam, he has absent deep tendon reflexes.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["MS", "Guillain-Barr\u00e9 Syndrome", "Myasthenia Gravis", "Botulism"]', 1, 'Acute inflammatory demyelinating polyneuropathy (AIDP).'),
    (v_case_id, 'Which organism is a common trigger for GBS?', '["Staph aureus", "Campylobacter jejuni", "E. coli", "HIV"]', 1, 'Molecular mimicry between bacterial LPS and peripheral nerve gangliosides.'),
    (v_case_id, 'What is the classic finding on CSF analysis (Albuminocytologic dissociation)?', '["High WBC, High protein", "Normal WBC, High protein", "Low WBC, Low protein", "Normal WBC, Normal protein"]', 1, 'High protein with a normal cell count.'),
    (v_case_id, 'What is the most important parameter to monitor in the hospital?', '["Heart rate", "Forced Vital Capacity (FVC) or Negative Inspiratory Force", "Urine output", "Pupils"]', 1, 'Respiratory failure is the most common life-threatening complication.');

    -- CASE 07: Myasthenia Gravis (MG)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Droopy Eyelids that Worsen as the Day Goes On', 'A 40-year-old female presents with double vision and "droopy" eyelids. She says the symptoms are minimal in the morning but get much worse by the evening. On exam, she has ptosis that worsens with sustained upward gaze.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying pathophysiology?', '["Autoantibodies against the Post-synaptic Acetylcholine Receptor", "Autoantibodies against the Pre-synaptic Calcium Channel", "Loss of neurons", "Demyelination"]', 0, 'Leads to impaired neuromuscular transmission.'),
    (v_case_id, 'MG is associated with which organ abnormality?', '["Thyroid nodule", "Thymic hyperplasia or Thymoma", "Adrenal mass", "Spleen mass"]', 1, 'The thymus is involved in the training of the auto-reactive T and B cells.'),
    (v_case_id, 'What is the first-line symptomatic treatment?', '["Prednisone", "Pyridostigmine (Acetylcholinesterase inhibitor)", "Surgery", "Plasmapheresis"]', 1, 'Increases the amount of ACh available at the NMJ.');

    -- CASE 08: Status Epilepticus
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Continuous Generalized Seizures', 'A 25-year-old male with known epilepsy is brought to the ER currently having a generalized tonic-clonic seizure. His mother says he has been seizing for at least 10 minutes.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the definition of Status Epilepticus?', '["Any seizure lasting > 30 seconds", "Continuous seizure activity for > 5 minutes or repeated seizures without recovery between", "Fainting once", "A 1-minute seizure"]', 1, 'A medical emergency requiring rapid intervention.'),
    (v_case_id, 'What is the FIRST-LINE medication to stop the acute seizure?', '["Phenytoin", "Benzodiazepines (e.g., Lorazepam or Diazepam)", "Valproic acid", "Levetiracetam"]', 1, 'Fast-acting GABA-A agonists.'),
    (v_case_id, 'What is the SECOND-LINE medication given to prevent recurrence after the initial benzo?', '["Fentanyl", "Phenytoin (or Fosphenytoin)", "Propofol", "Midazolam"]', 1, 'Longer-acting anti-epileptic drug.');

    -- CASE 09: Migraine Headache
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Unilateral Throbbing Headache with Nausea', 'A 30-year-old female presents with a severe "throbbing" headache on the left side of her head. She is nauseated and says the lights are "too bright." She sometimes sees "zigzag lines" before the pain starts.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The "zigzag lines" are an example of:', '["Aura", "Seizure", "Stroke", "Glaucoma"]', 0, 'Transient neurological symptoms preceding the headache.'),
    (v_case_id, 'What is the first-line medication for an ACUTE moderate-to-severe migraine?', '["Aspirin only", "Triptans (e.g., Sumatriptan)", "Propranolol", "Amitriptyline"]', 1, 'Triptans are 5-HT 1B/1D agonists that cause vasoconstriction and inhibit pro-inflammatory peptides.'),
    (v_case_id, 'Which of the following is a classic prophylactic medication for frequent migraines?', '["Sumatriptan", "Propranolol or Topiramate", "Acetaminophen", "Oxycodone"]', 1, 'Used to reduce frequency and severity.');

    -- CASE 10: Cluster Headache
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Excruciating Eye Pain with Tearing', 'A 40-year-old male presents with episodes of "suicide-level" pain behind his right eye. The pain lasts 30 minutes and occurs 3 times a day. During an episode, his right eye is red, tearing, and his eyelid droops.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Migraine", "Cluster Headache", "Tension headache", "Glaucoma"]', 1, 'Unilateral, short-duration, severe pain with autonomic symptoms.'),
    (v_case_id, 'What is the first-line treatment for an ACUTE cluster headache?', '["Acetaminophen", "100% High-flow Oxygen or Subcutaneous Sumatriptan", "Morphine", "Dark room only"]', 1, 'Oxygen is highly effective and safe.'),
    (v_case_id, 'What is the first-line agent for PROPHYLAXIS of cluster headaches?', '["Propranolol", "Verapamil", "Prednisone", "Lithium"]', 1, 'The drug of choice for prevention.');

    -- CASE 11: Normal Pressure Hydrocephalus (NPH)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, '"Wet, Wacky, and Wobbly"', 'A 75-year-old male is brought in for "acting strange." He has developed urinary incontinence, seems confused, and walks with a wide-based, "magnetic" gait as if his feet are glued to the floor.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic triad of NPH?', '["Fever, pain, rash", "Dementia, Gait instability, and Urinary Incontinence", "Headache, vomiting, papilledema", "None"]', 1, 'The 3 Ws: Wet, Wacky, Wobbly.'),
    (v_case_id, 'What is seen on brain MRI?', '["Atrophy only", "Ventriculomegaly out of proportion to atrophy", "Small brain", "Hemorrhage"]', 1, 'Enlarged ventricles despite a relatively normal cortex.'),
    (v_case_id, 'What is the definitive treatment?', '["Donepezil", "Ventriculoperitoneal (VP) Shunt", "Steroids", "Antibiotics"]', 1, 'Draining the excess CSF improves symptoms.');

    -- CASE 12: Bell''s Palsy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Entire Right Side of Face is Drooping', 'A 30-year-old male wakes up and realizes the right side of his face is "frozen." He cannot close his right eye or wrinkle his forehead on the right. His taste is also slightly metallic.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Stroke", "Bell''s Palsy", "Brain tumor", "MS"]', 1, 'Acute peripheral palsy of Cranial Nerve VII (Facial Nerve).'),
    (v_case_id, 'How is this distinguished from a central lesion (like a stroke)?', '["Stroke involves the forehead; Bell''s does not", "Bell''s involves the forehead; Stroke spares the forehead (due to bilateral innervation)", "Bell''s has leg weakness", "None"]', 1, 'Ability to wrinkle the forehead means the lesion is central (above the facial nucleus).'),
    (v_case_id, 'What is the standard treatment started within 72 hours?', '["Aspirin", "Prednisone (and possibly Acyclovir)", "Surgery", "Wait and see"]', 1, 'Steroids improve the rate of full recovery.');

    -- CASE 13: Trigeminal Neuralgia
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, '"Electric-shock" Pain in the Face', 'A 55-year-old female presents with episodes of brief, stabbing, "electric" pain on the right side of her jaw. The pain is triggered by light touch, brushing her teeth, or the wind.', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Which nerve is involved?', '["Facial nerve (CN VII)", "Trigeminal nerve (CN V)", "Glossopharyngeal (CN IX)", "Vagus (CN X)"]', 1, 'Specifically the V2 or V3 distribution usually.'),
    (v_case_id, 'What is the first-line medication for trigeminal neuralgia?', '["Oxycodone", "Carbamazepine", "Gabapentin", "Aspirin"]', 1, 'An anti-epileptic drug that stabilizes the nerve membranes.'),
    (v_case_id, 'Trigeminal neuralgia in a YOUNG patient (e.g., age 25) should raise suspicion for:', '["Lupus", "Multiple Sclerosis", "Diabetes", "Stroke"]', 1, 'Demyelination of the nerve root is a common early sign of MS.');

    -- CASE 14: Epidural Hematoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Head Injury with a "Lucid Interval"', 'A 20-year-old male is struck in the side of the head by a baseball. He is knocked out for 1 minute, wakes up and feels "fine," but 2 hours later he becomes rapidly drowsy and one pupil becomes dilated.', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Subdural Hematoma", "Epidural Hematoma", "Concussion", "SAH"]', 1, 'Classic "Lucid Interval" followed by rapid deterioration.'),
    (v_case_id, 'What vessel is most commonly ruptured?', '["Middle Cerebral Artery", "Middle Meningeal Artery", "Bridging veins", "Aorta"]', 1, 'Usually due to a fracture at the Pterion.'),
    (v_case_id, 'What is the characteristic shape on CT head?', '["Crescent-shaped", "Biconvex/Lens-shaped (Lentiform)", "Star-shaped", "Diffuse"]', 1, 'The blood is limited by the cranial sutures where the dura is tightly attached.');

    -- CASE 15: Subdural Hematoma
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Progressive Confusion in an Elderly Alcoholic', 'An 80-year-old male with a history of alcoholism presents with 2 weeks of progressive confusion and "frequent falls." He has no memory of a specific head injury.', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Alzheimer''s", "Subdural Hematoma", "Epidural Hematoma", "Stroke"]', 1, 'Chronic subdurals are common in the elderly/alcoholics due to brain atrophy.'),
    (v_case_id, 'What vessels are ruptured?', '["Arteries", "Bridging Veins", "Capillaries", "Ventricles"]', 1, 'Venous blood accumulates slowly as the veins are stretched across the atrophied space.'),
    (v_case_id, 'What is the characteristic shape on CT head?', '["Lens-shaped", "Crescent-shaped (follows the curve of the brain)", "Circle", "None"]', 1, 'Can cross suture lines but not the midline dural folds (falx).');

    -- CASE 16: Huntington Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dance-like Movements and Personality Changes', 'A 40-year-old male presents with "jerky" involuntary movements of his limbs (chorea) and new-onset irritability and depression. His father had similar symptoms and died in a mental institution at age 55.', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the genetic basis of Huntington Disease?', '["Trisomy 21", "CAG Trinucleotide Repeat Expansion (Autosomal Dominant)", "X-linked recessive", "Mitochondrial"]', 1, 'Occurs on chromosome 4; exhibits "anticipation" (worsens in future generations).'),
    (v_case_id, 'What is the hallmark finding on brain imaging?', '["Atrophy of the hippocampus", "Atrophy of the Caudate Nucleus", "Enlarged frontal lobes", "Normal brain"]', 1, 'Leads to "boxcar" ventricles (enlarged lateral ventricles).'),
    (v_case_id, 'Huntington disease involves the loss of which type of neurons?', '["Dopaminergic", "GABAergic neurons in the striatum", "Cholinergic", "Motor neurons"]', 1, 'Loss of the inhibitory "indirect pathway."');

    -- CASE 17: Amyotrophic Lateral Sclerosis (ALS)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Upper and Lower Motor Neuron Signs', 'A 55-year-old male presents with progressive weakness and muscle wasting in his hands (LMN signs) along with stiffness and hyperreflexia in his legs (UMN signs). His sensation and eye movements are normal.', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["MS", "ALS (Lou Gehrig''s Disease)", "Parkinson''s", "GBS"]', 1, 'Pure motor disease involving both Upper and Lower motor neurons.'),
    (v_case_id, 'Which of the following is typically SPARED in ALS?', '["Arm muscles", "Eye movements and Sensation", "Diaphragm", "Tongue"]', 1, 'A key diagnostic feature.'),
    (v_case_id, 'What is the only medication proven to slightly extend survival in ALS?', '["Levodopa", "Riluzole", "Interferon", "Prednisone"]', 1, 'A glutamate antagonist.');

    -- CASE 18: Wernicke Encephalopathy
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Ataxia, Confusion, and Eye Movement Problems', 'A 50-year-old alcoholic male is brought to the ER confused. On exam, he has a "wobbly" gait and cannot move his eyes laterally (ophthalmoplegia).', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the underlying deficiency?', '["Vitamin B12", "Vitamin B1 (Thiamine)", "Vitamin B3", "Folate"]', 1, 'Common in chronic alcoholism and malabsorption.'),
    (v_case_id, 'What is the classic triad of Wernicke?', '["Fever, pain, rash", "Ataxia, Confusion, and Ophthalmoplegia", "Tremor, rigidity, bradykinesia", "None"]', 1, 'A medical emergency.'),
    (v_case_id, 'In the ER, why must you give Thiamine BEFORE Glucose in these patients?', '["Glucose is toxic", "Glucose can trigger Wernicke/Korsakoff by consuming the last bits of thiamine in glycolysis", "Thiamine tastes better", "None"]', 1, 'Glucose-induced thiamine depletion can precipitate acute encephalopathy.');

    -- CASE 19: Korsakoff Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, '"Making up" Stories to Fill Memory Gaps', 'A 55-year-old male with long-term alcohol use has severe short-term memory loss. He often "fills in" the gaps in his memory with elaborate, believable but false stories (confabulation).', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is this behavior called?', '["Lying", "Confabulation", "Aura", "Aphasia"]', 1, 'A hallmark of Korsakoff syndrome.'),
    (v_case_id, 'What brain structure is typically damaged in this syndrome?', '["Hippocampus", "Mammillary bodies", "Cerebellum", "Occipital lobe"]', 1, 'Visible on MRI; often occurs as a progression from Wernicke encephalopathy.'),
    (v_case_id, 'Is Korsakoff syndrome reversible with thiamine?', '["Yes, always", "Usually irreversible or only partially reversible", "No, never", "None"]', 1, 'Unlike Wernicke, Korsakoff is a permanent chronic memory disorder.');

    -- CASE 20: Transient Ischemic Attack (TIA)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Brief Episode of Blindness in One Eye', 'A 65-year-old smoker with HTN presents with a 10-minute episode of "a curtain falling" over his right eye. His vision returned to normal completely. He has no other symptoms.', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the clinical term for this "curtain" vision loss?', '["Glaucoma", "Amaurosis Fugax", "Papilledema", "Scotoma"]', 1, 'A form of TIA involving the retinal artery.'),
    (v_case_id, 'A TIA is defined by symptoms that resolve within:', '["1 minute", "24 hours (most < 1 hour)", "1 week", "Forever"]', 1, 'By definition, no permanent infarction occurs.'),
    (v_case_id, 'What is the most important test to find the source of the embolus in this patient?', '["CT Head", "Carotid Ultrasound", "ECG", "Blood culture"]', 1, 'Amaurosis fugax is often caused by an embolus from an atherosclerotic carotid artery.');

    -- CASE 21: Creutzfeldt-Jakob Disease (CJD)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Rapidly Progressive Dementia and Myoclonus', 'A 60-year-old male presents with memory loss that has become severe over just 3 months. He has also developed sudden "startle" movements (myoclonus) and ataxia. EEG shows "periodic sharp waves."', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Alzheimer''s", "Creutzfeldt-Jakob Disease (CJD)", "Parkinson''s", "Neurosyphilis"]', 1, 'A prion disease (Spongiform Encephalopathy).'),
    (v_case_id, 'What is a "Prion"?', '["A virus", "An abnormally folded protein that induces other proteins to fold abnormally", "A bacterium", "A fungus"]', 1, 'PrPsc replaces PrPc.'),
    (v_case_id, 'What is the typical prognosis for CJD?', '["Curable with antibiotics", "Uniformly fatal, usually within 1 year", "Long-term survival", "None"]', 1, 'Extremely rapid and aggressive decline.');

    -- CASE 22: Benign Paroxysmal Positional Vertigo (BPPV)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dizziness when Rolling Over in Bed', 'A 45-year-old female presents with episodes of "the room spinning" that last about 30 seconds. The episodes occur whenever she turns her head quickly or rolls over in bed. She has no hearing loss.', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Meniere Disease", "BPPV", "Acoustic Neuroma", "Stroke"]', 1, 'Short-lived positional vertigo.'),
    (v_case_id, 'What diagnostic maneuver is used to confirm BPPV?', '["Epley maneuver", "Dix-Hallpike maneuver", "Schober test", "Romberg test"]', 1, 'Changing head position to trigger nystagmus.'),
    (v_case_id, 'What is the underlying cause of BPPV?', '["Infection", "Dislodged otoliths (calcium carbonate crystals) in the semicircular canals", "Too much fluid", "Tumor"]', 1, 'Canalithiasis.');

    -- CASE 23: Meniere Disease
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Vertigo, Hearing Loss, and Tinnitus', 'A 50-year-old male presents with episodes of severe vertigo lasting 4 hours, associated with a "ringing" in his left ear and a feeling of "fullness" in that ear. He notes his hearing in the left ear is getting worse.', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the classic triad of Meniere Disease?', '["Fever, pain, rash", "Vertigo, Sensorineural Hearing Loss, and Tinnitus", "Headache, nausea, photophobia", "None"]', 1, 'Also includes aural fullness.'),
    (v_case_id, 'What is the underlying pathophysiology?', '["Crystals", "Excess endolymphatic fluid (Endolymphatic hydrops)", "Infection", "Nerve tumor"]', 1, 'Leads to increased pressure in the inner ear.'),
    (v_case_id, 'What is the recommended dietary management for Meniere''s?', '["High salt diet", "Low salt diet and avoiding caffeine/alcohol", "High protein", "None"]', 1, 'Helps reduce fluid retention in the inner ear.');

    -- CASE 24: Acoustic Neuroma (Vestibular Schwannoma)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Progressive Unilateral Hearing Loss', 'A 45-year-old female presents with progressive hearing loss in her right ear over 2 years. She also has constant ringing in that ear. On exam, she has a decreased corneal reflex on the right.', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Meniere''s", "Acoustic Neuroma", "BPPV", "Labyrinthitis"]', 1, 'A tumor of the 8th cranial nerve at the cerebellopontine angle.'),
    (v_case_id, 'Bilateral acoustic neuromas are a hallmark of which genetic condition?', '["Neurofibromatosis Type 1", "Neurofibromatosis Type 2", "Tuberous Sclerosis", "VHL"]', 1, 'NF2 = "2" ears.'),
    (v_case_id, 'What is the best imaging test for diagnosis?', '["CT Head", "MRI Brain with Gadolinium focusing on the internal auditory canal", "X-ray", "Echo"]', 1, 'MRI is highly sensitive for these tumors.');

    -- CASE 25: Absense Seizures
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, '"Daydreaming" in a 7-year-old', 'A 7-year-old girl is brought in because her teacher says she "checks out" multiple times a day for about 10 seconds. She stops talking, stares blankly, and then resumes as if nothing happened. She does not fall or shake.', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["ADHD", "Absence Seizures (Petit Mal)", "Generalized Tonic-Clonic", "Fainting"]', 1, 'Brief loss of consciousness without loss of tone or post-ictal state.'),
    (v_case_id, 'What is the classic EEG finding?', '["Periodic sharp waves", "3-Hz Spike-and-Wave discharges", "Flat line", "Normal"]', 1, 'Diagnostic for absence epilepsy.'),
    (v_case_id, 'What is the first-line medication for absence seizures?', '["Phenytoin", "Ethosuximide", "Diazepam", "Levetiracetam"]', 1, 'Blocks T-type calcium channels in the thalamus.');

    -- CASE 26: Temporal Lobe Epilepsy (Complex Partial)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Lip-smacking and Confusion', 'A 30-year-old male presents with episodes where he smells "burnt toast," then starts smacking his lips and picking at his shirt for 2 minutes. He is confused for 10 minutes afterward and doesn''t remember the event.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name for the repetitive behaviors like lip-smacking?', '["Aura", "Automatisms", "Clonus", "Tics"]', 1, 'Common in focal seizures with impaired awareness.'),
    (v_case_id, 'The "burnt toast" smell is an example of a:', '["Visual aura", "Olfactory aura", "Hallucination", "Stroke"]', 1, 'Often indicates the seizure originates in the temporal lobe (uncus).'),
    (v_case_id, 'What is the classification of this seizure?', '["Absence", "Focal Seizure with Impaired Awareness (Complex Partial)", "Simple Partial", "Generalized"]', 1, 'Focal onset with loss of awareness.');

    -- CASE 27: Brain Abscess
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Headache and Focal Deficits in a Patient with Cyanotic Heart Disease', 'A 10-year-old with Tetralogy of Fallot presents with a severe headache and weakness in his left arm. MRI shows a single ring-enhancing lesion in the right frontal lobe.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Brain tumor", "Brain Abscess", "Stroke", "MS"]', 1, 'Cyanotic heart disease allows bacteria to bypass the lungs (right-to-left shunt) and reach the brain.'),
    (v_case_id, 'What is the most common source of brain abscess in an otherwise healthy adult?', '["Heart", "Direct spread from Sinusitis or Otitis Media", "Lungs", "Skin"]', 1, 'Adjacent infection of the sinuses or ears.'),
    (v_case_id, 'What is the initial management for a large, symptomatic abscess?', '["Antibiotics only", "Surgical aspiration/drainage and IV antibiotics", "Radiation", "Steroids only"]', 1, 'Drainage is needed for diagnosis and to reduce mass effect.');

    -- CASE 28: Intracranial Hypertension (Pseudotumor Cerebri)
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Headache and Vision Blurring in an Obese Female', 'A 25-year-old obese female presents with daily headaches and brief "blackouts" of her vision when she stands up. On eye exam, her optic discs are swollen (papilledema). MRI is normal.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Brain tumor", "Idiopathic Intracranial Hypertension (IIH)", "Migraine", "Meningitis"]', 1, 'High CSF pressure without a mass or obstruction.'),
    (v_case_id, 'What is the most important risk of untreated IIH?', '["Stroke", "Permanent vision loss (Optic atrophy)", "Seizures", "None"]', 1, 'Chronic pressure on the optic nerve causes damage.'),
    (v_case_id, 'Which medication is often used to lower CSF production?', '["Acetazolamide", "Prednisone", "Furosemide", "Donepezil"]', 0, 'A carbonic anhydrase inhibitor.');

    -- CASE 29: Cauda Equina Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Back Pain and "Saddle" Anesthesia', 'A 45-year-old male with a history of back pain presents with a new "numbness" between his legs and difficulty starting his stream of urine. On exam, he has decreased anal sphincter tone.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the most likely diagnosis?', '["Herniated disc only", "Cauda Equina Syndrome", "Kidney stone", "Prostatitis"]', 1, 'Compression of the nerve roots below the level of the spinal cord (L2).'),
    (v_case_id, 'What is the most urgent next step?', '["Physical therapy", "Emergent MRI of the spine", "Pain meds", "Wait 24 hours"]', 1, 'A surgical emergency; time is critical to prevent permanent bowel/bladder dysfunction.'),
    (v_case_id, '"Saddle anesthesia" involves which dermatomes?', '["T10", "S2-S5", "L1-L2", "C5-C6"]', 1, 'Innervation of the perineum.');

    -- CASE 30: Brown-S\u00e9quard Syndrome
    INSERT INTO case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hemisection of the Spinal Cord', 'A 25-year-old male is stabbed in the back. On exam, he has loss of motor function and vibration sense on the RIGHT side below the injury, and loss of pain and temperature sense on the LEFT side.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'What is the name of this syndrome?', '["Central Cord Syndrome", "Brown-S\u00e9quard Syndrome", "Anterior Cord Syndrome", "Complete transection"]', 1, 'Spinal cord hemisection.'),
    (v_case_id, 'Why is pain/temperature loss on the OPPOSITE side of the injury?', '["The nerves don''t cross", "The Spinothalamic tract crosses at the level of the spinal cord", "The lab made a mistake", "None"]', 1, 'The Dorsal Columns (vibration/proprioception) and Corticospinal tract (motor) cross in the medulla (above the injury).'),
    (v_case_id, 'What is the primary cause of Brown-S\u00e9quard?', '["Stroke", "Penetrating trauma (e.g., stab or gunshot)", "Vitamin deficiency", "MS"]', 1, 'Classic cause of hemisection.');

    RAISE NOTICE 'SUCCESS: Neurology Case Blocks (1-30) registered.';
END $$;

COMMIT;
