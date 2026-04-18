-- ==========================================
-- Insert 'NEUROANATOMY' Cases
-- ==========================================

DO $$
DECLARE
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM public.topics WHERE title = 'NEUROANATOMY';
    
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic NEUROANATOMY not found! Run the topic creation scripts first.';
    END IF;
    
    -- Specific logic to clear existing Cases for this topic to avoid duplicates
    DELETE FROM public.case_studies WHERE topic_id = v_topic_id;

    -- Case 1
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Brown-Séquard Syndrome (USMLE)', 'A 30-year-old man is stabbed in the right side of the spinal cord at T10. He develops weakness on the right side below the lesion and loss of pain and temperature on the left side.', 1)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Diagnosis?', '["Central cord syndrome", "Brown-S\u00e9quard syndrome", "Anterior cord syndrome", "Tabes dorsalis"]'::jsonb, 1, '', 1);
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Which tract causes ipsilateral weakness?', '["Spinothalamic", "Corticospinal", "Dorsal column", "Reticulospinal"]'::jsonb, 1, '', 2);
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Pain loss on opposite side is due to crossing of which tract?', '["Corticospinal", "Spinothalamic", "Dorsal column", "Vestibulospinal"]'::jsonb, 1, '', 3);

    -- Case 2
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Anterior Cord Syndrome (USMLE)', 'A patient loses motor function and pain/temperature below T8 but retains vibration and position sense.', 2)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Which artery is likely affected?', '["Posterior spinal artery", "Anterior spinal artery", "Vertebral artery", "Basilar artery"]'::jsonb, 1, '', 1);
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Which tract is spared?', '["Corticospinal", "Spinothalamic", "Dorsal column", "Reticulospinal"]'::jsonb, 2, '', 2);

    -- Case 3
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Posterior Cord Syndrome (USMLE)', 'A patient has loss of proprioception but intact motor and pain sensation.', 3)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Which tract is affected?', '["Spinothalamic", "Corticospinal", "Dorsal column", "Rubrospinal"]'::jsonb, 2, '', 1);
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Function lost?', '["Pain", "Motor", "Position sense", "Temperature"]'::jsonb, 2, '', 2);

    -- Case 4
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Syringomyelia (USMLE)', 'A patient presents with bilateral loss of pain and temperature in a “cape-like” distribution.', 4)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Which structure is affected?', '["Dorsal column", "Anterior white commissure", "Corticospinal tract", "Cerebellum"]'::jsonb, 1, '', 1);
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Which tract is first affected?', '["Spinothalamic", "Corticospinal", "Dorsal column", "Vestibulospinal"]'::jsonb, 0, '', 2);

    -- Case 5
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Lateral Medullary Syndrome (Wallenberg) (USMLE)', 'A patient presents with loss of pain on opposite body and same side face, difficulty swallowing, and hoarseness.', 5)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Which artery is occluded?', '["Anterior spinal", "Posterior inferior cerebellar artery (PICA)", "Basilar", "Superior cerebellar"]'::jsonb, 1, '', 1);
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Which nerve explains dysphagia?', '["CN V", "CN VII", "CN IX/X", "CN XII"]'::jsonb, 2, '', 2);

    -- Case 6
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Medial Medullary Syndrome (USMLE)', 'A patient has contralateral paralysis and loss of vibration with tongue deviation.', 6)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Which artery?', '["PICA", "Anterior spinal artery", "Basilar", "Vertebral"]'::jsonb, 1, '', 1);
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Which nerve causes tongue deviation?', '["CN IX", "CN X", "CN XI", "CN XII"]'::jsonb, 3, '', 2);

    -- Case 7
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Parkinson Disease (USMLE)', 'A patient presents with resting tremor, rigidity, and bradykinesia.', 7)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Which structure is affected?', '["Cerebellum", "Substantia nigra", "Thalamus", "Hippocampus"]'::jsonb, 1, '', 1);
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Neurotransmitter deficiency?', '["Acetylcholine", "Dopamine", "GABA", "Serotonin"]'::jsonb, 1, '', 2);

    -- Case 8
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cerebellar Lesion (USMLE)', 'A patient has ataxia and intention tremor.', 8)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Which side shows deficit?', '["Opposite side", "Same side", "Both sides", "None"]'::jsonb, 1, '', 1);
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Which function is impaired?', '["Strength", "Coordination", "Sensation", "Memory"]'::jsonb, 1, '', 2);

    -- Case 9
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Multiple Sclerosis (USMLE)', 'A young woman has visual disturbances and weakness with plaques in CNS.', 9)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'What is affected?', '["Axons", "Myelin", "Neurons only", "Muscles"]'::jsonb, 1, '', 1);

    -- Case 10
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'ALS (USMLE)', 'A patient shows both UMN and LMN signs.', 10)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Which tracts are involved?', '["Sensory only", "Motor only (UMN + LMN)", "Autonomic only", "Cerebellar only"]'::jsonb, 1, '', 1);

    -- Case 11
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Bell’s Palsy (USMLE)', 'Facial droop on one side.', 11)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Which nerve?', '["CN V", "CN VII", "CN IX", "CN XII"]'::jsonb, 1, '', 1);

    -- Case 12
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Third Nerve Palsy (USMLE)', 'Ptosis, “down and out” eye.', 12)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Which nerve?', '["CN III", "CN IV", "CN VI", "CN II"]'::jsonb, 0, '', 1);

    -- Case 13
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Upper Motor Neuron Lesion', 'Spastic paralysis', 13)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Regarding Upper Motor Neuron Lesion: Spastic paralysis', '["Corticospinal tract damage", "Parietal lobe involvement", "Optic chiasm lesion", "CN + body involvement"]'::jsonb, 0, '', 1);

    -- Case 14
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Lower Motor Neuron Lesion', 'Flaccid paralysis', 14)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Regarding Lower Motor Neuron Lesion: Flaccid paralysis', '["Parasympathetic pathways", "Corticospinal tract damage", "Peripheral nerve involvement", "Sensory or motor limb damage"]'::jsonb, 2, '', 1);

    -- Case 15
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Reflex Arc', 'Loss of reflex', 15)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Regarding Reflex Arc: Loss of reflex', '["Parietal lobe involvement", "Optic chiasm lesion", "Sensory or motor limb damage", "Motor control circuits"]'::jsonb, 2, '', 1);

    -- Case 16
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Dorsal Column Pathway', 'Loss of vibration', 16)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Regarding Dorsal Column Pathway: Loss of vibration', '["Parietal lobe involvement", "Corticospinal tract damage", "Posterior column lesion", "Ptosis + miosis"]'::jsonb, 2, '', 1);

    -- Case 17
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Spinothalamic Pathway', 'Loss of pain/temp', 17)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Regarding Spinothalamic Pathway: Loss of pain/temp', '["Optic chiasm lesion", "Corticospinal tract damage", "Corticospinal fibers", "Crossing at spinal level"]'::jsonb, 3, '', 1);

    -- Case 18
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Visual Pathway', 'Bitemporal hemianopia', 18)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Regarding Visual Pathway: Bitemporal hemianopia', '["Corticospinal tract damage", "CN + body involvement", "Optic chiasm lesion", "Crossing at spinal level"]'::jsonb, 2, '', 1);

    -- Case 19
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Internal Capsule Stroke', 'Dense hemiplegia', 19)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Regarding Internal Capsule Stroke: Dense hemiplegia', '["Crossing at spinal level", "Optic chiasm lesion", "Peripheral nerve involvement", "Corticospinal fibers"]'::jsonb, 3, '', 1);

    -- Case 20
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Basal Ganglia Disorder', 'Involuntary movements', 20)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Regarding Basal Ganglia Disorder: Involuntary movements', '["Crossing at spinal level", "Parietal lobe involvement", "Motor control circuits", "Ptosis + miosis"]'::jsonb, 2, '', 1);

    -- Case 21
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Cerebellar Hemisphere', 'Ipsilateral ataxia', 21)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Regarding Cerebellar Hemisphere: Ipsilateral ataxia', '["Peripheral nerve involvement", "Posterior column lesion", "Parasympathetic pathways", "Coordination deficit"]'::jsonb, 3, '', 1);

    -- Case 22
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Brainstem Lesion', 'Crossed deficits', 22)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Regarding Brainstem Lesion: Crossed deficits', '["Coordination deficit", "CN + body involvement", "Ptosis + miosis", "Sensory or motor limb damage"]'::jsonb, 1, '', 1);

    -- Case 23
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sympathetic Lesion', 'Horner syndrome', 23)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Regarding Sympathetic Lesion: Horner syndrome', '["Coordination deficit", "Parasympathetic pathways", "Ptosis + miosis", "Posterior column lesion"]'::jsonb, 2, '', 1);

    -- Case 24
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Autonomic Dysfunction', 'Bladder issues', 24)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Regarding Autonomic Dysfunction: Bladder issues', '["Motor control circuits", "Parasympathetic pathways", "Optic chiasm lesion", "Posterior column lesion"]'::jsonb, 1, '', 1);

    -- Case 25
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Sensory Cortex Lesion', 'Loss of fine touch', 25)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Regarding Sensory Cortex Lesion: Loss of fine touch', '["CN + body involvement", "Corticospinal tract damage", "Sensory or motor limb damage", "Parietal lobe involvement"]'::jsonb, 3, '', 1);

    -- Case 26
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Optic Chiasm Compression', 'A patient has progressive loss of peripheral vision in both eyes.', 26)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Diagnosis?', '["Homonymous hemianopia", "Bitemporal hemianopia", "Quadrantanopia", "Monocular blindness"]'::jsonb, 1, '', 1);
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Structure compressed?', '["Optic nerve", "Optic chiasm", "Optic tract", "Lateral geniculate body"]'::jsonb, 1, '', 2);

    -- Case 27
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Optic Tract Lesion', 'Loss of vision in the same side of visual field of both eyes.', 27)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Defect?', '["Bitemporal", "Homonymous hemianopia", "Monocular", "Central scotoma"]'::jsonb, 1, '', 1);
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Structure?', '["Optic nerve", "Optic chiasm", "Optic tract", "Retina"]'::jsonb, 2, '', 2);

    -- Case 28
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Lateral Geniculate Lesion', 'Visual loss after thalamic lesion.', 28)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Structure affected?', '["Optic radiation", "Lateral geniculate body", "Superior colliculus", "Retina"]'::jsonb, 1, '', 1);

    -- Case 29
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Meyer’s Loop Lesion', 'Patient loses upper quadrant vision.', 29)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Defect?', '["Inferior quadrantanopia", "Superior quadrantanopia", "Hemianopia", "Scotoma"]'::jsonb, 1, '', 1);
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Location?', '["Parietal lobe", "Temporal lobe", "Occipital lobe", "Brainstem"]'::jsonb, 1, '', 2);

    -- Case 30
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Occipital Cortex Stroke', 'Visual loss with macular sparing.', 30)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Cause?', '["MCA stroke", "PCA stroke", "ACA stroke", "Basilar stroke"]'::jsonb, 1, '', 1);

    -- Case 31
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Internal Capsule Lesion', 'Sudden dense hemiplegia.', 31)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Structure?', '["Cerebellum", "Internal capsule", "Medulla", "Thalamus"]'::jsonb, 1, '', 1);
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Why severe deficit?', '["Few fibers", "All motor fibers concentrated", "Sensory only", "Cranial only"]'::jsonb, 1, '', 2);

    -- Case 32
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Thalamic Lesion', 'Patient loses all sensory input from one side.', 32)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Structure?', '["Cerebellum", "Thalamus", "Hypothalamus", "Cortex"]'::jsonb, 1, '', 1);

    -- Case 33
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hypothalamic Dysfunction', 'Patient has temperature dysregulation and hormonal imbalance.', 33)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Structure?', '["Thalamus", "Hypothalamus", "Pituitary", "Pineal"]'::jsonb, 1, '', 1);

    -- Case 34
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Limbic System Lesion', 'Patient shows memory loss and emotional instability.', 34)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Structure?', '["Cerebellum", "Hippocampus", "Medulla", "Pons"]'::jsonb, 1, '', 1);

    -- Case 35
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Amygdala Damage', 'Patient loses fear response.', 35)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Structure?', '["Hippocampus", "Amygdala", "Thalamus", "Cortex"]'::jsonb, 1, '', 1);

    -- Case 36
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Hydrocephalus', 'Dilated ventricles due to CSF blockage.', 36)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'CSF produced by?', '["Neurons", "Choroid plexus", "Glia", "Ependyma only"]'::jsonb, 1, '', 1);
    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'CSF flows from lateral ventricle via?', '["Aqueduct", "Foramen of Monro", "Foramen of Luschka", "Foramen of Magendie"]'::jsonb, 1, '', 2);

    -- Case 37
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Aqueductal Stenosis', 'Block between 3rd and 4th ventricle.', 37)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Structure?', '["Foramen of Monro", "Cerebral aqueduct", "Foramen of Luschka", "Fourth ventricle"]'::jsonb, 1, '', 1);

    -- Case 38
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Meningitis', 'Inflammation of meninges.', 38)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Layers involved?', '["Bone only", "Dura, arachnoid, pia", "Cortex only", "Ventricles only"]'::jsonb, 1, '', 1);

    -- Case 39
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Subdural Hematoma', 'Slow bleed after trauma.', 39)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Vessel?', '["Artery", "Bridging veins", "Capillaries", "Sinuses"]'::jsonb, 1, '', 1);

    -- Case 40
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Subarachnoid Hemorrhage', 'Sudden severe headache.', 40)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Cause?', '["Trauma only", "Berry aneurysm rupture", "Tumor", "Infection"]'::jsonb, 1, '', 1);

    -- Case 41
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Basilar Artery Stroke', 'Locked-in syndrome.', 41)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Function lost?', '["Consciousness", "Movement", "Vision", "Hearing"]'::jsonb, 1, '', 1);

    -- Case 42
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Midbrain Lesion', 'Ptosis and dilated pupil.', 42)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Nerve?', '["CN III", "CN IV", "CN VI", "CN VII"]'::jsonb, 0, '', 1);

    -- Case 43
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Pons Lesion', 'Facial paralysis + abducens involvement.', 43)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Nerves?', '["III + IV", "V + VI", "VI + VII", "IX + X"]'::jsonb, 2, '', 1);

    -- Case 44
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Medullary Lesion', 'Autonomic failure and respiratory issues.', 44)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'Function?', '["Motor only", "Vital centers", "Sensory only", "Vision"]'::jsonb, 1, '', 1);

    -- Case 45
    INSERT INTO public.case_studies (topic_id, title, scenario, "order")
    VALUES (v_topic_id, 'Autonomic Dysfunction', 'Loss of sweating and pupil control.', 45)
    RETURNING id INTO v_case_id;

    INSERT INTO public.case_questions (case_id, question, options, correct_index, explanation, "order")
    VALUES (v_case_id, 'System?', '["Somatic", "Sympathetic", "Parasympathetic", "Motor cortex"]'::jsonb, 1, '', 1);

END $$;