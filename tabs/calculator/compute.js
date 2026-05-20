/**
 * MediHelp Medical Calculator — Client-side computation engine
 */
window.CalcCompute = {
  compute(id, vals) {
    const fn = this[id] || this._aliases[id];
    if (!fn) return { error: 'Calculator not implemented' };
    return fn.call(this, vals);
  },

  _aliases: {
    'student-bmi': 'bmi', 'diet-bmi': 'bmi',
    'student-bsa': 'bsa',
    'student-maintenance': 'maintenance-fluid', 'ped-maintenance-fluid': 'maintenance-fluid',
    'lab-corrected-calcium': 'corrected-calcium', 'lab-anion-gap': 'anion-gap',
    'medication-dose': 'weight-based-dose', 'ped-weight-dose': 'weight-based-dose',
    'iv-infusion': 'iv-flow-rate', 'infusion-rate': 'iv-flow-rate',
    'diet-ibw': 'ibw',
    'surg-burn': 'parkland',
    'meld-meldna': 'meld-score',
    'fib4': 'fib4-index',
    'ottawa-ankle': 'ottawa-rules',
    'ottawa-foot': 'ottawa-rules',
    'ottawa-knee': 'ottawa-rules',
    'geneva-revised': 'revised-geneva',
    'grace-acs': 'grace-score',
    'crcl-obese-adjbw': 'crcl-obese',
    'phenytoin-corrected': 'phenytoin-correction',
    'gcs-pediatric': 'ped-gcs',
    'pews-monaghan': 'pews',
    'preeclampsia-aspirin': 'preeclampsia-risk',
    'gdm-thresholds': 'gdm-screening'
  },

  _chip(status) {
    return { status, label: status };
  },

  bmi(v) {
    const w = +v.weight;
    const h = +v.height / 100;
    if (!w || !h) return { error: 'Enter weight and height' };
    const bmi = w / (h * h);
    let interp = 'Normal weight', status = 'normal';
    const t = CalcFormulas.THRESHOLDS.bmi;
    if (bmi < t.underweight) { interp = 'Underweight'; status = 'low'; }
    else if (bmi >= 40) { interp = 'Obese (Class III / Morbid)'; status = 'critical'; }
    else if (bmi >= 30) { interp = 'Obese (Class I-II)'; status = 'high'; }
    else if (bmi >= t.overweight) { interp = 'Overweight'; status = 'high'; }
    return {
      primary: bmi.toFixed(1) + ' kg/m²',
      interpretation: interp,
      chip: status,
      details: [{ label: 'Category', value: interp }]
    };
  },

  bsa(v) {
    const w = +v.weight;
    const h = +v.height;
    if (!w || !h) return { error: 'Enter weight and height' };
    const bsa = Math.sqrt((h * w) / 3600);
    return { primary: bsa.toFixed(2) + ' m²', interpretation: 'Mosteller BSA', chip: 'normal' };
  },

  'creatinine-clearance'(v) {
    const age = +v.age;
    const weight = +v.weight;
    const scrMgDl = +v.scr;
    if (!age || !weight || !scrMgDl) return { error: 'Fill all fields' };
    let crcl = ((140 - age) * weight) / (72 * scrMgDl);
    if (v.sex === 'female') crcl = crcl * 0.85;
    let status = 'normal';
    if (crcl < 30) status = 'critical';
    else if (crcl < 60) status = 'high';
    else if (crcl < 90) status = 'low';
    return {
      primary: crcl.toFixed(1) + ' mL/min',
      interpretation: crcl >= 90 ? 'Normal kidney function' : crcl >= 60 ? 'Mild reduction' : crcl >= 30 ? 'Moderate reduction' : 'Severe reduction',
      chip: status,
      details: [{ label: 'Cockcroft-Gault', value: 'Estimate only — not for drug dosing in CKD without confirmation' }]
    };
  },

  egfr(v) {
    const age = +v.age, scr = +v.scr;
    if (!age || !scr) return { error: 'Fill all fields' };
    const egfr = CalcClinicalData.egfr2021(scr, age, v.sex === 'female');
    let stage = 'G1 (Normal)', status = 'normal';
    if (egfr < 15) { stage = 'G5 (Kidney failure)'; status = 'critical'; }
    else if (egfr < 30) { stage = 'G4 (Severe)'; status = 'critical'; }
    else if (egfr < 45) { stage = 'G3b (Moderate-severe)'; status = 'high'; }
    else if (egfr < 60) { stage = 'G3a (Mild-moderate)'; status = 'high'; }
    else if (egfr < 90) { stage = 'G2 (Mild)'; status = 'low'; }
    return { primary: Math.round(egfr) + ' mL/min/1.73m²', interpretation: 'CKD-EPI 2021 — Stage: ' + stage, chip: status };
  },

  'chads2-vasc'(v) {
    let score = 0;
    if (v.chf) score++;
    if (v.htn) score++;
    if (v.age75) score += 2;
    else if (v.age65) score++;
    if (v.dm) score++;
    if (v.stroke) score += 2;
    if (v.vascular) score++;
    if (v.sex === 'female') score++; // Bug fix: 'male' is truthy too; must be explicit
    const risk = score === 0 ? 'Low (0%/yr stroke)' : score === 1 ? 'Low-moderate' : score === 2 ? 'Moderate (~2.2%/yr)' : 'High (≥3.2%/yr)';
    return { primary: score + ' points', interpretation: risk, chip: score >= 2 ? 'high' : 'normal' };
  },

  'wells-pe'(v) {
    let score = 0;
    if (v.dvt) score += 3;
    if (v.peLikely) score += 3;
    // Backward compatible: accept either boolean criterion or numeric HR value.
    if (v.hr === true || (+v.hr > 100)) score += 1.5;
    if (v.immob) score += 1.5;
    if (v.prevPe) score += 1.5;
    if (v.hemoptysis) score += 1;
    if (v.malignancy) score += 1;
    const interp = score <= 4 ? 'PE unlikely (≤4)' : 'PE likely (>4) — consider imaging';
    return { primary: score + ' points', interpretation: interp, chip: score > 4 ? 'high' : 'normal' };
  },

  curb65(v) {
    let score = 0;
    if (v.confusion) score++;
    if (v.bun) score++;
    if (v.rr) score++;
    if (v.bp) score++;
    if (v.age65) score++;
    const mortality = ['0.6%', '2.7%', '6.8%', '14%', '27.8%', '57%'];
    return {
      primary: score + ' / 5',
      interpretation: '30-day mortality ~' + (mortality[score] || '—'),
      chip: score >= 3 ? 'critical' : score >= 2 ? 'high' : 'normal',
      details: [{ label: 'Recommendation', value: score >= 3 ? 'Consider ICU admission' : score >= 2 ? 'Consider hospitalization' : 'Outpatient may be appropriate' }]
    };
  },

  qsofa(v) {
    // Guard blank fields — a blank SBP (0) must not score positive
    if (!v.rr && !v.sbp && !v.gcs) return { error: 'Enter at least one vital sign' };
    let score = 0;
    if (+v.rr >= 22) score++;
    if (+v.sbp && +v.sbp <= 100) score++; // blank SBP (0) excluded
    if (+v.gcs && +v.gcs < 15) score++;  // blank GCS (0) excluded
    return {
      primary: score + ' / 3',
      interpretation: score >= 2 ? 'Positive qSOFA — high risk, evaluate for sepsis' : 'Negative qSOFA',
      chip: score >= 2 ? 'critical' : 'normal'
    };
  },

  gcs(v) {
    if (!v.eye || !v.verbal || !v.motor) return { error: 'Select all three GCS components (E/V/M)' };
    const total = (+v.eye || 0) + (+v.verbal || 0) + (+v.motor || 0);
    let interp = 'Minor head injury';
    let status = 'normal';
    if (total <= 8) { interp = 'Severe brain injury — intubation often indicated'; status = 'critical'; }
    else if (total <= 12) { interp = 'Moderate brain injury'; status = 'high'; }
    else if (total <= 14) { interp = 'Mild brain injury'; status = 'low'; }
    return { primary: total + ' / 15', interpretation: interp, chip: status };
  },

  map(v) {
    const sbp = +v.sbp, dbp = +v.dbp;
    if (!sbp || !dbp) return { error: 'Enter BP values' };
    const map = (sbp + 2 * dbp) / 3;
    let status = 'normal';
    if (map < 65) status = 'critical';
    else if (map < 70) status = 'high';
    return {
      primary: map.toFixed(0) + ' mmHg',
      interpretation: map < 65 ? 'MAP <65 — inadequate organ perfusion' : 'Mean arterial pressure',
      chip: status
    };
  },

  'shock-index'(v) {
    const si = (+v.hr) / (+v.sbp);
    if (!isFinite(si)) return { error: 'Enter HR and SBP' };
    return {
      primary: si.toFixed(2),
      interpretation: si > 0.9 ? 'Elevated — concern for shock/hemorrhage' : si > 0.7 ? 'Borderline elevated' : 'Normal range',
      chip: si > 0.9 ? 'critical' : si > 0.7 ? 'high' : 'normal'
    };
  },

  parkland(v) {
    const w = +v.weight, tbsa = +v.tbsa;
    if (!w || !tbsa) return { error: 'Enter weight and TBSA' };
    const total = 4 * w * tbsa;
    const first8 = total / 2;
    const next16 = total / 2;
    return {
      primary: total.toLocaleString() + ' mL / 24h',
      interpretation: 'Parkland formula resuscitation',
      chip: 'normal',
      details: [
        { label: 'First 8 hours', value: first8.toLocaleString() + ' mL' },
        { label: 'Next 16 hours', value: next16.toLocaleString() + ' mL' },
        { label: 'Note', value: 'Half in first 8h from burn time; adjust to urine output 0.5–1 mL/kg/hr' }
      ]
    };
  },

  'iv-flow-rate'(v) {
    const vol = +v.volume, time = +v.time;
    if (!vol || !time) return { error: 'Enter volume and time' };
    const rate = vol / time;
    return { primary: rate.toFixed(1) + ' mL/hr', interpretation: 'IV infusion rate', chip: 'normal' };
  },

  'drops-per-minute'(v) {
    const vol = +v.volume, factor = +v.factor, time = +v.time;
    if (!vol || !time) return { error: 'Enter values' };
    const gtt = (vol * factor) / time;
    return { primary: gtt.toFixed(0) + ' gtt/min', interpretation: 'IV drip rate', chip: 'normal' };
  },

  'weight-based-dose'(v) {
    const dose = (+v.weight) * (+v.dosePerKg);
    if (!isFinite(dose)) return { error: 'Enter weight and dose/kg' };
    return {
      primary: dose.toFixed(1) + ' mg',
      interpretation: 'Total single dose',
      chip: 'normal',
      details: [{ label: 'Formula', value: v.weight + ' kg × ' + v.dosePerKg + ' mg/kg' }]
    };
  },

  concentration(v) {
    const c = (+v.mass) / (+v.volume);
    if (!isFinite(c)) return { error: 'Enter mass and volume' };
    return { primary: c.toFixed(2) + ' mg/mL', interpretation: 'Drug concentration', chip: 'normal' };
  },

  ibw(v) {
    // Devine formula requires height in inches; height must first be in cm
    const heightCm = +v.height;
    const inches = heightCm / 2.54;
    const base = v.sex === 'female' ? 45.5 : 50;
    const ibw = base + 2.3 * (inches - 60);
    if (ibw <= 0) return { error: 'Height too low for reliable Devine IBW calculation' };
    return { primary: ibw.toFixed(1) + ' kg', interpretation: 'Devine ideal body weight', chip: 'normal' };
  },

  'tidal-volume'(v) {
    const vt = (+v.ibw) * (+v.mlPerKg);
    return {
      primary: vt.toFixed(0) + ' mL',
      interpretation: 'Lung-protective tidal volume (' + v.mlPerKg + ' mL/kg IBW)',
      chip: 'normal',
      details: [{ label: 'Range (6–8 mL/kg)', value: ((+v.ibw) * 6).toFixed(0) + '–' + ((+v.ibw) * 8).toFixed(0) + ' mL' }]
    };
  },

  apgar(v) {
    const total = (+v.appearance || 0) + (+v.pulse || 0) + (+v.grimace || 0) + (+v.activity || 0) + (+v.respiration || 0);
    let interp = 'Normal — no intervention needed';
    let status = 'normal';
    if (total <= 3) { interp = 'Critically low — immediate resuscitation'; status = 'critical'; }
    else if (total <= 6) { interp = 'Moderately abnormal — may need assistance'; status = 'high'; }
    else if (total <= 7) { interp = 'Mildly abnormal — monitor closely'; status = 'low'; }
    return { primary: total + ' / 10', interpretation: interp, chip: status };
  },

  'gestational-age'(v) {
    const today = new Date();
    if (v.lmp) {
      const lmp = new Date(v.lmp);
      const diff = today - lmp;
      const days = Math.floor(diff / 86400000);
      const weeks = Math.floor(days / 7);
      const rem = days % 7;
      if (days < 0 || days > 320) return { error: 'Check LMP date' };
      return {
        primary: weeks + 'w ' + rem + 'd',
        interpretation: 'Gestational age from LMP',
        chip: weeks < 37 ? 'low' : weeks > 42 ? 'high' : 'normal',
        details: [{ label: 'Total days', value: days + ' days' }]
      };
    }
    if (v.usWeeks) {
      const usDate = v.usDate ? new Date(v.usDate) : today;
      const daysAtUs = (+v.usWeeks * 7) + (+v.usDays || 0);
      const daysSince = Math.floor((today - usDate) / 86400000);
      const totalDays = daysAtUs + daysSince;
      const weeks = Math.floor(totalDays / 7);
      const rem = totalDays % 7;
      return { primary: weeks + 'w ' + rem + 'd', interpretation: 'GA from ultrasound + elapsed time', chip: 'normal' };
    }
    return { error: 'Enter LMP or ultrasound GA' };
  },

  'anion-gap'(v) {
    const ag = (+v.na) - ((+v.cl) + (+v.hco3));
    // Bug fix: chip threshold aligned with interpretation threshold (both >12)
    let status = 'normal';
    if (ag > 12) status = 'high';
    else if (ag < 8) status = 'low';
    return {
      primary: ag.toFixed(1) + ' mEq/L',
      interpretation: ag > 12 ? 'Elevated anion gap — consider MUDPILES' : 'Normal anion gap',
      chip: status
    };
  },

  'corrected-calcium'(v) {
    const corr = (+v.ca) + 0.8 * (4 - (+v.albumin));
    let status = corr < 8.5 ? 'low' : corr > 10.5 ? 'high' : 'normal';
    return {
      primary: corr.toFixed(2) + ' mg/dL',
      interpretation: 'Albumin-corrected calcium (normal 8.5–10.5)',
      chip: status
    };
  },

  'corrected-sodium'(v) {
    // Expected canonical glucose is mg/dL (convertFormToSI). If caller bypasses it and sends
    // mmol/L-like values, normalize defensively to keep the 400 mg/dL threshold valid.
    const glucose = +v.glucose;
    const glucoseMgDl = glucose > 0 && glucose < 30 ? glucose * 18.016 : glucose;
    // Threshold 400 mg/dL ≈ 22.2 mmol/L — comparison valid after conversion
    const factor = glucoseMgDl >= 400 ? 2.4 : 1.6;
    const corr = (+v.na) + factor * ((glucoseMgDl - 100) / 100);
    return {
      primary: corr.toFixed(1) + ' mEq/L',
      interpretation: 'Sodium corrected for hyperglycemia',
      chip: corr < 135 ? 'low' : corr > 145 ? 'high' : 'normal'
    };
  },

  'maintenance-fluid'(v) {
    const w = +v.weight;
    if (!w) return { error: 'Enter weight' };
    let ml = 0;
    if (w <= 10) ml = w * 100;
    else if (w <= 20) ml = 1000 + (w - 10) * 50;
    else ml = 1500 + (w - 20) * 20;
    return {
      primary: ml + ' mL/24h',
      interpretation: 'Holliday-Segar maintenance fluids',
      chip: 'normal',
      details: [{ label: 'Hourly rate', value: (ml / 24).toFixed(1) + ' mL/hr' }]
    };
  },

  'defibrillation-energy'(v) {
    const w = +v.weight;
    const attempt = +v.attempt;
    const jPerKg = attempt === 1 ? 2 : 4;
    let joules = w * jPerKg;
    if (!v.pediatric && joules > 360) joules = 360;
    if (v.pediatric) {
      if (joules > w * 10) joules = w * 10;  // 10 J/kg max
      if (joules > 360) joules = 360;          // absolute adult ceiling per PALS
    }
    return {
      primary: Math.round(joules) + ' J',
      interpretation: (attempt === 1 ? '1st' : '2nd+') + ' shock energy',
      chip: 'normal',
      details: [{ label: 'Pediatric mode', value: v.pediatric ? 'Yes' : 'No' }]
    };
  },

  'unit-converter'(v) {
    const val = +v.value;
    const conv = {
      'kg-lb': x => x * 2.20462, 'lb-kg': x => x / 2.20462,
      'cm-in': x => x / 2.54, 'in-cm': x => x * 2.54,
      'mg-mcg': x => x * 1000, 'mcg-mg': x => x / 1000
    };
    const key = v.from + '-' + v.to;
    if (v.from === v.to) return { primary: val + ' ' + v.from, interpretation: 'Same unit', chip: 'normal' };
    const fn = conv[key];
    if (!fn) return { error: 'Conversion not supported' };
    const result = fn(val);
    return { primary: result.toFixed(4) + ' ' + v.to, interpretation: val + ' ' + v.from + ' → ' + v.to, chip: 'normal' };
  },

  'opioid-conversion'(v) {
    const factors = CalcFormulas.DOSAGES.opioid_mme;
    const drug = v.drug;
    const dose = +v.dose;
    let factor = factors[drug] || 1;
    
    if (drug === 'methadone') {
      if (dose > 60) factor = 12;
      else if (dose > 40) factor = 10;
      else if (dose > 20) factor = 8;
      else if (dose > 0) factor = 4;
    }
    
    let mme = dose * factor;
    if (drug === 'fentanyl') mme = dose * factors.fentanyl_patch_mcg_hr;
    
    const details = [
      { label: 'CDC caution', value: 'Careful titration when ≥50 MME/day; avoid ≥90 MME/day when possible' }
    ];
    if (drug === 'methadone') {
      details.push({ label: 'Methadone MME Factor', value: `${factor}x (CDC variable factor based on daily dose)` });
    }
    
    return {
      primary: mme.toFixed(1) + ' MME/day',
      interpretation: 'Morphine milligram equivalents',
      chip: mme >= 90 ? 'critical' : mme >= 50 ? 'high' : 'normal',
      details: details
    };
  },

  'calorie-requirement'(v) {
    const w = +v.weight;
    const h = +v.height;
    const age = +v.age;
    let bmr = v.sex === 'male'
      ? 10 * w + 6.25 * h - 5 * age + 5
      : 10 * w + 6.25 * h - 5 * age - 161;
    const tdee = bmr * (+v.activity);
    return {
      primary: Math.round(tdee) + ' kcal/day',
      interpretation: 'Estimated total daily energy expenditure',
      chip: 'normal',
      details: [{ label: 'BMR', value: Math.round(bmr) + ' kcal/day' }]
    };
  },

  osmolality(v) {
    const glucoseMgDl = +v.glucose;
    const bunMgDl = +v.bun; // BUN always entered in mg/dL (no SI toggle for BUN)
    const osm = 2 * (+v.na) + (glucoseMgDl / 18) + (bunMgDl / 2.8);
    return { primary: osm.toFixed(1) + ' mOsm/kg', interpretation: 'Calculated serum osmolality', chip: osm > 320 ? 'high' : osm < 275 ? 'low' : 'normal' };
  },

  qtc(v) {
    const qt = +v.qt, hr = +v.hr;
    if (!hr) return { error: 'Enter heart rate' };
    const rr = 60 / hr;
    const qtc = qt / Math.sqrt(rr);
    let status = qtc > 500 ? 'critical' : qtc > 470 ? 'high' : qtc > 450 ? 'low' : 'normal';
    return { primary: qtc.toFixed(0) + ' ms', interpretation: 'Bazett corrected QT (normal <450 ms ♂, <470 ms ♀)', chip: status };
  },

  'pf-ratio'(v) {
    const pf = (+v.pao2) / ((+v.fio2) / 100);
    let interp = 'Normal';
    let status = 'normal';
    if (pf <= 100) { interp = 'Severe ARDS'; status = 'critical'; }
    else if (pf <= 200) { interp = 'Moderate ARDS'; status = 'high'; }
    else if (pf <= 300) { interp = 'Mild ARDS'; status = 'low'; }
    return { primary: pf.toFixed(0), interpretation: interp + ' (Berlin P/F)', chip: status };
  },

  'iron-deficit'(v) {
    const w = +v.weight;
    // Ganzoni formula assumes Hb in g/dL; if SI mode Hb may be g/L — divide by 10
    const targetHb = +v.targetHb > 50 ? +v.targetHb / 10 : +v.targetHb;
    const currentHb = +v.currentHb > 50 ? +v.currentHb / 10 : +v.currentHb;
    const stores = w < 35 ? (15 * w) : 500;
    const deficit = w * (targetHb - currentHb) * 2.4 + stores;
    return { primary: Math.max(0, deficit).toFixed(0) + ' mg', interpretation: 'Ganzoni iron deficit (simplified) — Hb input treated as g/dL', chip: 'normal' };
  },

  'potassium-correction'(v) {
    const deficit = (+v.target - (+v.current)) * 0.4 * (+v.weight);
    return { primary: Math.max(0, deficit).toFixed(0) + ' mEq', interpretation: 'Estimated total body K⁺ deficit', chip: 'normal' };
  },

  'bicarbonate-deficit'(v) {
    const deficit = 0.5 * (+v.weight) * (24 - (+v.hco3));
    return { primary: Math.max(0, deficit).toFixed(0) + ' mEq', interpretation: 'HCO₃⁻ replacement estimate', chip: 'normal' };
  },

  'minute-ventilation'(v) {
    const ve = (+v.rr) * (+v.vt) / 1000;
    return { primary: ve.toFixed(1) + ' L/min', interpretation: 'Minute ventilation', chip: 'normal' };
  },

  'medication-dilution'(v) {
    const v2 = ((+v.c1) * (+v.v1)) / (+v.c2);
    return { primary: v2.toFixed(2) + ' mL', interpretation: 'Final volume for target concentration', chip: 'normal' };
  },

  reconstitution(v) {
    const vol = (+v.mass) / (+v.targetConc);
    return { primary: vol.toFixed(2) + ' mL', interpretation: 'Diluent volume to add', chip: 'normal' };
  },

  'intake-output'(v) {
    const balance = (+v.intake) - (+v.output);
    return {
      primary: (balance >= 0 ? '+' : '') + balance + ' mL',
      interpretation: balance > 500 ? 'Positive balance' : balance < -500 ? 'Negative balance — assess dehydration' : 'Near even balance',
      chip: balance < -500 ? 'high' : balance > 1000 ? 'low' : 'normal'
    };
  },

  edd(v) {
    if (!v.lmp) return { error: 'Enter LMP' };
    const lmp = new Date(v.lmp);
    const edd = new Date(lmp.getTime() + 280 * 86400000);
    return { primary: edd.toLocaleDateString(), interpretation: 'Estimated due date (Naegele\'s rule)', chip: 'normal' };
  },

  'bishop-score'(v) {
    const score = (+v.dilation || 0) + (+v.effacement || 0) + (+v.station || 0) + (+v.consistency || 0) + (+v.position || 0);
    return {
      primary: score + ' / 13',
      interpretation: score >= 8 ? 'Favorable cervix for induction' : score >= 6 ? 'Intermediate' : 'Unfavorable — may need ripening',
      chip: score >= 8 ? 'normal' : 'low'
    };
  },

  'protein-requirement'(v) {
    const protein = (+v.weight) * (+v.gPerKg);
    return { primary: protein.toFixed(0) + ' g/day', interpretation: 'Daily protein requirement', chip: 'normal' };
  },

  'enteral-feeding'(v) {
    const rate = (+v.dailyVol) / (+v.hours);
    return { primary: rate.toFixed(1) + ' mL/hr', interpretation: 'Enteral feeding rate', chip: 'normal' };
  },

  dehydration(v) {
    const deficit = (+v.weight) * (+v.percent) / 100 * 1000;
    return { primary: deficit.toFixed(0) + ' mL', interpretation: 'Estimated fluid deficit', chip: 'high' };
  },

  'ped-bsa-dose'(v) {
    const bsa = Math.sqrt(((+v.height) * (+v.weight)) / 3600);
    const dose = bsa * (+v.dosePerM2);
    return { primary: dose.toFixed(1) + ' mg', interpretation: 'BSA-based dose (' + bsa.toFixed(2) + ' m²)', chip: 'normal' };
  },

  'fluid-replacement'(v) {
    const ml = (+v.weight) * (+v.mlPerKg);
    return { primary: ml.toFixed(0) + ' mL', interpretation: 'Perioperative fluid estimate', chip: 'normal' };
  },

  'blood-loss'(v) {
    const ebv = +v.bloodVol || (+v.weight ? (+v.weight * 70) : 5000);
    const ebl = ebv * ((+v.preHb) - (+v.postHb)) / (((+v.preHb) + (+v.postHb)) / 2);
    return { primary: Math.max(0, ebl).toFixed(0) + ' mL', interpretation: 'Estimated blood loss (Gross formula) using EBV of ' + ebv.toFixed(0) + ' mL', chip: ebl > 1500 ? 'critical' : 'normal' };
  },

  'surg-blood-loss'(v) {
    return this['blood-loss'](v);
  },

  'surg-fluid'(v) {
    return this['fluid-replacement'](v);
  },

  'nutrition-req'(v) {
    return this['calorie-requirement'](v);
  },

  'lab-dilution'(v) {
    const v2 = ((+v.c1) * (+v.v1)) / (+v.c2);
    return { primary: 'Add to ' + v2.toFixed(2) + ' mL total', interpretation: 'C₁V₁ = C₂V₂', chip: 'normal' };
  },

  'lab-osmolality'(v) {
    return this.osmolality(v);
  },

  'aa-gradient'(v) {
    const pao2 = +v.pao2, fio2 = (+v.fio2) / 100, paco2 = +v.paco2;
    const pao2_alv = fio2 * (760 - 47) - paco2 / 0.8;
    const aag = pao2_alv - pao2;
    return { primary: aag.toFixed(0) + ' mmHg', interpretation: aag > 15 ? 'Elevated A-a gradient' : 'Normal A-a gradient', chip: aag > 15 ? 'high' : 'normal' };
  },

  'oxygen-requirement'(v) {
    const target = +v.targetSpo2;
    let fio2 = 21;
    if (target <= 90) fio2 = 28;
    else if (target <= 92) fio2 = 32;
    else if (target <= 94) fio2 = 36;
    else if (target <= 96) fio2 = 40;
    else fio2 = 44;
    return { primary: fio2 + '%', interpretation: 'Approximate FiO₂ for target SpO₂', chip: 'normal' };
  },

  'fio2-calculator'(v) {
    const devices = { nc1: 24, nc2: 28, nc3: 32, nc4: 36, nc5: 40, nc6: 44, mask: 50, nrb: 90 };
    const fio2 = devices[v.device] || 21;
    return { primary: fio2 + '%', interpretation: 'Estimated FiO₂ by device', chip: 'normal' };
  },

  'oxygen-delivery'(v) {
    return this['fio2-calculator'](v);
  },

  'cardiac-output'(v) {
    const co = ((+v.hr) * (+v.sv)) / 1000;
    return { primary: co.toFixed(2) + ' L/min', interpretation: 'Cardiac output (CO = HR × SV)', chip: co < 4 ? 'low' : co > 8 ? 'high' : 'normal' };
  },

  timi(v) {
    let score = 0;
    if (v.age65) score++;
    if (v.risk3) score++;
    if (v.st) score++;
    if (v.stDeviation) score++;
    if (v.angina) score++;
    if (v.asa) score++;
    if (v.enzymes) score++;
    const risk = ['4.7%', '4.7%', '8.3%', '13.2%', '19.9%', '26.2%', '40.9%', '40.9%'];
    return { primary: score + ' / 7', interpretation: '14-day event risk ~' + risk[score], chip: score >= 4 ? 'critical' : score >= 2 ? 'high' : 'normal' };
  },

  'heart-score'(v) {
    let score = 0;
    if (v.history) score += 2;
    if (v.ecg) score += 2;
    if (v.age) score += 2;
    if (v.risk) score += 2;
    if (v.troponin) score += 2;
    const risk = score <= 3 ? 'Low (1.7% MACE at 6 weeks)' : score <= 6 ? 'Moderate (16.6% MACE)' : 'High (50%+ MACE)';
    return {
      primary: score + ' / 10',
      interpretation: risk,
      chip: score >= 7 ? 'critical' : score >= 4 ? 'high' : 'normal',
      details: [{ label: '⚠️ Scoring Note', value: 'This is a simplified binary model assigning 0 or 2 points per category. Consult formal 0/1/2 scoring for complex patients.' }]
    };
  },

  'dopamine-infusion'(v) {
    const rate = ((+v.dose) * (+v.weight) * 60) / (+v.concentration * 1000);
    return { primary: rate.toFixed(2) + ' mL/hr', interpretation: 'Dopamine infusion rate', chip: 'normal' };
  },

  'norepi-infusion'(v) {
    const result = this['dopamine-infusion'](v);
    if (!result.error) {
      result.details = (result.details || []).concat([
        { label: '⚠️ Concentration Warning', value: 'Norepinephrine standard concentration (4–8 mg/250 mL = 16–32 mcg/mL) differs greatly from dopamine (400 mg/250 mL = 1600 mcg/mL). Enter the correct norepinephrine concentration above.' }
      ]);
    }
    return result;
  },

  insulin(v) {
    const correction = (+v.bg - (+v.target)) / (+v.isf);
    return { primary: Math.max(0, correction).toFixed(1) + ' units', interpretation: 'Insulin correction dose', chip: 'normal' };
  },

  'insulin-dose'(v) {
    return this.insulin(v);
  },

  transfusion(v) {
    const units = ((+v.targetHb) - (+v.currentHb)) * (+v.weight) / 14.14;
    return {
      primary: Math.max(0, units).toFixed(1) + ' units PRBC',
      interpretation: 'Estimated transfusion requirement (Oxford equation with 14.14 divisor). Standard adult rule: 1 unit PRBC raises Hb by ~1 g/dL.',
      chip: units > 4 ? 'critical' : 'normal'
    };
  },

  'burn-tbsa'(v) {
    const pct = (+v.head || 0) + (+v.trunkFront || 0) + (+v.trunkBack || 0) + (+v.armL || 0) + (+v.armR || 0) + (+v.legL || 0) + (+v.legR || 0) + (+v.groin || 0);
    return { primary: pct + '% TBSA', interpretation: pct > 20 ? 'Major burn — consider burn center' : 'Rule of Nines estimate', chip: pct > 20 ? 'critical' : pct > 10 ? 'high' : 'normal' };
  },

  rass(v) {
    const score = +v.score;
    const labels = {
      4: 'Combative', 3: 'Very agitated', 2: 'Agitated', 1: 'Restless', 0: 'Alert & calm',
      '-1': 'Drowsy', '-2': 'Light sedation', '-3': 'Moderate sedation', '-4': 'Deep sedation', '-5': 'Unarousable'
    };
    return { primary: score + '', interpretation: labels[score] || 'RASS score', chip: score >= 2 ? 'high' : score <= -3 ? 'low' : 'normal' };
  },

  mallampati(v) {
    const cls = +v.class;
    const labels = { 1: 'Full uvula visible', 2: 'Partial uvula', 3: 'Soft palate only', 4: 'Hard palate only' };
    return { primary: 'Class ' + cls, interpretation: labels[cls] + (cls >= 3 ? ' — difficult airway risk' : ''), chip: cls >= 3 ? 'high' : 'normal' };
  },

  'pain-scale'(v) {
    const n = +v.score;
    let interp = 'Mild pain';
    if (n === 0) interp = 'No pain';
    else if (n <= 3) interp = 'Mild pain';
    else if (n <= 6) interp = 'Moderate pain';
    else interp = 'Severe pain';
    return { primary: n + ' / 10', interpretation: interp, chip: n >= 7 ? 'critical' : n >= 4 ? 'high' : 'normal' };
  },

  osmolarity(v) {
    // Convert glucose to mg/dL if in SI mode (mmol/L) before applying divisors
    const osm = (+v.na) * 2 + (+v.glucose) / 18 + (+v.bun) / 2.8;
    return { primary: osm.toFixed(0) + ' mOsm/L', interpretation: 'Calculated osmolarity', chip: 'normal' };
  },

  news2(v) {
    let score = 0;
    const rr = +v.rr, spo2 = +v.spo2, sbp = +v.sbp, hr = +v.hr, temp = +v.temp;
    if (rr <= 8) score += 3; else if (rr <= 11) score += 1; else if (rr <= 20) score += 0; else if (rr <= 24) score += 2; else score += 3;
    if (spo2 <= 91) score += 3; else if (spo2 <= 93) score += 2; else if (spo2 <= 95) score += 1;
    if (sbp <= 90) score += 3; else if (sbp <= 100) score += 2; else if (sbp <= 110) score += 1; else if (sbp >= 220) score += 3;
    if (hr <= 40) score += 3; else if (hr <= 50) score += 1; else if (hr <= 90) score += 0; else if (hr <= 110) score += 1; else if (hr <= 130) score += 2; else score += 3;
    if (temp <= 35) score += 3; else if (temp <= 36) score += 1; else if (temp <= 38) score += 0; else if (temp <= 39) score += 1; else score += 2;
    if (v.oxygen) score += 2;
    if (v.consciousness !== 'alert') score += 3;
    return {
      primary: score + ' points',
      interpretation: score >= 7 ? 'High clinical risk — urgent response' : score >= 5 ? 'Medium risk — urgent review' : score >= 1 ? 'Low-medium risk' : 'Low risk',
      chip: score >= 7 ? 'critical' : score >= 5 ? 'high' : 'normal'
    };
  },

  sofa(v) {
    let score = 0;
    const pao2fio2 = (+v.pao2) / ((+v.fio2) / 100);
    if (pao2fio2 < 100) score += 4; else if (pao2fio2 < 200) score += 3; else if (pao2fio2 < 300) score += 2; else if (pao2fio2 < 400) score += 1;
    const plt = +v.platelets;
    if (plt < 20) score += 4; else if (plt < 50) score += 3; else if (plt < 100) score += 2; else if (plt < 150) score += 1;
    const bili = +v.bilirubin;
    if (bili >= 12) score += 4; else if (bili >= 6) score += 3; else if (bili >= 2) score += 2; else if (bili >= 1.2) score += 1;
    const mapVal = +v.map;
    if (+v.vasopressors === 3) score += 4;
    else if (+v.vasopressors === 2) score += 3;
    else if (+v.vasopressors === 1) score += 2;
    else if (mapVal < 70) score += 1;
    const gcs = +v.gcs;
    if (gcs < 6) score += 4; else if (gcs < 10) score += 3; else if (gcs < 13) score += 2; else if (gcs < 15) score += 1;
    const cr = +v.creatinine;
    if (cr >= 5) score += 4; else if (cr >= 3.5) score += 3; else if (cr >= 2) score += 2; else if (cr >= 1.2) score += 1;
    return {
      primary: score + ' points',
      interpretation: score >= 6 ? 'Mortality ~25%+ (sepsis context)' : 'SOFA organ dysfunction score',
      chip: score >= 6 ? 'critical' : score >= 3 ? 'high' : 'normal'
    };
  }
};

// Resolve alias lookups
const _origCompute = CalcCompute.compute.bind(CalcCompute);
CalcCompute.compute = function(id, vals) {
  const alias = CalcCompute._aliases[id];
  if (alias && typeof CalcCompute[alias] === 'function') {
    return CalcCompute[alias](vals);
  }
  if (typeof CalcCompute[id] === 'function') {
    return CalcCompute[id](vals);
  }
  return { error: 'Calculator not implemented' };
};
