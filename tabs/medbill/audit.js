console.log('MediHelp: audit.js file source has been reached.');
(function() {
  'use strict';

/**
 * MediHelp — audit.js (v4.0)
 * UI Controller & Pipeline Orchestrator
 * Stages 1-4 logic moved to specialized modules (parser, auditor, report).
 */

// ── Global Configuration ──
// NPPES_API moved to constants.js global scope

// ── V8.0 Interactive Grid Architecture ──

function initAudit() {
  console.log('MediHelp: Initializing V8.0 Interactive Grid...');
  
  const savedData = localStorage.getItem('medihelp_grid_data');
  if (savedData) {
    try {
      window.appGridRows = JSON.parse(savedData) || [];
    } catch(e) {
      window.appGridRows = [];
    }
  } else {
    window.appGridRows = [];
  }
  
  // Give the UI a moment to render before firing the first audit
  setTimeout(triggerAudit, 100);
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initAudit);
} else {
  initAudit();
}

function submitAuditForm() {
  const dateInput = document.getElementById('entry-date');
  const codeInput = document.getElementById('entry-code');
  const modInput  = document.getElementById('entry-mod');
  const dxInput   = document.getElementById('entry-dx');
  const qtyInput  = document.getElementById('entry-qty');
  const totInput  = document.getElementById('entry-total');

  const code = codeInput.value.trim().toUpperCase();
  const total = parseFloat(totInput.value) || 0;

  if (!code && total <= 0) {
    alert("Please enter a CPT Code or Total Billed Amount.");
    return;
  }

  const s = (v) => window.sanitizeText(String(v || ''));

  const newRow = {
    idx: window.appGridRows.length,
    date: dateInput.value.trim(),
    code: code,
    modifier: modInput.value.trim().toUpperCase(),
    dx: [dxInput.value.trim().toUpperCase()].filter(Boolean),
    qty: parseFloat(qtyInput.value) || 1,
    price: 0,
    total: total,
    paid: 0,
    owed: 0,
    desc: 'Manual Entry'
  };

  window.appGridRows.push(newRow);
  
  // Clear inputs
  codeInput.value = '';
  modInput.value = '';
  dxInput.value = '';
  qtyInput.value = '1';
  totInput.value = '';
  dateInput.value = '';
  
  codeInput.focus();

  saveToCache();
  triggerAudit();
}
window.submitAuditForm = submitAuditForm;

function removeAuditRow(idx) {
  if (idx < 0 || idx >= window.appGridRows.length) return;
  window.appGridRows.splice(idx, 1);
  
  // Re-index
  window.appGridRows.forEach((r, i) => r.idx = i);
  
  saveToCache();
  triggerAudit();
}
window.removeAuditRow = removeAuditRow;

function saveToCache() {
  localStorage.setItem('medihelp_grid_data', JSON.stringify(window.appGridRows));
}

const debouncedAudit = window.debounce(async () => {
  try {
    await triggerAudit();
  } catch (err) {
    console.error('Audit Runner Crashed:', err);
  }
}, 400);
window.debouncedAudit = debouncedAudit;

async function triggerAudit() {
  const rows = window.appGridRows || [];

  const multiplier = parseFloat(document.getElementById('payer-type')?.value) || 2.5;
  const npis       = [];
  const gpci       = parseFloat(document.getElementById('gpci-region')?.value || '1.0');
  const isFacility = document.getElementById('facility-type')?.value === 'hospital';
  const profile    = window.currentDocumentProfile || null;

  // Call Stage 3 Auditor
  const engine = new BucketAuditor(rows, multiplier, npis, gpci, isFacility, profile);
  
  engine.runArithmetic();
  engine.runInvoiceSumCheck();
  engine.runBundling();
  engine.runDRGAudit();
  engine.runDuplicates();
  engine.runFrequencyAudit();
  engine.runFinancialSummaryAudit();
  engine.runClinicalCompatibilityAudit();
  engine.runDXCompatibilityAudit();
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
  engine.finalizeDeduplication();

  const container = document.getElementById('result-cards-container');
  if (!container) return;
  
  if (rows.length === 0) {
    container.innerHTML = '<div style="text-align: center; color: var(--text-muted); padding: 30px; font-size: 13px;">Add elements above to see live findings here.</div>';
    const auditRes = document.getElementById('audit-results');
    if (auditRes) {
      auditRes.innerHTML = '';
      auditRes.classList.remove('visible');
    }
    return;
  }

  // Generate Independent Result Cards mapping Input Rows to Findings
  window.currentEngineFindings = engine.findings;
  window.currentEngineSavings  = engine.potentialSavings;
  
  if (typeof renderResultCardsPerLineItem === 'function') {
    renderResultCardsPerLineItem(rows, engine.findings, container);
    // Render the final trailing summary in the usual audit-results section
    renderFinalSummary(engine.potentialSavings, engine.totalBenchmark, document.getElementById('audit-results'));
  } else {
    console.warn("MediHelp: renderResultCardsPerLineItem missing from report.js. Falling back.");
  }
}

window.triggerAudit = triggerAudit;

})(); // END SCOPE ISOLATION
