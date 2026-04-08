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

function isSurgeryCode(code) {
  const n = parseInt(code, 10);
  return n >= 10000 && n <= 69999;
}
function isEMCode(code) {
  const n = parseInt(code, 10);
  return (n >= 99202 && n <= 99215) || (n >= 99221 && n <= 99285) || (n >= 99291 && n <= 99292);
}

// ── Date helpers ──────────────────────────────────────────────────────────────
function parseDate(str) {
  if (!str) return null;
  const d = new Date(str);
  return isNaN(d.getTime()) ? null : d;
}

// ── PDF Audit Setup ───────────────────────────────────────────────────────────
document.addEventListener('DOMContentLoaded', () => {
  setupPDFAudit();

  const lineInput = document.getElementById('line-items-text');
  if (lineInput) {
    lineInput.addEventListener('keydown', e => {
      if (e.key === 'Enter' && e.ctrlKey) runAuditLines();
    });
  }
});

// switchAuditTab is now handled inline in audit.html for maximum isolation.

function setupPDFAudit() {
  const zone  = document.getElementById('pdf-drop-zone');
  const input = document.getElementById('pdf-input');
  if (!zone || !input) return;
  zone.onclick    = () => input.click();
  zone.ondragover = e => { e.preventDefault(); zone.classList.add('dragover'); };
  zone.ondragleave = () => zone.classList.remove('dragover');
  zone.ondrop = e => {
    e.preventDefault();
    zone.classList.remove('dragover');
    if (e.dataTransfer.files.length) handlePDF(e.dataTransfer.files[0]);
  };
  input.onchange = e => { if (e.target.files.length) handlePDF(e.target.files[0]); };
}

async function handlePDF(file) {
  const status     = document.getElementById('pdf-status');
  const overlay    = document.getElementById('ai-loading-overlay');
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
      const y = Math.round(item.y / 10) * 10;
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
  const codeRegex  = /\b([1-9]\d{4})(?:-([A-Z0-9]{1,2}))?\b/g;
  const moneyRegex = /(?:^|\s|\$)\s?(\d{1,7}(?:,\d{3})*(?:\.\d{2})?)(?=\s|$)/g;

  // 1. Extract Date and Code early
  const dates = line.match(dateRegex);
  const rawCodes   = [...line.matchAll(codeRegex)];
  const validCodes = rawCodes.filter(m => isValidCPT(m[1]));
  const code       = validCodes.length > 0 ? validCodes[0][1] : '';
  const modifier   = validCodes.length > 0 && validCodes[0][2] ? validCodes[0][2] : '';

  // 2. SCRUB: Remove dates and codes from a work copy before finding money
  // This prevents CPT Collision (5-digit code matched as a huge amount)
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
    desc:            desc || 'Medical Service',
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
    const qty   = parseFloat(tds[4].innerText) || 1;
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

  const engine = new BucketAuditor(rows, multiplier, npis);
  engine.runArithmetic();
  engine.runInvoiceSumCheck();
  engine.runDuplicates();
  engine.runConsistency();
  engine.runSemantic();
  engine.runCompleteness();
  engine.runModifiers();
  engine.runDateSanity();
  await engine.runDatabaseCheck();
  engine.finalizeDeduplication();

  const confidence = engine.computeConfidence();
  renderCategorizedFindings(engine.findings, results, rows.length, rows, engine.potentialSavings, engine.totalBenchmark, confidence);
}

// ══════════════════════════════════════════════════════════════════════════════
// BucketAuditor — 3-Layer Validation Engine (v3.0)
// ══════════════════════════════════════════════════════════════════════════════
class BucketAuditor {
  constructor(rows, multiplier = 2.5, npis = []) {
    this.rows             = rows;
    this.multiplier       = multiplier;
    this.npis             = npis;
    this.findings         = [];
    this.potentialSavings = 0;
    this.totalBenchmark   = 0;
    this.dbCheckRan       = false;
    this._rowSavings      = {}; // per-row savings tracker for deduplication cap
    this._lineItemSum     = 0;
    this._benchmarkHits   = 0;
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

  // ── LAYER 2A — Duplicate Detection ───────────────────────────────────────
  runDuplicates() {
    const registry = {};
    this.rows.forEach((r, idx) => {
      if (!r.code || r.isTotalRow) return;
      // Use "UNDATED" for missing dates so they don't incorrectly collapse across all empty-date rows
      const dKey = r.date || 'UNDATED';
      const key = `${dKey}|${r.code}|${r.modifier}|${Math.round(r.total * 100)}`;
      (registry[key] = registry[key] || []).push({ r, idx });
    });
    Object.values(registry).forEach(entries => {
      if (entries.length < 2) return;
      const { r } = entries[0];
      const label = r.code + (r.modifier ? '-' + r.modifier : '');
      this.addFinding('duplicate', 'Duplicate Charge',
        `CPT ${label} appears ${entries.length}× on ${r.date || 'same date'} for $${r.total.toFixed(2)} each. Only one is typically payable.`,
        'danger', r.code);
      entries.forEach(({ r: er }) => { if (er.raw) er.raw.classList.add('audit-row-error'); });
      for (let i = 1; i < entries.length; i++) {
        this.addRowSavings(entries[i].idx, entries[i].r.total, entries[i].r.total);
      }
    });
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
      { re: /not medically necessary/i,              title: 'Not Medically Necessary',   detail: 'Insurer may refuse payment — document clinical justification.' },
      { re: /non.?covered/i,                         title: 'Non-Covered Service',        detail: 'This service may not be covered by your plan.' },
      { re: /benefit maximum/i,                      title: 'Benefit Limit Reached',      detail: 'Annual benefit cap may have been exceeded.' },
      { re: /coordination of benefits/i,             title: 'COB Detected',               detail: 'Multiple-insurer coordination — verify primary payer.' },
      { re: /experimental|investigational/i,         title: 'Experimental Service',       detail: 'Experimental treatments are routinely excluded.' },
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
    const fullText = this.rows.map(r => `${r.desc} ${r.code}`).join(' ');
    KEYWORDS.forEach(({ re, title, detail }) => {
      if (re.test(fullText)) this.addFinding('semantic', title, detail, 'warn');
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
      if (!feeMap[code] && INLINE_BENCHMARK[code]) {
        feeMap[code] = { price: INLINE_BENCHMARK[code].price };
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
    if (withCode === total)      reasons.push(`All ${total} charges have CPT codes (+${codeScore}`);
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
    const intScore   = Math.round(((total - derived) / total) * 15);
    score += intScore;
    if (derived > 0) reasons.push(`${derived} row(s) have back-calculated prices — arithmetic check skipped`);

    // 6. DB check bonus (0–10)
    if (this.dbCheckRan) { score += 10; reasons.push('Remote code validation completed (+10)'); }

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
  html += `
    <div style="margin-top:20px;display:flex;gap:10px;flex-wrap:wrap;">
      <button onclick="exportAuditCSV()" class="btn btn-ghost" style="font-size:12px;">📥 Export CSV</button>
      <button onclick="openPatientModal()" class="btn btn-primary" style="font-size:12px;">📄 Generate Report</button>
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

window.openPatientModal  = () => { const m = document.getElementById('patient-modal'); if(m) m.style.display='flex'; };
window.closePatientModal = () => { const m = document.getElementById('patient-modal'); if(m) m.style.display='none'; };

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
