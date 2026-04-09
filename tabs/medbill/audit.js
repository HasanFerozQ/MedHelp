(function() {
  'use strict';

/**
 * MediHelp — audit.js (v3.0)
 * 3-Layer Medical Bill Audit Engine: Arithmetic · Rule-Based · Benchmark
 * Zero bleed-in from providers.js or any other module.
 */

// ── CPT Range Table ───────────────────────────────────────────────────────────
const CPT_RANGES = [
  { min: 10000, max: 69999, category: 'Surgery' },
  { min: 70000, max: 79999, category: 'Radiology' },
  { min: 80000, max: 89999, category: 'Pathology/Lab' },
  { min: 90000, max: 99999, category: 'E&M / Medicine' },
];

function classifyCPT(code) {
  const n = parseInt(code, 10);
  if (isNaN(n)) return null;
  for (const r of CPT_RANGES) {
    if (n >= r.min && n <= r.max) return r.category;
  }
  return null;
}

function isValidCPT(code) {
  return classifyCPT(code) !== null;
}

// ── Inline Medicare Benchmark (offline fallback) ──────────────────────────────
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
const HIGH_COMPLEXITY_EM = {
  '99205': { minMin: 60,  label: 'New patient high complexity' },
  '99215': { minMin: 40,  label: 'Established patient high complexity' },
  '99223': { minMin: 70,  label: 'Initial hospital high complexity' },
  '99233': { minMin: 50,  label: 'Subsequent hospital high complexity' },
  '99285': { minMin: 60,  label: 'Emergency dept high complexity' },
  '99291': { minMin: 30,  label: 'Critical care' },
};

// Modifiers that legitimize E&M billing during global surgical period
const GLOBAL_PERIOD_OK_MODS = new Set(['24', '25', '57']);

/**
 * NCCI Bundling Rules (v3.3)
 * Maps 'Secondary Code' -> Set of 'Primary Codes'
 * If secondary is billed with any primary in the set on same day, it is bundled.
 */
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
  '90837': { incompatible: new Set(['27447','27130','29881','45378','43239']), label: 'Psychotherapy (90837)' },
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

const NCCI_LABELS = {
  '36415': 'Venipuncture (Blood Draw)',
  '94760': 'Pulse Oximetry',
  '99070': 'Medical Supplies',
  '85025': 'CBC (bundled into primary visit or panel)',
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

const MUE_LIMITS_REF = MUE_LIMITS; // Internal reference

/** Facility Professional Adjustment (Physicians in hospitals bill ~75-80% of office rate) */
const FACILITY_PROF_MULT = 0.78;

const NPPES_API = 'https://npiregistry.cms.hhs.gov/api/v2.0/?number=';

/**
 * DRG (Institutional) Benchmarks (v3.7 - CMS FY2024 Standards)
 * Base Rate: $10,400 (US National Average)
 */
const DRG_BASE_RATE = 10400;
const DRG_BENCHMARKS = {
  '470': { weight: 1.7712, desc: 'Major Joint Replacement (Lower Limb)' },
  '193': { weight: 0.8920, desc: 'Simple Pneumonia & Pleurisy' },
  '392': { weight: 0.7241, desc: 'Esophagitis / Digestive Disorders' },
  '291': { weight: 1.3105, desc: 'Heart Failure & Shock' },
  '871': { weight: 1.9542, desc: 'Septicemia without MV >96 hours' },
};

function isSurgeryCode(code) {
  return classifyCPT(code) === 'Surgery';
}

function isEMCode(code) {
  // classifyCPT covers 90000-99999; narrow to true E&M sub-ranges
  const n = parseInt(code, 10);
  return (
    (n >= 99202 && n <= 99215) || // Office visits
    (n >= 99221 && n <= 99285) || // Hospital / ED visits
    (n >= 99291 && n <= 99292)    // Critical care
  );
}

// ── Date helpers (v4.1 Robust Regex Parser) ─────────────────────────────────
function parseDate(str) {
  if (!str) return null;

  // Normalize: replace slashes and dots with dashes
  const normalized = str.trim().replace(/[\/\.]/g, '-');

  // Try ISO-like: YYYY-MM-DD  (safe in all browsers)
  const isoMatch = normalized.match(/^(\d{4})-(\d{1,2})-(\d{1,2})$/);
  if (isoMatch) {
    const d = new Date(
      parseInt(isoMatch[1], 10),
      parseInt(isoMatch[2], 10) - 1,
      parseInt(isoMatch[3], 10)
    );
    return isNaN(d.getTime()) ? null : d;
  }

  // Try US format: MM-DD-YYYY or M-D-YY
  const usMatch = normalized.match(/^(\d{1,2})-(\d{1,2})-(\d{2,4})$/);
  if (usMatch) {
    let year = parseInt(usMatch[3], 10);
    if (year < 100) year += year < 50 ? 2000 : 1900; // 2-digit year heuristic
    const d = new Date(
      year,
      parseInt(usMatch[1], 10) - 1,
      parseInt(usMatch[2], 10)
    );
    return isNaN(d.getTime()) ? null : d;
  }

  // Last resort: native parse (works for verbose formats like "January 15, 2024")
  const fallback = new Date(str);
  return isNaN(fallback.getTime()) ? null : fallback;
}

// ── PDF Audit Setup ───────────────────────────────────────────────────────────
function initAudit() {
  console.log('MediHelp: Initializing Bill Audit Module...');
  
  // 1. Configure PDF.js Worker (v3.x+ Requirement)
  if (typeof pdfjsLib !== 'undefined') {
    pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.worker.min.js';
  }

  setupPDFAudit();

  // ── v4.2 Interactive Blog Integration ──
  try {
    const pendingDemo = sessionStorage.getItem('MH_PENDING_DEMO');
    if (pendingDemo) {
      sessionStorage.removeItem('MH_PENDING_DEMO');
      const data = JSON.parse(pendingDemo);
      const textArea = document.getElementById('bill-text');
      if (textArea) {
        textArea.value = data.billText;
        // Switch to the text tab (audit-paste) using a more fuzzy selector to handle argument variations
        const pasteTab = document.querySelector('[onclick*="audit-paste"]');
        if (pasteTab) pasteTab.click();
        
        // Auto-run if possible
        setTimeout(() => { if (typeof runAuditPaste === 'function') runAuditPaste(); }, 500);
      }
    }
  } catch (err) {
    console.warn('MediHelp: Failed to restore pending demo data.', err);
  }

  const lineInput = document.getElementById('line-items-text');
  if (lineInput) {
    lineInput.addEventListener('keydown', e => {
      if (e.key === 'Enter' && e.ctrlKey) runAuditLines();
    });
  }
}

// Robust Listener (Handles cases where DOMContentLoaded already fired)
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', () => {
    try { initAudit(); } catch(e) { console.error('MediHelp: Core Init Failed', e); }
  });
} else {
  try { initAudit(); } catch(e) { console.error('MediHelp: Late Init Failed', e); }
}

function setupPDFAudit() {
  const zone  = document.getElementById('pdf-drop-zone');
  const input = document.getElementById('pdf-input');
  const status = document.getElementById('pdf-status');

  if (!zone || !input) {
    console.warn('MediHelp: Audit UI elements missing.');
    return;
  }

  zone.onclick = () => {
    console.log('MediHelp: Triggering file input click...');
    input.click();
  };

  zone.ondragover = e => { 
    e.preventDefault(); 
    zone.classList.add('dragover'); 
  };
  
  zone.ondragleave = () => zone.classList.remove('dragover');
  
  zone.ondrop = e => {
    e.preventDefault();
    zone.classList.remove('dragover');
    if (e.dataTransfer.files.length) {
      console.log('MediHelp: PDF Dropped:', e.dataTransfer.files[0].name);
      handlePDF(e.dataTransfer.files[0]);
    }
  };

  input.onchange = e => { 
    if (e.target.files.length) {
      console.log('MediHelp: PDF Selected:', e.target.files[0].name);
      handlePDF(e.target.files[0]);
    }
  };
}

