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
  const manualOnlySections = document.querySelectorAll('.manual-only-section');
  
  if (!manualTab || !pdfTab) return;
  
  if (tabName === 'manual') {
    manualTab.style.display = 'block';
    pdfTab.style.display = 'none';
    manualOnlySections.forEach((el) => { el.style.display = ''; });
    if (manualBtn) { manualBtn.style.background = 'var(--accent)'; manualBtn.style.color = 'white'; }
    if (pdfBtn) { pdfBtn.style.background = 'transparent'; pdfBtn.style.color = 'var(--text-muted)'; }
  } else {
    manualTab.style.display = 'none';
    pdfTab.style.display = 'block';
    manualOnlySections.forEach((el) => { el.style.display = 'none'; });
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

const STRICT_EXTRACTION_MIN_CONFIDENCE = 75;
let pendingVerifiedRows = [];
const extractionTelemetry = {
  profile: 'default_generic',
  profileConfidence: 0,
  decisionState: '',
  totalExtracted: 0,
  highConfidence: 0,
  manualReview: 0,
  importedVerified: 0,
  source: 'server'
};

function renderExtractionTelemetry() {
  const panel = document.getElementById('extraction-telemetry-panel');
  const text = document.getElementById('extraction-telemetry-text');
  if (!panel || !text) return;
  if (!extractionTelemetry.totalExtracted) {
    panel.style.display = 'none';
    return;
  }
  panel.style.display = 'block';
  text.textContent =
    `Profile: ${extractionTelemetry.profile} (${extractionTelemetry.profileConfidence}% confidence) | Source: ${extractionTelemetry.source} | ` +
    `Decision: ${extractionTelemetry.decisionState || 'n/a'} | ` +
    `Extracted: ${extractionTelemetry.totalExtracted} | High-confidence: ${extractionTelemetry.highConfidence} | ` +
    `Needs review: ${extractionTelemetry.manualReview} | Imported: ${extractionTelemetry.importedVerified}`;
}

function showExtractionStatus(message, level = 'info') {
  const pdfTab = document.getElementById('tab-content-pdf');
  if (!pdfTab) {
    if (level === 'error') alert(message);
    return;
  }

  let banner = document.getElementById('pdf-extraction-status-banner');
  if (!banner) {
    banner = document.createElement('div');
    banner.id = 'pdf-extraction-status-banner';
    banner.style.marginTop = '12px';
    banner.style.padding = '10px 12px';
    banner.style.borderRadius = '8px';
    banner.style.fontSize = '12px';
    banner.style.lineHeight = '1.55';
    banner.style.border = '1px solid';
    banner.style.display = 'none';
    const loadingState = document.getElementById('pdf-loading-state');
    if (loadingState && loadingState.parentNode) {
      loadingState.parentNode.insertBefore(banner, loadingState.nextSibling);
    } else {
      pdfTab.appendChild(banner);
    }
  }

  const themes = {
    info: {
      bg: 'rgba(14,165,233,0.12)',
      border: 'rgba(14,165,233,0.35)',
      text: '#7dd3fc'
    },
    success: {
      bg: 'rgba(34,197,94,0.12)',
      border: 'rgba(34,197,94,0.35)',
      text: '#86efac'
    },
    warn: {
      bg: 'rgba(245,158,11,0.12)',
      border: 'rgba(245,158,11,0.35)',
      text: '#fcd34d'
    },
    error: {
      bg: 'rgba(239,68,68,0.12)',
      border: 'rgba(239,68,68,0.35)',
      text: '#fca5a5'
    }
  };

  const t = themes[level] || themes.info;
  banner.style.background = t.bg;
  banner.style.borderColor = t.border;
  banner.style.color = t.text;
  banner.textContent = message;
  banner.style.display = 'block';
}

function showTopExtractionFindings(findings) {
  const pdfTab = document.getElementById('tab-content-pdf');
  if (!pdfTab) return;
  let panel = document.getElementById('pdf-top-findings-panel');
  if (!panel) {
    panel = document.createElement('div');
    panel.id = 'pdf-top-findings-panel';
    panel.style.marginTop = '8px';
    panel.style.padding = '10px 12px';
    panel.style.borderRadius = '8px';
    panel.style.fontSize = '12px';
    panel.style.border = '1px solid var(--border)';
    panel.style.background = 'var(--bg-card)';
    panel.style.display = 'none';
    const status = document.getElementById('pdf-extraction-status-banner');
    if (status && status.parentNode) status.parentNode.insertBefore(panel, status.nextSibling);
    else pdfTab.appendChild(panel);
  }
  const list = Array.isArray(findings) ? findings.slice(0, 5) : [];
  if (!list.length) {
    panel.style.display = 'none';
    panel.innerHTML = '';
    return;
  }
  panel.style.display = 'block';
  panel.innerHTML = `<div style="font-weight:700; margin-bottom:6px; color:var(--text-h);">Top Findings</div>${
    list.map((f, i) => `<div style="padding:2px 0; color:var(--text-main);">${i + 1}. ${window.sanitizeText(f.title || 'Issue')}${f.code ? ` (${window.sanitizeText(f.code)})` : ''}</div>`).join('')
  }`;
}

function decorateDecisionState(decisionState, metrics = null) {
  const map = {
    auto_acceptable: { label: 'Auto-Acceptable', level: 'success' },
    review_recommended: { label: 'Review Recommended', level: 'info' },
    review_required: { label: 'Review Required', level: 'warn' },
    unsafe_to_import: { label: 'Unsafe to Import', level: 'error' }
  };
  const conf = map[decisionState] || { label: 'Unknown Decision', level: 'info' };
  const metricText = metrics
    ? ` | agreement ${metrics.agreementScore || 0}% | valid codes ${(Number(metrics.validCodeRate || 0) * 100).toFixed(0)}% | unknown rows ${(Number(metrics.unknownRowTypeRate || 0) * 100).toFixed(0)}%`
    : '';
  showExtractionStatus(`Import Decision: ${conf.label}${metricText}`, conf.level);
}

function confidenceChip(label, value) {
  const n = Number(value || 0);
  const color = n >= 80 ? '#22c55e' : (n >= 60 ? '#f59e0b' : '#ef4444');
  return `<span style="font-size:10px; border:1px solid ${color}55; color:${color}; background:${color}14; border-radius:999px; padding:2px 6px; white-space:nowrap;">${label}: ${n}%</span>`;
}

function persistExtractionTelemetry() {
  try {
    const key = 'medihelp_extraction_telemetry';
    const current = JSON.parse(sessionStorage.getItem(key) || '{}');
    const profile = extractionTelemetry.profile || 'default_generic';
    if (!current[profile]) {
      current[profile] = { runs: 0, extracted: 0, highConfidence: 0, manualReview: 0, imported: 0, confidenceTotal: 0 };
    }
    current[profile].runs += 1;
    current[profile].extracted += extractionTelemetry.totalExtracted;
    current[profile].highConfidence += extractionTelemetry.highConfidence;
    current[profile].manualReview += extractionTelemetry.manualReview;
    current[profile].imported += extractionTelemetry.importedVerified;
    current[profile].confidenceTotal += Number(extractionTelemetry.profileConfidence || 0);
    sessionStorage.setItem(key, JSON.stringify(current));
  } catch (_) {
    // non-blocking telemetry
  }
}

function isStrongExtractedRow(item) {
  const code = String(item.CPT || '').trim().toUpperCase();
  const billed = Number(item.Billed_Amount || 0);
  const qty = Number(item.Qty || 0);
  const confidence = Number(item.extraction_confidence || 0);
  const hasDate = /\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4}|\d{4}-\d{2}-\d{2}/.test(String(item.Date || ''));
  const validCode = /^\d{5}$/.test(code) || /^[A-Z]\d{4}$/.test(code);

  return Boolean(
    validCode &&
    hasDate &&
    Number.isFinite(billed) &&
    billed > 0 &&
    Number.isFinite(qty) &&
    qty > 0 &&
    qty <= 50 &&
    confidence >= STRICT_EXTRACTION_MIN_CONFIDENCE &&
    (!item.has_low_confidence_chars || confidence >= 85) &&
    (!item.needs_manual_review || Number(item.money_mapping_error || 0) <= 1.0)
  );
}

