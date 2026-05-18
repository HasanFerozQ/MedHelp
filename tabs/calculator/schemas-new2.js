/** MediHelp — New Clinical Calculator Schemas (Batch 2) */
(function() {
  'use strict';

  Object.assign(window.CalcSchemas = window.CalcSchemas || {}, {

    // ── Cardiology ──
    'wells-dvt': {
      formula: 'Wells Score for DVT',
      inputs: [
        { id: 'cancer', label: { en: 'Active cancer (treatment within 6mo or palliative)', es: 'Cáncer activo' }, type: 'toggle' },
        { id: 'paralysis', label: { en: 'Paralysis, paresis, or recent plaster immobilization of lower extremities', es: 'Parálisis, paresia o inmovilización' }, type: 'toggle' },
        { id: 'bedridden', label: { en: 'Recently bedridden for >3 days or major surgery within 12 weeks', es: 'Encamamiento >3 días o cirugía mayor' }, type: 'toggle' },
        { id: 'tenderness', label: { en: 'Localized tenderness along deep venous system', es: 'Dolor a lo largo del sistema venoso profundo' }, type: 'toggle' },
        { id: 'swelling', label: { en: 'Entire leg swollen', es: 'Hinchazón de toda la pierna' }, type: 'toggle' },
        { id: 'calf', label: { en: 'Calf swelling >3 cm compared to asymptomatic leg', es: 'Hinchazón de pantorrilla >3 cm' }, type: 'toggle' },
        { id: 'edema', label: { en: 'Pitting edema (greater in symptomatic leg)', es: 'Edema con fóvea' }, type: 'toggle' },
        { id: 'collateral', label: { en: 'Non-varicose collateral superficial veins', es: 'Venas superficiales colaterales' }, type: 'toggle' },
        { id: 'hx', label: { en: 'Previously documented DVT', es: 'Antecedentes de TVP' }, type: 'toggle' },
        { id: 'alternative', label: { en: 'Alternative diagnosis at least as likely as DVT', es: 'Diagnóstico alternativo probable' }, type: 'toggle' }
      ]
    },
    'rcri': {
      formula: 'Revised Cardiac Risk Index',
      inputs: [
        { id: 'surgery', label: { en: 'High-risk surgery (intraperitoneal, intrathoracic, or suprainguinal vascular)', es: 'Cirugía de alto riesgo' }, type: 'toggle' },
        { id: 'ischemic', label: { en: 'History of ischemic heart disease', es: 'Cardiopatía isquémica' }, type: 'toggle' },
        { id: 'chf', label: { en: 'History of congestive heart failure', es: 'Insuficiencia cardíaca congestiva' }, type: 'toggle' },
        { id: 'cerebrovascular', label: { en: 'History of cerebrovascular disease', es: 'Enfermedad cerebrovascular' }, type: 'toggle' },
        { id: 'dm', label: { en: 'Preoperative treatment with insulin', es: 'Diabetes insulinodependiente' }, type: 'toggle' },
        { id: 'cr', label: { en: 'Preoperative creatinine >2.0 mg/dL', es: 'Creatinina >2.0 mg/dL' }, type: 'toggle' }
      ]
    },

    // ── Emergency Medicine ──
    'perc-rule': {
      formula: 'Pulmonary Embolism Rule-out Criteria',
      inputs: [
        { id: 'age', label: { en: 'Age ≥ 50', es: 'Edad ≥ 50' }, type: 'toggle' },
        { id: 'hr', label: { en: 'Heart rate ≥ 100', es: 'Frecuencia cardíaca ≥ 100' }, type: 'toggle' },
        { id: 'spo2', label: { en: 'O2 saturation < 95% on room air', es: 'Saturación O2 < 95%' }, type: 'toggle' },
        { id: 'dvt_hx', label: { en: 'Prior history of DVT or PE', es: 'Historia de TVP o TEP' }, type: 'toggle' },
        { id: 'trauma', label: { en: 'Recent trauma or surgery (within 4 weeks)', es: 'Trauma o cirugía reciente' }, type: 'toggle' },
        { id: 'hemoptysis', label: { en: 'Hemoptysis', es: 'Hemoptisis' }, type: 'toggle' },
        { id: 'hormone', label: { en: 'Exogenous estrogen use', es: 'Uso de estrógenos' }, type: 'toggle' },
        { id: 'leg', label: { en: 'Unilateral leg swelling', es: 'Hinchazón unilateral de pierna' }, type: 'toggle' }
      ]
    },
    'alvarado-score': {
      formula: 'Alvarado Score for Appendicitis (MANTRELS)',
      inputs: [
        { id: 'migratory', label: { en: 'Migratory right iliac fossa pain', es: 'Dolor migratorio fosa ilíaca derecha' }, type: 'toggle' },
        { id: 'anorexia', label: { en: 'Anorexia', es: 'Anorexia' }, type: 'toggle' },
        { id: 'nausea', label: { en: 'Nausea or vomiting', es: 'Náuseas o vómitos' }, type: 'toggle' },
        { id: 'tenderness', label: { en: 'Right iliac fossa tenderness', es: 'Sensibilidad fosa ilíaca derecha' }, type: 'toggle' }, // 2 points
        { id: 'rebound', label: { en: 'Rebound tenderness', es: 'Dolor de rebote' }, type: 'toggle' },
        { id: 'temp', label: { en: 'Elevated temperature (≥ 37.3°C)', es: 'Temperatura elevada' }, type: 'toggle' },
        { id: 'leukocytosis', label: { en: 'Leukocytosis (≥ 10k)', es: 'Leucocitosis' }, type: 'toggle' }, // 2 points
        { id: 'shift', label: { en: 'Shift to the left of neutrophils', es: 'Desviación a la izquierda' }, type: 'toggle' }
      ]
    },
    'canadian-ct-head': {
      formula: 'Canadian CT Head Rule (Adults)',
      inputs: [
        { id: 'gcs', label: { en: 'GCS < 15 at 2 hrs post-injury', es: 'GCS < 15 a las 2 hrs' }, type: 'toggle' },
        { id: 'fracture', label: { en: 'Suspected open or depressed skull fracture', es: 'Sospecha fractura cráneo' }, type: 'toggle' },
        { id: 'basilar', label: { en: 'Any sign of basilar skull fracture', es: 'Signo fractura base cráneo' }, type: 'toggle' },
        { id: 'vomiting', label: { en: '≥ 2 episodes of vomiting', es: '≥ 2 episodios de vómitos' }, type: 'toggle' },
        { id: 'age', label: { en: 'Age ≥ 65 years', es: 'Edad ≥ 65 años' }, type: 'toggle' },
        { id: 'amnesia', label: { en: 'Amnesia before impact ≥ 30 min', es: 'Amnesia ≥ 30 min' }, type: 'toggle' },
        { id: 'mechanism', label: { en: 'Dangerous mechanism', es: 'Mecanismo peligroso' }, type: 'toggle' }
      ]
    },
    'glasgow-blatchford': {
      formula: 'Glasgow-Blatchford Bleeding Score (GBS)',
      inputs: [
        { id: 'bun', label: { en: 'BUN (mg/dL)', es: 'BUN (mg/dL)' }, type: 'number', default: 18 },
        { id: 'hb', label: { en: 'Hemoglobin (g/dL)', es: 'Hemoglobina (g/dL)' }, type: 'number', default: 14 },
        { id: 'sex', label: { en: 'Sex', es: 'Sexo' }, type: 'select', options: [{v:'male', l:{en:'Male', es:'Masculino'}}, {v:'female', l:{en:'Female', es:'Femenino'}}], default: 'male' },
        { id: 'sbp', label: { en: 'Systolic BP (mmHg)', es: 'PAS (mmHg)' }, type: 'number', default: 120 },
        { id: 'hr', label: { en: 'Heart Rate ≥ 100', es: 'FC ≥ 100' }, type: 'toggle' },
        { id: 'melena', label: { en: 'Melena', es: 'Melena' }, type: 'toggle' },
        { id: 'syncope', label: { en: 'Syncope', es: 'Síncope' }, type: 'toggle' },
        { id: 'hepatic', label: { en: 'Hepatic disease', es: 'Enfermedad hepática' }, type: 'toggle' },
        { id: 'hf', label: { en: 'Cardiac failure', es: 'Insuficiencia cardíaca' }, type: 'toggle' }
      ]
    },
    'lrinec-score': {
      formula: 'Laboratory Risk Indicator for Necrotizing Fasciitis',
      inputs: [
        { id: 'crp', label: { en: 'CRP (mg/L)', es: 'PCR (mg/L)' }, type: 'number', default: 10 },
        { id: 'wbc', label: { en: 'WBC (per mm³)', es: 'Leucocitos (por mm³)' }, type: 'number', default: 8000 },
        { id: 'hb', label: { en: 'Hemoglobin (g/dL)', es: 'Hemoglobina (g/dL)' }, type: 'number', default: 14 },
        { id: 'na', label: { en: 'Sodium (mmol/L)', es: 'Sodio (mmol/L)' }, type: 'number', default: 140 },
        { id: 'cr', label: { en: 'Creatinine (mg/dL)', es: 'Creatinina (mg/dL)' }, type: 'number', unitGroup: 'creatinine', default: 1.0, step: 0.1 },
        { id: 'glucose', label: { en: 'Glucose (mg/dL)', es: 'Glucosa (mg/dL)' }, type: 'number', unitGroup: 'glucose', default: 100 }
      ]
    },

    // ── Neurology ──
    'nihss': {
      formula: 'NIH Stroke Scale',
      inputs: [
        { id: 'loc', label: { en: '1a. Level of Consciousness', es: '1a. Nivel de conciencia' }, type: 'select', options: [
          {v:'0', l:{en:'0 - Alert', es:'0 - Alerta'}}, {v:'1', l:{en:'1 - Not alert, but arousable', es:'1 - Obnubilado'}}, {v:'2', l:{en:'2 - Not alert, requires repeated stimulation', es:'2 - Estuporoso'}}, {v:'3', l:{en:'3 - Unresponsive', es:'3 - Coma'}}
        ], default: '0' },
        { id: 'loc_q', label: { en: '1b. LOC Questions', es: '1b. Preguntas de conciencia' }, type: 'select', options: [
          {v:'0', l:{en:'0 - Answers both correctly', es:'0 - Responde ambas bien'}}, {v:'1', l:{en:'1 - Answers one correctly', es:'1 - Responde una bien'}}, {v:'2', l:{en:'2 - Answers neither correctly', es:'2 - No responde bien'}}
        ], default: '0' },
        { id: 'loc_cmd', label: { en: '1c. LOC Commands', es: '1c. Órdenes de conciencia' }, type: 'select', options: [
          {v:'0', l:{en:'0 - Performs both tasks', es:'0 - Realiza ambas tareas'}}, {v:'1', l:{en:'1 - Performs one task', es:'1 - Realiza una tarea'}}, {v:'2', l:{en:'2 - Performs neither task', es:'2 - No realiza tareas'}}
        ], default: '0' },
        { id: 'gaze', label: { en: '2. Best Gaze', es: '2. Mirada conjugada' }, type: 'select', options: [
          {v:'0', l:{en:'0 - Normal', es:'0 - Normal'}}, {v:'1', l:{en:'1 - Partial gaze palsy', es:'1 - Parálisis parcial'}}, {v:'2', l:{en:'2 - Forced deviation', es:'2 - Desviación forzada'}}
        ], default: '0' },
        { id: 'visual', label: { en: '3. Visual', es: '3. Campos visuales' }, type: 'select', options: [
          {v:'0', l:{en:'0 - No visual loss', es:'0 - Sin pérdida visual'}}, {v:'1', l:{en:'1 - Partial hemianopia', es:'1 - Hemianopsia parcial'}}, {v:'2', l:{en:'2 - Complete hemianopia', es:'2 - Hemianopsia completa'}}, {v:'3', l:{en:'3 - Bilateral hemianopia', es:'3 - Hemianopsia bilateral'}}
        ], default: '0' },
        { id: 'facial', label: { en: '4. Facial Palsy', es: '4. Parálisis facial' }, type: 'select', options: [
          {v:'0', l:{en:'0 - Normal', es:'0 - Normal'}}, {v:'1', l:{en:'1 - Minor paralysis', es:'1 - Parálisis leve'}}, {v:'2', l:{en:'2 - Partial paralysis', es:'2 - Parálisis parcial'}}, {v:'3', l:{en:'3 - Complete paralysis', es:'3 - Parálisis completa'}}
        ], default: '0' },
        { id: 'arm_l', label: { en: '5a. Motor Left Arm', es: '5a. Motor brazo izquierdo' }, type: 'select', options: [
          {v:'0', l:{en:'0 - No drift', es:'0 - Sin caída'}}, {v:'1', l:{en:'1 - Drift', es:'1 - Caída'}}, {v:'2', l:{en:'2 - Some effort against gravity', es:'2 - Algo de esfuerzo'}}, {v:'3', l:{en:'3 - No effort against gravity', es:'3 - Sin esfuerzo contra gravedad'}}, {v:'4', l:{en:'4 - No movement', es:'4 - Sin movimiento'}}
        ], default: '0' },
        { id: 'arm_r', label: { en: '5b. Motor Right Arm', es: '5b. Motor brazo derecho' }, type: 'select', options: [
          {v:'0', l:{en:'0 - No drift', es:'0 - Sin caída'}}, {v:'1', l:{en:'1 - Drift', es:'1 - Caída'}}, {v:'2', l:{en:'2 - Some effort against gravity', es:'2 - Algo de esfuerzo'}}, {v:'3', l:{en:'3 - No effort against gravity', es:'3 - Sin esfuerzo contra gravedad'}}, {v:'4', l:{en:'4 - No movement', es:'4 - Sin movimiento'}}
        ], default: '0' },
        { id: 'leg_l', label: { en: '6a. Motor Left Leg', es: '6a. Motor pierna izquierda' }, type: 'select', options: [
          {v:'0', l:{en:'0 - No drift', es:'0 - Sin caída'}}, {v:'1', l:{en:'1 - Drift', es:'1 - Caída'}}, {v:'2', l:{en:'2 - Some effort against gravity', es:'2 - Algo de esfuerzo'}}, {v:'3', l:{en:'3 - No effort against gravity', es:'3 - Sin esfuerzo contra gravedad'}}, {v:'4', l:{en:'4 - No movement', es:'4 - Sin movimiento'}}
        ], default: '0' },
        { id: 'leg_r', label: { en: '6b. Motor Right Leg', es: '6b. Motor pierna derecha' }, type: 'select', options: [
          {v:'0', l:{en:'0 - No drift', es:'0 - Sin caída'}}, {v:'1', l:{en:'1 - Drift', es:'1 - Caída'}}, {v:'2', l:{en:'2 - Some effort against gravity', es:'2 - Algo de esfuerzo'}}, {v:'3', l:{en:'3 - No effort against gravity', es:'3 - Sin esfuerzo contra gravedad'}}, {v:'4', l:{en:'4 - No movement', es:'4 - Sin movimiento'}}
        ], default: '0' },
        { id: 'ataxia', label: { en: '7. Limb Ataxia', es: '7. Ataxia de extremidades' }, type: 'select', options: [
          {v:'0', l:{en:'0 - Absent', es:'0 - Ausente'}}, {v:'1', l:{en:'1 - Present in one limb', es:'1 - Presente en una extremidad'}}, {v:'2', l:{en:'2 - Present in two limbs', es:'2 - Presente en dos extremidades'}}
        ], default: '0' },
        { id: 'sensory', label: { en: '8. Sensory', es: '8. Sensibilidad' }, type: 'select', options: [
          {v:'0', l:{en:'0 - Normal', es:'0 - Normal'}}, {v:'1', l:{en:'1 - Mild-to-moderate loss', es:'1 - Pérdida leve a moderada'}}, {v:'2', l:{en:'2 - Severe-to-total loss', es:'2 - Pérdida grave a total'}}
        ], default: '0' },
        { id: 'language', label: { en: '9. Best Language', es: '9. Lenguaje' }, type: 'select', options: [
          {v:'0', l:{en:'0 - No aphasia', es:'0 - Sin afasia'}}, {v:'1', l:{en:'1 - Mild-to-moderate aphasia', es:'1 - Afasia leve a moderada'}}, {v:'2', l:{en:'2 - Severe aphasia', es:'2 - Afasia grave'}}, {v:'3', l:{en:'3 - Mute, global aphasia', es:'3 - Mudo, afasia global'}}
        ], default: '0' },
        { id: 'dysarthria', label: { en: '10. Dysarthria', es: '10. Disartria' }, type: 'select', options: [
          {v:'0', l:{en:'0 - Normal', es:'0 - Normal'}}, {v:'1', l:{en:'1 - Mild-to-moderate', es:'1 - Leve a moderada'}}, {v:'2', l:{en:'2 - Severe', es:'2 - Grave'}}
        ], default: '0' },
        { id: 'extinction', label: { en: '11. Extinction and Inattention', es: '11. Extinción e inatención' }, type: 'select', options: [
          {v:'0', l:{en:'0 - No abnormality', es:'0 - Normal'}}, {v:'1', l:{en:'1 - Visual, tactile, auditory, spatial, or personal inattention', es:'1 - Inatención parcial'}}, {v:'2', l:{en:'2 - Profound hemi-inattention', es:'2 - Inatención hemi corporal profunda'}}
        ], default: '0' }
      ]
    },
    'abcd2-score': {
      formula: 'ABCD² Score',
      inputs: [
        { id: 'age', label: { en: 'Age ≥ 60 years', es: 'Edad ≥ 60 años' }, type: 'toggle' },
        { id: 'bp', label: { en: 'Blood pressure ≥ 140/90 mmHg', es: 'Presión arterial ≥ 140/90 mmHg' }, type: 'toggle' },
        { id: 'clinical', label: { en: 'Clinical features', es: 'Características clínicas' }, type: 'select', options: [
          {v:'0', l:{en:'Other symptoms', es:'Otros síntomas'}},
          {v:'1', l:{en:'Speech disturbance without weakness', es:'Alteración del habla sin debilidad'}},
          {v:'2', l:{en:'Unilateral weakness', es:'Debilidad unilateral'}}
        ], default: '0' },
        { id: 'duration', label: { en: 'Symptom duration', es: 'Duración de síntomas' }, type: 'select', options: [
          {v:'0', l:{en:'< 10 minutes', es:'< 10 minutos'}},
          {v:'1', l:{en:'10 - 59 minutes', es:'10 - 59 minutos'}},
          {v:'2', l:{en:'≥ 60 minutes', es:'≥ 60 minutos'}}
        ], default: '0' },
        { id: 'dm', label: { en: 'Diabetes', es: 'Diabetes' }, type: 'toggle' }
      ]
    },
    'four-score': {
      formula: 'FOUR Score',
      inputs: [
        { id: 'eye', label: { en: 'Eye Response', es: 'Respuesta ocular' }, type: 'select', options: [
          {v:'4', l:{en:'4 - Eyelids open or opened, tracking, or blinking to command', es:'4 - Párpados abiertos, sigue objetos'}},
          {v:'3', l:{en:'3 - Eyelids open but not tracking', es:'3 - Párpados abiertos, no sigue objetos'}},
          {v:'2', l:{en:'2 - Eyelids closed but open to loud voice', es:'2 - Párpados cerrados, abre al hablar'}},
          {v:'1', l:{en:'1 - Eyelids closed but open to pain', es:'1 - Párpados cerrados, abre al dolor'}},
          {v:'0', l:{en:'0 - Eyelids remain closed with pain', es:'0 - Párpados permanecen cerrados'}}
        ], default: '4' },
        { id: 'motor', label: { en: 'Motor Response', es: 'Respuesta motora' }, type: 'select', options: [
          {v:'4', l:{en:'4 - Thumbs-up, fist, or peace sign', es:'4 - Pulgar arriba, puño, o signo de paz'}},
          {v:'3', l:{en:'3 - Localizing to pain', es:'3 - Localiza el dolor'}},
          {v:'2', l:{en:'2 - Flexion response to pain', es:'2 - Respuesta flexora al dolor'}},
          {v:'1', l:{en:'1 - Extension response to pain', es:'1 - Respuesta extensora al dolor'}},
          {v:'0', l:{en:'0 - No response to pain or generalized myoclonus status', es:'0 - Sin respuesta al dolor o mioclonías'}}
        ], default: '4' },
        { id: 'brainstem', label: { en: 'Brainstem Reflexes', es: 'Reflejos del tronco encefálico' }, type: 'select', options: [
          {v:'4', l:{en:'4 - Pupil and corneal reflexes present', es:'4 - Reflejos pupilar y corneal presentes'}},
          {v:'3', l:{en:'3 - One pupil wide and fixed', es:'3 - Una pupila dilatada y fija'}},
          {v:'2', l:{en:'2 - Pupil or corneal reflexes absent', es:'2 - Ausencia de reflejo pupilar o corneal'}},
          {v:'1', l:{en:'1 - Pupil and corneal reflexes absent', es:'1 - Ausencia de reflejos pupilar y corneal'}},
          {v:'0', l:{en:'0 - Absent pupil, corneal, and cough reflex', es:'0 - Ausencia de reflejos pupilar, corneal y tos'}}
        ], default: '4' },
        { id: 'respiration', label: { en: 'Respiration', es: 'Respiración' }, type: 'select', options: [
          {v:'4', l:{en:'4 - Not intubated, regular breathing pattern', es:'4 - No intubado, patrón regular'}},
          {v:'3', l:{en:'3 - Not intubated, Cheyne-Stokes breathing pattern', es:'3 - No intubado, patrón Cheyne-Stokes'}},
          {v:'2', l:{en:'2 - Not intubated, irregular breathing', es:'2 - No intubado, respiración irregular'}},
          {v:'1', l:{en:'1 - Breathes above ventilator rate', es:'1 - Respira por encima del ventilador'}},
          {v:'0', l:{en:'0 - Breathes at ventilator rate or apnea', es:'0 - Respira a la frecuencia del ventilador o apnea'}}
        ], default: '4' }
      ]
    },

    // ── Pulmonary / ICU ──
    'rox-index': {
      formula: 'ROX = (SpO2 / FiO2) / RR',
      inputs: [
        { id: 'spo2', label: { en: 'SpO₂ (%)', es: 'SpO₂ (%)' }, type: 'number', default: 95, min: 50, max: 100 },
        { id: 'fio2', label: { en: 'FiO₂ (%)', es: 'FiO₂ (%)' }, type: 'number', default: 50, min: 21, max: 100 },
        { id: 'rr', label: { en: 'Respiratory Rate (breaths/min)', es: 'Frecuencia respiratoria (rpm)' }, type: 'number', default: 20 }
      ]
    },
    'rsbi': {
      formula: 'RSBI = RR / Tidal Volume (L)',
      inputs: [
        { id: 'rr', label: { en: 'Respiratory Rate (breaths/min)', es: 'Frecuencia respiratoria (rpm)' }, type: 'number', default: 20 },
        { id: 'vt', label: { en: 'Tidal Volume (mL)', es: 'Volumen corriente (mL)' }, type: 'number', default: 500 }
      ]
    },

    // ── Infectious Disease ──
    'centor-score': {
      formula: 'Modified Centor Score (McIsaac)',
      inputs: [
        { id: 'fever', label: { en: 'History of fever (>38°C / 100.4°F)', es: 'Fiebre (>38°C)' }, type: 'toggle' },
        { id: 'exudate', label: { en: 'Tonsillar exudate or erythema', es: 'Exudado o eritema amigdalar' }, type: 'toggle' },
        { id: 'nodes', label: { en: 'Tender anterior cervical adenopathy', es: 'Adenopatía cervical anterior dolorosa' }, type: 'toggle' },
        { id: 'cough', label: { en: 'Absence of cough', es: 'Ausencia de tos' }, type: 'toggle' },
        { id: 'age', label: { en: 'Age', es: 'Edad' }, type: 'select', options: [
          {v:'1', l:{en:'3-14 years', es:'3-14 años'}},
          {v:'0', l:{en:'15-44 years', es:'15-44 años'}},
          {v:'-1', l:{en:'≥ 45 years', es:'≥ 45 años'}}
        ], default: '0' }
      ]
    },

    // ── Renal / Acid-Base ──
    'fena-calculator': {
      formula: 'FENa = (UNa × SCr) / (SNa × UCr) × 100',
      inputs: [
        { id: 'una', label: { en: 'Urine Sodium (mEq/L)', es: 'Sodio en orina (mEq/L)' }, type: 'number', default: 20 },
        { id: 'sna', label: { en: 'Serum Sodium (mEq/L)', es: 'Sodio sérico (mEq/L)' }, type: 'number', default: 140 },
        { id: 'ucr', label: { en: 'Urine Creatinine', es: 'Creatinina en orina' }, type: 'number', unitGroup: 'creatinine', default: 100 },
        { id: 'scr', label: { en: 'Serum Creatinine', es: 'Creatinina sérica' }, type: 'number', unitGroup: 'creatinine', default: 1.0, step: 0.1 }
      ]
    },
    'winters-formula': {
      formula: 'Expected pCO2 = (1.5 × HCO3) + 8 ± 2',
      inputs: [
        { id: 'hco3', label: { en: 'Serum HCO₃ (mEq/L)', es: 'HCO₃ sérico (mEq/L)' }, type: 'number', default: 15 },
        { id: 'pco2', label: { en: 'Measured pCO₂ (mmHg)', es: 'pCO₂ medido (mmHg)' }, type: 'number', default: 30 }
      ]
    },
    'delta-gap': {
      formula: 'Delta Gap = (AG - 12) + HCO3',
      inputs: [
        { id: 'na', label: { en: 'Sodium (mEq/L)', es: 'Sodio (mEq/L)' }, type: 'number', default: 140 },
        { id: 'cl', label: { en: 'Chloride (mEq/L)', es: 'Cloruro (mEq/L)' }, type: 'number', default: 104 },
        { id: 'hco3', label: { en: 'HCO₃ (mEq/L)', es: 'HCO₃ (mEq/L)' }, type: 'number', default: 24 }
      ]
    },
    'free-water-deficit': {
      formula: 'Deficit = TBW × ((Na / 140) - 1)',
      inputs: [
        { id: 'sex', label: { en: 'Sex', es: 'Sexo' }, type: 'select', options: [{v:'male', l:{en:'Male', es:'Masculino'}}, {v:'female', l:{en:'Female', es:'Femenino'}}], default: 'male' },
        { id: 'age', label: { en: 'Age', es: 'Edad' }, type: 'number', default: 60 },
        { id: 'weight', label: { en: 'Weight', es: 'Peso' }, type: 'number', unitGroup: 'weight', default: 70 },
        { id: 'na', label: { en: 'Serum Sodium (mEq/L)', es: 'Sodio sérico (mEq/L)' }, type: 'number', default: 155 }
      ]
    },

    // ── OB/GYN ──
    'ovulation-calculator': {
      formula: 'Ovulation Date',
      inputs: [
        { id: 'lmp', label: { en: 'First Day of Last Period', es: 'Primer día de la última regla' }, type: 'date', default: new Date().toISOString().split('T')[0] },
        { id: 'cycle', label: { en: 'Average Cycle Length (days)', es: 'Duración media del ciclo (días)' }, type: 'number', default: 28, min: 20, max: 45 }
      ]
    },

    // ── Pharmacy ──
    'heparin-dosing': {
      formula: 'Weight-based Heparin Protocol',
      inputs: [
        { id: 'weight', label: { en: 'Weight', es: 'Peso' }, type: 'number', unitGroup: 'weight', default: 70 },
        { id: 'indication', label: { en: 'Indication', es: 'Indicación' }, type: 'select', options: [
          {v:'vte', l:{en:'DVT/PE (VTE)', es:'TVP/TEP'}},
          {v:'acs', l:{en:'ACS/STEMI', es:'SCA/IAMCEST'}}
        ], default: 'vte' }
      ]
    }

  });
})();