async function handlePDF(file) {
  const status     = document.getElementById('pdf-status');
  const overlay    = document.getElementById('ai-loading-overlay');

  if (!file || file.type !== 'application/pdf') {
    if (status) status.innerText = 'Error: Please upload a valid PDF file.';
    return;
  }

  if (typeof pdfjsLib === 'undefined') {
    console.error('MediHelp: pdf.js library not loaded.');
    if (status) status.innerHTML = '<span style="color:#ef4444;">Error: PDF Library failed to load. Please check your internet or refresh.</span>';
    return;
  }

  try {
    if (overlay) overlay.style.display = 'block';
    if (status) status.innerText = `Processing: ${file.name}...`;

  const results    = document.getElementById('audit-results');
  const loadingTxt = document.getElementById('ai-loading-text');

  if (overlay) overlay.style.display = 'block';
  if (results) results.innerHTML = '';
  if (status)  status.innerHTML  = '';

  try {
    const arrayBuffer = await file.arrayBuffer();
    const pdf = await pdfjsLib.getDocument({ data: arrayBuffer }).promise;
    let pageData = [];
    let detectedNPIs = [];
    const npiRegex = /\b[1-9][0-9]{9}\b/g;

    for (let i = 1; i <= pdf.numPages; i++) {
      const page = await pdf.getPage(i);
      const tc   = await page.getTextContent();
      const items = tc.items.map(item => {
        const m = item.str.match(npiRegex);
        if (m) detectedNPIs.push(...m);
        return { str: item.str, x: item.transform[4], y: item.transform[5], width: item.width, height: item.height };
      });
      pageData.push(items);
    }

    // OCR fallback for image-only PDFs
    const totalWords = pageData.flat().reduce((a, it) => a + it.str.split(/\s+/).length, 0);
    if (totalWords < 20) {
      if (loadingTxt) loadingTxt.textContent = 'No text layer — running OCR fallback (may take ~30s)…';
      if (!window.Tesseract) {
        await new Promise(res => {
          const s = document.createElement('script');
          s.src = 'https://cdn.jsdelivr.net/npm/tesseract.js@5/dist/tesseract.min.js';
          s.onload = res;
          document.head.appendChild(s);
        });
      }
      const canvas = document.createElement('canvas');
      const ctx    = canvas.getContext('2d');
      pageData = [];
      for (let i = 1; i <= pdf.numPages; i++) {
        const page     = await pdf.getPage(i);
        const viewport = page.getViewport({ scale: 2.0 });
        canvas.width = viewport.width; canvas.height = viewport.height;
        await page.render({ canvasContext: ctx, viewport }).promise;
        const { data: { blocks } } = await Tesseract.recognize(canvas, 'eng');
        const ocrItems = blocks.flatMap(b => b.paragraphs.flatMap(p => p.lines.flatMap(l => l.words.map(w => {
          const m = w.text.match(npiRegex);
          if (m) detectedNPIs.push(...m);
          return { str: w.text, x: w.bbox.x0 / 2, y: (viewport.height - w.bbox.y0) / 2, width: (w.bbox.x1 - w.bbox.x0) / 2, height: (w.bbox.y1 - w.bbox.y0) / 2 };
        }))));
        pageData.push(ocrItems);
      }
    }

    if (overlay) overlay.style.display = 'none';
    if (status)  status.innerHTML = `✅ Analyzed ${pdf.numPages} page(s) from <strong>${file.name}</strong>`;
    const structuredRows = reconstructRowsFromLayout(pageData);
    runAudit(structuredRows, detectedNPIs);

  } catch (err) {
    if (overlay) overlay.style.display = 'none';
    if (status)  status.innerHTML = `<span style="color:var(--danger);">⚠️ ${err.message}</span>`;
  }
}

// ── Layout Reconstruction ─────────────────────────────────────────────────────
function reconstructRowsFromLayout(pages) {
  const allRows = [];
  pages.forEach(items => {
    const yGroups = {};
    items.forEach(item => {
      if (!item.str.trim()) return;
      const y = Math.round(item.y / 6) * 6; // Refined tolerance from 10 to 6 for tighter row reconstruction to prevent line merging
      (yGroups[y] = yGroups[y] || []).push(item);
    });
    Object.keys(yGroups).sort((a, b) => b - a).forEach(y => {
      const lineText = yGroups[y].sort((a, b) => a.x - b.x).map(i => i.str).join(' ');
      const row = extractRowsFromRawLine(lineText);
      if (row) allRows.push(row);
    });
  });
  return filterNormalRows(allRows);
}

function filterNormalRows(rows) {
  return rows.filter(r => {
    const d = (r.desc || '').toUpperCase();
    if (['TEST','FAKE','SAMPLE','VOID'].some(k => d.includes(k))) return false;
    if (!r.code && r.total === 0) return false;
    return true;
  });
}

// ── Smart Amount Parser (v3 — label-aware) ────────────────────────────────────
/**
 * Parses dollar amounts from a line using labeled context first.
 * Marks priceWasDerived=true whenever price is back-calculated.
 */
function parseAmounts(amounts, lineCtx = '') {
  let price = 0, qty = 1, total = 0, paid = 0, owed = 0, priceWasDerived = false;
  const ctx = lineCtx.toLowerCase();

  const hasAdjLabel = /adjust|contractual|write.?off|discount/i.test(ctx);
  const hasPaidLabel = /insurance paid|plan paid|\bpaid\b|\bbenefit\b/i.test(ctx);
  const hasOwedLabel = /patient|you owe|amount due|balance|responsibility/i.test(ctx);

  // ── Manual Label Overrides (Prioritized) ──
  const qtyMatch   = ctx.match(/qty|quantity|units?[:\s]+(\d+)/i);
  const priceMatch = ctx.match(/price|rate|unit price[:\s]+\$?(\d+(?:\.\d+)?)/i);
  const totalMatch = ctx.match(/total|billed|charge[:\s]+\$?(\d+(?:\.\d+)?)/i);
  const paidMatch  = ctx.match(/paid|ins paid[:\s]+\$?(\d+(?:\.\d+)?)/i);
  const owedMatch  = ctx.match(/owed|patient owed|pt owed[:\s]+\$?(\d+(?:\.\d+)?)/i);

  if (qtyMatch)   qty   = parseFloat(qtyMatch[1]);
  if (priceMatch) price = parseFloat(priceMatch[1]);
  if (totalMatch) total = parseFloat(totalMatch[1]);
  if (paidMatch)  paid  = parseFloat(paidMatch[1]);
  if (owedMatch)  owed  = parseFloat(owedMatch[1]);

  // If we found specific labels, skip most heuristics
  const hasStrongLabels = (totalMatch || priceMatch || paidMatch);

  if (!hasStrongLabels) {
    switch (amounts.length) {
      case 0:
        break;
      case 1:
        total = amounts[0];
        break;
      case 2:
        if (amounts[0] > amounts[1] * 2) { total = amounts[0]; owed = amounts[1]; }
        else { price = amounts[0]; total = amounts[1]; }
        break;
      case 3:
        // Check for qty×price=total pattern (qty must be small integer)
        if (amounts[0] < 20 && Number.isInteger(amounts[0]) &&
            Math.abs(amounts[0] * amounts[1] - amounts[2]) < 1.50) {
          qty = amounts[0]; price = amounts[1]; total = amounts[2];
        } else if (hasAdjLabel || hasPaidLabel) {
          // EOB: billed / paid / patient-owed
          total = amounts[0]; paid = amounts[1]; owed = amounts[2];
        } else {
          // Default 3-column: treat largest as total
          const sorted = [...amounts].sort((a, b) => b - a);
          total = sorted[0];
          paid  = amounts.find(a => a !== total) || 0;
          owed  = amounts[amounts.length - 1] !== total ? amounts[amounts.length - 1] : 0;
        }
        break;
      default: {
        // 4+ amounts: EOB format — billed | allowed | paid | patient-owed
        total = amounts[0];
        // Search for best paid+owed pair that sums close to total
        let bestDiff = Infinity;
        for (let i = 1; i < amounts.length - 1; i++) {
          for (let j = i + 1; j < amounts.length; j++) {
            const diff = Math.abs(amounts[i] + amounts[j] - total);
            if (diff < bestDiff) { bestDiff = diff; paid = amounts[i]; owed = amounts[j]; }
          }
        }
        // If nothing fits within 30%, fall back to last two
        if (bestDiff > total * 0.30) {
          paid = amounts[amounts.length - 2];
          owed = amounts[amounts.length - 1];
        }
        break;
      }
    }
  }

  if (price === 0 && total > 0) {
    price = total / qty;
    priceWasDerived = true;
  }

  return { price, qty, total, paid, owed, priceWasDerived };
}

// ── Row Extraction ─────────────────────────────────────────────────────────────
const TOTAL_ROW_RE = /\b(grand total|total due|amount due|balance due|total charges|subtotal)\b/i;

function extractRowsFromRawLine(line) {
  const dateRegex  = /\b(\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4})\b/g;
  const codeRegex  = /\b([1-9]\d{4}|[1-9]\d{2})(?:-([A-Z0-9]{1,2}))?\b/g;
  const moneyRegex = /(?:^|\s|\$)\s?(\d{1,7}(?:,\d{3})*(?:\.\d{2})?)(?=\s|$)/g;

  // 1. Extract Date and Code early
  const dates = line.match(dateRegex);
  const rawCodes   = [...line.matchAll(codeRegex)];
  
  // Distinguish CPT (5-digit) vs DRG (3-digit)
  const validCPTs = rawCodes.filter(m => m[1].length === 5 && isValidCPT(m[1]));
  const validDRGs = rawCodes.filter(m => m[1].length === 3);

  const code       = (validCPTs.length > 0) ? validCPTs[0][1] : (validDRGs.length > 0 ? validDRGs[0][1] : '');
  const modifier   = (validCPTs.length > 0 && validCPTs[0][2]) ? validCPTs[0][2] : '';
  const isDRG      = code.length === 3;

  // 2. SCRUB: Remove dates and codes from a work copy before finding money
  let scrubberLine = line;
  if (dates) dates.forEach(d => scrubberLine = scrubberLine.replace(d, ' '));
  rawCodes.forEach(c => scrubberLine = scrubberLine.replace(c[0], ' '));

  const moneyMatches = [...scrubberLine.matchAll(moneyRegex)];
  if (!dates && !code && moneyMatches.length === 0) return null;

  const amounts = moneyMatches.map(m => parseFloat(m[1].replace(/,/g, '')));
  const parsed  = parseAmounts(amounts, line);

  let desc = line
    .replace(dateRegex, ' ').replace(codeRegex, ' ').replace(moneyRegex, ' ')
    .replace(/[|:,\-]/g, ' ').replace(/\s+/g, ' ').trim();
  if (desc.length > 60) desc = desc.substring(0, 57) + '…';

  return {
    date:            dates ? dates[0] : '',
    code,
    modifier,
    isDRG,
    desc:            desc || (isDRG ? 'Hospital Stay' : 'Medical Service'),
    qty:             parsed.qty || 1,
    price:           parsed.price,
    total:           parsed.total,
    paid:            parsed.paid,
    owed:            parsed.owed,
    priceWasDerived: parsed.priceWasDerived,
    isTotalRow:      TOTAL_ROW_RE.test(line),
  };
}