function toAppGridRow(item, sourceTag) {
  const rowType = String(item.row_type || '').toLowerCase();
  const billedFallback = [item.Billed_Amount, item.total, item.Amount, item.charge].find((v) => Number.isFinite(Number(v)));
  const paidFallback = [item.Paid, item.paid].find((v) => Number.isFinite(Number(v)));
  const owedFallback = [item.Owed, item.owed].find((v) => Number.isFinite(Number(v)));
  const adjFallback = [item.Adjustment, item.adj].find((v) => Number.isFinite(Number(v)));
  return {
    rowId: `${sourceTag}-${Date.now()}-${Math.random().toString(36).substring(2, 6)}`,
    provenance: sourceTag,
    date: item.Date || '',
    code: item.CPT || '',
    modifier: item.Modifier || '',
    dx: Array.isArray(item.DX) ? item.DX : [],
    qty: item.Qty || 1,
    price: item.Unit_Price != null ? item.Unit_Price : null,
    total: billedFallback != null ? Number(billedFallback) : null,
    paid: paidFallback != null ? Number(paidFallback) : null,
    owed: owedFallback != null ? Number(owedFallback) : null,
    adj: adjFallback != null ? Number(adjFallback) : null,
    extraction_confidence: item.extraction_confidence ?? 100,
    has_low_confidence_chars: item.has_low_confidence_chars || false,
    rowType: rowType === 'summary/subtotal' ? 'summary' : (rowType || 'service'),
    row_type_reason: item.row_type_reason || '',
    money_mapping_source: item.money_mapping_source || '',
    money_mapping_error: Number(item.money_mapping_error || 0),
    desc: item.Description || item.desc || '',
    npi: ''
  };
}

