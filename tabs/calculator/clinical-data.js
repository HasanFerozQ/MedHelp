/**
 * Clinical reference data for calculator modules
 */
window.CalcClinicalData = {
  acls: {
    epinephrine: { adult: '1 mg IV/IO q3-5min', peds: '0.01 mg/kg (0.1 mL/kg of 1:10,000) IV/IO q3-5min' },
    amiodarone: { adult: '300 mg IV bolus, then 150 mg', peds: '5 mg/kg IV/IO bolus' },
    atropine: { adult: '1 mg IV (max 3 mg)', peds: '0.02 mg/kg (min 0.1 mg, max 0.5 mg child / 1 mg adolescent)' },
    lidocaine: { adult: '1-1.5 mg/kg IV, then 0.5-0.75 mg/kg', peds: '1 mg/kg IV/IO' },
    adenosine: { adult: '6 mg rapid IV, then 12 mg', peds: '0.1 mg/kg rapid IV (max 6 mg), then 0.2 mg/kg (max 12 mg)' },
    calcium: { adult: '1-3 g (10-30 mL) 10% IV', peds: '20 mg/kg (0.2 mL/kg) 10% IV/IO' },
    bicarb: { adult: '1 mEq/kg IV (select cases)', peds: '1 mEq/kg IV/IO (select cases)' },
    magnesium: { adult: '1-2 g IV (torsades)', peds: '25-50 mg/kg IV/IO (max 2 g)' }
  },

  pals: {
    epinephrine: { dose: 0.01, unit: 'mg/kg', route: 'IV/IO', freq: 'q3-5min' },
    amiodarone: { dose: 5, unit: 'mg/kg', route: 'IV/IO', max: '300 mg' },
    adenosine: { dose1: 0.1, dose2: 0.2, unit: 'mg/kg', route: 'IV rapid', max1: 6, max2: 12 },
    atropine: { dose: 0.02, unit: 'mg/kg', route: 'IV/IO', min: 0.1, max: 0.5 },
    lidocaine: { dose: 1, unit: 'mg/kg', route: 'IV/IO' }
  },

  intubation: {
    etomidate: { mgPerKg: 0.3 }, propofol: { mgPerKgAdult: 1.5, mgPerKgPeds: 2.5 },
    ketamine: { mgPerKg: 1.5 }, midazolam: { mgPerKg: 0.08 },
    succinylcholine: { mgPerKg: 1.5 }, rocuronium: { mgPerKg: 1.0 },
    vecuronium: { mgPerKg: 0.1 }, fentanyl: { mcgPerKg: 2 }
  },

  antidotes: {
    acetaminophen: { antidote: 'N-acetylcysteine', dose: '150 mg/kg IV load, then 50 mg/kg × 4 hr, then 100 mg/kg × 16 hr' },
    opioid: { antidote: 'Naloxone', dose: '0.04-0.4 mg IV/IM/IN q2-3min PRN' },
    benzodiazepine: { antidote: 'Flumazenil', dose: '0.2 mg IV over 30 sec (max 1 mg)' },
    digoxin: { antidote: 'Digoxin Fab', dose: 'Dose per level/empiric protocol' },
    tricyclic: { antidote: 'Sodium bicarbonate', dose: '1-2 mEq/kg IV for QRS >100 ms' },
    cyanide: { antidote: 'Hydroxocobalamin', dose: '5 g IV over 15 min' },
    methanol: { antidote: 'Fomepizole', dose: '15 mg/kg load, then 10 mg/kg q12h' },
    organophosphate: { antidote: 'Atropine + Pralidoxime', dose: 'Atropine 2-5 mg IV q5-10min' }
  },

  broselow: [
    { zone: 'Grey', lengthMin: 46, lengthMax: 59, weight: '3-5 kg' },
    { zone: 'Pink', lengthMin: 59, lengthMax: 74, weight: '6-7 kg' },
    { zone: 'Red', lengthMin: 74, lengthMax: 87, weight: '8-9 kg' },
    { zone: 'Purple', lengthMin: 87, lengthMax: 99, weight: '10-11 kg' },
    { zone: 'Yellow', lengthMin: 99, lengthMax: 112, weight: '12-14 kg' },
    { zone: 'White', lengthMin: 112, lengthMax: 125, weight: '15-18 kg' },
    { zone: 'Blue', lengthMin: 125, lengthMax: 137, weight: '19-23 kg' },
    { zone: 'Orange', lengthMin: 137, lengthMax: 150, weight: '24-29 kg' },
    { zone: 'Green', lengthMin: 150, lengthMax: 200, weight: '30+ kg' }
  ],

  antibioticRenal: {
    vancomycin: { gte90: '15-20 mg/kg q8-12h', '60-89': '15-20 mg/kg q12h', '30-59': '15-20 mg/kg q24h', lt30: '15-20 mg/kg q48h' },
    gentamicin: { gte90: '5-7 mg/kg q24h', '60-89': '5-7 mg/kg q36h', '30-59': '5-7 mg/kg q48h', lt30: '5-7 mg/kg q72h' },
    levofloxacin: { gte90: '500-750 mg q24h', '60-89': '500 mg q48h', lt30: '500 mg q48h' },
    meropenem: { gte90: '1 g q8h', '60-89': '1 g q12h', '30-59': '1 g q24h', lt30: '500 mg q24h' }
  },

  drugInteractions: [
    { a: 'Warfarin', b: 'NSAIDs', severity: 'Major', effect: 'Increased bleeding' },
    { a: 'Warfarin', b: 'Macrolides', severity: 'Major', effect: 'Increased INR' },
    { a: 'SSRI', b: 'MAOI', severity: 'Contraindicated', effect: 'Serotonin syndrome' },
    { a: 'Metformin', b: 'IV Contrast', severity: 'Major', effect: 'Hold metformin — lactic acidosis risk' },
    { a: 'ACE inhibitor', b: 'K-sparing diuretic', severity: 'Major', effect: 'Hyperkalemia' },
    { a: 'Simvastatin', b: 'Amiodarone', severity: 'Major', effect: 'Limit simvastatin 20 mg' },
    { a: 'Digoxin', b: 'Amiodarone', severity: 'Major', effect: 'Reduce digoxin ~50%' }
  ],

  tdm: {
    vancomycin: 'Trough 10-20 mg/L (15-20 serious infections)',
    gentamicin: 'Peak 20-40 mg/L; trough <1-2 mg/L',
    phenytoin: 'Total 10-20 mg/L; free 1-2 mg/L',
    lithium: '0.6-1.2 mEq/L acute; 0.6-1.0 maintenance',
    digoxin: '0.5-2 ng/mL',
    tacrolimus: '5-15 ng/mL (indication-specific)'
  },

  formulas: [
    { name: 'BMI', eq: 'weight(kg) / height(m)²' },
    { name: 'BSA (Mosteller)', eq: '√(height×weight/3600)' },
    { name: 'MAP', eq: '(SBP + 2×DBP) / 3' },
    { name: 'Anion Gap', eq: 'Na − (Cl + HCO₃)' },
    { name: 'Parkland', eq: '4 × kg × %TBSA' },
    { name: 'QTc (Bazett)', eq: 'QT / √(60/HR)' }
  ],

  diseaseCriteria: {
    sepsis3: 'Infection + SOFA increase ≥2 = sepsis; septic shock = sepsis + vasopressors + lactate >2',
    sirs: '≥2: T abnormal, HR>90, RR>20 or PaCO₂<32, WBC abnormal',
    dka: 'Glucose >250, pH <7.3, HCO₃ <18, ketosis, elevated AG',
    stemi: 'STEMI: ischemic symptoms + ST elevation ≥1 mm in ≥2 contiguous leads or new LBBB'
  },

  diagnosticScores: {
    'Wells PE': '≤4 PE unlikely; >4 PE likely',
    'CURB-65': '0-1 outpatient; 2 admit; ≥3 ICU',
    'CHADS₂-VASc': '≥2 typically anticoagulate for AF stroke prevention',
    'HEART': '0-3 low; 4-6 moderate; 7-10 high MACE risk'
  },

  labRanges: {
    sodium: { low: 135, high: 145, unit: 'mEq/L' },
    potassium: { low: 3.5, high: 5.0, unit: 'mEq/L' },
    glucose: { low: 70, high: 126, unit: 'mg/dL fasting' },
    creatinine: { high: 1.2, unit: 'mg/dL' },
    hemoglobin: { lowM: 13, lowF: 12, unit: 'g/dL' }
  },

  whoWeightMedian: { 0: 3.3, 3: 6.4, 6: 7.9, 12: 9.6, 18: 11.1, 24: 12.2 },

  mac: { sevoflurane: { neonate: 3.3, infant: 2.5, child: 2.0, adult: 2.0 }, isoflurane: { neonate: 1.6, infant: 1.6, child: 1.6, adult: 1.15 } }
};

