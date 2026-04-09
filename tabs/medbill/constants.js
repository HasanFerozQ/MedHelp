// ── Core Engine Constants ──
const CPT_RANGES = [
  { min: 10000, max: 69999, category: 'Surgery' },
  { min: 70000, max: 79999, category: 'Radiology' },
  { min: 80000, max: 89999, category: 'Pathology/Lab' },
  { min: 90000, max: 99999, category: 'E&M / Medicine' },
];

const DRG_BASE_RATE = 10400;
const FACILITY_PROF_MULT = 0.78;

const MUE_LIMITS = {
  '90837': 1, // Psychotherapy 60m
  '99214': 1, // Office Visit
  '99215': 1,
  '36415': 1, // Blood draw
  '94760': 1, // Pulse Ox
  '93000': 1, // EKG
  '71045': 1, // X-ray
  '71046': 1,
  'G0439': 1, // Annual Wellness
};

const HIGH_COMPLEXITY_EM = {
  '99205': { minMin: 60,  label: 'New patient high complexity' },
  '99215': { minMin: 40,  label: 'Established patient high complexity' },
  '99223': { minMin: 70,  label: 'Initial hospital high complexity' },
  '99233': { minMin: 50,  label: 'Subsequent hospital high complexity' },
  '99285': { minMin: 60,  label: 'Emergency dept high complexity' },
  '99291': { minMin: 30,  label: 'Critical care' },
};

const GLOBAL_PERIOD_OK_MODS = new Set(['24', '25', '57']);

function classifyCPT(code) {
  const n = parseInt(code, 10);
  if (isNaN(n)) return null;
  for (const r of CPT_RANGES) {
    if (n >= r.min && n <= r.max) return r.category;
  }
  return null;
}

function isSurgeryCode(code) {
  return classifyCPT(code) === 'Surgery';
}

function isEMCode(code) {
  const n = parseInt(code, 10);
  return (
    (n >= 99202 && n <= 99215) || // Office visits
    (n >= 99221 && n <= 99285) || // Hospital / ED visits
    (n >= 99291 && n <= 99292)    // Critical care
  );
}

function parseDate(str) {
  if (!str) return null;
  const normalized = str.trim().replace(/[\/\.]/g, '-');
  const isoMatch = normalized.match(/^(\d{4})-(\d{1,2})-(\d{1,2})$/);
  if (isoMatch) {
    const d = new Date(parseInt(isoMatch[1], 10), parseInt(isoMatch[2], 10) - 1, parseInt(isoMatch[3], 10));
    return isNaN(d.getTime()) ? null : d;
  }
  const usMatch = normalized.match(/^(\d{1,2})-(\d{1,2})-(\d{2,4})$/);
  if (usMatch) {
    let year = parseInt(usMatch[3], 10);
    if (year < 100) year += 2000;
    const d = new Date(year, parseInt(usMatch[1], 10) - 1, parseInt(usMatch[2], 10));
    return isNaN(d.getTime()) ? null : d;
  }
  return null;
}

function isValidCPT(code) {
  return !!classifyCPT(code);
}

window.HIGH_COMPLEXITY_EM = HIGH_COMPLEXITY_EM;
window.GLOBAL_PERIOD_OK_MODS = GLOBAL_PERIOD_OK_MODS;
window.classifyCPT = classifyCPT;
window.isValidCPT = isValidCPT;
window.isSurgeryCode = isSurgeryCode;
window.isEMCode = isEMCode;
window.parseDate = parseDate;

/** 
 * Clinical Coherence Engine (v4.0) 
 * Maps CPT codes to their required companions and incompatible rivals.
 */

