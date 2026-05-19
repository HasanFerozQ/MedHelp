/** MediHelp — New Clinical Calculator Compute Logic */
(function() {
  'use strict';

  // ── Ottawa Rules ──
  CalcCompute['ottawa-rules'] = function(v) {
    const area = v.area;
    if (!area) return { error: 'Select area to assess (ankle, foot, or knee)' };
    let xray = false, reason = '';

    if (area === 'ankle') {
      xray = v.noWB || v.lateralMalleolus || v.medialMalleolus;
      if (xray) {
        reason = v.noWB ? 'Unable to weight-bear' :
          (v.lateralMalleolus && v.medialMalleolus) ? 'Lateral and medial malleolar tenderness' :
          v.lateralMalleolus ? 'Lateral malleolar bone tenderness' : 'Medial malleolar bone tenderness';
      } else { reason = 'No Ottawa criteria met'; }
    } else if (area === 'foot') {
      xray = v.noWB || v.base5th || v.navicular;
      if (xray) {
        reason = v.noWB ? 'Unable to weight-bear' :
          v.base5th ? '5th metatarsal base tenderness' : 'Navicular tenderness';
      } else { reason = 'No Ottawa criteria met'; }
    } else if (area === 'knee') {
      xray = v.age55 || v.patellar || v.fibular || v.cantFlex90 || v.noWB;
      reason = xray ? 'Ottawa Knee criteria positive' : 'No Ottawa criteria met';
    }

    return {
      primary: xray ? 'X-ray INDICATED' : 'X-ray NOT indicated',
      interpretation: reason + '. Ottawa Rules have ~99% sensitivity for clinically significant fractures.',
      chip: xray ? 'high' : 'normal',
      details: [{ label: 'Area assessed', value: area.charAt(0).toUpperCase() + area.slice(1) }]
    };
  };

  // ── PECARN Head CT ──
  CalcCompute['pecarn-head-ct'] = function(v) {
    const lt2 = v.ageGroup === 'lt2';
    let highRisk = false, intRisk = false, label = '', interp = '';

    if (lt2) {
      highRisk = v.gcsLt15 || v.palpableSkullFx || v.actingAbnormal;
      intRisk = !highRisk && (v.occipitalHematoma || v.locGt5s || v.mechanism === 'severe');
    } else {
      highRisk = v.gcsLt15 || v.basilarSkull;
      intRisk = !highRisk && (v.anyLoc || v.vomiting || v.severeHeadache || v.mechanism === 'severe');
    }

    if (highRisk) { label = 'CT Recommended'; interp = 'High-risk features — CT head recommended.'; }
    else if (intRisk) { label = 'CT vs Observation'; interp = 'Intermediate risk — CT or observation based on clinical judgement.'; }
    else { label = 'CT Not Indicated'; interp = 'Low risk — CT not indicated. Risk of clinically important TBI <0.02%.'; }

    return {
      primary: label,
      interpretation: interp,
      chip: highRisk ? 'critical' : intRisk ? 'high' : 'normal',
      details: [{ label: 'Age group', value: lt2 ? '<2 years' : '2–18 years' }]
    };
  };

  // ── Revised Geneva Score ──
  CalcCompute['revised-geneva'] = function(v) {
    let score = 0;
    if (v.age65) score += 1;
    if (v.prevDvtPe) score += 3;
    if (v.surgFx1m) score += 2;
    if (v.malignancy) score += 2;
    if (v.unilateralPain) score += 3;
    if (v.hemoptysis) score += 2;
    score += +v.hr;
    if (v.limbEdema) score += 4;

    let prob = score <= 3 ? 'Low probability (<8%)' : score <= 10 ? 'Intermediate probability (28–40%)' : 'High probability (>60%)';
    return {
      primary: score + ' points',
      interpretation: prob,
      chip: score >= 11 ? 'critical' : score >= 4 ? 'high' : 'normal',
      details: [{ label: 'Cutoffs', value: 'Low 0–3 | Intermediate 4–10 | High ≥11' }]
    };
  };

  // ── GRACE Score ──
  CalcCompute['grace-score'] = function(v) {
    let score = (+v.agePts) + (+v.hrPts) + (+v.sbpPts) + (+v.crPts) + (+v.killipPts);
    if (v.cardiacArrest) score += 43;
    if (v.stDeviation) score += 30;
    if (v.elevatedEnzymes) score += 15;

    let risk = score < 109 ? 'Low (<1% in-hospital mortality)' : score <= 140 ? 'Intermediate (1–3%)' : 'High (>3% — consider early invasive strategy)';
    return {
      primary: score + ' points',
      interpretation: risk,
      chip: score > 140 ? 'critical' : score >= 109 ? 'high' : 'normal',
      details: [{ label: 'Guideline', value: 'GRACE 2.0 — ESC/ACC NSTEMI risk stratification' }]
    };
  };

  // ── Child-Pugh Score ──
  CalcCompute['child-pugh'] = function(v) {
    const score = (+v.bilirubin || 0) + (+v.albumin || 0) + (+v.pt || 0) + (+v.ascites || 0) + (+v.encephalopathy || 0);
    // Minimum valid score is 5 (all fields at lowest severity); blank form gives 0
    if (score < 5) return { error: 'Fill all Child-Pugh fields (minimum score is 5)' };
    const cls = score <= 6 ? 'A' : score <= 9 ? 'B' : 'C';
    const survival = { A: '1-yr: 100%, 2-yr: 85%', B: '1-yr: 81%, 2-yr: 57%', C: '1-yr: 45%, 2-yr: 35%' };
    return {
      primary: 'Class ' + cls + ' (' + score + ' points)',
      interpretation: 'Child-Pugh ' + cls + ' — ' + survival[cls],
      chip: cls === 'C' ? 'critical' : cls === 'B' ? 'high' : 'normal',
      details: [{ label: 'Surgical risk', value: cls === 'A' ? 'Low (5% mortality)' : cls === 'B' ? 'Moderate (25%)' : 'High (>50%)' }]
    };
  };

  // ── MELD / MELD-Na Score ──
  CalcCompute['meld-score'] = function(v) {
    // Bilirubin and creatinine: MELD formula uses mg/dL; convert from µmol/L if SI mode
    const biliRaw = CalcUnits.system === 'SI'
      ? CalcUnits.GROUPS.bilirubin.toUS(+v.bilirubin)
      : +v.bilirubin;
    const crRaw = CalcUnits.system === 'SI'
      ? CalcUnits.GROUPS.creatinine.toUS(+v.creatinine)
      : +v.creatinine;

    const bili = Math.max(biliRaw, 1);
    const inr  = Math.max(+v.inr, 1);
    const cr   = Math.min(Math.max(crRaw, 1), 4);   // capped at 4.0 mg/dL per UNOS
    // Sodium clamped to 125-137 for MELD-Na calculation
    const na   = Math.min(Math.max(+v.sodium, 125), 137);

    const meld = Math.round(3.78 * Math.log(bili) + 11.2 * Math.log(inr) + 9.57 * Math.log(cr) + 6.43);
    // UNOS MELD-Na formula (corrected): MELD - Na - (0.025 × MELD × (140 - Na)) + 140
    const meldNa = Math.round(meld - na - (0.025 * meld * (140 - na)) + 140);

    return {
      primary: 'MELD ' + meld + ' | MELD-Na ' + meldNa,
      interpretation: meld >= 30 ? 'Severe — high 90-day mortality, prioritize transplant listing' : meld >= 20 ? 'Significant — close follow-up, transplant evaluation' : meld >= 10 ? 'Moderate liver disease' : 'Mild liver disease',
      chip: meld >= 30 ? 'critical' : meld >= 20 ? 'high' : 'normal',
      details: [{ label: 'Note', value: 'Creatinine capped at 4.0; values <1.0 set to 1.0 per UNOS policy' }]
    };
  };

  // ── FIB-4 Index ──
  CalcCompute['fib4-index'] = function(v) {
    const age = +v.age, ast = +v.ast, alt = +v.alt, plt = +v.platelets;
    if (!age || !ast || !alt || !plt) return { error: 'Fill all fields' };
    const fib4 = (age * ast) / (plt * Math.sqrt(alt));
    let interp = fib4 < 1.30 ? 'Low fibrosis risk — F0–F1 likely (NPV 90%)' : fib4 <= 2.67 ? 'Intermediate — consider liver biopsy or elastography' : 'High fibrosis risk — F3–F4 likely (PPV 80%)';
    return {
      primary: fib4.toFixed(2),
      interpretation: interp,
      chip: fib4 > 2.67 ? 'critical' : fib4 > 1.30 ? 'high' : 'normal',
      details: [{ label: 'Cutoffs', value: '<1.30 low | 1.30–2.67 indeterminate | >2.67 high' }]
    };
  };

  // ── HAS-BLED Score ──
  CalcCompute['has-bled'] = function(v) {
    let score = 0;
    if (v.htn) score++;
    if (v.renal) score++;
    if (v.liver) score++;
    if (v.stroke) score++;
    if (v.bleeding) score++;
    if (v.labileInr) score++;
    if (v.elderly) score++;
    
    // Clamp drugs and alcohol to 1 point combined per user guidelines
    if (v.drugs || v.alcohol) score++;
    
    const risk = score >= 3 ? 'High bleeding risk — weigh carefully vs stroke risk' : score >= 2 ? 'Moderate — address modifiable risk factors' : 'Low bleeding risk';
    return {
      primary: score + ' points',
      interpretation: risk,
      chip: score >= 3 ? 'critical' : score >= 2 ? 'high' : 'normal',
      details: [{ label: 'Note', value: '≥3 = high risk; anticoagulation may still be appropriate if stroke risk outweighs' }]
    };
  };

  // ── CrCl Obese (ABW) ──
  CalcCompute['crcl-obese'] = function(v) {
    const age = +v.age, tbw = +v.tbw, h = +v.height, scr = +v.scr, sex = v.sex;
    if (!age || !tbw || !h || !scr) return { error: 'Fill all fields' };
    const hIn = (h - 152.4) / 2.54;
    const ibw = sex === 'male' ? 50 + 2.3 * hIn : 45.5 + 2.3 * hIn;
    const abw = tbw > ibw ? ibw + 0.4 * (tbw - ibw) : tbw;
    let crcl = ((140 - age) * abw) / (72 * scr);
    if (sex === 'female') crcl *= 0.85;
    return {
      primary: crcl.toFixed(1) + ' mL/min',
      interpretation: 'CG with ABW for obesity. IBW: ' + ibw.toFixed(1) + ' kg, ABW: ' + abw.toFixed(1) + ' kg.',
      chip: crcl < 30 ? 'critical' : crcl < 60 ? 'high' : 'normal',
      details: [{ label: 'Note', value: 'Use ABW when TBW >30% above IBW. Verify with clinical context.' }]
    };
  };

  // ── Phenytoin Correction ──
  CalcCompute['phenytoin-correction'] = function(v) {
    const measured = +v.measured, albumin = +v.albumin;
    if (!measured || !albumin) return { error: 'Fill all fields' };
    const factor = v.renalImpair === 'severe' ? (0.1 * albumin + 0.1) : (0.2 * albumin + 0.1);
    const corrected = measured / factor;
    const therapeutic = corrected >= 10 && corrected <= 20;
    return {
      primary: corrected.toFixed(1) + ' mg/L (corrected)',
      interpretation: therapeutic ? 'Within therapeutic range (10–20 mg/L)' : corrected < 10 ? 'Sub-therapeutic — consider dose increase' : 'Potentially toxic — consider dose reduction',
      chip: corrected > 25 ? 'critical' : corrected > 20 ? 'high' : corrected < 10 ? 'low' : 'normal',
      details: [
        { label: 'Measured level', value: measured + ' mg/L' },
        { label: 'Formula', value: v.renalImpair === 'severe' ? 'Sheiner-Tozer (renal)' : 'Winter-Tozer (standard)' }
      ]
    };
  };

  // ── Preeclampsia Risk ──
  CalcCompute['preeclampsia-risk'] = function(v) {
    const highRisk = [v.priorPE, v.multifetal, v.chronicHTN, v.t1t2dm, v.renalDz, v.autoimm];
    const modRisk   = [v.firstPreg, v.obese, v.famHx, v.age35, v.priorAdverse];
    const nHigh = highRisk.filter(Boolean).length;
    const nMod  = modRisk.filter(Boolean).length;

    const aspirin = nHigh >= 1 || nMod >= 2;
    let interp = aspirin
      ? 'Low-dose aspirin 81 mg/day recommended (12–28 wks, ideally before 16 wks)'
      : 'Aspirin prophylaxis NOT indicated based on current risk factors';

    return {
      primary: aspirin ? 'Aspirin RECOMMENDED' : 'Aspirin NOT indicated',
      interpretation: interp,
      chip: aspirin ? 'high' : 'normal',
      details: [
        { label: 'High-risk factors', value: nHigh + ' present' },
        { label: 'Moderate-risk factors', value: nMod + ' present' },
        { label: 'Guideline', value: 'ACOG Practice Bulletin 222 (2020)' }
      ]
    };
  };

  // ── GDM Screening ──
  CalcCompute['gdm-screening'] = function(v) {
    const fasting = +v.fasting, hr1 = +v.hr1, hr2 = +v.hr2, hr3 = +v.hr3;
    let abnormal = 0, results = [], gdm = false;

    if (v.approach === 'twostep') {
      // 3-hour 100g OGTT (Carpenter-Coustan thresholds)
      if (fasting >= 95) { abnormal++; results.push('Fasting ≥95 ✗'); }
      if (hr1 >= 180)    { abnormal++; results.push('1-hr ≥180 ✗'); }
      if (hr2 >= 155)    { abnormal++; results.push('2-hr ≥155 ✗'); }
      if (hr3 >= 140)    { abnormal++; results.push('3-hr ≥140 ✗'); }
      gdm = abnormal >= 2;
      return {
        primary: gdm ? 'GDM Diagnosed' : (abnormal === 1 ? '1 abnormal value (repeat if clinical concern)' : 'Normal 3-hr OGTT'),
        interpretation: (gdm ? '≥2 abnormal values → GDM confirmed. ' : '') + results.join(', ') || 'All values within normal limits.',
        chip: gdm ? 'critical' : abnormal === 1 ? 'high' : 'normal',
        details: [{ label: 'Thresholds (Carpenter-Coustan)', value: 'Fasting 95 | 1-hr 180 | 2-hr 155 | 3-hr 140' }]
      };
    } else {
      // One-step 75g OGTT (IADPSG)
      if (fasting >= 92) { abnormal++; results.push('Fasting ≥92 ✗'); }
      if (hr1 >= 180)    { abnormal++; results.push('1-hr ≥180 ✗'); }
      if (hr2 >= 153)    { abnormal++; results.push('2-hr ≥153 ✗'); }
      gdm = abnormal >= 1;
      return {
        primary: gdm ? 'GDM Diagnosed' : 'Normal 2-hr OGTT',
        interpretation: (gdm ? '≥1 abnormal value (IADPSG) → GDM confirmed. ' : '') + results.join(', ') || 'All values within IADPSG limits.',
        chip: gdm ? 'critical' : 'normal',
        details: [{ label: 'Thresholds (IADPSG)', value: 'Fasting 92 | 1-hr 180 | 2-hr 153' }]
      };
    }
  };

  // ── Pediatric GCS ──
  CalcCompute['ped-gcs'] = function(v) {
    // Minimum valid GCS is 3 (1+1+1); blank form gives 0 — must validate
    if (!v.eye || !v.verbal || !v.motor) return { error: 'Select all three components (E/V/M)' };
    const total = (+v.eye || 0) + (+v.verbal || 0) + (+v.motor || 0);
    let interp = 'Normal neurological status', status = 'normal';
    if (total <= 8)  { interp = 'Severe brain injury — urgent airway management'; status = 'critical'; }
    else if (total <= 12) { interp = 'Moderate brain injury'; status = 'high'; }
    else if (total < 15)  { interp = 'Minor injury — close monitoring'; status = 'low'; }
    return {
      primary: total + ' / 15',
      interpretation: interp,
      chip: status,
      details: [
        { label: 'Eye', value: v.eye + '/4' },
        { label: 'Verbal (modified)', value: v.verbal + '/5' },
        { label: 'Motor', value: v.motor + '/6' }
      ]
    };
  };

  // ── PEWS ──
  CalcCompute['pews'] = function(v) {
    // Blank form with no selections gives 0, which looks like 'normal' but is invalid
    if (v.behavior === undefined || v.cardiovascular === undefined || v.respiratory === undefined) {
      return { error: 'Select a score for each category (Behavior, Cardiovascular, Respiratory)' };
    }
    const score = (+v.behavior || 0) + (+v.cardiovascular || 0) + (+v.respiratory || 0);
    let action = score >= 4 ? 'IMMEDIATE escalation to senior clinician/PICU' : score >= 2 ? 'Urgent clinical review required' : 'Routine monitoring — reassess per protocol';
    return {
      primary: score + ' / 9 points',
      interpretation: action,
      chip: score >= 4 ? 'critical' : score >= 2 ? 'high' : 'normal',
      details: [
        { label: 'Behavior', value: v.behavior + '/3' },
        { label: 'Cardiovascular', value: v.cardiovascular + '/3' },
        { label: 'Respiratory', value: v.respiratory + '/3' }
      ]
    };
  };

})();
