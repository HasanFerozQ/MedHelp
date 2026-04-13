// ── Core Engine Constants (v6.0) ──

const CPT_RANGES = [
  { min: 10000, max: 69999, category: 'Surgery' },
  { min: 70000, max: 79999, category: 'Radiology' },
  { min: 80000, max: 89999, category: 'Pathology/Lab' },
  { min: 90000, max: 99999, category: 'E&M / Medicine' },
];

const DRG_BASE_RATE = 10400;
const FACILITY_PROF_MULT = 0.78;

// ── MUE Limits (Medically Unlikely Edits) — Expanded ──
const MUE_LIMITS = {
  // Standard CPT
  '90837': 1, // Psychotherapy 60m
  '99214': 1, // Office Visit moderate
  '99215': 1, // Office Visit high
  '36415': 1, // Blood draw
  '94760': 1, // Pulse Ox
  '93000': 1, // EKG
  '71045': 1, // X-ray chest 1v
  '71046': 1, // X-ray chest 2v
  '85025': 1, // CBC with auto diff
  '80048': 1, // Basic metabolic panel
  '80053': 1, // Comprehensive metabolic panel
  '81001': 1, // Urinalysis
  '90834': 1, // Psychotherapy 45m
  '99213': 1, // Office Visit low-mod
  '99212': 1, // Office Visit low
  '99221': 1, // Initial hospital low
  '99222': 1, // Initial hospital mod
  '99223': 1, // Initial hospital high
  '12001': 1, // Simple wound repair
  '45378': 1, // Diagnostic colonoscopy
  '43239': 1, // Upper GI endoscopy
  // HCPCS Level II — Wellness & Preventive
  'G0439': 1, // Annual Wellness Visit subsequent
  'G0444': 1, // Annual Depression Screening
  'G0446': 1, // Annual Intensive Behavioral Counseling
  'G0463': 1, // Hospital Outpatient Clinic Visit
  'G0008': 1, // Administration of influenza vaccine
  'G0009': 1, // Administration of pneumococcal vaccine
  'G0010': 1, // Administration of hepatitis B vaccine
  'G0101': 1, // Cervical/vaginal cancer screening
  'G0123': 1, // Cervical/vaginal smear
  'G0202': 1, // Screening mammography
  'G0204': 1, // Diagnostic mammography (2D)
  'G0206': 1, // Diagnostic mammography (digital)
  'G0297': 1, // Low-dose CT lung cancer screening
  'G0327': 1, // Colorectal cancer screening
  // Specialty A-codes (DME/Supplies)
  'A9590': 1, // Iodine I-131 sodium therapy
  // Q-codes (Vaccines/Drugs)
  'Q2041': 2, // Axicabtagene ciloleucel
  'Q2042': 1, // Tisagenlecleucel
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

// ── ICD-10 Chapter → Allowed CPT Categories (for CO-11 DX–Procedure mismatch) ──
// Key = first letter of ICD-10 code (chapter designator)
// Value = array of CPT categories that are clinically coherent with this ICD-10 chapter
const DX_CPT_COMPAT = {
  'A': ['E&M / Medicine', 'Pathology/Lab', 'Radiology'],            // Infectious
  'B': ['E&M / Medicine', 'Pathology/Lab', 'Radiology'],            // Parasitic
  'C': ['Surgery', 'E&M / Medicine', 'Radiology', 'Pathology/Lab', 'HCPCS L2'], // Neoplasms
  'D': ['E&M / Medicine', 'Pathology/Lab', 'Radiology', 'Surgery'], // Blood disorders
  'E': ['E&M / Medicine', 'Pathology/Lab', 'Radiology'],            // Endocrine (Diabetes etc)
  'F': ['E&M / Medicine'],                                           // Mental/Behavioral → psych only
  'G': ['E&M / Medicine', 'Radiology', 'Surgery'],                  // Neurological
  'H': ['E&M / Medicine', 'Surgery', 'Radiology'],                  // Eye/Ear
  'I': ['E&M / Medicine', 'Radiology', 'Surgery', 'Pathology/Lab', 'HCPCS L2'], // Cardiac/circulatory
  'J': ['E&M / Medicine', 'Pathology/Lab', 'Radiology'],            // Respiratory (NO cardiac procedures)
  'K': ['E&M / Medicine', 'Surgery', 'Pathology/Lab'],              // Digestive
  'L': ['E&M / Medicine', 'Surgery'],                               // Skin
  'M': ['E&M / Medicine', 'Surgery', 'Radiology'],                  // Musculoskeletal
  'N': ['E&M / Medicine', 'Surgery', 'Pathology/Lab', 'Radiology'], // Genitourinary
  'O': ['E&M / Medicine', 'Surgery', 'Radiology'],                  // Pregnancy
  'P': ['E&M / Medicine', 'Pathology/Lab'],                         // Perinatal
  'Q': ['Surgery', 'E&M / Medicine'],                               // Congenital
  'R': ['E&M / Medicine', 'Pathology/Lab', 'Radiology'],            // Symptoms/Signs (general)
  'S': ['Surgery', 'E&M / Medicine', 'Radiology'],                  // Injury/Trauma (NO psych-only etc)
  'T': ['E&M / Medicine', 'Surgery', 'Pathology/Lab'],              // Poisoning/adverse effects
  'U': ['E&M / Medicine', 'Pathology/Lab'],                         // COVID/new codes
  'V': ['E&M / Medicine', 'Surgery', 'Radiology'],                  // External causes
  'W': ['E&M / Medicine', 'Surgery'],                               // External causes (falls etc)
  'X': ['E&M / Medicine', 'Surgery'],                               // External causes
  'Y': ['E&M / Medicine', 'Surgery'],                               // External causes
  'Z': ['E&M / Medicine', 'Pathology/Lab'],                         // Health status / encounters
};

/**
 * Classify a CPT or HCPCS code to its clinical category.
 * v6.0: Accepts numeric CPT (5-digit) and HCPCS Level II (letter + 4 digits).
 */
function classifyCPT(code) {
  if (!code) return null;
  // HCPCS Level II: single uppercase letter followed by exactly 4 digits (e.g. G0444, A9590)
  if (/^[A-Z]\d{4}$/.test(code)) return 'HCPCS L2';
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

/**
 * isValidCPT — v6.0
 * Accepts:
 *   - Standard 5-digit numeric CPT codes in valid ranges (10000–99999)
 *   - HCPCS Level II alphanumeric codes: /^[A-Z]\d{4}$/  (e.g., G0444, A9590, Q2041)
 */
function isValidCPT(code) {
  if (!code) return false;
  return !!classifyCPT(code);
}

window.HIGH_COMPLEXITY_EM = HIGH_COMPLEXITY_EM;
window.GLOBAL_PERIOD_OK_MODS = GLOBAL_PERIOD_OK_MODS;
window.DX_CPT_COMPAT = DX_CPT_COMPAT;
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
  // HCPCS L2 benchmarks (Medicare allowable)
  'G0444': { price: 18.00,   desc: 'Annual Depression Screening' },
  'G0439': { price: 171.00,  desc: 'Annual Wellness Visit (subsequent)' },
  'G0463': { price: 117.00,  desc: 'Hospital Outpatient Clinic Visit' },
  'G0008': { price: 25.00,   desc: 'Admin: Influenza vaccine' },
  'G0009': { price: 25.00,   desc: 'Admin: Pneumococcal vaccine' },
  'G0101': { price: 59.00,   desc: 'Cervical/vaginal cancer screening' },
  'G0202': { price: 96.00,   desc: 'Screening mammography (digital 2D)' },
  'G0297': { price: 225.00,  desc: 'Low-dose CT lung cancer screening' },
};

const DRG_BENCHMARKS = {
  '470': { weight: 1.7712, desc: 'Major Joint Replacement (Lower Limb)' },
  '193': { weight: 0.8920, desc: 'Simple Pneumonia & Pleurisy' },
  '392': { weight: 0.7241, desc: 'Esophagitis / Digestive Disorders' },
  '291': { weight: 1.3105, desc: 'Heart Failure & Shock' },
  '871': { weight: 1.9542, desc: 'Septicemia without MV >96 hours' },
};

// ── Shared Helper Utilities (v4.5) ──

function debounce(func, wait) {
  let timeout;
  return function executedFunction(...args) {
    const later = () => {
      clearTimeout(timeout);
      func(...args);
    };
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);
  };
}