const CPT_CLINICAL_GROUPS = {
  // Cardiac: ECG should co-exist with cardiac E&M or high-level context
  '93000': { requires: new Set(['99221','99222','99223','99283','99284','99285','99291','93010','93306']), label: 'ECG (93000)' },
  '93010': { requires: new Set(['93000','93306','99221','99222','99223','99283','99284','99285']), label: 'ECG Interpretation (93010)' },
  // Neurological: Heavy diagnostic imaging should co-exist with neuro visits/exams
  '70551': { requires: new Set(['99214','99215','99221','99222','99223','95816','95819']), label: 'Brain MRI (70551)' },
  // Psych: Psychotherapy shouldn't appear with unrelated major surgeries same day
  '90837': { incompatible: null, label: 'Psychotherapy (90837)' },
  // Critical care: shouldn't appear same day as routine outpatient office visits
  '99291': { incompatible: new Set(['99202','99203','99204','99205','99211','99212','99213','99214','99215']), label: 'Critical Care (99291)' },
  // Colonoscopy: shouldn't appear with upper GI same day (rare standalone billing)
  '45378': { incompatible: new Set(['43239']), label: 'Colonoscopy (45378)' },
  // Knee arthroscopy: needs musculoskeletal E&M or imaging same day
  '29881': { requires: new Set(['99213','99214','99215','73721','73222']), label: 'Knee Arthroscopy (29881)' },
  // Echocardiogram: needs cardiac context
  '93306': { requires: new Set(['99221','99222','99223','99291','93000','93010']), label: 'Echocardiogram (93306)' },
  // Therapeutic injection: shouldn't appear without a corresponding E&M
  '96372': { requires: new Set(['99202','99203','99204','99205','99211','99212','99213','99214','99215']), label: 'Therapeutic Injection (96372)' },
  // Wound repair: shouldn't appear with routine wellness codes
  '12001': { incompatible: new Set(['99381','99382','99383','99384','99385','99391','99392','99393','99394','99395']), label: 'Wound Repair (12001)' },
};

/**
 * DRG (Institutional) Benchmarks (v3.7 - CMS FY2024 Standards)
 * Base Rate: $10,400 (US National Average)
 */

const INLINE_BENCHMARK = {
  '99202': { price: 93.15,   desc: 'Office visit, new, low complexity' },
  '99203': { price: 134.24,  desc: 'Office visit, new, moderate complexity' },
  '99204': { price: 192.61,  desc: 'Office visit, new, moderate-high complexity' },
  '99205': { price: 244.01,  desc: 'Office visit, new, high complexity' },
  '99211': { price: 22.68,   desc: 'Office visit, established, minimal' },
  '99212': { price: 54.59,   desc: 'Office visit, established, low complexity' },
  '99213': { price: 92.81,   desc: 'Office visit, established, low-moderate' },
  '99214': { price: 134.39,  desc: 'Office visit, established, moderate complexity' },
  '99215': { price: 185.87,  desc: 'Office visit, established, high complexity' },
  '99221': { price: 74.82,   desc: 'Initial hospital care, low complexity (Facility)' },
  '99222': { price: 104.91,  desc: 'Initial hospital care, moderate complexity (Facility)' },
  '99223': { price: 154.63,  desc: 'Initial hospital care, high complexity (Facility)' },
  '99231': { price: 40.12,   desc: 'Subsequent hospital care, low complexity (Facility)' },
  '99232': { price: 62.18,   desc: 'Subsequent hospital care, moderate complexity (Facility)' },
  '99233': { price: 84.55,   desc: 'Subsequent hospital care, high complexity (Facility)' },
  '99283': { price: 65.40,   desc: 'ED visit, moderate severity (Facility)' },
  '99284': { price: 112.15,  desc: 'ED visit, high severity (Facility)' },
  '99285': { price: 178.42,  desc: 'ED visit, high severity/high risk (Facility)' },
  '99291': { price: 184.20,  desc: 'Critical care, first 30-74 min (Facility)' },
  '93000': { price: 16.58,   desc: 'Electrocardiogram with report (ECG)' },
  '93010': { price: 11.21,   desc: 'ECG interpretation and report' },
  '93306': { price: 232.20,  desc: 'Echocardiography with Doppler' },
  '85025': { price: 7.27,    desc: 'Complete blood count (CBC) with auto diff' },
  '80053': { price: 11.19,   desc: 'Comprehensive metabolic panel' },
  '80048': { price: 8.68,    desc: 'Basic metabolic panel' },
  '81001': { price: 3.25,    desc: 'Urinalysis with microscopy' },
  '36415': { price: 3.09,    desc: 'Venipuncture (blood draw)' },
  '71046': { price: 41.08,   desc: 'Chest X-ray, 2 views' },
  '72148': { price: 198.82,  desc: 'MRI lumbar spine without contrast' },
  '70553': { price: 273.69,  desc: 'MRI brain with/without contrast' },
  '73610': { price: 34.09,   desc: 'Ankle X-ray, 3+ views' },
  '45378': { price: 173.59,  desc: 'Colonoscopy, diagnostic' },
  '43239': { price: 249.55,  desc: 'Upper GI endoscopy with biopsy' },
  '27447': { price: 1175.74, desc: 'Total knee replacement' },
  '27130': { price: 1300.15, desc: 'Total hip replacement' },
  '29881': { price: 493.18,  desc: 'Knee arthroscopy with meniscectomy' },
  '12001': { price: 120.14,  desc: 'Simple wound repair, ≤2.5 cm' },
  '96372': { price: 24.72,   desc: 'Therapeutic injection' },
  '90837': { price: 122.43,  desc: 'Psychotherapy, 60 min' },
  '90834': { price: 88.59,   desc: 'Psychotherapy, 45 min' },
  '87804': { price: 18.35,   desc: 'Influenza rapid test' },
  '87420': { price: 15.79,   desc: 'RSV antigen test' },
  '87086': { price: 9.42,    desc: 'Urine culture' },
};