function extractRowsFromText(text) {
  return text.split('\n').filter(l => l.trim().length > 3)
    .map(l => extractRowsFromRawLine(l)).filter(Boolean);
}

// ── Workspace UI ──────────────────────────────────────────────────────────────
function runAudit(input, detectedNPIs = []) {
  const workspace = document.getElementById('audit-workspace-container');
  const results   = document.getElementById('audit-results');
  if (!workspace || !results) return;

  document.getElementById('workspace-body').innerHTML = '';
  results.innerHTML = '';

  const rows = Array.isArray(input) ? input : extractRowsFromText(input || '');
  workspace.style.display = 'block';
  const sidebar = document.getElementById('billing-context-sidebar');
  if (sidebar) sidebar.style.display = 'block';

  if (rows.length === 0) {
    addWorkspaceRow();
    results.innerHTML = `<div class="audit-finding" style="text-align:center"><p>No billable items found. Add them manually below.</p></div>`;
  } else {
    rows.forEach(r => addWorkspaceRow(r));
    workspace.dataset.npis = JSON.stringify(detectedNPIs);
    reRunWorkspaceAudit();
  }
}
window.runAudit = runAudit;

/** Called by paste-text tab "Analyze Text" button */
function runAuditPaste() {
  const text = document.getElementById('bill-text')?.value;
  if (text && text.trim()) runAudit(text);
}
window.runAuditPaste = runAuditPaste;

function runAuditLines() {
  const text = document.getElementById('line-items-text')?.value;
  if (text && text.trim()) runAudit(text);
}
window.runAuditLines = runAuditLines;

function addWorkspaceRow(data = {}) {
  const body = document.getElementById('workspace-body');
  if (!body) return;
  const row = document.createElement('tr');
  row.innerHTML = `
    <td contenteditable="true" oninput="debouncedAudit()">${data.date || ''}</td>
    <td contenteditable="true" oninput="debouncedAudit()" style="font-family:monospace;font-weight:bold;">${data.code || ''}</td>
    <td contenteditable="true" oninput="debouncedAudit()" style="font-family:monospace;font-size:11px;color:var(--accent);">${data.modifier || ''}</td>
    <td contenteditable="true" oninput="debouncedAudit()">${data.desc || ''}</td>
    <td contenteditable="true" oninput="debouncedAudit()" style="text-align:center;">${data.qty || 1}</td>
    <td contenteditable="true" oninput="debouncedAudit()" style="text-align:right;">${(data.price || 0).toFixed(2)}</td>
    <td contenteditable="true" oninput="debouncedAudit()" style="text-align:right;font-weight:bold;">${(data.total || 0).toFixed(2)}</td>
    <td contenteditable="true" oninput="debouncedAudit()" style="text-align:right;color:#22c55e;">${(data.paid || 0).toFixed(2)}</td>
    <td contenteditable="true" oninput="debouncedAudit()" style="text-align:right;color:#ef4444;">${(data.owed || 0).toFixed(2)}</td>
    <td><button onclick="this.closest('tr').remove();debouncedAudit();" style="background:none;border:none;color:var(--danger);cursor:pointer;font-size:16px;">✕</button></td>
  `;
  if (data.priceWasDerived) row.dataset.derived = 'true';
  body.appendChild(row);
}

const debouncedAudit = window.debounce(() => reRunWorkspaceAudit(), 300);
window.debouncedAudit = debouncedAudit;

async function reRunWorkspaceAudit() {
  const trs     = document.querySelectorAll('#workspace-body tr');
  const results = document.getElementById('audit-results');
  if (!results) return;

  const rows = Array.from(trs).map((tr, idx) => {
    const tds  = tr.querySelectorAll('td');
    const qty   = parseInt(tds[4].innerText, 10) || 1;
    const price = parseFloat(tds[5].innerText) || 0;
    const total = parseFloat(tds[6].innerText) || 0;
    const paid  = parseFloat(tds[7].innerText) || 0;
    const owed  = parseFloat(tds[8].innerText) || 0;
    // CRITICAL: We only skip arithmetic if the row was originally auto-calculated by the parser.
    // Manual edits in the workspace should ALWAYS be validated.
    let priceWasDerived = false;
    if (tr.dataset.derived === 'true') {
      priceWasDerived = (price === 0 || (total > 0 && Math.abs(price - total / qty) < 0.02));
    }
    return {
      idx,
      date:            tds[0].innerText.trim(),
      code:            tds[1].innerText.trim(),
      modifier:        tds[2].innerText.trim().replace(/^-/, ''),
      desc:            tds[3].innerText.trim(),
      qty, price, total, paid, owed,
      priceWasDerived,
      isTotalRow: TOTAL_ROW_RE.test(tds[3].innerText),
      raw: tr,
    };
  });

  const multiplier = parseFloat(document.getElementById('payer-type')?.value) || 2.5;
  const npiData    = document.getElementById('audit-workspace-container')?.dataset.npis;
  const npis       = npiData ? JSON.parse(npiData) : [];
  const gpci       = parseFloat(document.getElementById('gpci-region')?.value || '1.0');
  const isFacility = document.getElementById('facility-type')?.value === 'hospital';

  const engine = new BucketAuditor(rows, multiplier, npis, gpci, isFacility);
  engine.runArithmetic();
  engine.runInvoiceSumCheck();
  engine.runBundling();
  engine.runDRGAudit();
  engine.runDuplicates();
  engine.runFrequencyAudit();
  engine.runFinancialSummaryAudit();
  engine.runClinicalCompatibilityAudit();
  engine.runPOSAudit();
  engine.runMultipleProcedureAudit();
  engine.runConsistency();
  engine.runSemantic();
  engine.runCompleteness();
  engine.runModifiers();
  engine.runDateSanity();
  await engine.runDatabaseCheck();
  await engine.resolveNPIProviders();
  engine.finalizeDeduplication();

  const confidence = engine.computeConfidence();
  currentEngineFindings = engine.findings; // Save for PDF
  currentEngineSavings  = engine.potentialSavings;
  renderCategorizedFindings(engine.findings, results, rows.length, rows, engine.potentialSavings, engine.totalBenchmark, confidence);
}

// ══════════════════════════════════════════════════════════════════════════════
// BucketAuditor — 3-Layer Validation Engine (v3.0)
// ══════════════════════════════════════════════════════════════════════════════
class BucketAuditor {
  constructor(rows, multiplier = 2.5, npis = [], gpci = 1.0, isFacility = false) {
    this.rows             = rows;
    this.multiplier       = multiplier;
    this.npis             = npis;
    this.gpci             = gpci;
    this.isFacility       = isFacility;
    this.findings         = [];
    this.potentialSavings = 0;
    this.totalBenchmark   = 0;
    this.dbCheckRan       = false;
    this._rowSavings      = {}; // per-row savings tracker for deduplication cap
    this._lineItemSum     = 0;
    this._benchmarkHits   = 0;
    this._hasReconError   = false;
  }

  addFinding(category, title, detail, type = 'warn', codeRef = '') {
    this.findings.push({ category, title, detail, type, codeRef });
  }

  /** Add savings, capped per row so no row exceeds its own total */
  addRowSavings(rowIdx, amount, rowTotal) {
    if (amount <= 0) return;
    const cap        = rowTotal > 0 ? rowTotal : amount;
    const already    = this._rowSavings[rowIdx] || 0;
    const canAdd     = Math.max(0, cap - already);
    const actual     = Math.min(amount, canAdd);
    this._rowSavings[rowIdx] = already + actual;
    this.potentialSavings   += actual;
  }

  finalizeDeduplication() {
    this.potentialSavings = Math.round(this.potentialSavings * 100) / 100;
  }

  getBenchmark(code) {
    let base = INLINE_BENCHMARK[code] || null;
    if (!base) return null;

    let price = base.price * parseFloat(this.gpci || 1.0);
    if (this.isFacility) price *= FACILITY_PROF_MULT;

    return { price, desc: base.desc };
  }