function showExtractionVerificationGate(totalCount, cleanCount, reviewCount) {
  const gate = document.getElementById('extraction-verify-gate');
  const summary = document.getElementById('extraction-verify-summary');
  const checkbox = document.getElementById('extraction-verify-check');
  if (!gate || !summary || !checkbox) return;

  checkbox.checked = false;
  summary.textContent = `Extraction complete: ${totalCount} row(s) detected. ${cleanCount} high-confidence row(s) are ready to import. ${reviewCount} row(s) require manual verification first.`;
  gate.style.display = cleanCount > 0 ? 'block' : 'none';
}

window.confirmExtractionImport = function() {
  const gate = document.getElementById('extraction-verify-gate');
  const checkbox = document.getElementById('extraction-verify-check');
  if (!checkbox?.checked) {
    alert('Please confirm that you reviewed the extracted data before importing.');
    return;
  }
  if (!Array.isArray(pendingVerifiedRows) || pendingVerifiedRows.length === 0) {
    alert('No verified rows are pending import.');
    if (gate) gate.style.display = 'none';
    return;
  }

  pendingVerifiedRows.forEach((item, idx) => {
    window.appGridRows.push(toAppGridRow(item, `textract-verified-${idx}`));
  });
  extractionTelemetry.importedVerified += pendingVerifiedRows.length;
  pendingVerifiedRows = [];
  if (gate) gate.style.display = 'none';
  localStorage.setItem('medihelp_grid_data', JSON.stringify(window.appGridRows));
  persistExtractionTelemetry();
  renderExtractionTelemetry();
  switchAuditTab('manual');
  triggerAudit();
};