function sanitizeText(str) {
  if (typeof str !== 'string') return '';
  const map = {
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#039;'
  };
  return str.replace(/[&<>"']/g, m => map[m]);
}

/**
 * DOCUMENT_PROFILES (v6.0)
 * All profiles now carry `keywords` arrays so classifyDocument() actually fires.
 */
const DOCUMENT_PROFILES = {
  GENERIC: {
    id: 'GENERIC',
    label: 'Generic Medical Document',
    keywords: [],
    auditFocus: ['arithmetic', 'duplicate', 'financial'],
    facilityMode: false
  },
  PROFESSIONAL: {
    id: 'PROFESSIONAL',
    label: 'Professional Bill (CMS-1500)',
    keywords: [
      'cms-1500', 'cms 1500', 'pos code', 'place of service',
      'rendering provider', 'npi', 'tax id', 'group npi',
      'referring provider', 'supervising provider', 'signature of physician'
    ],
    auditFocus: ['modifier', 'frequency', 'consistency', 'POS'],
    facilityMode: false
  },
  INSTITUTIONAL: {
    id: 'INSTITUTIONAL',
    label: 'Institutional Bill (UB-04)',
    keywords: [
      'ub-04', 'ub04', 'revenue code', 'drg', 'type of bill',
      'tob', 'condition code', 'value code', 'occurrence code',
      'principal diagnosis', 'admission date', 'discharge date'
    ],
    auditFocus: ['benchmark', 'completeness', 'arithmetic'],
    facilityMode: true
  },
  EOB: {
    id: 'EOB',
    label: 'Explanation of Benefits (EOB)',
    keywords: [
      'explanation of benefits', 'eob', 'carc', 'your responsibility',
      'remark code', 'member id', 'claim number', 'allowed amount',
      'adjustment reason', 'plan paid', 'not covered', 'deductible applied'
    ],
    auditFocus: ['semantic', 'financial', 'duplicate'],
    facilityMode: false
  }
};

const NCCI_PAIRS = {
  // key = Column 1 (primary), value = { Column2: { modifierAllowed: '0'|'1' } }
  // modifierAllowed '0' = hard bundle (never separately payable)
  // modifierAllowed '1' = soft bundle (payable with -59/-XE/-XS etc.)
  '80053': {
    '80048': { modifierAllowed: '0' }, // BMP bundled into CMP
    '82947': { modifierAllowed: '0' }, // Glucose bundled into CMP
    '84132': { modifierAllowed: '0' }, // Potassium bundled into CMP
    '84295': { modifierAllowed: '0' }, // Sodium bundled into CMP
    '82310': { modifierAllowed: '0' }, // Calcium bundled into CMP
    '82565': { modifierAllowed: '0' }, // Creatinine bundled into CMP
    '84520': { modifierAllowed: '0' }, // BUN bundled into CMP
    '82040': { modifierAllowed: '0' }, // Albumin bundled into CMP
  },
  '80048': {
    '82947': { modifierAllowed: '0' },
    '84132': { modifierAllowed: '0' },
    '84295': { modifierAllowed: '0' },
    '82310': { modifierAllowed: '0' },
    '82565': { modifierAllowed: '0' },
    '84520': { modifierAllowed: '0' },
  },
  '85025': {
    '85027': { modifierAllowed: '0' }, // CBC auto-diff bundles CBC manual
  },
  '81001': {
    '81002': { modifierAllowed: '0' }, // UA w/ microscopy bundles UA w/o microscopy
    '81003': { modifierAllowed: '0' }, // UA w/ microscopy bundles UA dipstick
  },
  '93000': {
    '93010': { modifierAllowed: '0' }, // Complete ECG bundles interpretation only
    '93005': { modifierAllowed: '0' }, // Complete ECG bundles tracing only
  },
  '12001': {
    '29881': { modifierAllowed: '1' }, // Wound repair + arthroscopy — payable together w/ modifier
    '27447': { modifierAllowed: '1' },
    '27130': { modifierAllowed: '1' },
  },
};

/**
 * parseCurrency — handles \$1,234.00, (1234.00), $500 CR and similar variants.
 * Returns a float. Negative for amounts in parentheses or with CR suffix.
 */
function parseCurrency(str) {
  if (str === null || str === undefined || str === '') return null;
  const s = String(str).trim();
  const isNeg = /^\(/.test(s) || /CR$/i.test(s);  // parenthetical or CR suffix = negative
  const cleaned = s.replace(/[\$,\(\)]/g, '').replace(/CR$/i, '').trim();
  const val = parseFloat(cleaned);
  if (isNaN(val)) return null;
  return isNeg ? -Math.abs(val) : val;
}
window.parseCurrency = parseCurrency;

const CARC_RE = /\b([A-Z]{1,2}-?\d{1,4})\b/g;
const ANOMALY_MARKER_RE = /[■□✅⚠️🚨]/g;
const ICD10_RE = /\b([A-Z]\d{2}(?:\.\w{1,4})?)\b/g;

// ── Stage 0: Final Window Exports ─────────────────────────────────────────────

window.NPPES_API = 'https://npiregistry.cms.hhs.gov/api/?version=2.1&number=';
window.FACILITY_PROF_MULT = FACILITY_PROF_MULT;
window.DRG_BASE_RATE = DRG_BASE_RATE;
window.DOCUMENT_PROFILES = DOCUMENT_PROFILES;
window.MUE_LIMITS = MUE_LIMITS;
window.CPT_CLINICAL_GROUPS = CPT_CLINICAL_GROUPS;
window.INLINE_BENCHMARK = INLINE_BENCHMARK;
window.DRG_BENCHMARKS = DRG_BENCHMARKS;
window.NCCI_PAIRS = NCCI_PAIRS;
window.ICD10_RE = ICD10_RE;
window.MH_CONSTANTS = {
  CPT_RANGES,
  INLINE_BENCHMARK,
  DRG_BASE_RATE,
  DRG_BENCHMARKS,
  MUE_LIMITS,
  CPT_CLINICAL_GROUPS,
  NCCI_PAIRS,
  NPPES_API: window.NPPES_API,
  FACILITY_PROF_MULT: window.FACILITY_PROF_MULT
};

window.HIGH_COMPLEXITY_EM = HIGH_COMPLEXITY_EM;
window.GLOBAL_PERIOD_OK_MODS = GLOBAL_PERIOD_OK_MODS;
window.DX_CPT_COMPAT = DX_CPT_COMPAT;
window.classifyCPT = classifyCPT;
window.isValidCPT = isValidCPT;
window.isSurgeryCode = isSurgeryCode;
window.isEMCode = isEMCode;
window.parseDate = parseDate;
window.CARC_RE = CARC_RE;
window.ANOMALY_MARKER_RE = ANOMALY_MARKER_RE;
window.debounce = debounce;
window.sanitizeText = sanitizeText;
