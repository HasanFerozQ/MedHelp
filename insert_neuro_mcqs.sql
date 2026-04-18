-- ==========================================
-- Insert 'NEUROANATOMY' MCQs
-- ==========================================

DO $$
DECLARE
    v_topic_id UUID;
BEGIN
    SELECT id INTO v_topic_id FROM public.topics WHERE title = 'NEUROANATOMY';
    
    IF v_topic_id IS NULL THEN
        RAISE EXCEPTION 'Topic NEUROANATOMY not found!';
    END IF;
    
    -- Specific logic to clear existing NEUROANATOMY MCQs to avoid duplicates
    DELETE FROM public.mcqs WHERE topic_id = v_topic_id;
    
    -- Insert MCQs

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of the right corticospinal tract above the pyramidal decussation causes weakness on the:', '["Right side", "Left side", "Both sides", "Face only"]'::jsonb, 1, 'Corticospinal fibers cross in the lower medulla, so lesions above decussation cause contralateral weakness.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The pyramidal decussation occurs in the:', '["Midbrain", "Pons", "Medulla", "Spinal cord"]'::jsonb, 2, 'Most corticospinal fibers cross in the caudal medulla.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The dorsal columns carry:', '["Pain and temperature", "Crude touch only", "Vibration and proprioception", "Motor signals"]'::jsonb, 2, 'Dorsal columns transmit fine touch, vibration, and conscious proprioception.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The spinothalamic tract carries:', '["Motor commands", "Pain and temperature", "Vibration", "Hearing"]'::jsonb, 1, 'The anterolateral system transmits pain and temperature.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Pain and temperature fibers usually cross within:', '["Medulla", "Pons", "One or two spinal segments", "Thalamus"]'::jsonb, 2, 'Spinothalamic fibers cross via the anterior white commissure near their entry level.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A patient has ipsilateral loss of vibration and proprioception below a spinal lesion. Which tract is affected?', '["Spinothalamic", "Corticospinal", "Dorsal column", "Reticulospinal"]'::jsonb, 2, 'Dorsal column lesions cause ipsilateral loss below the lesion in the spinal cord.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of the anterior white commissure most likely causes:', '["Loss of motor function only", "Bilateral loss of pain and temperature at the level of lesion", "Loss of proprioception", "Contralateral hemianopia"]'::jsonb, 1, 'Spinothalamic fibers cross in the anterior white commissure.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Brown-Séquard syndrome classically causes contralateral loss of:', '["Motor function", "Vibration sense", "Pain and temperature", "Proprioception"]'::jsonb, 2, 'Spinothalamic fibers cross, so hemisection causes contralateral pain/temp loss below the lesion.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Brown-Séquard syndrome causes ipsilateral weakness because of damage to the:', '["Spinothalamic tract", "Corticospinal tract", "Spinocerebellar tract", "Medial lemniscus"]'::jsonb, 1, 'The lateral corticospinal tract descends ipsilaterally in the cord after decussating in medulla.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of the dorsal columns in the spinal cord causes loss of:', '["Pain and temperature", "Fine touch and vibration", "Hearing", "Smell"]'::jsonb, 1, 'Dorsal columns carry fine touch, vibration, and position sense.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The first-order neuron cell bodies of the dorsal column pathway are located in the:', '["Ventral horn", "Dorsal horn", "Dorsal root ganglion", "Thalamus"]'::jsonb, 2, 'Primary sensory neuron cell bodies are in dorsal root ganglia.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The dorsal column fibers synapse first in the:', '["Ventral posterior nucleus", "Nucleus gracilis and cuneatus", "Caudate nucleus", "Red nucleus"]'::jsonb, 1, 'First synapse is in gracile and cuneate nuclei in the medulla.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The tract carrying voluntary motor fibers from cortex to spinal cord is the:', '["Spinothalamic", "Corticospinal", "Vestibulospinal", "Spinocerebellar"]'::jsonb, 1, 'The corticospinal tract mediates voluntary movement.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The lateral corticospinal tract primarily controls:', '["Eye movement", "Distal limb movement", "Hearing", "Visceral sensation"]'::jsonb, 1, 'It is especially important for fine movement of distal limbs.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Upper motor neuron lesions typically cause:', '["Flaccid paralysis and fasciculations", "Spasticity and hyperreflexia", "Atrophy only", "Loss of pain sensation only"]'::jsonb, 1, 'UMN lesions classically cause spasticity, hyperreflexia, and Babinski sign.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Lower motor neuron lesions typically cause:', '["Spasticity", "Hyperreflexia", "Flaccidity and fasciculations", "Increased tone"]'::jsonb, 2, 'LMN lesions cause flaccid weakness, atrophy, and fasciculations.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A positive Babinski sign suggests:', '["Lower motor neuron lesion", "Upper motor neuron lesion", "Cerebellar lesion", "Basal ganglia lesion"]'::jsonb, 1, 'Extensor plantar response indicates corticospinal tract dysfunction.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The spinocerebellar tracts primarily convey:', '["Pain", "Conscious proprioception", "Unconscious proprioception", "Hearing"]'::jsonb, 2, 'Spinocerebellar pathways send proprioceptive information to the cerebellum.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A cerebellar hemisphere lesion causes deficits that are usually:', '["Contralateral", "Ipsilateral", "Bilateral only", "Sensory only"]'::jsonb, 1, 'Cerebellar lesions usually produce ipsilateral coordination deficits.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Intention tremor is most characteristic of a lesion in the:', '["Basal ganglia", "Cerebellum", "Internal capsule", "Hypothalamus"]'::jsonb, 1, 'Cerebellar lesions cause intention tremor, dysmetria, and ataxia.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Resting tremor and bradykinesia suggest dysfunction of the:', '["Cerebellum", "Substantia nigra", "Hippocampus", "Occipital cortex"]'::jsonb, 1, 'Parkinson disease results from degeneration of dopaminergic neurons in substantia nigra.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Parkinson disease involves deficiency of:', '["Acetylcholine", "GABA", "Dopamine", "Glutamate"]'::jsonb, 2, 'Loss of dopamine in the nigrostriatal pathway is key.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of the subthalamic nucleus causes:', '["Parkinsonism", "Hemiballismus", "Aphasia", "Ataxia"]'::jsonb, 1, 'Contralateral flinging limb movements are characteristic.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The internal capsule is clinically important because it contains:', '["Only sensory fibers", "Concentrated ascending and descending fibers", "Only autonomic fibers", "Only CN nuclei"]'::jsonb, 1, 'Small lesions can cause major motor/sensory deficits.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lacunar infarct in the posterior limb of the internal capsule most likely causes:', '["Isolated memory loss", "Dense contralateral motor deficit", "Ipsilateral hearing loss", "Anosmia"]'::jsonb, 1, 'The posterior limb contains corticospinal fibers.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The thalamus functions mainly as a:', '["CSF-producing organ", "Relay station for sensory information", "Motor nerve", "Ventricular structure only"]'::jsonb, 1, 'Most sensory pathways relay in the thalamus before reaching cortex.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'All sensory modalities except which one relay in the thalamus?', '["Vision", "Smell", "Hearing", "Somatic sensation"]'::jsonb, 1, 'Olfactory pathways uniquely bypass an initial thalamic relay.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The lateral geniculate nucleus relays:', '["Auditory information", "Visual information", "Pain information", "Taste"]'::jsonb, 1, 'Retina → optic tract → lateral geniculate nucleus.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The medial geniculate nucleus relays:', '["Smell", "Taste", "Hearing", "Motor function"]'::jsonb, 2, 'It relays auditory information to the cortex.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The primary motor cortex is located in the:', '["Postcentral gyrus", "Precentral gyrus", "Superior temporal gyrus", "Cingulate gyrus"]'::jsonb, 1, 'The precentral gyrus contains primary motor cortex.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The primary somatosensory cortex is located in the:', '["Precentral gyrus", "Postcentral gyrus", "Inferior frontal gyrus", "Occipital pole"]'::jsonb, 1, 'It receives general somatic sensory input.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of Broca area causes:', '["Fluent but meaningless speech", "Nonfluent speech with intact comprehension", "Complete blindness", "Loss of pain sensation"]'::jsonb, 1, 'Broca aphasia is expressive, nonfluent aphasia.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Broca area is usually located in the:', '["Dominant inferior frontal gyrus", "Non-dominant parietal lobe", "Occipital cortex", "Cerebellum"]'::jsonb, 0, 'Usually left hemisphere in most people.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of Wernicke area causes:', '["Nonfluent speech", "Fluent but nonsensical speech", "Dysphagia only", "Facial weakness only"]'::jsonb, 1, 'Wernicke aphasia causes impaired comprehension with fluent speech.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Wernicke area is usually located in the:', '["Dominant superior temporal gyrus", "Non-dominant frontal lobe", "Cerebellar hemisphere", "Thalamus"]'::jsonb, 0, 'It is involved in language comprehension.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The occipital lobe is primarily responsible for:', '["Language production", "Vision", "Balance", "Hearing"]'::jsonb, 1, 'Primary visual cortex lies in the occipital lobe.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of the optic chiasm causes:', '["Homonymous hemianopia", "Bitemporal hemianopia", "Monocular blindness only", "Superior quadrantanopia"]'::jsonb, 1, 'Crossing nasal retinal fibers are affected.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A pituitary tumor classically compresses the:', '["Optic tract", "Optic chiasm", "Lateral geniculate body", "Oculomotor nerve"]'::jsonb, 1, 'This causes bitemporal hemianopia.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of the right optic tract causes:', '["Right monocular blindness", "Left homonymous hemianopia", "Bitemporal hemianopia", "Left superior quadrantanopia"]'::jsonb, 1, 'The optic tract carries the contralateral visual field.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of Meyer loop causes:', '["Contralateral superior quadrantanopia", "Contralateral inferior quadrantanopia", "Monocular blindness", "Bitemporal hemianopia"]'::jsonb, 0, 'Temporal lobe optic radiations carry superior visual field information.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of parietal optic radiations causes:', '["Superior quadrantanopia", "Inferior quadrantanopia", "Bitemporal hemianopia", "Central scotoma"]'::jsonb, 1, 'Parietal fibers carry inferior visual field information.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Macular sparing is classically seen in:', '["Optic nerve lesion", "Optic chiasm lesion", "PCA stroke affecting visual cortex", "Retinal detachment"]'::jsonb, 2, 'Occipital cortex infarcts may spare macula due to collateral MCA supply.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The CSF is produced mainly by the:', '["Pia mater", "Arachnoid villi", "Choroid plexus", "Dura mater"]'::jsonb, 2, 'Choroid plexus in ventricles produces CSF.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'CSF flows from lateral ventricles to the third ventricle through the:', '["Cerebral aqueduct", "Foramen of Monro", "Foramen of Magendie", "Foramen of Luschka"]'::jsonb, 1, 'The interventricular foramina connect lateral ventricles to the third ventricle.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The cerebral aqueduct connects the:', '["Lateral and third ventricles", "Third and fourth ventricles", "Fourth ventricle and subarachnoid space", "Lateral ventricles directly"]'::jsonb, 1, 'The aqueduct passes through the midbrain.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'CSF exits the fourth ventricle via:', '["Monro only", "Luschka and Magendie", "Optic canal", "Carotid canal"]'::jsonb, 1, 'These apertures allow CSF into subarachnoid space.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'CSF is reabsorbed mainly by:', '["Choroid plexus", "Arachnoid granulations", "Dural sinuses only", "Ependymal cells only"]'::jsonb, 1, 'Arachnoid granulations drain CSF into venous sinuses.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Hydrocephalus due to aqueductal stenosis most directly blocks flow between:', '["Lateral and third ventricles", "Third and fourth ventricles", "Fourth ventricle and central canal", "Subarachnoid spaces"]'::jsonb, 1, 'The cerebral aqueduct lies between the third and fourth ventricles.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The meninges from outermost to innermost are:', '["Pia, arachnoid, dura", "Dura, pia, arachnoid", "Dura, arachnoid, pia", "Arachnoid, dura, pia"]'::jsonb, 2, 'Dura is outermost, pia closely adheres to CNS.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A subdural hematoma usually results from rupture of:', '["Middle meningeal artery", "Bridging veins", "Basilar artery", "Dural sinuses"]'::jsonb, 1, 'Venous bleeding between dura and arachnoid.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'An epidural hematoma usually results from rupture of:', '["Bridging veins", "Middle meningeal artery", "Superior sagittal sinus", "Posterior cerebral artery"]'::jsonb, 1, 'Often follows temporal bone fracture.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A subarachnoid hemorrhage classically presents with:', '["Slowly progressive headache", "\u201cWorst headache of life\u201d", "Isolated hearing loss", "Facial numbness only"]'::jsonb, 1, 'Classically due to berry aneurysm rupture.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Berry aneurysms most commonly occur at:', '["Circle of Willis branch points", "Spinal arteries", "Venous sinuses", "Internal capsule"]'::jsonb, 0, 'Common at arterial bifurcations in the circle of Willis.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The artery most commonly involved in a posterior communicating aneurysm causing CN III palsy is the:', '["MCA", "ACA", "Posterior communicating artery", "Basilar artery"]'::jsonb, 2, 'Compression causes ptosis, “down and out” eye, dilated pupil.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of CN III causes the eye to deviate:', '["Up and in", "Down and out", "Down and in", "Straight laterally only"]'::jsonb, 1, 'Unopposed lateral rectus and superior oblique.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A dilated pupil in CN III palsy occurs because of loss of:', '["Sympathetic fibers", "Parasympathetic fibers", "Optic fibers", "Facial fibers"]'::jsonb, 1, 'Parasympathetic fibers constrict the pupil.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of CN VI causes inability to:', '["Adduct the eye", "Elevate the eye", "Abduct the eye", "Constrict the pupil"]'::jsonb, 2, 'CN VI supplies lateral rectus.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The facial colliculus is located in the:', '["Midbrain", "Pons", "Medulla", "Thalamus"]'::jsonb, 1, 'It is formed by CN VII fibers looping around the abducens nucleus.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion causing horizontal gaze palsy most likely involves the:', '["Oculomotor nucleus", "Abducens nucleus/PPRF", "Hypoglossal nucleus", "Solitary nucleus"]'::jsonb, 1, 'Horizontal gaze center is in the pons.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The nucleus ambiguus gives motor fibers to:', '["CN III and IV", "CN IX and X", "CN I and II", "CN V only"]'::jsonb, 1, 'It supplies muscles of pharynx and larynx via IX and X.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Dysphagia and hoarseness in a lateral medullary lesion suggest damage to the:', '["Hypoglossal nucleus", "Nucleus ambiguus", "Red nucleus", "Edinger-Westphal nucleus"]'::jsonb, 1, 'Nucleus ambiguus controls swallowing/phonation muscles.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Wallenberg syndrome is most commonly due to occlusion of:', '["Anterior spinal artery", "PICA", "Basilar artery", "Posterior cerebral artery"]'::jsonb, 1, 'Lateral medullary syndrome is classically due to PICA occlusion.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Medial medullary syndrome is usually due to occlusion of the:', '["PICA", "Anterior spinal artery", "Superior cerebellar artery", "MCA"]'::jsonb, 1, 'Medial medulla is supplied by ASA/vertebral branches.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of the hypoglossal nucleus causes tongue deviation:', '["Away from the lesion", "Toward the lesion", "Straight out", "Upward only"]'::jsonb, 1, 'Tongue deviates toward the weak side.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The red nucleus is located in the:', '["Medulla", "Pons", "Midbrain", "Thalamus"]'::jsonb, 2, 'It is a midbrain structure involved in motor pathways.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The superior colliculus is primarily involved in:', '["Hearing", "Visual reflexes", "Taste", "Balance"]'::jsonb, 1, 'It helps coordinate visual orienting movements.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The inferior colliculus is primarily involved in:', '["Vision", "Hearing", "Smell", "Motor planning"]'::jsonb, 1, 'It is part of the auditory pathway.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of the cerebellar vermis most likely causes:', '["Distal limb weakness", "Truncal ataxia", "Aphasia", "Hemianopia"]'::jsonb, 1, 'Vermis lesions affect trunk and gait.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Nystagmus is most classically associated with lesions of the:', '["Basal ganglia", "Cerebellum/vestibular system", "Occipital lobe", "Internal capsule"]'::jsonb, 1, 'Cerebellar and vestibular dysfunction can produce nystagmus.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The vestibulocerebellum is mainly involved in:', '["Language", "Balance and eye movements", "Memory", "Smell"]'::jsonb, 1, 'Flocculonodular lobe regulates equilibrium.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of the caudate nucleus is classically associated with:', '["Huntington disease", "Bell palsy", "Multiple sclerosis", "Myasthenia gravis"]'::jsonb, 0, 'Huntington disease involves degeneration of caudate nucleus.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Huntington disease is associated with loss of:', '["Dopamine", "GABAergic neurons", "Serotonin", "Acetylcholine only"]'::jsonb, 1, 'Caudate and putamen degeneration reduces GABA output.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Multiple sclerosis is best described as:', '["Peripheral demyelination", "CNS demyelination", "Muscle degeneration", "NMJ disease"]'::jsonb, 1, 'MS causes autoimmune demyelination in the CNS.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A classic pathologic feature of multiple sclerosis is:', '["Neurofibrillary tangles", "Demyelinating plaques", "Lewy bodies", "Negri bodies"]'::jsonb, 1, 'Demyelinating plaques are characteristic.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Amyotrophic lateral sclerosis affects:', '["Sensory neurons only", "Upper and lower motor neurons", "Cerebellum only", "Basal ganglia only"]'::jsonb, 1, 'ALS causes combined UMN and LMN findings.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'ALS usually spares:', '["Voluntary movement", "Eye movements until late", "Reflexes", "Motor neurons"]'::jsonb, 1, 'Extraocular movements are often spared until late.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'Myasthenia gravis is a disorder of the:', '["CNS myelin", "Basal ganglia", "Neuromuscular junction", "Dorsal root ganglion"]'::jsonb, 2, 'It involves antibodies against postsynaptic ACh receptors.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of the hypothalamus may disrupt all EXCEPT:', '["Temperature regulation", "Endocrine control", "Memory storage only", "Hunger and thirst"]'::jsonb, 2, 'Hypothalamus regulates autonomic/endocrine homeostasis, not memory storage itself.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The hippocampus is most strongly associated with:', '["Motor coordination", "Memory formation", "Hearing", "Vision"]'::jsonb, 1, 'It is critical for formation of new memories.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The amygdala is primarily associated with:', '["Balance", "Emotional processing, especially fear", "Fine motor control", "Vision"]'::jsonb, 1, 'It is part of the limbic system.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The corpus callosum connects:', '["Cerebrum to cerebellum", "Two cerebral hemispheres", "Brainstem to spinal cord", "Thalamus to cortex only"]'::jsonb, 1, 'It is the major commissural pathway between hemispheres.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of the frontal lobe may cause:', '["Visual loss", "Personality and executive dysfunction", "Hearing loss", "Ataxia only"]'::jsonb, 1, 'Frontal lobe mediates executive function, planning, behavior.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of the parietal lobe may impair:', '["Vision only", "Somatosensory integration", "Smell", "Heart rate"]'::jsonb, 1, 'Parietal cortex processes sensory integration and spatial awareness.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The dominant parietal lobe lesion may cause:', '["Hemineglect", "Gerstmann syndrome", "Aphonia", "Parkinsonism"]'::jsonb, 1, 'Agraphia, acalculia, finger agnosia, left-right confusion.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A non-dominant parietal lesion classically causes:', '["Expressive aphasia", "Hemispatial neglect", "Diplopia", "Anosmia"]'::jsonb, 1, 'Usually right parietal lesions cause left neglect.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The primary auditory cortex is located in the:', '["Frontal lobe", "Temporal lobe", "Parietal lobe", "Occipital lobe"]'::jsonb, 1, 'It lies in the superior temporal gyrus.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The sympathetic pathway disruption causing Horner syndrome produces all EXCEPT:', '["Ptosis", "Miosis", "Anhidrosis", "Mydriasis"]'::jsonb, 3, 'Horner causes constricted pupil, not dilation.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The pupillary light reflex afferent limb is:', '["CN II", "CN III", "CN V", "CN VII"]'::jsonb, 0, 'Optic nerve carries the sensory input.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The pupillary light reflex efferent limb is:', '["CN II", "CN III", "CN IV", "CN VI"]'::jsonb, 1, 'Oculomotor nerve carries parasympathetic output to sphincter pupillae.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The Edinger-Westphal nucleus is associated with:', '["Facial expression", "Parasympathetic fibers of CN III", "Hearing", "Swallowing"]'::jsonb, 1, 'It gives rise to preganglionic parasympathetic fibers for pupil constriction.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The lateral corticospinal tract is located mainly in the:', '["Anterior funiculus", "Lateral funiculus", "Posterior funiculus", "Central canal"]'::jsonb, 1, 'It descends in the lateral white matter of the spinal cord.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The fasciculus gracilis carries sensation from the:', '["Upper limb", "Lower limb", "Face", "Trunk only above T6"]'::jsonb, 1, 'Gracilis carries input from below T6.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The fasciculus cuneatus carries sensation from the:', '["Lower limb", "Sacral region", "Upper limb and upper trunk", "Face"]'::jsonb, 2, 'Cuneatus carries input from above T6.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of the facial nerve nucleus in the pons causes:', '["Contralateral lower facial weakness only", "Ipsilateral complete facial weakness", "Contralateral tongue deviation", "Dysphagia only"]'::jsonb, 1, 'LMN facial nucleus lesion causes complete ipsilateral facial paralysis.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'An upper motor neuron lesion of corticobulbar fibers to the face causes weakness mainly of the:', '["Entire ipsilateral face", "Entire contralateral face", "Contralateral lower face", "Ipsilateral lower face only"]'::jsonb, 2, 'Upper face gets bilateral cortical input; lower face is mainly contralateral.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The spinal accessory nerve nucleus is located in the:', '["Midbrain", "Upper cervical spinal cord", "Thalamus", "Cerebellum"]'::jsonb, 1, 'CN XI has a spinal root from cervical segments.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The area postrema is located in the:', '["Midbrain", "Pons", "Medulla", "Cerebellum"]'::jsonb, 2, 'It is a chemoreceptor trigger zone in the medulla.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'A lesion of the nucleus solitarius may impair:', '["Vision", "Taste and visceral sensation", "Eye movement", "Facial expression"]'::jsonb, 1, 'Solitary nucleus receives taste and visceral afferents.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The blood supply to the medial frontal and parietal lobes is mainly from the:', '["MCA", "PCA", "ACA", "Basilar artery"]'::jsonb, 2, 'ACA supplies medial cerebral hemispheres.');

    INSERT INTO public.mcqs (topic_id, question, options, correct_index, explanation)
    VALUES (v_topic_id, 'The blood supply to the lateral cerebral hemisphere is mainly from the:', '["ACA", "MCA", "PCA", "Vertebral artery"]'::jsonb, 1, 'MCA supplies most of the lateral cerebral cortex.');

END $$;