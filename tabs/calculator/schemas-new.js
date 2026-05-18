/** MediHelp — New Clinical Calculator Schemas */
(function() {
  'use strict';
  const S = window.CalcSchemas;
  const tog = (id, en, es) => ({ id, label: { en, es }, type: 'toggle', default: false });
  const num = (id, en, es, unit, def, extra) => Object.assign({ id, label: { en, es }, type: 'number', unit, default: def }, extra || {});
  const sel = (id, en, es, opts, def) => ({ id, label: { en, es }, type: 'select', options: opts, default: def });

  // ── ER ──
  S['ottawa-rules'] = {
    formula: 'Ottawa Ankle/Knee/Foot Rules — evidence-based imaging decision aid',
    inputs: [
      sel('area', 'Area to assess', 'Área a evaluar', [
        { v: 'ankle', l: { en: 'Ankle', es: 'Tobillo' } },
        { v: 'foot', l: { en: 'Foot (midfoot zone)', es: 'Pie (zona metatarsiana)' } },
        { v: 'knee', l: { en: 'Knee', es: 'Rodilla' } }
      ], 'ankle'),
      tog('noWB', 'Unable to weight-bear 4 steps immediately and in ED', 'No puede caminar 4 pasos'),
      tog('lateralMalleolus', '[Ankle] Bone tenderness — posterior lateral malleolus', '[Tobillo] Sensibilidad maléolo lateral posterior'),
      tog('medialMalleolus', '[Ankle] Bone tenderness — posterior medial malleolus', '[Tobillo] Sensibilidad maléolo medial posterior'),
      tog('base5th', '[Foot] Bone tenderness — base 5th metatarsal', '[Pie] Sensibilidad base 5° metatarsiano'),
      tog('navicular', '[Foot] Bone tenderness — navicular', '[Pie] Sensibilidad escafoides'),
      tog('age55', '[Knee] Age ≥55', '[Rodilla] Edad ≥55'),
      tog('patellar', '[Knee] Isolated patellar tenderness (no bony tenderness elsewhere)', '[Rodilla] Solo sensibilidad patelar'),
      tog('fibular', '[Knee] Fibular head tenderness', '[Rodilla] Sensibilidad cabeza del peroné'),
      tog('cantFlex90', '[Knee] Cannot flex knee to 90°', '[Rodilla] No puede flexionar rodilla 90°')
    ]
  };

  S['pecarn-head-ct'] = {
    formula: 'PECARN Pediatric Head CT Decision Rule',
    inputs: [
      sel('ageGroup', 'Age group', 'Grupo de edad', [
        { v: 'lt2', l: { en: '<2 years', es: '<2 años' } },
        { v: 'gte2', l: { en: '2–18 years', es: '2–18 años' } }
      ], 'gte2'),
      tog('gcsLt15', 'GCS <15 on ED evaluation', 'GCS <15 en urgencias'),
      tog('palpableSkullFx', '[<2 yr] Palpable skull fracture', '[<2 años] Fractura de cráneo palpable'),
      tog('occipitalHematoma', '[<2 yr] Occipital/parietal/temporal scalp hematoma', '[<2 años] Hematoma cuero cabelludo occipital/parietal/temporal'),
      tog('locGt5s', '[<2 yr] Loss of consciousness >5 seconds', '[<2 años] Pérdida de conciencia >5 segundos'),
      tog('actingAbnormal', '[<2 yr] Not acting normally per parent', '[<2 años] Comportamiento anormal según padres'),
      tog('anyLoc', '[≥2 yr] Loss of consciousness', '[≥2 años] Pérdida de conciencia'),
      tog('vomiting', '[≥2 yr] Vomiting', '[≥2 años] Vómitos'),
      tog('severeHeadache', '[≥2 yr] Severe headache', '[≥2 años] Cefalea severa'),
      tog('basilarSkull', '[≥2 yr] Signs of basilar skull fracture', '[≥2 años] Signos fractura base de cráneo'),
      sel('mechanism', 'Injury mechanism', 'Mecanismo', [
        { v: 'nonsevere', l: { en: 'Non-severe', es: 'No severo' } },
        { v: 'severe', l: { en: 'Severe (MVC, fall >3 ft, struck by high-impact object)', es: 'Severo (MVC, caída >90 cm, impacto alta energía)' } }
      ], 'nonsevere')
    ]
  };

  S['revised-geneva'] = {
    formula: 'Revised Geneva Score — PE probability',
    inputs: [
      tog('age65', 'Age >65', 'Edad >65'),
      tog('prevDvtPe', 'Previous DVT or PE', 'TVP o TEP previo'),
      tog('surgFx1m', 'Surgery or fracture within 1 month', 'Cirugía o fractura en el último mes'),
      tog('malignancy', 'Active malignant condition', 'Neoplasia activa'),
      tog('unilateralPain', 'Unilateral lower-limb pain', 'Dolor unilateral en extremidad inferior'),
      tog('hemoptysis', 'Hemoptysis', 'Hemoptisis'),
      sel('hr', 'Heart rate', 'FC', [
        { v: 0, l: { en: '<75 bpm', es: '<75 lpm' } },
        { v: 3, l: { en: '75–94 bpm (+3)', es: '75–94 lpm (+3)' } },
        { v: 5, l: { en: '≥95 bpm (+5)', es: '≥95 lpm (+5)' } }
      ], 0),
      tog('limbEdema', 'Deep palpation pain of lower limb + unilateral edema', 'Dolor palpación profunda + edema unilateral')
    ]
  };

  S['grace-score'] = {
    formula: 'GRACE Score — ACS in-hospital mortality',
    inputs: [
      sel('agePts', 'Age', 'Edad', [
        { v: 0, l: { en: '<40 yr', es: '<40 años' } }, { v: 18, l: { en: '40–49 yr (+18)', es: '40–49 (+18)' } },
        { v: 36, l: { en: '50–59 yr (+36)', es: '50–59 (+36)' } }, { v: 55, l: { en: '60–69 yr (+55)', es: '60–69 (+55)' } },
        { v: 73, l: { en: '70–79 yr (+73)', es: '70–79 (+73)' } }, { v: 91, l: { en: '≥80 yr (+91)', es: '≥80 (+91)' } }
      ], 55),
      sel('hrPts', 'Heart rate', 'FC', [
        { v: 0, l: { en: '<70 bpm', es: '<70 lpm' } }, { v: 7, l: { en: '70–89 (+7)', es: '70–89 (+7)' } },
        { v: 13, l: { en: '90–109 (+13)', es: '90–109 (+13)' } }, { v: 23, l: { en: '110–149 (+23)', es: '110–149 (+23)' } },
        { v: 36, l: { en: '150–199 (+36)', es: '150–199 (+36)' } }, { v: 46, l: { en: '≥200 (+46)', es: '≥200 (+46)' } }
      ], 0),
      sel('sbpPts', 'Systolic BP', 'TAS', [
        { v: 63, l: { en: '<80 mmHg (+63)', es: '<80 (+63)' } }, { v: 58, l: { en: '80–99 (+58)', es: '80–99 (+58)' } },
        { v: 47, l: { en: '100–119 (+47)', es: '100–119 (+47)' } }, { v: 37, l: { en: '120–139 (+37)', es: '120–139 (+37)' } },
        { v: 26, l: { en: '140–159 (+26)', es: '140–159 (+26)' } }, { v: 11, l: { en: '160–199 (+11)', es: '160–199 (+11)' } },
        { v: 0, l: { en: '≥200 (+0)', es: '≥200 (+0)' } }
      ], 37),
      sel('crPts', 'Creatinine', 'Creatinina', [
        { v: 2, l: { en: '0–0.39 mg/dL (+2)', es: '0–0.39 (+2)' } }, { v: 5, l: { en: '0.4–0.79 (+5)', es: '0.4–0.79 (+5)' } },
        { v: 8, l: { en: '0.8–1.19 (+8)', es: '0.8–1.19 (+8)' } }, { v: 11, l: { en: '1.2–1.59 (+11)', es: '1.2–1.59 (+11)' } },
        { v: 14, l: { en: '1.6–1.99 (+14)', es: '1.6–1.99 (+14)' } }, { v: 23, l: { en: '2.0–3.99 (+23)', es: '2.0–3.99 (+23)' } },
        { v: 31, l: { en: '≥4.0 (+31)', es: '≥4.0 (+31)' } }
      ], 8),
      sel('killipPts', 'Killip class', 'Clase Killip', [
        { v: 0, l: { en: 'I — No CHF', es: 'I — Sin ICC' } }, { v: 21, l: { en: 'II — Rales/JVD (+21)', es: 'II — Crepitantes (+21)' } },
        { v: 43, l: { en: 'III — Pulmonary edema (+43)', es: 'III — Edema pulmonar (+43)' } },
        { v: 64, l: { en: 'IV — Cardiogenic shock (+64)', es: 'IV — Shock cardiogénico (+64)' } }
      ], 0),
      tog('cardiacArrest', 'Cardiac arrest at admission (+43)', 'PCR al ingreso (+43)'),
      tog('stDeviation', 'ST-segment deviation (+30)', 'Desviación ST (+30)'),
      tog('elevatedEnzymes', 'Elevated cardiac enzymes/markers (+15)', 'Enzimas cardíacas elevadas (+15)')
    ]
  };

  // ── DOCTORS ──
  S['child-pugh'] = {
    formula: 'Child-Pugh Score: A=5–6, B=7–9, C=10–15',
    inputs: [
      sel('bilirubin', 'Bilirubin', 'Bilirrubina', [
        { v: 1, l: { en: '<2 mg/dL (1 pt)', es: '<2 mg/dL (1 pt)' } },
        { v: 2, l: { en: '2–3 mg/dL (2 pts)', es: '2–3 mg/dL (2 pts)' } },
        { v: 3, l: { en: '>3 mg/dL (3 pts)', es: '>3 mg/dL (3 pts)' } }
      ], 1),
      sel('albumin', 'Albumin', 'Albúmina', [
        { v: 1, l: { en: '>3.5 g/dL (1 pt)', es: '>3.5 g/dL (1 pt)' } },
        { v: 2, l: { en: '2.8–3.5 g/dL (2 pts)', es: '2.8–3.5 g/dL (2 pts)' } },
        { v: 3, l: { en: '<2.8 g/dL (3 pts)', es: '<2.8 g/dL (3 pts)' } }
      ], 1),
      sel('pt', 'Prothrombin time prolonged', 'TP prolongado', [
        { v: 1, l: { en: '<4 sec (1 pt)', es: '<4 seg (1 pt)' } },
        { v: 2, l: { en: '4–6 sec (2 pts)', es: '4–6 seg (2 pts)' } },
        { v: 3, l: { en: '>6 sec (3 pts)', es: '>6 seg (3 pts)' } }
      ], 1),
      sel('ascites', 'Ascites', 'Ascitis', [
        { v: 1, l: { en: 'None (1 pt)', es: 'Ninguna (1 pt)' } },
        { v: 2, l: { en: 'Mild (2 pts)', es: 'Leve (2 pts)' } },
        { v: 3, l: { en: 'Moderate–Severe (3 pts)', es: 'Moderada–Severa (3 pts)' } }
      ], 1),
      sel('encephalopathy', 'Hepatic encephalopathy', 'Encefalopatía hepática', [
        { v: 1, l: { en: 'None (1 pt)', es: 'Ninguna (1 pt)' } },
        { v: 2, l: { en: 'Grade I–II (2 pts)', es: 'Grado I–II (2 pts)' } },
        { v: 3, l: { en: 'Grade III–IV (3 pts)', es: 'Grado III–IV (3 pts)' } }
      ], 1)
    ]
  };

  S['meld-score'] = {
    formula: 'MELD = 3.78×ln(Bili) + 11.2×ln(INR) + 9.57×ln(Cr) + 6.43',
    inputs: [
      num('bilirubin', 'Bilirubin', 'Bilirrubina', 'mg/dL', 1.0, { step: 0.1, min: 0.1 }),
      num('inr', 'INR', 'INR', '', 1.2, { step: 0.1, min: 0.1 }),
      num('creatinine', 'Creatinine', 'Creatinina', 'mg/dL', 1.0, { step: 0.1, min: 0.1 }),
      num('sodium', 'Sodium (for MELD-Na)', 'Sodio (para MELD-Na)', 'mEq/L', 138, { min: 120, max: 145 })
    ]
  };

  S['fib4-index'] = {
    formula: 'FIB-4 = (Age × AST) / (Platelets × √ALT)',
    inputs: [
      num('age', 'Age', 'Edad', 'years', 55, { min: 18, max: 100 }),
      num('ast', 'AST', 'AST', 'U/L', 45, { min: 1 }),
      num('alt', 'ALT', 'ALT', 'U/L', 35, { min: 1 }),
      num('platelets', 'Platelets', 'Plaquetas', '×10⁹/L', 150, { min: 1 })
    ]
  };

  S['has-bled'] = {
    formula: 'HAS-BLED: ≥3 = high bleeding risk in AF anticoagulation',
    inputs: [
      tog('htn', 'Hypertension (uncontrolled, SBP >160 mmHg)', 'Hipertensión no controlada (TAS >160)'),
      tog('renal', 'Renal disease (dialysis / Cr >2.6 / transplant)', 'Enfermedad renal'),
      tog('liver', 'Liver disease (cirrhosis / bilirubin >2× / transaminases >3×)', 'Hepatopatía'),
      tog('stroke', 'Prior stroke', 'ACV previo'),
      tog('bleeding', 'Prior major bleeding or bleeding predisposition', 'Sangrado mayor previo o predisposición'),
      tog('labileInr', 'Labile INR (TTR <60%)', 'INR inestable'),
      tog('elderly', 'Age >65 or frailty', 'Edad >65 o fragilidad'),
      tog('drugs', 'Antiplatelet agents or NSAIDs', 'Antiagregantes o AINEs'),
      tog('alcohol', 'Alcohol use (≥8 drinks/week)', 'Consumo de alcohol ≥8 bebidas/semana')
    ]
  };

  // ── PHARMACISTS ──
  S['crcl-obese'] = {
    formula: 'ABW = IBW + 0.4×(TBW−IBW); then Cockcroft-Gault with ABW',
    inputs: [
      num('age', 'Age', 'Edad', 'years', 55, { min: 18 }),
      num('tbw', 'Total body weight', 'Peso total', 'kg', 120, { step: 0.1, min: 1 }),
      num('height', 'Height', 'Talla', 'cm', 170, { min: 100, max: 220 }),
      num('scr', 'Serum creatinine', 'Creatinina sérica', 'mg/dL', 1.2, { step: 0.1, min: 0.1 }),
      sel('sex', 'Sex', 'Sexo', [
        { v: 'male', l: { en: 'Male', es: 'Masculino' } },
        { v: 'female', l: { en: 'Female', es: 'Femenino' } }
      ], 'male')
    ]
  };

  S['phenytoin-correction'] = {
    formula: 'Winter-Tozer: Corrected = Measured / (0.2×Alb + 0.1) [renal: 0.1×Alb + 0.1]',
    inputs: [
      num('measured', 'Measured phenytoin level', 'Nivel de fenitoína medido', 'mg/L', 8, { step: 0.1, min: 0 }),
      num('albumin', 'Serum albumin', 'Albúmina sérica', 'g/dL', 2.5, { step: 0.1, min: 0.1 }),
      sel('renalImpair', 'Renal status', 'Estado renal', [
        { v: 'none', l: { en: 'Normal (CrCl ≥20 mL/min)', es: 'Normal (CrCl ≥20 mL/min)' } },
        { v: 'severe', l: { en: 'Severe impairment (CrCl <20 or dialysis)', es: 'IRC grave (CrCl <20 o diálisis)' } }
      ], 'none')
    ]
  };

  // ── OB/GYN ──
  S['preeclampsia-risk'] = {
    formula: 'ACOG Aspirin Prophylaxis: 1 high-risk OR ≥2 moderate-risk factors',
    inputs: [
      tog('priorPE', 'Prior preeclampsia', 'Preeclampsia previa'),
      tog('multifetal', 'Multifetal (twin/higher) pregnancy', 'Embarazo múltiple (gemelar o más)'),
      tog('chronicHTN', 'Chronic hypertension', 'Hipertensión crónica'),
      tog('t1t2dm', 'Pre-existing T1 or T2 diabetes', 'Diabetes preexistente T1 o T2'),
      tog('renalDz', 'Chronic renal disease', 'Enfermedad renal crónica'),
      tog('autoimm', 'Autoimmune disease (lupus / APS)', 'Enfermedad autoinmune (lupus/SAF)'),
      tog('firstPreg', 'First pregnancy (nulliparity)', 'Primera gestación (nulípara)'),
      tog('obese', 'Pre-pregnancy BMI >30', 'IMC pregestacional >30'),
      tog('famHx', 'Family history of preeclampsia (mother/sister)', 'Antecedente familiar de preeclampsia'),
      tog('age35', 'Age ≥35', 'Edad ≥35'),
      tog('priorAdverse', 'Prior adverse pregnancy outcome (IUGR, abruption, stillbirth)', 'Resultado adverso previo')
    ]
  };

  S['gdm-screening'] = {
    formula: 'Two-step: GCT ≥130→3hr OGTT. One-step: 2hr 75g OGTT (IADPSG)',
    inputs: [
      sel('approach', 'Screening approach', 'Enfoque de cribado', [
        { v: 'twostep', l: { en: 'Two-step (ACOG) — GCT + 3hr OGTT', es: 'Dos pasos (ACOG) — GCT + OGTT 3h' } },
        { v: 'onestep', l: { en: 'One-step (IADPSG) — 75g 2hr OGTT', es: 'Un paso (IADPSG) — OGTT 75g 2h' } }
      ], 'twostep'),
      num('fasting', 'Fasting glucose', 'Glucosa en ayunas', 'mg/dL', 90, { min: 50, max: 200 }),
      num('hr1', '1-hour glucose (post-load)', 'Glucosa 1 hora (post-carga)', 'mg/dL', 145, { min: 50, max: 300 }),
      num('hr2', '2-hour glucose', 'Glucosa 2 horas', 'mg/dL', 130, { min: 50, max: 300 }),
      num('hr3', '3-hour glucose (two-step only)', 'Glucosa 3 horas (solo dos pasos)', 'mg/dL', 120, { min: 50, max: 250 })
    ]
  };

  // ── PEDIATRICS ──
  S['ped-gcs'] = {
    formula: 'Pediatric GCS (modified verbal for pre-verbal children)',
    inputs: [
      sel('eye', 'Eye opening', 'Apertura ocular', [
        { v: 4, l: { en: '4 — Spontaneous', es: '4 — Espontánea' } },
        { v: 3, l: { en: '3 — To voice', es: '3 — A la voz' } },
        { v: 2, l: { en: '2 — To pain', es: '2 — Al dolor' } },
        { v: 1, l: { en: '1 — None', es: '1 — Ninguna' } }
      ], 4),
      sel('verbal', 'Verbal response (age-adapted)', 'Respuesta verbal (adaptada a la edad)', [
        { v: 5, l: { en: '5 — Coos, babbles, words (age-appropriate)', es: '5 — Balbuceo/palabras (apropiado para la edad)' } },
        { v: 4, l: { en: '4 — Irritable cry / confused words', es: '4 — Llanto irritable / palabras confusas' } },
        { v: 3, l: { en: '3 — Cries to pain / inappropriate words', es: '3 — Llanto al dolor / palabras inapropiadas' } },
        { v: 2, l: { en: '2 — Moans to pain / incomprehensible', es: '2 — Gemidos al dolor / incomprensible' } },
        { v: 1, l: { en: '1 — None', es: '1 — Ninguna' } }
      ], 5),
      sel('motor', 'Motor response', 'Respuesta motora', [
        { v: 6, l: { en: '6 — Normal spontaneous movements', es: '6 — Movimientos espontáneos normales' } },
        { v: 5, l: { en: '5 — Localizes / withdraws to touch', es: '5 — Localiza / retira al tacto' } },
        { v: 4, l: { en: '4 — Withdraws to pain', es: '4 — Retira al dolor' } },
        { v: 3, l: { en: '3 — Abnormal flexion (decorticate)', es: '3 — Flexión anormal (decorticación)' } },
        { v: 2, l: { en: '2 — Extension (decerebrate)', es: '2 — Extensión (descerebración)' } },
        { v: 1, l: { en: '1 — None', es: '1 — Ninguna' } }
      ], 6)
    ]
  };

  S['pews'] = {
    formula: 'PEWS: ≥2 = urgent review; ≥4 = immediate escalation',
    inputs: [
      sel('behavior', 'Behavior', 'Comportamiento', [
        { v: 0, l: { en: '0 — Playing / appropriate', es: '0 — Jugando / apropiado' } },
        { v: 1, l: { en: '1 — Sleeping', es: '1 — Dormido' } },
        { v: 2, l: { en: '2 — Irritable', es: '2 — Irritable' } },
        { v: 3, l: { en: '3 — Lethargic / confused / reduced pain response', es: '3 — Letárgico / confuso / respuesta reducida al dolor' } }
      ], 0),
      sel('cardiovascular', 'Cardiovascular', 'Cardiovascular', [
        { v: 0, l: { en: '0 — Pink, cap refill 1–2 s', es: '0 — Rosado, relleno capilar 1–2 s' } },
        { v: 1, l: { en: '1 — Pale, cap refill 3 s', es: '1 — Pálido, relleno 3 s' } },
        { v: 2, l: { en: '2 — Grey/cap refill 4 s or HR ↑20 above normal', es: '2 — Gris/relleno 4 s o FC ↑20 sobre normal' } },
        { v: 3, l: { en: '3 — Grey/mottled, cap refill ≥5 s or HR ↑30 above normal', es: '3 — Gris/moteado, relleno ≥5 s o FC ↑30' } }
      ], 0),
      sel('respiratory', 'Respiratory', 'Respiratorio', [
        { v: 0, l: { en: '0 — Normal, no retractions, room air', es: '0 — Normal, sin retracciones, aire ambiente' } },
        { v: 1, l: { en: '1 — RR >10 above normal, using accessory muscles, FiO₂ 30%', es: '1 — FR >10 sobre normal, uso muscular accesorio, FiO₂ 30%' } },
        { v: 2, l: { en: '2 — RR >20 above normal, retractions, FiO₂ 40%', es: '2 — FR >20 sobre normal, retracciones, FiO₂ 40%' } },
        { v: 3, l: { en: '3 — RR 5 below normal, sternal retraction/grunting, FiO₂ ≥50%', es: '3 — FR bajo normal, retracción esternal/quejido, FiO₂ ≥50%' } }
      ], 0)
    ]
  };

})();
