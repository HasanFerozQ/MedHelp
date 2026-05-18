/**
 * MediHelp Medical Calculator — Input schemas per calculator
 */
window.CalcSchemas = {
  bmi: {
    formula: 'BMI = weight (kg) / height (m)²',
    inputs: [
      { id: 'weight', label: { en: 'Weight', es: 'Peso' }, type: 'number', unit: 'kg', unitGroup: 'weight', min: 1, max: 500, default: 70, step: 0.1 },
      { id: 'height', label: { en: 'Height', es: 'Altura' }, type: 'number', unit: 'cm', unitGroup: 'height', min: 50, max: 250, default: 170, step: 0.1 }
    ]
  },
  bsa: {
    formula: 'BSA = √((height × weight) / 3600)',
    inputs: [
      { id: 'weight', label: { en: 'Weight', es: 'Peso' }, type: 'number', unit: 'kg', unitGroup: 'weight', default: 70 },
      { id: 'height', label: { en: 'Height', es: 'Altura' }, type: 'number', unit: 'cm', unitGroup: 'height', default: 170 }
    ]
  },
  'creatinine-clearance': {
    formula: 'CrCl = ((140−age) × weight × (0.85 if ♀)) / (72 × SCr)',
    inputs: [
      { id: 'age', label: { en: 'Age', es: 'Edad' }, type: 'number', unit: 'years', default: 65, min: 1, max: 120 },
      { id: 'weight', label: { en: 'Weight', es: 'Peso' }, type: 'number', unit: 'kg', unitGroup: 'weight', default: 70 },
      { id: 'scr', label: { en: 'Serum Creatinine', es: 'Creatinina sérica' }, type: 'number', unit: 'mg/dL', unitGroup: 'creatinine', default: 1.2, step: 0.1 },
      { id: 'sex', label: { en: 'Sex', es: 'Sexo' }, type: 'select', options: [{ v: 'male', l: { en: 'Male', es: 'Masculino' } }, { v: 'female', l: { en: 'Female', es: 'Femenino' } }], default: 'male' }
    ]
  },
  egfr: {
    formula: 'CKD-EPI 2021 (creatinine-based)',
    inputs: [
      { id: 'age', label: { en: 'Age', es: 'Edad' }, type: 'number', unit: 'years', default: 55 },
      { id: 'scr', label: { en: 'Serum Creatinine', es: 'Creatinina sérica' }, type: 'number', unit: 'mg/dL', unitGroup: 'creatinine', default: 1.0, step: 0.1 },
      { id: 'sex', label: { en: 'Sex', es: 'Sexo' }, type: 'select', options: [{ v: 'male', l: { en: 'Male', es: 'Masculino' } }, { v: 'female', l: { en: 'Female', es: 'Femenino' } }], default: 'male' }
    ]
  },
  'chads2-vasc': {
    formula: 'CHADS₂-VASc score (0–9)',
    inputs: [
      { id: 'chf', label: { en: 'CHF history', es: 'Antecedente IC' }, type: 'toggle', default: false },
      { id: 'htn', label: { en: 'Hypertension', es: 'Hipertensión' }, type: 'toggle', default: false },
      { id: 'age75', label: { en: 'Age ≥75', es: 'Edad ≥75' }, type: 'toggle', default: false },
      { id: 'age65', label: { en: 'Age 65–74', es: 'Edad 65–74' }, type: 'toggle', default: false },
      { id: 'dm', label: { en: 'Diabetes', es: 'Diabetes' }, type: 'toggle', default: false },
      { id: 'stroke', label: { en: 'Stroke/TIA history', es: 'Ictus/AIT previo' }, type: 'toggle', default: false },
      { id: 'vascular', label: { en: 'Vascular disease', es: 'Enfermedad vascular' }, type: 'toggle', default: false },
      { id: 'sex', label: { en: 'Female sex', es: 'Sexo femenino' }, type: 'toggle', default: false }
    ]
  },
  'wells-pe': {
    formula: 'Wells criteria for PE',
    inputs: [
      { id: 'dvt', label: { en: 'Clinical signs DVT', es: 'Signos clínicos TVP' }, type: 'toggle', default: false },
      { id: 'peLikely', label: { en: 'PE most likely diagnosis', es: 'TEP diagnóstico más probable' }, type: 'toggle', default: false },
      { id: 'hr', label: { en: 'Heart rate >100', es: 'FC >100' }, type: 'toggle', default: false },
      { id: 'immob', label: { en: 'Immobilization/surgery (4 wks)', es: 'Inmovilización/cirugía (4 sem)' }, type: 'toggle', default: false },
      { id: 'prevPe', label: { en: 'Previous PE/DVT', es: 'TEP/TVP previo' }, type: 'toggle', default: false },
      { id: 'hemoptysis', label: { en: 'Hemoptysis', es: 'Hemoptisis' }, type: 'toggle', default: false },
      { id: 'malignancy', label: { en: 'Malignancy', es: 'Malignidad' }, type: 'toggle', default: false }
    ]
  },
  curb65: {
    formula: 'CURB-65 (0–5)',
    inputs: [
      { id: 'confusion', label: { en: 'Confusion', es: 'Confusión' }, type: 'toggle', default: false },
      { id: 'bun', label: { en: 'BUN >19 mg/dL (Urea >7 mmol/L)', es: 'BUN >19 mg/dL' }, type: 'toggle', default: false },
      { id: 'rr', label: { en: 'RR ≥30', es: 'FR ≥30' }, type: 'toggle', default: false },
      { id: 'bp', label: { en: 'SBP <90 or DBP ≤60', es: 'TAS <90 o TAD ≤60' }, type: 'toggle', default: false },
      { id: 'age65', label: { en: 'Age ≥65', es: 'Edad ≥65' }, type: 'toggle', default: false }
    ]
  },
  qsofa: {
    formula: 'qSOFA ≥2 suggests sepsis',
    inputs: [
      { id: 'rr', label: { en: 'Respiratory rate', es: 'Frecuencia respiratoria' }, type: 'number', unit: '/min', default: 18, min: 4, max: 60 },
      { id: 'sbp', label: { en: 'Systolic BP', es: 'TAS' }, type: 'number', unit: 'mmHg', default: 120, min: 50, max: 250 },
      { id: 'gcs', label: { en: 'GCS (if altered use <15)', es: 'GCS' }, type: 'number', default: 15, min: 3, max: 15 }
    ]
  },
  gcs: {
    formula: 'GCS = Eye + Verbal + Motor',
    inputs: [
      { id: 'eye', label: { en: 'Eye opening', es: 'Apertura ocular' }, type: 'select', options: [
        { v: 4, l: { en: '4 — Spontaneous', es: '4 — Espontánea' } },
        { v: 3, l: { en: '3 — To voice', es: '3 — A la voz' } },
        { v: 2, l: { en: '2 — To pain', es: '2 — Al dolor' } },
        { v: 1, l: { en: '1 — None', es: '1 — Ninguna' } }
      ], default: 4 },
      { id: 'verbal', label: { en: 'Verbal response', es: 'Respuesta verbal' }, type: 'select', options: [
        { v: 5, l: { en: '5 — Oriented', es: '5 — Orientado' } },
        { v: 4, l: { en: '4 — Confused', es: '4 — Confuso' } },
        { v: 3, l: { en: '3 — Inappropriate', es: '3 — Inapropiadas' } },
        { v: 2, l: { en: '2 — Incomprehensible', es: '2 — Incomprensibles' } },
        { v: 1, l: { en: '1 — None', es: '1 — Ninguna' } }
      ], default: 5 },
      { id: 'motor', label: { en: 'Motor response', es: 'Respuesta motora' }, type: 'select', options: [
        { v: 6, l: { en: '6 — Obeys', es: '6 — Obedece' } },
        { v: 5, l: { en: '5 — Localizes', es: '5 — Localiza' } },
        { v: 4, l: { en: '4 — Withdraws', es: '4 — Retira' } },
        { v: 3, l: { en: '3 — Flexion', es: '3 — Flexión' } },
        { v: 2, l: { en: '2 — Extension', es: '2 — Extensión' } },
        { v: 1, l: { en: '1 — None', es: '1 — Ninguna' } }
      ], default: 6 }
    ]
  },
  map: {
    formula: 'MAP = (SBP + 2×DBP) / 3',
    inputs: [
      { id: 'sbp', label: { en: 'Systolic BP', es: 'TAS' }, type: 'number', unit: 'mmHg', default: 120 },
      { id: 'dbp', label: { en: 'Diastolic BP', es: 'TAD' }, type: 'number', unit: 'mmHg', default: 80 }
    ]
  },
  'shock-index': {
    formula: 'Shock Index = HR / SBP',
    inputs: [
      { id: 'hr', label: { en: 'Heart rate', es: 'Frecuencia cardíaca' }, type: 'number', unit: 'bpm', default: 90 },
      { id: 'sbp', label: { en: 'Systolic BP', es: 'TAS' }, type: 'number', unit: 'mmHg', default: 110 }
    ]
  },
  parkland: {
    formula: '4 × weight (kg) × %TBSA = mL/24h',
    inputs: [
      { id: 'weight', label: { en: 'Weight', es: 'Peso' }, type: 'number', unit: 'kg', default: 70 },
      { id: 'tbsa', label: { en: 'TBSA burned', es: '% SCQ' }, type: 'number', unit: '%', default: 20, min: 1, max: 100 }
    ]
  },
  'iv-flow-rate': {
    formula: 'Flow rate = Volume / Time',
    inputs: [
      { id: 'volume', label: { en: 'Volume', es: 'Volumen' }, type: 'number', unit: 'mL', default: 1000 },
      { id: 'time', label: { en: 'Time', es: 'Tiempo' }, type: 'number', unit: 'hr', default: 8, step: 0.5 }
    ]
  },
  'drops-per-minute': {
    formula: 'gtt/min = (Volume × drop factor) / Time (min)',
    inputs: [
      { id: 'volume', label: { en: 'Volume', es: 'Volumen' }, type: 'number', unit: 'mL', default: 500 },
      { id: 'factor', label: { en: 'Drop factor', es: 'Factor de goteo' }, type: 'select', options: [
        { v: 10, l: { en: '10 gtt/mL (macro)', es: '10 gtt/mL' } },
        { v: 15, l: { en: '15 gtt/mL', es: '15 gtt/mL' } },
        { v: 20, l: { en: '20 gtt/mL', es: '20 gtt/mL' } },
        { v: 60, l: { en: '60 gtt/mL (micro)', es: '60 gtt/mL (micro)' } }
      ], default: 20 },
      { id: 'time', label: { en: 'Time', es: 'Tiempo' }, type: 'number', unit: 'min', default: 60 }
    ]
  },
  'weight-based-dose': {
    formula: 'Dose = Weight × Dose/kg',
    inputs: [
      { id: 'weight', label: { en: 'Weight', es: 'Peso' }, type: 'number', unit: 'kg', default: 70 },
      { id: 'dosePerKg', label: { en: 'Dose per kg', es: 'Dosis por kg' }, type: 'number', unit: 'mg/kg', default: 15, step: 0.1 }
    ]
  },
  concentration: {
    formula: 'Concentration = Mass / Volume',
    inputs: [
      { id: 'mass', label: { en: 'Drug mass', es: 'Masa fármaco' }, type: 'number', unit: 'mg', default: 500 },
      { id: 'volume', label: { en: 'Volume', es: 'Volumen' }, type: 'number', unit: 'mL', default: 10 }
    ]
  },
  ibw: {
    formula: 'Devine: Male 50+2.3(in−60) | Female 45.5+2.3(in−60)',
    inputs: [
      { id: 'height', label: { en: 'Height', es: 'Altura' }, type: 'number', unit: 'cm', default: 170 },
      { id: 'sex', label: { en: 'Sex', es: 'Sexo' }, type: 'select', options: [{ v: 'male', l: { en: 'Male', es: 'Masculino' } }, { v: 'female', l: { en: 'Female', es: 'Femenino' } }], default: 'male' }
    ]
  },
  'tidal-volume': {
    formula: 'Vt = 6–8 mL/kg IBW',
    inputs: [
      { id: 'ibw', label: { en: 'Ideal body weight', es: 'Peso corporal ideal' }, type: 'number', unit: 'kg', default: 70 },
      { id: 'mlPerKg', label: { en: 'mL/kg target', es: 'mL/kg objetivo' }, type: 'select', options: [{ v: 6, l: { en: '6 (lung-protective)', es: '6 (protectora)' } }, { v: 7, l: { en: '7', es: '7' } }, { v: 8, l: { en: '8', es: '8' } }], default: 6 }
    ]
  },
  apgar: {
    formula: 'APGAR = Appearance + Pulse + Grimace + Activity + Respiration',
    inputs: [
      { id: 'appearance', label: { en: 'Appearance (skin color)', es: 'Aspecto (color piel)' }, type: 'select', options: [{ v: 0, l: { en: '0 — Blue/pale', es: '0 — Azul/pálido' } }, { v: 1, l: { en: '1 — Body pink, extremities blue', es: '1 — Tronco rosado' } }, { v: 2, l: { en: '2 — Completely pink', es: '2 — Completamente rosado' } }], default: 2 },
      { id: 'pulse', label: { en: 'Pulse', es: 'Pulso' }, type: 'select', options: [{ v: 0, l: { en: '0 — Absent', es: '0 — Ausente' } }, { v: 1, l: { en: '1 — <100', es: '1 — <100' } }, { v: 2, l: { en: '2 — ≥100', es: '2 — ≥100' } }], default: 2 },
      { id: 'grimace', label: { en: 'Grimace (reflex)', es: 'Gesticulación (reflejo)' }, type: 'select', options: [{ v: 0, l: { en: '0 — None', es: '0 — Ninguna' } }, { v: 1, l: { en: '1 — Grimace', es: '1 — Mueca' } }, { v: 2, l: { en: '2 — Cry/pull away', es: '2 — Llanto/retirada' } }], default: 2 },
      { id: 'activity', label: { en: 'Activity (muscle tone)', es: 'Actividad (tono)' }, type: 'select', options: [{ v: 0, l: { en: '0 — Limp', es: '0 — Flácido' } }, { v: 1, l: { en: '1 — Some flexion', es: '1 — Algo flexión' } }, { v: 2, l: { en: '2 — Active motion', es: '2 — Movimiento activo' } }], default: 2 },
      { id: 'respiration', label: { en: 'Respiration', es: 'Respiración' }, type: 'select', options: [{ v: 0, l: { en: '0 — Absent', es: '0 — Ausente' } }, { v: 1, l: { en: '1 — Slow/irregular', es: '1 — Lenta/irregular' } }, { v: 2, l: { en: '2 — Good cry', es: '2 — Buen llanto' } }], default: 2 }
    ]
  },
  'gestational-age': {
    formula: 'GA from LMP or ultrasound date',
    inputs: [
      { id: 'lmp', label: { en: 'Last menstrual period', es: 'FUM' }, type: 'date', default: '' },
      { id: 'usWeeks', label: { en: 'OR Ultrasound GA (weeks)', es: 'O EG ecografía (sem)' }, type: 'number', unit: 'weeks', default: '', advanced: true },
      { id: 'usDays', label: { en: 'Ultrasound GA (days)', es: 'EG ecografía (días)' }, type: 'number', unit: 'days', default: 0, advanced: true },
      { id: 'usDate', label: { en: 'Ultrasound date', es: 'Fecha ecografía' }, type: 'date', default: '', advanced: true }
    ]
  },
  'anion-gap': {
    formula: 'AG = Na⁺ − (Cl⁻ + HCO₃⁻)',
    inputs: [
      { id: 'na', label: { en: 'Sodium', es: 'Sodio' }, type: 'number', unit: 'mEq/L', default: 140 },
      { id: 'cl', label: { en: 'Chloride', es: 'Cloro' }, type: 'number', unit: 'mEq/L', default: 105 },
      { id: 'hco3', label: { en: 'Bicarbonate', es: 'Bicarbonato' }, type: 'number', unit: 'mEq/L', default: 24 }
    ]
  },
  'corrected-calcium': {
    formula: 'Ca_corr = Ca + 0.8 × (4 − albumin)',
    inputs: [
      { id: 'ca', label: { en: 'Measured calcium', es: 'Calcio medido' }, type: 'number', unit: 'mg/dL', default: 8.5, step: 0.1 },
      { id: 'albumin', label: { en: 'Albumin', es: 'Albúmina' }, type: 'number', unit: 'g/dL', default: 4.0, step: 0.1 }
    ]
  },
  'corrected-sodium': {
    formula: 'Na_corr = Na + (1.6 or 2.4 if glucose > 400) × ((glucose−100)/100)',
    inputs: [
      { id: 'na', label: { en: 'Measured sodium', es: 'Sodio medido' }, type: 'number', unit: 'mEq/L', default: 135 },
      { id: 'glucose', label: { en: 'Glucose', es: 'Glucosa' }, type: 'number', unit: 'mg/dL', default: 300 }
    ]
  },
  'maintenance-fluid': {
    formula: '100 mL/kg (1st 10) + 50 mL/kg (next 10) + 20 mL/kg (rest)',
    inputs: [
      { id: 'weight', label: { en: 'Weight', es: 'Peso' }, type: 'number', unit: 'kg', default: 70 }
    ]
  },
  'defibrillation-energy': {
    formula: '1st: 2 J/kg | 2nd: 4 J/kg | Max 10 J/kg or 360 J',
    inputs: [
      { id: 'weight', label: { en: 'Weight', es: 'Peso' }, type: 'number', unit: 'kg', default: 70 },
      { id: 'attempt', label: { en: 'Shock attempt', es: 'Intento descarga' }, type: 'select', options: [{ v: 1, l: { en: '1st shock', es: '1ª descarga' } }, { v: 2, l: { en: '2nd+ shock', es: '2ª+ descarga' } }], default: 1 },
      { id: 'pediatric', label: { en: 'Pediatric (<8 yr or <25 kg)', es: 'Pediátrico' }, type: 'toggle', default: false }
    ]
  },
  'unit-converter': {
    formula: 'Unit conversion',
    inputs: [
      { id: 'value', label: { en: 'Value', es: 'Valor' }, type: 'number', default: 70 },
      { id: 'from', label: { en: 'From', es: 'De' }, type: 'select', options: [
        { v: 'kg', l: { en: 'kg', es: 'kg' } }, { v: 'lb', l: { en: 'lb', es: 'lb' } },
        { v: 'cm', l: { en: 'cm', es: 'cm' } }, { v: 'in', l: { en: 'in', es: 'in' } },
        { v: 'mg', l: { en: 'mg', es: 'mg' } }, { v: 'mcg', l: { en: 'mcg', es: 'mcg' } }
      ], default: 'kg' },
      { id: 'to', label: { en: 'To', es: 'A' }, type: 'select', options: [
        { v: 'kg', l: { en: 'kg', es: 'kg' } }, { v: 'lb', l: { en: 'lb', es: 'lb' } },
        { v: 'cm', l: { en: 'cm', es: 'cm' } }, { v: 'in', l: { en: 'in', es: 'in' } },
        { v: 'mg', l: { en: 'mg', es: 'mg' } }, { v: 'mcg', l: { en: 'mcg', es: 'mcg' } }
      ], default: 'lb' }
    ]
  },
  'opioid-conversion': {
    formula: 'MME conversion to morphine equivalents',
    inputs: [
      { id: 'drug', label: { en: 'Opioid', es: 'Opioide' }, type: 'select', options: [
        { v: 'morphine', l: { en: 'Morphine', es: 'Morfina' } },
        { v: 'oxycodone', l: { en: 'Oxycodone', es: 'Oxicodona' } },
        { v: 'hydrocodone', l: { en: 'Hydrocodone', es: 'Hidrocodona' } },
        { v: 'hydromorphone', l: { en: 'Hydromorphone', es: 'Hidromorfona' } },
        { v: 'fentanyl', l: { en: 'Fentanyl patch (mcg/hr)', es: 'Parche fentanilo' } },
        { v: 'codeine', l: { en: 'Codeine', es: 'Codeína' } },
        { v: 'tramadol', l: { en: 'Tramadol', es: 'Tramadol' } }
      ], default: 'oxycodone' },
      { id: 'dose', label: { en: 'Daily dose', es: 'Dosis diaria' }, type: 'number', unit: 'mg/day', default: 20 }
    ]
  },
  'calorie-requirement': {
    formula: 'Mifflin-St Jeor BMR × activity factor',
    inputs: [
      { id: 'weight', label: { en: 'Weight', es: 'Peso' }, type: 'number', unit: 'kg', default: 70 },
      { id: 'height', label: { en: 'Height', es: 'Altura' }, type: 'number', unit: 'cm', default: 170 },
      { id: 'age', label: { en: 'Age', es: 'Edad' }, type: 'number', unit: 'years', default: 35 },
      { id: 'sex', label: { en: 'Sex', es: 'Sexo' }, type: 'select', options: [{ v: 'male', l: { en: 'Male', es: 'Masculino' } }, { v: 'female', l: { en: 'Female', es: 'Femenino' } }], default: 'male' },
      { id: 'activity', label: { en: 'Activity level', es: 'Nivel actividad' }, type: 'select', options: [
        { v: 1.2, l: { en: 'Sedentary', es: 'Sedentario' } },
        { v: 1.375, l: { en: 'Light', es: 'Ligero' } },
        { v: 1.55, l: { en: 'Moderate', es: 'Moderado' } },
        { v: 1.725, l: { en: 'Active', es: 'Activo' } },
        { v: 1.9, l: { en: 'Very active', es: 'Muy activo' } }
      ], default: 1.375 }
    ]
  }
};

// Aliases share schemas
['student-bmi', 'diet-bmi'].forEach(id => { CalcSchemas[id] = CalcSchemas.bmi; });
['student-bsa'].forEach(id => { CalcSchemas[id] = CalcSchemas.bsa; });
['student-maintenance', 'ped-maintenance-fluid'].forEach(id => { CalcSchemas[id] = CalcSchemas['maintenance-fluid']; });
['lab-corrected-calcium'].forEach(id => { CalcSchemas[id] = CalcSchemas['corrected-calcium']; });
['lab-anion-gap'].forEach(id => { CalcSchemas[id] = CalcSchemas['anion-gap']; });
['medication-dose', 'ped-weight-dose'].forEach(id => { CalcSchemas[id] = CalcSchemas['weight-based-dose']; });
['iv-infusion', 'infusion-rate'].forEach(id => { CalcSchemas[id] = CalcSchemas['iv-flow-rate']; });
['diet-ibw'].forEach(id => { CalcSchemas[id] = CalcSchemas.ibw; });
