/** MediHelp — New Clinical Calculator Compute Logic (Batch 2) */
(function() {
  'use strict';

  // ── Cardiology ──
  CalcCompute['wells-dvt'] = function(v) {
    let score = 0;
    if (v.cancer) score += 1;
    if (v.paralysis) score += 1;
    if (v.bedridden) score += 1;
    if (v.tenderness) score += 1;
    if (v.swelling) score += 1;
    if (v.calf) score += 1;
    if (v.edema) score += 1;
    if (v.collateral) score += 1;
    if (v.hx) score += 1;
    if (v.alternative) score -= 2;

    // Score floored at 0 for display; -1 or -2 is clinically the same as 0 (unlikely)
    const displayScore = Math.max(score, 0);
    const prob = score >= 2 ? 'DVT Likely' : 'DVT Unlikely';
    return {
      primary: displayScore + ' points',
      interpretation: prob + (score >= 2 ? ' — Consider ultrasound.' : ' — Consider D-dimer if low probability.'),
      chip: score >= 2 ? 'high' : 'normal',
      details: [{ label: 'Risk Model', value: 'Wells Score for DVT (Simplified)' }]
    };
  };

  CalcCompute['rcri'] = function(v) {
    let score = 0;
    if (v.surgery) score += 1;
    if (v.ischemic) score += 1;
    if (v.chf) score += 1;
    if (v.cerebrovascular) score += 1;
    if (v.dm) score += 1;
    if (v.cr) score += 1;

    let risk = '';
    if (score === 0) risk = 'Class I (0.4% risk of major cardiac event)';
    else if (score === 1) risk = 'Class II (0.9% risk of major cardiac event)';
    else if (score === 2) risk = 'Class III (6.6% risk of major cardiac event)';
    else risk = 'Class IV (>11% risk of major cardiac event)';

    return {
      primary: score + ' predictors',
      interpretation: risk,
      chip: score >= 2 ? 'high' : 'normal',
      details: [{ label: 'Guideline', value: 'Revised Cardiac Risk Index (RCRI)' }]
    };
  };

  // ── Emergency Medicine ──
  CalcCompute['perc-rule'] = function(v) {
    const passed = !(v.age || v.hr || v.spo2 || v.dvt_hx || v.trauma || v.hemoptysis || v.hormone || v.leg);
    return {
      primary: passed ? 'PERC Negative' : 'PERC Positive',
      interpretation: passed ? 'PE ruled out. No D-dimer or imaging required (if low clinical gestalt).' : 'Cannot rule out PE. Consider D-dimer or imaging.',
      chip: passed ? 'normal' : 'high',
      details: [{ label: 'Criteria', value: passed ? 'All 8 criteria negative' : 'One or more criteria positive' }]
    };
  };

  CalcCompute['alvarado-score'] = function(v) {
    let score = 0;
    if (v.migratory) score += 1;
    if (v.anorexia) score += 1;
    if (v.nausea) score += 1;
    if (v.tenderness) score += 2;
    if (v.rebound) score += 1;
    if (v.temp) score += 1;
    if (v.leukocytosis) score += 2;
    if (v.shift) score += 1;

    let risk = score >= 7 ? 'High probability of appendicitis. Surgery likely indicated.' : score >= 5 ? 'Possible appendicitis. Consider observation or imaging.' : 'Low probability of appendicitis.';
    return {
      primary: score + ' points',
      interpretation: risk,
      chip: score >= 7 ? 'critical' : score >= 5 ? 'high' : 'normal',
      details: [{ label: 'MANTRELS', value: 'Migratory, Anorexia, Nausea, Tenderness(2), Rebound, Elevated Temp, Leukocytosis(2), Shift' }]
    };
  };

  CalcCompute['canadian-ct-head'] = function(v) {
    const highRisk = v.gcs || v.fracture || v.basilar || v.vomiting || v.age;
    const medRisk = v.amnesia || v.mechanism;
    const ct = highRisk || medRisk;

    let interp = highRisk ? 'High Risk for neurological intervention — CT Head indicated.' : medRisk ? 'Medium Risk for brain injury — CT Head indicated.' : 'Not indicated. Does not meet criteria for CT Head.';
    return {
      primary: ct ? 'CT Head Indicated' : 'CT Head Not Indicated',
      interpretation: interp,
      chip: highRisk ? 'critical' : medRisk ? 'high' : 'normal',
      details: [{ label: 'Exclusions', value: 'Age <16, bleeding disorder, focal neuro deficit, seizure.' }]
    };
  };

  CalcCompute['glasgow-blatchford'] = function(v) {
    let score = 0;
    // BUN thresholds are in mg/dL; convert from mmol/L if SI mode
    const bun = CalcUnits.system === 'SI' ? (+v.bun * 2.8) : +v.bun;  // mmol/L × 2.8 = mg/dL
    if (bun >= 18 && bun < 22.4) score += 2;
    else if (bun >= 22.4 && bun < 28) score += 3;
    else if (bun >= 28 && bun < 70) score += 4;
    else if (bun >= 70) score += 6;

    const hb = +v.hb;
    if (v.sex === 'male') {
      if (hb >= 12 && hb < 13) score += 1;
      else if (hb >= 10 && hb < 12) score += 3;
      else if (hb < 10) score += 6;
    } else {
      if (hb >= 10 && hb < 12) score += 1;
      else if (hb < 10) score += 6;
    }

    const sbp = +v.sbp;
    if (sbp >= 100 && sbp < 110) score += 1;
    else if (sbp >= 90 && sbp < 100) score += 2;
    else if (sbp < 90) score += 3;

    if (v.hr) score += 1;
    if (v.melena) score += 1;
    if (v.syncope) score += 2;
    if (v.hepatic) score += 2;
    if (v.hf) score += 2;

    const interp = score === 0 ? 'Low risk. May be suitable for outpatient management.' : 'High risk. Needs hospital admission and likely endoscopy.';
    return {
      primary: score + ' points',
      interpretation: interp,
      chip: score === 0 ? 'normal' : 'critical',
      details: [{ label: 'Risk', value: 'GBS > 0 requires intervention (transfusion, endoscopy, or surgery)' }]
    };
  };

  CalcCompute['lrinec-score'] = function(v) {
    let score = 0;
    if (+v.crp >= 150) score += 4;
    
    const wbc = +v.wbc;
    if (wbc >= 15000 && wbc < 25000) score += 1;
    else if (wbc >= 25000) score += 2;

    const hb = +v.hb;
    if (hb >= 11 && hb < 13.5) score += 1;
    else if (hb < 11) score += 2;

    if (+v.na < 135) score += 2;

    // Creatinine threshold is 1.6 mg/dL; convert µmol/L to mg/dL if SI mode
    const crMgDl = CalcUnits.system === 'SI'
      ? CalcUnits.GROUPS.creatinine.toUS(+v.cr)
      : +v.cr;
    if (crMgDl > 1.6) score += 2;

    // Glucose threshold is 180 mg/dL; convert mmol/L to mg/dL if SI mode
    const glucoseMgDl = CalcUnits.system === 'SI'
      ? CalcUnits.GROUPS.glucose.toUS(+v.glucose)
      : +v.glucose;
    if (glucoseMgDl > 180) score += 1;

    let risk = score >= 8 ? 'High risk (≥75% probability of Necrotizing Fasciitis)' : score >= 6 ? 'Intermediate risk (50-75% probability)' : 'Low risk (<50% probability)';
    return {
      primary: score + ' points',
      interpretation: risk,
      chip: score >= 8 ? 'critical' : score >= 6 ? 'high' : 'normal',
      details: [{ label: 'Action', value: score >= 6 ? 'Surgical consult recommended' : 'Monitor clinically' }]
    };
  };

  // ── Neurology ──
  CalcCompute['nihss'] = function(v) {
    const score = (+v.loc || 0) + (+v.loc_q || 0) + (+v.loc_cmd || 0) + (+v.gaze || 0) + (+v.visual || 0) + (+v.facial || 0) + (+v.arm_l || 0) + (+v.arm_r || 0) + (+v.leg_l || 0) + (+v.leg_r || 0) + (+v.ataxia || 0) + (+v.sensory || 0) + (+v.language || 0) + (+v.dysarthria || 0) + (+v.extinction || 0);
    
    let severity = 'No stroke symptoms';
    if (score > 0 && score <= 4) severity = 'Minor stroke';
    else if (score >= 5 && score <= 15) severity = 'Moderate stroke';
    else if (score >= 16 && score <= 20) severity = 'Moderate to severe stroke';
    else if (score >= 21) severity = 'Severe stroke';

    return {
      primary: score + ' points',
      interpretation: severity,
      chip: score >= 16 ? 'critical' : score >= 5 ? 'high' : 'normal',
      details: [{ label: 'Range', value: '0 - 42 points' }]
    };
  };

  CalcCompute['abcd2-score'] = function(v) {
    let score = 0;
    if (v.age) score += 1;
    if (v.bp) score += 1;
    score += +v.clinical;
    score += +v.duration;
    if (v.dm) score += 1;

    let risk = score >= 6 ? 'High 2-day stroke risk (8.1%)' : score >= 4 ? 'Moderate 2-day stroke risk (4.1%)' : 'Low 2-day stroke risk (1.0%)';
    return {
      primary: score + ' points',
      interpretation: risk,
      chip: score >= 6 ? 'critical' : score >= 4 ? 'high' : 'normal',
      details: [{ label: 'Action', value: score >= 4 ? 'Hospital admission generally recommended' : 'Outpatient evaluation' }]
    };
  };

  CalcCompute['four-score'] = function(v) {
    const score = (+v.eye || 0) + (+v.motor || 0) + (+v.brainstem || 0) + (+v.respiration || 0);
    return {
      primary: score + ' / 16 points',
      interpretation: 'Lower scores indicate deeper coma and poorer prognosis. In-hospital mortality is highly correlated with FOUR score.',
      chip: score <= 8 ? 'critical' : score <= 12 ? 'high' : 'normal',
      details: [
        { label: 'E/M/B/R', value: `${v.eye}/${v.motor}/${v.brainstem}/${v.respiration}` },
        { label: 'Note', value: 'Advantageous over GCS in intubated patients' }
      ]
    };
  };

  // ── Pulmonary / ICU ──
  CalcCompute['rox-index'] = function(v) {
    const spo2 = +v.spo2;
    const fio2 = +v.fio2 / 100; // convert to decimal
    const rr = +v.rr;
    if (!fio2 || !rr) return { error: 'FiO₂ and RR required' };

    const rox = (spo2 / fio2) / rr;
    const interp = rox >= 4.88 ? 'Low risk of HFNC failure. Continue monitoring.' : 'High risk of HFNC failure. Consider intubation.';
    
    return {
      primary: rox.toFixed(2),
      interpretation: interp,
      chip: rox < 4.88 ? 'critical' : 'normal',
      details: [{ label: 'Threshold', value: 'ROX ≥ 4.88 at 2, 6, or 12 hours predicts HFNC success' }]
    };
  };

  CalcCompute['rsbi'] = function(v) {
    const rr = +v.rr;
    const vt = +v.vt / 1000; // convert mL to L
    if (!rr) return { error: 'Enter respiratory rate' };
    if (!vt) return { error: 'Tidal volume required' };

    const rsbi = rr / vt;
    const interp = rsbi < 105 ? 'High likelihood of successful extubation.' : 'High risk of weaning failure.';

    return {
      primary: rsbi.toFixed(0) + ' breaths/min/L',
      interpretation: interp,
      chip: rsbi >= 105 ? 'high' : 'normal',
      details: [{ label: 'Threshold', value: '< 105 generally indicates readiness to wean' }]
    };
  };

  // ── Infectious Disease ──
  CalcCompute['centor-score'] = function(v) {
    let score = (+v.age || 0);
    if (v.fever) score += 1;
    if (v.exudate) score += 1;
    if (v.nodes) score += 1;
    if (v.cough) score += 1;

    let action = score <= 1 ? 'No testing or antibiotics indicated.' : score <= 3 ? 'Perform rapid strep test.' : 'Perform rapid strep test (empiric antibiotics not routinely recommended).';
    let prob = score <= 0 ? '1-2%' : score === 1 ? '5-10%' : score === 2 ? '11-17%' : score === 3 ? '28-35%' : '51-53%';

    return {
      primary: score + ' points',
      interpretation: action,
      chip: score >= 4 ? 'high' : score >= 2 ? 'normal' : 'low',
      details: [{ label: 'Strep Probability', value: prob }]
    };
  };

  // ── Renal / Acid-Base ──
  CalcCompute['fena-calculator'] = function(v) {
    const una = +v.una, sna = +v.sna;
    // SCr and UCr must be in the SAME unit; SCr goes through convertFormToSI but UCr (field 'ucr') does not
    // We normalize both to mg/dL for calculation
    const scr = CalcUnits.system === 'SI'
      ? CalcUnits.GROUPS.creatinine.toUS(+v.scr)   // µmol/L → mg/dL
      : +v.scr;
    const ucr = +v.ucr; // Urine creatinine always entered in mg/dL by convention
    if (!una || !sna || !ucr || !scr) return { error: 'Fill all fields' };

    const fena = (una * scr) / (sna * ucr) * 100;
    let cause = fena < 1 ? 'Prerenal disease (e.g., volume depletion)' : fena > 2 ? 'Acute Tubular Necrosis (ATN) / Intrinsic' : 'Indeterminate (1-2%)';

    return {
      primary: fena.toFixed(1) + ' %',
      interpretation: cause,
      chip: fena < 1 ? 'normal' : 'high',
      details: [{ label: 'Note', value: 'Diuretics invalidate FENa. Consider FEUrea if on diuretics.' }]
    };
  };

  CalcCompute['winters-formula'] = function(v) {
    const hco3 = +v.hco3, pco2 = +v.pco2;
    if (!hco3) return { error: 'HCO₃ required' };

    const expected = (1.5 * hco3) + 8;
    const min = expected - 2;
    const max = expected + 2;
    let interp = '';

    if (pco2) {
      if (pco2 < min) interp = 'Measured pCO₂ is lower than expected. Concurrent Primary Respiratory Alkalosis.';
      else if (pco2 > max) interp = 'Measured pCO₂ is higher than expected. Concurrent Primary Respiratory Acidosis.';
      else interp = 'Measured pCO₂ matches expected. Pure metabolic acidosis with adequate respiratory compensation.';
    }

    return {
      primary: min.toFixed(1) + ' - ' + max.toFixed(1) + ' mmHg',
      interpretation: interp || 'Expected pCO₂ range based on Winter\'s Formula.',
      chip: (!pco2 || (pco2 >= min && pco2 <= max)) ? 'normal' : 'critical',
      details: [{ label: 'Expected Target', value: expected.toFixed(1) + ' mmHg' }]
    };
  };

  CalcCompute['delta-gap'] = function(v) {
    const na = +v.na, cl = +v.cl, hco3 = +v.hco3;
    if (!na || !cl || !hco3) return { error: 'Fill all fields' };

    const ag = na - (cl + hco3);
    if (ag <= 12) return {
      primary: 'AG: ' + ag.toFixed(1) + ' mEq/L',
      interpretation: 'Anion gap is not elevated (≤12). Delta-gap ratio is undefined in the absence of an anion gap acidosis.',
      chip: ag < 8 ? 'low' : 'normal',
      details: [{ label: 'Note', value: 'Delta-gap ratio only applies when AG > 12' }]
    };
    if (hco3 >= 24) return {
      primary: 'AG: ' + ag.toFixed(1) + ' mEq/L',
      interpretation: 'HCO₃ ≥ 24 mEq/L: denominator is zero. No metabolic acidosis present.',
      chip: 'normal',
      details: [{ label: 'Note', value: 'Delta ratio undefined when HCO₃ ≥ 24' }]
    };
    const deltaAG = ag - 12;
    const deltaRatio = deltaAG / (24 - hco3);
    const correctedHco3 = hco3 + deltaAG;

    let interp = '';
    if (correctedHco3 < 22) interp = 'Concurrent non-anion gap metabolic acidosis';
    else if (correctedHco3 > 26) interp = 'Concurrent metabolic alkalosis';
    else interp = 'Pure high anion gap metabolic acidosis';

    return {
      primary: 'AG: ' + ag.toFixed(1) + ' | Δ/Δ: ' + deltaRatio.toFixed(2),
      interpretation: interp,
      chip: (deltaRatio < 0.8 || deltaRatio > 2.0) ? 'high' : 'normal',
      details: [{ label: 'Corrected HCO₃ (Delta Gap)', value: correctedHco3.toFixed(1) + ' mEq/L' }]
    };
  };

  CalcCompute['free-water-deficit'] = function(v) {
    const weight = +v.weight, na = +v.na;
    if (!weight || !na) return { error: 'Fill all fields' };

    const factor = v.sex === 'male' ? (v.age > 65 ? 0.5 : 0.6) : (v.age > 65 ? 0.45 : 0.5);
    const tbw = weight * factor;
    const deficit = tbw * ((na / 140) - 1);

    return {
      primary: deficit.toFixed(1) + ' Liters',
      interpretation: 'Free water deficit. Replenish slowly to avoid cerebral edema (max correction 10-12 mEq/L/day).',
      chip: deficit > 3 ? 'high' : 'normal',
      details: [
        { label: 'TBW Estimate', value: tbw.toFixed(1) + ' L' },
        { label: 'Correction Fluid', value: 'Use Enteral free water or IV D5W/half-normal saline.' }
      ]
    };
  };

  // ── OB/GYN ──
  CalcCompute['ovulation-calculator'] = function(v) {
    if (!v.lmp || !v.cycle) return { error: 'Fill all fields' };
    
    const lmpDate = new Date(v.lmp);
    const lutealPhase = 14;
    
    const ovulationDate = new Date(lmpDate);
    ovulationDate.setDate(ovulationDate.getDate() + (v.cycle - lutealPhase));
    
    const fertileStart = new Date(ovulationDate);
    fertileStart.setDate(fertileStart.getDate() - 5);
    
    const fertileEnd = new Date(ovulationDate);
    fertileEnd.setDate(fertileEnd.getDate() + 1);

    const options = { weekday: 'short', year: 'numeric', month: 'short', day: 'numeric' };
    return {
      primary: ovulationDate.toLocaleDateString(undefined, options),
      interpretation: `Estimated fertile window: ${fertileStart.toLocaleDateString(undefined, options)} to ${fertileEnd.toLocaleDateString(undefined, options)}`,
      chip: 'normal',
      details: [{ label: 'Note', value: 'Calculated assuming a 14-day luteal phase.' }]
    };
  };

  // ── Pharmacy ──
  CalcCompute['heparin-dosing'] = function(v) {
    const weight = +v.weight;
    if (!weight) return { error: 'Weight required' };
    
    let bolus, infusion;
    if (v.indication === 'vte') {
      bolus = weight * 80;
      infusion = weight * 18;
    } else { // ACS
      bolus = weight * 60;
      if (bolus > 4000) bolus = 4000; // max bolus 4000 units
      infusion = weight * 12;
      if (infusion > 1000) infusion = 1000; // max infusion 1000 units/hr
    }

    return {
      primary: `Bolus: ${bolus.toFixed(0)} units`,
      interpretation: `Initial Infusion: ${infusion.toFixed(0)} units/hr`,
      chip: 'normal',
      details: [
        { label: 'Protocol', value: v.indication === 'vte' ? '80 U/kg bolus + 18 U/kg/hr' : '60 U/kg bolus (max 4k) + 12 U/kg/hr (max 1k)' },
        { label: 'Dosing Weight', value: weight.toFixed(1) + ' kg' }
      ]
    };
  };

})();