// High-complexity E&M codes (upcoding risk)

const DRG_BENCHMARKS = {
  '470': { weight: 1.7712, desc: 'Major Joint Replacement (Lower Limb)' },
  '193': { weight: 0.8920, desc: 'Simple Pneumonia & Pleurisy' },
  '392': { weight: 0.7241, desc: 'Esophagitis / Digestive Disorders' },
  '291': { weight: 1.3105, desc: 'Heart Failure & Shock' },
  '871': { weight: 1.9542, desc: 'Septicemia without MV >96 hours' },
};

// ── Shared Constants for medbill.js Synchronization (v4.1) ─────────────────
window.MH_CONSTANTS = {
  CPT_RANGES,
  INLINE_BENCHMARK,
  DRG_BASE_RATE,
  DRG_BENCHMARKS,
  MUE_LIMITS,
  CPT_CLINICAL_GROUPS,
  NCCI_PAIRS
};

/** Facility Professional Adjustment (Physicians in hospitals bill ~78% of office rate) */

const NCCI_PAIRS = {
  // Venipuncture (Blood Draw) bundles into E&M visits
  '36415': new Set(['99202','99203','99204','99205','99211','99212','99213','99214','99215','99221','99222','99223','99281','99282','99283','99284','99285']),
  // Pulse Oximetry bundles into visits
  '94760': new Set(['99202','99203','99204','99205','99211','99212','99213','99214','99215']),
  // CBC (85025) bundles into metabolic panels OR E&M visits
  '85025': new Set(['80048', '80053', '99202','99203','99204','99205','99211','99212','99213','99214','99215']),
  // Medical Supplies usually bundled into Surgery
  '99070': new Set(['10000','12001','27447','27130','43239','45378','69210']),
};

/** MUE - Medically Unlikely Edits (Frequency Limits) */

window.MUE_LIMITS = MUE_LIMITS;
window.CPT_CLINICAL_GROUPS = CPT_CLINICAL_GROUPS;
window.INLINE_BENCHMARK = INLINE_BENCHMARK;
window.DRG_BENCHMARKS = DRG_BENCHMARKS;
window.NCCI_PAIRS = NCCI_PAIRS;