  // ── LAYER 1 — Arithmetic Accuracy ────────────────────────────────────────
  runArithmetic() {
    let lineSum = 0;
    this.rows.forEach((r, idx) => {
      if (r.raw) r.raw.classList.remove('audit-row-error', 'audit-row-warn', 'audit-row-info');
      if (r.isTotalRow) return;
      lineSum += r.total;

      // 1a. qty × price = total (skip rows where price was back-derived)
      if (!r.priceWasDerived && r.total > 0 && r.price > 0) {
        const expected = Math.round(r.qty * r.price * 100) / 100;
        if (Math.abs(expected - r.total) > 0.15) {
          this.addFinding('arithmetic', 'Math Mismatch',
            `${r.code || r.desc}: ${r.qty} × $${r.price.toFixed(2)} = $${expected.toFixed(2)}, but billed $${r.total.toFixed(2)}.`,
            'danger', r.code);
          if (r.raw) r.raw.classList.add('audit-row-error');
          if (r.total > expected) this.addRowSavings(idx, r.total - expected, r.total);
        }
      }

      // 1b. paid + owed ≈ total (allow epsilon for rounding/adjustments)
      if (r.total > 0 && (r.paid > 0 || r.owed > 0)) {
        const sumPO = Math.round((r.paid + r.owed) * 100) / 100;
        const diff  = Math.abs(sumPO - r.total);
        // $1.00 tolerance (epsilon) to prevent false positives on rounding/contractual matches
        if (diff > 1.00 && diff > r.total * 0.05) {
          this.addFinding('arithmetic', 'Responsibility Gap',
            `${r.code || r.desc}: Ins. paid ($${r.paid.toFixed(2)}) + Patient owed ($${r.owed.toFixed(2)}) = $${sumPO.toFixed(2)}, doesn't match billed $${r.total.toFixed(2)}. Check for missing contractual adjustment.`,
            'warn', r.code);
        }
      }

      // 1c. Negative values
      if (r.total < 0 || r.paid < 0 || r.owed < 0) {
        this.addFinding('arithmetic', 'Negative Amount',
          `${r.code || r.desc} contains a negative dollar value. Verify it is an authorized credit.`, 'warn', r.code);
      }
    });
    this._lineItemSum = lineSum;
  }

  // ── LAYER 1E — Duplicate Detection ───────────────────────────────────────
  runDuplicates() {
    const registry = {};
    this.rows.forEach((r, idx) => {
      if (!r.code || r.isTotalRow) return;
      const dKey = r.date || 'UNDATED';
      const key = `${dKey}|${r.code}|${r.modifier || ''}`;
      (registry[key] = registry[key] || []).push({ r, idx });
    });
    Object.values(registry).forEach(entries => {
      if (entries.length < 2) return;
      const { r } = entries[0];
      const label = r.code + (r.modifier ? '-' + r.modifier : '');
      this.addFinding('duplicate', 'Duplicate Charge',
        `CPT ${label} appears ${entries.length}× on ${r.date || 'same date'}. Only one is typically payable.`,
        'danger', r.code);
      entries.forEach(({ r: er }) => { if (er.raw) er.raw.classList.add('audit-row-error'); });
      for (let i = 1; i < entries.length; i++) {
        this.addRowSavings(entries[i].idx, entries[i].r.total, entries[i].r.total);
      }
    });
  }

  // ── LAYER 1F — Frequency (MUE) ───────────────────────────────────────────
  runFrequencyAudit() {
    const freq = {};
    this.rows.forEach((r, idx) => {
      if (!r.code || r.isTotalRow) return;
      const key = `${r.date || 'UNDATED'}|${r.code}`;
      freq[key] = (freq[key] || []);
      freq[key].push({ r, idx });
    });
    Object.entries(freq).forEach(([key, entries]) => {
      const code = entries[0].r.code;
      const limit = window.MH_CONSTANTS.MUE_LIMITS[code];
      if (!limit) return;
      
      // Calculate total units (sum of qty)
      const totalUnits = entries.reduce((s, e) => s + (parseInt(e.r.qty, 10) || 1), 0);
      
      if (totalUnits > limit) {
        const date = entries[0].r.date || 'same date';
        this.addFinding('frequency', 'Frequency Limit Exceeded (MUE)',
          `CPT ${code} billed ${totalUnits}× units on ${date}. US Medicare guidelines limit this code to ${limit}/day. Excess units are non-payable.`,
          'danger', code);
        
        let allowance = limit;
        entries.forEach(e => {
          const rowQty = e.r.qty || 1;
          if (allowance <= 0) {
            // Entire row is excess
            this.addRowSavings(e.idx, e.r.total, e.r.total);
          } else if (rowQty > allowance) {
            // Partial row is excess (e.g., Qty 2 with 1 unit left in allowance)
            const unitPrice = e.r.total / rowQty;
            const excess = rowQty - allowance;
            this.addRowSavings(e.idx, excess * unitPrice, e.r.total);
            allowance = 0;
          } else {
            allowance -= rowQty;
          }
        });
      }
    });
  }

  // ── LAYER 1G — Financial Reconciliation ──────────────────────────────────
  runFinancialSummaryAudit() {
    const totalBilled = this.rows.filter(r => !r.isTotalRow).reduce((s, r) => s + r.total, 0);
    const totalPaid   = this.rows.filter(r => !r.isTotalRow).reduce((s, r) => s + r.paid, 0);
    const totalOwed   = this.rows.filter(r => !r.isTotalRow).reduce((s, r) => s + r.owed, 0);
    
    // Gap check
    const reconSum = Math.round((totalPaid + totalOwed) * 100) / 100;
    const gap = Math.abs(totalBilled - reconSum);
    
    if (totalPaid > totalBilled * 1.05 && totalPaid > 100) {
      this._hasReconError = true;
      this.addFinding('financial', 'Insurance Overpayment Detected',
        `Total insurance paid ($${totalPaid.toFixed(2)}) exceeds total billed ($${totalBilled.toFixed(2)}). This signals a critical audit error or billing fraud.`,
        'danger');
    }
    
    if (totalOwed < -0.01) {
      this._hasReconError = true;
      this.addFinding('financial', 'Negative Patient Balance',
        `Patient total responsibility is negative ($${totalOwed.toFixed(2)}). This indicates you are owed a refund for previous overpayments.`,
        'danger');
    }
    
    if (gap > 100 && gap > totalBilled * 0.10) {
       this._hasReconError = true;
       this.addFinding('financial', 'Responsibility Reconciliation Gap',
         `Billed ($${totalBilled.toFixed(2)}) does not balance with Paid+Owed ($${reconSum.toFixed(2)}). A $${gap.toFixed(2)} discrepancy suggests missing contractual adjustments or unrecorded payments.`,
         'warn');
    }

    // Zero-Pay High Value Signal (v3.9)
    this.rows.forEach(r => {
      if (!r.isTotalRow && r.total > 500 && r.paid === 0) {
        this.addFinding('financial', 'Zero Insurance Payment Alert',
          `Line item "${r.desc}" billed at $${r.total.toFixed(2)} shows $0.00 insurance payment. This is a red flag for a "Silent Denial" or processing oversight.`,
          'warn', r.code);
      }
    });
  }

  // ── LAYER 1H — Place of Service (POS) Validation (v3.9) ──────────────────
  runPOSAudit() {
    const inpatientCodes = new Set(['99221', '99222', '99223', '99231', '99232', '99233']);
    if (!this.isFacility) {
      this.rows.forEach(r => {
        if (r.code && inpatientCodes.has(r.code)) {
          this.addFinding('compatibility', 'Institutional Code Mismatch',
            `Hospital Inpatient CPT ${r.code} detected while in "Office/Clinic" mode. This is a Place-of-Service (POS) mismatch. Verify if service was actually provided in a hospital.`,
            'danger', r.code);
        }
      });
    }
  }

  // ── LAYER 1I — Multiple Procedure Audit (-51) (v4.0) ─────────────────────
  runMultipleProcedureAudit() {
    const dates = {};
    this.rows.forEach((r, idx) => {
      if (!isSurgeryCode(r.code) || r.isTotalRow) return;
      const d = r.date || 'UNDATED';
      (dates[d] = dates[d] || []).push({ r, idx });
    });

    Object.entries(dates).forEach(([date, entries]) => {
      if (entries.length < 2) return;
      // Filter for rows missing -51 modifier
      const missing51 = entries.filter(e => {
        const mod = (e.r.modifier || '').replace(/^-/, '');
        return mod !== '51';
      });

      if (missing51.length >= 2) {
        this.addFinding('modifier', 'Multiple Procedure Reduction Missing (-51)',
          `Multiple surgical procedures (${entries.length}) billed on ${date} without a -51 modifier. Primary payers typically discount the second procedure by 50%. Potential overcharge detected.`,
          'warn');
      }
    });
  }

  // ── LAYER 1H — Clinical Compatibility ────────────────────────────────────
  runClinicalCompatibilityAudit() {
    const codesByDate = {};
    this.rows.forEach(r => {
      if (!r.code || r.isTotalRow) return;
      const d = r.date || 'UNDATED';
      (codesByDate[d] = codesByDate[d] || new Set()).add(r.code);
    });

    this.rows.forEach(r => {
      if (!r.code || r.isTotalRow) return;
      const rule = CPT_CLINICAL_GROUPS[r.code];
      if (!rule) return;
      const sameDayCodes = codesByDate[r.date || 'UNDATED'] || new Set();

      // Check: required companion code missing
      if (rule.requires) {
        const hasCompanion = [...rule.requires].some(c => sameDayCodes.has(c));
        // Only warn if there's actually other stuff going on that day (size > 1) 
        // to avoid flagging completely isolated bills that might be part of a larger file.
        if (!hasCompanion && sameDayCodes.size > 1) {
          this.addFinding('compatibility', 'Isolated Procedure — Missing Clinical Support',
            `${rule.label} billed without any expected support codes on ${r.date || 'this date'}. US Medicare guidelines suggest this procedure should exist within a high-level diagnostic context.`,
            'warn', r.code);
        }
      }

      // Check: incompatible code present same day
      if (rule.incompatible) {
        rule.incompatible.forEach(bad => {
          if (sameDayCodes.has(bad)) {
            this.addFinding('compatibility', 'Clinically Incompatible Service Pair',
              `${rule.label} and CPT ${bad} billed on the same date (${r.date || 'unknown'}). These services are clinically incompatible when performed together — verify encounter documentation.`,
              'danger', r.code);
          }
        });
      }
    });
  }

