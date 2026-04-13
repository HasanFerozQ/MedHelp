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
// ── PDF Extraction & Tab Orchestration ──
window.switchAuditTab = function(tabName) {
  const manualTab = document.getElementById('interactive-grid-container');
  const pdfTab = document.getElementById('tab-content-pdf');
  const manualBtn = document.getElementById('tab-btn-manual');
  const pdfBtn = document.getElementById('tab-btn-pdf');
  
  if (!manualTab || !pdfTab) return;
  
  if (tabName === 'manual') {
    manualTab.style.display = 'block';
    pdfTab.style.display = 'none';
    manualBtn.style.background = 'var(--accent)';
    manualBtn.style.color = 'white';
    pdfBtn.style.background = 'transparent';
    pdfBtn.style.color = 'var(--text-muted)';
  } else {
    manualTab.style.display = 'none';
    pdfTab.style.display = 'block';
    pdfBtn.style.background = 'var(--accent)';
    pdfBtn.style.color = 'white';
    manualBtn.style.background = 'transparent';
    manualBtn.style.color = 'var(--text-muted)';
  }
};

window.handlePdfSelect = async function(event) {
  const file = event.target.files && event.target.files[0];
  if (!file) return;

  const dropzone = document.getElementById('pdf-dropzone');
  const loadingState = document.getElementById('pdf-loading-state');
  
  if (dropzone) dropzone.style.display = 'none';
  if (loadingState) loadingState.style.display = 'block';
  
  try {
    const formData = new FormData();
    formData.append('bill', file);
    
    const baseUrl = window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1' 
      ? 'http://localhost:3000' : '';
      
    const res = await fetch(`${baseUrl}/api/audit-bill`, {
      method: 'POST',
      body: formData
    });
    
    const d = await res.json();
    if (!d.ok) throw new Error(d.error || 'Extraction Failed');
    
    const newItems = d.normalized_bill || [];
    if (newItems.length === 0) {
      alert("No medical billing lines found in this document.");
    } else {
      newItems.forEach(item => {
        window.appGridRows.push({
          rowId: 'auto-' + Date.now() + Math.random().toString(36).substring(2,6),
          provenance: 'textract',
          date: item.Date || '',
          code: item.CPT || '',
          modifier: item.Modifier || '',
          dx: Array.isArray(item.DX) ? item.DX : [],
          qty: item.Qty || 1,
          price: item.Unit_Price || null,
          total: item.Billed_Amount || null,
          paid: item.Paid || null,
          owed: null,
          adj: item.Adjustment || null,
          rowType: 'service',
          desc: '',
          npi: ''
        });
      });
      localStorage.setItem('medihelp_grid_data', JSON.stringify(window.appGridRows));
      
      switchAuditTab('manual');
      triggerAudit();
    }
  } catch(e) {
    alert("Extraction Error: " + e.message);
  } finally {
    if (dropzone) dropzone.style.display = 'block';
    if (loadingState) loadingState.style.display = 'none';
    if (event.target) event.target.value = ''; // reset file input
  }
};

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
  const priceInput= document.getElementById('entry-price');
  const totInput  = document.getElementById('entry-total');
  const paidInput = document.getElementById('entry-paid');
  const owedInput = document.getElementById('entry-owed');
  const adjInput  = document.getElementById('entry-adj');
  const typeInput = document.getElementById('entry-rowtype');
  const descInput = document.getElementById('entry-desc');
  const npiInput  = document.getElementById('entry-npi');

  const code = codeInput.value.trim().toUpperCase();
  const totalStr = totInput.value.trim();
  const priceStr = priceInput.value.trim();
  const qtyStr = qtyInput.value.trim();

  // If no code and no total, it's totally blank
  if (!code && !totalStr && !priceStr && !adjInput.value) {
    alert("Please enter a CPT Code, Price, or Total amount.");
    return;
  }

  const newRow = {
    rowId: crypto.randomUUID ? crypto.randomUUID() : Math.random().toString(36).substring(2, 15),
    provenance: 'user entered',
    idx: window.appGridRows.length,
    date: dateInput.value.trim(),
    code: code,
    modifier: modInput.value.trim().toUpperCase(),
    dx: [dxInput.value.trim().toUpperCase()].filter(Boolean),
    
    qty: qtyStr !== '' ? parseFloat(qtyStr) : null,
    price: priceStr !== '' ? parseFloat(priceStr) : null,
    total: totalStr !== '' ? parseFloat(totalStr) : null,
    paid: paidInput.value !== '' ? parseFloat(paidInput.value) : null,
    owed: owedInput.value !== '' ? parseFloat(owedInput.value) : null,
    adj: adjInput.value !== '' ? parseFloat(adjInput.value) : null,
    
    rowType: typeInput.value || 'service',
    desc: descInput.value.trim() || 'Manual Entry',
    npi: npiInput.value.trim()
  };

  window.appGridRows.push(newRow);
  
  clearAuditInputs();
  codeInput.focus();

  saveToCache();
  triggerAudit();
}
window.submitAuditForm = submitAuditForm;

