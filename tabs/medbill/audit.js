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
    if (manualBtn) { manualBtn.style.background = 'var(--accent)'; manualBtn.style.color = 'white'; }
    if (pdfBtn) { pdfBtn.style.background = 'transparent'; pdfBtn.style.color = 'var(--text-muted)'; }
  } else {
    manualTab.style.display = 'none';
    pdfTab.style.display = 'block';
    if (pdfBtn) { pdfBtn.style.background = 'var(--accent)'; pdfBtn.style.color = 'white'; }
    if (manualBtn) { manualBtn.style.background = 'transparent'; manualBtn.style.color = 'var(--text-muted)'; }
  }
};

window.toggleAdvancedForm = function() {
  const wrap = document.getElementById('advanced-form-wrap');
  if (!wrap) return;
  const isOpen = wrap.style.display !== 'none';
  wrap.style.display = isOpen ? 'none' : 'grid';
};

window.handlePdfSelect = async function(event) {
  const file = event.target.files && event.target.files[0];
  if (!file) return;

  // client-side MIME check
  const allowed = ['application/pdf', 'image/png', 'image/jpeg', 'image/tiff'];
  if (!allowed.includes(file.type)) {
    alert("Please upload a valid PDF or Image file (PNG, JPG, TIFF).");
    if (event.target) event.target.value = '';
    return;
  }

  const dropzone = document.getElementById('pdf-dropzone');
  const loadingState = document.getElementById('pdf-loading-state');
  
  if (dropzone) dropzone.style.display = 'none';
  if (loadingState) loadingState.style.display = 'block';
  
  try {
    const formData = new FormData();
    formData.append('bill', file);
    
    const baseUrl = window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1' 
      ? 'http://localhost:3000' : '';
      
    const res = await fetch(`${baseUrl}/api/audit-bill`, { method: 'POST', body: formData });

    // Always parse response as text first so non-JSON server errors become readable.
    const raw = await res.text();
    let d;
    try {
      d = JSON.parse(raw);
    } catch {
      throw new Error(`Server returned non-JSON response: ${raw.slice(0, 120)}`);
    }

    if (!d.ok) throw new Error(d.error || 'Extraction failed');
    
    const newItems = d.normalized_bill || [];
    if (newItems.length === 0) {
      alert("No medical billing lines found in this document.");
    } else {
      const reviewRequired = newItems.filter(i => i.needs_manual_review);
      const cleanItems     = newItems.filter(i => !i.needs_manual_review);

      // Auto-populate the high-confidence ones
      cleanItems.forEach((item, loopIdx) => {
        window.appGridRows.push({
          rowId: 'auto-' + Date.now() + '-' + loopIdx + Math.random().toString(36).substring(2,6),
          provenance: 'textract',
          date: item.Date || '',
          code: item.CPT || '',
          modifier: item.Modifier || '',
          dx: Array.isArray(item.DX) ? item.DX : [],
          qty: item.Qty || 1,
          price: item.Unit_Price || null,
          total: item.Billed_Amount || null,
          paid: item.Paid != null ? item.Paid : null,
          owed: null,
          adj: item.Adjustment != null ? item.Adjustment : null,
          extraction_confidence: item.extraction_confidence ?? 100,
          has_low_confidence_chars: item.has_low_confidence_chars || false,
          rowType: 'service',
          desc: '',
          npi: ''
        });
      });

      localStorage.setItem('medihelp_grid_data', JSON.stringify(window.appGridRows));
      
      if (reviewRequired.length > 0) {
        showManualReviewPrompt(reviewRequired);
      }

      switchAuditTab('manual');
      triggerAudit();
    }
  } catch(e) {
    const msg = String(e && e.message ? e.message : e);
    const isBackendUnavailable =
      /AWS credentials not configured|AWS Textract failed|Server returned non-JSON response/i.test(msg);

    if (isBackendUnavailable && file && /pdf/i.test(file.type || '')) {
      try {
        const fallbackRows = await extractPdfClientSide(file);
        if (fallbackRows.length > 0) {
          fallbackRows.forEach((r, idx) => {
            window.appGridRows.push({
              rowId: 'client-fallback-' + Date.now() + '-' + idx + Math.random().toString(36).substring(2, 6),
              provenance: 'client-fallback',
              date: r.date || '',
              code: r.code || '',
              modifier: '',
              dx: r.dx ? [r.dx] : [],
              qty: r.qty || 1,
              price: null,
              total: r.total != null ? r.total : null,
              paid: null,
              owed: null,
              adj: null,
              extraction_confidence: 55,
              has_low_confidence_chars: false,
              rowType: 'service',
              desc: 'Client-side PDF fallback',
              npi: ''
            });
          });
          localStorage.setItem('medihelp_grid_data', JSON.stringify(window.appGridRows));
          switchAuditTab('manual');
          triggerAudit();
          alert(`Server extraction unavailable. Loaded ${fallbackRows.length} fallback line(s). Please verify all values manually.`);
          return;
        }
      } catch (_) {
        // continue to normal alert below
      }
    }

    alert("Extraction Error: " + msg);
  } finally {
    if (dropzone) dropzone.style.display = 'block';
    if (loadingState) loadingState.style.display = 'none';
    if (event.target) event.target.value = ''; // reset file input
  }
};