CalcClinicalData.egfr2021 = function(scr, age, female) {
  const k = female ? 0.7 : 0.9;
  const alpha = female ? -0.241 : -0.302;
  const ratio = scr / k;
  return 142 * Math.pow(Math.min(ratio, 1), alpha) * Math.pow(Math.max(ratio, 1), -1.2) * Math.pow(0.9938, age) * (female ? 1.012 : 1);
};

CalcClinicalData.interpretABG = function(ph, pco2, hco3) {
  ph = +ph; pco2 = +pco2; hco3 = +hco3;
  const out = [];
  if (ph < 7.35) {
    if (pco2 > 45 && hco3 >= 22) out.push('Primary respiratory acidosis' + (hco3 > 26 ? ' with metabolic compensation' : ''));
    else if (hco3 < 22 && pco2 <= 40) out.push('Primary metabolic acidosis' + (pco2 < 35 ? ' with respiratory compensation' : ''));
    else if (pco2 > 45 && hco3 < 22) out.push('Mixed respiratory + metabolic acidosis');
    else out.push('Acidemia — assess primary disorder');
  } else if (ph > 7.45) {
    if (pco2 < 35 && hco3 <= 26) out.push('Primary respiratory alkalosis' + (hco3 > 26 ? ' with metabolic compensation' : ''));
    else if (hco3 > 26 && pco2 >= 35) out.push('Primary metabolic alkalosis' + (pco2 > 45 ? ' with respiratory compensation' : ''));
    else out.push('Alkalemia — assess primary disorder');
  } else {
    if (pco2 > 45 && hco3 > 26) out.push('Compensated respiratory acidosis');
    else if (pco2 < 35 && hco3 < 22) out.push('Compensated respiratory alkalosis');
    else if (hco3 > 26) out.push('Compensated metabolic alkalosis');
    else if (hco3 < 22) out.push('Compensated metabolic acidosis');
    else out.push('Normal acid-base status');
  }
  return out;
};

