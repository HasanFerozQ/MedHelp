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
      const rows = JSON.parse(savedData);
      if (rows && rows.length > 0) {
        rows.forEach(r => addGridRow(r));
      } else {
        addGridRow(); // Initialize empty row
      }
    } catch(e) {
      addGridRow();
    }
  } else {
    addGridRow();
  }
  
  // Give the UI a moment to render before firing the first audit
  setTimeout(triggerAudit, 100);
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initAudit);
} else {
  initAudit();
}

function saveToCache() {
  const rows = buildRowDataFromUI();
  localStorage.setItem('medihelp_grid_data', JSON.stringify(rows));
}

function buildRowDataFromUI() {
  const trs = document.querySelectorAll('#grid-body tr');
  return Array.from(trs).map((tr, idx) => {
    const inputs = tr.querySelectorAll('input');
    return {
      idx,
      date:      inputs[0].value.trim(),
      code:      inputs[1].value.trim().toUpperCase(),
      modifier:  inputs[2].value.trim().toUpperCase(),
      dx:        [inputs[3].value.trim().toUpperCase()].filter(Boolean), // convert straight to array format
      qty:       parseFloat(inputs[4].value) || 1,
      price:     0,  // We don't have unit price in the simple manual grid
      total:     parseFloat(inputs[5].value) || 0,
      paid:      0,
      owed:      0,
      desc:      'Manual Entry',
      raw:       tr
    };
  }).filter(r => r.code !== '' || r.total > 0);
}

function addGridRow(data = {}) {
  const body = document.getElementById('grid-body');
  if (!body) return;
  const row = document.createElement('tr');
  
  const s = (v) => window.sanitizeText(String(v || ''));
  const dxStr = Array.isArray(data.dx) ? data.dx.join(', ') : s(data.dx);
  
  row.innerHTML = `
    <td><input type="text" value="${s(data.date)}" style="width:100%; border:none; background:transparent; color:var(--text-h); outline:none;" placeholder="MM/DD/YY" oninput="saveToCache(); debouncedAudit()"></td>
    <td><input type="text" value="${s(data.code)}" style="width:100%; border:none; background:transparent; color:var(--text-h); font-weight:bold; outline:none;" placeholder="99214" oninput="saveToCache(); debouncedAudit()"></td>
    <td><input type="text" value="${s(data.modifier)}" style="width:100%; border:none; background:transparent; color:var(--accent); font-weight:bold; outline:none;" placeholder="25" oninput="saveToCache(); debouncedAudit()"></td>
    <td><input type="text" value="${dxStr}" style="width:100%; border:none; background:transparent; color:var(--text-h); outline:none;" placeholder="Z00.00" oninput="saveToCache(); debouncedAudit()"></td>
    <td><input type="number" value="${s(data.qty) || 1}" style="width:100%; border:none; background:transparent; color:var(--text-h); outline:none;" oninput="saveToCache(); debouncedAudit()"></td>
    <td><input type="number" step="0.01" value="${data.total !== undefined ? data.total : ''}" style="width:100%; border:none; background:transparent; color:var(--text-h); font-weight:bold; outline:none;" placeholder="$0.00" oninput="saveToCache(); debouncedAudit()"></td>
    <td><button onclick="this.closest('tr').remove(); saveToCache(); triggerAudit();" style="background:none;border:none;color:var(--danger);cursor:pointer;font-size:16px;">✕</button></td>
  `;
  body.appendChild(row);
}
window.addGridRow = addGridRow;

const debouncedAudit = window.debounce(async () => {
  try {
    await triggerAudit();
  } catch (err) {
    console.error('Audit Runner Crashed:', err);
  }
}, 400);
window.debouncedAudit = debouncedAudit;

async function triggerAudit() {
  const rows = buildRowDataFromUI();

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
    document.getElementById('audit-results').innerHTML = '';
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
