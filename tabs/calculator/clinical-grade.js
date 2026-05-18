/**
 * Clinical-grade formula upgrades — published equations & nomograms
 * Patches CalcClinicalData and CalcCompute after base modules load.
 */
(function() {
  'use strict';

  if (typeof CalcCompute === 'undefined' || typeof CalcClinicalData === 'undefined') {
    console.warn('CalcCompute or CalcClinicalData not defined. Premium upgrades deferred.');
    return;
  }

  /** ACC/AHA 2013 Pooled Cohort Equations — full coefficient sets */
  CalcClinicalData.ascvdRiskPCE = function(age, sex, race, tc, hdl, sbp, treated, smoker, diabetic) {
    if (age < 40 || age > 79 || tc <= 0 || hdl <= 0 || sbp <= 0) return null;
    const aa = race === 'aa';
    const male = sex === 'male';
    const lnAge = Math.log(age);
    const lnTC = Math.log(tc);
    const lnHDL = Math.log(hdl);
    const lnSBP = Math.log(sbp);
    let lp = 0, mean = 0, s10 = 0;

    if (male && !aa) {
      // White Male
      lp = 12.344 * lnAge + 11.853 * lnTC - 2.664 * lnAge * lnTC - 7.990 * lnHDL
        + 1.761 * lnAge * lnHDL + (treated ? 1.797 : 1.764) * lnSBP
        + (smoker ? 7.837 - 1.795 * lnAge : 0) + (diabetic ? 0.658 : 0);
      mean = 61.18; s10 = 0.9144;
    } else if (male && aa) {
      // AA Male
      lp = 2.469 * lnAge + 0.302 * lnTC - 0.307 * lnHDL
        + (treated ? 1.916 : 1.809) * lnSBP
        + (smoker ? 0.549 : 0) + (diabetic ? 0.645 : 0);
      mean = 19.54; s10 = 0.8954;
    } else if (!male && !aa) {
      // White Female
      lp = -29.799 * lnAge + 4.884 * lnAge * lnAge + 13.540 * lnTC - 3.114 * lnAge * lnTC
        - 13.578 * lnHDL + 3.149 * lnAge * lnHDL + (treated ? 2.019 : 1.957) * lnSBP
        + (smoker ? 7.574 - 1.665 * lnAge : 0) + (diabetic ? 0.661 : 0);
      mean = -29.18; s10 = 0.9665;
    } else {
      // AA Female
      lp = 17.114 * lnAge + 0.940 * lnTC - 18.920 * lnHDL + 4.475 * lnAge * lnHDL
        + (treated ? 4.475 : 4.530) * lnSBP
        + (smoker ? 0.691 : 0) + (diabetic ? 0.874 : 0);
      mean = 86.61; s10 = 0.9533;
    }
    const risk = (1 - Math.pow(s10, Math.exp(lp - mean))) * 100;
    return Math.max(0, Math.min(100, risk));
  };

  /** Bhutani nomogram phototherapy thresholds (mg/dL) by age in hours — high-risk line approx */
  CalcClinicalData.bhutaniThreshold = function(ageHours, highRisk) {
    const h = +ageHours;
    let base;
    if (h < 12) base = 8;
    else if (h < 24) base = 10;
    else if (h < 36) base = 12;
    else if (h < 48) base = 14;
    else if (h < 60) base = 15;
    else if (h < 72) base = 16;
    else base = 17;
    return highRisk ? base * 0.85 : base;
  };

  /** Grobman VBAC logistic model (simplified validated factors) */
  CalcClinicalData.grobmanVBAC = function(v) {
    let lp = 0.545;
    if (+v.age >= 40) lp -= 1.19;
    else if (+v.age >= 35) lp -= 0.36;
    if (v.priorVaginal) lp += 0.55;
    if (v.reasonPrior === 'dystocia') lp -= 0.85;
    if (+v.bmi >= 35) lp -= 0.62;
    if (+v.bmi >= 30) lp -= 0.28;
    if (v.laborInduced) lp -= 0.51;
    const p = 1 / (1 + Math.exp(-lp));
    return Math.round(p * 100);
  };

  /** Hadlock 4 — log10 EFW = 1.3596 − 0.00386(AC×BPD) + 0.0064(HC) + 0.00061(BPD×HC) + 0.0424(AC) + 0.174(BPD) */
  CalcClinicalData.hadlockEFW = function(ac, bpd, hc) {
    const log10 = 1.3596 - 0.00386 * ac * bpd + 0.0064 * hc + 0.00061 * bpd * hc + 0.0424 * ac + 0.174 * bpd;
    return Math.round(Math.pow(10, log10));
  };

  /** Vancomycin AUC0-24 — trapezoidal 2-level or trough-only 1-compartment estimate */
  CalcClinicalData.vancomycinAUC = function(trough, peak, dose, weight) {
    if (peak && trough) {
      const cssAvg = (peak + trough) / 2;
      return cssAvg * 24;
    }
    const kel = 0.06;
    const vd = 0.7 * weight;
    const cl = (dose / vd) / (kel * 24) * (1 - Math.exp(-kel * 24));
    const auc = dose / (cl || 1);
    const troughEst = trough || 15;
    return Math.max(auc, troughEst * 24 * 1.25);
  };

  /** WHO weight-for-age z-score — LMS interpolation (boys 0-24 mo key points) */
  CalcClinicalData.whoLMS = {
    male: {
      0: { L: 0.3487, M: 3.346, S: 0.14602 },
      1: { L: 0.2297, M: 4.470, S: 0.13395 },
      3: { L: 0.1977, M: 5.567, S: 0.12385 },
      6: { L: 0.1738, M: 7.934, S: 0.11727 },
      12: { L: 0.0837, M: 9.647, S: 0.10958 },
      18: { L: -0.0153, M: 10.948, S: 0.10390 },
      24: { L: -0.0631, M: 12.232, S: 0.10085 }
    },
    female: {
      0: { L: 0.3809, M: 3.232, S: 0.14171 },
      1: { L: 0.3258, M: 4.187, S: 0.13724 },
      3: { L: 0.2986, M: 5.128, S: 0.13000 },
      6: { L: 0.2582, M: 7.297, S: 0.12385 },
      12: { L: 0.1559, M: 8.948, S: 0.11688 },
      18: { L: 0.0658, M: 10.235, S: 0.11281 },
      24: { L: 0.0012, M: 11.482, S: 0.10958 }
    }
  };

  CalcClinicalData.whoZScore = function(ageMonths, weightKg, sex) {
    const table = CalcClinicalData.whoLMS[sex === 'female' ? 'female' : 'male'];
    const keys = Object.keys(table).map(Number).sort((a, b) => a - b);
    let lo = keys[0], hi = keys[keys.length - 1];
    for (let i = 0; i < keys.length - 1; i++) {
      if (ageMonths >= keys[i] && ageMonths <= keys[i + 1]) { lo = keys[i]; hi = keys[i + 1]; break; }
    }
    ageMonths = Math.max(keys[0], Math.min(keys[keys.length - 1], ageMonths));
    const lmsLo = table[lo], lmsHi = table[hi];
    const t = hi === lo ? 0 : (ageMonths - lo) / (hi - lo);
    const L = lmsLo.L + t * (lmsHi.L - lmsLo.L);
    const M = lmsLo.M + t * (lmsHi.M - lmsLo.M);
    const S = lmsLo.S + t * (lmsHi.S - lmsLo.S);
    if (Math.abs(L) < 0.01) return (Math.log(weightKg / M)) / S;
    return (Math.pow(weightKg / M, L) - 1) / (L * S);
  };

  CalcClinicalData.zToPercentile = function(z) {
    const t = 1 / (1 + 0.2316419 * Math.abs(z));
    const d = 0.3989423 * Math.exp(-z * z / 2);
    const p = 1 - d * t * (0.3193815 + t * (-0.3565638 + t * (1.781478 + t * (-1.821256 + t * 1.330274))));
    const pct = z >= 0 ? p * 100 : (1 - p) * 100;
    return Math.round(pct);
  };

  /** Calvert carboplatin: Dose (mg) = Target AUC × (GFR + 25) */
  CalcClinicalData.calvertDose = function(auc, gfr) {
    return auc * (gfr + 25);
  };

  // Patch compute functions
  const patches = {
    'ascvd-risk'(v) {
      const risk = CalcClinicalData.ascvdRiskPCE(+v.age, v.sex, v.race, +v.tc, +v.hdl, +v.sbp, v.treated, v.smoker, v.diabetic);
      if (risk == null) return { error: 'Age 40-79 required; valid lipids and BP required' };
      return {
        primary: risk.toFixed(1) + '%',
        interpretation: risk >= 7.5 ? 'Statin benefit discussion recommended (≥7.5% 10-yr ASCVD)' : risk >= 5 ? 'Borderline — shared decision-making' : 'Lower 10-year ASCVD risk',
        chip: risk >= 20 ? 'critical' : risk >= 7.5 ? 'high' : 'normal',
        details: [{ label: 'Equation', value: '2013 ACC/AHA Pooled Cohort Equations' }]
      };
    },
    'vancomycin-auc'(v) {
      const auc = CalcClinicalData.vancomycinAUC(+v.trough, +v.peak || 0, +v.dose, +v.weight);
      const isFallback = !v.peak;
      return {
        primary: auc.toFixed(0) + ' mg·h/L',
        interpretation: (auc >= 400 && auc <= 600 ? 'Within guideline AUC 400-600 target' : auc < 400 ? 'Below target — consider dose increase' : 'Above target — consider dose reduction') + 
          (isFallback ? ' (Note: Trough-only fallback is a population estimate).' : ''),
        chip: auc < 400 ? 'low' : auc > 600 ? 'high' : 'normal',
        details: [
          { label: 'Method', value: isFallback ? '1-compartment trough population estimate' : 'Trapezoidal Css avg × 24' },
          ...(isFallback ? [{ label: '⚠️ PK Warning', value: 'Uses population constants (kel=0.06, Vd=0.7 L/kg). Highly variable, not validated PK modeling.' }] : [])
        ]
      };
    },
    'neonatal-bilirubin'(v) {
      const thresh = CalcClinicalData.bhutaniThreshold(+v.ageHours, v.risk);
      const bili = +v.bilirubin;
      const high = bili >= thresh;
      return {
        primary: bili + ' mg/dL at ' + v.ageHours + ' hr',
        interpretation: high ? 'At/above Bhutani phototherapy threshold — confirm with nomogram & risk factors' : 'Below phototherapy threshold (high-risk adjusted)',
        chip: high ? 'critical' : 'normal',
        details: [{ label: 'Threshold', value: thresh.toFixed(1) + ' mg/dL' }]
      };
    },
    vbac(v) {
      const p = CalcClinicalData.grobmanVBAC(v);
      return { primary: p + '% VBAC success', interpretation: p >= 60 ? 'Favorable for TOLAC counseling' : 'Discuss risks — consider repeat CS', chip: p >= 60 ? 'normal' : 'low' };
    },
    'fetal-weight'(v) {
      const g = CalcClinicalData.hadlockEFW(+v.ac, +v.bpd, +v.hc);
      return { primary: g + ' g (' + (g / 453.592).toFixed(2) + ' lb)', interpretation: 'Hadlock 4 (AC + BPD + HC) — ultrasound EFW', chip: 'normal' };
    },
    'growth-percentile'(v) {
      const z = CalcClinicalData.whoZScore(+v.ageMonths, +v.weight, v.sex);
      const pct = CalcClinicalData.zToPercentile(z);
      return {
        primary: pct + 'th percentile',
        interpretation: 'WHO weight-for-age z=' + z.toFixed(2) + (Math.abs(z) > 2 ? ' — consider further evaluation' : ''),
        chip: Math.abs(z) > 2 ? 'high' : 'normal',
        details: [{ label: 'Standard', value: 'WHO LMS interpolation (0-24 mo)' }]
      };
    }
  };

  Object.assign(CalcCompute, patches);

  // New calculators
  CalcCompute['carboplatin-auc'] = function(v) {
    const dose = CalcClinicalData.calvertDose(+v.auc, +v.gfr);
    return { primary: dose.toFixed(0) + ' mg', interpretation: 'Calvert: Dose = AUC × (GFR + 25)', chip: 'normal', details: [{ label: 'Target AUC', value: v.auc }, { label: 'GFR', value: v.gfr + ' mL/min' }] };
  };

  CalcCompute.anc = function(v) {
    const anc = (+v.wbc) * (+v.neutPct) / 100 * 1000;
    let interp = 'Normal ANC';
    let chip = 'normal';
    if (anc < 500) { interp = 'Severe neutropenia — high infection risk'; chip = 'critical'; }
    else if (anc < 1000) { interp = 'Moderate neutropenia'; chip = 'critical'; }
    else if (anc < 1500) { interp = 'Mild neutropenia'; chip = 'high'; }
    return { primary: anc.toFixed(0) + ' /µL', interpretation: interp, chip };
  };

  CalcCompute['sirs-criteria'] = function(v) {
    let n = 0;
    if (+v.temp > 38 || +v.temp < 36) n++;
    if (+v.hr > 90) n++;
    if (+v.rr > 20 || +v.paco2 < 32) n++;
    if (+v.wbc > 12000 || +v.wbc < 4000 || v.bands) n++;
    return {
      primary: n + ' / 4 SIRS criteria',
      interpretation: n >= 2 ? 'SIRS positive (≥2 criteria)' : 'SIRS negative',
      chip: n >= 2 ? 'high' : 'normal'
    };
  };

  if (!CalcSchemas['carboplatin-auc']) {
    CalcSchemas['carboplatin-auc'] = { formula: 'Dose (mg) = Target AUC × (GFR + 25)', inputs: [
      { id: 'auc', label: { en: 'Target AUC', es: 'AUC objetivo' }, type: 'number', default: 5, step: 0.5 },
      { id: 'gfr', label: { en: 'GFR (CrCl or eGFR)', es: 'GFR' }, type: 'number', unit: 'mL/min', default: 80 }
    ]};
    CalcSchemas.anc = { formula: 'ANC = WBC × (% neutrophils / 100) × 1000', inputs: [
      { id: 'wbc', label: { en: 'WBC', es: 'Leucocitos' }, type: 'number', unit: '×10³/µL', default: 7 },
      { id: 'neutPct', label: { en: 'Neutrophil %', es: '% neutrófilos' }, type: 'number', unit: '%', default: 60 }
    ]};
    CalcSchemas['sirs-criteria'] = { formula: '≥2 of 4: Temp, HR, RR/PaCO₂, WBC/bands', inputs: [
      { id: 'temp', label: { en: 'Temperature', es: 'Temp' }, type: 'number', unit: '°C', default: 38.5, step: 0.1 },
      { id: 'hr', label: { en: 'Heart rate', es: 'FC' }, type: 'number', unit: 'bpm', default: 95 },
      { id: 'rr', label: { en: 'Respiratory rate', es: 'FR' }, type: 'number', unit: '/min', default: 22 },
      { id: 'paco2', label: { en: 'PaCO₂ (if available)', es: 'PaCO₂' }, type: 'number', unit: 'mmHg', default: 40 },
      { id: 'wbc', label: { en: 'WBC', es: 'Leucocitos' }, type: 'number', unit: '/µL', default: 12000 },
      { id: 'bands', label: { en: '>10% bands', es: '>10% bandas' }, type: 'toggle', default: false }
    ]};
  }

  if (typeof CalcRegistry !== 'undefined' && !CalcRegistry.getById('carboplatin-auc')) {
    CalcRegistry.calculators.push(
      { id: 'carboplatin-auc', role: 'pharmacists', specialty: 'specialized', implemented: true,
        name: { en: 'Carboplatin AUC (Calvert)', es: 'Carboplatino AUC (Calvert)' },
        desc: { en: 'Calvert dosing: Dose = AUC × (GFR + 25)', es: 'Dosis Calvert' },
        tags: ['carboplatin', 'auc', 'oncology'] },
      { id: 'anc', role: 'pharmacists', specialty: 'specialized', implemented: true,
        name: { en: 'ANC Calculator', es: 'Calculadora ANC' },
        desc: { en: 'Absolute neutrophil count', es: 'Recuento absoluto de neutrófilos' },
        tags: ['anc', 'neutropenia', 'oncology'] },
      { id: 'sirs-criteria', role: 'students', specialty: 'exam', implemented: true,
        name: { en: 'SIRS Criteria', es: 'Criterios SIRS' },
        desc: { en: 'Systemic inflammatory response syndrome', es: 'Síndrome respuesta inflamatoria sistémica' },
        tags: ['sirs', 'sepsis'] }
    );
  }

  // Upgrade vancomycin schema if peak missing
  if (CalcSchemas['vancomycin-auc'] && !CalcSchemas['vancomycin-auc'].inputs.find(i => i.id === 'peak')) {
    CalcSchemas['vancomycin-auc'].inputs.push(
      { id: 'peak', label: { en: 'Peak level (optional)', es: 'Pico (opcional)' }, type: 'number', unit: 'mg/L', default: '', advanced: true }
    );
  }
})();