CalcClinicalData.ascvdRisk = function(age, sex, race, tc, hdl, sbp, treated, smoker, diabetic) {
  if (age < 40 || age > 79) return null;
  const aa = race === 'aa', male = sex === 'male';
  let c, s10;
  if (male && !aa) { c = { a: 12.344, t: 11.853, h: -7.990, s: treated ? 1.797 : 1.764, sm: 7.837, d: 0.658, b: -61.18, m: 0.9144 }; }
  else if (male && aa) { c = { a: 2.469, t: 0.302, h: -0.307, s: treated ? 1.916 : 1.809, sm: 0.549, d: 0.645, b: -19.54, m: 0.8954 }; }
  else if (!male && !aa) { c = { a: -29.799, t: 13.540, h: -13.578, s: treated ? 2.019 : 1.957, sm: 7.574, d: 0.661, b: -29.18, m: 0.9665 }; }
  else { c = { a: 17.114, t: 0.940, h: -18.920, s: treated ? 4.475 : 4.530, sm: 0.691, d: 0.874, b: -86.61, m: 0.9533 }; }
  const lp = c.a * Math.log(age) + c.t * Math.log(tc) + c.h * Math.log(hdl) + c.s * Math.log(sbp) + (smoker ? c.sm : 0) + (diabetic ? c.d : 0);
  s10 = (1 - Math.pow(c.m, Math.exp(lp - c.b))) * 100;
  return Math.max(0, Math.min(100, s10));
};

CalcClinicalData.morseFall = function(v) {
  let s = 0;
  if (v.history) s += 25;
  if (v.secondary) s += 15;
  if (v.ambulatory === 'weak') s += 10;
  if (v.ambulatory === 'impaired') s += 20;
  if (v.iv) s += 20;
  if (v.gait === 'weak') s += 10;
  if (v.gait === 'impaired') s += 20;
  if (v.mental) s += 15;
  return s;
};