async function extractPdfClientSide(file) {
  if (!window.pdfjsLib) return [];
  const buf = await file.arrayBuffer();
  const pdf = await window.pdfjsLib.getDocument({ data: buf }).promise;
  let text = '';
  for (let p = 1; p <= pdf.numPages; p++) {
    const page = await pdf.getPage(p);
    const content = await page.getTextContent();
    text += content.items.map(i => i.str).join(' ') + '\n';
  }

  const lines = text.split(/\n+/).map(s => s.trim()).filter(Boolean);
  const out = [];
  lines.forEach((line) => {
    const date = (line.match(/\b\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4}\b/) || [])[0] || '';
    const code = (line.match(/\b([A-Z]\d{4}|\d{5})\b/) || [])[1] || '';
    const dx = (line.match(/\b([A-Z]\d{2}(?:\.\w{1,4})?)\b/) || [])[1] || '';
    const qty = parseInt((line.match(/\bqty[:\s]*(\d+)\b/i) || [])[1] || '1', 10);
    const money = [...line.matchAll(/\$\s*(\d+(?:,\d{3})*(?:\.\d{2})?)/g)].map(m => parseFloat(m[1].replace(/,/g, '')));
    const total = money.length ? money[money.length - 1] : null;
    if (code || total != null) {
      out.push({ date, code, dx, qty: Number.isFinite(qty) ? qty : 1, total });
    }
  });
  return out.slice(0, 40);
}