  // ── LAYER 1I — Multiple Provider NPI Resolution (v4.1) ──────────────────
  async resolveNPIProviders() {
    if (this.npis.length === 0) return;

    // Deduplicate NPIs found in the document
    const uniqueNPIs = [...new Set(this.npis)].slice(0, 3); // Cap at 3 to avoid rate-limit

    const resolvedProviders = [];

    await Promise.allSettled(
      uniqueNPIs.map(async (npi, index) => {
        try {
          const res = await fetch(`${NPPES_API}${npi}`);
          if (!res.ok) return;
          const data = await res.json();
          if (!data.results?.length) return;

          const p         = data.results[0];
          const name      = p.basic.organization_name || `${p.basic.first_name} ${p.basic.last_name}`;
          const specialty = p.taxonomies?.[0]?.desc || 'Medical Professional';
          const role      = index === 0 ? 'Billing' : 'Rendering';

          resolvedProviders.push({ npi, name, specialty, role });

          // Cross-check: rendering provider specialty vs. billed codes
          if (role === 'Rendering') {
            const isPsychBilling = this.rows.some(r => r.code === '90837' || r.code === '90834');
            const isSurgeryBilling = this.rows.some(r => isSurgeryCode(r.code));
            const isPsychSpec = /psych|mental|behav/i.test(specialty);
            const isSurgSpec  = /surg/i.test(specialty);

            if (isPsychBilling && isSurgeryBilling && !isPsychSpec && !isSurgSpec) {
              this.addFinding('compatibility', 'Provider Specialty Mismatch',
                `Rendering provider ${name} (${specialty}) is billing codes from clinically incompatible specialties (Psychotherapy + Surgery) in the same encounter. Verify correct NPI was used.`,
                'warn');
            }
          }
        } catch (e) {
          console.warn(`NPI resolution error for ${npi}:`, e);
        }
      })
    );

    // Update rich card (v4.2 Premium Visual)
    if (resolvedProviders.length > 0) {
      const primary = resolvedProviders[0];
      const container = document.getElementById('verified-provider-container');
      const content = document.getElementById('provider-card-content');
      
      if (container && content) {
        container.style.display = 'block';
        
        const otherDocs = resolvedProviders.slice(1);
        const otherHtml = otherDocs.length > 0 
          ? `<div style="margin-top:8px; padding-top:8px; border-top:1px solid var(--border); font-size:11px; color:var(--text-muted);">
               Found other associated NPIs: ${otherDocs.map(o => `<b>${o.name}</b> (${o.role})`).join(', ')}
             </div>`
          : '';

        content.innerHTML = `
          <div style="display:flex; align-items:flex-start; gap:12px;">
            <div style="background:var(--accent); color:white; width:36px; height:36px; border-radius:8px; display:flex; align-items:center; justify-content:center; flex-shrink:0;">
               <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><polyline points="17 11 19 13 23 9"></polyline></svg>
            </div>
            <div style="flex-grow:1;">
              <div style="font-size:14px; font-weight:700; color:var(--text-main); line-height:1.2;">${primary.name}</div>
              <div style="font-size:12px; color:var(--accent); font-weight:600; margin-top:2px;">${primary.specialty}</div>
              <div style="display:flex; gap:6px; margin-top:8px; flex-wrap:wrap;">
                <span style="font-size:10px; padding:2px 6px; background:rgba(6,182,212,0.1); border:1px solid var(--accent); border-radius:4px; color:var(--accent); font-weight:700;">NPI: ${primary.npi}</span>
                <span style="font-size:10px; padding:2px 6px; background:rgba(59,130,246,0.1); border:1px solid #3b82f6; border-radius:4px; color:#3b82f6; font-weight:700;">${primary.role} Provider</span>
              </div>
            </div>
          </div>
          ${otherHtml}
        `;
      }
      this._verifiedProviders = resolvedProviders;
      this._verifiedProvider  = primary.name;
    }
  }

  // ── LAYER 1E — Institutional DRG Audit ───────────────────────────────────
  runDRGAudit() {
    this.rows.forEach((r, idx) => {
      if (!r.isDRG || r.total <= 0) return;
      
      const bench = DRG_BENCHMARKS[r.code];
      const weight = bench ? bench.weight : 1.0;
      const expected = DRG_BASE_RATE * weight;
      
      if (r.total > expected * 2.0) {
        this.addFinding('benchmark', 'Excessive Hospital Charge (DRG)',
          `Institutional DRG ${r.code}${bench ? ` (${bench.desc})` : ''} billed at $${r.total.toFixed(2)} is extreme relative to the US Base Rate of $${expected.toFixed(2)}. Possible "revenue code" padding or severity-level upcoding.`,
          'danger', r.code);
        if (r.raw) r.raw.classList.add('audit-row-error');
        this.addRowSavings(idx, r.total - expected, r.total);
      } else if (r.total > expected * 1.5) {
        this.addFinding('benchmark', 'High DRG Variance',
          `Institutional DRG ${r.code} exceeds national benchmark. Verify if this hospital is in a high-cost outlier category.`,
          'warn', r.code);
      }
    });
  }

  runInvoiceSumCheck() {
    const totalRow = this.rows.find(r => r.isTotalRow && r.total > 0);
    if (!totalRow) return;
    const diff = Math.abs(this._lineItemSum - totalRow.total);
    if (diff > 1.00) {
      this.addFinding('arithmetic', 'Invoice Total Mismatch',
        `Line items sum to $${this._lineItemSum.toFixed(2)} but invoice total shows $${totalRow.total.toFixed(2)} — a $${diff.toFixed(2)} discrepancy.`,
        'danger');
      this.addRowSavings('invoice-total', diff, totalRow.total);
    }
  }



  // ── LAYER 2B — Pricing Consistency ───────────────────────────────────────
  runConsistency() {
    const codeGroups = {};
    this.rows.forEach((r, idx) => {
      if (!r.code || r.isTotalRow || r.price <= 0 || r.priceWasDerived) return;
      (codeGroups[r.code] = codeGroups[r.code] || []).push({ price: r.price, date: r.date, idx });
    });
    Object.entries(codeGroups).forEach(([code, entries]) => {
      if (entries.length < 2) return;
      const prices = entries.map(e => e.price);
      const max = Math.max(...prices), min = Math.min(...prices);
      if (min > 0 && max / min > 1.50 && max - min > 50) {
        this.addFinding('consistency', 'Unit Price Inconsistency',
          `CPT ${code} billed at $${min.toFixed(2)}–$${max.toFixed(2)} across visits (${Math.round((max/min-1)*100)}% variance, $${(max-min).toFixed(2)} gap). Possible fee-schedule error.`,
          'warn', code);
      }
    });
  }

  // ── LAYER 2C — Semantic Flags ─────────────────────────────────────────────
  runSemantic() {
    const KEYWORDS = [
      { re: /not medically necessary/i,          title: 'Not Medically Necessary',   detail: 'Insurer may refuse payment — document clinical justification.' },
      { re: /non.?covered/i,                     title: 'Non-Covered Service',        detail: 'This service may not be covered by your plan.' },
      { re: /benefit maximum/i,                  title: 'Benefit Limit Reached',      detail: 'Annual benefit cap may have been exceeded.' },
      { re: /coordination of benefits/i,         title: 'COB Detected',               detail: 'Multiple-insurer coordination — verify primary payer.' },
      { re: /experimental|investigational/i,     title: 'Experimental Service',       detail: 'Experimental treatments are routinely excluded.' },
      { re: /pre.?existing/i,                        title: 'Pre-Existing Condition',     detail: 'Verify this exclusion is still enforceable under ACA.' },
      { re: /out.?of.?network/i,                     title: 'Out-of-Network Charge',      detail: 'Out-of-network rates can be 2–4× in-network. Dispute balance billing.' },
      { re: /prior auth|pre.?auth/i,                 title: 'Prior Authorization Issue',  detail: 'Services without prior auth are commonly denied.' },
      { re: /\bdenied\b/i,                           title: 'Claim Denied',               detail: 'A denied line item on the EOB — you have 180 days to appeal.' },
      { re: /\bduplicate\b/i,                        title: 'Duplicate Flagged by Payer', detail: 'Insurer marked this a duplicate — review original claim.' },
      { re: /write.?off/i,                           title: 'Write-Off Note',             detail: 'You should NOT owe amounts the provider wrote off as contractual.' },
      { re: /limit\b.*\bexceed|exceed.*limit/i,      title: 'Limit Exceeded',             detail: 'Annual or visit limit reached — check your plan documents.' },
      { re: /medical necessity/i,                    title: 'Medical Necessity Note',     detail: 'Requires documentation of clinical need to be payable.' },
      { re: /patient responsibility waived/i,        title: 'Waived Responsibility',      detail: 'Waiving co-pays can violate insurance contracts — verify.' },
    ];

    // ── FIX: scan per-row, not full-text concat (v4.1 Traceability) ──
    const fired = new Set();

    this.rows.forEach(r => {
      const haystack = `${r.desc || ''} ${r.code || ''}`.toLowerCase();
      KEYWORDS.forEach(({ re, title, detail }) => {
        if (!re.test(haystack)) return;

        // Deduplicate: same keyword firing on multiple rows → one finding with all codes listed
        if (fired.has(title)) {
          const existing = this.findings.find(f => f.title === title && f.category === 'semantic');
          if (existing && r.code && !existing.codeRef.includes(r.code)) {
            existing.codeRef += `, ${r.code}`;
            existing.detail  += ` (also: ${r.code})`;
          }
          return;
        }

        fired.add(title);
        this.addFinding('semantic', title, detail, 'warn', r.code || '');
      });
    });
  }

