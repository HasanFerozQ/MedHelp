import json

cards = [
    # 1. Error types and taxonomy: Active vs Latent, Diagnostic, Treatment, Preventive, Communication
    {
        "q": "What is an active error in patient safety?",
        "a": "An error that occurs at the <b>point of contact</b> between a healthcare worker and the patient, having an immediate effect (e.g., a nurse administering the wrong medication dose)."
    },
    {
        "q": "What is a latent error in patient safety?",
        "a": "A structural or systemic flaw that is <b>hidden within the organization</b> and design of a system, which does not cause immediate harm but sets up conditions for active errors to occur (e.g., poor staffing, confusing labels)."
    },
    {
        "q": "Give an example of a latent error leading to an active error in clinical practice.",
        "a": "A pharmacy stocks two look-alike look-sound medications next to each other (<b>latent error</b>), leading to a busy physician selecting the wrong drug during a hectic shift (<b>active error</b>)."
    },
    {
        "q": "What is the primary difference in focus between latent and active errors?",
        "a": "Active errors focus on <b>human actions</b> at the sharp end (frontline staff), whereas latent errors focus on <b>system design and structural vulnerabilities</b> at the blunt end (management, physical layout, protocols)."
    },
    {
        "q": "What is a diagnostic error?",
        "a": "An error that includes <b>delayed, missed, or incorrect diagnoses</b>, or the failure to employ indicated diagnostic tests or act on test results."
    },
    {
        "q": "What is a treatment error?",
        "a": "An error occurring during the <b>execution of a therapy</b>, such as administering the wrong drug, performing a procedure incorrectly, or delaying treatment after a diagnosis is established."
    },
    {
        "q": "What is a preventive error?",
        "a": "An error characterized by a <b>failure to provide prophylactic treatment</b>, inadequate follow-up, or failure to monitor a patient during or after therapy."
    },
    {
        "q": "What is a communication error?",
        "a": "An error resulting from <b>poor, incomplete, or absent sharing of clinical information</b> between healthcare providers or between the provider and patient."
    },
    {
        "q": "Give an example of a diagnostic error in clinical practice.",
        "a": "A clinician fails to recognize red flags of spinal epidural abscess in a back pain patient, leading to a <b>missed diagnosis</b> and subsequent paraplegia."
    },
    {
        "q": "Give an example of a treatment error in clinical practice.",
        "a": "Administering a dose of insulin that is <b>10 times higher</b> than prescribed due to misreading a handwritten order containing the abbreviation 'U' for units."
    },
    {
        "q": "Give an example of a preventive error in clinical practice.",
        "a": "Failing to prescribe <b>DVT prophylaxis</b> for a patient undergoing major orthopedic surgery who subsequently develops a fatal pulmonary embolism."
    },
    {
        "q": "Give an example of a communication error in clinical practice.",
        "a": "A resident fails to mention a critical lab result (e.g., highly elevated potassium) to the night team during cross-cover, leading to a <b>delay in treating life-threatening hyperkalemia</b>."
    },
    {
        "q": "What is a slip in cognitive error taxonomy?",
        "a": "An <b>inadvertent action</b> where the user has the correct plan but executes it incorrectly (an action-based error, e.g., reaching for drug A but picking up drug B)."
    },
    {
        "q": "What is a lapse in cognitive error taxonomy?",
        "a": "A <b>memory failure</b> where the correct plan is not executed because a step is forgotten (e.g., forgetting to check a patient's allergy status before prescribing)."
    },
    {
        "q": "What is a mistake in cognitive error taxonomy?",
        "a": "A <b>rule-based or knowledge-based error</b> where the user formulates an incorrect plan because they misapplied a rule or lacked required knowledge (e.g., treating a viral illness with antibiotics)."
    },
    {
        "q": "What is a violation in patient safety?",
        "a": "A <b>deliberate deviation</b> from established safety protocols, guidelines, or rules (e.g., bypassing a barcode scan step to save time during medication administration)."
    },
    {
        "q": "What is a near miss (or close call)?",
        "a": "An event or situation that <b>could have resulted</b> in accident, injury, or illness, but did not, either by chance or through timely intervention (e.g., wrong drug dispensed but noticed before administration)."
    },
    {
        "q": "What is an adverse event in healthcare?",
        "a": "An injury caused by <b>medical management</b> rather than the patient's underlying disease process, resulting in prolonged hospitalization, disability, or death."
    },
    {
        "q": "What is a preventable adverse event?",
        "a": "An adverse event that is attributable to an <b>error or system failure</b>, meaning it could have been avoided by following standard safety practices."
    },
    {
        "q": "What is a non-preventable adverse event?",
        "a": "An adverse event that occurred despite <b>appropriate clinical management and adherence to standard practices</b> (e.g., an unpredictable allergic reaction to a first-time dose of an antibiotic)."
    },
    {
        "q": "What is a system error in medicine?",
        "a": "An error that results from the design of the <b>entire healthcare delivery system</b> (processes, environment, resources) rather than the failure of a single individual."
    },
    {
        "q": "What is a cognitive error in medicine?",
        "a": "An error that occurs due to a <b>flaw in clinical reasoning</b>, decision-making, or information processing by the individual clinician."
    },
    {
        "q": "Define anchoring bias in diagnostic reasoning.",
        "a": "Over-relying on the <b>first piece of information</b> encountered (the 'anchor') and failing to adjust sufficiently as new data emerges (e.g., fixating on an initial diagnosis)."
    },
    {
        "q": "Define availability bias in diagnostic reasoning.",
        "a": "Overestimating the probability of a diagnosis because it comes to mind <b>easily</b>, often due to a recent, memorable, or dramatic case, rather than actual prevalence."
    },
    {
        "q": "Define confirmation bias in diagnostic reasoning.",
        "a": "Selectively seeking, interpreting, or remembering evidence that <b>supports a pre-existing hypothesis</b> while ignoring or discounting contradictory data."
    },
    {
        "q": "Define premature closure in diagnostic reasoning.",
        "a": "Accepting a diagnosis <b>before it has been fully verified</b>, stopping the search for alternatives once an initial hypothesis seems to fit (the most common cognitive error in medicine)."
    },
    {
        "q": "Define the framing effect in diagnostic reasoning.",
        "a": "The way in which clinical information is <b>presented (framed)</b> influences decision-making (e.g., selecting a treatment when described as having a 90% survival rate vs. a 10% mortality rate)."
    },
    {
        "q": "Define search satisfying bias in diagnostic reasoning.",
        "a": "Stopping the diagnostic search after finding <b>one abnormality</b>, thereby missing additional diagnoses (e.g., detecting one fracture on an X-ray and missing a second one)."
    },
    {
        "q": "Define diagnostic momentum in patient safety.",
        "a": "Once a diagnostic label is attached to a patient, it <b>gathers momentum</b> and is passed from provider to provider without critical reassessment, even if the label is incorrect."
    },
    {
        "q": "What is the Dunning-Kruger effect in clinical practice?",
        "a": "A cognitive bias where clinicians with <b>limited knowledge/expertise</b> overestimate their diagnostic ability, while experts may underestimate theirs."
    },
    {
        "q": "What is representativeness bias in diagnostic reasoning?",
        "a": "Judging the probability of a disease based on how closely the patient's presentation <b>resembles a classic prototype</b>, while ignoring the actual base rate/prevalence of the disease."
    },

    # 2. Root Cause Analysis (RCA): Definition, retrospective, goal, fishbone, process steps
    {
        "q": "What is Root Cause Analysis (RCA)?",
        "a": "A structured, step-by-step <b>retrospective investigation</b> of a serious adverse event or sentinel event to identify the underlying system vulnerabilities that caused the error."
    },
    {
        "q": "What is the design type of Root Cause Analysis (RCA)?",
        "a": "A <b>retrospective</b> design, meaning it is performed after an event has already occurred to investigate how and why it happened."
    },
    {
        "q": "What is the primary goal of a Root Cause Analysis (RCA)?",
        "a": "To identify <b>systemic vulnerabilities and process flaws</b> that contributed to the error and modify them to prevent future occurrences, rather than placing blame on individuals."
    },
    {
        "q": "Does Root Cause Analysis (RCA) assign individual blame?",
        "a": "<b>No</b>. RCA operates on the principle that most medical errors are caused by flawed systems, not bad people, and actively avoids assigning individual blame."
    },
    {
        "q": "Who should be included in an RCA multidisciplinary team?",
        "a": "Frontline providers involved in the event, subject matter experts, patient safety officers, and individuals with <b>process design authority</b> (e.g., administration or leadership)."
    },
    {
        "q": "What is the first step of a Root Cause Analysis (RCA)?",
        "a": "<b>Define the event</b> and map out the timeline of what happened, gathering objective data, medical records, and interviewing those involved."
    },
    {
        "q": "What is the 'Five Whys' technique in Root Cause Analysis?",
        "a": "A simple troubleshooting method where the team repeatedly asks <b>'Why?'</b> (typically five times) to drill down through successive layers of cause-and-effect to find the root cause."
    },
    {
        "q": "What is a Fishbone (Ishikawa) diagram?",
        "a": "A visual tool used in RCA to organize and categorize potential causes of a problem, resembling the skeleton of a fish with the main problem at the 'head' and causes branching off as 'bones'."
    },
    {
        "q": "What are the typical categories ('bones') in a healthcare Fishbone diagram?",
        "a": "<b>People</b> (staffing, training), <b>Equipment</b> (machines, tools), <b>Environment</b> (lighting, noise), <b>Procedures</b> (protocols, guidelines), and <b>Policies</b> (organizational rules)."
    },
    {
        "q": "What is the difference between a root cause and a contributing factor?",
        "a": "A <b>root cause</b> is the fundamental reason that, if eliminated, would prevent recurrence. A <b>contributing factor</b> makes the event more likely but does not independently cause it."
    },
    {
        "q": "What type of event typically triggers a Root Cause Analysis?",
        "a": "A <b>sentinel event</b> (unexpected death or serious physical/psychological injury) or a high-risk 'near miss' that exposes major systemic vulnerabilities."
    },
    {
        "q": "What is the final step/output of a Root Cause Analysis (RCA)?",
        "a": "Developing a concrete, actionable <b>action plan</b> with specific measures, responsible owners, timelines, and metrics to prevent the error from happening again."
    },
    {
        "q": "What is a 'Just Culture' in the context of RCA reporting?",
        "a": "A culture that encourages <b>open, honest reporting</b> of errors by distinguishing between human slips (which are coached) and reckless, intentional violations (which face disciplinary action)."
    },
    {
        "q": "How does Root Cause Analysis (RCA) differ from peer review?",
        "a": "RCA focuses on <b>system design</b> and processes, while peer review evaluates <b>individual performance</b> and professional competence."
    },
    {
        "q": "What is the timeframe recommended by The Joint Commission to complete an RCA?",
        "a": "Within <b>45 days</b> of the event occurring or its discovery."
    },
    {
        "q": "What is a common limitation of Root Cause Analysis?",
        "a": "It is susceptible to <b>hindsight bias</b> (evaluators knowing the outcome makes them judge actions more spiral-like/harshly) and relies on subjective retrospective memory."
    },
    {
        "q": "Why is patient/family involvement in RCA considered but often restricted?",
        "a": "They provide valuable information on the timeline, but full participation is often restricted to protect <b>confidentiality and peer-review privilege</b> in legal contexts."
    },
    {
        "q": "What is the purpose of drawing a timeline in RCA?",
        "a": "To establish the exact sequence of events without interpretation, which helps prevent <b>premature conclusions</b> about what caused the error."
    },
    {
        "q": "What is a 'cause-and-effect' diagram in RCA?",
        "a": "Another name for the <b>Fishbone (Ishikawa) diagram</b>, which traces how various inputs and system failures combined to produce the adverse event."
    },
    {
        "q": "How does the team verify a root cause in RCA?",
        "a": "By testing if removing that specific cause <b>prevents the event</b> from occurring, or if its presence consistently reproduces the vulnerability."
    },
    {
        "q": "What is the role of leadership in the RCA process?",
        "a": "To provide resources, support the team's recommendations, and ensure the <b>implementation and monitoring</b> of the final action plan."
    },
    {
        "q": "What is an action plan effectiveness measure in RCA?",
        "a": "A predefined metric (e.g., audit results, compliance rates) used to <b>evaluate whether the changes</b> made after the RCA actually reduced the risk of error."
    },
    {
        "q": "Which of the following is the strongest RCA action plan recommendation?",
        "a": "Implementing a <b>forcing function</b> (e.g., computer system block or physical lockout) is strong; providing retraining or writing a new policy is considered a weak recommendation."
    },
    {
        "q": "Why are training and policies considered 'weak' recommendations in an RCA?",
        "a": "Because they rely on <b>human memory and vigilance</b>, which are highly susceptible to fatigue, stress, and distraction."
    },
    {
        "q": "What is a 'medium strength' action plan recommendation in RCA?",
        "a": "Simplifying processes, standardizing equipment, or introducing checklists (which reduce cognitive load but still rely on human compliance)."
    },

    # 3. Failure Mode and Effects Analysis (FMEA): Definition, prospective, goal, RPN calculation
    {
        "q": "What is Failure Mode and Effects Analysis (FMEA)?",
        "a": "A structured, <b>prospective</b> analysis tool used to identify potential failure points in a process before they occur and determine their impact."
    },
    {
        "q": "What is the design type of Failure Mode and Effects Analysis (FMEA)?",
        "a": "A <b>prospective</b> design, meaning it is conducted before a system or process is implemented (or to audit an existing one) to anticipate and prevent errors."
    },
    {
        "q": "What is the primary goal of FMEA?",
        "a": "To identify where a process might fail (<b>failure modes</b>) and implement preventive measures to design those errors out of the system before they can harm a patient."
    },
    {
        "q": "What is a 'failure mode' in FMEA?",
        "a": "The specific way in which a step in a process <b>could fail</b> to meet its intended function (e.g., pharmacy scanner failing to read a barcode)."
    },
    {
        "q": "What is an 'effect' in FMEA?",
        "a": "The clinical or operational <b>consequence of a failure mode</b> on the patient or the system (e.g., patient receives the wrong medication, causing anaphylaxis)."
    },
    {
        "q": "What is the Risk Priority Number (RPN) in FMEA?",
        "a": "A numerical score calculated for each potential failure mode to <b>prioritize which issues</b> need to be addressed first."
    },
    {
        "q": "What is the formula to calculate the Risk Priority Number (RPN) in FMEA?",
        "a": "$\\\\text{RPN} = \\\\text{Severity (S)} \\\\times \\\\text{Occurrence (O)} \\\\times \\\\text{Detection (D)}$"
    },
    {
        "q": "In FMEA, what does Severity (S) measure and what is its typical scale?",
        "a": "Measures the <b>seriousness of the consequences</b> of the failure mode, typically scored on a scale from 1 (no effect) to 10 (catastrophic/death)."
    },
    {
        "q": "In FMEA, what does Occurrence (O) measure and what is its typical scale?",
        "a": "Measures the <b>likelihood or frequency</b> that the failure mode will occur, typically scored on a scale from 1 (highly unlikely) to 10 (inevitable)."
    },
    {
        "q": "In FMEA, what does Detection (D) measure and what is its typical scale?",
        "a": "Measures the likelihood that the failure mode will be <b>detected before reaching the patient</b>, typically scored on a scale from 1 (almost certain to detect) to 10 (impossible to detect)."
    },
    {
        "q": "Calculate the RPN if Severity (S) = 8, Occurrence (O) = 4, and Detection (D) = 5.",
        "a": "$\\\\text{RPN} = 8 \\\\times 4 \\\\times 5 = 160$."
    },
    {
        "q": "What does a high Risk Priority Number (RPN) indicate in FMEA?",
        "a": "A <b>critical vulnerability</b> in the system that requires immediate corrective action, process redesign, or safety safeguards."
    },
    {
        "q": "What is the first step in conducting an FMEA?",
        "a": "Define the process to be analyzed, assemble a multidisciplinary team, and <b>map out the process flow</b> in detail (e.g., using a flowchart)."
    },
    {
        "q": "How do FMEA and RCA differ in their relationship to an error?",
        "a": "<b>FMEA is proactive</b> (aims to prevent potential errors), whereas <b>RCA is reactive</b> (aims to understand a past error)."
    },
    {
        "q": "What is the final outcome of a completed FMEA process?",
        "a": "A prioritized list of potential failures with <b>redesigned process steps</b> and assigned actions to reduce the RPNs of high-risk items."
    },

    # 4. Quality Improvement (QI) methodologies: PDSA cycle, Lean, Six Sigma
    {
        "q": "What does the PDSA cycle stand for in Quality Improvement?",
        "a": "<b>Plan, Do, Study, Act</b>. It is an iterative, four-stage model for testing and implementing change."
    },
    {
        "q": "What occurs during the 'Plan' phase of a PDSA cycle?",
        "a": "The team identifies the problem, sets an objective, formulates a <b>plan for change</b>, and predicts the outcomes and how data will be collected."
    },
    {
        "q": "What occurs during the 'Do' phase of a PDSA cycle?",
        "a": "The team carries out the test or change on a <b>small scale</b> (e.g., trying a new protocol with one doctor or on one ward for one day)."
    },
    {
        "q": "What occurs during the 'Study' phase of a PDSA cycle?",
        "a": "The team <b>analyzes the data</b> collected during the 'Do' phase, compares the results to their initial predictions, and summarizes what was learned."
    },
    {
        "q": "What occurs during the 'Act' phase of a PDSA cycle?",
        "a": "Based on the 'Study' phase, the team decides to <b>adopt</b> the change, <b>adapt</b> it (modify and retest), or <b>abandon</b> it."
    },
    {
        "q": "Why is the PDSA cycle designed to be iterative?",
        "a": "To allow teams to test changes in <b>rapid, low-risk cycles</b>, learning from failures early and adjusting before wide-scale implementation."
    },
    {
        "q": "What is Lean methodology in healthcare?",
        "a": "A quality improvement approach focused on <b>maximizing patient value</b> by identifying and eliminating waste (non-value-added steps) in processes."
    },
    {
        "q": "What is the primary goal of Lean methodology?",
        "a": "To streamline processes, reduce cycle times, and <b>eliminate waste</b> (called 'muda') so that every step adds value to the patient."
    },
    {
        "q": "Name the 8 wastes of Lean in healthcare (mnemonic: DOWNTIME).",
        "a": "<b>D</b>efects, <b>O</b>verproduction, <b>W</b>aiting, <b>N</b>on-utilized talent, <b>T</b>ransportation, <b>I</b>nventory, <b>M</b>otion, <b>E</b>xtra-processing."
    },
    {
        "q": "What is Value-Stream Mapping (VSM) in Lean?",
        "a": "A visual mapping tool that charts every step in a process from start to finish, categorizing each step as either <b>value-adding</b> or <b>waste</b>."
    },
    {
        "q": "What is 'Kaizen' in Lean methodology?",
        "a": "A philosophy of <b>continuous improvement</b> involving all employees, typically implemented through short, focused team events ('Kaizen blitzes') to solve a specific process problem."
    },
    {
        "q": "What is the '5S' system in Lean methodology?",
        "a": "A workplace organization method: <b>Sort</b> (remove unneeded items), <b>Straighten</b> (organize), <b>Shine</b> (clean), <b>Standardize</b> (make rules), and <b>Sustain</b> (discipline)."
    },
    {
        "q": "What is Six Sigma methodology?",
        "a": "A data-driven methodology focused on improving quality by <b>reducing variation and defects</b> in processes."
    },
    {
        "q": "What is the primary goal of Six Sigma?",
        "a": "To achieve near-perfect process output by reducing defects to no more than <b>3.4 defects per million opportunities</b>."
    },
    {
        "q": "What is the DMAIC framework in Six Sigma?",
        "a": "A structured problem-solving cycle used to improve existing processes: <b>Define, Measure, Analyze, Improve, Control</b>."
    },
    {
        "q": "What occurs during the 'Define' phase of Six Sigma DMAIC?",
        "a": "The team defines the project goal, the customer (patient) requirements, and the specific process problem to be solved."
    },
    {
        "q": "What occurs during the 'Measure' phase of Six Sigma DMAIC?",
        "a": "The team collects baseline data on the current process performance and validates the measurement system."
    },
    {
        "q": "What occurs during the 'Analyze' phase of Six Sigma DMAIC?",
        "a": "The team reviews the data to identify the <b>root causes of defects</b> and process variation."
    },
    {
        "q": "What occurs during the 'Improve' phase of Six Sigma DMAIC?",
        "a": "The team designs, tests, and implements solutions to eliminate the root causes of variation."
    },
    {
        "q": "What occurs during the 'Control' phase of Six Sigma DMAIC?",
        "a": "The team establishes monitoring protocols (e.g., control charts) to ensure that the improvements are <b>sustained over time</b>."
    },
    {
        "q": "What is a Run Chart in Quality Improvement?",
        "a": "A line graph displaying data over time, used to identify <b>trends, shifts, or runs</b> in a process to see if a QI intervention made a difference."
    },
    {
        "q": "What is a Control Chart (Statistical Process Control)?",
        "a": "A run chart that includes mathematically calculated <b>upper and lower control limits</b> (typically $\\\\pm 3\\\\text{ standard deviations}$ from the mean) to differentiate common-cause variation from special-cause variation."
    },
    {
        "q": "What is the difference between common-cause and special-cause variation?",
        "a": "<b>Common-cause</b> is inherent to the system (predictable noise); <b>special-cause</b> arises from an external factor/event (unpredictable signal) requiring investigation."
    },
    {
        "q": "What is a Pareto Chart and what does it display?",
        "a": "A bar graph that ranks causes of problems from most to least frequent, with a cumulative percentage line. It helps identify the <b>'vital few'</b> issues that cause the most defects."
    },
    {
        "q": "What is the 80/20 rule represented by the Pareto Chart?",
        "a": "The principle that roughly <b>80% of problems</b> are caused by <b>20% of the root causes</b>, helping teams focus effort where it will have the greatest impact."
    },
    {
        "q": "What is a key difference in focus between Lean and Six Sigma?",
        "a": "<b>Lean</b> focuses on speed, efficiency, and eliminating waste, whereas <b>Six Sigma</b> focuses on quality, precision, and reducing variation."
    },
    {
        "q": "What is a Process Map (flowchart) in Quality Improvement?",
        "a": "A visual tool that outlines the sequential steps of a workflow, used to understand the current state and identify <b>redundancies or bottlenecks</b>."
    },
    {
        "q": "What is a Histogram in Quality Improvement?",
        "a": "A bar chart representing the frequency distribution of continuous data, used to visualize the <b>shape and spread</b> of process outcomes."
    },

    # 5. Key safety protocols: Handoff protocols (I-PASS), surgical time-out, read-back protocols, CPOE, med rec
    {
        "q": "What is the I-PASS handoff protocol?",
        "a": "A validated, standardized communication framework designed to reduce clinical errors during patient handoffs (transfers of care)."
    },
    {
        "q": "In the I-PASS protocol, what does the 'I' stand for?",
        "a": "<b>Illness severity</b> (e.g., Stable, Watcher, Unstable)."
    },
    {
        "q": "In the I-PASS protocol, what does the 'P' stand for?",
        "a": "<b>Patient summary</b> (a brief overview of the patient's diagnoses, hospital course, and treatment plan)."
    },
    {
        "q": "In the I-PASS protocol, what does the 'A' stand for?",
        "a": "<b>Action list</b> (to-do list for the receiving clinician, with clear ownership and deadlines)."
    },
    {
        "q": "In the I-PASS protocol, what does the first 'S' stand for?",
        "a": "<b>Situation awareness and contingency planning</b> (what to watch out for and what to do if the patient decompensates)."
    },
    {
        "q": "In the I-PASS protocol, what does the second 'S' stand for?",
        "a": "<b>Synthesis by receiver</b> (the receiver asks questions and briefly summarizes back the key points to confirm understanding)."
    },
    {
        "q": "Why is a structured handoff protocol like I-PASS critical for patient safety?",
        "a": "It minimizes the risk of <b>information loss</b> and miscommunication, which are among the most common causes of preventable adverse events."
    },
    {
        "q": "What is a surgical 'time-out'?",
        "a": "A planned pause by the entire surgical team immediately before the incision is made, to perform a final verification of the patient, site, and procedure."
    },
    {
        "q": "When must the surgical time-out take place?",
        "a": "<b>Immediately before</b> the surgical incision or start of the procedure."
    },
    {
        "q": "What three core verifications must occur during a surgical time-out?",
        "a": "Verify the <b>correct patient</b>, the <b>correct surgical site</b> (which should be physically marked), and the <b>correct procedure</b>."
    },
    {
        "q": "Who must participate in a surgical time-out?",
        "a": "<b>All active members</b> of the surgical team, including the surgeon, anesthesia provider, circulating nurse, and surgical scrub tech."
    },
    {
        "q": "What is a read-back protocol?",
        "a": "A verbal communication safety protocol where the receiver of an oral order or critical lab result repeats it back word-for-word, and the sender confirms it is correct."
    },
    {
        "q": "When is a read-back protocol mandatory in clinical practice?",
        "a": "When receiving <b>verbal orders, telephone orders</b>, or when critical lab results are reported over the phone."
    },
    {
        "q": "What is Computerized Physician Order Entry (CPOE)?",
        "a": "A system that allows direct entry of medical orders (meds, labs, imaging) into a computer system rather than writing them by hand."
    },
    {
        "q": "How does CPOE improve patient safety?",
        "a": "It eliminates <b>handwriting illegibility</b>, standardizes dosing ranges, and screens for drug-drug interactions or allergies in real-time."
    },
    {
        "q": "What is a Clinical Decision Support System (CDSS)?",
        "a": "An active computer system that matches patient characteristics with a clinical knowledge base to provide custom alerts, recommendations, or guidelines to the clinician."
    },
    {
        "q": "What is 'alert fatigue' in safety informatics?",
        "a": "A phenomenon where clinicians become desensitized to safety warnings because of a <b>high volume of clinically insignificant alerts</b>, leading them to bypass critical warnings."
    },
    {
        "q": "What is medication reconciliation?",
        "a": "The process of creating the most accurate list possible of all medications a patient is taking and comparing it against the physician's admission, transfer, or discharge orders."
    },
    {
        "q": "When must medication reconciliation be performed?",
        "a": "At <b>every transition of care</b>: admission to the hospital, transfer between units (e.g., ICU to floor), and discharge home."
    },
    {
        "q": "What is the 'two-identifier' rule for patient identification?",
        "a": "The requirement to use at least two independent patient identifiers (e.g., <b>full name and date of birth</b>) prior to administering medications, drawing blood, or performing procedures."
    },
    {
        "q": "What is a surgical site marking protocol?",
        "a": "A safety protocol where the operating surgeon physically marks the surgical site <b>with their initials</b> prior to the patient entering the operating room."
    },
    {
        "q": "How does barcode medication administration (BCMA) prevent errors?",
        "a": "By scanning the patient's ID band and the drug packaging to verify the <b>5 Rights</b> (patient, drug, dose, route, time) at the point of administration."
    },
    {
        "q": "What is closed-loop communication in healthcare teams?",
        "a": "A communication technique where the sender states a message, the receiver repeats it back, and the sender confirms the accuracy (e.g., during resuscitations)."
    },

    # 6. Sentinel events: Definition, Swiss cheese model, culture of safety, second victim
    {
        "q": "What is the Joint Commission's definition of a Sentinel Event?",
        "a": "An unexpected occurrence involving <b>death, permanent harm, or severe temporary harm</b> (such as loss of a limb or function) that is not related to the natural course of the patient's illness."
    },
    {
        "q": "Give an example of a sentinel event involving wrong site/patient.",
        "a": "Performing a left-sided thoracentesis on a patient who was scheduled for a right-sided procedure (<b>wrong-site surgery</b>)."
    },
    {
        "q": "Give an example of a sentinel event involving security/care environment.",
        "a": "An infant abduction from the newborn nursery, or the <b>suicide</b> of a patient in a round-the-clock psychiatric facility."
    },
    {
        "q": "What is the Swiss Cheese Model of system errors?",
        "a": "A safety model illustrating that systems have multiple defensive layers (slices), but each has vulnerabilities (holes); an error occurs when holes in all layers align."
    },
    {
        "q": "In the Swiss Cheese Model, what do the 'holes' represent?",
        "a": "<b>Latent vulnerabilities or active failures</b> at different levels of the system."
    },
    {
        "q": "In the Swiss Cheese Model, what do the 'slices of cheese' represent?",
        "a": "<b>Defensive safeguards</b> or barriers built into the system (e.g., checklists, CPOE, read-back protocols, physical guards)."
    },
    {
        "q": "Who popularized the Swiss Cheese Model of organizational accidents?",
        "a": "<b>James Reason</b>, a cognitive psychologist who specialized in human error and system safety."
    },
    {
        "q": "What defines a 'Culture of Safety' in a healthcare organization?",
        "a": "An environment where safety is a top priority, staff feel safe reporting errors without fear of retribution, and errors are viewed as opportunities to improve systems."
    },
    {
        "q": "What is a 'blame-free' reporting system?",
        "a": "A reporting system where staff are not punished for reporting honest mistakes (slips/lapses), ensuring high rates of error disclosure to identify systemic flaws."
    },
    {
        "q": "What is the 'Second Victim' phenomenon?",
        "a": "The emotional distress, guilt, anxiety, or depression experienced by a <b>healthcare provider</b> who was involved in a serious medical error that harmed a patient."
    },
    {
        "q": "Who is the 'second victim' in a medical error?",
        "a": "The <b>healthcare professional</b> involved in the event (the patient is the primary victim)."
    },
    {
        "q": "What support should be provided to a 'second victim'?",
        "a": "Peer support programs, psychological counseling (e.g., Employee Assistance Program), and a <b>non-punitive debriefing</b> of the event."
    },
    {
        "q": "What is the ethical requirement for disclosing medical errors to patients?",
        "a": "Clinicians must provide a <b>prompt, honest, and empathetic disclosure</b> of the error to the patient/family, including what happened, immediate steps to mitigate harm, and how it will be prevented."
    },
    {
        "q": "Does disclosing a medical error increase the risk of malpractice lawsuits?",
        "a": "<b>No</b>. Studies show that honest disclosure, accompanied by an apology and explanation, actually <b>decreases</b> the likelihood of lawsuits and reduces litigation costs."
    },
    {
        "q": "What is a 'Never Event'?",
        "a": "A subclass of sentinel events that are particularly shocking, unambiguous, and <b>completely preventable</b> (e.g., leaving a surgical sponge inside a patient)."
    },
    {
        "q": "How do 'Never Events' differ from 'Sentinel Events'?",
        "a": "Never events are a defined list of <b>egregious, preventable events</b> (often linked to non-reimbursement), while sentinel events are defined by the severity of the patient outcome (death/harm)."
    },
    {
        "q": "What is a 'forcing function' in safety design?",
        "a": "A physical or digital design constraint that <b>makes it impossible</b> to perform an incorrect action (e.g., enteral feeding tubes that cannot physically connect to IV lines)."
    },
    {
        "q": "Give an example of a forcing function for high-alert medications.",
        "a": "Storing concentrated potassium chloride ampules <b>only in the pharmacy</b>, preventing staff from accidentally injecting it directly on the ward without dilution."
    },
    {
        "q": "What is Human Factors Engineering?",
        "a": "The study of how humans interact with systems, equipment, and environments, aiming to design processes that <b>accommodate human cognitive and physical limitations</b>."
    },
    {
        "q": "What is Crew Resource Management (CRM) in healthcare?",
        "a": "A safety training framework adapted from aviation focusing on <b>interpersonal communication, teamwork, situational awareness, and flat hierarchies</b> (anyone can speak up for safety)."
    },
    {
        "q": "What is the difference between a workaround and a forcing function?",
        "a": "A <b>workaround</b> is an informal bypass of a safety protocol (increases risk), while a <b>forcing function</b> is a hard system barrier that cannot be bypassed."
    },
    {
        "q": "What is a safety culture survey (e.g., SAQ or AHRQ SOPS)?",
        "a": "A standardized assessment tool used to <b>measure staff perceptions</b> of safety culture, communication, leadership support, and reporting behavior within a clinical unit."
    },
    {
        "q": "What is high-reliability organization (HRO) theory in healthcare?",
        "a": "A framework for operating in complex, hazardous environments with <b>consistently low rates of error</b> through preoccupation with failure, reluctance to simplify, and deference to expertise."
    },
    {
        "q": "What does 'reluctance to simplify' mean in HRO theory?",
        "a": "Rejecting simple explanations for problems and instead digging deep into the <b>complexity of processes and systemic factors</b> during analysis."
    },
    {
        "q": "What does 'deference to expertise' mean in HRO theory?",
        "a": "During an emergency, decision-making authority shifts to the person with the most <b>topic-specific expertise</b>, regardless of their hierarchical rank or seniority."
    },
    {
        "q": "What does 'preoccupation with failure' mean in HRO theory?",
        "a": "Constantly scanning the system for potential weaknesses and treating every near miss as a symptom of a larger systemic vulnerability."
    },
    {
        "q": "What is psychological safety in a clinical team?",
        "a": "The belief that one will not be punished, humiliated, or rejected for speaking up with ideas, questions, concerns, or mistakes."
    },
    {
        "q": "Why is psychological safety critical for patient safety?",
        "a": "It empowers junior staff or nurses to <b>speak up or stop a procedure</b> if they see a potential error, breaking down harmful hierarchies."
    },
    {
        "q": "What is the 'Two-Challenge Rule' in team communication?",
        "a": "An advocacy/assertion protocol where a team member must state their concern at least <b>twice</b> if ignored, after which they must escalate up the chain of command."
    },
    {
        "q": "What is the CUS tool in team communication?",
        "a": "A standardized communication tool to escalate concerns: I am <b>C</b>oncerned, I am <b>U</b>ncomfortable, this is a <b>S</b>afety issue."
    },
    {
        "q": "Give an example of using the CUS tool in a clinical scenario.",
        "a": "'I am <b>C</b>oncerned about this patient\\'s rising heart rate; I am <b>U</b>ncomfortable giving another fluid bolus; this is a <b>S</b>afety issue because of potential pulmonary edema.'"
    },
    {
        "q": "What is a brief in team communication?",
        "a": "A short, proactive meeting held <b>before</b> a shift or procedure to assign roles, establish expectations, and anticipate potential safety issues."
    },
    {
        "q": "What is a debrief in team communication?",
        "a": "A reflective meeting held <b>after</b> an event or shift to review what went well, what could be improved, and identify systemic concerns."
    },
    {
        "q": "What is a huddle in team communication?",
        "a": "An ad-hoc, quick meeting held <b>during</b> a shift to re-evaluate the plan, solve problem situations, or redistribute workload."
    },
    {
        "q": "What is the difference between a near miss and a sentinel event in terms of reporting?",
        "a": "Both must be reported; however, near misses are analyzed to <b>prevent future harm</b> without the urgency of a sentinel event's full Joint Commission reporting mandate."
    },
    {
        "q": "What is a major barrier to reporting near misses?",
        "a": "Fear of administrative reprisal, lack of time, complicated reporting software, or the belief that no action will be taken based on the report."
    },
    {
        "q": "What is the 'sharp end' vs. 'blunt end' concept in safety science?",
        "a": "The <b>sharp end</b> is the point of contact with patients where active errors occur; the <b>blunt end</b> is the organizational hierarchy where latent decisions are made."
    },
    {
        "q": "What is standardize-and-simplify as a safety design principle?",
        "a": "Reducing the number of steps in a process and making them uniform to <b>minimize reliance on human memory</b> and variation in performance."
    },
    {
        "q": "What is the role of physical constraints in safety design?",
        "a": "Physical constraints prevent incorrect actions (e.g., gas outlets in patient rooms having <b>unique shapes</b> so oxygen lines cannot connect to nitrous oxide outlets)."
    },
    {
        "q": "What is the difference between a checklist and a cognitive aid?",
        "a": "A <b>checklist</b> verifies that critical steps were done; a <b>cognitive aid</b> provides clinical information or decision pathways during a crisis (e.g., ACLS algorithms)."
    },
    {
        "q": "What is situational awareness in patient safety?",
        "a": "The cognitive state of <b>knowing what is going on</b> around you, understanding the clinical status of the team, and anticipating future changes."
    },
    {
        "q": "What is the 'nudge' concept in clinical decision support?",
        "a": "A subtle design change in the system that alters clinician behavior in a predictable way without forbidding any options (e.g., pre-selecting the generic drug option)."
    },
    {
        "q": "What is clinical audit in quality improvement?",
        "a": "A systematic review of care against <b>explicit criteria</b>, followed by the implementation of change and re-evaluation to ensure standards are met."
    },
    {
        "q": "What is benchmarking in healthcare quality?",
        "a": "Comparing one\\'s own performance metrics against <b>industry best practices</b> or top-performing peer organizations to identify areas for improvement."
    },
    {
        "q": "What is the 'triple aim' of healthcare improvement?",
        "a": "Improving the <b>patient experience</b> of care, improving the <b>health of populations</b>, and <b>reducing the per capita cost</b> of healthcare."
    }
]

# Write out to target path
with open(r"c:\Users\Hasan-PC\Desktop\MedHelp\scratch\cards_ethics_safety.js", "w", encoding="utf-8") as f:
    f.write("const CARDS_ETHICS_SAFETY = [\n")
    for i, c in enumerate(cards):
        # Escape quotes for safety in JS
        q_esc = c["q"].replace('"', '\\"')
        a_esc = c["a"].replace('"', '\\"')
        comma = "," if i < len(cards) - 1 else ""
        f.write(f'  {{ q: "{q_esc}", a: "{a_esc}" }}{comma}\n')
    f.write("];\n")

print(f"Successfully generated {len(cards)} cards.")
