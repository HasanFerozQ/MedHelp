/** Additional calculator input schemas */
(function() {
  const S = CalcSchemas;
  Object.assign(S, {
    news2: {
      formula: 'NEWS2 — UK National Early Warning Score',
      inputs: [
        { id: 'rr', label: { en: 'Resp rate', es: 'FR' }, type: 'number', unit: '/min', default: 16 },
        { id: 'spo2', label: { en: 'SpO₂', es: 'SpO₂' }, type: 'number', unit: '%', default: 98 },
        { id: 'sbp', label: { en: 'Systolic BP', es: 'TAS' }, type: 'number', unit: 'mmHg', default: 120 },
        { id: 'hr', label: { en: 'Heart rate', es: 'FC' }, type: 'number', unit: 'bpm', default: 80 },
        { id: 'temp', label: { en: 'Temperature', es: 'Temperatura' }, type: 'number', unit: '°C', default: 37, step: 0.1 },
        { id: 'oxygen', label: { en: 'Supplemental O₂', es: 'O₂ suplementario' }, type: 'toggle', default: false },
        { id: 'consciousness', label: { en: 'Consciousness', es: 'Consciencia' }, type: 'select', options: [{ v: 'alert', l: { en: 'Alert', es: 'Alerta' } }, { v: 'voice', l: { en: 'Responds to voice', es: 'Responde a voz' } }, { v: 'pain', l: { en: 'Responds to pain', es: 'Responde al dolor' } }, { v: 'unresponsive', l: { en: 'Unresponsive', es: 'No responde' } }], default: 'alert' }
      ]
    },
    sofa: {
      formula: 'SOFA — 6 organ systems (0–4 each)',
      inputs: [
        { id: 'pao2', label: { en: 'PaO₂', es: 'PaO₂' }, type: 'number', unit: 'mmHg', default: 90 },
        { id: 'fio2', label: { en: 'FiO₂', es: 'FiO₂' }, type: 'number', unit: '%', default: 40 },
        { id: 'platelets', label: { en: 'Platelets', es: 'Plaquetas' }, type: 'number', unit: '×10³/µL', default: 150 },
        { id: 'bilirubin', label: { en: 'Bilirubin', es: 'Bilirrubina' }, type: 'number', unit: 'mg/dL', default: 1.0, step: 0.1 },
        { id: 'map', label: { en: 'MAP', es: 'PAM' }, type: 'number', unit: 'mmHg', default: 80 },
        { id: 'vasopressors', label: { en: 'Vasopressor level', es: 'Nivel vasopresor' }, type: 'select', options: [{ v: 0, l: { en: 'None', es: 'Ninguno' } }, { v: 1, l: { en: 'Low dose', es: 'Dosis baja' } }, { v: 2, l: { en: 'High dose', es: 'Dosis alta' } }], default: 0 },
        { id: 'gcs', label: { en: 'GCS', es: 'GCS' }, type: 'number', default: 15, min: 3, max: 15 },
        { id: 'creatinine', label: { en: 'Creatinine', es: 'Creatinina' }, type: 'number', unit: 'mg/dL', default: 1.0, step: 0.1 }
      ]
    },
    osmolality: {
      formula: 'Osm = 2×Na + Glucose/18 + BUN/2.8',
      inputs: [
        { id: 'na', label: { en: 'Sodium', es: 'Sodio' }, type: 'number', unit: 'mEq/L', default: 140 },
        { id: 'glucose', label: { en: 'Glucose', es: 'Glucosa' }, type: 'number', unit: 'mg/dL', default: 100 },
        { id: 'bun', label: { en: 'BUN', es: 'BUN' }, type: 'number', unit: 'mg/dL', default: 15 }
      ]
    },
    qtc: {
      formula: 'QTc = QT / √(RR), RR = 60/HR',
      inputs: [
        { id: 'qt', label: { en: 'QT interval', es: 'Intervalo QT' }, type: 'number', unit: 'ms', default: 400 },
        { id: 'hr', label: { en: 'Heart rate', es: 'FC' }, type: 'number', unit: 'bpm', default: 75 }
      ]
    },
    'pf-ratio': {
      formula: 'P/F = PaO₂ / (FiO₂/100)',
      inputs: [
        { id: 'pao2', label: { en: 'PaO₂', es: 'PaO₂' }, type: 'number', unit: 'mmHg', default: 80 },
        { id: 'fio2', label: { en: 'FiO₂', es: 'FiO₂' }, type: 'number', unit: '%', default: 40 }
      ]
    },
    'iron-deficit': {
      formula: 'Iron (mg) = 0.544 × weight × (target Hb − current Hb)',
      inputs: [
        { id: 'weight', label: { en: 'Weight', es: 'Peso' }, type: 'number', unit: 'kg', default: 70 },
        { id: 'currentHb', label: { en: 'Current Hb', es: 'Hb actual' }, type: 'number', unit: 'g/dL', default: 8 },
        { id: 'targetHb', label: { en: 'Target Hb', es: 'Hb objetivo' }, type: 'number', unit: 'g/dL', default: 15 }
      ]
    },
    'potassium-correction': {
      formula: 'K⁺ deficit ≈ (target − current) × 0.4 × weight',
      inputs: [
        { id: 'weight', label: { en: 'Weight', es: 'Peso' }, type: 'number', unit: 'kg', default: 70 },
        { id: 'current', label: { en: 'Current K⁺', es: 'K⁺ actual' }, type: 'number', unit: 'mEq/L', default: 3.0, step: 0.1 },
        { id: 'target', label: { en: 'Target K⁺', es: 'K⁺ objetivo' }, type: 'number', unit: 'mEq/L', default: 4.0, step: 0.1 }
      ]
    },
    'bicarbonate-deficit': {
      formula: 'HCO₃⁻ deficit = 0.5 × weight × (24 − HCO₃⁻)',
      inputs: [
        { id: 'weight', label: { en: 'Weight', es: 'Peso' }, type: 'number', unit: 'kg', default: 70 },
        { id: 'hco3', label: { en: 'Current HCO₃⁻', es: 'HCO₃⁻ actual' }, type: 'number', unit: 'mEq/L', default: 16 }
      ]
    },
    'minute-ventilation': {
      formula: 'VE (L/min) = RR × Vt / 1000',
      inputs: [
        { id: 'rr', label: { en: 'Respiratory rate', es: 'FR' }, type: 'number', unit: '/min', default: 14 },
        { id: 'vt', label: { en: 'Tidal volume', es: 'Volumen corriente' }, type: 'number', unit: 'mL', default: 500 }
      ]
    },
    'medication-dilution': {
      formula: 'C₁V₁ = C₂V₂',
      inputs: [
        { id: 'c1', label: { en: 'Stock concentration', es: 'Concentración stock' }, type: 'number', unit: 'mg/mL', default: 100 },
        { id: 'v1', label: { en: 'Volume to use', es: 'Volumen a usar' }, type: 'number', unit: 'mL', default: 5 },
        { id: 'c2', label: { en: 'Target concentration', es: 'Concentración objetivo' }, type: 'number', unit: 'mg/mL', default: 10 }
      ]
    },
    reconstitution: {
      formula: 'Volume = Mass / Target concentration',
      inputs: [
        { id: 'mass', label: { en: 'Drug mass', es: 'Masa fármaco' }, type: 'number', unit: 'mg', default: 500 },
        { id: 'targetConc', label: { en: 'Target concentration', es: 'Concentración objetivo' }, type: 'number', unit: 'mg/mL', default: 50 }
      ]
    },
    'intake-output': {
      formula: 'Balance = Intake − Output',
      inputs: [
        { id: 'intake', label: { en: 'Total intake', es: 'Ingreso total' }, type: 'number', unit: 'mL', default: 2000 },
        { id: 'output', label: { en: 'Total output', es: 'Egreso total' }, type: 'number', unit: 'mL', default: 1800 }
      ]
    },
    edd: {
      formula: 'EDD = LMP + 280 days (Naegele)',
      inputs: [{ id: 'lmp', label: { en: 'Last menstrual period', es: 'FUM' }, type: 'date', default: '' }]
    },
    'bishop-score': {
      formula: 'Bishop score (0–13)',
      inputs: [
        { id: 'dilation', label: { en: 'Dilation (0–3)', es: 'Dilatación' }, type: 'number', default: 0, min: 0, max: 3 },
        { id: 'effacement', label: { en: 'Effacement (0–3)', es: 'Borrado' }, type: 'number', default: 0, min: 0, max: 3 },
        { id: 'station', label: { en: 'Station (0–3)', es: 'Estación' }, type: 'number', default: 0, min: 0, max: 3 },
        { id: 'consistency', label: { en: 'Consistency (0–2)', es: 'Consistencia' }, type: 'number', default: 0, min: 0, max: 2 },
        { id: 'position', label: { en: 'Position (0–2)', es: 'Posición' }, type: 'number', default: 0, min: 0, max: 2 }
      ]
    },
    'protein-requirement': {
      formula: 'Protein (g/day) = weight × g/kg',
      inputs: [
        { id: 'weight', label: { en: 'Weight', es: 'Peso' }, type: 'number', unit: 'kg', default: 70 },
        { id: 'gPerKg', label: { en: 'Protein g/kg', es: 'Proteína g/kg' }, type: 'number', unit: 'g/kg', default: 1.2, step: 0.1 }
      ]
    },
    'enteral-feeding': {
      formula: 'Rate = Daily volume / Hours',
      inputs: [
        { id: 'dailyVol', label: { en: 'Daily goal volume', es: 'Volumen diario objetivo' }, type: 'number', unit: 'mL', default: 1200 },
        { id: 'hours', label: { en: 'Feeding hours', es: 'Horas alimentación' }, type: 'number', unit: 'hr', default: 24 }
      ]
    },
    dehydration: {
      formula: 'Deficit = weight × % dehydration × 1000',
      inputs: [
        { id: 'weight', label: { en: 'Weight', es: 'Peso' }, type: 'number', unit: 'kg', default: 15 },
        { id: 'percent', label: { en: '% Dehydration', es: '% Deshidratación' }, type: 'number', unit: '%', default: 5, step: 0.5 }
      ]
    },
    'ped-bsa-dose': {
      formula: 'Dose = BSA × mg/m²',
      inputs: [
        { id: 'weight', label: { en: 'Weight', es: 'Peso' }, type: 'number', unit: 'kg', default: 20 },
        { id: 'height', label: { en: 'Height', es: 'Altura' }, type: 'number', unit: 'cm', default: 110 },
        { id: 'dosePerM2', label: { en: 'Dose per m²', es: 'Dosis por m²' }, type: 'number', unit: 'mg/m²', default: 50 }
      ]
    },
    'fluid-replacement': {
      formula: 'Volume = weight × mL/kg',
      inputs: [
        { id: 'weight', label: { en: 'Weight', es: 'Peso' }, type: 'number', unit: 'kg', default: 70 },
        { id: 'mlPerKg', label: { en: 'mL/kg', es: 'mL/kg' }, type: 'number', default: 10 }
      ]
    },
    'blood-loss': {
      formula: 'EBL = BV × (Hb₁ − Hb₂) / ((Hb₁ + Hb₂)/2)',
      inputs: [
        { id: 'preHb', label: { en: 'Pre-op Hb', es: 'Hb pre-op' }, type: 'number', unit: 'g/dL', default: 14 },
        { id: 'postHb', label: { en: 'Post-op Hb', es: 'Hb post-op' }, type: 'number', unit: 'g/dL', default: 10 },
        { id: 'bloodVol', label: { en: 'Blood volume', es: 'Volumen sanguíneo' }, type: 'number', unit: 'mL', default: 5000, advanced: true }
      ]
    },
    timi: {
      formula: 'TIMI risk score (UA/NSTEMI)',
      inputs: [
        { id: 'age65', label: { en: 'Age ≥65', es: 'Edad ≥65' }, type: 'toggle', default: false },
        { id: 'risk3', label: { en: '≥3 CAD risk factors', es: '≥3 factores riesgo EC' }, type: 'toggle', default: false },
        { id: 'st', label: { en: 'Known CAD stenosis ≥50%', es: 'Estenosis EC ≥50%' }, type: 'toggle', default: false },
        { id: 'angina', label: { en: '≥2 angina in 24h', es: '≥2 angina en 24h' }, type: 'toggle', default: false },
        { id: 'asa', label: { en: 'ASA use in past 7 days', es: 'AAS últimos 7 días' }, type: 'toggle', default: false },
        { id: 'enzymes', label: { en: 'Elevated cardiac enzymes', es: 'Enzimas cardíacas elevadas' }, type: 'toggle', default: false }
      ]
    },
    'heart-score': {
      formula: 'HEART score (0–10)',
      inputs: [
        { id: 'history', label: { en: 'Highly suspicious history', es: 'Historia muy sospechosa' }, type: 'toggle', default: false },
        { id: 'ecg', label: { en: 'Significant ST deviation', es: 'Desviación ST significativa' }, type: 'toggle', default: false },
        { id: 'age', label: { en: 'Age ≥65', es: 'Edad ≥65' }, type: 'toggle', default: false },
        { id: 'risk', label: { en: '≥3 risk factors', es: '≥3 factores riesgo' }, type: 'toggle', default: false },
        { id: 'troponin', label: { en: 'Elevated troponin', es: 'Troponina elevada' }, type: 'toggle', default: false }
      ]
    },
    'dopamine-infusion': {
      formula: 'Rate (mL/hr) = (dose × weight × 60) / (conc × 1000)',
      inputs: [
        { id: 'dose', label: { en: 'Dose', es: 'Dosis' }, type: 'number', unit: 'mcg/kg/min', default: 5, step: 0.5 },
        { id: 'weight', label: { en: 'Weight', es: 'Peso' }, type: 'number', unit: 'kg', default: 70 },
        { id: 'concentration', label: { en: 'Bag concentration', es: 'Concentración bolsa' }, type: 'number', unit: 'mg/mL', default: 1.6, step: 0.1 }
      ]
    },
    'insulin-dose': {
      formula: 'Correction = (BG − target) / ISF',
      inputs: [
        { id: 'bg', label: { en: 'Blood glucose', es: 'Glucemia' }, type: 'number', unit: 'mg/dL', default: 250 },
        { id: 'target', label: { en: 'Target glucose', es: 'Glucosa objetivo' }, type: 'number', unit: 'mg/dL', default: 120 },
        { id: 'isf', label: { en: 'Insulin sensitivity factor', es: 'Factor sensibilidad' }, type: 'number', unit: 'mg/dL per unit', default: 50 }
      ]
    },
    transfusion: {
      formula: 'Units ≈ (target Hb − current Hb) × weight × 0.3 / 300',
      inputs: [
        { id: 'weight', label: { en: 'Weight', es: 'Peso' }, type: 'number', unit: 'kg', default: 70 },
        { id: 'currentHb', label: { en: 'Current Hb', es: 'Hb actual' }, type: 'number', unit: 'g/dL', default: 7 },
        { id: 'targetHb', label: { en: 'Target Hb', es: 'Hb objetivo' }, type: 'number', unit: 'g/dL', default: 10 }
      ]
    },
    'burn-tbsa': {
      formula: 'Rule of Nines — sum affected regions',
      inputs: [
        { id: 'head', label: { en: 'Head (9%)', es: 'Cabeza (9%)' }, type: 'select', options: [{ v: 0, l: { en: '0%', es: '0%' } }, { v: 9, l: { en: '9%', es: '9%' } }], default: 0 },
        { id: 'trunkFront', label: { en: 'Trunk front (18%)', es: 'Tronco anterior' }, type: 'select', options: [{ v: 0, l: { en: '0%', es: '0%' } }, { v: 18, l: { en: '18%', es: '18%' } }], default: 0 },
        { id: 'trunkBack', label: { en: 'Trunk back (18%)', es: 'Tronco posterior' }, type: 'select', options: [{ v: 0, l: { en: '0%', es: '0%' } }, { v: 18, l: { en: '18%', es: '18%' } }], default: 0 },
        { id: 'armL', label: { en: 'Left arm (9%)', es: 'Brazo izq' }, type: 'select', options: [{ v: 0, l: { en: '0%', es: '0%' } }, { v: 9, l: { en: '9%', es: '9%' } }], default: 0 },
        { id: 'armR', label: { en: 'Right arm (9%)', es: 'Brazo der' }, type: 'select', options: [{ v: 0, l: { en: '0%', es: '0%' } }, { v: 9, l: { en: '9%', es: '9%' } }], default: 0 },
        { id: 'legL', label: { en: 'Left leg (18%)', es: 'Pierna izq' }, type: 'select', options: [{ v: 0, l: { en: '0%', es: '0%' } }, { v: 18, l: { en: '18%', es: '18%' } }], default: 0 },
        { id: 'legR', label: { en: 'Right leg (18%)', es: 'Pierna der' }, type: 'select', options: [{ v: 0, l: { en: '0%', es: '0%' } }, { v: 18, l: { en: '18%', es: '18%' } }], default: 0 },
        { id: 'groin', label: { en: 'Perineum (1%)', es: 'Perineo (1%)' }, type: 'select', options: [{ v: 0, l: { en: '0%', es: '0%' } }, { v: 1, l: { en: '1%', es: '1%' } }], default: 0 }
      ]
    },
    rass: {
      formula: 'Richmond Agitation-Sedation Scale (+4 to −5)',
      inputs: [{
        id: 'score', label: { en: 'RASS score', es: 'Puntuación RASS' }, type: 'select',
        options: [
          { v: 4, l: { en: '+4 Combative', es: '+4 Combativo' } },
          { v: 3, l: { en: '+3 Very agitated', es: '+3 Muy agitado' } },
          { v: 2, l: { en: '+2 Agitated', es: '+2 Agitado' } },
          { v: 1, l: { en: '+1 Restless', es: '+1 Inquieto' } },
          { v: 0, l: { en: '0 Alert & calm', es: '0 Alerta y calmado' } },
          { v: -1, l: { en: '−1 Drowsy', es: '−1 Somnoliento' } },
          { v: -2, l: { en: '−2 Light sedation', es: '−2 Sedación ligera' } },
          { v: -3, l: { en: '−3 Moderate sedation', es: '−3 Sedación moderada' } },
          { v: -4, l: { en: '−4 Deep sedation', es: '−4 Sedación profunda' } },
          { v: -5, l: { en: '−5 Unarousable', es: '−5 No despertable' } }
        ], default: 0
      }]
    },
    mallampati: {
      formula: 'Mallampati airway classification (I–IV)',
      inputs: [{
        id: 'class', label: { en: 'Mallampati class', es: 'Clase Mallampati' }, type: 'select',
        options: [
          { v: 1, l: { en: 'Class I', es: 'Clase I' } }, { v: 2, l: { en: 'Class II', es: 'Clase II' } },
          { v: 3, l: { en: 'Class III', es: 'Clase III' } }, { v: 4, l: { en: 'Class IV', es: 'Clase IV' } }
        ], default: 1
      }]
    },
    'pain-scale': {
      formula: 'Numeric Rating Scale (NRS 0–10)',
      inputs: [{ id: 'score', label: { en: 'Pain score', es: 'Puntuación dolor' }, type: 'number', default: 0, min: 0, max: 10 }]
    },
    osmolarity: {
      formula: 'Osm = 2×Na + Glucose/18 + BUN/2.8',
      inputs: [
        { id: 'na', label: { en: 'Sodium', es: 'Sodio' }, type: 'number', unit: 'mEq/L', default: 140 },
        { id: 'glucose', label: { en: 'Glucose', es: 'Glucosa' }, type: 'number', unit: 'mg/dL', default: 100 },
        { id: 'bun', label: { en: 'BUN', es: 'BUN' }, type: 'number', unit: 'mg/dL', default: 15 }
      ]
    },
    'fio2-calculator': {
      formula: 'Estimated FiO₂ by delivery device',
      inputs: [{
        id: 'device', label: { en: 'Oxygen device', es: 'Dispositivo O₂' }, type: 'select',
        options: [
          { v: 'room', l: { en: 'Room air (21%)', es: 'Aire ambiente' } },
          { v: 'nc1', l: { en: 'Nasal cannula 1 L', es: 'Cánula nasal 1 L' } },
          { v: 'nc2', l: { en: 'Nasal cannula 2 L', es: 'Cánula nasal 2 L' } },
          { v: 'nc3', l: { en: 'Nasal cannula 3 L', es: 'Cánula nasal 3 L' } },
          { v: 'nc4', l: { en: 'Nasal cannula 4 L', es: 'Cánula nasal 4 L' } },
          { v: 'nc5', l: { en: 'Nasal cannula 5 L', es: 'Cánula nasal 5 L' } },
          { v: 'nc6', l: { en: 'Nasal cannula 6 L', es: 'Cánula nasal 6 L' } },
          { v: 'mask', l: { en: 'Simple face mask', es: 'Mascarilla simple' } },
          { v: 'nrb', l: { en: 'Non-rebreather', es: 'Mascarilla reservorio' } }
        ], default: 'nc2'
      }]
    },
    'oxygen-delivery': { formula: 'FiO₂ by device', inputs: [] },
    'aa-gradient': {
      formula: 'A-a = PAO₂ − PaO₂',
      inputs: [
        { id: 'fio2', label: { en: 'FiO₂', es: 'FiO₂' }, type: 'number', unit: '%', default: 21 },
        { id: 'paco2', label: { en: 'PaCO₂', es: 'PaCO₂' }, type: 'number', unit: 'mmHg', default: 40 },
        { id: 'pao2', label: { en: 'PaO₂', es: 'PaO₂' }, type: 'number', unit: 'mmHg', default: 90 }
      ]
    },
    'cardiac-output': {
      formula: 'CO (L/min) = HR × SV / 1000',
      inputs: [
        { id: 'hr', label: { en: 'Heart rate', es: 'FC' }, type: 'number', unit: 'bpm', default: 80 },
        { id: 'sv', label: { en: 'Stroke volume', es: 'Volumen sistólico' }, type: 'number', unit: 'mL', default: 70 }
      ]
    },
    'oxygen-requirement': {
      formula: 'Approximate FiO₂ for target SpO₂',
      inputs: [{ id: 'targetSpo2', label: { en: 'Target SpO₂', es: 'SpO₂ objetivo' }, type: 'number', unit: '%', default: 94 }]
    }
  });

  S['oxygen-delivery'] = S['fio2-calculator'];
  S['lab-osmolality'] = S.osmolality;
  S['lab-dilution'] = S['medication-dilution'];
  S['norepi-infusion'] = S['dopamine-infusion'];
  S['surg-blood-loss'] = S['blood-loss'];
  S['surg-fluid'] = S['fluid-replacement'];
  S['nutrition-req'] = S['calorie-requirement'];
})();