CalcClinicalData.vbacScore = function(v) {
  let p = 70;
  if (+v.age >= 40) p -= 15; else if (+v.age >= 35) p -= 5;
  if (v.priorVaginal) p += 10;
  if (v.reasonPrior === 'dystocia') p -= 15;
  if (+v.bmi >= 35) p -= 10;
  if (v.laborInduced) p -= 10;
  return Math.max(5, Math.min(95, p));
};

CalcClinicalData.lemonScore = function(v) {
  let s = 0;
  if (v.look === 'abnormal') s += 2;
  if (v.evaluation === 'abnormal') s += 2;
  if (+v.mallampati >= 3) s += 2;
  if (v.obstruction) s += 2;
  if (v.neck === 'limited') s += 2;
  return s;
};

CalcClinicalData.apacheII = function(v) {
  const D = CalcClinicalData;
  let s = 0;
  const t = +v.temp, map = +v.map, hr = +v.hr, rr = +v.rr;
  s += t >= 41 ? 4 : t >= 39 ? 3 : t >= 38.5 ? 1 : t >= 36 ? 0 : t >= 34 ? 1 : t >= 32 ? 2 : t >= 30 ? 3 : 4;
  s += map >= 160 ? 4 : map >= 130 ? 3 : map >= 110 ? 2 : map >= 70 ? 0 : map >= 50 ? 2 : 4;
  s += hr >= 180 ? 4 : hr >= 140 ? 3 : hr >= 110 ? 2 : hr >= 70 ? 0 : hr >= 55 ? 2 : 4;
  s += rr >= 50 ? 4 : rr >= 35 ? 3 : rr >= 25 ? 1 : rr >= 12 ? 0 : rr >= 10 ? 1 : rr >= 6 ? 2 : 4;
  const fio2 = +v.fio2, pao2 = +v.pao2, aao2 = +v.aao2;
  if (fio2 >= 50) s += aao2 >= 500 ? 4 : aao2 >= 350 ? 3 : aao2 >= 200 ? 2 : 0;
  else s += pao2 < 55 ? 4 : pao2 < 60 ? 3 : pao2 < 70 ? 1 : 0;
  const ph = +v.ph;
  s += ph >= 7.7 ? 4 : ph >= 7.6 ? 3 : ph >= 7.5 ? 1 : ph >= 7.33 ? 0 : ph >= 7.25 ? 2 : ph >= 7.15 ? 3 : 4;
  const na = +v.sodium;
  s += na >= 180 ? 4 : na >= 160 ? 3 : na >= 155 ? 2 : na >= 150 ? 1 : na >= 130 ? 0 : na >= 120 ? 2 : 4;
  const k = +v.potassium;
  s += k >= 7 ? 4 : k >= 6 ? 3 : k >= 5.5 ? 1 : k >= 3.5 ? 0 : k >= 3 ? 1 : k >= 2.5 ? 2 : 4;
  let crPts = (+v.creatinine >= 3.5) ? 4 : (+v.creatinine >= 2) ? 3 : (+v.creatinine >= 1.5) ? 2 : (+v.creatinine >= 0.6) ? 0 : 2;
  if (v.arf) crPts = Math.min(4, crPts * 2);
  s += crPts;
  const hct = +v.hct;
  s += hct >= 60 ? 4 : hct >= 50 ? 2 : hct >= 46 ? 1 : hct >= 30 ? 0 : hct >= 20 ? 2 : 4;
  const wbc = +v.wbc;
  s += wbc >= 40 ? 4 : wbc >= 20 ? 2 : wbc >= 15 ? 1 : wbc >= 3 ? 0 : wbc >= 1 ? 2 : 4;
  s += 15 - Math.min(15, Math.max(3, +v.gcs));
  s += +v.agePoints || 0;
  s += +v.chronicPoints || 0;
  return s;
};

CalcClinicalData.hadlockEFW = function(ac, bpd) {
  const logEfw = 1.326 - 0.00326 * ac * bpd + 0.0107 * ac + 0.0438 * bpd + 0.158 * bpd;
  return Math.round(Math.pow(10, logEfw));
};

CalcClinicalData.crclBand = function(crcl) {
  if (crcl >= 90) return 'gte90';
  if (crcl >= 60) return '60-89';
  if (crcl >= 30) return '30-59';
  return 'lt30';
};
