/**
 * Compute functions for remaining 62 calculators + accuracy fixes
 */
(function() {
  const D = () => CalcClinicalData;
  const crcl = (v) => {
    let c = ((140 - (+v.age)) * (+v.weight)) / (72 * (+v.scr));
    if (v.sex === 'female') c *= 0.85;
    return c;
  };

  const remaining = {
    'ascvd-risk'(v) {
      const risk = D().ascvdRisk(+v.age, v.sex, v.race, +v.tc, +v.hdl, +v.sbp, v.treated, v.smoker, v.diabetic);
      if (risk == null) return { error: 'Age must be 40-79 for PCE' };
      let status = risk >= 20 ? 'critical' : risk >= 7.5 ? 'high' : risk >= 5 ? 'low' : 'normal';
      return {
        primary: risk.toFixed(1) + '%',
        interpretation: risk >= 7.5 ? 'Statin benefit zone (≥7.5% 10-yr ASCVD)' : 'Lower ASCVD risk — shared decision-making',
        chip: status,
        details: [{ label: '2013 ACC/AHA PCE', value: 'Validate with official calculator for clinical decisions' }]
      };
    },

    'abg-analyzer'(v) {
      const lines = D().interpretABG(v.ph, v.pco2, v.hco3);
      const ph = +v.ph;
      return {
        primary: lines[0] || 'See interpretation',
        interpretation: lines.join('; '),
        chip: ph < 7.35 || ph > 7.45 ? 'high' : 'normal',
        details: [{ label: 'pH', value: v.ph }, { label: 'PaCO₂', value: v.pco2 + ' mmHg' }, { label: 'HCO₃⁻', value: v.hco3 + ' mEq/L' }]
      };
    },

    'acid-base'(v) {
      const lines = D().interpretABG(v.ph, v.pco2, v.hco3);
      const ag = (+v.na) - ((+v.cl) + (+v.hco3));
      const corrAg = ag + 2.5 * (4 - (+v.albumin || 4));
      return {
        primary: lines[0],
        interpretation: lines.join('; ') + (ag ? '; AG ' + ag.toFixed(1) + ' (corrected ' + corrAg.toFixed(1) + ')' : ''),
        chip: +v.ph < 7.35 || +v.ph > 7.45 ? 'high' : 'normal',
        details: [{ label: 'Anion gap', value: ag.toFixed(1) + ' mEq/L' }]
      };
    },

    'electrolyte-deficit'(v) {
      const w = +v.weight, cur = +v.current, tgt = +v.target;
      if (v.electrolyte === 'na') {
        const tbw = w * 0.6;
        const deficit = tbw * (tgt - cur);
        return { primary: deficit.toFixed(0) + ' mEq Na⁺ deficit', interpretation: 'Total body sodium deficit estimate', chip: deficit > 100 ? 'critical' : 'high' };
      }
      const kDef = (tgt - cur) * 0.4 * w;
      return { primary: Math.max(0, kDef).toFixed(0) + ' mEq K⁺ deficit', interpretation: 'Total body potassium deficit (rough estimate)', chip: 'normal' };
    },

    'antibiotic-renal'(v) {
      const c = crcl(v);
      const band = D().crclBand(c);
      const rec = D().antibioticRenal[v.drug]?.[band] || 'Consult pharmacy reference';
      return {
        primary: rec,
        interpretation: 'CrCl ' + c.toFixed(0) + ' mL/min (' + band + ')',
        chip: c < 30 ? 'critical' : c < 60 ? 'high' : 'normal',
        details: [{ label: 'Drug', value: v.drug }]
      };
    },

    'ventilator-settings'(v) {
      const ibw = +v.ibw, vt = ibw * 6, vtHigh = ibw * 8;
      return {
        primary: 'Vt ' + vt.toFixed(0) + '–' + vtHigh.toFixed(0) + ' mL',
        interpretation: 'Lung-protective strategy (6–8 mL/kg IBW)',
        chip: 'normal',
        details: [
          { label: 'Suggested RR', value: v.rr + '/min' },
          { label: 'FiO₂ start', value: v.fio2 + '%' },
          { label: 'PEEP', value: v.peep + ' cmH₂O' },
          { label: 'Minute ventilation', value: ((+v.rr) * vt / 1000).toFixed(1) + ' L/min' }
        ]
      };
    },

    'dialysis-adequacy'(v) {
      const R = (+v.postBun) / (+v.preBun);
      const ktv = -Math.log(R - 0.008 * (+v.time)) + (4 - 3.5 * R) * ((+v.uf * 1000) / (+v.weight));
      const adequate = ktv >= 1.2;
      return {
        primary: ktv.toFixed(2) + ' Kt/V',
        interpretation: adequate ? 'Adequate hemodialysis (single pool estimate)' : 'Below target — consider prescription adjustment',
        chip: adequate ? 'normal' : 'high'
      };
    },

    'acls-drugs'(v) {
      const d = D().acls[v.drug];
      if (!d) return { error: 'Drug not found' };
      const dose = v.pediatric ? d.peds : d.adult;
      return { primary: dose, interpretation: 'ACLS ' + v.drug + (v.pediatric ? ' (pediatric)' : ' (adult)'), chip: 'normal' };
    },

    'pediatric-resus'(v) {
      const w = +v.weight, p = D().pals[v.drug];
      if (!p) return { error: 'Drug not found' };
      let dose;
      if (v.drug === 'adenosine') {
        dose = Math.min(p.dose1 * w, p.max1) + ' mg then ' + Math.min(p.dose2 * w, p.max2) + ' mg';
      } else if (v.drug === 'atropine') {
        const mg = Math.max(p.min, Math.min(p.max, p.dose * w));
        dose = mg.toFixed(2) + ' mg';
      } else {
        dose = (p.dose * w).toFixed(2) + ' ' + p.unit;
      }
      return { primary: dose, interpretation: p.route + ' ' + (p.freq || ''), chip: 'normal' };
    },

    'emergency-drug-dose'(v) {
      const w = +v.weight;
      const doses = {
        epinephrine: (0.01 * w).toFixed(2) + ' mg IM (0.01 mg/kg)',
        diphenhydramine: (1 * w).toFixed(0) + ' mg (1 mg/kg, max 50 mg)',
        dexamethasone: (0.6 * w).toFixed(1) + ' mg (0.6 mg/kg, max 16 mg)',
        lorazepam: (0.1 * w).toFixed(1) + ' mg (0.1 mg/kg)'
      };
      return { primary: doses[v.drug] || 'See reference', interpretation: 'Emergency dosing', chip: 'normal' };
    },

    broselow(v) {
      const len = +v.length;
      const zone = D().broselow.find(z => len >= z.lengthMin && len < z.lengthMax) || D().broselow[D().broselow.length - 1];
      return { primary: zone.zone + ' zone', interpretation: 'Estimated weight ' + zone.weight + ' for ' + len + ' cm', chip: 'normal' };
    },

    'trauma-score'(v) {
      const rts = (+v.gcs) + (+v.sbp) + (+v.rr);
      const prob = rts > 10 ? 'Low mortality' : rts > 6 ? 'Moderate mortality risk' : 'High mortality risk';
      return { primary: rts + ' / 12 (RTS)', interpretation: prob, chip: rts <= 6 ? 'critical' : rts <= 10 ? 'high' : 'normal' };
    },

    'toxicology-dose'(v) {
      const w = +v.weight;
      if (v.toxin === 'acetaminophen') {
        return { primary: (150 * w).toFixed(0) + ' mg NAC load', interpretation: 'NAC 150 mg/kg IV over 1 hr', chip: 'normal' };
      }
      const ant = D().antidotes[v.toxin];
      return { primary: ant?.dose || 'Consult poison control', interpretation: ant?.antidote || v.toxin, chip: 'critical' };
    },

    antidote(v) {
      const a = D().antidotes[v.poison];
      return { primary: a?.antidote || 'Consult poison control', interpretation: a?.dose || '', chip: 'critical' };
    },

    'intubation-dose'(v) {
      const w = +v.weight, drug = D().intubation[v.drug];
      if (!drug) return { error: 'Unknown drug' };
      let mg;
      if (v.drug === 'propofol') mg = (v.pediatric ? drug.mgPerKgPeds : drug.mgPerKgAdult) * w;
      else if (v.drug === 'fentanyl') mg = (drug.mcgPerKg * w) / 1000;
      else mg = drug.mgPerKg * w;
      const unit = v.drug === 'fentanyl' ? 'mg (' + (drug.mcgPerKg * w).toFixed(0) + ' mcg)' : 'mg';
      return { primary: mg.toFixed(2) + ' ' + unit, interpretation: v.drug + ' RSI dose', chip: 'normal' };
    },

    'sepsis-timer'(v) {
      if (!v.recognition) return { error: 'Enter recognition time' };
      const start = new Date(v.recognition);
      const now = v.now ? new Date(v.now) : new Date();
      const elapsedMin = (now - start) / 60000;
      const h1 = elapsedMin <= 60;
      const h3 = elapsedMin <= 180;
      return {
        primary: elapsedMin.toFixed(0) + ' min elapsed',
        interpretation: h1 ? 'Within 1-hour bundle window' : h3 ? 'Within 3-hour window — 1-hr bundle overdue' : 'Both bundle windows exceeded',
        chip: h1 ? 'normal' : h3 ? 'high' : 'critical',
        details: [
          { label: '1-hr bundle', value: h1 ? 'On time' : 'OVERDUE' },
          { label: '3-hr bundle', value: h3 ? 'On time' : 'OVERDUE' }
        ]
      };
    },

    'peep-optimization'(v) {
      const fio2 = +v.fio2;
      const table = { 30: 5, 40: 5, 50: 8, 60: 8, 70: 10, 80: 10, 90: 14, 100: 14 };
      const peep = table[fio2] || (fio2 <= 40 ? 5 : fio2 <= 60 ? 8 : 10);
      return { primary: peep + ' cmH₂O PEEP', interpretation: 'ARDSNet low PEEP/FiO₂ table suggested PEEP for FiO₂ ' + fio2 + '%', chip: 'normal' };
    },

    'apache-ii'(v) {
      const score = D().apacheII(v);
      let mort = score <= 4 ? '<4%' : score <= 9 ? '~8%' : score <= 14 ? '~15%' : score <= 19 ? '~25%' : score <= 24 ? '~40%' : score <= 29 ? '~55%' : '>70%';
      return { primary: score + ' points', interpretation: 'Estimated ICU mortality ~' + mort, chip: score >= 25 ? 'critical' : score >= 15 ? 'high' : 'normal' };
    },

    'vasopressor-titration'(v) {
      const w = +v.weight, dose = +v.dose, conc = +v.concentration;
      if (v.agent === 'vasopressin') {
        return { primary: dose + ' units/min', interpretation: 'Vasopressin fixed rate (not weight-based)', chip: 'normal' };
      }
      const mlHr = (dose * w * 60) / (conc * 1000);
      return { primary: mlHr.toFixed(2) + ' mL/hr', interpretation: v.agent + ' at ' + dose + ' mcg/kg/min', chip: 'normal' };
    },

    'sedation-drip'(v) {
      const w = +v.weight, dose = +v.dose;
      let mlHr;
      if (v.drug === 'propofol') mlHr = (dose * w * 60) / 10000;
      else if (v.drug === 'dexmedetomidine') mlHr = (dose * w) / 4;
      else mlHr = dose * w;
      return { primary: mlHr.toFixed(1) + ' mL/hr', interpretation: v.drug + ' infusion', chip: 'normal' };
    },

    'insulin-infusion'(v) {
      const u = (+v.unitsPerKgHr) * (+v.weight);
      return { primary: u.toFixed(2) + ' units/hr', interpretation: 'IV insulin infusion rate', chip: 'normal' };
    },

    'syringe-prep'(v) {
      const vol = (+v.dose) / (+v.concentration);
      return { primary: vol.toFixed(2) + ' mL', interpretation: 'Volume to draw into syringe', chip: 'normal' };
    },

    'fall-risk'(v) {
      const s = D().morseFall(v);
      return {
        primary: s + ' points',
        interpretation: s >= 45 ? 'High fall risk' : s >= 25 ? 'Moderate fall risk' : 'Low fall risk',
        chip: s >= 45 ? 'critical' : s >= 25 ? 'high' : 'normal'
      };
    },

    'cpr-drug-dose'(v) {
      const w = +v.weight;
      if (v.drug === 'epinephrine') {
        const d = v.pediatric ? (0.01 * w).toFixed(2) + ' mg (0.01 mg/kg)' : '1 mg';
        return { primary: d, interpretation: 'Epinephrine CPR dose q3-5min', chip: 'normal' };
      }
      const amio = v.pediatric ? (5 * w).toFixed(0) + ' mg (5 mg/kg)' : '300 mg bolus';
      return { primary: amio, interpretation: 'Amiodarone CPR dose', chip: 'normal' };
    },

    'pediatric-emergency-dose'(v) {
      const w = +v.weight;
      const d = {
        epinephrine: (0.01 * w).toFixed(2) + ' mg IM',
        albuterol: '2.5 mg neb (<20 kg) or 5 mg (≥20 kg)',
        dextrose: (0.5 * w).toFixed(1) + ' g → D10 ' + (5 * w).toFixed(0) + ' mL',
        benzodiazepine: (0.1 * w).toFixed(1) + ' mg midazolam IV'
      };
      return { primary: d[v.drug] || 'See PALS', interpretation: 'Pediatric emergency dose', chip: 'normal' };
    },

    'renal-dose-adjust'(v) {
      const adj = (+v.standardDose) * Math.min(1, (+v.crcl) / (+v.normalCrcl));
      return { primary: adj.toFixed(0) + ' mg', interpretation: 'Linear CrCl proportion adjustment', chip: +v.crcl < 30 ? 'critical' : 'normal' };
    },

    'hepatic-dose'(v) {
      const mult = { A: 1, B: 0.5, C: 0.25 }[v.childPugh] || 1;
      const d = (+v.standardDose) * mult;
      return { primary: d.toFixed(0) + ' mg', interpretation: 'Child-Pugh ' + v.childPugh + ' — use ' + (mult * 100) + '% of standard dose', chip: v.childPugh === 'C' ? 'critical' : v.childPugh === 'B' ? 'high' : 'normal' };
    },

    'drug-interaction'(v) {
      const hit = D().drugInteractions.find(i =>
        (i.a === v.drugA && i.b === v.drugB) || (i.a === v.drugB && i.b === v.drugA)
      );
      if (!hit) return { primary: 'No major interaction in database', interpretation: 'Always verify with full interaction checker', chip: 'normal' };
      return { primary: hit.severity, interpretation: hit.effect, chip: hit.severity === 'Contraindicated' ? 'critical' : 'high' };
    },

    tdm(v) {
      const range = D().tdm[v.drug];
      return { primary: range, interpretation: 'Therapeutic range reference', chip: 'normal' };
    },

    compounding(v) {
      const dh = +v.desiredConc, hi = +v.stockHigh, lo = +v.stockLow, tv = +v.totalVol;
      const hiVol = ((dh - lo) / (hi - lo)) * tv;
      const loVol = tv - hiVol;
      return { primary: hiVol.toFixed(1) + ' mL high + ' + loVol.toFixed(1) + ' mL low', interpretation: 'Alligation to prepare ' + dh + '%', chip: 'normal' };
    },

    'iv-compatibility'(v) {
      const bad = ['diazepam', 'phenytoin'];
      if (bad.includes(v.drug1) && v.drug2 !== 'ns') return { primary: 'Likely INCOMPATIBLE', interpretation: v.drug1 + ' often precipitates — use separate line', chip: 'critical' };
      return { primary: 'Verify Y-site compatibility', interpretation: 'Always confirm with pharmacy IV compatibility reference', chip: 'low' };
    },

    'vancomycin-auc'(v) {
      const auc = (+v.trough) * 24 * ((+v.dose) / ((+v.trough) * (+v.weight) * 0.06 + 1));
      const est = (+v.trough) * 24 * 0.9 + (+v.dose) / (+v.weight) * 2;
      const aucEst = Math.min(600, Math.max(300, (+v.trough) * 8 + (+v.dose) / (+v.weight) * 15));
      return {
        primary: aucEst.toFixed(0) + ' mg·h/L (estimate)',
        interpretation: aucEst >= 400 && aucEst <= 600 ? 'Target AUC 400-600 range' : 'Adjust toward AUC 400-600',
        chip: aucEst < 400 ? 'low' : aucEst > 600 ? 'high' : 'normal'
      };
    },

    aminoglycoside(v) {
      const w = +v.weight;
      const doseMap = { gentamicin: 7, tobramycin: 7, amikacin: 15 };
      let dose = (doseMap[v.drug] || 7) * w;
      const cr = +v.crcl;
      if (cr < 60) dose *= 0.85;
      if (cr < 40) dose *= 0.85;
      return { primary: dose.toFixed(0) + ' mg q24h', interpretation: 'Hartford extended-interval (verify with local protocol)', chip: 'normal' };
    },

    'chemotherapy-dose'(v) {
      const bsa = Math.sqrt(((+v.height) * (+v.weight)) / 3600);
      const dose = bsa * (+v.dosePerM2);
      return { primary: dose.toFixed(1) + ' mg', interpretation: 'BSA ' + bsa.toFixed(2) + ' m² × ' + v.dosePerM2 + ' mg/m²', chip: 'normal' };
    },

    tpn(v) {
      const kcal = (+v.weight) * (+v.caloriesPerKg);
      const prot = (+v.weight) * (+v.proteinPerKg);
      const nonProteinKcal = kcal - prot * 4;
      const dextroseG = (nonProteinKcal * 0.6) / 3.4;
      const lipidG = (nonProteinKcal * 0.4) / 9;
      return {
        primary: kcal.toFixed(0) + ' kcal/day',
        interpretation: 'TPN macronutrient estimate',
        chip: 'normal',
        details: [
          { label: 'Protein', value: prot.toFixed(0) + ' g/day' },
          { label: 'Dextrose (~60%)', value: dextroseG.toFixed(0) + ' g/day' },
          { label: 'Lipids (~40%)', value: lipidG.toFixed(0) + ' g/day' },
          { label: 'Volume', value: v.volume + ' mL/day' }
        ]
      };
    },

    'ped-emergency-drugs'(v) {
      return remaining['pediatric-resus'](v);
    },

    'neonatal-dose'(v) {
      const d = (+v.weight) * (+v.dosePerKg);
      return { primary: d.toFixed(3) + ' mg', interpretation: (+v.weight) + ' kg × ' + v.dosePerKg + ' mg/kg', chip: 'normal' };
    },

    'growth-percentile'(v) {
      const months = +v.ageMonths, weight = +v.weight;
      const medKeys = Object.keys(D().whoWeightMedian).map(Number).sort((a, b) => a - b);
      let med = D().whoWeightMedian[0];
      for (const k of medKeys) { if (months >= k) med = D().whoWeightMedian[k]; }
      const pct = weight < med * 0.85 ? '<5th' : weight < med * 0.95 ? '~10-25th' : weight < med * 1.05 ? '~50th' : weight < med * 1.15 ? '~75-90th' : '>95th';
      return { primary: pct + ' percentile (est.)', interpretation: 'WHO median ~' + med + ' kg at ' + months + ' mo', chip: pct.includes('<5') || pct.includes('>95') ? 'high' : 'normal' };
    },

    'head-circumference'(v) {
      const months = +v.ageMonths, hc = +v.hc;
      const expected = 34 + months * 0.5;
      const pct = hc < expected - 2 ? '<5th' : hc > expected + 2 ? '>95th' : '~50th';
      return { primary: pct + ' percentile (est.)', interpretation: 'Expected HC ~' + expected.toFixed(1) + ' cm at ' + months + ' mo', chip: pct !== '~50th' ? 'high' : 'normal' };
    },

    'ped-bp-percentile'(v) {
      const age = +v.ageYears;
      const expectedSbp = 90 + age;
      const expectedDbp = 50 + age / 2;
      const elevated = (+v.sbp) >= expectedSbp + 10 || (+v.dbp) >= expectedDbp + 10;
      return {
        primary: elevated ? 'Elevated BP for age' : 'Normal BP for age (screen)',
        interpretation: 'Approx expected SBP ~' + expectedSbp + ', DBP ~' + expectedDbp.toFixed(0),
        chip: elevated ? 'high' : 'normal'
      };
    },

    'neonatal-bilirubin'(v) {
      const hrs = +v.ageHours, bili = +v.bilirubin;
      let thresh = hrs < 24 ? 8 : hrs < 48 ? 12 : hrs < 72 ? 15 : 18;
      if (v.risk) thresh *= 0.85;
      const high = bili >= thresh;
      return {
        primary: bili + ' mg/dL at ' + hrs + ' hr',
        interpretation: high ? 'Phototherapy threshold may be met — use Bhutani nomogram' : 'Below simplified threshold',
        chip: high ? 'critical' : 'normal'
      };
    },

    'contraction-timer'(v) {
      const freq = 60 / (+v.interval);
      const active = (+v.interval) <= 5 && (+v.duration) >= 45;
      return {
        primary: freq.toFixed(1) + ' contractions/hr',
        interpretation: active ? 'Active labor pattern' : 'Early/irregular labor',
        chip: active ? 'high' : 'normal',
        details: [{ label: 'Duration', value: v.duration + ' sec' }, { label: 'Interval', value: v.interval + ' min' }]
      };
    },

    'pregnancy-weight'(v) {
      const bmi = +v.preBmi;
      let total = bmi < 18.5 ? '28-40 lb' : bmi < 25 ? '25-35 lb' : bmi < 30 ? '15-25 lb' : '11-20 lb';
      const weekGain = bmi < 25 ? 1 : bmi < 30 ? 0.6 : 0.4;
      return {
        primary: total + ' total gain (IOM)',
        interpretation: 'Suggested ~' + weekGain + ' lb/week in 2nd/3rd trimester',
        chip: 'normal'
      };
    },

    'oxytocin-infusion'(v) {
      const mUmin = ((+v.mlHr) / 60) * (+v.unitsPerL) * 1000 / 1000;
      const mUminCalc = ((+v.mlHr) * (+v.unitsPerL) * 1000) / (60 * 1000);
      return { primary: mUminCalc.toFixed(1) + ' mU/min', interpretation: 'Oxytocin infusion rate', chip: mUminCalc > 20 ? 'high' : 'normal' };
    },

    vbac(v) {
      const p = D().vbacScore(v);
      return { primary: p + '% success (est.)', interpretation: p >= 60 ? 'Favorable for trial of labor' : 'Counsel on risks/benefits', chip: p >= 60 ? 'normal' : 'low' };
    },

    'fetal-weight'(v) {
      const g = D().hadlockEFW(+v.ac, +v.bpd);
      return { primary: g + ' g', interpretation: 'Hadlock formula (AC + BPD) estimate', chip: 'normal' };
    },

    'induction-dose'(v) {
      return remaining['intubation-dose']({ ...v, drug: v.drug === 'propofol' ? 'propofol' : v.drug === 'etomidate' ? 'etomidate' : 'ketamine' });
    },

    'paralytic-dose'(v) {
      const w = +v.weight, d = D().intubation[v.drug];
      return { primary: (d.mgPerKg * w).toFixed(1) + ' mg', interpretation: v.drug + ' NMB dose', chip: 'normal' };
    },

    'sedation-dose'(v) {
      const w = +v.weight;
      const d = { midazolam: 0.05, fentanyl: 0.001, ketamine: 1, propofol: 1 };
      const mg = (d[v.drug] || 0.05) * w;
      return { primary: mg.toFixed(2) + ' mg', interpretation: v.drug + ' procedural sedation', chip: 'normal' };
    },

    'difficult-airway'(v) {
      const s = D().lemonScore(v);
      return { primary: s + ' / 10 LEMON points', interpretation: s >= 4 ? 'Difficult airway likely — prepare backup' : 'Lower difficulty predicted', chip: s >= 4 ? 'critical' : s >= 2 ? 'high' : 'normal' };
    },

    mac(v) {
      const base = D().mac[v.agent === 'sevoflurane' ? 'sevoflurane' : 'isoflurane'][v.ageGroup];
      const ageAdj = +v.age > 40 ? Math.max(0.5, base - (+v.age - 40) * 0.005) : base;
      return { primary: ageAdj.toFixed(2) + ' MAC', interpretation: v.agent + ' age-adjusted MAC', chip: 'normal' };
    },

    'student-abg'(v) {
      const r = remaining['abg-analyzer'](v);
      if (+v.pao2) r.details = (r.details || []).concat([{ label: 'PaO₂', value: v.pao2 + ' mmHg — ' + (+v.pao2 < 60 ? 'hypoxemia' : 'adequate') }]);
      return r;
    },

    'student-ecg'(v) {
      const speed = +v.paperSpeed || 25;
      const rrSec = (+v.rr) / speed;
      const hr = 60 / rrSec;
      const qtSec = (+v.qt) / speed;
      const qtc = qtSec / Math.sqrt(rrSec) * 1000;
      return {
        primary: 'HR ' + hr.toFixed(0) + ' bpm | QTc ' + qtc.toFixed(0) + ' ms',
        interpretation: qtc > 470 ? 'Prolonged QTc' : 'QTc within expected range (verify manually)',
        chip: qtc > 500 ? 'critical' : qtc > 470 ? 'high' : 'normal'
      };
    },

    'formula-library'(v) {
      const f = D().formulas[+v.formula];
      return { primary: f?.eq || '', interpretation: f?.name || '', chip: 'normal' };
    },

    'disease-criteria'(v) {
      const c = D().diseaseCriteria[v.disease];
      return { primary: v.disease.toUpperCase(), interpretation: c || '', chip: 'normal' };
    },

    'diagnostic-scores'(v) {
      const s = D().diagnosticScores[v.score];
      return { primary: v.score, interpretation: s || '', chip: 'normal' };
    },

    'lab-interpretation'(v) {
      const r = D().labRanges[v.test];
      if (!r) return { error: 'Unknown test' };
      const val = +v.value;
      let interp = 'Normal';
      let chip = 'normal';
      if (v.test === 'hemoglobin') {
        if (val < r.lowF) { interp = 'Low (anemia)'; chip = 'low'; }
      } else if (val < r.low) { interp = 'Low'; chip = 'low'; }
      else if (val > r.high) { interp = 'High'; chip = 'high'; }
      return { primary: val + ' ' + (r.unit || ''), interpretation: interp + ' (ref: ' + (r.low || r.lowF) + '–' + (r.high || '—') + ')', chip };
    },

    'dvt-risk'(v) {
      let s = 0;
      if (v.age41) s += 1;
      if (v.age60) s += 2;
      if (v.age75) s += 3;
      if (v.surgeryMajor) s += 2;
      if (v.cancer) s += 2;
      if (v.priorVTE) s += 3;
      if (v.immobile) s += 1;
      return {
        primary: s + ' Caprini points',
        interpretation: s >= 5 ? 'High VTE risk — pharmacoprophylaxis' : s >= 3 ? 'Moderate risk' : 'Low-moderate risk',
        chip: s >= 5 ? 'critical' : s >= 3 ? 'high' : 'normal'
      };
    },

    'postop-pain'(v) {
      const w = +v.weight;
      const d = { morphine: 0.1, hydromorphone: 0.015, ketorolac: 0.5 };
      let mg = d[v.drug] * w;
      if (v.drug === 'ketorolac') mg = Math.min(30, mg);
      return { primary: mg.toFixed(1) + ' mg', interpretation: v.drug + ' post-op dose', chip: 'normal' };
    },

    'antibiotic-prophylaxis'(v) {
      const w = +v.weight;
      const doses = {
        clean: v.allergy ? 'Clindamycin 600 mg IV' : 'Cefazolin ' + Math.min(2, (25 * w / 1000)).toFixed(1) + ' g IV',
        cleanContaminated: v.allergy ? 'Clindamycin + gentamicin' : 'Cefazolin 2 g IV (3 g if >120 kg)',
        colorectal: v.allergy ? 'Metronidazole + gentamicin' : 'Cefazolin + metronidazole per protocol'
      };
      return { primary: doses[v.procedure], interpretation: 'Surgical prophylaxis — single pre-op dose', chip: 'normal' };
    },

    'qc-stats'(v) {
      const vals = [+v.v1, +v.v2, +v.v3, +v.v4, +v.v5].filter(x => !isNaN(x));
      const mean = vals.reduce((a, b) => a + b, 0) / vals.length;
      const sd = Math.sqrt(vals.reduce((s, x) => s + (x - mean) ** 2, 0) / (vals.length - 1));
      const cv = (sd / mean) * 100;
      return {
        primary: 'CV ' + cv.toFixed(2) + '%',
        interpretation: 'Mean ' + mean.toFixed(2) + ', SD ' + sd.toFixed(2),
        chip: cv > 5 ? 'high' : 'normal',
        details: [{ label: 'Target', value: v.target || 'N/A' }]
      };
    },

    'diet-tpn'(v) {
      const protPct = ((+v.proteinG) * 4 / (+v.tdee)) * 100;
      const mlHr = (+v.volume) / 24;
      return {
        primary: mlHr.toFixed(1) + ' mL/hr',
        interpretation: 'Protein ' + protPct.toFixed(0) + '% of calories',
        chip: 'normal',
        details: [{ label: 'Calories', value: v.tdee + ' kcal/day' }, { label: 'Protein', value: v.proteinG + ' g/day' }]
      };
    }
  };

  Object.assign(CalcCompute, remaining);

  Object.assign(CalcCompute._aliases, {
    'student-abg': 'abg-analyzer',
    'diet-tpn': 'tpn'
  });
})();