  // ── LAYER 2D — Clinical Completeness ─────────────────────────────────────
  runCompleteness() {
    // Unitemized charges
    this.rows.forEach(r => {
      if (r.total > 100 && !r.code && !r.isTotalRow && !/total/i.test(r.desc)) {
        this.addFinding('completeness', 'Unitemized Charge',
          `$${r.total.toFixed(2)} charge "${r.desc}" has no CPT code. Unitemized charges are legally disputable in most states.`, 'warn');
      }
    });

    // High-complexity E&M upcoding risk
    Object.entries(HIGH_COMPLEXITY_EM).forEach(([code, info]) => {
      if (this.rows.find(r => r.code === code)) {
        this.addFinding('completeness', 'High-Level E&M — Upcoding Risk',
          `CPT ${code} (${info.label}) requires ≥${info.minMin} min of documented physician time. Frequently upcoded for short visits. Request visit notes.`,
          'warn', code);
      }
    });

    // Invalid CPT range
    this.rows.forEach(r => {
      if (r.code && !classifyCPT(r.code)) {
        this.addFinding('completeness', 'Invalid CPT Code',
          `"${r.code}" falls outside all valid CPT ranges (10000–99999). Possible ZIP code or data-entry error.`, 'danger', r.code);
      }
    });

    // Missing service dates
    const missingDates = this.rows.filter(r => !r.date && r.total > 50 && !r.isTotalRow).length;
    if (missingDates > 0) {
      this.addFinding('completeness', 'Missing Service Dates',
        `${missingDates} line item(s) have no service date. Dates are required for duplicate detection and claims verification.`, 'warn');
    }
  }

  // ── LAYER 2E — Modifier Validation ───────────────────────────────────────
  runModifiers() {
    const surgDates = new Set(
      this.rows.filter(r => r.code && isSurgeryCode(r.code)).map(r => r.date).filter(Boolean)
    );

    this.rows.forEach((r, idx) => {
      // No modifier at all — check global surgical package violation
      if (r.code && isEMCode(r.code) && r.date && surgDates.has(r.date)) {
        const mod = (r.modifier || '').replace(/^-/, '');
        if (!GLOBAL_PERIOD_OK_MODS.has(mod)) {
          this.addFinding('modifier', 'Global Package Violation',
            `CPT ${r.code} (E&M) billed on the same date as a surgery code without a -24, -25, or -57 modifier. May not be separately payable.`,
            'danger', r.code);
        }
      }

      if (!r.modifier) return;
      const mod = r.modifier.toUpperCase();

      if (mod === '59') {
        this.addFinding('modifier', 'Modifier -59 — Unbundling Risk',
          `CPT ${r.code}-59: Modifier -59 ("Distinct Procedural Service") is the most-abused NCCI unbundling bypass. Flag for manual review — verify services were truly separate and not bundled by NCCI edit.`,
          'warn', r.code);
      }
      if (mod === '25') {
        this.addFinding('modifier', 'Modifier -25 — E&M+Procedure Same Day',
          `CPT ${r.code}-25: Significant separate E&M on the same day as a procedure. Legitimate, but frequently billed inappropriately. Verify notes support a separate evaluation.`,
          'warn', r.code);
      }
      if (mod === '76' || mod === '77') {
        this.addFinding('modifier', `Modifier -${mod} — Repeat Procedure`,
          `CPT ${r.code}-${mod}: Repeat procedure modifier detected. Cross-check against duplicate detection — confirm this is a legitimately repeated service.`,
          'warn', r.code);
      }
    });
  }

  // ── LAYER 2F — Date-Range Sanity ─────────────────────────────────────────
  runDateSanity() {
    const dates = this.rows
      .map(r => parseDate(r.date))
      .filter(Boolean)
      .sort((a, b) => a - b);

    if (dates.length < 2) return;
    const spanDays = (dates[dates.length - 1] - dates[0]) / 86400000;
    if (spanDays > 365) {
      this.addFinding('date_sanity', 'Date Span Exceeds 1 Year',
        `Service dates on this bill span ${Math.round(spanDays)} days (${dates[0].toLocaleDateString()} – ${dates[dates.length-1].toLocaleDateString()}). A single bill covering >365 days is highly unusual and a potential red flag.`,
        'danger');
    }
    // Also flag future dates
    const today = new Date();
    const futureDates = this.rows.filter(r => r.date && parseDate(r.date) > today);
    if (futureDates.length > 0) {
      this.addFinding('date_sanity', 'Future Service Date',
        `${futureDates.length} charge(s) have service dates in the future. This is a billing error.`, 'danger');
    }
  }

  // ── LAYER 3 — Benchmark Validation ───────────────────────────────────────
  async runDatabaseCheck() {
    const codes = [...new Set(this.rows.map(r => r.code).filter(c => !!c && isValidCPT(c)))];
    if (codes.length === 0) return;

    // First: try remote Supabase lookup
    let feeMap = {};
    if (window.dbClient) {
      try {
        const res = await fetch('https://bisqgousuvljttesjkkm.supabase.co/functions/v1/lookup_codes', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ codes, npis: this.npis }),
        });
        if (res.ok) {
          const data = await res.json();
          feeMap = data.fees || {};
          this.dbCheckRan = true;
        }
      } catch (_) {}
    }

    // Second: overlay inline benchmark for any code not in Supabase result
    codes.forEach(code => {
      if (!feeMap[code]) {
        const b = this.getBenchmark(code);
        if (b) feeMap[code] = { price: b.price };
      }
    });

    this.rows.forEach((r, idx) => {
      if (!r.code || r.isTotalRow) return;
      const bench = feeMap[r.code];
      if (!bench) return;
      this._benchmarkHits++;
      const cap = bench.price * r.qty * this.multiplier;
      this.totalBenchmark += bench.price * r.qty;
      if (r.total > cap) {
        this.addFinding('benchmark', 'High Pricing Variance',
          `CPT ${r.code}: Billed $${r.total.toFixed(2)} vs ${this.multiplier}× Medicare benchmark $${cap.toFixed(2)}. Potential overcharge of $${(r.total - cap).toFixed(2)}.`,
          'warn', r.code);
        r.raw.classList.add('audit-row-warn');
        this.addRowSavings(idx, r.total - cap, r.total);
      }
    });
  }

  // ── Confidence Scoring ────────────────────────────────────────────────────
  computeConfidence() {
    const total = this.rows.filter(r => !r.isTotalRow).length;
    if (total === 0) return { score: 0, reasons: ['No billable line items found.'] };

    const reasons = [];
    let score = 0;

    // 1. CPT code coverage (0–25)
    const withCode = this.rows.filter(r => r.code && !r.isTotalRow).length;
    const codeScore = Math.round((withCode / total) * 25);
    score += codeScore;
    if (withCode === total)      reasons.push(`All ${total} charges have CPT codes (+${codeScore})`);
    else if (withCode > 0)       reasons.push(`${withCode}/${total} charges have CPT codes (+${codeScore})`);
    else                         reasons.push(`No CPT codes found — very low confidence`);

    // 2. Date coverage (0–15)
    const withDate  = this.rows.filter(r => r.date && !r.isTotalRow).length;
    const dateScore = Math.round((withDate / total) * 15);
    score += dateScore;
    if (withDate < total) reasons.push(`${total - withDate} charge(s) missing service dates (-${15 - dateScore})`);

    // 3. Total field populated (0–10)
    const withTotal  = this.rows.filter(r => r.total > 0 && !r.isTotalRow).length;
    score += Math.round((withTotal / total) * 10);

    // 4. Benchmark coverage (0–25)
    const withCode2  = Math.max(withCode, 1);
    const benchScore = Math.round((this._benchmarkHits / withCode2) * 25);
    score += Math.min(25, benchScore);
    if (this._benchmarkHits === 0) reasons.push('No benchmark data matched — pricing check limited');
    else if (benchScore >= 20) reasons.push(`Strong Medicare benchmark coverage (+${Math.min(25, benchScore)})`);
    else reasons.push(`Partial benchmark coverage (+${Math.min(25, benchScore)})`);

    // 5. Price integrity — penalize derived rows (0–15)
    const derived    = this.rows.filter(r => r.priceWasDerived && !r.isTotalRow).length;
    const derivedRatio = derived / total;
    const intScore   = Math.round(((total - derived) / total) * 15);
    score += intScore;
    if (derivedRatio > 0.5) {
      score -= 15;
      reasons.push(`Over 50% of prices were derived (not audited against DB) — manual price entry suggested (-15)`);
    }

    // 6. DB check bonus (0–10)
    if (this.dbCheckRan) { score += 10; reasons.push('Remote clinical verification completed (+10)'); }

    // 7. Integrity Penalties (Custom Elite penalties)
    if (this._hasReconError) {
      score -= 20;
      reasons.push('Significant financial reconciliation gap detected (-20)');
    }

    const missingQty = this.rows.filter(r => !r.qty && !r.isTotalRow).length;
    if (missingQty > 0) {
      score -= Math.min(10, missingQty * 2);
      reasons.push(`Missing quantity data on ${missingQty} lines (-${Math.min(10, missingQty * 2)})`);
    }

    const hardFails = this.findings.filter(f => f.type === 'danger').length;
    if (hardFails > 2) {
      score -= 15;
      reasons.push('Multiple critical clinical anomalies found (-15)');
    }

    return { score: Math.min(100, Math.max(0, score)), reasons };
  }
}