window.showManualReviewPrompt = function(items) {
  const container = document.getElementById('review-prompt-area');
  if (!container) return;
  
  container.style.display = 'block';
  const list = container.querySelector('#review-items-list');
  if (!list) return;

  const s = (v) => {
    if (typeof window.sanitizeText === 'function') return window.sanitizeText(String(v || ''));
    return String(v || '').replace(/[&<>"']/g, m => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[m]));
  };

  list.innerHTML = items.map((item, idx) => `
    <div class="review-row" style="background:rgba(245,158,11,0.05); border:1px solid rgba(245,158,11,0.2); border-radius:8px; padding:12px; margin-bottom:10px; display:flex; gap:12px; align-items:center;">
      <div style="background:#f59e0b; color:white; width:24px; height:24px; border-radius:50%; display:flex; align-items:center; justify-content:center; flex-shrink:0; font-size:12px; font-weight:bold;">!</div>
      <div style="flex-grow:1; display:grid; grid-template-columns: repeat(4, 1fr); gap:8px;">
        <div><label style="font-size:10px; color:var(--text-muted); display:block;">Date</label><input type="text" class="rev-date" value="${s(item.Date)}" style="width:100%; padding:4px; font-size:12px; border:1px solid var(--border); border-radius:4px;"></div>
        <div><label style="font-size:10px; color:var(--text-muted); display:block;">CPT</label><input type="text" class="rev-code" value="${s(item.CPT)}" style="width:100%; padding:4px; font-size:12px; border:1px solid var(--border); border-radius:4px;"></div>
        <div><label style="font-size:10px; color:var(--text-muted); display:block;">Total</label><input type="text" class="rev-total" value="${parseFloat(item.Billed_Amount || 0).toFixed(2)}" style="width:100%; padding:4px; font-size:12px; border:1px solid var(--border); border-radius:4px;"></div>
        <div>
          <label style="font-size:10px; color:var(--text-muted); display:block;">Reason</label>
          <span style="font-size:11px; color:#b45309;">${item.extraction_confidence < 30 ? 'Garbled/Invalid' : 'Needs Review'} (${item.extraction_confidence}%)</span>
        </div>
      </div>
      <button onclick="approveReviewItem(this)" style="background:var(--accent); color:white; border:none; padding:6px 12px; border-radius:6px; cursor:pointer;" data-idx="${idx}">Add to Bill</button>
    </div>
  `).join('');
};

window.approveReviewItem = function(btn) {
  const row = btn.closest('.review-row');
  const date = row.querySelector('.rev-date').value;
  const code = row.querySelector('.rev-code').value;
  const total = parseFloat(row.querySelector('.rev-total').value);

  if (isNaN(total) || total <= 0) {
    alert("Please enter a valid billed amount.");
    return;
  }

  window.appGridRows.push({
    rowId: 'auto-' + Date.now() + Math.random().toString(36).substring(2,6),
    provenance: 'textract-reviewed',
    date,
    code,
    modifier: '',
    dx: [],
    qty: 1,
    price: null,
    total,
    paid: null,
    owed: null,
    adj: null,
    extraction_confidence: 100,
    has_low_confidence_chars: false,
    rowType: 'service',
    desc: 'Reviewed OCR Entry',
    npi: ''
  });

  row.remove();
  
  const container = document.getElementById('review-prompt-area');
  const remaining = container.querySelectorAll('.review-row').length;
  if (remaining === 0) {
    container.style.display = 'none';
  }

  localStorage.setItem('medihelp_grid_data', JSON.stringify(window.appGridRows));
  triggerAudit();
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

  // Handle handoff from landing page quick-audit
  const pending = localStorage.getItem('mh_pending_audit');
  if (pending) {
    localStorage.removeItem('mh_pending_audit');
    
    // Inline regex extraction matching landing page logic
    const lines = pending.split('\\n');
    let hasLoadedItems = false;
    
    lines.forEach(line => {
      const dates = line.match(/\\b(\\d{1,2}[\\/\\-]\\d{1,2}[\\/\\-]\\d{2,4})\\b/g);
      const codeMatches = [...line.matchAll(/\\b([1-9]\\d{4}|[1-9]\\d{2})(?:-([A-Z0-9]{2}))?\\b/g)];
      
      const codesOnLine = codeMatches.map(m => ({
        code: m[1],
        modifier: m[2] || '',
        qty: parseInt((line.match(/(?:qty|units?)[:\\s]+(\\d+)/i) || [null, '1'])[1], 10) || 1,
        date: dates ? dates[0] : '',
        isDRG: m[1].length === 3 && !!((window.MH_CONSTANTS?.DRG_BENCHMARKS || {})[m[1]])
      })).filter(it => it.isDRG || (typeof window.isValidCPT === 'function' && window.isValidCPT(it.code)) || /\\d{5}/.test(it.code));

      const dollarsOnLine = [...line.matchAll(/\\$\\s*(\\d+(?:\\.\\d{2})?)/g)].map(m => parseFloat(m[1]));

      codesOnLine.forEach((it, idx) => {
        hasLoadedItems = true;
        window.appGridRows.push({
          rowId: 'auto-handoff-' + Date.now() + '-' + idx + Math.random().toString(36).substring(2,6),
          provenance: 'landing-page-extract',
          date: it.date,
          code: it.code,
          modifier: it.modifier,
          dx: [],
          qty: it.qty,
          price: null,
          total: dollarsOnLine[idx] !== undefined ? dollarsOnLine[idx] : null,
          paid: null,
          owed: null,
          adj: null,
          extraction_confidence: 90,
          rowType: 'service',
          desc: 'Quick Audit Transfer',
          npi: ''
        });
      });
    });

    if (hasLoadedItems) {
      if (typeof saveToCache === 'function') saveToCache();
    }
  }
  
  // Give the UI a moment to render before firing the first audit
  setTimeout(triggerAudit, 100);
  if (typeof window.initNegotiatorIntake === 'function') {
    window.initNegotiatorIntake();
  }
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

  // Auto-expand advanced section if modifier or advanced fields are present
  const advWrap = document.getElementById('advanced-form-wrap');
  if (advWrap && (r.modifier || r.rowType !== 'service' || r.desc || r.npi || r.adj)) {
    advWrap.style.display = 'block';
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

const debouncedAudit = (window.debounce || (fn => fn)) (async () => {
  try {
    await triggerAudit();
  } catch (err) {
    console.error('Audit Runner Crashed:', err);
  }
}, 400);
window.debouncedAudit = debouncedAudit;

async function triggerAudit() {
  // Race condition guard
  if (typeof BucketAuditor === 'undefined') {
    console.warn('MediHelp: BucketAuditor not loaded, retrying...');
    setTimeout(triggerAudit, 500);
    return;
  }

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

  // ── Confidence Score ─────────────────────────────────────────────────────
  const confidence = engine.computeConfidence();
  window.currentEngineConfidence = confidence;

  const container = document.getElementById('result-cards-container');
  if (!container) return;
  
  if (rows.length === 0) {
    container.innerHTML = '<div style="text-align: center; color: var(--text-muted); padding: 30px; font-size: 13px;">Add elements above to see live findings here.</div>';
    const confidenceBadge = document.getElementById('audit-confidence-badge');
    if (confidenceBadge) confidenceBadge.remove();
    window.currentEngineConfidence = null;
    window.currentEngineFindings = [];
    window.currentEngineSavings = 0;
    const auditRes = document.getElementById('audit-results');
    if (auditRes) {
      auditRes.innerHTML = '';
      auditRes.classList.remove('visible');
    }
    if (typeof window.updateNegotiatorSavingsPreview === 'function') {
      window.updateNegotiatorSavingsPreview();
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
    // Render confidence badge
    renderConfidenceBadge(confidence);
  } else {
    console.warn("MediHelp: renderResultCardsPerLineItem missing from report.js. Falling back.");
  }
  if (typeof window.updateNegotiatorSavingsPreview === 'function') {
    window.updateNegotiatorSavingsPreview();
  }
}

function renderConfidenceBadge(confidence) {
  let el = document.getElementById('audit-confidence-badge');
  if (!el) {
    el = document.createElement('div');
    el.id = 'audit-confidence-badge';
    el.style.cssText = 'display:flex; align-items:center; gap:10px; margin:12px 0; padding:12px 16px; border-radius:10px; border:1px solid var(--border); background:var(--bg-card);';
    const container = document.getElementById('result-cards-container');
    if (container && container.parentNode) container.parentNode.insertBefore(el, container);
  }

  const score = confidence.score || 0;
  const color = score >= 75 ? '#10b981' : score >= 50 ? '#f59e0b' : '#ef4444';
  const label = score >= 75 ? 'High Confidence' : score >= 50 ? 'Moderate Confidence' : 'Low Confidence — Manual Review Advised';

  el.innerHTML = `
    <div style="position:relative; width:48px; height:48px; flex-shrink:0;">
      <svg width="48" height="48" viewBox="0 0 48 48">
        <circle cx="24" cy="24" r="20" fill="none" stroke="var(--border)" stroke-width="4"/>
        <circle cx="24" cy="24" r="20" fill="none" stroke="${color}" stroke-width="4"
          stroke-dasharray="${(score / 100) * 125.6} 125.6"
          stroke-dashoffset="31.4" stroke-linecap="round" transform="rotate(-90 24 24)"/>
      </svg>
      <div style="position:absolute; inset:0; display:flex; align-items:center; justify-content:center; font-size:11px; font-weight:800; color:${color};">${score}</div>
    </div>
    <div>
      <div style="font-size:12px; font-weight:700; color:var(--text-h);">Audit Confidence: <span style="color:${color};">${label}</span></div>
      <ul style="margin:4px 0 0; padding-left:14px; font-size:11px; color:var(--text-muted); line-height:1.8;">
        ${(confidence.reasons || []).map(r => `<li>${r}</li>`).join('')}
      </ul>
    </div>
  `;
}

window.triggerAudit = triggerAudit;

})(); // END SCOPE ISOLATION