window.handlePdfSelect = async function(event) {
  const file = event.target.files && event.target.files[0];
  if (!file) return;
  switchAuditTab('pdf');

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
    window.currentDocumentProfile = d.extraction_profile || 'default_generic';
    if (d.direct_text_parse_stats && Number(d.direct_text_parse_stats.dropped || 0) > 0) {
      const reasons = d.direct_text_parse_stats.drop_reasons || {};
      const topReason = Object.keys(reasons).sort((a, b) => (reasons[b] || 0) - (reasons[a] || 0))[0];
      showExtractionStatus(
        `Parser note: ${d.direct_text_parse_stats.parsed || 0} row(s) parsed, ${d.direct_text_parse_stats.dropped || 0} dropped (${topReason || 'unknown reason'}).`,
        'info'
      );
    }
    
    const newItems = d.normalized_bill || [];
    if (newItems.length === 0) {
      showExtractionStatus('No billable line items were detected in this document. Try a clearer text-based itemized PDF.', 'warn');
    } else {
      const cleanItems = newItems.filter(isStrongExtractedRow);
      const reviewRequired = newItems.filter(i => !isStrongExtractedRow(i)).map(i => ({
        ...i,
        needs_manual_review: true
      }));
      pendingVerifiedRows = cleanItems;
      extractionTelemetry.profile = window.currentDocumentProfile || 'default_generic';
      extractionTelemetry.profileConfidence = Number(d.extraction_profile_confidence || 0);
      extractionTelemetry.decisionState = String(d.decision_state || '');
      extractionTelemetry.totalExtracted = newItems.length;
      extractionTelemetry.highConfidence = cleanItems.length;
      extractionTelemetry.manualReview = reviewRequired.length;
      extractionTelemetry.importedVerified = 0;
      extractionTelemetry.source = 'server';
      renderExtractionTelemetry();
      decorateDecisionState(d.decision_state, d.extraction_metrics || null);

      if (reviewRequired.length > 0) showManualReviewPrompt(reviewRequired);
      showExtractionVerificationGate(newItems.length, cleanItems.length, reviewRequired.length);
      showExtractionStatus(
        cleanItems.length > 0
          ? `Extraction completed. ${cleanItems.length} high-confidence row(s) ready to import and ${reviewRequired.length} row(s) need review.`
          : `Extraction completed, but all ${reviewRequired.length} row(s) need manual verification before import.`,
        cleanItems.length > 0 ? 'success' : 'warn'
      );
      showTopExtractionFindings(d?.result?.top_findings || []);

      switchAuditTab('pdf');
      if (cleanItems.length === 0 && reviewRequired.length > 0) {
        showExtractionStatus('No rows met strict confidence criteria. Please manually verify and add rows below.', 'warn');
      }
    }
  } catch(e) {
    const msg = String(e && e.message ? e.message : e);
    const isUnsupportedFormat = /unsupported document format/i.test(msg);
    const isBackendUnavailable =
      /AWS credentials not configured|AWS Textract failed|Server returned non-JSON response/i.test(msg);

    if (isBackendUnavailable && file && /pdf/i.test(file.type || '')) {
      try {
        const fallbackRows = await extractPdfClientSide(file);
        if (fallbackRows.length > 0) {
          const fallbackReviewRows = fallbackRows.map(r => ({
            Date: r.date || '',
            CPT: r.code || '',
            Qty: r.qty || 1,
            Billed_Amount: r.total != null ? r.total : 0,
            DX: r.dx ? [r.dx] : [],
            Modifier: '',
            Unit_Price: null,
            Adjustment: null,
            Paid: null,
            extraction_confidence: 45,
            has_low_confidence_chars: true,
            needs_manual_review: true,
            review_reasons: [isUnsupportedFormat ? 'Textract does not support this PDF encoding' : 'Server extraction unavailable', 'Client fallback requires manual verification']
          }));
          pendingVerifiedRows = [];
          extractionTelemetry.profile = 'client_fallback';
          extractionTelemetry.profileConfidence = 0;
          extractionTelemetry.decisionState = 'review_required';
          extractionTelemetry.totalExtracted = fallbackReviewRows.length;
          extractionTelemetry.highConfidence = 0;
          extractionTelemetry.manualReview = fallbackReviewRows.length;
          extractionTelemetry.importedVerified = 0;
          extractionTelemetry.source = 'client-fallback';
          renderExtractionTelemetry();
          showManualReviewPrompt(fallbackReviewRows);
          showExtractionVerificationGate(fallbackReviewRows.length, 0, fallbackReviewRows.length);
          showExtractionStatus(
            isUnsupportedFormat
              ? `Textract cannot process this PDF encoding. Loaded ${fallbackReviewRows.length} fallback row(s); please verify before import.`
              : `Server extraction is temporarily unavailable. Loaded ${fallbackReviewRows.length} fallback row(s); please verify before import.`,
            'warn'
          );
          switchAuditTab('pdf');
          return;
        }
      } catch (_) {
        // continue to normal alert below
      }
    }

    showExtractionStatus(`Extraction error: ${msg}`, 'error');
    showTopExtractionFindings([]);
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
  let lines = [];
  for (let p = 1; p <= pdf.numPages; p++) {
    const page = await pdf.getPage(p);
    const content = await page.getTextContent();
    const rowsByY = new Map();
    content.items.forEach((item) => {
      const y = Math.round((item.transform && item.transform[5]) || 0);
      const x = (item.transform && item.transform[4]) || 0;
      if (!rowsByY.has(y)) rowsByY.set(y, []);
      rowsByY.get(y).push({ x, str: item.str || '' });
    });
    const orderedRows = [...rowsByY.entries()]
      .sort((a, b) => b[0] - a[0])
      .map(([, cols]) => cols.sort((a, b) => a.x - b.x).map(c => c.str).join(' ').replace(/\s+/g, ' ').trim())
      .filter(Boolean);
    lines.push(...orderedRows);
  }
  const out = [];
  lines.forEach((line) => {
    const date = (line.match(/\b\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4}\b/) || [])[0] || '';
    const codeMatches = [...line.matchAll(/\b([A-Z]\d{4}|\d{5})\b/g)].map(m => m[1]);
    const code = codeMatches.find(c => /^\d{5}$/.test(c) || /^[A-Z]\d{4}$/.test(c)) || '';
    const dx = (line.match(/\b([A-TV-Z][0-9][0-9AB](?:\.[A-Z0-9]{1,4})?)\b/i) || [])[1] || '';
    const qty = parseInt((line.match(/\bqty[:\s]*(\d+)\b/i) || [])[1] || '1', 10);
    const money = [...line.matchAll(/(?:\$?\s*)(-?\d{1,3}(?:,\d{3})*(?:\.\d{2}))/g)]
      .map(m => parseFloat(String(m[1]).replace(/,/g, '')))
      .filter(n => Number.isFinite(n));
    const total = money.length ? money[money.length - 1] : null;
    if (code && total != null) {
      out.push({ date, code, dx, qty: Number.isFinite(qty) ? qty : 1, total });
    }
  });
  return out.slice(0, 120);
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

  const criticalItems = [];
  const nonCriticalItems = [];
  (items || []).forEach((item, idx) => {
    const mapErr = Number(item.money_mapping_error || 0);
    const isCritical = mapErr > 1.0 || String(item.row_type || '').toLowerCase() === 'unknown' || /money column mapping uncertainty/i.test(String((item.review_reasons || []).join(' ')));
    const payload = { item, idx };
    if (isCritical) criticalItems.push(payload);
    else nonCriticalItems.push(payload);
  });

  const renderReviewRow = ({ item, idx }) => `
    <div class="review-row" style="background:rgba(245,158,11,0.05); border:1px solid rgba(245,158,11,0.2); border-radius:8px; padding:12px; margin-bottom:10px; display:flex; gap:12px; align-items:center;">
      <div style="background:#f59e0b; color:white; width:24px; height:24px; border-radius:50%; display:flex; align-items:center; justify-content:center; flex-shrink:0; font-size:12px; font-weight:bold;">!</div>
      <div style="flex-grow:1; display:grid; grid-template-columns: repeat(4, 1fr); gap:8px;">
        <div><label style="font-size:10px; color:var(--text-muted); display:block;">Date</label><input type="text" class="rev-date" value="${s(item.Date)}" style="width:100%; padding:6px 8px; font-size:12px; border:1px solid var(--border); border-radius:4px; background:var(--bg-main); color:var(--text-h);"></div>
        <div><label style="font-size:10px; color:var(--text-muted); display:block;">CPT</label><input type="text" class="rev-code" value="${s(item.CPT)}" style="width:100%; padding:6px 8px; font-size:12px; border:1px solid var(--border); border-radius:4px; background:var(--bg-main); color:var(--text-h);"></div>
        <div><label style="font-size:10px; color:var(--text-muted); display:block;">Total</label><input type="text" class="rev-total" value="${Number.isFinite(Number(item.Billed_Amount)) ? Number(item.Billed_Amount).toFixed(2) : ''}" style="width:100%; padding:6px 8px; font-size:12px; border:1px solid var(--border); border-radius:4px; background:var(--bg-main); color:var(--text-h);"></div>
        <div>
          <label style="font-size:10px; color:var(--text-muted); display:block;">Reason</label>
          <span style="font-size:11px; color:#b45309;">${(item.review_reasons && item.review_reasons.length ? item.review_reasons[0] : (item.extraction_confidence < 30 ? 'Garbled/Invalid' : 'Needs Review'))} (${item.extraction_confidence || 0}%)</span>
        </div>
      </div>
      <div style="display:flex; gap:6px; flex-wrap:wrap; margin-top:8px;">
        ${confidenceChip('overall', item.overall_confidence || item.extraction_confidence || 0)}
        ${confidenceChip('date', item.date_confidence || 0)}
        ${confidenceChip('code', item.code_confidence || 0)}
        ${confidenceChip('qty', item.qty_confidence || 0)}
        ${confidenceChip('amount', item.amount_confidence || 0)}
        ${confidenceChip('row type', item.row_type_confidence || 0)}
        <span style="font-size:10px; border:1px solid var(--border); color:var(--text-main); border-radius:999px; padding:2px 6px;">type: ${(item.row_type || 'unknown')}</span>
        ${(item.row_type_reason)
          ? `<span style="font-size:10px; border:1px solid #60a5fa55; color:#60a5fa; background:#60a5fa14; border-radius:999px; padding:2px 6px;">${s(item.row_type_reason)}</span>`
          : ''}
        ${(item.money_mapping_source)
          ? `<span style="font-size:10px; border:1px solid #a78bfa55; color:#a78bfa; background:#a78bfa14; border-radius:999px; padding:2px 6px;">map: ${s(item.money_mapping_source)}</span>`
          : ''}
        ${(Number.isFinite(Number(item.money_mapping_error)))
          ? `<span style="font-size:10px; border:1px solid ${Number(item.money_mapping_error) > 1 ? '#ef444455' : '#22c55e55'}; color:${Number(item.money_mapping_error) > 1 ? '#ef4444' : '#22c55e'}; background:${Number(item.money_mapping_error) > 1 ? '#ef444414' : '#22c55e14'}; border-radius:999px; padding:2px 6px;">map err: ${Number(item.money_mapping_error).toFixed(2)}</span>`
          : ''}
        ${(item.duplicate_status && item.duplicate_status !== 'none')
          ? `<span style="font-size:10px; border:1px solid #f59e0b55; color:#f59e0b; background:#f59e0b14; border-radius:999px; padding:2px 6px;">${item.duplicate_status}</span>`
          : ''}
      </div>
      <button onclick="approveReviewItem(this)" style="background:var(--accent); color:white; border:none; padding:6px 12px; border-radius:6px; cursor:pointer;" data-idx="${idx}">Add to Bill</button>
    </div>
  `;

  list.innerHTML = `
    ${criticalItems.length ? `<div style="font-size:11px;font-weight:800;color:#ef4444;text-transform:uppercase;letter-spacing:0.4px;margin:2px 0 8px;">Critical Review Rows (${criticalItems.length})</div>` : ''}
    ${criticalItems.map(renderReviewRow).join('')}
    ${nonCriticalItems.length ? `<details style="margin-top:8px;"><summary style="cursor:pointer;font-size:12px;color:var(--text-muted);font-weight:700;">Show non-critical review rows (${nonCriticalItems.length})</summary><div style="margin-top:10px;">${nonCriticalItems.map(renderReviewRow).join('')}</div></details>` : ''}
  `;
};

