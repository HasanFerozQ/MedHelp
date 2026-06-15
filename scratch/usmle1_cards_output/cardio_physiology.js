// Cardiovascular Physiology - USMLE 1
// Combined card set from both provided batches
// Math notation: LaTeX wrapped in $...$ or $$...$$ - rendered via MathJax

const cardioCards = [
  // ==========================================
  // SECTION 1: CARDIAC MYOCYTE ELECTROPHYSIOLOGY
  // ==========================================
  {
    q: "What are the five phases of the ventricular action potential, and which primary ion currents dominate each phase?",
    a: "<b>Phase 0 (Rapid Depolarization):</b> Voltage-gated fast Na⁺ channels open → massive inward I<sub>Na</sub>.<br><b>Phase 1 (Early Repolarization):</b> Na⁺ channels inactivate; transient outward K⁺ current (I<sub>to</sub>) activates.<br><b>Phase 2 (Plateau):</b> Balanced inward Ca²⁺ via L-type channels (I<sub>Ca,L</sub>) and outward delayed rectifier K⁺ (I<sub>K</sub>).<br><b>Phase 3 (Rapid Repolarization):</b> L-type Ca²⁺ channels close; massive K⁺ efflux via I<sub>Kr</sub>, I<sub>Ks</sub>, I<sub>K1</sub>.<br><b>Phase 4 (Resting Potential):</b> ~−90 mV maintained by high K⁺ permeability via inward rectifier I<sub>K1</sub> channels."
  },
  {
    q: "What is the primary role of the inward rectifier K⁺ channel (I<sub>K1</sub>) during Phase 4 of ventricular myocytes?",
    a: "The I<sub>K1</sub> channel maintains high background potassium permeability at rest, anchoring the resting membrane potential close to the K⁺ equilibrium potential (E<sub>K</sub> ≈ −96 mV).<br>This <b>prevents spontaneous depolarization</b> in working myocardium."
  },
  {
    q: "How does the pacemaker action potential (SA/AV nodes) differ fundamentally from the ventricular action potential?",
    a: "<ul><li><b>No Phase 1 or Phase 2</b> plateau phase exists.</li><li><b>Phase 0 upstroke</b> is slow, mediated exclusively by L-type Ca²⁺ channels — not fast Na⁺ channels.</li><li><b>Phase 4 shows spontaneous diastolic depolarization</b> driven by the pacemaker 'funny' current (I<sub>f</sub>) — a hyperpolarization-activated mixed Na⁺/K⁺ current through HCN channels.</li></ul>"
  },
  {
    q: "Why do pacemaker cells (SA and AV nodes) lack a Phase 1 and Phase 2 plateau?",
    a: "Pacemaker cells <b>do not express fast voltage-gated Na⁺ channels</b> or high-density inward rectifier K⁺ channels (I<sub>K1</sub>) found in working myocytes.<br>Their electrical cycle is dominated by slower Ca²⁺ and K⁺ fluxes."
  },
  {
    q: "What ionic current is responsible for Phase 0 upstroke in the SA node?",
    a: "Phase 0 in nodal tissue is mediated entirely by inward Ca²⁺ current through voltage-gated <b>L-type Ca²⁺ channels</b> (I<sub>Ca,L</sub>).<br>This explains the <b>significantly slower conduction velocity</b> of nodal tissue compared to Purkinje fibers."
  },
  {
    q: "What is the molecular mechanism of Phase 4 spontaneous diastolic depolarization in the SA node?",
    a: "Phase 4 depolarization is driven primarily by the <b>funny current (I<sub>f</sub>)</b> — an inward mixed Na⁺/K⁺ current through <b>Hyperpolarization-activated Cyclic Nucleotide-gated (HCN) channels</b> that slowly open as the membrane repolarizes below −50 mV."
  },
  {
    q: "What cellular mechanism explains the positive chronotropic effect of catecholamines on pacemaker cells?",
    a: "<ol><li>Catecholamines bind to <b>β₁-adrenergic receptors</b></li><li>→ G<sub>αs</sub> activation → ↑ adenylyl cyclase → ↑ cAMP</li><li>cAMP binds directly to <b>HCN channels</b>, increasing I<sub>f</sub></li><li>PKA phosphorylates L-type Ca²⁺ channels, increasing I<sub>Ca,L</sub></li></ol><b>Net effect:</b> Steeper slope of Phase 4 diastolic depolarization → reaches threshold faster → ↑ heart rate."
  },
  {
    q: "What cellular mechanism mediates the negative chronotropic effect of Acetylcholine (ACh) on the SA node?",
    a: "<ol><li>ACh binds <b>M₂ muscarinic receptors</b> → G<sub>αi</sub> → ↓ adenylyl cyclase → ↓ cAMP → ↓ I<sub>f</sub> and ↓ I<sub>Ca,L</sub></li><li>G<sub>βγ</sub> subunits directly open <b>GIRK channels</b> (I<sub>K,ACh</sub>), hyperpolarizing the cell</li></ol><b>Net effect:</b> Flatter Phase 4 slope + more negative resting baseline → slower heart rate."
  },
  {
    q: "What is the physiological significance of the Effective Refractory Period (ERP) in ventricular myocytes?",
    a: "The ERP is the period during which fast Na⁺ channels are locked in their <b>inactivated state</b>, preventing a second action potential from being triggered.<br><b>Clinical significance:</b> Prevents sustained tetanic contractions of cardiac muscle, safeguarding diastole for ventricular filling."
  },
  {
    q: "What distinguishes the Relative Refractory Period (RRP) from the Effective Refractory Period (ERP)?",
    a: "During the RRP, a <b>fraction of fast Na⁺ channels have recovered</b> from inactivation.<br>A <b>suprathreshold stimulus</b> can trigger an action potential, but it displays:<ul><li>Slower Phase 0 upstroke velocity</li><li>Lower amplitude</li><li>Slower tissue propagation</li></ul>"
  },
  {
    q: "Rank the components of the cardiac conduction system from fastest to slowest conduction velocity.",
    a: "<ol><li><b>Purkinje fibers:</b> ~4.0 m/s (fastest)</li><li><b>Atria/Ventricles:</b> ~1.0 m/s</li><li><b>AV Node:</b> ~0.05 m/s (slowest)</li></ol><b>Clinical purpose:</b> Slow AV nodal conduction ensures atrial contraction completes before ventricular systole."
  },
  {
    q: "What structural features allow Purkinje fibers to conduct action potentials so rapidly?",
    a: "<ul><li>Large cell diameter → low internal resistance</li><li>High density of fast voltage-gated Na⁺ channels (I<sub>Na</sub>)</li><li>Abundant high-conductance <b>gap junctions (connexins)</b> in intercalated discs</li></ul>"
  },
  {
    q: "What physiological mechanism delays conduction through the AV node, and what is its purpose?",
    a: "<b>Cause of delay:</b><ul><li>Small cell diameter, tortuous fiber orientation</li><li>Fewer gap junctions</li><li>Reliance on slow L-type Ca²⁺ channels for Phase 0</li></ul><b>Purpose:</b> Ensures atrial systole finishes emptying blood into ventricles <b>before</b> ventricular contraction begins."
  },
  {
    q: "How does Class I antiarrhythmic drug binding alter the ventricular action potential?",
    a: "Class I agents block fast voltage-gated Na⁺ channels, resulting in:<ul><li>↓ Slope and amplitude of <b>Phase 0</b> upstroke (↓ V<sub>max</sub>)</li><li>↓ Tissue conduction velocity</li><li>Shift of threshold to more positive potential</li></ul>"
  },
  {
    q: "By what mechanism do Class III antiarrhythmic drugs extend the QT interval on a surface ECG?",
    a: "Class III agents selectively inhibit delayed rectifier K⁺ channels (primarily I<sub>Kr</sub>).<br>This reduces outward K⁺ efflux, <b>prolonging Phase 3 repolarization</b> and expanding the overall action potential duration → widened QT interval."
  },
  {
    q: "What cellular condition triggers Early Afterdepolarizations (EADs), and what arrhythmia can they initiate?",
    a: "<b>Trigger:</b> Prolonged action potential duration (e.g., from Class III drugs, hypokalemia) allows reactivation of L-type Ca²⁺ channels during Phase 2–3.<br><b>Arrhythmia triggered:</b> <b>Torsades de Pointes</b> (a polymorphic ventricular tachycardia)."
  },
  {
    q: "What cellular condition triggers Delayed Afterdepolarizations (DADs), and what clinical toxicity causes them?",
    a: "<b>Trigger:</b> Intracellular calcium overload during Phase 4, activating transient inward current via NCX (I<sub>ti</sub>).<br><b>Classic cause:</b> <b>Digoxin toxicity</b> (also: high catecholaminergic states, CPVT mutations in RyR2)."
  },
  {
    q: "How does hyperkalemia affect the resting membrane potential of a cardiac myocyte?",
    a: "↑ Extracellular [K⁺] reduces the K⁺ concentration gradient across the membrane → <b>depolarizes</b> the resting membrane potential (more positive).<br>This <b>inactivates fast Na⁺ channels</b>, decreasing myocardial excitability and conduction velocity."
  },
  {
    q: "What is the effect of severe hypokalemia on the ventricular action potential?",
    a: "Hypokalemia decreases conductance of delayed rectifier K⁺ channels → slows Phase 3 repolarization → <b>prolonged action potential duration (APD)</b>.<br><b>ECG manifestations:</b> QT prolongation and prominent <b>U waves</b>."
  },
  {
    q: "What is the structural basis of electrical syncytium formation in myocardial tissue?",
    a: "Myocytes are connected at <b>intercalated discs</b>, which contain:<ul><li><b>Desmosomes</b> (macula adherens) — mechanical coupling</li><li><b>Gap junctions</b> (connexins) — electrical coupling, allowing low-resistance ion flow and synchronized contraction</li></ul>"
  },
  {
    q: "How does intracellular acidosis (e.g., during ischemia) affect myocardial gap junctions?",
    a: "Intracellular acidosis triggers conformational changes that <b>close gap junctions</b>, electrically uncoupling ischemic cells from healthy tissue.<br><b>Consequence:</b> Slows conduction but limits arrhythmia propagation from the necrotic zone."
  },

  // ==========================================
  // SECTION 2: EXCITATION-CONTRACTION COUPLING
  // ==========================================
  {
    q: "Explain the absolute requirement of extracellular Calcium for cardiac vs. skeletal muscle contraction.",
    a: "<b>Skeletal muscle:</b> Uses mechanical coupling between DHPR and RyR1 — does NOT need extracellular Ca²⁺.<br><b>Cardiac muscle:</b> Requires <b>Calcium-Induced Calcium Release (CICR)</b>:<ul><li>Extracellular Ca²⁺ enters via sarcolemmal L-type Ca²⁺ channels during Phase 2</li><li>This triggers <b>RyR2</b> on the SR to release stored Ca²⁺</li><li>Extracellular Ca²⁺ is <b>obligatory</b> for contraction</li></ul>"
  },
  {
    q: "What specific troponin subunit binds calcium to initiate myofilament cross-bridge cycling?",
    a: "Cytosolic Ca²⁺ binds to <b>Troponin C</b>, causing a conformational change in <b>Troponin I</b> and <b>Troponin T</b>, which moves <b>tropomyosin</b> out of the myosin-binding groove on actin filaments, enabling cross-bridge cycling."
  },
  {
    q: "Explain the dual mechanism by which the cardiac cell clears cytosolic calcium to induce relaxation (lusitropy).",
    a: "<ol><li><b>SERCA2a</b> (SR Ca²⁺-ATPase): Pumps ~70% of cytosolic Ca²⁺ back into SR lumen (ATP-dependent)</li><li><b>NCX</b> (Na⁺/Ca²⁺ Exchanger): Extrudes ~28% across the sarcolemma, trading 1 Ca²⁺ out for 3 Na⁺ in</li></ol>"
  },
  {
    q: "What is Phospholamban (PLN), and how does its regulatory state change during sympathetic stimulation?",
    a: "<b>Phospholamban:</b> A protein that, when <b>unphosphorylated</b>, inhibits SERCA2a activity.<br><b>During sympathetic activation:</b> PKA phosphorylates PLN → <b>lifts inhibition of SERCA2a</b> → accelerates Ca²⁺ reuptake into SR → faster relaxation (<b>positive lusitropy</b>)."
  },
  {
    q: "What structural protein anchors calcium inside the sarcoplasmic reticulum near RyR2 clusters?",
    a: "<b>Calsequestrin</b> — a high-capacity, low-affinity Ca²⁺-binding protein in the SR lumen.<br>Lowers free SR [Ca²⁺] to help SERCA2a pump against a smaller gradient."
  },
  {
    q: "What is the molecular mechanism behind the positive inotropic effect of Digoxin?",
    a: "<ol><li>Digoxin inhibits <b>Na⁺/K⁺-ATPase</b> pump</li><li>→ ↑ intracellular [Na⁺]</li><li>→ Reduces Na⁺ gradient driving <b>NCX</b></li><li>→ Less Ca²⁺ extruded from the cell</li><li>→ ↑ baseline cytosolic [Ca²⁺]</li><li>→ SERCA2a loads SR with more Ca²⁺ → larger calcium transients</li><li>→ <b>Stronger contractions</b></li></ol>"
  },
  {
    q: "How does an increase in heart rate acutely increase contractility via the Bowditch effect (Treppe phenomenon)?",
    a: "At high heart rates, the Na⁺/K⁺-ATPase cannot keep pace with repeated sodium influx from frequent depolarizations.<br>→ ↑ Intracellular [Na⁺] → slows NCX-mediated Ca²⁺ extrusion → ↑ SR Ca²⁺ loading → enhanced contractility over successive beats."
  },
  {
    q: "How does PKA (Protein Kinase A) activation increase cardiac contractility and lusitropy simultaneously?",
    a: "<b>Inotropy (contractility):</b><ul><li>Phosphorylates L-type Ca²⁺ channels → ↑ I<sub>Ca,L</sub></li><li>Phosphorylates RyR2 → ↑ SR Ca²⁺ release probability</li></ul><b>Lusitropy (relaxation):</b><ul><li>Phosphorylates Phospholamban → lifts SERCA2a inhibition → faster Ca²⁺ reuptake</li><li>Phosphorylates Troponin I → reduces Ca²⁺ affinity → faster Ca²⁺ dissociation from thin filaments</li></ul>"
  },
  {
    q: "Why can cardiac muscle NOT undergo tetanic contraction, whereas skeletal muscle can?",
    a: "Cardiac muscle's <b>action potential duration nearly equals the mechanical twitch duration</b> due to the Phase 2 plateau.<br>The <b>absolute refractory period</b> overlaps with contraction — a second stimulus cannot be initiated before relaxation begins, preventing tetany."
  },
  {
    q: "What is the functional consequence of RyR2 mutations linked to Catecholaminergic Polymorphic Ventricular Tachycardia (CPVT)?",
    a: "CPVT mutations make RyR2 channels <b>'leaky'</b> during sympathetic stress.<br>PKA phosphorylation causes diastolic SR Ca²⁺ leak → activates NCX in forward mode (Ca²⁺ out, 3 Na⁺ in) → inward depolarizing current → <b>Delayed Afterdepolarizations (DADs)</b> → polymorphic ventricular tachycardia."
  },

  // ==========================================
  // SECTION 3: PRESSURE-VOLUME LOOPS & CARDIAC CYCLE
  // ==========================================
  {
    q: "Map the four distinct corners of a left ventricular Pressure-Volume (PV) loop to valvular actions.",
    a: "<ul><li><b>Point 1 (Bottom Right):</b> Mitral valve closes → End-Diastolic Volume (EDV); onset of isovolumetric contraction</li><li><b>Point 2 (Top Right):</b> Aortic valve opens → onset of ventricular ejection</li><li><b>Point 3 (Top Left):</b> Aortic valve closes → End-Systolic Volume (ESV); onset of isovolumetric relaxation</li><li><b>Point 4 (Bottom Left):</b> Mitral valve opens → onset of ventricular filling</li></ul>"
  },
  {
    q: "How does an isolated increase in Preload change the morphology of a ventricular PV loop?",
    a: "<b>Right wall shifts right</b> (↑ EDV) due to more venous return.<br>Frank-Starling law causes more forceful contraction → ejection reaches same baseline ESV.<br><br><b>Net result:</b><ul><li>↑ End-Diastolic Volume (EDV)</li><li>↑ Stroke Volume (SV)</li><li>Constant End-Systolic Volume (ESV)</li><li>Loop widens horizontally</li></ul>"
  },
  {
    q: "How does an isolated increase in Afterload change the morphology of a ventricular PV loop?",
    a: "<b>Higher resistance to ejection</b> → ventricle must generate greater pressure, and empties less completely.<br><br><b>Net result:</b><ul><li>↑ Peak LV systolic pressure (loop grows taller)</li><li>↑ End-Systolic Volume (ESV) — left wall shifts right</li><li>↓ Stroke Volume (SV)</li><li>Constant End-Diastolic Volume (EDV)</li></ul>"
  },
  {
    q: "How does an acute increase in Contractility (Inotropy) shift the End-Systolic Pressure-Volume Relationship (ESPVR)?",
    a: "Increased inotropy shifts the <b>ESPVR slope upward and to the left</b>.<br>The ventricle contracts more forcefully and empties more completely.<br><br><b>Net result:</b><ul><li>↓ End-Systolic Volume (ESV)</li><li>↑ Stroke Volume (SV)</li><li>↑ Ejection Fraction (EF)</li><li>Constant EDV</li></ul>"
  },
  {
    q: "How does an isolated decrease in LV compliance change the ventricular PV loop (diastolic dysfunction)?",
    a: "The <b>End-Diastolic Pressure-Volume Relationship (EDPVR)</b> curves upward more steeply.<br>For any given filling volume, diastolic pressure rises faster.<br><br><b>Net result:</b><ul><li>Elevated end-diastolic pressure with reduced or normal EDV</li><li>Classic finding in <b>diastolic (HFpEF)</b> heart failure</li></ul>"
  },
  {
    q: "How does the PV loop change in chronic, compensated Aortic Stenosis?",
    a: "<ul><li>Loop grows significantly <b>taller</b> — LV generates extreme pressures (>200 mmHg) to overcome stenotic valve</li><li><b>Concentric LV hypertrophy</b> helps maintain contractility</li><li>Left wall shifts right (↑ ESV); right wall shifts right (↑ EDV) due to fluid retention</li><li>Stroke volume is preserved early via Frank-Starling compensation</li></ul>"
  },
  {
    q: "How does the PV loop change in severe Mitral Regurgitation?",
    a: "<ul><li><b>No true isovolumetric phases</b> — blood leaks backward into LA during 'isovolumetric contraction'</li><li>Chronic volume overload → right wall shifts far right (↑↑ EDV)</li><li>Low-resistance atrial pathway → left wall shifts inward (↓ ESV)</li><li><b>Net result:</b> Wider loop, blunted vertical borders; ↑ total SV but ↓ forward SV</li></ul>"
  },
  {
    q: "How does the PV loop change in pure Aortic Regurgitation?",
    a: "<ul><li>No true isovolumetric relaxation — blood flows back from aorta into LV during diastole</li><li>Chronic diastolic filling shifts right wall far right (↑↑ EDV)</li><li>↑ LV ejection pressure; ↓ aortic diastolic pressure</li><li><b>Net result:</b> Giant, wide loop with absent isovolumetric relaxation line</li></ul>"
  },
  {
    q: "What causes the 'a', 'c', and 'v' waves on a central Jugular Venous Pulse (JVP) waveform?",
    a: "<ul><li><b>a wave:</b> Right <b>A</b>trial contraction (after P-wave on ECG). <b>Absent in atrial fibrillation.</b></li><li><b>c wave:</b> Right ventricular isovolumetric <b>C</b>ontraction — tricuspid valve bulges backward into RA.</li><li><b>v wave:</b> Passive <b>V</b>enous filling of RA against closed tricuspid valve during ventricular systole. <b>Giant in tricuspid regurgitation.</b></li></ul>"
  },
  {
    q: "What event generates the JVP 'x' descent?",
    a: "The 'x' descent is caused by:<ul><li><b>Atrial relaxation</b> after atrial systole</li><li>Downward displacement of the tricuspid annulus as the ventricle contracts and shortens during ejection</li></ul>"
  },
  {
    q: "What event generates the JVP 'y' descent, and how is it altered in Cardiac Tamponade vs. Constrictive Pericarditis?",
    a: "<b>Cause:</b> Tricuspid valve opens → rapid blood flow from RA into RV.<br><ul><li><b>Cardiac Tamponade:</b> 'y' descent is <b>blunted or absent</b> — high external pressure restricts rapid ventricular filling.</li><li><b>Constrictive Pericarditis:</b> 'y' descent is <b>prominent and steep</b> (Friedreich's sign) — rapid early filling stops abruptly at the non-compliant pericardial limit.</li></ul>"
  },
  {
    q: "What mechanical event accounts for physiological splitting of S2 during deep inspiration?",
    a: "<b>Inspiration</b> → ↓ intrathoracic pressure:<ul><li>↑ Venous return to RV → ↑ RV stroke volume → prolonged RV ejection → <b>delayed P₂ (pulmonic valve closure)</b></li><li>Blood pools in expanded pulmonary vasculature → ↓ LV filling → ↓ LV stroke volume → <b>earlier A₂ (aortic valve closure)</b></li></ul><b>Net result:</b> Wider A₂–P₂ separation heard during inspiration."
  },
  {
    q: "What pathophysiological state causes a fixed, wide splitting of S2?",
    a: "<b>Atrial Septal Defect (ASD)</b>.<br>The left-to-right shunt keeps RV volume elevated regardless of the respiratory cycle → chronically prolonged RV ejection → P₂ is persistently delayed → <b>respiratory variation is eliminated</b>."
  },
  {
    q: "What causes a Paradoxical Split of S2, and when does the split widen?",
    a: "<b>Cause:</b> Conditions that delay LV ejection (e.g., <b>Aortic Stenosis</b>, <b>Left Bundle Branch Block</b>) → A₂ occurs <i>after</i> P₂.<br><ul><li><b>Expiration:</b> P₂ moves earlier → split <b>widens</b></li><li><b>Inspiration:</b> P₂ delays → split <b>narrows</b> (paradoxical)</li></ul>"
  },
  {
    q: "What physiological event causes S3, and when is it considered abnormal?",
    a: "<b>Cause:</b> Rapid deceleration of blood entering a highly compliant ventricle during early passive filling (E wave).<br><ul><li><b>Normal:</b> Children, young adults, pregnancy</li><li><b>Pathologic in adults:</b> Volume overload from <b>systolic heart failure</b> or severe regurgitation</li></ul>"
  },
  {
    q: "What physiological event causes S4, and what does it indicate?",
    a: "<b>Cause:</b> Blood vibrating against a <b>stiff, non-compliant ventricular wall</b> during <b>atrial contraction</b> in late diastole.<br><b>S4 is always pathologic</b> — indicates diastolic dysfunction from concentric hypertrophy (e.g., chronic hypertension, aortic stenosis)."
  },
  {
    q: "Define the Incisura (Dicrotic Notch) on an aortic pressure tracing.",
    a: "The incisura is a transient dip in aortic pressure followed by a small rebound pressure rise, caused by the <b>closure of the aortic valve</b>.<br>The brief backward rebound of blood against the closed leaflets transiently raises pressure at the start of diastole."
  },

  // ==========================================
  // SECTION 4: CARDIOVASCULAR EQUATIONS & HEMODYNAMICS
  // ==========================================
  {
    q: "State the formula for Total Peripheral Resistance (TPR) derived from Ohm's Law.",
    a: "$$TPR = \\frac{MAP - RAP}{CO}$$<br>Where MAP = Mean Arterial Pressure, RAP = Right Atrial Pressure (≈0 clinically), CO = Cardiac Output.<br><br>Clinical approximation: $$TPR \\approx \\frac{MAP}{CO}$$"
  },
  {
    q: "State the Fick Principle formula for measuring Cardiac Output from oxygen consumption.",
    a: "$$CO = \\frac{\\dot{V}O_2}{C_aO_2 - C_vO_2}$$<br><ul><li>$\\dot{V}O_2$ = whole-body O₂ consumption rate</li><li>C<sub>a</sub>O₂ = arterial oxygen content</li><li>C<sub>v</sub>O₂ = mixed venous oxygen content (sampled from pulmonary artery catheter)</li></ul>"
  },
  {
    q: "State the formula for Mean Arterial Pressure (MAP) and explain its 1/3 and 2/3 weighting.",
    a: "$$MAP = DBP + \\frac{1}{3}(SBP - DBP) = \\frac{2 \\cdot DBP + SBP}{3}$$<br><b>Reason for weighting:</b> At normal resting heart rates, the heart spends approximately <b>two-thirds</b> of the cardiac cycle in diastole."
  },
  {
    q: "State the formula for Pulse Pressure (PP) and its two primary physiological determinants.",
    a: "$$PP = SBP - DBP$$<br><b>Primary determinants:</b><ul><li><b>Stroke Volume</b> — direct relationship: ↑ SV → ↑ PP</li><li><b>Arterial Compliance</b> — inverse relationship: ↓ compliance (arterial stiffening) → ↑ PP (as seen in isolated systolic hypertension of aging)</li></ul>"
  },
  {
    q: "Provide the formula for Ejection Fraction (EF) using ventricular volumes.",
    a: "$$EF = \\frac{SV}{EDV} = \\frac{EDV - ESV}{EDV}$$<br><b>Normal range:</b> 55–70%"
  },
  {
    q: "According to Poiseuille's Law, how does a 2-fold reduction in vessel radius alter vascular resistance?",
    a: "$$R = \\frac{8\\eta L}{\\pi r^4}$$<br>Resistance is inversely proportional to the <b>4th power of radius</b>.<br>Halving the radius → resistance increases by $2^4 = $ <b>16-fold</b>."
  },
  {
    q: "Write the formula relating blood flow velocity to volumetric flow rate and cross-sectional area. Why is velocity lowest in capillaries?",
    a: "$$v = \\frac{Q}{A}$$<br><b>Why slowest in capillaries:</b> Although individual capillaries are tiny, the <b>total integrated cross-sectional area</b> of the collective capillary network is massive — far exceeding that of the aorta — causing velocity to drop to a crawl, maximizing diffusion time."
  },
  {
    q: "Differentiate Laminar vs. Turbulent blood flow using the Reynolds Number (Re). Give the formula.",
    a: "$$Re = \\frac{\\rho v d}{\\eta}$$<br><ul><li>$\\rho$ = blood density, $v$ = velocity, $d$ = vessel diameter, $\\eta$ = viscosity</li><li><b>Re > 2000–3000:</b> Turbulent flow → produces bruits and murmurs</li><li><b>Severe anemia</b> reduces viscosity (η), ↑ velocity, promoting turbulence → functional murmurs</li></ul>"
  },
  {
    q: "Write the Starling equation for net fluid filtration across microvascular beds.",
    a: "$$J_v = K_f\\left[(P_c - P_i) - \\sigma(\\pi_c - \\pi_i)\\right]$$<br><ul><li>$K_f$ = filtration coefficient</li><li>$P_c$ / $P_i$ = capillary / interstitial hydrostatic pressure</li><li>$\\pi_c$ / $\\pi_i$ = capillary / interstitial oncotic pressure</li><li>$\\sigma$ = reflection coefficient for protein permeability</li></ul>"
  },
  {
    q: "How does severe nephrotic syndrome alter Starling forces to cause systemic edema?",
    a: "<ol><li>Massive renal protein loss → ↓ plasma albumin</li><li>→ ↓ capillary oncotic pressure (π<sub>c</sub>)</li><li>→ Loss of the osmotic force reabsorbing fluid from interstitium back into vessels</li><li>→ ↑ Net filtration (J<sub>v</sub>) → interstitial fluid accumulation → <b>edema</b></li></ol>"
  },

  // ==========================================
  // SECTION 5: VASCULAR FUNCTION & CO CURVES
  // ==========================================
  {
    q: "What is the physiological definition of Mean Systemic Filling Pressure (P<sub>msf</sub>), and what alters it?",
    a: "<b>P<sub>msf</sub></b> = equilibrium pressure throughout the cardiovascular system if active cardiac pumping were to stop instantly. It is the <b>x-axis intercept of the vascular function curve</b>.<br><br><b>Shifts right (↑ P<sub>msf</sub>):</b> Fluid infusion, venoconstriction (α₁ stimulation).<br><b>Shifts left (↓ P<sub>msf</sub>):</b> Hemorrhage, venodilation."
  },
  {
    q: "How do alterations in Total Peripheral Resistance (TPR) affect the slope of the Venous Return Curve?",
    a: "<ul><li><b>↑ TPR:</b> Flattens the slope of the venous return curve (blood returns more slowly against higher resistance) — pivots around the fixed P<sub>msf</sub> intercept.</li><li><b>↓ TPR</b> (e.g., arteriovenous fistula): Steepens the slope — blood returns to RA more readily, ↑ cardiac output.</li></ul>"
  },
  {
    q: "Predict where the CO-venous return intersection moves during compensated chronic heart failure.",
    a: "<ul><li>Contractility curve shifts <b>down and right</b> (↓ EF)</li><li>Renal fluid retention → ↑ blood volume → <b>venous return curve shifts right</b> (↑ P<sub>msf</sub>)</li><li>New equilibrium: <b>elevated Right Atrial Pressure (RAP)</b>, borderline-normal cardiac output via Frank-Starling compensation</li></ul>"
  },

  // ==========================================
  // SECTION 6: REFLEX REGULATION OF BLOOD PRESSURE
  // ==========================================
  {
    q: "Compare the anatomical location and afferent nerve pathways of the high-pressure arterial baroreceptors.",
    a: "<ul><li><b>Carotid Sinus:</b> Bifurcation of common carotid artery → afferent signals via <b>CN IX (Glossopharyngeal nerve)</b></li><li><b>Aortic Arch:</b> Aortic arch wall → afferent signals via <b>CN X (Vagus nerve)</b></li></ul>Both project to the Nucleus Tractus Solitarius (NTS) in the medulla."
  },
  {
    q: "Outline the reflex cascade triggered by an acute orthostatic drop in blood pressure.",
    a: "<ol><li>Standing → venous pooling in lower extremities → ↓ venous return → ↓ stroke volume → ↓ MAP</li><li>↓ Stretch at carotid sinus → ↓ afferent firing via CN IX → ↓ NTS inhibition of sympathetic centers</li><li>Sympathetic discharge → ↑ HR, ↑ inotropy, α₁-mediated arteriolar and venous constriction</li><li>↓ Cardiovagal parasympathetic output → further ↑ HR</li></ol><b>Net effect:</b> Restored MAP within seconds."
  },
  {
    q: "Explain the physiological mechanism behind Carotid Sinus Massage.",
    a: "External pressure on the carotid sinus mimics a <b>sudden massive surge in arterial blood pressure</b>.<br>→ ↑ Afferent firing via CN IX → Brainstem NTS → ↑ Vagal efferent discharge to SA and AV nodes.<br><b>Clinical use:</b> Slows heart rate, stalls AV nodal conduction → <b>breaks re-entrant supraventricular arrhythmias</b>."
  },
  {
    q: "Contrast Peripheral vs. Central Chemoreceptors in cardiorespiratory control.",
    a: "<ul><li><b>Peripheral Chemoreceptors</b> (Carotid/Aortic bodies):<ul><li>Respond to: <b>Hypoxemia (pO₂ &lt; 60 mmHg)</b>, hypercapnia, metabolic acidosis</li><li>Primary stimulus: <b>Low O₂</b></li></ul></li><li><b>Central Chemoreceptors</b> (Medulla):<ul><li>Respond to: <b>Changes in CSF pH</b> from CO₂ diffusing across the blood-brain barrier</li><li>Insensitive to direct pO₂ changes</li></ul></li></ul>"
  },
  {
    q: "What defines the classic Cushing Reflex triad, and what triggers it?",
    a: "<b>Trigger:</b> Critically elevated Intracranial Pressure (ICP) compresses cerebral microvessels → brainstem ischemia + local hypercapnia → massive sympathetic discharge.<br><br><b>Triad:</b><ol><li><b>Severe systemic hypertension</b></li><li><b>Reflex bradycardia</b> (baroreceptor response to high BP)</li><li><b>Irregular/altered breathing</b> (medullary respiratory center compression)</li></ol>"
  },

  // ==========================================
  // SECTION 7: LOCAL CONTROL OF MICROCIRCULATION
  // ==========================================
  {
    q: "Define Active Hyperemia and list the key local vasodilator metabolites in exercising skeletal muscle.",
    a: "<b>Active hyperemia:</b> ↑ local blood flow driven by elevated metabolic demand, overcoming systemic sympathetic vasoconstriction via <b>metabolic autoregulation</b>.<br><br><b>Local vasodilators in skeletal muscle:</b><ul><li>Adenosine</li><li>K⁺ (intracellular efflux)</li><li>Lactate</li><li>CO₂</li><li>H⁺ (local acidosis)</li></ul>"
  },
  {
    q: "What cellular pathway mediates nitric oxide (NO)-induced vascular smooth muscle relaxation?",
    a: "<ol><li>eNOS converts L-arginine → <b>NO</b> in endothelial cells</li><li>NO diffuses into adjacent vascular smooth muscle</li><li>Activates <b>soluble guanylyl cyclase</b> → GTP → <b>cGMP</b></li><li>cGMP activates <b>Protein Kinase G (PKG)</b></li><li>PKG → ↓ cytosolic Ca²⁺ + activates <b>myosin light chain phosphatase</b> → dephosphorylates myosin → smooth muscle relaxation → vasodilation</li></ol>"
  },

  // ==========================================
  // SECTION 8: SPECIALIZED VASCULAR BEDS
  // ==========================================
  {
    q: "What unique autoregulatory mechanism dominates the pulmonary circulation, and what is its physiological purpose?",
    a: "<b>Hypoxic Pulmonary Vasoconstriction (HPV):</b><br>Unlike systemic vessels (which dilate with hypoxia), pulmonary arterioles <b>constrict</b> when alveolar pO₂ drops.<br><b>Purpose:</b> Shunts blood flow away from poorly ventilated alveoli toward well-oxygenated segments → optimizes <b>ventilation-perfusion (V/Q) matching</b>."
  },
  {
    q: "Why is myocardial O₂ extraction unique, and how does the heart meet extra oxygen demands during exercise?",
    a: "<b>Resting O₂ extraction:</b> ~75–80% — already near maximum at rest.<br><b>Consequence:</b> The heart <b>cannot significantly increase O₂ extraction</b> during exercise (unlike skeletal muscle).<br><b>Solution:</b> Must meet ↑ O₂ demand <b>solely by increasing coronary blood flow</b>, achieved via metabolic vasodilation (adenosine, NO, CO₂, K⁺)."
  },

  // ==========================================
  // SECTION 9: INTEGRATED RESPONSES (EXERCISE & SHOCK)
  // ==========================================
  {
    q: "Summarize the key cardiovascular metric changes during sustained aerobic exercise.",
    a: "<ul><li><b>Cardiac Output (CO):</b> ↑ sharply (5-fold in trained athletes)</li><li><b>Heart Rate (HR):</b> ↑ via sympathetic drive</li><li><b>Stroke Volume (SV):</b> ↑ via Frank-Starling and ↑ inotropy</li><li><b>Total Peripheral Resistance (TPR):</b> ↓ significantly (metabolic vasodilation in active muscle)</li><li><b>Pulse Pressure (PP):</b> ↑ (higher SV + stable/lower DBP)</li><li><b>MAP:</b> Mildly ↑ (SBP rises more than DBP falls)</li></ul>"
  },
  {
    q: "Contrast Hypovolemic, Cardiogenic, and Septic (Distributive) shock using CO, SVR, and PCWP.",
    a: "<table style='border-collapse:collapse;width:100%'><tr style='background:#333'><th style='padding:6px;text-align:left'>Type</th><th style='padding:6px'>CO</th><th style='padding:6px'>SVR</th><th style='padding:6px'>PCWP</th></tr><tr><td style='padding:6px'><b>Hypovolemic</b></td><td style='padding:6px;text-align:center'>↓</td><td style='padding:6px;text-align:center'>↑</td><td style='padding:6px;text-align:center'>↓</td></tr><tr><td style='padding:6px'><b>Cardiogenic</b></td><td style='padding:6px;text-align:center'>↓</td><td style='padding:6px;text-align:center'>↑</td><td style='padding:6px;text-align:center'>↑</td></tr><tr><td style='padding:6px'><b>Septic (Distributive)</b></td><td style='padding:6px;text-align:center'>↑</td><td style='padding:6px;text-align:center'>↓↓</td><td style='padding:6px;text-align:center'>↓/Normal</td></tr></table><br><b>Key distinction:</b> Cardiogenic shock is the only type with elevated PCWP (pulmonary congestion from LV failure)."
  }
];

module.exports = { cardioCards };
