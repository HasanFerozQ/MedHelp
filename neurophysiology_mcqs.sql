-- ==========================================
-- Topic: Neurophysiology - 100 Standalone MCQs
-- ==========================================

DO $$ 
DECLARE 
    v_topic_id UUID;
BEGIN
    -- 1. Get Topic ID
    SELECT id INTO v_topic_id FROM topics WHERE title = 'Neurophysiology';
    
    IF v_topic_id IS NULL THEN
        RAISE NOTICE 'Topic "Neurophysiology" not found. Skipping migration.';
        RETURN;
    END IF;

    -- 2. Cleanup existing standalone MCQs for this topic
    DELETE FROM mcqs WHERE topic_id = v_topic_id;

    -- 3. Insert 100 MCQs
    INSERT INTO mcqs (topic_id, question, options, correct_index, explanation) VALUES
    (v_topic_id, 'The resting membrane potential of most neurons is approximately:', '["+40 mV", "0 mV", "-70 mV", "-120 mV", "+90 mV"]', '2', 'The equilibrium is predominantly determined by K+ leak and the Na+/K+ pump, resting at ~-70mV.'),
    (v_topic_id, 'The main ion responsible for the resting membrane potential is:', '["Na+", "Ca2+", "K+", "Cl−", "Mg2+"]', '2', 'High resting permeability to K+ allows it to leak out, creating the negative interior charge.'),
    (v_topic_id, 'The Na+/K+ ATPase pump moves:', '["3 Na+ in, 2 K+ out", "2 Na+ in, 3 K+ out", "3 Na+ out, 2 K+ in", "Equal Na+ and K+", "Only K+ in"]', '2', 'This is electrogenic (3 out, 2 in), creating a net movement of positive charge out of the cell.'),
    (v_topic_id, 'Opening of voltage-gated Na+ channels causes:', '["Hyperpolarization", "Repolarization", "Depolarization", "No change", "Only K+ efflux"]', '2', 'Rapid Na+ influx drives the potential toward E_Na (~+60mV), causing sharp depolarization.'),
    (v_topic_id, 'The peak of the action potential is primarily due to:', '["K+ influx", "Na+ influx", "Ca2+ efflux", "Cl− influx", "ATP hydrolysis"]', '1', 'Voltage-gated Na+ channels reach their peak conductance during the upstroke.'),
    (v_topic_id, 'Repolarization of the neuron is mainly due to:', '["Na+ influx", "K+ efflux", "Ca2+ influx", "Cl− efflux", "Glucose transport"]', '1', 'Opening of delayed-rectifier K+ channels and inactivation of Na+ channels.'),
    (v_topic_id, 'The absolute refractory period is caused by:', '["Open K+ channels", "Inactivated Na+ channels", "High Ca2+", "Increased ATP", "Synaptic fatigue"]', '1', 'The h-gate of the Na+ channel is closed (inactive) and cannot be opened by any stimulus.'),
    (v_topic_id, 'During the relative refractory period:', '["No stimulus can produce AP", "A stronger-than-normal stimulus is required", "Membrane is depolarized", "All channels closed", "Na+ channels fully active"]', '1', 'Increased K+ conductance (afterhyperpolarization) must be overcome by a larger inward current.'),
    (v_topic_id, 'Saltatory conduction occurs in:', '["Unmyelinated axons", "Myelinated axons", "Dendrites only", "Synaptic clefts", "Smooth muscle"]', '1', 'Saltare means "to jump"; the AP jumps between nodes of Ranvier.'),
    (v_topic_id, 'Nodes of Ranvier are:', '["Neurotransmitter release sites", "Gaps in myelin with high Na+ channel density", "K+ channel absence", "Synaptic boutons", "Axon hillocks"]', '1', 'High density of voltage-gated Na+ channels allows for efficient regeneration of the AP.'),
    (v_topic_id, 'Increasing axon diameter generally:', '["Slows conduction", "Increases conduction velocity", "Has no effect", "Stops action potentials", "Decreases myelination"]', '1', 'Larger diameter decreases internal resistance to current flow.'),
    (v_topic_id, 'Neurotransmitter release at synapses is triggered by:', '["Na+ influx", "Ca2+ influx", "K+ efflux", "Cl− influx", "ATP depletion"]', '1', 'Inward Ca2+ current through voltage-gated channels is the required signal for vesicle fusion.'),
    (v_topic_id, 'The synaptic delay in chemical synapses is due to:', '["Ion diffusion", "Neurotransmitter release and binding steps", "Conduction failure", "Myelin breakdown", "Receptor destruction"]', '1', 'The physical process of exocytosis and crossing the cleft takes ~0.5-2 ms.'),
    (v_topic_id, 'EPSPs are typically caused by:', '["Cl− influx", "K+ efflux", "Na+ influx", "Ca2+ efflux", "ATP breakdown"]', '2', 'Opening of non-specific cation channels allows Na+ entry, depolarizing the postsynaptic membrane.'),
    (v_topic_id, 'IPSPs are commonly caused by:', '["Na+ influx", "Ca2+ influx", "Cl− influx or K+ efflux", "Glucose entry", "ATP synthesis"]', '2', 'Opening channels for Cl- (in) or K+ (out) moves Vm away from threshold.'),
    (v_topic_id, 'EPSPs and IPSPs are:', '["All-or-none", "Graded potentials", "Independent of strength", "Always inhibitory", "Only in muscles"]', '1', 'Their magnitude depends on the amount of neurotransmitter released.'),
    (v_topic_id, 'Spatial summation refers to:', '["Repeated stimulation of one synapse", "Multiple synapses acting simultaneously", "AP jumping nodes", "Temporal delay", "Synaptic fatigue"]', '1', 'Adding up potentials from different locations on the neuronal body/dendrites.'),
    (v_topic_id, 'Temporal summation refers to:', '["Multiple neurons at once", "Repeated firing from the same synapse", "Motor unit recruitment", "Reflex inhibition", "Axonal transport"]', '1', 'Adding up potentials from the same location that arrive in rapid sequence.'),
    (v_topic_id, 'The axon hillock is important because it:', '["Releases neurotransmitters", "Integrates signals and initiates AP", "Forms myelin", "Stores calcium", "Regulates blood flow"]', '1', 'It has the highest density of Na+ channels and therefore the lowest threshold.'),
    (v_topic_id, 'Ionotropic receptors are:', '["Slow G-protein receptors", "Ligand-gated ion channels", "Nuclear receptors", "Enzyme-linked", "Always inhibitory"]', '1', 'The receptor itself is an ion channel, allowing for rapid response.'),
    (v_topic_id, 'Metabotropic receptors act via:', '["Direct ion channels", "G proteins and second messengers", "Gap junctions", "Myelin sheath", "DNA binding"]', '1', 'Response is slower but allows for signal amplification and modulation.'),
    (v_topic_id, 'The neurotransmitter at the neuromuscular junction is:', '["GABA", "Acetylcholine", "Dopamine", "Glutamate", "Glycine"]', '1', 'ACh is the universal transmitter at vertebrate NMJs.'),
    (v_topic_id, 'The motor end-plate receptor is:', '["Muscarinic", "Nicotinic", "Beta-1", "Alpha-1", "GABA-A"]', '1', 'Specifically N_m nicotinic receptors (ionotropic).'),
    (v_topic_id, 'Acetylcholine is broken down by:', '["Monoamine oxidase", "Acetylcholinesterase", "COMT", "Dopamine beta-hydroxylase", "Renin"]', '1', 'AChE hydrolyzes ACh into acetate and choline to terminate signal.'),
    (v_topic_id, 'Generator potentials in sensory receptors are:', '["All-or-none", "Graded potentials", "Independent of stimulus", "Always inhibitory", "Equal to AP amplitude"]', '1', 'They convert physical energy into electrical signals proportional to the stimulus.'),
    (v_topic_id, 'Stimulus intensity is coded mainly by:', '["AP amplitude", "Frequency of action potentials", "Membrane thickness", "Axon color", "Vesicle size"]', '1', 'Rate/Frequency coding is the primary way nerves signal intensity.'),
    (v_topic_id, 'Rapidly adapting receptors detect:', '["Constant stimuli", "Changes in stimulus", "Blood pressure", "Hormones", "Pain"]', '1', 'Phasic receptors signal when a stimulus starts, stops, or changes.'),
    (v_topic_id, 'Slowly adapting receptors are important for:', '["Detecting motion", "Sustained stimuli", "Pain", "Vision", "Hearing"]', '1', 'Tonic receptors provide continuous info about things like pressure or joint position.'),
    (v_topic_id, 'Muscle spindles detect:', '["Muscle tension", "Muscle length and stretch", "Pain", "Temperature", "Vibration"]', '1', 'They detect static length and the dynamic rate of change in length.'),
    (v_topic_id, 'Golgi tendon organs detect:', '["Muscle stretch", "Muscle tension", "Pain", "Touch", "Temperature"]', '1', 'Senses the mechanical load on the tendon.'),
    (v_topic_id, 'The stretch reflex is:', '["Polysynaptic", "Monosynaptic", "Only cortical", "Only autonomic", "Always inhibitory"]', '1', 'Simplest reflex arc (e.g. patellar reflex) involving only one synapse in the cord.'),
    (v_topic_id, 'Gamma motor neurons:', '["Extrafusal fibers", "Intrafusal fibers", "Inhibit reflexes", "Sensory signals", "Pain"]', '1', 'They adjust the sensitivity of the muscle spindle.'),
    (v_topic_id, 'Fast pain is transmitted by:', '["C fibers", "A-delta fibers", "B fibers", "Ia fibers", "Ib fibers"]', '1', 'Myelinated A-delta fibers convey rapid-onset, localized sharp pain.'),
    (v_topic_id, 'Slow pain is transmitted by:', '["A-delta fibers", "C fibers", "B fibers", "Ia fibers", "Alpha"]', '1', 'Unmyelinated C fibers convey diffuse, aching, chronic pain.'),
    (v_topic_id, 'C fibers are:', '["Myelinated/fast", "Unmyelinated and slow", "Only motor", "Largest", "Only brain"]', '1', 'They have the slowest conduction velocity of any nerve fiber.'),
    (v_topic_id, 'Gate control theory of pain involves:', '["Small fibers", "Large fibers inhibiting pain transmission", "Hormones", "Muscle contraction", "Spinal cord destruction"]', '1', 'A-beta fibers (touch) activate inhibitory interneurons to "close the gate" for pain.'),
    (v_topic_id, 'Dorsal columns carry:', '["Pain", "Temperature", "Fine touch and proprioception", "Motor", "Vision"]', '2', 'Convey highly localized discriminative touch and position sense.'),
    (v_topic_id, 'Spinothalamic tract carries:', '["Fine touch", "Pain and temperature", "Vision", "Hearing", "Smell"]', '1', 'Conveys primitive sensations like pain, heat, and cold.'),
    (v_topic_id, 'Large myelinated fibers conduct:', '["Slowly", "Rapidly", "Only pain", "Only motor", "Only autonomic"]', '1', 'Myelin and large diameter both maximize conduction speed.'),
    (v_topic_id, 'All preganglionic autonomic neurons release:', '["NE", "Acetylcholine", "Dopamine", "Serotonin", "GABA"]', '1', 'Preganglionic neurons are cholinergic.'),
    (v_topic_id, 'Most sympathetic postganglionic neurons release:', '["ACh", "Norepinephrine", "Dopamine", "Glutamate", "Glycine"]', '1', 'Exceptions include those to sweat glands (which release ACh).'),
    (v_topic_id, 'Parasympathetic postganglionic neurons release:', '["NE", "Acetylcholine", "Dopamine", "Epinephrine", "Serotonin"]', '1', 'Postganglionic parasympathetic neurons are cholinergic.'),
    (v_topic_id, 'Sympathetic stimulation of the heart acts via:', '["Muscarinic", "Beta-1 receptors", "Alpha-2", "Nicotinic", "GABA"]', '1', 'Increases heart rate and contractility via Beta-1 receptors.'),
    (v_topic_id, 'REM sleep is characterized by:', '["No EM", "Rapid eye movement and dreaming", "Increased muscle tone", "Only delta", "No brain activity"]', '1', 'Paradoxical sleep; desynchronized EEG like wakefulness.'),
    (v_topic_id, 'Muscle tone during REM sleep is:', '["Increased", "Decreased (atonia)", "Unchanged", "Maximal", "Random"]', '1', 'Active inhibition of motor neurons prevents acting out dreams.'),
    (v_topic_id, 'Alpha waves are seen during:', '["Deep sleep", "Relaxed wakefulness", "REM", "Seizures", "Coma"]', '1', 'Typically 8-13 Hz, seen when eyes are closed but person is awake/relaxed.'),
    (v_topic_id, 'Delta waves are seen in:', '["Awake", "Deep sleep", "REM", "Light sleep", "Anxiety"]', '1', 'Large, slow waves (0.5-4 Hz) associated with slow-wave sleep (NREM Stage 3).'),
    (v_topic_id, 'The cerebellum primarily controls:', '["Sensory perception", "Coordination and timing of movement", "Hormones", "Pain", "Memory"]', '1', 'Coordinates balance, posture, and motor execution accuracy.'),
    (v_topic_id, 'Basal ganglia are mainly involved in:', '["Vision", "Movement regulation", "Hearing", "Smell", "Hormone"]', '1', 'Focusing movement patterns and suppressing unwanted activity (Selection).'),
    (v_topic_id, 'Long-term potentiation is associated with:', '["Muscle contraction", "Learning and memory", "Hormone release", "Sleep regulation", "Pain suppression"]', '1', 'Synaptic enhancement based on activity, a mechanism for plasticity.'),
    (v_topic_id, 'The Nernst equation is used to calculate:', '["Resistance", "Equilibrium potential for a single ion", "Resting potential", "Synaptic delay", "Velocity"]', '1', 'Calculates V_eq where electrical and chemical forces on one ion are balanced.'),
    (v_topic_id, 'The Goldman-Hodgkin-Katz equation accounts for:', '["Na+ only", "Multiple ions and their permeabilities", "K+ only", "Cl− only", "ATP pumps"]', '1', 'Predicts resting potential based on weighted sum of permeable ions.'),
    (v_topic_id, 'Increasing extracellular K+ concentration will:', '["Hyperpolarize", "Depolarize the cell", "No effect", "Stop Na+", "Cl− influx"]', '1', 'Reduces the outward chemical gradient for K+, bringing Vm closer to zero.'),
    (v_topic_id, 'Tetrodotoxin blocks:', '["Voltage-gated K+", "Voltage-gated Na+ channels", "Ca2+ channels", "Cl− channels", "Na+/K+ ATPase"]', '1', 'Derived from pufferfish; causes paralysis by preventing AP generation.'),
    (v_topic_id, 'Local anesthetics block nerve conduction by:', '["Opening Na+", "Blocking voltage-gated Na+ channels", "Increasing K+", "Increasing Ca+2", "Activating Cl−"]', '1', 'Prevent current propagation in small nociceptive fibers.'),
    (v_topic_id, 'Increasing myelination of an axon will:', '["Decrease velocity", "Increase conduction velocity", "Prevent AP", "Increase capacitance", "Increase leakage"]', '1', 'Reduces capacitance and increases resistance, speeding up loop current.'),
    (v_topic_id, 'Capacitance of a membrane is decreased by:', '["Increasing membrane thickness", "Increasing permeability", "Increasing temp", "Decreasing resistance", "Opening Na+"]', '0', 'Capacitance is inversely proportional to the distance between "plates" (membrane thickness).'),
    (v_topic_id, 'Conduction velocity is fastest in:', '["Small unmyelinated", "Large myelinated fibers", "Small myelinated", "Large unmyelinated", "Dendrites"]', '1', 'Optimal combination of low resistance and high insulation.'),
    (v_topic_id, 'Neurotransmitter release is most directly dependent on:', '["Na+ entry", "Ca2+ entry", "K+ exit", "Cl− entry", "ATP depletion"]', '1', 'Ca2+ triggers synchronization of synaptic vesicles.'),
    (v_topic_id, 'Botulinum toxin causes paralysis by:', '["Blocking Na+", "Preventing ACh release", "Blocking nicotinic", "Increasing Ca+2", "Enhancing fusion"]', '1', 'Cleaves SNARE proteins to stop neurotransmitter exocytosis.'),
    (v_topic_id, 'Curare causes paralysis by:', '["Blocking release", "Blocking nicotinic receptors", "Increasing breakdown", "Activating muscarinic", "Blocking Ca2+"]', '1', 'Competitive antagonist at the Nm nicotinic receptor.'),
    (v_topic_id, 'Organophosphates cause toxicity by:', '["Blocking Na+", "Inhibiting acetylcholinesterase", "Blocking Ca2+", "Inhibiting GABA", "Increasing dopamine"]', '1', 'Creates a cholinergic crisis by allowing ACh to accumulate.'),
    (v_topic_id, 'NMDA receptors are unique because they:', '["Allow only Na+", "Require both ligand binding and depolarization", "Inhibitory", "Peripheral", "No Ca2+"]', '1', 'They function as coincidence detectors (Glutamate + Depolarization to remove Mg blocker).'),
    (v_topic_id, 'Activation of NMDA receptors allows influx of:', '["Cl−", "Ca2+", "K+ only", "Na+ only", "H+"]', '1', 'Prominent role in synaptic plasticity and memory formation.'),
    (v_topic_id, 'Long-term potentiation (LTP) involves:', '["Decreased strength", "Increased postsynaptic responsiveness", "Loss of receptors", "Decreased Ca2+", "Reduced release"]', '1', 'Often mediated by AMPA receptor insertion into the postsynaptic membrane.'),
    (v_topic_id, 'Glycine is primarily an inhibitory neurotransmitter in the:', '["Cortex", "Spinal cord", "Retina", "Hippocampus", "Thalamus"]', '1', 'The major inhibitory transmitter in the spinal cord; acts on Cl- channels.'),
    (v_topic_id, 'GABA-A receptors are:', '["G-protein coupled", "Ligand-gated Cl− channels", "Tyrosine kinase", "Nuclear", "Na+ channels"]', '1', 'Primary inhibitory receptor in the brain.'),
    (v_topic_id, 'Benzodiazepines enhance:', '["NMDA", "GABA-A receptor activity", "Na+ channels", "Dopamine release", "Ca2+ pumps"]', '1', 'They increase the frequency of Cl- channel opening in response to GABA.'),
    (v_topic_id, 'The major excitatory neurotransmitter in the CNS is:', '["GABA", "Glycine", "Glutamate", "Dopamine", "Serotonin"]', '2', 'Glutamate underlies most excitatory synaptic logic in the brain.'),
    (v_topic_id, 'Dopamine pathways are most associated with:', '["Motor control and reward", "Pain only", "Vision", "Hearing", "Taste"]', '0', 'Nigrostriatal (motor) and Mesolimbic (reward) pathways.'),
    (v_topic_id, 'The fastest sensory fibers are:', '["C", "A-delta", "A-alpha fibers", "B", "Autonomic"]', '2', 'A-alpha includes Ia afferents from spindles.'),
    (v_topic_id, 'A-delta fibers carry:', '["Slow pain", "Fast pain", "Motor", "Only temp", "Only touch"]', '1', 'Intermediate speed, myelinated nociceptors.'),
    (v_topic_id, 'The spinothalamic tract crosses:', '["At medulla", "Near spinal cord entry", "At cortex", "Thalamus", "No cross"]', '1', 'Crosses in the anterior white commissure of the spinal cord.'),
    (v_topic_id, 'Dorsal column fibers cross:', '["At entry", "In the medulla", "In the spinal cord", "Thalamus", "No cross"]', '1', 'Cross as internal arcuate fibers in the lower medulla.'),
    (v_topic_id, 'Loss of dorsal columns leads to:', '["Loss of pain", "Loss of vibration and proprioception", "Loss of motor", "Vision", "Smell"]', '1', 'Sensory ataxia; patient must watch feet to walk.'),
    (v_topic_id, 'The corticospinal tract is responsible for:', '["Sensory", "Voluntary motor control", "Pain", "Autonomic", "Hormones"]', '1', 'The primary descending pathway for fine motor skill.'),
    (v_topic_id, 'Upper motor neuron lesions typically cause:', '["Flaccid paralysis", "Spasticity and hyperreflexia", "Atrophy only", "Fasciculations", "Reduced tone"]', '1', 'Loss of descending inhibition leads to overactive spinal reflexes.'),
    (v_topic_id, 'Lower motor neuron lesions typically cause:', '["Spasticity", "Flaccid paralysis", "Hyperreflexia", "Clonus", "Increased tone"]', '1', 'Loss of the actual motor fiber connection to the muscle.'),
    (v_topic_id, 'The Babinski sign indicates:', '["Normal adult", "Upper motor neuron lesion", "Lower motor neuron", "Sensory loss", "Cerebellar"]', '1', 'Abnormal upward extension of the big toe in adults.'),
    (v_topic_id, 'The cerebellum primarily controls:', '["Initiation", "Coordination and timing", "Hormones", "Pain", "Memory"]', '1', 'Acts as a sensory-motor comparator.'),
    (v_topic_id, 'Basal ganglia dysfunction leads to:', '["Pure sensory", "Movement disorders", "Vision", "Hearing", "Smell"]', '1', 'Either hyperkinetic (Huntington) or hypokinetic (Parkinson) disorders.'),
    (v_topic_id, 'Parkinson disease involves deficiency of:', '["Serotonin", "Dopamine", "GABA", "Glutamate", "ACh"]', '1', 'Degeneration of dopaminergic neurons in the substantia nigra pars compacta.'),
    (v_topic_id, 'Sympathetic preganglionic neurons originate from:', '["Brainstem", "Thoracolumbar region", "Sacral", "Cortex", "Cerebellum"]', '1', 'T1 through L2 segments of the lateral horn.'),
    (v_topic_id, 'Parasympathetic preganglionic neurons originate from:', '["Thoracolumbar", "Craniosacral regions", "Only cord", "Only brainstem", "Cortex"]', '1', 'Cranial nerves III, VII, IX, X and sacral segments S2-S4.'),
    (v_topic_id, 'Sympathetic stimulation generally:', '["Decreases HR", "Increases heart rate", "Increases digestion", "Decreases BP", "Causes sleep"]', '1', 'Fight-or-flight response preparation.'),
    (v_topic_id, 'Parasympathetic stimulation generally:', '["Increases HR", "Decreases heart rate", "Increases stress", "Inhibits digestion", "Vasoconstriction"]', '1', 'Rest-and-digest activity.'),
    (v_topic_id, 'Baroreceptors respond primarily to:', '["Glucose", "Blood pressure changes", "Temp", "Oxygen", "Hormones"]', '1', 'Stretched receptors in carotid sinus and aortic arch.'),
    (v_topic_id, 'REM sleep EEG resembles:', '["Deep sleep", "Awake state", "Coma", "Seizure", "Alpha"]', '1', 'Low-voltage, high-frequency "sawtooth" waves.'),
    (v_topic_id, 'Night terrors occur during:', '["REM", "Deep non-REM sleep", "Awake", "Light sleep", "REM exclusive"]', '1', 'Stage 3 N3 sleep; often person is inconsolable and has no memory of event.'),
    (v_topic_id, 'The reticular activating system is important for:', '["Pain", "Consciousness and arousal", "Vision", "Hearing", "Hormones"]', '1', 'Regulates sleep-wake transitions.'),
    (v_topic_id, 'Acetylcholine in CNS is associated with:', '["Sleep only", "Memory and learning", "Pain", "Vision", "Smell"]', '1', 'Loss of cholinergic neurons in nucleus basalis is seen in Alzheimer disease.'),
    (v_topic_id, 'Serotonin is involved in:', '["Only movement", "Mood and sleep", "Only pain", "Reflexes", "Vision"]', '1', 'Target for many antidepressant medications (SSRIs).'),
    (v_topic_id, 'Norepinephrine in CNS is associated with:', '["Motor", "Alertness and arousal", "Only sleep", "Only pain", "Only vision"]', '1', 'Primary output from the locus coeruleus.'),
    (v_topic_id, 'The hypothalamus regulates:', '["Only movement", "Homeostasis and endocrine function", "Vision", "Hearing", "Memory"]', '1', 'The master control center for temperature, hunger, thirst, and hormones.'),
    (v_topic_id, 'The limbic system is involved in:', '["Motor reflexes", "Emotion and behavior", "Vision", "Hearing", "Balance"]', '1', 'Includes hippocampus, amygdala, and cingulate gyrus.'),
    (v_topic_id, 'Pain perception involves the:', '["Cerebellum", "Cortex", "Thyroid", "Kidney", "Liver"]', '1', 'Primary somatosensory cortex and anterior cingulate cortex (emotional pain).'),
    (v_topic_id, 'Referred pain occurs because:', '["Fibers cross too early", "Visceral and somatic afferents converge", "Autonomic only", "Random misfire", "No receptors"]', '1', 'Signals from the heart and left arm might enter the same dorsal root segment.'),
    (v_topic_id, 'The thalamus acts as a:', '["Motor neuron", "Sensory relay station", "Hormone gland", "Reflex center", "Pain receptor"]', '1', 'The "gateway" to the cortex for all senses except olfaction.'),
    (v_topic_id, 'Synaptic plasticity refers to:', '["Fixed", "Ability of synapses to change strength", "Loss", "Inhibition only", "Excitation only"]', '1', 'Neural basis for learning and memory.'),
    (v_topic_id, 'Which principle best describes nervous system signaling?', '["Only graded", "Combination of graded potentials and all-or-none action potentials", "Only hormonal", "No electrical", "Only inhibitory"]', '1', 'Graded potentials (synaptic/receptor) trigger action potentials for long-distance signalling.');

    RAISE NOTICE 'Neurophysiology MCQs Migration Completed (100 Questions).';
END $$;