function clearAuditInputs() {
  document.getElementById('entry-date').value = '';
  document.getElementById('entry-code').value = '';
  document.getElementById('entry-mod').value = '';
  document.getElementById('entry-dx').value = '';
  document.getElementById('entry-qty').value = '1';
  document.getElementById('entry-price').value = '';
  document.getElementById('entry-total').value = '';
  document.getElementById('entry-paid').value = '';
  document.getElementById('entry-owed').value = '';
  document.getElementById('entry-adj').value = '';
  document.getElementById('entry-desc').value = '';
  document.getElementById('entry-npi').value = '';
  const type = document.getElementById('entry-rowtype');
  if (type) type.value = 'service';
}
window.clearAuditInputs = clearAuditInputs;

function clearAuditGridConfirm() {
  if (window.appGridRows.length === 0) return;
  if (confirm("Are you sure you want to clear all loaded entries? This cannot be undone.")) {
    window.appGridRows = [];
    saveToCache();
    triggerAudit();
  }
}
window.clearAuditGridConfirm = clearAuditGridConfirm;

function editAuditRow(idx) {
  if (idx < 0 || idx >= window.appGridRows.length) return;
  const r = window.appGridRows[idx];

  const s = (val) => (val === null || val === undefined) ? '' : val;

  document.getElementById('entry-date').value = s(r.date);
  document.getElementById('entry-code').value = s(r.code);
  document.getElementById('entry-mod').value  = s(r.modifier);
  document.getElementById('entry-dx').value   = Array.isArray(r.dx) ? r.dx.join(', ') : s(r.dx);
  document.getElementById('entry-qty').value  = s(r.qty);
  document.getElementById('entry-price').value= s(r.price);
  document.getElementById('entry-total').value= s(r.total);
  document.getElementById('entry-paid').value = s(r.paid);
  document.getElementById('entry-owed').value = s(r.owed);
  document.getElementById('entry-adj').value  = s(r.adj);
  document.getElementById('entry-desc').value = s(r.desc);
  document.getElementById('entry-npi').value  = s(r.npi);
  if (document.getElementById('entry-rowtype')) {
    document.getElementById('entry-rowtype').value = r.rowType || 'service';
  }

  removeAuditRow(idx);

  if (typeof switchAuditTab === 'function') {
    switchAuditTab('manual');
  }
}
window.editAuditRow = editAuditRow;

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

  // Stage 1 & 2: Pre-Audit Validation Gate (Quarantine & Derive)
  const auditableRows = [];
  rows.forEach(r => {
    let missingCount = 0;
    if (r.qty === null || r.qty === undefined) missingCount++;
    if (r.price === null || r.price === undefined) missingCount++;
    if (r.total === null || r.total === undefined || r.total === '') missingCount++;
    
    r.math_complete = false;
    r.invalid = false;
    r.priceWasDerived = false;

    // Hard fail: impossible negative service charges
    if (r.total < 0 && r.rowType !== 'credit' && r.rowType !== 'adjustment') {
        r.invalid = true;
    }

    // Controlled derivation (derive exactly 1 missing)
    if (!r.invalid) {
        if (missingCount === 1) {
            let tempQ = r.qty !== null ? r.qty : 1;
            if (r.total == null || r.total === '') {
                r.total = tempQ * (r.price || 0);
            } else if (r.price == null) {
                r.price = r.total / tempQ;
                r.priceWasDerived = true;
            } else if (r.qty == null) {
                r.qty = r.price ? Math.max(1, Math.round(r.total / r.price)) : 1;
            }
            r.math_complete = true;
        } else if (missingCount === 0) {
            r.math_complete = true;
        }
    }

    // Normalize Money (2 decimals)
    if (r.total != null && r.total !== '') r.total = Math.round(r.total * 100) / 100;
    if (r.price != null && r.price !== '') r.price = Math.round(r.price * 100) / 100;
    if (r.paid != null && r.paid !== '')  r.paid = Math.round(r.paid * 100) / 100;
    if (r.owed != null && r.owed !== '')  r.owed = Math.round(r.owed * 100) / 100;
    if (r.adj != null && r.adj !== '')   r.adj = Math.round(r.adj * 100) / 100;

    if (!r.invalid) auditableRows.push(r);
  });

  const multiplier = parseFloat(document.getElementById('payer-type')?.value) || 2.5;
  const npis       = [...new Set(auditableRows.map(r => r.npi).filter(Boolean))];
  const gpci       = parseFloat(document.getElementById('gpci-region')?.value || '1.0');
  const isFacility = document.getElementById('facility-type')?.value === 'hospital';
  const profile    = window.currentDocumentProfile || null;

  // Call Stage 3 Auditor on Validated Rows
  const engine = new BucketAuditor(auditableRows, multiplier, npis, gpci, isFacility, profile);
  
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
    renderResultCardsPerLineItem(rows, engine.findings, container, engine._savingsRationale || {});
    // Render the final trailing summary in the usual audit-results section
    renderFinalSummary(engine.potentialSavings, engine.totalBenchmark, document.getElementById('audit-results'));
  } else {
    console.warn("MediHelp: renderResultCardsPerLineItem missing from report.js. Falling back.");
  }
}

window.triggerAudit = triggerAudit;

})(); // END SCOPE ISOLATION
