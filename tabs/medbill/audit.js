console.log('MediHelp: audit.js file source has been reached.');
(function() {
  'use strict';

/**
 * MediHelp — audit.js (v4.0)
 * UI Controller & Pipeline Orchestrator
 * Stages 1-4 logic moved to specialized modules (parser, auditor, report).
 */

// ── Global Configuration ──
const NPPES_API = 'https://npiregistry.cms.hhs.gov/api/?version=2.1&number=';

// ── PDF Audit Setup ───────────────────────────────────────────────────────────
function initAudit() {
  console.log('MediHelp: Initializing Bill Audit Module...');
  
  // 1. Initialize UI Listeners (Priority)
  setupPDFAudit();

  // 2. Configure PDF.js Worker
  if (typeof pdfjsLib !== 'undefined') {
    pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.worker.min.js';
  } else {
    console.warn('MediHelp: pdf.js library not detected.');
  }

  // ── v4.2 Interactive Blog Integration ──
  try {
    const pendingDemo = sessionStorage.getItem('MH_PENDING_DEMO');
    if (pendingDemo) {
      sessionStorage.removeItem('MH_PENDING_DEMO');
      const data = JSON.parse(pendingDemo);
      const textArea = document.getElementById('bill-text');
      if (textArea) {
        textArea.value = data.billText;
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

// Robust Listener
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
      handlePDF(e.dataTransfer.files[0]);
    }
  };

  input.onchange = e => { 
    if (e.target.files.length) {
      handlePDF(e.target.files[0]);
    }
  };
}

async function handlePDF(file) {
  const status     = document.getElementById('pdf-status');
  const overlay    = document.getElementById('ai-loading-overlay');
  const auditResults = document.getElementById('audit-results');

  if (!file || file.type !== 'application/pdf') {
    if (status) status.innerText = 'Error: Please upload a valid PDF file.';
    return;
  }

  if (typeof pdfjsLib === 'undefined') {
    console.error('MediHelp: pdf.js library not loaded.');
    if (status) status.innerHTML = '<span style="color:#ef4444;">Error: PDF Library missing.</span>';
    return;
  }

  if (overlay) overlay.style.display = 'block';
  if (auditResults) auditResults.innerHTML = '';
  if (status)  status.innerHTML  = `<span style="color:var(--accent);">Processing PDF...</span>`;

  try {
    const arrayBuffer = await file.arrayBuffer();
    const pdf = await pdfjsLib.getDocument({ data: arrayBuffer }).promise;
    let pageData = [];
    let detectedNPIs = [];
    const npiRegex = /\b[1-9][0-9]{9}\b/g;

    for (let i = 1; i <= pdf.numPages; i++) {
      if (status) status.innerHTML = `<span style="color:var(--accent);">Extracting Text: Page ${i} of ${pdf.numPages}...</span>`;
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
      if (status) status.innerHTML = `<span style="color:var(--accent);">No text detected. Loading OCR...</span>`;
      if (!window.Tesseract) {
        await new Promise((res, rej) => {
          const s = document.createElement('script');
          s.src = 'https://cdn.jsdelivr.net/npm/tesseract.js@5/dist/tesseract.min.js';
          s.onload = res;
          s.onerror = () => rej(new Error('Failed to load OCR library.'));
          document.head.appendChild(s);
        });
      }
      const canvas = document.createElement('canvas');
      const ctx    = canvas.getContext('2d');
      pageData = [];
      const tesseract = window.Tesseract || Tesseract;
      for (let i = 1; i <= pdf.numPages; i++) {
        if (status) status.innerHTML = `<span style="color:var(--accent);">OCR Analysis: Page ${i} of ${pdf.numPages}...</span>`;
        const page = await pdf.getPage(i);
        const viewport = page.getViewport({ scale: 2.0 });
        canvas.width = viewport.width; canvas.height = viewport.height;
        await page.render({ canvasContext: ctx, viewport }).promise;
        const { data: { words } } = await tesseract.recognize(canvas, 'eng');
        const ocrItems = (words || []).map(w => {
          const m = w.text.match(npiRegex);
          if (m) detectedNPIs.push(...m);
          return { str: w.text, x: w.bbox.x0 / 2, y: (viewport.height - w.bbox.y0) / 2, width: (w.bbox.x1 - w.bbox.x0) / 2, height: (w.bbox.y1 - w.bbox.y0) / 2 };
        });
        pageData.push(ocrItems);
      }
    }

    if (overlay) overlay.style.display = 'none';
    if (status)  status.innerHTML = `✅ Analyzed ${pdf.numPages} page(s) from <strong>${file.name}</strong>`;
    
    // Call Stage 2 Normalizer
    const schema = reconstructRowsFromLayout(pageData);
    runAudit(schema, detectedNPIs);

  } catch (err) {
    if (overlay) overlay.style.display = 'none';
    if (status)  status.innerHTML = `<span style="color:var(--danger);">⚠️ ${err.message}</span>`;
  }
}

// ── Workspace UI & Orchestration ──────────────────────────────────────────────

let currentSuspectRows = [];

function runAudit(input, detectedNPIs = []) {
  const workspace = document.getElementById('audit-workspace-container');
  const results   = document.getElementById('audit-results');
  if (!workspace || !results) return;

  const body = document.getElementById('workspace-body');
  if (body) body.innerHTML = '';
  results.innerHTML = '';

  let rows = [];
  let suspect_rows = [];
  
  if (Array.isArray(input)) {
    rows = input;
  } else if (input && typeof input === 'object' && input.rows) {
    rows = input.rows;
    suspect_rows = input.suspect_rows || [];
  } else {
    const extracted = extractRowsFromText(input || '');
    rows = extracted.rows || [];
    suspect_rows = extracted.suspect_rows || [];
  }

  currentSuspectRows = suspect_rows;
  console.log(`MediHelp Normalization Setup: ${rows.length} valid rows, ${suspect_rows.length} quarantined.`);

  workspace.style.display = 'block';
  const sidebar = document.getElementById('billing-context-sidebar');
  if (sidebar) sidebar.style.display = 'block';

  if (rows.length === 0) {
    if (suspect_rows.length === 0) addWorkspaceRow();
    reRunWorkspaceAudit(); 
  } else {
    rows.forEach(r => addWorkspaceRow(r));
    workspace.dataset.npis = JSON.stringify(detectedNPIs);
    reRunWorkspaceAudit();
  }
}
window.runAudit = runAudit;

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

const debouncedAudit = window.debounce(async () => {
  try {
    await reRunWorkspaceAudit();
  } catch (err) {
    console.error('Audit Runner Crashed:', err);
  }
}, 300);
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
      isTotalRow: (window.TOTAL_ROW_RE || /total|summary/i).test(tds[3].innerText),
      raw: tr,
    };
  });

  const multiplier = parseFloat(document.getElementById('payer-type')?.value) || 2.5;
  const npiData    = document.getElementById('audit-workspace-container')?.dataset.npis;
  let npis = [];
  try { npis = npiData ? JSON.parse(npiData) : []; } catch(_) { npis = []; }
  const gpci       = parseFloat(document.getElementById('gpci-region')?.value || '1.0');
  const isFacility = document.getElementById('facility-type')?.value === 'hospital';

  // Call Stage 3 Auditor
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

  const TIMEOUT_MS = 5000;
  const withTimeout = (promise) => Promise.race([
    promise,
    new Promise((_, rej) => setTimeout(() => rej(new Error('timeout')), TIMEOUT_MS))
  ]);

  try { await withTimeout(engine.runDatabaseCheck()); } catch(e) { console.warn('MediHelp: DB check skipped:', e.message); }
  try { await withTimeout(engine.resolveNPIProviders()); } catch(e) { console.warn('MediHelp: NPI resolution skipped:', e.message); }
  engine.finalizeDeduplication();

  // Save state for Stage 4 Reporting
  window.currentEngineFindings = engine.findings;
  window.currentEngineSavings  = engine.potentialSavings;
  const confidence = engine.computeConfidence();

  // Call Stage 4 Reporter
  renderCategorizedFindings(
    engine.findings, 
    results, 
    rows.length, 
    rows, 
    engine.potentialSavings, 
    engine.totalBenchmark, 
    confidence, 
    currentSuspectRows
  );
}

window.reRunWorkspaceAudit = reRunWorkspaceAudit;

})(); // END SCOPE ISOLATION