// ── Render findings ───────────────────────────────────────────────────────────
const CATEGORY_META = {
  arithmetic:   { label: '🔢 Arithmetic',         color: '#ef4444' },
  duplicate:    { label: '🔁 Duplicate Charges',   color: '#f97316' },
  consistency:  { label: '📊 Pricing Consistency', color: '#eab308' },
  semantic:     { label: '📄 Insurance Language',  color: '#a78bfa' },
  completeness: { label: '📋 Completeness',        color: '#60a5fa' },
  modifier:     { label: '🔖 Modifier Audit',      color: '#fb923c' },
  benchmark:    { label: '💰 Benchmark Pricing',   color: '#34d399' },
  date_sanity:  { label: '📅 Date Validation',     color: '#f43f5e' },
  bundling:     { label: '🔗 Bundling Audit',      color: '#ec4899' },
  frequency:    { label: '📊 Frequency (MUE)',    color: '#f43f5e' },
  financial:    { label: '⚖️ Financial Integrity', color: '#10b981' },
  compatibility:{ label: '🩺 Clinical Context',   color: '#06b6d4' },
};

function renderCategorizedFindings(findings, container, count, rows, savings, benchmark, confidence) {
  container.className = 'audit-results visible';

  const confColor   = confidence.score >= 75 ? '#22c55e' : confidence.score >= 50 ? '#eab308' : '#ef4444';
  const confLabel   = confidence.score >= 75 ? 'High Confidence' : confidence.score >= 50 ? 'Moderate Confidence' : 'Low Confidence';
  const dangerCount = findings.filter(f => f.type === 'danger').length;
  const warnCount   = findings.filter(f => f.type === 'warn').length;

  let html = `
    <!-- Confidence Score Card -->
    <div style="background:var(--bg-card);border:1px solid var(--border);border-radius:12px;padding:20px;margin-bottom:16px;">
      <div style="display:flex;justify-content:space-between;align-items:flex-start;gap:16px;flex-wrap:wrap;">
        <div>
          <div style="font-size:11px;font-weight:700;text-transform:uppercase;color:var(--text-muted);letter-spacing:.06em;margin-bottom:8px;">Audit Confidence</div>
          <div style="display:flex;align-items:center;gap:10px;">
            <div style="font-size:36px;font-weight:800;color:${confColor};">${confidence.score}%</div>
            <span style="background:${confColor}18;color:${confColor};border:1px solid ${confColor}40;border-radius:20px;padding:3px 12px;font-size:11px;font-weight:700;">${confLabel}</span>
          </div>
          <div style="background:var(--bg-secondary);border-radius:6px;height:6px;margin-top:10px;overflow:hidden;">
            <div style="width:${confidence.score}%;height:100%;background:${confColor};border-radius:6px;transition:width .6s;"></div>
          </div>
        </div>
        <div style="flex:1;min-width:180px;">
          <div style="font-size:11px;font-weight:700;text-transform:uppercase;color:var(--text-muted);margin-bottom:6px;">Why this score?</div>
          ${confidence.reasons.map(r => `<div style="font-size:12px;color:var(--text-muted);margin-bottom:3px;">• ${r}</div>`).join('')}
        </div>
      </div>
    </div>

    <!-- Savings Summary -->
    <div style="background:linear-gradient(135deg,rgba(34,197,94,.12),rgba(34,197,94,.04));border:1px solid rgba(34,197,94,.3);border-radius:12px;padding:20px;text-align:center;margin-bottom:16px;">
      <div style="font-size:32px;font-weight:800;color:var(--text-h);">$${savings.toFixed(2)}</div>
      <div style="font-size:13px;color:var(--text-muted);margin-top:4px;">Potential Savings Detected</div>
      ${benchmark > 0 ? `<div style="font-size:11px;color:var(--text-muted);margin-top:4px;">Medicare benchmark total: $${benchmark.toFixed(2)}</div>` : ''}
    </div>

    <!-- Summary Badges -->
    <div style="display:flex;gap:8px;flex-wrap:wrap;margin-bottom:16px;">
      <div style="background:rgba(239,68,68,.12);border:1px solid rgba(239,68,68,.3);color:#ef4444;border-radius:20px;padding:4px 14px;font-size:12px;font-weight:700;">${dangerCount} Critical</div>
      <div style="background:rgba(234,179,8,.12);border:1px solid rgba(234,179,8,.3);color:#eab308;border-radius:20px;padding:4px 14px;font-size:12px;font-weight:700;">${warnCount} Warnings</div>
      <div style="background:rgba(148,163,184,.1);border:1px solid var(--border);color:var(--text-muted);border-radius:20px;padding:4px 14px;font-size:12px;">${count} Line Items Analyzed</div>
      <div style="margin-left:auto;display:flex;align-items:center;gap:6px;font-size:11px;font-weight:700;color:var(--text-muted);">
        <div style="width:7px;height:7px;background:#22c55e;border-radius:50%;animation:pulse-dot 1.2s ease-in-out infinite;"></div>Audit Engine Active
      </div>
    </div>
    <style>@keyframes pulse-dot{0%,100%{opacity:1}50%{opacity:.3}}</style>
  `;

  if (findings.length === 0) {
    html += `<div class="audit-finding" style="border-left:3px solid var(--success);padding:16px;border-radius:0 8px 8px 0;">
      ✅ <strong>Clean Bill</strong> — All items within expected ranges. No anomalies detected.
    </div>`;
  } else {
    // Group by category
    const groups = {};
    findings.forEach(f => {
      (groups[f.category] = groups[f.category] || []).push(f);
    });

    Object.entries(groups).forEach(([cat, items]) => {
      const meta = CATEGORY_META[cat] || { label: cat, color: '#94a3b8' };
      html += `
        <div style="margin-bottom:16px;">
          <div style="font-size:11px;font-weight:700;text-transform:uppercase;color:${meta.color};letter-spacing:.06em;margin-bottom:8px;padding-left:4px;">${meta.label} — ${items.length} Finding${items.length > 1 ? 's' : ''}</div>
          ${items.map(f => {
            const borderColor = f.type === 'danger' ? '#ef4444' : f.type === 'warn' ? '#eab308' : '#60a5fa';
            const bgColor     = f.type === 'danger' ? 'rgba(239,68,68,.05)' : 'rgba(234,179,8,.05)';
            const icon        = f.type === 'danger' ? '🔴' : '🟡';
            return `
              <div class="audit-finding" style="border-left:3px solid ${borderColor};background:${bgColor};border-radius:0 8px 8px 0;padding:14px 16px;margin-bottom:8px;">
                <div style="display:flex;align-items:flex-start;gap:10px;">
                  <span style="font-size:14px;flex-shrink:0;">${icon}</span>
                  <div>
                    <div style="font-weight:700;font-size:13px;margin-bottom:4px;">${f.title}${f.codeRef ? ` <code style="background:rgba(255,255,255,.06);padding:1px 6px;border-radius:4px;font-size:11px;">${f.codeRef}</code>` : ''}</div>
                    <div style="font-size:12px;color:var(--text-muted);line-height:1.5;">${f.detail}</div>
                  </div>
                </div>
              </div>`;
          }).join('')}
        </div>`;
    });
  }

  // Export button
  // Advanced Action Bar
  html += `
    <div style="margin-top:20px;display:flex;gap:12px;flex-wrap:wrap;border-top:1px solid var(--border);padding-top:20px;">
      <button onclick="exportAuditCSV()" class="btn btn-ghost" style="font-size:12px;flex:1;min-width:120px;letter-spacing:0.02em;">Export CSV</button>
      <button onclick="handleAuditExport('summary')" class="btn btn-secondary" style="font-size:12px;flex:1;min-width:160px;background:var(--bg-card);color:var(--text-main);border:1px solid var(--border);font-weight:600;letter-spacing:0.02em;">Download Summary Report</button>
      <button onclick="handleAuditExport('dispute')" class="btn btn-primary" style="font-size:12px;flex:2;min-width:240px;font-weight:700;letter-spacing:0.03em;box-shadow:0 4px 12px rgba(0,0,0,0.1);">Generate Dispute Letter</button>
    </div>`;

  container.innerHTML = html;
}

window.runAuditLines = runAuditLines;

function clearAudit() {
  const area = document.getElementById('line-items-text');
  const res  = document.getElementById('audit-results');
  if (area) area.value = '';
  if (res)  res.innerHTML = '';
}
window.clearAudit = clearAudit;
window.reRunWorkspaceAudit = reRunWorkspaceAudit;

window.handleAuditExport = (type) => {
  if (type === 'summary') {
    // Immediate generation for summary
    generatePDF('summary');
  } else {
    // Open modal for dispute
    const m = document.getElementById('patient-modal');
    if (m) {
      m.style.display = 'flex';
      m.dataset.reportType = 'dispute';
      const btn = document.getElementById('btn-generate-final');
      if (btn) btn.innerText = 'Finalize Dispute Letter';
    }
  }
};

window.closePatientModal = () => { const m = document.getElementById('patient-modal'); if(m) m.style.display='none'; };