window.approveReviewItem = function(btn) {
  const row = btn.closest('.review-row');
  const date = row.querySelector('.rev-date').value;
  const code = row.querySelector('.rev-code').value.trim().toUpperCase();
  const total = parseFloat(row.querySelector('.rev-total').value);

  if (!/^\d{5}$|^[A-Z]\d{4}$/.test(code)) {
    alert("Please enter a valid CPT/HCPCS code before adding.");
    return;
  }
  if (isNaN(total) || total <= 0 || total > 1000000) {
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
    row_type_reason: 'manual reviewer confirmed',
    money_mapping_source: 'manual_review',
    money_mapping_error: 0,
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
  const pending = sessionStorage.getItem('mh_pending_audit');
  if (pending) {
    sessionStorage.removeItem('mh_pending_audit');
    
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
  triggerAudit._retryCount = triggerAudit._retryCount || 0;
  if (typeof BucketAuditor === 'undefined') {
    triggerAudit._retryCount += 1;
    if (triggerAudit._retryCount > 10) {
      console.error('MediHelp: BucketAuditor failed to load after retries.');
      const container = document.getElementById('result-cards-container');
      if (container) {
        container.innerHTML = '<div style="color:var(--danger,#dc2626);padding:14px;border:1px solid var(--border);border-radius:8px;">Audit engine could not load. Please refresh the page and retry.</div>';
      }
      return;
    }
    console.warn('MediHelp: BucketAuditor not loaded, retrying...');
    setTimeout(triggerAudit, 500);
    return;
  }
  triggerAudit._retryCount = 0;

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
