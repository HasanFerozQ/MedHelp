-- ==========================================
-- Topic: Neurophysiology - 25 Clinical Cases
-- ==========================================

DO $$ 
DECLARE 
    v_topic_id UUID;
    v_case_id UUID;
BEGIN
    -- 1. Get Topic ID
    SELECT id INTO v_topic_id FROM topics WHERE title = 'Neurophysiology';
    
    IF v_topic_id IS NULL THEN
        RAISE NOTICE 'Topic "Neurophysiology" not found. Skipping migration.';
        RETURN;
    END IF;

    -- 2. Cleanup existing cases for this topic
    DELETE FROM case_questions WHERE case_id IN (SELECT id FROM case_studies WHERE topic_id = v_topic_id);
    DELETE FROM case_studies WHERE topic_id = v_topic_id;

    -- CASE 1: Resting Membrane Potential
    INSERT INTO case_studies (topic_id, title, scenario) VALUES (
        v_topic_id, 
        'Resting Membrane Potential', 
        'A first-year medical student is asked why neurons have a negative resting membrane potential.'
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The resting membrane potential of a typical neuron is closest to:', '["+40 mV", "0 mV", "-70 mV", "-120 mV", "+90 mV"]', '2', 'Normal neuronal resting potential is ~-70 mV, maintained by differential ion permeability and the Na+/K+ pump.'),
    (v_case_id, 'The main reason the inside of the neuron is negative at rest is:', '["High permeability to Na+", "High permeability to K+ with intracellular anionic proteins", "Equal permeability to all ions", "Constant Ca2+ influx", "Chloride pump dominance only"]', '1', 'K+ "leaks" out down its concentration gradient, leaving behind negatively charged intracellular proteins.'),
    (v_case_id, 'The Na+/K+ ATPase contributes to resting membrane potential by:', '["Bringing 3 Na+ in and 2 K+ out", "Moving 3 Na+ out and 2 K+ in", "Moving only K+ out", "Moving only Na+ in", "Opening voltage-gated Na+ channels"]', '1', 'The electrogenic pump moves 3 Na+ out and 2 K+ in, contributing a small negative charge to the interior.'),
    (v_case_id, 'If membrane permeability to K+ decreases, the resting membrane potential will most likely:', '["Become more negative", "Become less negative", "Remain unchanged", "Equal the Na+ equilibrium potential", "Become zero immediately"]', '1', 'Less K+ efflux means fewer positive charges leave the cell, leading to depolarization (less negative potential).');

    -- CASE 2: Threshold and Action Potential Initiation
    INSERT INTO case_studies (topic_id, title, scenario) VALUES (
        v_topic_id, 
        'Threshold and Action Potential Initiation', 
        'A researcher stimulates a neuron with increasingly strong depolarizing currents.'
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'An action potential is generated only when membrane depolarization reaches:', '["The chloride equilibrium potential", "Threshold", "The potassium equilibrium potential", "Absolute refractory level", "Resting potential plus 1 mV only"]', '1', 'Threshold is the critical level to which a membrane potential must be depolarized to initiate an action potential.'),
    (v_case_id, 'The rapid upstroke of the neuronal action potential is primarily due to opening of:', '["Voltage-gated K+ channels", "Voltage-gated Na+ channels", "Ligand-gated Cl- channels", "Ca2+-activated K+ channels", "Na+/K+ ATPase pumps"]', '1', 'Inward Na+ current melalui voltage-gated channels causes the rapid depolarization phase.'),
    (v_case_id, 'The all-or-none principle means that once threshold is reached:', '["A larger stimulus creates a taller action potential", "The action potential amplitude is relatively fixed", "Only half the neuron depolarizes", "Refractory period disappears", "Synaptic transmission stops"]', '1', 'All-or-none means the AP happens at full magnitude or not at all.');

    -- CASE 3: Repolarization and Afterhyperpolarization
    INSERT INTO case_studies (topic_id, title, scenario) VALUES (
        v_topic_id, 
        'Repolarization and Afterhyperpolarization', 
        'A professor asks a student what repolarizes the neuron after an action potential.'
    ) RETURNING id INTO v_case_id;

    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Repolarization is primarily caused by:', '["Continued Na+ influx", "K+ efflux through voltage-gated K+ channels", "Ca2+ influx through synaptic channels", "Cl- influx only", "Na+/K+ ATPase alone"]', '1', 'K+ efflux through delayed rectifier channels returns the membrane toward resting levels.'),
    (v_case_id, 'Afterhyperpolarization occurs mainly because:', '["Na+ channels remain open too long", "K+ conductance remains elevated temporarily", "Chloride channels are permanently closed", "Ca2+ influx stops completely", "Synaptic vesicles are depleted"]', '1', 'Slow closing of K+ channels allows the potential to dip toward the K+ equilibrium potential.'),
    (v_case_id, 'During repolarization, membrane potential moves toward the equilibrium potential of:', '["Sodium", "Potassium", "Calcium", "Chloride only", "Water"]', '1', 'K+ channels drive the potential toward E_K (~-90mV).');

    -- CASE 4: Absolute and Relative Refractory Periods
    INSERT INTO case_studies (topic_id, title, scenario) VALUES ( v_topic_id, 'Absolute and Relative Refractory Periods', 'A neuron is stimulated repeatedly at very short intervals.' ) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'During the absolute refractory period, no new action potential can be generated mainly because:', '["K+ channels are closed", "Voltage-gated Na+ channels are inactivated", "All membrane channels are closed", "The membrane is too positive", "Synaptic vesicles are empty"]', '1', 'Inactivated Na+ channels (h-gate closed) cannot re-open until the membrane repolarizes.'),
    (v_case_id, 'During the relative refractory period, a stronger-than-normal stimulus is needed because:', '["Na+ channels are permanently closed", "The membrane is hyperpolarized and some Na+ channels are still recovering", "K+ equilibrium potential becomes positive", "ATP is absent", "Ca2+ enters the nucleus"]', '1', 'The hyperpolarization far from threshold and partial Na+ channel inactivation requires more current to reach threshold.'),
    (v_case_id, 'Refractory periods help ensure:', '["Bidirectional conduction", "Unidirectional propagation of action potentials", "Continuous depolarization", "Loss of coding by frequency", "Complete block of all synapses"]', '1', 'Refractoriness prevents the AP from traveling backwards.');

    -- CASE 5: Saltatory Conduction
    INSERT INTO case_studies (topic_id, title, scenario) VALUES ( v_topic_id, 'Saltatory Conduction', 'A patient with a demyelinating disorder develops slowed nerve conduction.' ) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'In myelinated axons, action potentials normally “jump” between:', '["Dendritic spines", "Nodes of Ranvier", "Synaptic boutons", "Schwann cell nuclei", "Axon hillocks"]', '1', 'Action potentials only occur at the exposed nodes of Ranvier.'),
    (v_case_id, 'Myelin increases conduction velocity mainly by:', '["Increasing membrane capacitance", "Decreasing membrane capacitance and increasing membrane resistance", "Opening more Na+ channels everywhere", "Decreasing axon diameter", "Increasing neurotransmitter release"]', '1', 'Myelin acts as an insulator, reducing leaked current and boosting local circuit flow speed.'),
    (v_case_id, 'Demyelination slows conduction because it:', '["Decreases current leakage", "Increases current leakage and disrupts saltatory conduction", "Eliminated all Na+ channels", "EPSPs to IPSPs", "Higher resistance"]', '1', 'Loss of insulation allows charge to leak out, meaning it takes longer for the next node to reach threshold.');

    -- CASE 6: Synaptic Transmission
    INSERT INTO case_studies (topic_id, title, scenario) VALUES ( v_topic_id, 'Synaptic Transmission', 'A student studies transmission at a typical chemical synapse.' ) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Neurotransmitter release at a chemical synapse is triggered by:', '["Na+ influx into postsynaptic cell", "Ca2+ influx into presynaptic terminal", "K+ efflux from postsynaptic membrane", "Cl- influx into synaptic cleft", "ATP exit"]', '1', 'Inward Ca2+ through voltage-gated channels triggers vesicle fusion at the active zone.'),
    (v_case_id, 'Synaptic vesicle fusion occurs at the:', '["Axon initial segment", "Presynaptic terminal membrane", "Dendritic shaft", "Soma nucleus", "Node of Ranvier"]', '1', 'Fusion occurs at the presynaptic membrane facing the cleft.'),
    (v_case_id, 'Compared with electrical synapses, chemical synapses are characterized by:', '["No delay", "Synaptic delay and directional transmission", "Bidirectional flow only", "Gap junctions", "No modulation"]', '1', 'Chemical synapses are slower but allow for complex integration and one-way flow.');

    -- CASE 7: EPSPs and IPSPs
    INSERT INTO case_studies (topic_id, title, scenario) VALUES ( v_topic_id, 'EPSPs and IPSPs', 'A neuron receives both excitatory and inhibitory inputs.' ) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'An excitatory postsynaptic potential (EPSP) usually results from:', '["K+ efflux or Cl- influx", "Na+ influx causing depolarization", "Hyperpolarization", "Channel inactivation", "Reduced release"]', '1', 'Opening cation channels brings Vm closer to threshold.'),
    (v_case_id, 'An inhibitory postsynaptic potential (IPSP) most commonly involves:', '["Na+ influx", "Ca2+ influx", "Cl- influx or K+ efflux", "Glutamate release", "Depolarization"]', '2', 'Hyperpolarization moves the potential further from threshold.'),
    (v_case_id, 'EPSPs and IPSPs are usually:', '["All-or-none events", "Graded local potentials", "Regenerative spikes", "Independent of resistance", "Identical to muscle spikes"]', '1', 'Synaptic potentials summate and decay with distance/time; they are not all-or-none.');

    -- CASE 8: Temporal and Spatial Summation
    INSERT INTO case_studies (topic_id, title, scenario) VALUES ( v_topic_id, 'Temporal and Spatial Summation', 'A postsynaptic neuron is stimulated by several presynaptic neurons.' ) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Spatial summation refers to:', '["Repeated firing from one synapse", "Inputs from multiple synapses adding together", "AP jumping between nodes", "Myelin spread", "Recycling delay"]', '1', 'Integration of inputs from physically different locations on the neuron.'),
    (v_case_id, 'Temporal summation refers to:', '["Multiple neurons at once", "Repeated input from the same synapse in rapid succession", "EPSP + IPSP", "Sensory adaptation", "LTP only"]', '1', 'Integration of inputs arriving at the same location very close in time.'),
    (v_case_id, 'Whether a neuron fires depends largely on integration at the:', '["Synaptic cleft", "Axon hillock/initial segment", "Myelin sheath", "Node of Ranvier", "Presynaptic vesicle"]', '1', 'The axon hillock has the highest density of Na+ channels and the lowest threshold.');

    -- CASE 9: Ionotropic vs Metabotropic Receptors
    INSERT INTO case_studies (topic_id, title, scenario) VALUES ( v_topic_id, 'Ionotropic vs Metabotropic Receptors', 'A neurophysiology lab compares fast and slow synaptic responses.' ) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Ionotropic receptors produce responses that are generally:', '["Slower/gene mediated", "Faster because they are ligand-gated ion channels", "Always inhibitory", "Independent of transmitters", "Endocrine only"]', '1', 'Direct pore opening allows near-instant ionic current flow.'),
    (v_case_id, 'Metabotropic receptors act mainly through:', '["Direct opening", "G proteins and second messengers", "Myelin breakdown", "Gap junctions", "Vesicle fusion"]', '1', 'Second messenger cascades allow for signal amplification and long-lasting effects modulations.'),
    (v_case_id, 'Compared with ionotropic signaling, metabotropic signaling is often:', '["Faster/brieef", "Slower but more modulatory", "Impossible in CNS", "Skeletal muscle only", "Always excitatory"]', '1', 'Metabotropic signaling mediates complex physiological changes and modulator effects.');

    -- CASE 10: Neuromuscular Junction
    INSERT INTO case_studies (topic_id, title, scenario) VALUES ( v_topic_id, 'Neuromuscular Junction', 'A toxin blocks nicotinic receptors at the motor end plate.' ) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The neurotransmitter at the neuromuscular junction is:', '["GABA", "Acetycholine", "Glycine", "Dopamine", "Glutamate"]', '1', 'ACh is the universal transmitter at the vertebrate NMJ.'),
    (v_case_id, 'The receptor at the skeletal muscle motor end plate is:', '["Muscarinic", "Nicotinic", "Beta-1", "Alpha-1", "GABA-A"]', '1', 'ACh binds to ionotropic N_m nicotinic receptors to trigger contraction.'),
    (v_case_id, 'Binding of acetylcholine at the motor end plate produces an:', '["IPSP", "End-plate potential", "Inhibitory junction potential", "Cl- conductance", "Actin-myosin bridge"]', '1', 'An EPP is a large graded depolarization that typically triggers an action potential in the muscle fiber.'),
    (v_case_id, 'Acetylcholine in the synaptic cleft is normally terminated mainly by:', '["Reuptake", "Acetylcholinesterase breakdown", "Diffusion into blood", "Schwann cell destruction", "Dopamine conversion"]', '1', 'AChE hydrolyzes ACh into acetate and choline to terminate the signal.');

    -- CASE 11: Sensory Receptor Potentials
    INSERT INTO case_studies (topic_id, title, scenario) VALUES ( v_topic_id, 'Sensory Receptor Potentials', 'A patient touches a warm object and then a painful sharp pin.' ) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Sensory receptors typically respond to adequate stimuli by generating:', '["All-or-none APs", "Graded receptor/generator potentials", "IPSPs only", "Hormones", "No change"]', '1', 'Receptors convert physical energy into graded electrical signals.'),
    (v_case_id, 'If receptor potential amplitude increases, afferent firing frequency usually:', '["Decreases", "Increases", "Fixed", "Stops", "Unrelated"]', '1', 'Stimulus intensity is coded by firing frequency (Frequency Coding).'),
    (v_case_id, 'Stimulus intensity in sensory systems is often coded mainly by:', '["AP amplitude", "Frequency of action potentials", "Vesicle size", "Cl- potential", "Myelin color"]', '1', 'Frequency coding is the primary mechanism for signaling intensity in nerve fibers.');

    -- CASE 12: Receptor Adaptation
    INSERT INTO case_studies (topic_id, title, scenario) VALUES ( v_topic_id, 'Receptor Adaptation', 'A student wears a watch and stops noticing it after some time.' ) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This best illustrates:', '["Sensitization", "Sensory adaptation", "Temporal summation", "Central command", "Saltatory conduction"]', '1', 'Decreased responsiveness to a constant, sustained stimulus.'),
    (v_case_id, 'Rapidly adapting receptors are best for detecting:', '["Constant stimuli", "Changes in stimulus intensity", "Blood glucose", "Hormones", "Chronic pain"]', '1', 'Also known as phasic receptors; they signal "on" and "off" or movement.'),
    (v_case_id, 'Slowly adapting receptors are especially useful for:', '["Continuous monitoring of sustained stimuli", "Vibration only", "Smell", "AP initiation", "Hearing"]', '0', 'Tonic receptors (e.g., pressure, joint position) provide constant information about a state.');

    -- CASE 13: Muscle Spindle Physiology
    INSERT INTO case_studies (topic_id, title, scenario) VALUES ( v_topic_id, 'Muscle Spindle Physiology', 'A physician taps the patellar tendon and the knee extends.' ) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The receptor primarily responsible for the stretch reflex is the:', '["GTO", "Muscle spindle", "Pacinian", "Final nerve ending", "Merkel"]', '1', 'Muscle spindles detect changes in muscle length.'),
    (v_case_id, 'Muscle spindles detect mainly:', '["Tension", "Muscle length and rate of stretch", "Joint angle", "Skin pain", "Rupture"]', '1', 'Sensitive to both static length and the velocity of stretching.'),
    (v_case_id, 'The afferent fibers that carry the fastest stretch information are mainly:', '["C", "A-delta", "Ia", "B", "Postganglionic"]', '2', 'Ia fibers are among the largest and fastest myelinated fibers in the body.'),
    (v_case_id, 'The patellar reflex is an example of a:', '["Polysynaptic", "Monosynaptic stretch reflex", "Crossed extensor", "Visceral", "Long-loop"]', '1', 'Tap -> Spindle -> Ia fiber -> Alpha motor neuron -> Contraction.');

    -- CASE 14: Golgi Tendon Organ
    INSERT INTO case_studies (topic_id, title, scenario) VALUES ( v_topic_id, 'Golgi Tendon Organ', 'A person lifts a heavy weight, and reflex mechanisms help prevent tendon injury.' ) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The receptor that detects muscle tension is the:', '["Spindle", "Golgi tendon organ", "Ruffini", "Meissner", "Hair cell"]', '1', 'GTOs are in series with muscle fibers and detect mechanical tension.'),
    (v_case_id, 'Golgi tendon organs send afferent signals mainly through:', '["Ia", "Ib", "II", "C", "Gamma"]', '1', 'Ib afferents carry tension information to the spinal cord.'),
    (v_case_id, 'Activation of the Golgi tendon organ tends to cause:', '["Increased contraction", "Reflex inhibition of the contracting muscle", "Increased gamma", "Pain", "Crossed extensor"]', '1', 'The inverse stretch reflex protects muscle/tendon from excessive load.');

    -- CASE 15: Gamma Motor Neurons
    INSERT INTO case_studies (topic_id, title, scenario) VALUES ( v_topic_id, 'Gamma Motor Neurons', 'A neurologist asks about how muscle spindles remain sensitive during movement.' ) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Gamma motor neurons innervate:', '["Extrafusal fibers", "Intrafusal fibers of muscle spindles", "GTOs", "Smooth muscle", "Ganglia"]', '1', 'Gamma neurons bias the spindle length by contracting the intrafusal polar regions.'),
    (v_case_id, 'Gamma activation mainly serves to:', '["Force", "Maintain spindle sensitivity during muscle contraction", "Inhibit alpha", "Decrease firing", "Relax fibers"]', '1', 'Prevents the spindle from going slack when the main muscle contracts.'),
    (v_case_id, 'Alpha-gamma coactivation is important because it prevents the spindle from becoming:', '["Overexcited", "Slack during muscle shortening", "Demyelinated", "GABA inhibited", "Resistant"]', '1', 'Ensures sensory feedback about muscle length is available throughout a voluntary contraction.');

    -- CASE 16: Pain Fibers and Fast vs Slow Pain
    INSERT INTO case_studies (topic_id, title, scenario) VALUES ( v_topic_id, 'Pain Fibers and Fast vs Slow Pain', 'A patient first feels a sharp pain, then a dull aching pain after stepping on a tack.' ) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Fast sharp pain is carried mainly by:', '["C", "A-delta", "B", "Ia", "Ib"]', '1', 'A-delta fibers carry localized, rapid-onset pain signals.'),
    (v_case_id, 'Slow dull pain is carried mainly by:', '["A-alpha", "A-delta", "C", "Ia", "Gamma"]', '2', 'Unmyelinated C-fibers carry diffuse, chronic, throbbing pain.'),
    (v_case_id, 'C fibers are characterized by being:', '["Heavily myelinated", "Unmyelinated and slow", "Only motor", "Largest", "Spindle only"]', '1', 'They have slow conduction velocities (<2 m/s).');

    -- CASE 17: Pain Modulation
    INSERT INTO case_studies (topic_id, title, scenario) VALUES ( v_topic_id, 'Pain Modulation', 'A patient rubs his arm after bumping it, and the pain feels reduced.' ) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'This can be partly explained by the gate control concept, in which activation of:', '["Small pain fibers", "Large touch fibers can inhibit pain transmission in the dorsal horn", "Motor fibers", "Cortisol", "Sympathetic"]', '1', 'Closing the gate by stimulating large A-beta fibers which excite inhibitory interneurons.'),
    (v_case_id, 'Endogenous analgesia pathways use neurotransmitters such as:', '["ACh", "Endorphins/enkephalins and monoamines", "Thyroxine", "Histamine", "Insulin"]', '1', 'Opiates inhibit nociceptive transmission at the level of the dorsal horn.'),
    (v_case_id, 'Descending pain inhibition can originate from higher centers and influence neurons in the:', '["Retina", "Dorsal horn of spinal cord", "NMJ", "Thyroid", "Purkinje"]', '1', 'PAG (Periaqueductal gray) to Raphe Nucleus to Spinal Cord circuitry.');

    -- CASE 18: Dorsal Column Function
    INSERT INTO case_studies (topic_id, title, scenario) VALUES ( v_topic_id, 'Dorsal Column Function', 'A patient closes his eyes and has impaired vibration and position sense from a toe.' ) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The sensory modality most associated with dorsal column pathways is:', '["Crude pain", "Temperature", "Fine touch, vibration, and proprioception", "Smell", "Vision"]', '2', 'Large myelinated fibers for highly localized/discriminative touch and balance.'),
    (v_case_id, 'Conscious proprioception from muscle and joints is important for:', '["Injury", "Knowing limb position in space", "Smell", "Endocrine", "Hearing"]', '1', 'Sensory feedback required for coordinated movement and spatial awareness.'),
    (v_case_id, 'Large myelinated fibers carrying these modalities conduct:', '["Slowly", "Rapidly", "After pain", "Autonomic", "Sleep"]', '1', 'Up to 70-120 m/s in some cases.');

    -- CASE 19: Spinothalamic Function
    INSERT INTO case_studies (topic_id, title, scenario) VALUES ( v_topic_id, 'Spinothalamic Function', 'A neurophysiology tutor asks which pathway carries pain and temperature.' ) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Pain and temperature are most associated with the:', '["Corticospinal", "DCML", "Spinothalamic pathway", "Vestibulospinal", "Spinocerebellar"]', '2', 'The lateral spinothalamic tract specifically for pain and temp.'),
    (v_case_id, 'Compared with dorsal column fibers, many spinothalamic fibers are:', '["Larger", "Smaller and slower", "Motor", "Autonomic", "Cranial"]', '1', 'Most are A-delta and C fibers (smaller diameter).'),
    (v_case_id, 'Crude touch is also carried substantially in the:', '["Spinothalamic system", "Visual", "Auditory", "Corticobulbar", "Olfactory"]', '0', 'Anterior spinothalamic tract manages primitive touch/pressure.');

    -- CASE 20: Autonomic Nervous System Basics
    INSERT INTO case_studies (topic_id, title, scenario) VALUES ( v_topic_id, 'Autonomic Nervous System Basics', 'A medical student compares sympathetic and parasympathetic systems.' ) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'All preganglionic autonomic neurons release:', '["NE", "Acetylcholine", "Dopamine", "GABA", "Glutamate"]', '1', 'ACh acts on nicotinic receptors in autonomic ganglia.'),
    (v_case_id, 'Postganglionic parasympathetic neurons usually release:', '["NE", "Acetylcholine", "EPI", "Glycine", "Serotonin"]', '1', 'Acts on muscarinic receptors at the effector organs.'),
    (v_case_id, 'Most postganglionic sympathetic neurons usually release:', '["ACh", "Norepinephrine", "Glutamate", "Dopamine", "Endorphins"]', '1', 'Exceptions include sweat glands and adrenal medulla.');

    -- CASE 21: Receptor Types in the ANS
    INSERT INTO case_studies (topic_id, title, scenario) VALUES ( v_topic_id, 'Receptor Types in the ANS', 'A pharmacology lecturer asks about autonomic receptors from a physiology perspective.' ) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Nicotinic receptors are found at:', '["Effector/Para only", "Autonomic ganglia", "Muscarinic sites", "Alpha-1 sites", "Beta-1 sites"]', '1', 'Found at NMJ and all autonomic ganglionic synapses.'),
    (v_case_id, 'Muscarinic receptors mediate parasympathetic effects on:', '["Ganglia", "Effector organs", "NMJ", "Myelin", "Dorsal horn"]', '1', 'Target organs like heart, smooth muscle, and glands.'),
    (v_case_id, 'Sympathetic stimulation of heart rate is mainly mediated by:', '["M2", "Beta-1 receptors", "Alpha-2", "Nm", "GABA-B"]', '1', 'Activation of beta-1 receptors in the SA node increases heart rate.');

    -- CASE 22: Sleep Physiology
    INSERT INTO case_studies (topic_id, title, scenario) VALUES ( v_topic_id, 'Sleep Physiology', 'A student is asked to compare REM and non-REM sleep.' ) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'REM sleep is characterized by:', '["Synchronized/no dreaming", "Rapid eye movements and vivid dreaming", "Increased tone", "No fluctuation", "Only delta"]', '1', 'EEG resembles wakefulness ("Paradoxical Sleep").'),
    (v_case_id, 'Skeletal muscle tone during REM sleep is generally:', '["Increased", "Greatly reduced (atonia)", "Unchanged", "Maximal extensor", "Higher"]', '1', 'Inhibition of motor neurons prevents acting out dreams.'),
    (v_case_id, 'Night terrors are more associated with:', '["REM", "Deep non-REM sleep", "Wakefulness", "Hypothalamic", "Stage 1"]', '1', 'Unlike nightmares (REM), terrors happen in Stage 3/4 NREM.');

    -- CASE 23: EEG Rhythms
    INSERT INTO case_studies (topic_id, title, scenario) VALUES ( v_topic_id, 'EEG Rhythms', 'A physiology lab records EEG patterns in different behavioral states.' ) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Alpha waves are most associated with:', '["Deep sleep", "Relaxed wakefulness with eyes closed", "Concentration", "Seizure", "REM"]', '1', 'Characterized by 8-13 Hz frequency over the occipital cortex.'),
    (v_case_id, 'Beta activity is more associated with:', '["Alertness and active mental activity", "Deepest sleep", "Sensory silence", "Anesthesia", "Loss of consciousness"]', '0', 'Higher frequency (>13 Hz) and lower amplitude; desynchronized.'),
    (v_case_id, 'Delta waves are most associated with:', '["Relaxed wakefulness", "Deep slow-wave sleep", "REM", "Visual fixation", "Sympathetic"]', '1', 'Large, slow waves (0.5-4 Hz) in NREM Stage 3.');

    -- CASE 24: Cerebellar and Basal Ganglia Roles
    INSERT INTO case_studies (topic_id, title, scenario) VALUES ( v_topic_id, 'Cerebellar and Basal Ganglia Roles', 'A lecturer asks a student to compare motor control systems.' ) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'The cerebellum is most important for:', '["Initiating", "Coordination, timing, and error correction of movement", "Pain", "Endocrine", "Olfaction"]', '1', 'Compares intended movement with actual performance.'),
    (v_case_id, 'Basal ganglia are especially involved in:', '["Vison", "Selection and modulation of movement patterns", "Hearing", "Myelination", "Sweat"]', '1', 'Critical for planning and initiating smooth, controlled movements.'),
    (v_case_id, 'Neither cerebellum nor basal ganglia directly give rise to motor output, but influence movement through:', '["DRG", "Cerebral cortex and brainstem motor systems", "Thyroid", "Kidneys", "Retina"]', '1', 'They form massive feedback loops with the motor cortex.');

    -- CASE 25: Synaptic Plasticity and Memory
    INSERT INTO case_studies (topic_id, title, scenario) VALUES ( v_topic_id, 'Synaptic Plasticity and Memory', 'A neuroscience seminar discusses learning at the cellular level.' ) RETURNING id INTO v_case_id;
    INSERT INTO case_questions (case_id, question, options, correct_index, explanation) VALUES
    (v_case_id, 'Long-term potentiation (LTP) is thought to underlie aspects of:', '["Sensory adaptation", "Learning and memory", "Myelin only", "Hormone only", "Pain loss"]', '1', 'Persistent strengthening of synapses based on recent patterns of activity.'),
    (v_case_id, 'LTP commonly involves increased postsynaptic responsiveness via:', '["AMPA loss", "NMDA-dependent mechanisms and strengthened transmission", "Na+ inactivation", "Ca2+ abolition", "Gap junctions"]', '1', 'Glu activation of NMDA receptors allows Ca2+ entry, leading to more AMPA receptors.'),
    (v_case_id, 'Synaptic plasticity means that synapses can:', '["Never change", "Change their strength with activity", "One way forever", "ACh only", "Ignore stimulation"]', '1', 'The brain is dynamic and physically changes with experience.');

    RAISE NOTICE 'Neurophysiology Cases Migration Completed (25 Cases).';
END $$;
