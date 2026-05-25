/**
 * Schemas for remaining 62 calculators
 */
(function() {
  const L = (en, es) => ({ en, es });
  const sel = (opts) => opts.map(o => ({ v: o[0], l: L(o[1], o[2] || o[1]) }));
  const num = (id, en, es, unit, def, extra = {}) => ({ id, label: L(en, es), type: 'number', unit, default: def, ...extra });
  const tog = (id, en, es) => ({ id, label: L(en, es), type: 'toggle', default: false });

  Object.assign(CalcSchemas, {
    'ascvd-risk': { formula: '2013 ACC/AHA Pooled Cohort Equations', inputs: [
      num('age', 'Age', 'Edad', 'years', 55, { min: 40, max: 79 }),
      { id: 'sex', label: L('Sex', 'Sexo'), type: 'select', options: sel([['male', 'Male'], ['female', 'Female']]), default: 'male' },
      { id: 'race', label: L('Race', 'Raza'), type: 'select', options: sel([['white', 'White/Other'], ['aa', 'African American']]), default: 'white' },
      num('tc', 'Total cholesterol', 'Colesterol total', 'mg/dL', 200),
      num('hdl', 'HDL cholesterol', 'HDL', 'mg/dL', 50),
      num('sbp', 'Systolic BP', 'TAS', 'mmHg', 130),
      tog('treated', 'On BP treatment', 'Tratamiento TA'),
      tog('smoker', 'Smoker', 'Fumador'),
      tog('diabetic', 'Diabetes', 'Diabetes')
    ]},
    'abg-analyzer': { formula: 'pH, PaCO₂, HCO₃⁻ interpretation', inputs: [
      num('ph', 'pH', 'pH', '', 7.40, { step: 0.01 }),
      num('pco2', 'PaCO₂', 'PaCO₂', 'mmHg', 40),
      num('hco3', 'HCO₃⁻', 'HCO₃⁻', 'mEq/L', 24)
    ]},
    'acid-base': { formula: 'Acid-base disorder analysis', inputs: [
      num('ph', 'pH', 'pH', '', 7.40, { step: 0.01 }),
      num('pco2', 'PaCO₂', 'PaCO₂', 'mmHg', 40),
      num('hco3', 'HCO₃⁻', 'HCO₃⁻', 'mEq/L', 24),
      num('na', 'Sodium', 'Sodio', 'mEq/L', 140, { advanced: true }),
      num('cl', 'Chloride', 'Cloro', 'mEq/L', 105, { advanced: true }),
      num('albumin', 'Albumin', 'Albúmina', 'g/dL', 4, { advanced: true })
    ]},
    'electrolyte-deficit': { formula: 'Na/K deficit estimates', inputs: [
      { id: 'electrolyte', label: L('Electrolyte', 'Electrolito'), type: 'select', options: sel([['na', 'Sodium'], ['k', 'Potassium']]), default: 'k' },
      num('weight', 'Weight', 'Peso', 'kg', 70),
      num('current', 'Current level', 'Nivel actual', 'mEq/L', 3.5, { step: 0.1 }),
      num('target', 'Target level', 'Nivel objetivo', 'mEq/L', 4.0, { step: 0.1 })
    ]},
    'antibiotic-renal': { formula: 'CrCl-based dose adjustment', inputs: [
      { id: 'drug', label: L('Antibiotic', 'Antibiótico'), type: 'select', options: sel([['vancomycin', 'Vancomycin'], ['gentamicin', 'Gentamicin'], ['levofloxacin', 'Levofloxacin'], ['meropenem', 'Meropenem']]), default: 'vancomycin' },
      num('age', 'Age', 'Edad', 'years', 65),
      num('weight', 'Weight', 'Peso', 'kg', 70),
      num('scr', 'Serum creatinine', 'Creatinina', 'mg/dL', 1.5, { step: 0.1 }),
      { id: 'sex', label: L('Sex', 'Sexo'), type: 'select', options: sel([['male', 'Male'], ['female', 'Female']]), default: 'male' }
    ]},
    'ventilator-settings': { formula: 'Initial lung-protective ventilation', inputs: [
      num('ibw', 'Ideal body weight', 'PCI', 'kg', 70),
      num('rr', 'Respiratory rate', 'FR', '/min', 16),
      num('fio2', 'FiO₂', 'FiO₂', '%', 40),
      num('peep', 'PEEP', 'PEEP', 'cmH₂O', 5)
    ]},
    'dialysis-adequacy': { formula: 'Kt/V = −ln(R − 0.008×t) + (4−3.5×R)×UF/W', inputs: [
      num('preBun', 'Pre-dialysis BUN', 'BUN pre', 'mg/dL', 60),
      num('postBun', 'Post-dialysis BUN', 'BUN post', 'mg/dL', 20),
      num('time', 'Session time', 'Tiempo', 'hr', 4),
      num('uf', 'Ultrafiltration', 'UF', 'L', 2),
      num('weight', 'Post-dialysis weight', 'Peso post', 'kg', 70)
    ]},
    'acls-drugs': { formula: 'ACLS medication reference', inputs: [
      { id: 'drug', label: L('Drug', 'Fármaco'), type: 'select', options: sel([['epinephrine', 'Epinephrine'], ['amiodarone', 'Amiodarone'], ['atropine', 'Atropine'], ['adenosine', 'Adenosine'], ['calcium', 'Calcium'], ['magnesium', 'Magnesium']]), default: 'epinephrine' },
      tog('pediatric', 'Pediatric', 'Pediátrico')
    ]},
    'pediatric-resus': { formula: 'PALS weight-based dosing', inputs: [
      num('weight', 'Weight', 'Peso', 'kg', 15),
      { id: 'drug', label: L('Drug', 'Fármaco'), type: 'select', options: sel([['epinephrine', 'Epinephrine'], ['amiodarone', 'Amiodarone'], ['adenosine', 'Adenosine'], ['atropine', 'Atropine'], ['lidocaine', 'Lidocaine']]), default: 'epinephrine' }
    ]},
    'emergency-drug-dose': { formula: 'Emergency medication dosing', inputs: [
      num('weight', 'Weight', 'Peso', 'kg', 70),
      { id: 'drug', label: L('Drug', 'Fármaco'), type: 'select', options: sel([['epinephrine', 'Epinephrine 0.01 mg/kg'], ['diphenhydramine', 'Diphenhydramine 1 mg/kg'], ['dexamethasone', 'Dexamethasone 0.6 mg/kg (max 10 mg)'], ['lorazepam', 'Lorazepam 0.1 mg/kg (max 4 mg)']]), default: 'epinephrine' }
    ]},
    broselow: { formula: 'Length-based Broselow zone', inputs: [
      num('length', 'Body length', 'Longitud', 'cm', 100, { min: 46, max: 146 })
    ]},
    'trauma-score': { formula: 'Revised Trauma Score (RTS)', inputs: [
      { id: 'gcs', label: L('GCS code', 'Código GCS'), type: 'select', options: sel([[4, '13-15 (4)'], [3, '9-12 (3)'], [2, '6-8 (2)'], [1, '4-5 (1)'], [0, '3 (0)']]), default: 4 },
      { id: 'sbp', label: L('SBP code', 'Código TAS'), type: 'select', options: sel([[4, '>89 (4)'], [3, '76-89 (3)'], [2, '50-75 (2)'], [1, '1-49 (1)'], [0, '0 (0)']]), default: 4 },
      { id: 'rr', label: L('RR code', 'Código FR'), type: 'select', options: sel([[4, '10-29 (4)'], [3, '>29 (3)'], [2, '6-9 (2)'], [1, '1-5 (1)'], [0, '0 (0)']]), default: 4 }
    ]},
    'toxicology-dose': { formula: 'Toxicology reference dosing', inputs: [
      { id: 'toxin', label: L('Toxin/overdose', 'Toxina'), type: 'select', options: sel([['acetaminophen', 'Acetaminophen (NAC)'], ['opioid', 'Opioid (Naloxone)'], ['benzodiazepine', 'Benzodiazepine (Flumazenil)'], ['tricyclic', 'TCA (Bicarbonate)']]), default: 'acetaminophen' },
      num('weight', 'Weight', 'Peso', 'kg', 70)
    ]},
    antidote: { formula: 'Poisoning antidote reference', inputs: [
      { id: 'poison', label: L('Poisoning', 'Intoxicación'), type: 'select', options: sel([['acetaminophen', 'Acetaminophen'], ['opioid', 'Opioid'], ['benzodiazepine', 'Benzodiazepine'], ['digoxin', 'Digoxin'], ['cyanide', 'Cyanide'], ['tricyclic', 'Tricyclic antidepressant'], ['organophosphate', 'Organophosphate']]), default: 'opioid' }
    ]},
    'intubation-dose': { formula: 'RSI medication dosing', inputs: [
      num('weight', 'Weight', 'Peso', 'kg', 70),
      { id: 'drug', label: L('Drug', 'Fármaco'), type: 'select', options: sel([['etomidate', 'Etomidate'], ['propofol', 'Propofol'], ['ketamine', 'Ketamine'], ['succinylcholine', 'Succinylcholine'], ['rocuronium', 'Rocuronium'], ['fentanyl', 'Fentanyl']]), default: 'etomidate' },
      tog('pediatric', 'Pediatric', 'Pediátrico')
    ]},
    'sepsis-timer': { formula: 'Sepsis bundle time from recognition', inputs: [
      { id: 'recognition', label: L('Recognition time', 'Hora reconocimiento'), type: 'datetime-local', default: '' },
      { id: 'now', label: L('Current time (optional)', 'Hora actual'), type: 'datetime-local', default: '', advanced: true }
    ]},
    'peep-optimization': { formula: 'ARDSNet PEEP/FiO₂ table guidance', inputs: [
      num('fio2', 'FiO₂', 'FiO₂', '%', 40, { min: 30, max: 100, step: 10 })
    ]},
    'apache-ii': { formula: 'APACHE II acute physiology score', inputs: [
      num('temp', 'Temperature', 'Temp', '°C', 37, { step: 0.1 }),
      num('map', 'MAP', 'PAM', 'mmHg', 85),
      num('hr', 'Heart rate', 'FC', 'bpm', 80),
      num('rr', 'Respiratory rate', 'FR', '/min', 16),
      num('fio2', 'FiO₂', 'FiO₂', '%', 21),
      num('pao2', 'PaO₂ (if FiO₂<50%)', 'PaO₂', 'mmHg', 90),
      num('aao2', 'A-a gradient (if FiO₂≥50%)', 'Gradiente A-a', 'mmHg', 200, { advanced: true }),
      num('ph', 'Arterial pH', 'pH', '', 7.40, { step: 0.01 }),
      num('sodium', 'Sodium', 'Sodio', 'mEq/L', 140),
      num('potassium', 'Potassium', 'Potasio', 'mEq/L', 4.0, { step: 0.1 }),
      num('creatinine', 'Creatinine', 'Creatinina', 'mg/dL', 1.0, { step: 0.1 }),
      tog('arf', 'Acute renal failure', 'IRA aguda'),
      num('hct', 'Hematocrit', 'Hematocrito', '%', 42),
      num('wbc', 'WBC', 'Leucocitos', '×10³/µL', 8),
      num('gcs', 'GCS', 'GCS', '', 15, { min: 3, max: 15 }),
      num('agePoints', 'Age points', 'Puntos edad', '', 0, { advanced: true }),
      num('chronicPoints', 'Chronic health points', 'Puntos crónicos', '', 0, { advanced: true })
    ]},
    'vasopressor-titration': { formula: 'Vasopressor dose titration', inputs: [
      num('weight', 'Weight', 'Peso', 'kg', 70),
      { id: 'agent', label: L('Agent', 'Agente'), type: 'select', options: sel([['norepi', 'Norepinephrine'], ['epi', 'Epinephrine'], ['vasopressin', 'Vasopressin units/min']]), default: 'norepi' },
      num('dose', 'Target dose', 'Dosis objetivo', 'mcg/kg/min', 0.1, { step: 0.01 }),
      num('concentration', 'Bag concentration', 'Concentración', 'mg/mL', 4)
    ]},
    'sedation-drip': { formula: 'Sedation infusion mL/hr', inputs: [
      num('weight', 'Weight', 'Peso', 'kg', 70),
      { id: 'drug', label: L('Drug', 'Fármaco'), type: 'select', options: sel([['propofol', 'Propofol 10 mg/mL'], ['dexmedetomidine', 'Dexmedetomidine 4 mcg/mL'], ['midazolam', 'Midazolam 1 mg/mL']]), default: 'propofol' },
      num('dose', 'Target dose', 'Dosis', 'mcg/kg/min or mg/kg/hr', 30)
    ]},
    'insulin-infusion': { formula: 'IV insulin units/hr', inputs: [
      num('weight', 'Weight', 'Peso', 'kg', 70),
      num('unitsPerKgHr', 'Units/kg/hr', 'U/kg/hr', 'U/kg/hr', 0.1, { step: 0.01 })
    ]},
    'syringe-prep': { formula: 'Syringe volume = Dose / Concentration', inputs: [
      num('dose', 'Required dose', 'Dosis requerida', 'mg', 5),
      num('concentration', 'Syringe concentration', 'Concentración', 'mg/mL', 10)
    ]},
    'fall-risk': { formula: 'Morse Fall Scale', inputs: [
      tog('history', 'History of falling', 'Antecedente caídas'),
      tog('secondary', 'Secondary diagnosis', 'Diagnóstico secundario'),
      { id: 'ambulatory', label: L('Ambulatory aid', 'Ayuda deambulación'), type: 'select', options: sel([['none', 'None/bedrest/nurse'], ['crutches', 'Crutches/cane/walker'], ['weak', 'Furniture support (weak)'], ['impaired', 'Impaired gait']]), default: 'none' },
      tog('iv', 'IV/heparin lock', 'IV/heparina'),
      { id: 'gait', label: L('Gait', 'Marcha'), type: 'select', options: sel([['normal', 'Normal/bedrest/wheelchair'], ['weak', 'Weak'], ['impaired', 'Impaired']]), default: 'normal' },
      tog('mental', 'Mental status impaired', 'Estado mental alterado')
    ]},
    'cpr-drug-dose': { formula: 'CPR medication doses', inputs: [
      num('weight', 'Weight', 'Peso', 'kg', 70),
      { id: 'drug', label: L('Drug', 'Fármaco'), type: 'select', options: sel([['epinephrine', 'Epinephrine'], ['amiodarone', 'Amiodarone']]), default: 'epinephrine' },
      tog('pediatric', 'Pediatric', 'Pediátrico')
    ]},
    'pediatric-emergency-dose': { formula: 'Pediatric emergency dosing', inputs: [
      num('weight', 'Weight', 'Peso', 'kg', 20),
      { id: 'drug', label: L('Drug', 'Fármaco'), type: 'select', options: sel([['epinephrine', 'Epinephrine IM 0.01 mg/kg'], ['albuterol', 'Albuterol 2.5-5 mg neb'], ['dextrose', 'D10 5 mL/kg'], ['benzodiazepine', 'Midazolam 0.1 mg/kg']]), default: 'epinephrine' }
    ]},
    'renal-dose-adjust': { formula: 'Renal dose adjustment by CrCl', inputs: [
      num('standardDose', 'Standard dose', 'Dosis estándar', 'mg', 500),
      num('crcl', 'Creatinine clearance', 'CrCl', 'mL/min', 45),
      num('normalCrcl', 'Normal CrCl reference', 'CrCl normal', 'mL/min', 100, { advanced: true })
    ]},
    'hepatic-dose': { formula: 'Child-Pugh based adjustment', inputs: [
      num('standardDose', 'Standard dose', 'Dosis estándar', 'mg', 100),
      { id: 'childPugh', label: L('Child-Pugh class', 'Child-Pugh'), type: 'select', options: sel([['A', 'Class A'], ['B', 'Class B'], ['C', 'Class C']]), default: 'A' }
    ]},
    'drug-interaction': { formula: 'High-yield interaction check', inputs: [
      { id: 'drugA', label: L('Drug A', 'Fármaco A'), type: 'select', options: sel([['Warfarin', 'Warfarin'], ['SSRI', 'SSRI'], ['Metformin', 'Metformin'], ['ACE inhibitor', 'ACE inhibitor'], ['Digoxin', 'Digoxin'], ['Simvastatin', 'Simvastatin']]), default: 'Warfarin' },
      { id: 'drugB', label: L('Drug B', 'Fármaco B'), type: 'select', options: sel([['NSAIDs', 'NSAIDs'], ['Macrolides', 'Macrolides'], ['MAOI', 'MAOI'], ['IV Contrast', 'IV Contrast'], ['K-sparing diuretic', 'K-sparing diuretic'], ['Amiodarone', 'Amiodarone']]), default: 'NSAIDs' }
    ]},
    tdm: { formula: 'Therapeutic drug monitoring ranges', inputs: [
      { id: 'drug', label: L('Drug', 'Fármaco'), type: 'select', options: sel([['vancomycin', 'Vancomycin'], ['gentamicin', 'Gentamicin'], ['phenytoin', 'Phenytoin'], ['lithium', 'Lithium'], ['digoxin', 'Digoxin'], ['tacrolimus', 'Tacrolimus']]), default: 'vancomycin' },
      num('level', 'Patient level', 'Nivel paciente', '', 12, { advanced: true })
    ]},
    compounding: { formula: 'Alligation / quantity to prepare', inputs: [
      num('desiredConc', 'Desired concentration', 'Concentración deseada', '%', 2),
      num('stockHigh', 'Higher concentration', 'Mayor %', '%', 10),
      num('stockLow', 'Lower concentration', 'Menor %', '%', 0),
      num('totalVol', 'Total volume needed', 'Volumen total', 'mL', 100)
    ]},
    'iv-compatibility': { formula: 'Y-site compatibility reference', inputs: [
      { id: 'drug1', label: L('Drug 1', 'Fármaco 1'), type: 'select', options: sel([['piperacillin', 'Piperacillin-tazobactam'], ['vancomycin', 'Vancomycin'], ['phenytoin', 'Phenytoin'], ['diazepam', 'Diazepam']]), default: 'vancomycin' },
      { id: 'drug2', label: L('Drug 2 / fluid', 'Fármaco 2'), type: 'select', options: sel([['ns', 'Normal saline'], ['d5w', 'D5W'], ['lr', 'Lactated Ringer'], ['amiodarone', 'Amiodarone']]), default: 'ns' }
    ]},
    'vancomycin-auc': { formula: 'AUC₂₄ ≈ (Css × Cl × 24) / F simplified trough method', inputs: [
      num('trough', 'Steady-state trough', 'Valle', 'mg/L', 15),
      num('dose', 'Daily dose', 'Dosis diaria', 'mg', 2000),
      num('weight', 'Weight', 'Peso', 'kg', 70)
    ]},
    aminoglycoside: { formula: 'Hartford extended-interval dosing', inputs: [
      num('weight', 'Weight', 'Peso', 'kg', 70),
      { id: 'drug', label: L('Drug', 'Fármaco'), type: 'select', options: sel([['gentamicin', 'Gentamicin'], ['tobramycin', 'Tobramycin'], ['amikacin', 'Amikacin']]), default: 'gentamicin' },
      num('crcl', 'CrCl', 'CrCl', 'mL/min', 80)
    ]},
    'chemotherapy-dose': { formula: 'Dose = BSA × mg/m²', inputs: [
      num('weight', 'Weight', 'Peso', 'kg', 70),
      num('height', 'Height', 'Altura', 'cm', 170),
      num('dosePerM2', 'Protocol dose', 'Dosis protocolo', 'mg/m²', 75)
    ]},
    tpn: { formula: 'TPN macronutrient calculator', inputs: [
      num('weight', 'Weight', 'Peso', 'kg', 70),
      num('caloriesPerKg', 'Calories/kg', 'Cal/kg', 'kcal/kg', 25),
      num('proteinPerKg', 'Protein g/kg', 'Proteína g/kg', 'g/kg', 1.5, { step: 0.1 }),
      num('volume', 'Total daily volume', 'Volumen diario', 'mL', 2000)
    ]},
    'ped-emergency-drugs': { formula: 'Pediatric emergency reference', inputs: [
      num('weight', 'Weight', 'Peso', 'kg', 15),
      { id: 'drug', label: L('Drug', 'Fármaco'), type: 'select', options: sel([['epinephrine', 'Epinephrine'], ['atropine', 'Atropine'], ['adenosine', 'Adenosine'], ['amiodarone', 'Amiodarone']]), default: 'epinephrine' }
    ]},
    'neonatal-dose': { formula: 'Neonatal weight-based dosing', inputs: [
      num('weight', 'Weight', 'Peso', 'kg', 3.5, { step: 0.1 }),
      num('dosePerKg', 'Dose per kg', 'Dosis/kg', 'mg/kg', 0.01, { step: 0.001 })
    ]},
    'growth-percentile': { formula: 'WHO weight-for-age estimate', inputs: [
      num('ageMonths', 'Age', 'Edad', 'months', 12, { min: 0, max: 24 }),
      num('weight', 'Weight', 'Peso', 'kg', 9.5, { step: 0.1 }),
      { id: 'sex', label: L('Sex', 'Sexo'), type: 'select', options: sel([['male', 'Male'], ['female', 'Female']]), default: 'male' }
    ]},
    'head-circumference': { formula: 'Head circumference percentile (simplified WHO)', inputs: [
      num('ageMonths', 'Age', 'Edad', 'months', 6, { min: 0, max: 24 }),
      num('hc', 'Head circumference', 'PC', 'cm', 43, { step: 0.1 })
    ]},
    'ped-bp-percentile': { formula: 'Pediatric BP screening (simplified)', inputs: [
      num('ageYears', 'Age', 'Edad', 'years', 10, { min: 1, max: 17 }),
      num('height', 'Height percentile', 'Percentil talla', '%', 50),
      num('sbp', 'Systolic BP', 'TAS', 'mmHg', 110),
      num('dbp', 'Diastolic BP', 'TAD', 'mmHg', 70),
      { id: 'sex', label: L('Sex', 'Sexo'), type: 'select', options: sel([['male', 'Male'], ['female', 'Female']]), default: 'male' }
    ]},
    'neonatal-bilirubin': { formula: 'Bilirubin risk zone (Bhutani nomogram simplified)', inputs: [
      num('ageHours', 'Age of newborn', 'Edad RN', 'hours', 24, { min: 0, max: 144 }),
      num('bilirubin', 'Total bilirubin', 'Bilirrubina', 'mg/dL', 8, { step: 0.1 }),
      tog('risk', 'High risk (G6PD, sepsis, etc.)', 'Alto riesgo')
    ]},
    'contraction-timer': { formula: 'Contraction frequency = 60 / interval (min)', inputs: [
      num('duration', 'Contraction duration', 'Duración', 'sec', 60),
      num('interval', 'Interval between contractions', 'Intervalo', 'min', 5, { step: 0.5 })
    ]},
    'pregnancy-weight': { formula: 'IOM total weight gain recommendations', inputs: [
      num('preBmi', 'Pre-pregnancy BMI', 'IMC pre-embarazo', 'kg/m²', 24, { step: 0.1 }),
      num('weeks', 'Gestational weeks', 'Semanas', 'weeks', 20, { min: 1, max: 40 })
    ]},
    'oxytocin-infusion': { formula: 'Oxytocin mU/min from mL/hr', inputs: [
      num('mlHr', 'Infusion rate', 'Tasa infusión', 'mL/hr', 3),
      num('unitsPerL', 'Units in 1 L', 'Unidades/L', 'units/L', 30)
    ]},
    vbac: { formula: 'VBAC success probability (simplified)', inputs: [
      num('age', 'Maternal age', 'Edad materna', 'years', 32),
      tog('priorVaginal', 'Prior vaginal delivery', 'Parto vaginal previo'),
      { id: 'reasonPrior', label: L('Prior CS reason', 'Motivo cesárea previa'), type: 'select', options: sel([['other', 'Other'], ['dystocia', 'Failure to progress/dystocia']]), default: 'other' },
      num('bmi', 'BMI', 'IMC', 'kg/m²', 28),
      tog('laborInduced', 'Induced labor', 'Inducción')
    ]},
    'fetal-weight': { formula: 'Hadlock EFW (AC + BPD + HC)', inputs: [
      num('ac', 'Abdominal circumference', 'CA', 'cm', 30, { step: 0.1 }),
      num('bpd', 'Biparietal diameter', 'DBP', 'cm', 8.5, { step: 0.1 }),
      num('hc', 'Head circumference', 'CC', 'cm', 32, { step: 0.1 })
    ]},
    'induction-dose': { formula: 'Induction agent mg/kg', inputs: [
      num('weight', 'Weight', 'Peso', 'kg', 70),
      { id: 'drug', label: L('Agent', 'Agente'), type: 'select', options: sel([['propofol', 'Propofol'], ['etomidate', 'Etomidate'], ['ketamine', 'Ketamine']]), default: 'propofol' },
      tog('pediatric', 'Pediatric', 'Pediátrico')
    ]},
    'paralytic-dose': { formula: 'NMB dosing mg/kg', inputs: [
      num('weight', 'Weight', 'Peso', 'kg', 70),
      { id: 'drug', label: L('Agent', 'Agente'), type: 'select', options: sel([['succinylcholine', 'Succinylcholine'], ['rocuronium', 'Rocuronium'], ['vecuronium', 'Vecuronium']]), default: 'rocuronium' }
    ]},
    'sedation-dose': { formula: 'Procedural sedation dosing', inputs: [
      num('weight', 'Weight', 'Peso', 'kg', 70),
      { id: 'drug', label: L('Agent', 'Agente'), type: 'select', options: sel([['midazolam', 'Midazolam 0.05 mg/kg'], ['fentanyl', 'Fentanyl 1 mcg/kg'], ['ketamine', 'Ketamine 1 mg/kg'], ['propofol', 'Propofol 1 mg/kg']]), default: 'midazolam' }
    ]},
    'difficult-airway': { formula: 'LEMON airway assessment', inputs: [
      { id: 'look', label: L('Look externally', 'Aspecto externo'), type: 'select', options: sel([['normal', 'Normal'], ['abnormal', 'Abnormal']]), default: 'normal' },
      { id: 'evaluation', label: L('Evaluate 3-3-2', 'Evaluación 3-3-2'), type: 'select', options: sel([['normal', 'Normal'], ['abnormal', 'Abnormal']]), default: 'normal' },
      num('mallampati', 'Mallampati', 'Mallampati', '', 2, { min: 1, max: 4 }),
      tog('obstruction', 'Obstruction/trauma', 'Obstrucción/trauma'),
      { id: 'neck', label: L('Neck mobility', 'Movilidad cuello'), type: 'select', options: sel([['normal', 'Normal'], ['limited', 'Limited']]), default: 'normal' }
    ]},
    mac: { formula: 'Age-adjusted MAC', inputs: [
      { id: 'agent', label: L('Agent', 'Agente'), type: 'select', options: sel([['sevoflurane', 'Sevoflurane'], ['isoflurane', 'Isoflurane']]), default: 'sevoflurane' },
      { id: 'ageGroup', label: L('Age group', 'Grupo edad'), type: 'select', options: sel([['neonate', 'Neonate'], ['infant', 'Infant'], ['child', 'Child'], ['adult', 'Adult']]), default: 'adult' },
      num('age', 'Age (for adjustment)', 'Edad', 'years', 40, { advanced: true })
    ]},
    'student-abg': { formula: 'ABG interpretation (learning mode)', inputs: [
      num('ph', 'pH', 'pH', '', 7.40, { step: 0.01 }),
      num('pco2', 'PaCO₂', 'PaCO₂', 'mmHg', 40),
      num('hco3', 'HCO₃⁻', 'HCO₃⁻', 'mEq/L', 24),
      num('pao2', 'PaO₂', 'PaO₂', 'mmHg', 95, { advanced: true })
    ]},
    'student-ecg': { formula: 'ECG rate & QTc', inputs: [
      num('rr', 'R-R interval', 'Intervalo R-R', 'mm', 20),
      num('qt', 'QT interval', 'QT', 'mm', 16),
      num('paperSpeed', 'Paper speed', 'Velocidad', 'mm/s', 25, { advanced: true })
    ]},
    'formula-library': { formula: 'Medical formula reference', inputs: [
      { id: 'formula', label: L('Select formula', 'Seleccionar fórmula'), type: 'select', options: CalcClinicalData.formulas.map((f, i) => ({ v: i, l: L(f.name, f.name) })), default: 0 }
    ]},
    'disease-criteria': { formula: 'Diagnostic criteria reference', inputs: [
      { id: 'disease', label: L('Condition', 'Condición'), type: 'select', options: sel([['sepsis3', 'Sepsis-3'], ['sirs', 'SIRS'], ['dka', 'DKA'], ['stemi', 'STEMI']]), default: 'sepsis3' }
    ]},
    'diagnostic-scores': { formula: 'Clinical score reference', inputs: [
      { id: 'score', label: L('Score', 'Puntuación'), type: 'select', options: sel([['Wells PE', 'Wells PE'], ['CURB-65', 'CURB-65'], ['CHADS₂-VASc', 'CHADS₂-VASc'], ['HEART', 'HEART Score']]), default: 'Wells PE' }
    ]},
    'lab-interpretation': { formula: 'Lab value interpretation', inputs: [
      { id: 'test', label: L('Lab test', 'Prueba'), type: 'select', options: sel([['sodium', 'Sodium'], ['potassium', 'Potassium'], ['glucose', 'Glucose'], ['creatinine', 'Creatinine'], ['hemoglobin', 'Hemoglobin']]), default: 'sodium' },
      num('value', 'Patient value', 'Valor', '', 138)
    ]},
    'dvt-risk': { formula: 'Caprini VTE risk score (simplified)', inputs: [
      tog('age41', 'Age 41-60'), tog('age60', 'Age 61-74'), tog('age75', 'Age ≥75'),
      tog('surgeryMajor', 'Major surgery <30 days'), tog('cancer', 'Active cancer'),
      tog('priorVTE', 'Prior VTE'), tog('immobile', 'Immobility >72 hr')
    ]},
    'postop-pain': { formula: 'Post-op analgesia weight-based', inputs: [
      num('weight', 'Weight', 'Peso', 'kg', 70),
      { id: 'drug', label: L('Analgesic', 'Analgésico'), type: 'select', options: sel([['morphine', 'Morphine 0.1 mg/kg IV'], ['hydromorphone', 'Hydromorphone 0.015 mg/kg IV'], ['ketorolac', 'Ketorolac 0.5 mg/kg IV (max 30 mg)']]), default: 'morphine' }
    ]},
    'antibiotic-prophylaxis': { formula: 'Surgical prophylaxis dosing', inputs: [
      num('weight', 'Weight', 'Peso', 'kg', 70),
      { id: 'procedure', label: L('Procedure type', 'Procedimiento'), type: 'select', options: sel([['clean', 'Clean surgery'], ['cleanContaminated', 'Clean-contaminated'], ['colorectal', 'Colorectal']]), default: 'cleanContaminated' },
      tog('allergy', 'Beta-lactam allergy', 'Alergia beta-lactámicos')
    ]},
    'qc-stats': { formula: 'QC: Mean, SD, CV%', inputs: [
      num('v1', 'Value 1', 'Valor 1', '', 100),
      num('v2', 'Value 2', 'Valor 2', '', 102),
      num('v3', 'Value 3', 'Valor 3', '', 98),
      num('v4', 'Value 4', 'Valor 4', '', 101),
      num('v5', 'Value 5', 'Valor 5', '', 99),
      num('target', 'Target mean', 'Media objetivo', '', 100, { advanced: true })
    ]},
    'diet-tpn': { formula: 'Dietitian TPN planning', inputs: [
      num('weight', 'Weight', 'Peso', 'kg', 70),
      num('tdee', 'Daily calories', 'Calorías/día', 'kcal', 2000),
      num('proteinG', 'Protein goal', 'Proteína', 'g/day', 80),
      num('volume', 'Fluid volume', 'Volumen', 'mL/day', 2000)
    ]}
  });

  CalcSchemas['student-abg'] = CalcSchemas['abg-analyzer'];
})();