// ── PDF Generator Engine (v3.3) ──────────────────────────────────────────────
async function generatePDF(forcedType = null) {
  const { jsPDF } = window.jspdf;
  const doc = new jsPDF();
  const type = forcedType || document.getElementById('patient-modal').dataset.reportType;
  
  const pInfo = {
    first:    document.getElementById('p-first')?.value || 'N/A',
    last:     document.getElementById('p-last')?.value || 'N/A',
    hospital: document.getElementById('p-hospital')?.value || 'Facility',
    account:  document.getElementById('p-account')?.value || 'N/A',
    ins:      document.getElementById('p-insurance')?.value || 'N/A',
    date:     document.getElementById('p-date')?.value || new Date().toLocaleDateString(),
    requestNotes: document.getElementById('p-req-notes')?.checked || false
  };

  // Shared Data
  const findings = currentEngineFindings; // We'll need to store this globally or pass it
  const savings  = currentEngineSavings;

  if (type === 'dispute') {
    renderDisputeLetter(doc, pInfo, findings, savings);
  } else {
    renderSummaryReport(doc, pInfo, findings, savings);
  }

  doc.save(`MediHelp_${type === 'dispute'?'Dispute':'Audit'}_${pInfo.last}.pdf`);
  closePatientModal();
}

// ── v4.3 Professional Citations ──────────────────────────────────────────────
const CITATION_MAP = {
  bundling:   "This code pair constitutes a 'Column 1/Column 2' edit under NCCI (National Correct Coding Initiative) Version 30.1. Standard practice requires these codes to be bundled into the primary procedure.",
  frequency:  "The units billed for this service exceed the CMS-established Medically Unlikely Edits (MUE) frequency limit for a single date of service.",
  compatibility: "This procedure lacks the required companion clinical context (e.g., related diagnoses or procedures) to support medical necessity under established clinical pathways.",
  benchmark:  "This charge significantly exceeds the 80th percentile Medicare benchmark for the specified locality (GPCI), suggesting a 'chargemaster' discrepancy.",
  duplicate:  "This appears to be a redundant entry for the same service on the same date, violating the 'one-service-per-encounter' billing standard.",
  modifier:   "This surgical procedure lacks the required modifier (e.g., -51 or -59) to prevent artificial revenue padding on multiple procedures.",
  arithmetic: "The itemized subtotal does not reconcile with the listed quantity and unit price, indicating a financial calculation error.",
  POS:        "The Place of Service (POS) code is inconsistent with the billable status of this specific CPT code.",
  NPI:        "Provider Taxonomy Cross-Check: The rendering provider's registered specialty in the NPPES registry does not align with the billed surgical/specialized service."
};

/** Formal Letter addressed to Payer/Provider */
function renderDisputeLetter(doc, p, findings, savings) {
  doc.setFontSize(10);
  doc.text(new Date().toLocaleDateString(), 20, 20);
  doc.setFont("helvetica", "bold");
  doc.text(`TO: Billing Department / Claims Administrator`, 20, 35);
  doc.text(`${p.hospital}`, 20, 40);
  
  doc.setFontSize(12);
  doc.text(`RE: FORMAL BILLING DISPUTE & REQUEST FOR RECONSIDERATION`, 20, 55);
  doc.setFontSize(10);
  doc.setFont("helvetica", "normal");
  doc.text(`Patient Name: ${p.first} ${p.last}`, 20, 65);
  doc.text(`Account/Invoice: ${p.account} | Insurance ID: ${p.ins}`, 20, 70);
  doc.text(`Statement Date: ${p.date}`, 20, 75);

  let y = 90;
  const body = `I am writing to formally dispute the charges on the above-referenced invoice. Based on a clinical audit of the itemized statement, I have identified several billing irregularities and potential coding errors that require immediate correction.`;
  const splitBody = doc.splitTextToSize(body, 170);
  doc.text(splitBody, 20, y);
  y += (splitBody.length * 6) + 10;

  doc.setFont("helvetica", "bold");
  doc.text(`SPECIFIC REASONS FOR DISPUTE:`, 20, y);
  y += 8;
  doc.setFont("helvetica", "normal");

  // Group findings by category (v4.3)
  const groups = {};
  findings.forEach(f => {
    (groups[f.category] = groups[f.category] || []).push(f);
  });

  Object.entries(groups).forEach(([cat, items]) => {
    if (y > 250) { doc.addPage(); y = 20; }
    
    // Category Heading
    const meta = CATEGORY_META[cat] || { label: cat.toUpperCase() };
    doc.setFont("helvetica", "bold");
    doc.setFontSize(10);
    doc.setTextColor(51, 65, 85); // Slate 700
    doc.text(`${meta.label.toUpperCase()}`, 20, y);
    y += 5;
    
    // Citation text if available
    if (CITATION_MAP[cat]) {
      doc.setFont("helvetica", "italic");
      doc.setFontSize(9);
      doc.setTextColor(100);
      const cite = CITATION_MAP[cat];
      const splitCite = doc.splitTextToSize(cite, 160);
      doc.text(splitCite, 25, y);
      y += (splitCite.length * 4) + 4;
    }

    // Individual Findings
    doc.setFont("helvetica", "normal");
    doc.setFontSize(10);
    doc.setTextColor(0);
    items.forEach(f => {
      if (y > 270) { doc.addPage(); y = 20; }
      const line = `• ${f.title}: ${f.detail}`;
      const splitLine = doc.splitTextToSize(line, 165);
      doc.text(splitLine, 25, y);
      y += (splitLine.length * 5) + 3;
    });
    y += 6;
  });

  y += 10;
  const demand = `Please review these findings and provide an adjusted statement reflecting the corrected amounts within 30 days. I request that no further collection activity occur while this bill is under active dispute.`;
  const splitDemand = doc.splitTextToSize(demand, 170);
  doc.text(splitDemand, 20, y);
  y += (splitDemand.length * 6) + 12;

  // Strategic Option: Request Notes
  if (p.requestNotes) {
    if (y > 240) { doc.addPage(); y = 20; }
    doc.setFont("helvetica", "bold");
    doc.setTextColor(220, 38, 38); // Red
    doc.text(`FORMAL REQUEST FOR SUPPORTING CLINICAL DOCUMENTATION:`, 20, y);
    y += 8;
    doc.setFont("helvetica", "normal");
    doc.setTextColor(0);
    const clinicalReq = `In accordance with medical billing compliance standards and the right to verify service levels, I hereby request copies of the following records pertaining to these charges: (1) Physician Progress Notes, (2) Operative/Procedure Reports for all surgical codes, and (3) Nursing Assessment Logs. Failure to provide supporting documentation for high-complexity codes may be grounds for a referral to the State Insurance Commissioner.`;
    const splitReq = doc.splitTextToSize(clinicalReq, 170);
    doc.text(splitReq, 20, y);
    y += (splitReq.length * 6) + 10;
  }
  
  y += 30;
  doc.text(`Sincerely,`, 20, y);
  doc.text(`___________________________`, 20, y + 10);
  doc.text(`${p.first} ${p.last}`, 20, y + 15);
}

/** Technical Audit Summary */
function renderSummaryReport(doc, p, findings, savings) {
  doc.setFontSize(18);
  doc.setTextColor(34, 197, 94); // Green
  doc.text("MediHelp Clinical Audit Summary", 20, 25);
  
  doc.setFontSize(10);
  doc.setTextColor(100);
  doc.text(`Patient: ${p.first} ${p.last} | Facility: ${p.hospital}`, 20, 35);
  doc.line(20, 40, 190, 40);

  doc.setFontSize(12);
  doc.setTextColor(0);
  doc.text(`Summary of Clinical Findings`, 20, 50);
  
  const tableData = findings.map(f => [
    f.category,
    f.title,
    f.detail.substring(0, 100) + (f.detail.length > 100 ? '...' : '')
  ]);

  doc.autoTable({
    startY: 55,
    head: [['Category', 'Issue', 'Description']],
    body: tableData,
    theme: 'striped',
    headStyles: { fillStyle: [34, 197, 94] }
  });

  const finalY = doc.lastAutoTable.finalY + 20;
  doc.setFontSize(14);
  doc.setFont("helvetica", "bold");
  doc.text(`Potential Recovery: $${savings.toFixed(2)}`, 20, finalY);
}

// Global store for PDF generators
let currentEngineFindings = [];
let currentEngineSavings  = 0;

document.getElementById('btn-generate-final')?.addEventListener('click', generatePDF);

window.exportAuditCSV = function() {
  const trs  = document.querySelectorAll('#workspace-body tr');
  const lines = ['Date,Code,Modifier,Description,Qty,Unit Price,Total Billed,Ins Paid,Pt Owed'];
  trs.forEach(tr => {
    const tds = tr.querySelectorAll('td');
    if (tds.length >= 9) {
      lines.push([
        tds[0].innerText, tds[1].innerText, tds[2].innerText,
        `"${tds[3].innerText.replace(/"/g,'""')}"`,
        tds[4].innerText, tds[5].innerText, tds[6].innerText,
        tds[7].innerText, tds[8].innerText,
      ].join(','));
    }
  });
  const blob = new Blob([lines.join('\n')], { type: 'text/csv' });
  const url  = URL.createObjectURL(blob);
  const a    = Object.assign(document.createElement('a'), { href: url, download: 'MediHelp_Audit.csv' });
  a.click();
  URL.revokeObjectURL(url);
};


})(); // END SCOPE ISOLATION

