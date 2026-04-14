// ── Stage 4: V8.0 Interactive Grid Reporting Synthesis ──

window.currentEngineFindings = [];
window.currentEngineSavings  = 0;

function renderResultCardsPerLineItem(rows, findings, container, rationaleMap = {}) {
  let html = '';

  // Sanitize helper — used in both per-row cards and document-level findings
  const s = (v) => {
    if (typeof window.sanitizeText === 'function') return window.sanitizeText(String(v || ''));
    return String(v || '').replace(/[&<>"']/g, m => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[m]));
  };
  
  const isHighValueFinding = (f) => {
    const category = String(f.category || '').toLowerCase();
    const title = String(f.title || '').toLowerCase();
    if (f.type === 'danger') return true;
    if (['bundling', 'duplicate', 'frequency', 'benchmark', 'financial', 'compatibility', 'modifier'].includes(category)) return true;
    return /overcharge|pricing variance|mue|ncci|upcoding|duplicate|bundle|frequency/.test(title);
  };

  rows.forEach((r, idx) => {
    // Exact or loose match based on line item code
    const relatedFindings = findings.filter(f => f.rowId === r.rowId || (!f.rowId && f.codeRef && f.codeRef === r.code) || (!f.codeRef && f.index === idx));
    
    // Prioritize high-value issues and de-emphasize low-value parser noise
    const hardFindings = relatedFindings.filter(f => isHighValueFinding(f));
    const softFindings = relatedFindings.filter(f => !hardFindings.includes(f) && f.category !== 'arithmetic');
    const lowValueFindings = relatedFindings.filter(f => f.category === 'arithmetic' && !isHighValueFinding(f));
    
    // Determine overall color and status
    let color = 'var(--text-muted)';
    let border = 'var(--border)';
    let bg = 'rgba(255,255,255,0.02)';
    let statusClass = 'audit-row-clean';
    let statusText = 'Clean Charge';
    
    if (hardFindings.length > 0) {
       color = '#ef4444'; border = '#ef4444'; bg = 'rgba(239, 68, 68, 0.05)'; statusClass = 'audit-row-error'; statusText = 'Critical Billing Issues';
    } else if (softFindings.length > 0) {
       color = '#f59e0b'; border = '#f59e0b'; bg = 'rgba(245, 158, 11, 0.05)'; statusClass = 'audit-row-warn'; statusText = 'Review Recommended';
    } else if (lowValueFindings.length > 0) {
       color = '#60a5fa'; border = '#60a5fa'; bg = 'rgba(96, 165, 250, 0.06)'; statusClass = 'audit-row-info'; statusText = 'Minor Validation Notes';
    } else {
       color = '#10b981'; border = '#10b981'; bg = 'rgba(16, 185, 129, 0.05)';
    }

    const rationales = rationaleMap[idx] || [];

    // OCR Confidence Badge
    let confidenceBadge = '';
    if (r.provenance && r.provenance.startsWith('textract')) {
      const conf = r.extraction_confidence || 100;
      const confColor = conf > 80 ? '#10b981' : (conf > 50 ? '#f59e0b' : '#ef4444');
      confidenceBadge = `<span style="font-size:10px; font-weight:700; color:${confColor}; background: ${confColor}11; border: 1px solid ${confColor}33; padding: 2px 6px; border-radius: 4px; margin-left:8px;">OCR: ${conf}%</span>`;
      if (r.has_low_confidence_chars) {
        confidenceBadge += `<span style="font-size:10px; font-weight:700; color:#ef4444; margin-left:4px;" title="Specific characters in this row had low OCR confidence">[?]</span>`;
      }
    }

    html += `
      <div class="${statusClass}" style="border-left: 4px solid ${border}; background: ${bg}; border-radius: 8px; padding: 14px 16px; display:flex; flex-direction:column; gap:8px; margin-bottom: 12px; transition: all 0.2s;">
        <div style="display:flex; justify-content:space-between; align-items:center;">
          <div style="font-weight:800; color:var(--text-h); font-size:14px; font-family:monospace; display:flex; align-items:center;">
            ${s(r.code) || 'Uncoded'}
            ${r.modifier ? `<span style="color:var(--accent); margin-left:4px;">-${s(r.modifier)}</span>` : ''}
            <span style="font-family:sans-serif; font-size:12px; font-weight:500; color:var(--text-muted); margin-left:12px;">
              Qty: ${r.qty || 1} | Billed: $${parseFloat(r.total || 0).toFixed(2)}
            </span>
            ${confidenceBadge}
            ${r.dx && r.dx.length > 0 ? `<span style="font-family:sans-serif; font-size:11px; padding:2px 6px; border:1px solid var(--border); border-radius:12px; margin-left:12px; color:var(--text-muted);">Dx: ${r.dx.join(', ')}</span>` : ''}
          </div>
          <div style="display:flex; align-items:center; gap:12px;">
            <div style="font-size:10px; font-weight:800; color:${color}; text-transform:uppercase; letter-spacing:0.5px; border:1px solid ${border}44; padding:2px 8px; border-radius:12px;">${statusText}</div>
            <button onclick="editAuditRow(${idx})" style="background:transparent; border:1px solid var(--border); color:var(--text-main); border-radius:6px; padding:2px 8px; font-size:11px; font-weight:600; cursor:pointer; transition:background 0.2s;" onmouseover="this.style.background='var(--bg-main)';" onmouseout="this.style.background='transparent';">Edit</button>
            <button onclick="removeAuditRow(${idx})" style="background:rgba(239, 68, 68, 0.1); border:none; color:var(--danger); border-radius:50%; width:24px; height:24px; display:flex; align-items:center; justify-content:center; cursor:pointer; font-size:14px; transition:background 0.2s;" onmouseover="this.style.background='rgba(239, 68, 68, 0.2)';" onmouseout="this.style.background='rgba(239, 68, 68, 0.1)';">✕</button>
          </div>
        </div>
        
        <div style="display:flex; flex-direction:column; gap:8px; margin-top:8px;">
          ${relatedFindings.length === 0 ? `<div style="font-size:12px; color:var(--text-muted); display:flex; align-items:center; gap:6px;"><span style="color:#10b981;font-weight:bold;">✓</span> <span>Charge is mathematically and clinically sound.</span></div>` : ''}
          
          ${hardFindings.length > 0 ? `
            <div style="margin-bottom: 4px;">
              <div style="font-size:10px; font-weight:800; color:#ef4444; text-transform:uppercase; margin-bottom:4px; letter-spacing:0.5px;">High-Value Issues</div>
              ${hardFindings.map(f => `
                <div style="font-size:12px; color:var(--text-h); display:flex; gap:8px; line-height:1.5; margin-bottom:4px;">
                  <span style="flex-shrink:0;color:#ef4444;font-weight:bold;">!</span>
                  <div>
                    <strong>${s(f.title)}</strong> ${f.confidence ? `<span style="font-size:10px; color:#ef4444; background:rgba(239,68,68,0.1); padding:1px 4px; border-radius:4px; margin-left:4px;">${f.confidence}% Certainty</span>` : ''}: <span style="color:var(--text-muted);">${s(f.detail)}</span>
                  </div>
                </div>
              `).join('')}
            </div>
          ` : ''}

          ${softFindings.length > 0 ? `
            <div>
              <div style="font-size:10px; font-weight:800; color:#f59e0b; text-transform:uppercase; margin-bottom:4px; letter-spacing:0.5px;">Documentation Risk</div>
              ${softFindings.map(f => `
                <div style="font-size:12px; color:var(--text-h); display:flex; gap:8px; line-height:1.5; margin-bottom:4px;">
                  <span style="flex-shrink:0;color:#f59e0b;font-weight:bold;">!</span>
                  <div>
                    <strong>${s(f.title)}</strong> ${f.confidence ? `<span style="font-size:10px; color:#f59e0b; background:rgba(245,158,11,0.1); padding:1px 4px; border-radius:4px; margin-left:4px;">${f.confidence}% Confidence</span>` : ''}: <span style="color:var(--text-muted);">${s(f.detail)}</span>
                  </div>
                </div>
              `).join('')}
            </div>
          ` : ''}

          ${lowValueFindings.length > 0 ? `
            <details style="margin-top:2px;">
              <summary style="cursor:pointer; font-size:11px; color:#60a5fa; font-weight:700;">Minor validation details (${lowValueFindings.length})</summary>
              <div style="padding-top:6px;">
                ${lowValueFindings.map(f => `
                  <div style="font-size:11px; color:var(--text-muted); display:flex; gap:8px; line-height:1.45; margin-bottom:4px;">
                    <span style="flex-shrink:0;color:#60a5fa;font-weight:bold;">i</span>
                    <div><strong>${s(f.title)}</strong>: ${s(f.detail)}</div>
                  </div>
                `).join('')}
              </div>
            </details>
          ` : ''}

          ${rationales.length > 0 ? `
            <div style="margin-top:4px; padding:8px; background:rgba(34,197,94,0.05); border:1px solid rgba(34,197,94,0.2); border-radius:6px;">
              <div style="font-size:10px; font-weight:800; color:#10b981; text-transform:uppercase; margin-bottom:4px;">Mathematical Adjustments</div>
              <ul style="margin:0; padding-left:16px; font-size:11px; color:#10b981;">
                ${rationales.map(r => `<li>${s(r)}</li>`).join('')}
              </ul>
            </div>
          ` : ''}
        </div>
      </div>
    `;
  });
  
    container.innerHTML = html;

    // ── Document-Level Findings (orphaned: no rowId, no codeRef) ──────────────
    // These are global findings (financial summary, date sanity, invoice total mismatch, etc.)
    // that are not tied to a specific row. They were previously invisible.
    const orphanedFindings = findings.filter(f => !f.rowId && !f.codeRef);
    if (orphanedFindings.length > 0) {
      const orphanSection = document.createElement('div');
      orphanSection.style.cssText = 'margin-top:16px; border:1px solid rgba(245,158,11,0.3); border-radius:10px; padding:14px 16px; background:rgba(245,158,11,0.03);';
      
      let orphanHtml = `<div style="font-size:10px; font-weight:800; color:#f59e0b; text-transform:uppercase; letter-spacing:0.5px; margin-bottom:10px;">&#9888; Document-Level Findings</div>`;
      orphanedFindings.forEach(f => {
        const typeColor = f.type === 'danger' ? '#ef4444' : (f.type === 'info' ? 'var(--text-muted)' : '#f59e0b');
        orphanHtml += `
          <div style="display:flex; gap:8px; margin-bottom:8px; font-size:12px; line-height:1.5;">
            <span style="color:${typeColor}; font-weight:bold; flex-shrink:0;">&#8226;</span>
            <div>
              <strong style="color:var(--text-h);">${s(f.title)}</strong>
              ${f.confidence ? `<span style="font-size:10px; color:${typeColor}; background:${typeColor}18; padding:1px 4px; border-radius:4px; margin-left:4px;">${f.confidence}%</span>` : ''}
              <span style="color:var(--text-muted);">: ${s(f.detail)}</span>
            </div>
          </div>`;
      });

      orphanSection.innerHTML = orphanHtml;
      container.appendChild(orphanSection);
    }

    // Update Real-time Summary Header (v8.5)
    updateAuditSummaryOverlay(findings);
}

function updateAuditSummaryOverlay(findings) {
  const overlay = document.getElementById('audit-summary-overlay');
  if (!overlay) return;

  const savingsField = document.getElementById('stat-total-savings');
  const billedField  = document.getElementById('stat-total-billed');
  
  const totalSavings = window.currentEngineSavings || 0;
  // Calculate total billed from current rows
  const totalBilled = (window.appGridRows || []).reduce((s, r) => s + (parseFloat(r.total) || 0), 0);

  if (totalBilled > 0) {
    overlay.style.display = 'flex';
    if (savingsField) savingsField.innerText = `$${totalSavings.toFixed(2)}`;
    if (billedField)  billedField.innerText  = `$${totalBilled.toFixed(2)}`;
  } else {
    overlay.style.display = 'none';
  }
}

window.renderResultCardsPerLineItem = renderResultCardsPerLineItem;

function renderFinalSummary(savings, benchmark, container) {
  // Ensure the container is visible (override display: none from CSS)
  if (container) container.classList.add('visible');
  
  let html = `
    <!-- Savings Summary -->
    <div style="background:var(--bg-card);border:1px solid rgba(34,197,94,.35);border-radius:12px;padding:24px;text-align:center;margin-top:20px;">
      <div style="font-size:11px; font-weight:800; text-transform:uppercase; color:#22c55e; letter-spacing:1px; margin-bottom:8px;">Estimated Overcharge Recovery</div>
      <div style="font-size:42px;font-weight:800;color:var(--text-h); line-height:1;">$${savings.toFixed(2)}</div>
      <div style="font-size:12px;color:var(--text-muted);margin-top:12px;">Waterfall calculations applied to all inputs. Limit capped to billed totals.</div>
      ${benchmark > 0 ? `<div style="font-size:12px;color:var(--text-main);margin-top:4px;font-weight:600;">Total Medicare Benchmark Equivalent: $${benchmark.toFixed(2)}</div>` : ''}
    </div>

    <!-- Export Buttons -->
    <div style="margin-top:20px;display:flex;gap:12px;flex-wrap:wrap;border-top:1px solid var(--border);padding-top:20px;">
      <button onclick="exportAuditCSV()" class="btn btn-ghost" style="font-size:12px;flex:1;min-width:120px;letter-spacing:0.02em;">Export CSV</button>
      <button onclick="handleAuditExport('summary')" class="btn btn-secondary" style="font-size:12px;flex:1;min-width:160px;background:var(--bg-card);color:var(--text-main);border:1px solid var(--border);font-weight:600;letter-spacing:0.02em;">Download Summary Report</button>
      <button onclick="handleAuditExport('dispute')" class="btn btn-primary" style="font-size:12px;flex:2;min-width:240px;font-weight:700;letter-spacing:0.03em;box-shadow:0 4px 12px rgba(0,0,0,0.1);">Generate Dispute Letter</button>
    </div>
  `;
  container.innerHTML = html;
}
window.renderFinalSummary = renderFinalSummary;

function clearAudit() {
  // Clear the interactive grid rows and re-run audit (replaces dead bill-text / line-items-text refs)
  if (window.appGridRows && window.appGridRows.length > 0) {
    window.appGridRows = [];
    localStorage.removeItem('medihelp_grid_data');
  }
  const res = document.getElementById('audit-results');
  if (res) { res.innerHTML = ''; res.classList.remove('visible'); }
  const cards = document.getElementById('result-cards-container');
  if (cards) cards.innerHTML = '';
  if (typeof triggerAudit === 'function') triggerAudit();
}
window.clearAudit = clearAudit;

window.handleAuditExport = (type) => {
  if (type === 'summary') {
    generatePDF('summary');
  } else {
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

// ── PDF Generator Engine ──
async function generatePDF(forcedType = null) {
  if (!window.jspdf) {
    alert('PDF library not loaded. Please check your internet connection and refresh.');
    return;
  }
  const { jsPDF } = window.jspdf;
  const doc   = new jsPDF();
  const modal = document.getElementById('patient-modal');
  const type  = (typeof forcedType === 'string' ? forcedType : null) || (modal ? modal.dataset.reportType : 'summary');

  const pInfo = {
    first:        document.getElementById('p-first')?.value    || 'N/A',
    last:         document.getElementById('p-last')?.value     || 'N/A',
    hospital:     document.getElementById('p-hospital')?.value || 'Facility',
    account:      document.getElementById('p-account')?.value  || 'N/A',
    ins:          document.getElementById('p-insurance')?.value|| 'N/A',
    date:         document.getElementById('p-date')?.value     || new Date().toLocaleDateString(),
    requestNotes: document.getElementById('p-req-notes')?.checked || false
  };

  const findings = window.currentEngineFindings;
  const savings  = window.currentEngineSavings;

  if (type === 'dispute') {
    renderDisputeLetter(doc, pInfo, findings, savings);
  } else {
    renderSummaryReport(doc, pInfo, findings, savings);
  }

  doc.save(`MediHelp_${type === 'dispute' ? 'Dispute' : 'Audit'}_${pInfo.last}.pdf`);
  closePatientModal();
}

/**
 * CITATION_MAP (v6.0) — Evidence-based citations for the dispute letter.
 * Each entry maps an audit category to a specific CMS Manual chapter reference.
 */
const CITATION_MAP = {
  bundling:      'Per CMS National Correct Coding Initiative (NCCI) — Medicare Claims Processing Manual, Chapter 23, §20. This code pair constitutes a Column 1/Column 2 edit; the component code is not separately billable.',
  frequency:     'Per CMS Medically Unlikely Edit (MUE) limits — Medicare Claims Processing Manual, Chapter 1, §70. The daily unit limit for this code has been exceeded. Excess units are non-payable.',
  arithmetic:    'Per CMS billing accuracy standards — Medicare Claims Processing Manual, Chapter 1, §30.2.5. All line items must be mathematically accurate: Qty × Unit Price must equal the billed total.',
  benchmark:     'Per CMS Medicare Physician Fee Schedule (MPFS) — Medicare Claims Processing Manual, Chapter 12. This charge significantly exceeds the allowable fee schedule amount. Reference: cms.gov/Medicare/Medicare-Fee-for-Service-Payment/PhysicianFeeSched.',
  duplicate:     'Per CMS duplicate claim policy — Medicare Claims Processing Manual, Chapter 4, §20.4.2. Duplicate charges for the same service on the same date are payable only once.',
  modifier:      'Per CMS modifier documentation requirements — Medicare Claims Processing Manual, Chapter 12, §30.6. This surgical procedure requires specific modifiers to be separately payable.',
  POS:           'Per CMS Place of Service (POS) coding — Medicare Claims Processing Manual, Chapter 26, §10.5. The place of service code must match the actual setting in which the service was rendered.',
  compatibility: 'Per CMS Medical Necessity documentation requirements — Medicare Claims Processing Manual, Chapter 13, §10. Procedures must be clinically appropriate for the reported diagnosis.',
  financial:     'Per CMS credit balance reporting requirements — Medicare Claims Processing Manual, Chapter 4, §50. Credit balances must be reported and refunded within 60 days.',
  NPI:           'Per CMS Provider Taxonomy Cross-Check — NPI Registry (npiregistry.cms.hhs.gov). Provider specialty must match the billed procedure category.',
};

function pdfSafeText(value) {
  return String(value || '')
    .replace(/[^\x09\x0A\x0D\x20-\x7E]/g, ' ') // strip unsupported symbols/emojis
    .replace(/\s+/g, ' ')
    .trim();
}

function writeWrapped(doc, text, x, y, maxWidth, lineHeight = 5, pageBottom = 275) {
  const lines = doc.splitTextToSize(pdfSafeText(text), maxWidth);
  let cursorY = y;
  lines.forEach((line) => {
    if (cursorY > pageBottom) {
      doc.addPage();
      cursorY = 20;
    }
    doc.text(line, x, cursorY);
    cursorY += lineHeight;
  });
  return cursorY;
}

function renderDisputeLetter(doc, p, findings, savings) {
  const left = 18;
  const maxWidth = 174;
  let y = 20;
  doc.setFontSize(10);
  doc.text(pdfSafeText(new Date().toLocaleDateString()), left, y);
  y += 10;
  doc.setFont('helvetica', 'bold');
  doc.text('TO: Billing Department / Claims Administrator', left, y);
  y += 5;
  doc.text(pdfSafeText(`${p.hospital}`), left, y);
  y += 12;

  doc.setFontSize(12);
  doc.text('RE: FORMAL BILLING DISPUTE & REQUEST FOR RECONSIDERATION', left, y);
  y += 10;
  doc.setFontSize(10);
  doc.setFont('helvetica', 'normal');
  y = writeWrapped(doc, `Patient Name: ${p.first} ${p.last}`, left, y, maxWidth);
  y = writeWrapped(doc, `Account/Invoice: ${p.account} | Insurance ID: ${p.ins}`, left, y + 1, maxWidth);
  y = writeWrapped(doc, `Statement Date: ${p.date}`, left, y + 1, maxWidth);
  y += 6;
  const body = `I am submitting a formal billing dispute for the above-referenced account. A structured audit of the line-item statement identified material irregularities related to coding, arithmetic integrity, and/or reimbursement benchmarks. Please treat this as a request for formal review, documented correction, and an updated patient liability statement. Pursuant to 45 CFR §164.524, I also request complete supporting records used to generate the billed balance.`;
  y = writeWrapped(doc, body, left, y, maxWidth, 5.4) + 6;

  doc.setFont('helvetica', 'bold');
  if (y > 260) { doc.addPage(); y = 20; }
  doc.text('SPECIFIC REASONS FOR DISPUTE (CMS-REFERENCED):', left, y);
  y += 8;
  doc.setFont('helvetica', 'normal');

  // Deduplicate findings by category+title before rendering
  const seenKey = new Set();
  const dedupedFindings = findings.filter(f => {
    const key = `${f.category}|${f.title}`;
    if (seenKey.has(key)) return false;
    seenKey.add(key);
    return true;
  });

  const groups = {};
  dedupedFindings.forEach(f => {
    (groups[f.category] = groups[f.category] || []).push(f);
  });

  Object.entries(groups).forEach(([cat, items]) => {
    if (y > 250) { doc.addPage(); y = 20; }
    const meta = (window.CATEGORY_META && window.CATEGORY_META[cat]) || { label: cat.toUpperCase() };
    doc.setFont('helvetica', 'bold');
    doc.setFontSize(10);
    doc.text(pdfSafeText(`${(meta.label || cat).toUpperCase()}`), left, y);
    y += 5;

    if (CITATION_MAP[cat]) {
      doc.setFont('helvetica', 'italic');
      doc.setFontSize(8.5);
      doc.setTextColor(80);
      y = writeWrapped(doc, `CMS Reference: ${CITATION_MAP[cat]}`, left + 5, y, maxWidth - 10, 4.2, 270) + 2;
      doc.setTextColor(0);
    }

    doc.setFont('helvetica', 'normal');
    doc.setFontSize(10);
    items.forEach(f => {
      if (y > 270) { doc.addPage(); y = 20; }
      const line = `- ${f.title}: ${f.detail}`;
      y = writeWrapped(doc, line, left + 5, y, maxWidth - 8, 5.0, 272) + 2;
    });
    y += 6;
  });

  // Potential savings callout
  if (savings > 0) {
    if (y > 240) { doc.addPage(); y = 20; }
    doc.setFont('helvetica', 'bold');
    doc.setFontSize(11);
    doc.text(`ESTIMATED OVERCHARGE (POTENTIAL RECOVERY): $${savings.toFixed(2)}`, left, y);
    y += 8;
    doc.setFont('helvetica', 'normal');
    doc.setFontSize(9);
    y = writeWrapped(doc, 'This figure is based on deduplicated, per-line-item savings calculations capped to each line\'s billed total. It represents a conservative estimate using CMS Medicare benchmark pricing where available.', left, y, maxWidth, 4.4, 272) + 8;
  }

  y += 10;
  if (y > 260) { doc.addPage(); y = 20; }
  doc.setFont('helvetica', 'normal');
  doc.setFontSize(10);
  y = writeWrapped(doc, 'Please provide a written response within 30 days identifying accepted corrections, denied items with rationale, and revised patient responsibility. If applicable, include corrected claim references and remittance details.', left, y, maxWidth, 5.0, 272) + 10;
  if (y > 250) { doc.addPage(); y = 20; }
  doc.text('Sincerely,', left, y + 10);
  doc.text(pdfSafeText(`${p.first} ${p.last}`), left, y + 25);
}

function renderSummaryReport(doc, p, findings, savings) {
  const rows = window.appGridRows || [];
  const totalBilled = rows.reduce((sum, r) => sum + (parseFloat(r.total) || 0), 0);
  const hardCount = findings.filter(f => (f.type || '').toLowerCase() === 'danger').length;
  const warningCount = findings.filter(f => (f.type || '').toLowerCase() === 'warning').length;

  doc.setFontSize(18);
  doc.setTextColor(34, 197, 94);
  doc.text('MediHelp Clinical Audit Summary Report', 20, 22);

  doc.setFontSize(10);
  doc.setTextColor(90);
  doc.text(`Generated: ${new Date().toLocaleString()}`, 20, 30);
  doc.text(`Patient: ${p.first} ${p.last}`, 20, 36);
  doc.text(`Facility: ${p.hospital}`, 20, 42);
  doc.text(`Account/Invoice: ${p.account}`, 20, 48);
  doc.line(20, 52, 190, 52);

  doc.setFontSize(11);
  doc.setTextColor(20);
  doc.text(`Lines Audited: ${rows.length}`, 20, 61);
  doc.text(`Total Billed: $${totalBilled.toFixed(2)}`, 70, 61);
  doc.text(`Potential Recovery: $${savings.toFixed(2)}`, 130, 61);
  doc.text(`High Risk Findings: ${hardCount}`, 20, 68);
  doc.text(`Documentation Warnings: ${warningCount}`, 80, 68);

  // Deduplicate before summary table
  const seenKey = new Set();
  const tableData = findings
    .filter(f => {
      const key = `${f.category}|${f.title}`;
      if (seenKey.has(key)) return false;
      seenKey.add(key);
      return true;
    })
    .map(f => [
      (f.type || '').toUpperCase() || 'INFO',
      f.category || 'general',
      f.title,
      (f.detail || '').substring(0, 130)
    ]);

  if (typeof doc.autoTable !== 'function') {
    console.error('MediHelp: autoTable plugin not loaded.');
    doc.text('Error: Table plugin not loaded.', 20, 80);
    return;
  }
  doc.autoTable({
    startY: 76,
    head: [['Severity', 'Category', 'Issue', 'Description']],
    body: tableData,
    theme: 'striped',
    headStyles: { fillColor: [34, 197, 94], textColor: 20 },
    styles: { fontSize: 9, cellPadding: 3 },
    columnStyles: {
      0: { cellWidth: 22 },
      1: { cellWidth: 28 },
      2: { cellWidth: 45 },
      3: { cellWidth: 85 }
    }
  });

  let finalY = doc.lastAutoTable.finalY + 14;
  if (finalY > 245) {
    doc.addPage();
    finalY = 20;
  }
  doc.setFontSize(14);
  doc.setFont('helvetica', 'bold');
  doc.setTextColor(0);
  doc.text(`Potential Recovery: $${savings.toFixed(2)} (deduplicated)`, 20, finalY);
  doc.setFontSize(9);
  doc.setFont('helvetica', 'normal');
  doc.setTextColor(90);
  const note = doc.splitTextToSize(
    'This report is an informational billing integrity analysis. Final liability depends on payer adjudication, provider documentation, contract terms, and corrected claim processing outcomes.',
    170
  );
  doc.text(note, 20, finalY + 8);
}

window.exportAuditCSV = function() {
  const rows = window.appGridRows || [];
  const lines = ['Date,Code,Modifier,ICD-10 Dx,Qty,Unit Price,Total Billed,Ins. Paid,Patient Owed,Adjustment,Description,Source,OCR Confidence'];
  rows.forEach(r => {
    const dxStr = Array.isArray(r.dx) ? r.dx.join(';') : (r.dx || '');
    lines.push([
      r.date  || '',
      r.code  || '',
      r.modifier || '',
      `"${dxStr.replace(/"/g, '""')}"`,
      r.qty   ?? '',
      r.price ?? '',
      r.total ?? '',
      r.paid  ?? '',
      r.owed  ?? '',
      r.adj   ?? '',
      `"${(String(r.desc || '')).replace(/"/g, '""')}"`,
      r.provenance || 'manual',
      r.extraction_confidence ?? ''
    ].join(','));
  });
  const blob = new Blob([lines.join('\n')], { type: 'text/csv' });
  const url  = URL.createObjectURL(blob);
  const a    = Object.assign(document.createElement('a'), { href: url, download: 'MediHelp_Audit.csv' });
  a.click();
  URL.revokeObjectURL(url);
};

document.addEventListener('DOMContentLoaded', () => {
    document.getElementById('btn-generate-final')?.addEventListener('click', generatePDF);
});