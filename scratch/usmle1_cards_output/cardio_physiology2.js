// Cardiovascular Physiology - USMLE 1
// Second batch - 110 cards (Part I through Part VIII, Part IX truncated)

const cardioCards2 = [
  // ==========================================
  // PART I: CARDIAC CELLULAR ELECTROPHYSIOLOGY
  // ==========================================
  {
    q: "What ionic currents dominate Phase 0 through Phase 4 of a working ventricular myocyte action potential?",
    a: "<b>Phase 0 (Upstroke):</b> Voltage-gated fast Na⁺ channels open → massive inward I<sub>Na</sub>.<br><b>Phase 1 (Early Repolarization):</b> Na⁺ channels inactivate; transient outward K⁺ current (I<sub>to</sub>) activates.<br><b>Phase 2 (Plateau):</b> Balanced inward Ca²⁺ via L-type channels (I<sub>Ca,L</sub>) and outward delayed rectifier K⁺ (I<sub>K</sub>).<br><b>Phase 3 (Rapid Repolarization):</b> L-type Ca²⁺ channels inactivate; I<sub>Kr</sub>, I<sub>Ks</sub>, and I<sub>K1</sub> dominate outward K⁺ efflux.<br><b>Phase 4 (Resting Potential):</b> Maintained near −90 mV by background K⁺ conductance via I<sub>K1</sub> channels."
  },
  {
    q: "What is the primary role of the inward rectifier potassium channel (I<sub>K1</sub>) during Phase 4 of ventricular myocytes?",
    a: "I<sub>K1</sub> maintains high background K⁺ permeability at rest, keeping the resting membrane potential near the K⁺ equilibrium potential (E<sub>K</sub> ≈ −96 mV).<br>This <b>prevents spontaneous depolarization</b> in working myocardium."
  },
  {
    q: "Why do pacemaker cells (SA and AV nodes) lack a Phase 1 and Phase 2 plateau?",
    a: "Pacemaker cells <b>do not express fast voltage-gated Na⁺ channels (I<sub>Na</sub>)</b> or high-density inward rectifier K⁺ channels (I<sub>K1</sub>) found in working myocytes.<br>Their electrical cycle is driven by slower Ca²⁺ and K⁺ fluxes."
  },
  {
    q: "What ionic current is responsible for the Phase 0 upstroke in the sinoatrial (SA) node?",
    a: "Phase 0 in nodal tissue is mediated entirely by inward Ca²⁺ current through voltage-gated <b>L-type Ca²⁺ channels (I<sub>Ca,L</sub>)</b>.<br>This explains the significantly <b>slower conduction velocity</b> of nodal tissue compared to Purkinje fibers."
  },
  {
    q: "What is the molecular mechanism of Phase 4 spontaneous diastolic depolarization in the SA node?",
    a: "Driven primarily by the <b>funny current (I<sub>f</sub>)</b> — an inward mixed Na⁺/K⁺ current through <b>Hyperpolarization-activated Cyclic Nucleotide-gated (HCN) channels</b> that open as the membrane repolarizes below −50 mV."
  },
  {
    q: "How does sympathetic β₁-adrenergic stimulation modulate the slope of Phase 4 depolarization in the SA node?",
    a: "<ol><li>β₁ receptors → G<sub>αs</sub> → ↑ Adenylyl Cyclase → ↑ cAMP</li><li>cAMP binds directly to <b>HCN channels</b>, shifting activation curve more positive → ↑ I<sub>f</sub></li><li>PKA phosphorylates L-type Ca²⁺ channels → ↑ I<sub>Ca,L</sub></li></ol><b>Net effect:</b> Steeper Phase 4 slope → reaches threshold faster → ↑ heart rate."
  },
  {
    q: "How does parasympathetic muscarinic (M₂) stimulation reduce heart rate at the cellular level?",
    a: "<ol><li>M₂ receptors → G<sub>αi</sub> → ↓ cAMP → ↓ I<sub>f</sub> and ↓ I<sub>Ca,L</sub></li><li>G<sub>βγ</sub> subunits open <b>GIRK (K<sub>ACh</sub>) channels</b> → outward K⁺ current → hyperpolarizes Phase 4</li></ol><b>Net effect:</b> Flatter Phase 4 slope + more negative baseline → slower heart rate."
  },
  {
    q: "What defines the Effective Refractory Period (ERP) of working cardiac myocytes, and what is its main function?",
    a: "The ERP is the period during which fast Na⁺ channels are locked in their <b>voltage-dependent inactivated state</b>, preventing a second action potential.<br><b>Function:</b> Prevents tetanic contraction, ensuring alternating cycles of contraction and filling (diastole)."
  },
  {
    q: "What distinguishes the Relative Refractory Period (RRP) from the Effective Refractory Period (ERP)?",
    a: "During the RRP, a <b>fraction of fast Na⁺ channels have recovered</b> from inactivation.<br>A suprathreshold stimulus can trigger an action potential, but it will display:<ul><li>Slower Phase 0 upstroke velocity</li><li>Lower amplitude</li><li>Slower tissue conduction</li></ul>"
  },
  {
    q: "Rank the components of the cardiac conduction system from fastest to slowest conduction velocity.",
    a: "<ol><li><b>Purkinje fibers:</b> ~4 m/s (fastest)</li><li><b>Atria/Ventricles:</b> ~1 m/s</li><li><b>AV Node:</b> ~0.05 m/s (slowest)</li></ol>"
  },
  {
    q: "What structural and functional properties allow Purkinje fibers to conduct action potentials so rapidly?",
    a: "<ul><li>Large cell diameter → low internal resistance</li><li>High density of fast voltage-gated Na⁺ channels (I<sub>Na</sub>)</li><li>Abundant high-conductance <b>gap junctions (connexins)</b></li></ul>"
  },
  {
    q: "What physiological mechanism delays conduction through the AV node, and what purpose does this serve?",
    a: "<b>Cause:</b><ul><li>Small cell diameter, tortuous fiber orientation</li><li>Fewer gap junctions</li><li>Slow L-type Ca²⁺ channels for Phase 0</li></ul><b>Purpose:</b> Ensures atrial systole finishes emptying blood into ventricles <b>before</b> ventricular contraction."
  },
  {
    q: "How does an increase in extracellular potassium (Hyperkalemia) affect the resting membrane potential of a cardiac myocyte?",
    a: "↑ Extracellular [K⁺] reduces the K⁺ concentration gradient → <b>depolarizes</b> the resting membrane potential (more positive).<br>This <b>inactivates fast Na⁺ channels</b> → ↓ excitability and conduction velocity."
  },
  {
    q: "What is the effect of severe hypokalemia on the ventricular action potential profile?",
    a: "Hypokalemia ↓ delayed rectifier K⁺ channel conductance → slows Phase 3 repolarization → <b>prolonged action potential duration (APD)</b>.<br><b>ECG:</b> QT prolongation and prominent <b>U waves</b>."
  },
  {
    q: "How does Class I antiarrhythmic drug binding alter the ventricular action potential profile?",
    a: "Class I agents block fast voltage-gated Na⁺ channels → <b>reduce slope and amplitude of Phase 0</b> (↓ V<sub>max</sub>).<ul><li>↓ Tissue conduction velocity</li><li>Shifts threshold to a more positive potential</li></ul>"
  },
  {
    q: "By what mechanism do Class III antiarrhythmic drugs extend the QT interval on a surface ECG?",
    a: "Class III agents inhibit delayed rectifier K⁺ channels (primarily I<sub>Kr</sub>) → ↓ outward K⁺ efflux → <b>prolongs Phase 3</b> → expanded overall action potential duration → <b>widened QT interval</b>."
  },
  {
    q: "What cellular condition triggers Early Afterdepolarizations (EADs) and what arrhythmia can they initiate?",
    a: "<b>Trigger:</b> Prolonged APD → reactivation of L-type Ca²⁺ channels during Phase 2–3.<br><b>Arrhythmia:</b> <b>Torsades de Pointes</b>."
  },
  {
    q: "What cellular condition triggers Delayed Afterdepolarizations (DADs) and what clinical poisoning causes them?",
    a: "<b>Trigger:</b> Intracellular Ca²⁺ overload during Phase 4 → activates transient inward current (I<sub>ti</sub>) via NCX.<br><b>Classic cause:</b> <b>Digoxin toxicity</b> or high catecholaminergic states."
  },
  {
    q: "What is the structural basis of electrical syncytium formation in myocardial tissue?",
    a: "Myocytes are connected at <b>intercalated discs</b>:<ul><li><b>Desmosomes</b> (macula adherens) — mechanical coupling</li><li><b>Gap junctions</b> (connexins) — electrical coupling, low-resistance ion flow</li></ul>"
  },
  {
    q: "How does intracellular acidosis affect myocardial gap junction conductance?",
    a: "Acidosis (e.g., during ischemia) triggers conformational changes that <b>close gap junctions</b>, electrically uncoupling ischemic cells from healthy tissue.<br><b>Net effect:</b> Slows conduction but limits arrhythmia propagation from the necrotic zone."
  },

  // ==========================================
  // PART II: EXCITATION-CONTRACTION COUPLING
  // ==========================================
  {
    q: "Describe the process of Calcium-Induced Calcium Release (CICR) in cardiac myocytes.",
    a: "<ol><li>Phase 2: Small inward Ca²⁺ via sarcolemmal <b>L-type Ca²⁺ channels</b> (Dihydropyridine receptors)</li><li>This localized influx binds to and activates <b>Ryanodine Receptors (RyR2)</b> on the SR</li><li>Triggers massive Ca²⁺ release from SR into cytosol</li></ol>"
  },
  {
    q: "What specific troponin subunit binds calcium to initiate myofilament cross-bridge cycling?",
    a: "Ca²⁺ binds to <b>Troponin C</b> → conformational shift in Troponin I and T → <b>tropomyosin</b> moves out of the myosin-binding groove on actin → cross-bridge cycling begins."
  },
  {
    q: "Explain the dual mechanism by which the cardiac cell clears cytosolic calcium to induce relaxation (lusitropy).",
    a: "<ol><li><b>SERCA2a</b> (SR Ca²⁺-ATPase): Pumps ~70% of Ca²⁺ back into SR lumen (ATP-dependent)</li><li><b>NCX</b> (Na⁺/Ca²⁺ Exchanger): Extrudes ~28% across sarcolemma — trades 1 Ca²⁺ out for 3 Na⁺ in</li></ol>"
  },
  {
    q: "What is Phospholamban (PLN), and how does its regulatory state change during sympathetic stimulation?",
    a: "<b>Phospholamban:</b> When unphosphorylated, <b>inhibits SERCA2a</b>.<br><b>During sympathetic activation:</b> PKA phosphorylates PLN → lifts SERCA2a inhibition → faster Ca²⁺ reuptake into SR → <b>positive lusitropy</b>."
  },
  {
    q: "What structural protein anchors calcium inside the SR lumen near the RyR2 cluster?",
    a: "<b>Calsequestrin</b> — a high-capacity, low-affinity Ca²⁺-binding protein in the SR lumen.<br>Buffers free SR [Ca²⁺] to reduce the gradient SERCA2a must work against."
  },
  {
    q: "What is the molecular mechanism behind the positive inotropic effect of Digoxin (Cardiac Glycosides)?",
    a: "<ol><li>Digoxin inhibits <b>Na⁺/K⁺-ATPase</b> pump</li><li>→ ↑ intracellular [Na⁺]</li><li>→ Reduces Na⁺ gradient driving <b>NCX</b></li><li>→ Less Ca²⁺ extruded per cycle</li><li>→ ↑ baseline cytosolic [Ca²⁺]</li><li>→ SERCA2a loads SR with more Ca²⁺ → <b>larger calcium transients → stronger contractions</b></li></ol>"
  },
  {
    q: "How does an increase in heart rate acutely increase contractility via the Bowditch effect (Treppe phenomenon)?",
    a: "At high heart rates, Na⁺/K⁺-ATPase cannot keep pace with repeated sodium influx from frequent depolarizations.<br>→ ↑ Intracellular [Na⁺] → ↓ NCX-mediated Ca²⁺ extrusion → ↑ SR Ca²⁺ loading → <b>enhanced contractility over successive beats</b>."
  },
  {
    q: "How does Protein Kinase A (PKA) activation increase cardiac contractility (inotropy)?",
    a: "<ul><li>Phosphorylates <b>L-type Ca²⁺ channels</b> → ↑ I<sub>Ca,L</sub></li><li>Phosphorylates <b>RyR2</b> → ↑ SR Ca²⁺ release probability</li><li>Phosphorylates <b>Troponin I</b> → ↓ Ca²⁺ affinity → faster relaxation (lusitropy)</li></ul>"
  },
  {
    q: "Why can cardiac muscle not undergo tetanic contraction, whereas skeletal muscle can?",
    a: "In cardiac muscle, the <b>action potential duration nearly equals the mechanical twitch duration</b> due to the Phase 2 plateau.<br>The <b>absolute refractory period</b> overlaps with contraction — a new stimulus cannot fire before relaxation begins."
  },
  {
    q: "What is the functional consequence of RyR2 mutations linked to Catecholaminergic Polymorphic Ventricular Tachycardia (CPVT)?",
    a: "CPVT mutations make RyR2 channels <b>'leaky'</b> during sympathetic stress.<br>PKA phosphorylation → diastolic SR Ca²⁺ leak → activates NCX forward mode (Ca²⁺ out, 3 Na⁺ in) → depolarizing current → <b>Delayed Afterdepolarizations (DADs)</b> → polymorphic ventricular tachycardia."
  },

  // ==========================================
  // PART III: CARDIAC MECHANICS & CYCLE
  // ==========================================
  {
    q: "Map the four distinct points of a left ventricular Pressure-Volume (PV) loop to specific valvular actions.",
    a: "<ul><li><b>Point 1 (Bottom Right):</b> Mitral valve closes → End-Diastolic Volume (EDV); onset of isovolumetric contraction</li><li><b>Point 2 (Top Right):</b> Aortic valve opens → onset of ventricular ejection</li><li><b>Point 3 (Top Left):</b> Aortic valve closes → End-Systolic Volume (ESV); onset of isovolumetric relaxation</li><li><b>Point 4 (Bottom Left):</b> Mitral valve opens → onset of ventricular filling</li></ul>"
  },
  {
    q: "Describe the morphological adjustments of a ventricular PV loop when Preload is selectively increased.",
    a: "<b>Right wall shifts right</b> (↑ EDV).<br>Frank-Starling law → ↑ contractile force → ejection reaches same baseline ESV.<br><ul><li>↑ EDV</li><li>↑ Stroke Volume (SV)</li><li>Constant ESV</li><li>Loop widens horizontally</li></ul>"
  },
  {
    q: "Describe the morphological adjustments of a ventricular PV loop when Afterload is selectively increased.",
    a: "<b>Higher resistance to ejection:</b> Ventricle generates greater pressure but empties less completely.<br><ul><li>↑ Peak LV systolic pressure (loop grows taller)</li><li>↑ End-Systolic Volume (ESV) — left wall shifts right</li><li>↓ Stroke Volume (SV)</li><li>Constant EDV</li></ul>"
  },
  {
    q: "Describe the morphological adjustments of a ventricular PV loop when Contractility (Inotropy) is selectively increased.",
    a: "<b>ESPVR slope steepens upward and to the left</b> → ventricle empties more completely.<br><ul><li>↓ End-Systolic Volume (ESV)</li><li>↑ Stroke Volume (SV)</li><li>↑ Ejection Fraction (EF)</li><li>Constant EDV</li></ul>"
  },
  {
    q: "How does an isolated decrease in Left Ventricular Compliance change the ventricular PV loop?",
    a: "<b>EDPVR curves upward more steeply</b> → for any filling volume, diastolic pressure rises faster.<br><ul><li>↑ End-diastolic pressure with stable or ↓ EDV</li><li>Classic finding in <b>diastolic (HFpEF)</b> heart failure</li></ul>"
  },
  {
    q: "How does the left ventricular PV loop change in chronic, compensated Aortic Stenosis?",
    a: "<ul><li>Loop grows significantly <b>taller</b> — LV generates pressures &gt;200 mmHg to overcome stenotic valve</li><li>Left wall shifts right (↑ ESV); right wall shifts right (↑ EDV) via fluid retention</li><li>Concentric hypertrophy helps maintain stroke volume via Frank-Starling</li></ul>"
  },
  {
    q: "Describe the changes on a left ventricular PV loop in severe Mitral Regurgitation.",
    a: "<ul><li><b>No true isovolumetric phases</b> — blood leaks into LA during 'isovolumetric' contraction</li><li>Chronic volume overload → right wall shifts far right (↑↑ EDV)</li><li>Low-resistance atrial pathway → left wall shifts inward (↓ ESV)</li><li><b>Net effect:</b> Wider loop, blunted vertical borders; ↑ total SV but ↓ forward SV</li></ul>"
  },
  {
    q: "Describe the changes on a left ventricular PV loop in pure Aortic Regurgitation.",
    a: "<ul><li>No true isovolumetric relaxation — aortic blood flows back into LV during diastole</li><li>Chronic diastolic filling → right wall far right (↑↑ EDV)</li><li>↑ LV ejection pressure; ↓ aortic diastolic pressure</li><li><b>Net effect:</b> Giant, wide loop with <b>absent isovolumetric relaxation line</b></li></ul>"
  },
  {
    q: "What causes the 'a' wave on a central JVP tracer, and in what common arrhythmia is it completely absent?",
    a: "The 'a' wave is caused by <b>Right Atrial Contraction</b> at the end of diastole.<br>Completely absent in <b>Atrial Fibrillation</b> — coordinated atrial contraction is lost."
  },
  {
    q: "What mechanical event generates the 'c' wave on a Jugular Venous Pulse (JVP) tracer?",
    a: "The 'c' wave is caused by <b>Right Ventricular Isovolumetric Contraction</b> forcing the tricuspid valve to bulge backward into the right atrium, acutely raising intra-atrial pressure."
  },
  {
    q: "What event generates the JVP 'v' wave, and what pathology produces a giant 'v' wave (Lancisi sign)?",
    a: "'v' wave = passive <b>venous filling of the RA</b> against a closed tricuspid valve during ventricular systole.<br><b>Giant 'v' wave:</b> Pathognomonic for <b>Tricuspid Regurgitation</b> — ventricular blood leaks backward into the atrium."
  },
  {
    q: "What mechanical event is responsible for the 'x' descent on a JVP tracer?",
    a: "The 'x' descent = <b>atrial relaxation</b> + downward displacement of the tricuspid annulus by the contracting ventricle during ventricular ejection."
  },
  {
    q: "What event is responsible for the 'y' descent on a JVP tracer, and how is it altered in Cardiac Tamponade?",
    a: "'y' descent = <b>tricuspid valve opens</b> → rapid blood flow from RA into RV.<br><b>Cardiac Tamponade:</b> 'y' descent is <b>blunted or absent</b> — high external pericardial pressure restricts rapid ventricular filling."
  },
  {
    q: "How does the 'y' descent change in Constrictive Pericarditis compared to Cardiac Tamponade?",
    a: "<b>Constrictive Pericarditis:</b> 'y' descent is <b>prominent and steep</b> (Friedreich's sign).<br>The rigid pericardium permits rapid early filling that then stops abruptly when the non-compliant pericardial limit is reached."
  },
  {
    q: "Explain the physiological splitting of S2 heard during deep inspiration.",
    a: "<b>Inspiration</b> → ↓ intrathoracic pressure:<ul><li>↑ RV venous return → ↑ RV ejection time → <b>delayed P₂</b></li><li>Pulmonary vasculature pools blood → ↓ LV return → ↓ LV SV → <b>earlier A₂</b></li></ul><b>Net:</b> Wider A₂–P₂ separation during inspiration."
  },
  {
    q: "What pathophysiological state causes a fixed, wide splitting of S2?",
    a: "<b>Atrial Septal Defect (ASD)</b>.<br>Left-to-right shunt keeps RV volume elevated regardless of respiration → RV ejection chronically prolonged → P₂ persistently delayed → <b>respiratory variation eliminated</b>."
  },
  {
    q: "What causes a Paradoxical Split of S2, where splitting occurs during expiration instead of inspiration?",
    a: "Conditions that <b>delay left ventricular ejection</b>:<ul><li><b>Aortic Stenosis</b></li><li><b>Left Bundle Branch Block (LBBB)</b></li></ul>A₂ occurs <i>after</i> P₂.<ul><li><b>Expiration:</b> P₂ moves earlier → split <b>widens</b></li><li><b>Inspiration:</b> P₂ delays → split <b>narrows</b> (paradoxical)</li></ul>"
  },
  {
    q: "What physiological event causes S3, and when is it considered abnormal?",
    a: "<b>Cause:</b> Sudden deceleration of blood entering a highly compliant ventricle during early rapid passive filling.<br><ul><li><b>Normal:</b> Children, young adults, pregnancy</li><li><b>Pathologic in adults:</b> Volume overload from <b>systolic heart failure</b> or severe regurgitation</li></ul>"
  },
  {
    q: "What physiological event causes S4, and what does it indicate?",
    a: "<b>Cause:</b> Blood vibrating against a <b>stiff, non-compliant ventricular wall</b> during <b>atrial contraction</b> in late diastole.<br><b>Always pathologic</b> → indicates diastolic dysfunction from concentric hypertrophy (e.g., chronic HTN, aortic stenosis)."
  },
  {
    q: "Define the Incisura (Dicrotic Notch) seen on an aortic pressure tracing.",
    a: "A transient dip in aortic pressure followed by a small rebound, caused by <b>aortic valve closure</b>.<br>The backward rebound of blood against the closed leaflets briefly raises pressure at the onset of diastole."
  },

  // ==========================================
  // PART IV: CARDIOVASCULAR EQUATIONS & HEMODYNAMICS
  // ==========================================
  {
    q: "Write the equation for Total Peripheral Resistance (TPR) based on MAP and Right Atrial Pressure (RAP).",
    a: "Derived from Ohm's Law (ΔP = Q × R):<br>$$TPR = \\frac{MAP - RAP}{CO}$$<br>In clinical practice, RAP ≈ 0 mmHg, simplifying to:<br>$$TPR \\approx \\frac{MAP}{CO}$$"
  },
  {
    q: "Write the Fick Principle formula used to determine Cardiac Output from total oxygen consumption.",
    a: "$$CO = \\frac{\\dot{V}O_2}{C_aO_2 - C_vO_2}$$<br><ul><li>$\\dot{V}O_2$ = O₂ consumption rate</li><li>C<sub>a</sub>O₂ = arterial oxygen content</li><li>C<sub>v</sub>O₂ = mixed venous oxygen content (sampled from pulmonary artery)</li></ul>"
  },
  {
    q: "Write the equation for MAP based on resting SBP and DBP, and explain its weighting.",
    a: "$$MAP = DBP + \\frac{1}{3}(SBP - DBP) = \\frac{2 \\cdot DBP + SBP}{3}$$<br><b>Reason:</b> At normal resting heart rates, the heart spends ~<b>two-thirds</b> of the cardiac cycle in diastole."
  },
  {
    q: "Write the equation for Pulse Pressure (PP) and list its two primary cardiodynamic determinants.",
    a: "$$PP = SBP - DBP$$<br><b>Primary determinants:</b><ul><li><b>Stroke Volume</b> — direct: ↑ SV → ↑ PP</li><li><b>Arterial Compliance</b> — inverse: ↓ compliance (arterial stiffening) → ↑ PP</li></ul>"
  },
  {
    q: "Provide the formula for Ejection Fraction (EF) using ventricular volumes.",
    a: "$$EF = \\frac{SV}{EDV} = \\frac{EDV - ESV}{EDV}$$<br><b>Normal range:</b> 55–70%"
  },
  {
    q: "Write Poiseuille's Law for vascular resistance and state how resistance changes if vessel radius decreases by half.",
    a: "$$R = \\frac{8\\eta L}{\\pi r^4}$$<br>Resistance is inversely proportional to <b>r⁴</b>.<br>Halving the radius → resistance increases by $2^4$ = <b>16-fold</b>."
  },
  {
    q: "Write the formula relating blood flow velocity (v), volumetric flow rate (Q), and cross-sectional area (A). Why is velocity lowest in capillaries?",
    a: "$$v = \\frac{Q}{A}$$<br>Though individual capillaries are tiny, the <b>total integrated cross-sectional area</b> of all capillary beds is enormous → velocity drops to a crawl → maximizes time for nutrient and gas diffusion."
  },
  {
    q: "State the Reynolds Number (Re) equation and the significance of a value exceeding 3000.",
    a: "$$Re = \\frac{\\rho v d}{\\eta}$$<br><ul><li>ρ = blood density, v = velocity, d = diameter, η = viscosity</li><li><b>Re &gt; 3000:</b> Turbulent flow → noise heard clinically as <b>murmurs or bruits</b></li></ul>"
  },
  {
    q: "How does a drop in hematocrit (Anemia) alter the Reynolds number and change flow characteristics?",
    a: "Anemia ↓ blood viscosity (η) → ↓ denominator of the Reynolds equation → <b>↑ Reynolds Number</b>.<br>Predisposes to <b>turbulent blood flow</b> → manifests as a <b>functional systolic hemic murmur</b>."
  },
  {
    q: "Write out the Starling equation for fluid filtration across a capillary bed.",
    a: "$$J_v = K_f\\left[(P_c - P_i) - \\sigma(\\pi_c - \\pi_i)\\right]$$<br><ul><li>K<sub>f</sub> = filtration coefficient</li><li>P<sub>c</sub>/P<sub>i</sub> = capillary/interstitial hydrostatic pressure</li><li>π<sub>c</sub>/π<sub>i</sub> = capillary/interstitial oncotic pressure</li><li>σ = reflection coefficient for protein permeability</li></ul>"
  },
  {
    q: "Explain why severe Liver Failure causes widespread peripheral pitting edema using the Starling equation.",
    a: "<ol><li>Liver failure impairs <b>albumin synthesis</b></li><li>→ ↓ plasma albumin → ↓ capillary oncotic pressure (π<sub>c</sub>)</li><li>→ ↓ osmotic reabsorption force</li><li>→ ↑ net fluid filtration (J<sub>v</sub>)</li><li>→ Interstitial fluid accumulation → <b>pitting edema and ascites</b></li></ol>"
  },
  {
    q: "How does filariasis or surgical lymph node dissection cause localized edema according to Starling principles?",
    a: "Damage/blockage of <b>lymphatic drainage</b> prevents return of interstitial fluid and filtered proteins to the systemic circulation.<br>→ ↑ Interstitial oncotic pressure (π<sub>i</sub>) → drives more fluid out of capillaries → <b>lymphedema</b>."
  },
  {
    q: "Write the compliance equation for a blood vessel and compare compliance between the arterial and venous systems.",
    a: "$$C = \\frac{\\Delta V}{\\Delta P}$$<br><b>Venous compliance is ~20× greater</b> than arterial compliance.<ul><li><b>Veins:</b> Capacitance vessels — hold large volumes at low pressure</li><li><b>Arteries:</b> Stiff, high-pressure conduit vessels</li></ul>"
  },
  {
    q: "How does venomotor tone alter venous compliance and venous return?",
    a: "Sympathetic α₁ stimulation contracts venous smooth muscle → <b>↓ venous compliance</b>.<br>→ ↑ Intravenous pressure → shifts blood from venous reservoir → <b>↑ venous return to RA</b>."
  },
  {
    q: "Define the term 'Critical Closing Pressure' of a blood vessel.",
    a: "The minimum internal hydrostatic pressure required to keep a blood vessel open.<br>If intravascular pressure falls below this value, inward forces from vascular smooth muscle and tissue elastic fibers <b>collapse the vessel</b>, stopping flow."
  },
  {
    q: "Write the equation for Wall Stress based on Laplace's Law for a spherical cardiac ventricle.",
    a: "$$\\sigma = \\frac{P \\times r}{2h}$$<br><ul><li>P = intraventricular pressure</li><li>r = internal ventricular radius</li><li>h = wall thickness</li></ul><b>Clinical implication:</b> The heart ↑ wall thickness (h) via hypertrophy to normalize wall stress when pressure (P) rises."
  },
  {
    q: "What type of ventricular remodeling occurs in response to chronic Pressure Overload (e.g., HTN, Aortic Stenosis) according to Laplace's Law?",
    a: "<b>Concentric Hypertrophy</b> — sarcomeres added in <b>parallel</b>.<br>↑ Wall thickness (h) → normalizes wall stress (σ) caused by high systolic pressure (P)."
  },
  {
    q: "What type of ventricular remodeling occurs in response to chronic Volume Overload (e.g., Aortic or Mitral Regurgitation)?",
    a: "<b>Eccentric Hypertrophy</b> — sarcomeres added in <b>series</b>.<br>↑ Ventricular radius (r) → dilated chamber accommodates larger volumes."
  },
  {
    q: "Define vascular conductance and state its mathematical relationship to resistance.",
    a: "Conductance = measure of blood flow for a given pressure gradient:<br>$$Conductance = \\frac{1}{Resistance}$$<br>Directly proportional to <b>r⁴</b> (fourth power of radius) per Poiseuille's Law."
  },
  {
    q: "How does the parallel arrangement of organs in the systemic circulation affect total vascular resistance?",
    a: "$$\\frac{1}{R_{total}} = \\frac{1}{R_1} + \\frac{1}{R_2} + \\dots + \\frac{1}{R_n}$$<br><b>Net effect:</b> Total resistance is <b>less than any single organ's resistance</b> → allows independent flow regulation to each organ + reduces LV workload."
  },

  // ==========================================
  // PART V: INTEGRATED FUNCTION CURVES
  // ==========================================
  {
    q: "What is Mean Systemic Filling Pressure (P<sub>msf</sub>) and where is it represented on a vascular function curve?",
    a: "P<sub>msf</sub> = equilibrium pressure throughout the cardiovascular system if active pumping stopped.<br>Represented by the <b>X-axis intercept</b> of the venous return curve (~7 mmHg normally)."
  },
  {
    q: "What physiological changes shift the P<sub>msf</sub> intercept to the right?",
    a: "<ul><li>↑ Total blood volume (e.g., IV fluid resuscitation)</li><li>↑ Venous tone via α₁ sympathetic <b>venoconstriction</b></li></ul>"
  },
  {
    q: "What physiological changes shift the P<sub>msf</sub> intercept to the left?",
    a: "<ul><li>↓ Total blood volume (e.g., <b>acute hemorrhage</b>)</li><li>↓ Venous tone via venodilators or spinal anesthesia</li></ul>"
  },
  {
    q: "How do alterations in Total Peripheral Resistance (TPR) change the slope of the Venous Return curve?",
    a: "<ul><li><b>↑ TPR:</b> Flattens slope downward — blood returns more slowly against higher resistance (pivots around fixed P<sub>msf</sub>)</li><li><b>↓ TPR</b> (e.g., anaphylaxis, AV fistula): Steepens slope upward — ↑ venous return to RA</li></ul>"
  },
  {
    q: "Where do the Cardiac Output and Venous Return curves intersect under normal resting conditions?",
    a: "They intersect at the steady-state <b>equilibrium point</b>:<ul><li>Right Atrial Pressure (RAP) ≈ 2 mmHg</li><li>Cardiac Output ≈ 5 L/min</li></ul>"
  },
  {
    q: "How do the cardiac output and venous return curves shift during acute myocardial infarction?",
    a: "<ul><li>CO curve shifts <b>down and right</b> (↓ contractility)</li><li>Venous return curve initially unchanged</li><li>New intersection: <b>↓ Cardiac Output + ↑ Right Atrial Pressure</b></li></ul>"
  },
  {
    q: "How does the body compensate for chronic heart failure on cardiac output and venous return curves?",
    a: "<ul><li>Kidneys retain fluid → ↑ blood volume → <b>venous return curve shifts right</b> (↑ P<sub>msf</sub>)</li><li>New equilibrium: near-normal CO at the cost of chronically <b>elevated RAP and venous pressures</b></li></ul>"
  },
  {
    q: "How do the curves shift during an acute, large fluid infusion?",
    a: "<ul><li>Venous return curve shifts <b>right</b> (↑ P<sub>msf</sub>)</li><li>CO curve remains stable</li><li>New intersection: <b>↑ Cardiac Output + ↑ Right Atrial Pressure</b></li></ul>"
  },
  {
    q: "How do cardiac output and venous return curves change in an individual with a large Arteriovenous (AV) Fistula?",
    a: "<ul><li>AV fistula bypasses arteriolar resistance → <b>↓↓ TPR</b></li><li>Venous return curve steepens upward</li><li>Sympathetic compensation shifts CO curve upward</li><li><b>Result: High-output cardiac state</b></li></ul>"
  },
  {
    q: "How does an isolated, moderate increase in myocardial contractility affect the integration curves?",
    a: "<ul><li>CO curve shifts <b>upward and to the left</b></li><li>Venous return curve remains stable</li><li>New intersection: <b>↑ Cardiac Output + ↓ Right Atrial Pressure</b></li></ul>"
  },

  // ==========================================
  // PART VI: REFLEX BP REGULATION
  // ==========================================
  {
    q: "Contrast the anatomical locations, afferent pathways, and primary triggers of the high-pressure arterial baroreceptors.",
    a: "<ul><li><b>Carotid Sinus:</b> Bifurcation of common carotid artery → <b>CN IX (Glossopharyngeal)</b> → senses both ↑ and ↓ BP</li><li><b>Aortic Arch:</b> Aortic arch wall → <b>CN X (Vagus)</b> → responds primarily to ↑ BP</li></ul>Both project to the <b>Nucleus Tractus Solitarius (NTS)</b> in the medulla."
  },
  {
    q: "Where do baroreceptor afferent fibers synapse in the brainstem, and what autonomic pathways do they activate?",
    a: "Synapse in the <b>Nucleus Tractus Solitarius (NTS)</b>.<br><ul><li>NTS activates <b>parasympathetic neurons</b> (nucleus ambiguus, dorsal motor nucleus)</li><li>NTS inhibits <b>sympathetic outflow</b> from the rostral ventrolateral medulla (RVLM)</li></ul>"
  },
  {
    q: "Outline the baroreceptor reflex cascade triggered immediately upon standing (Orthostasis).",
    a: "<ol><li>Standing → venous pooling → ↓ venous return → ↓ CO → ↓ BP</li><li>↓ Stretch at carotid sinus → ↓ afferent CN IX firing to NTS</li><li>NTS removes inhibition on sympathetic centers</li><li>↑ Sympathetic / ↓ Parasympathetic drive</li><li>→ ↑ HR, ↑ contractility, α₁ arteriolar and venous constriction → <b>BP restored</b></li></ol>"
  },
  {
    q: "Explain the physiological reflex triggered by Carotid Sinus Massage.",
    a: "External pressure mimics a <b>sudden surge in arterial blood pressure</b>.<br>→ ↑ CN IX afferent firing to NTS → ↑ vagal parasympathetic output → <b>slows SA node + delays AV conduction</b>.<br><b>Clinical use:</b> Terminates re-entrant supraventricular tachycardias."
  },
  {
    q: "What occurs during a bilateral carotid artery occlusion experiment, and how does the nervous system respond?",
    a: "Occlusion ↓ pressure within carotid sinuses → baroreceptors interpret this as <b>systemic hypotension</b> → ↓ afferent firing → removes NTS inhibition of sympathetic centers → <b>massive sympathetic discharge</b> → marked ↑ in systemic BP and HR."
  },
  {
    q: "Where are peripheral chemoreceptors located, what nerve pathways do they use, and what triggers activate them?",
    a: "<ul><li><b>Carotid Bodies</b> → CN IX</li><li><b>Aortic Bodies</b> → CN X</li></ul><b>Triggers:</b><ul><li><b>Hypoxemia</b> (pO₂ &lt; 60 mmHg) — primary stimulus</li><li>↑ pCO₂ (hypercapnia)</li><li>↓ pH (metabolic acidosis)</li></ul>"
  },
  {
    q: "What triggers the central chemoreceptors in the medulla, and why are they insensitive to direct changes in arterial pO₂?",
    a: "Central chemoreceptors respond to <b>changes in interstitial pH</b> (H⁺) within brain tissue.<br>CO₂ crosses the blood-brain barrier into CSF → converted to H⁺ by carbonic anhydrase → stimulates receptors.<br><b>O₂ does not readily alter CSF pH</b> → central receptors are insensitive to hypoxemia."
  },
  {
    q: "Detail the steps and clinical triad of the Cushing Reflex secondary to elevated ICP.",
    a: "<b>Trigger:</b> Elevated ICP → compresses cerebral microvessels → brainstem ischemia + local CO₂ accumulation → massive RVLM sympathetic discharge.<br><br><b>Triad:</b><ol><li><b>Severe systemic hypertension</b></li><li><b>Reflex bradycardia</b> (baroreceptor response to high BP)</li><li><b>Irregular respirations</b> (medullary respiratory center compression)</li></ol>"
  },
  {
    q: "What is the Bainbridge (Atrial) Reflex, and how does it interact with the baroreceptor reflex during volume expansion?",
    a: "<b>Bainbridge Reflex:</b> Stretch receptors in the RA sensing ↑ venous return → vagal afferents → medulla → <b>↑ heart rate</b> to clear the volume.<br><b>Interaction:</b> Counteracts baroreceptor reflex during hypervolemia — allows HR to rise despite ↑ pressure."
  },
  {
    q: "Describe the Bezold-Jarisch Reflex, including its triggers and clinical presentation.",
    a: "<b>Triggers:</b> Cardiopulmonary receptors in LV wall responding to ischemia, noxious chemicals, or severe hypovolemia → unmyelinated vagal afferents.<br><b>Triad:</b><ul><li><b>Bradycardia</b></li><li><b>Hypotension</b></li><li><b>Vasodilation</b></li></ul>Protects the underfilled, vulnerable heart."
  },

  // ==========================================
  // PART VII: LOCAL MICROCIRCULATION CONTROLS
  // ==========================================
  {
    q: "Differentiate between the Myogenic Hypothesis and the Metabolic Hypothesis of blood flow autoregulation.",
    a: "<ul><li><b>Myogenic:</b> Vascular smooth muscle contracts when stretched by ↑ intravascular pressure → stretch-activated Ca²⁺ channels → maintains constant flow</li><li><b>Metabolic:</b> Accumulation of vasodilator metabolic byproducts of local activity triggers vasodilation to flush them out</li></ul>"
  },
  {
    q: "Define 'Active Hyperemia' and 'Reactive Hyperemia' and distinguish them.",
    a: "<ul><li><b>Active Hyperemia:</b> ↑ local blood flow driven by ↑ metabolic activity (e.g., exercising skeletal muscle)</li><li><b>Reactive Hyperemia:</b> Transient surge in blood flow <b>immediately after release</b> of a temporary arterial occlusion — due to accumulated vasodilator metabolites</li></ul>"
  },
  {
    q: "List five primary local metabolic vasodilator factors in working skeletal muscle.",
    a: "<ol><li><b>Adenosine</b> (from ATP consumption)</li><li><b>K⁺</b> (from repeated action potentials)</li><li><b>Lactic acid / H⁺</b> (from anaerobic glycolysis)</li><li><b>CO₂</b></li><li><b>↑ Interstitial osmolarity</b></li></ol>"
  },
  {
    q: "Detail the intracellular signaling pathway of Nitric Oxide (NO) inside vascular smooth muscle cells.",
    a: "<ol><li>Shear stress → endothelial <b>eNOS</b> → NO from L-arginine</li><li>NO diffuses into adjacent smooth muscle</li><li>Activates <b>soluble guanylyl cyclase</b> → GTP → <b>cGMP</b></li><li>cGMP activates <b>Protein Kinase G (PKG)</b></li><li>PKG → ↓ intracellular Ca²⁺ + activates <b>myosin light chain phosphatase</b> → relaxation → vasodilation</li></ol>"
  },
  {
    q: "What metabolic vasodilator factor is the primary regulator of coronary blood flow during increased myocardial workload?",
    a: "<b>Adenosine</b> (along with Nitric Oxide).<br>↑ O₂ demand → ATP hydrolysis outpaces rephosphorylation → ↑ adenosine → diffuses to vascular smooth muscle → <b>coronary vasodilation</b>."
  },
  {
    q: "What local factor principally regulates cerebral blood flow, and how does hyperventilation modify cerebral perfusion?",
    a: "<b>Arterial pCO₂ (H⁺ ions)</b> is the primary regulator.<br><b>Hyperventilation</b> → ↓ pCO₂ → respiratory alkalosis → <b>cerebral vasoconstriction</b> → ↓ cerebral blood flow → lightheadedness/syncope."
  },
  {
    q: "What unique autoregulatory mechanism dominates the pulmonary circulation, and what is its purpose?",
    a: "<b>Hypoxic Pulmonary Vasoconstriction (HPV):</b> Pulmonary arterioles <b>constrict</b> when alveolar pO₂ drops (opposite of systemic response).<br><b>Purpose:</b> Shunts blood away from poorly ventilated segments → optimizes <b>V/Q matching</b>."
  },
  {
    q: "How does the cutaneous circulation regulate heat dissipation during core hyperthermia?",
    a: "Hyperthermia:<ul><li>Inhibits sympathetic adrenergic vasoconstrictor tone</li><li>Activates sympathetic <b>cholinergic fibers</b></li></ul>→ Widespread <b>cutaneous vasodilation</b> → heat radiation from skin surface."
  },
  {
    q: "What vasoactive peptide is synthesized by endothelial cells as a potent local vasoconstrictor?",
    a: "<b>Endothelin-1 (ET-1)</b> — released in response to endothelial injury or low shear stress.<br>Binds <b>ET<sub>A</sub> receptors</b> on vascular smooth muscle → G<sub>αq</sub>–PLC–IP₃ pathway → profound local vasoconstriction."
  },
  {
    q: "Explain the 'Autoregulatory Range' in the context of renal perfusion.",
    a: "The renal vascular bed maintains near-constant blood flow and GFR across an arterial pressure range of <b>80 to 180 mmHg</b>, regulated by:<ul><li>Myogenic responses of afferent arterioles</li><li>Tubuloglomerular feedback (TGF)</li></ul>"
  },

  // ==========================================
  // PART VIII: SPECIALIZED VASCULAR BEDS
  // ==========================================
  {
    q: "Why is the left ventricular myocardium susceptible to ischemic injury during tachycardia?",
    a: "The LV compresses its own coronary vessels during systole → effective coronary perfusion is limited to <b>diastole</b>.<br>Tachycardia <b>shortens diastole disproportionately more than systole</b> → ↓ coronary perfusion time → subendocardial ischemia."
  },
  {
    q: "What is the baseline oxygen extraction efficiency within the coronary circulation at rest?",
    a: "The heart extracts <b>75–80% of delivered O₂</b> at rest — already near-maximal.<br><b>Consequence:</b> Cannot significantly ↑ extraction during exercise → must meet ↑ O₂ demand <b>solely by ↑ coronary blood flow</b> via vasodilation."
  },
  {
    q: "Contrast the vascular filtration properties of glomerular capillaries vs. liver sinusoids.",
    a: "<ul><li><b>Glomerular Capillaries:</b> Fenestrated + negatively charged basement membrane → highly permeable to water/small solutes but restrictive to plasma proteins (σ ≈ 1)</li><li><b>Liver Sinusoids:</b> Discontinuous with large intercellular gaps → <b>completely permeable to plasma proteins</b> (σ ≈ 0)</li></ul>"
  },
  {
    q: "What anatomical structure protects the brain from focal ischemia if a single carotid artery is occluded?",
    a: "The <b>Circle of Willis</b> — an arterial anastomosis at the base of the brain linking:<ul><li>Anterior (carotid) circulation</li><li>Posterior (vertebrobasilar) circulation</li></ul>Allows collateral blood flow across hemispheres."
  },
  {
    q: "How does the skeletal muscle vascular bed respond to sympathetic activation at rest versus during active exercise?",
    a: "<ul><li><b>At Rest:</b> Sympathetic α₁ → vasoconstriction → maintains systemic BP</li><li><b>During Exercise:</b> Local metabolic vasodilators <b>override</b> sympathetic input (<b>functional sympatholysis</b>) → vasodilation → maximizes muscle blood flow</li></ul>"
  },
  {
    q: "Explain the role of the vasa vasorum and name a pathology that targets them.",
    a: "<b>Vasa vasorum:</b> Microvascular network supplying O₂ and nutrients to the outer layers of large arterial walls.<br><b>Tertiary Syphilis:</b> Causes endarteritis obliterans of vasa vasorum → ischemia and weakening of aortic wall → <b>aortic root aneurysm</b>."
  },
  {
    q: "What unique capillary structural adaptation forms the physical basis of the Blood-Brain Barrier (BBB)?",
    a: "Continuous endothelial cells joined by <b>high-resistance tight junctions</b> (claudins/occludins) + continuous basement membrane + <b>astrocyte foot processes</b>.<br>Together, these restrict paracellular diffusion of polar molecules into the CNS."
  },
  {
    q: "How does high altitude affect pulmonary arterial pressures and right ventricular workload?",
    a: "Low ambient pO₂ → <b>generalized hypoxic pulmonary vasoconstriction (HPV)</b> across all lung segments → ↑ pulmonary vascular resistance → <b>pulmonary hypertension</b> → ↑ RV afterload → can lead to <b>cor pulmonale</b>."
  },
  {
    q: "What mechanism prevents fluid from accumulating in the alveoli under normal conditions?",
    a: "Pulmonary capillary hydrostatic pressure is kept low (~10 mmHg), well <b>below</b> plasma oncotic pressure (~25 mmHg).<br>This Starling gradient <b>continuously favors fluid reabsorption</b>, keeping alveoli dry for optimal gas exchange."
  },
  {
    q: "What specialized vascular structure allows fetal blood to bypass the high-resistance pulmonary circulation?",
    a: "The <b>Ductus Arteriosus</b> — a vascular shunt connecting the <b>pulmonary artery to the proximal descending aorta</b>, diverting RV output away from the non-functional fetal lungs."
  }
];

module.exports = { cardioCards2 };
