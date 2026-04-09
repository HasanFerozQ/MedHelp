// ── Stage 4: Presentation / Report Synthesis (v6.0) ──

window.currentEngineFindings = [];
window.currentEngineSavings  = 0;

function renderCategorizedFindings(findings, container, count, rows, savings, benchmark, confidence, suspect_rows = []) {
  container.className = 'audit-results visible';

  const confColor   = confidence.score >= 75 ? '#22c55e' : confidence.score >= 50 ? '#eab308' : '#ef4444';
  const confLabel   = confidence.score >= 75 ? 'High Confidence' : confidence.score >= 50 ? 'Moderate Confidence' : 'Low Confidence';
  const dangerCount = findings.filter(f => f.type === 'danger').length;
  const warnCount   = findings.filter(f => f.type === 'warn').length;

  // ── Deduplicate findings: group by category + codeRef before rendering ──
  // This prevents the same CPT code producing multiple identical-looking cards
  const deduped = [];
  const seenKey = new Set();
  findings.forEach(f => {
    const key = `${f.category}|${f.title}|${f.codeRef || ''}`;
    if (!seenKey.has(key)) {
      seenKey.add(key);
      deduped.push({ ...f, _count: 1 });
    } else {
      const existing = deduped.find(d => `${d.category}|${d.title}|${d.codeRef || ''}` === key);
      if (existing) existing._count = (existing._count || 1) + 1;
    }
  });

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
          <div style="font-size:11px;font-weight:700;text-transform:uppercase;color:var(--text-muted);margin-bottom:6px;">Document Fingerprint</div>
          <div style="display:inline-block;padding:4px 10px;background:var(--bg-secondary);border:1px solid var(--border);border-radius:6px;font-size:12px;color:var(--text-main);font-weight:700;margin-bottom:12px;">
            🆔 ${window.sanitizeText(window.currentDocumentProfile?.label || 'Generic Medical Document')}
          </div>
          <div style="font-size:11px;font-weight:700;text-transform:uppercase;color:var(--text-muted);margin-bottom:6px;">Why this score?</div>
          ${confidence.reasons.map(r => `<div style="font-size:12px;color:var(--text-muted);margin-bottom:3px;">• ${r}</div>`).join('')}
        </div>
      </div>
    </div>

    <!-- Savings Summary -->
    <div style="background:linear-gradient(135deg,rgba(34,197,94,.12),rgba(34,197,94,.04));border:1px solid rgba(34,197,94,.3);border-radius:12px;padding:20px;text-align:center;margin-bottom:16px;">
      <div style="font-size:32px;font-weight:800;color:var(--text-h);">$${savings.toFixed(2)}</div>
      <div style="font-size:13px;color:var(--text-muted);margin-top:4px;">Potential Savings Detected <span style="font-size:11px;opacity:.7;">(deduplicated, per-row capped)</span></div>
      ${benchmark > 0 ? `<div style="font-size:11px;color:var(--text-muted);margin-top:4px;">Medicare benchmark total: $${benchmark.toFixed(2)}</div>` : ''}
    </div>

    <!-- Summary Badges -->
    <div style="display:flex;gap:8px;flex-wrap:wrap;margin-bottom:16px;">
      <div style="background:rgba(239,68,68,.12);border:1px solid rgba(239,68,68,.3);color:#ef4444;border-radius:20px;padding:4px 14px;font-size:12px;font-weight:700;">${dangerCount} Critical</div>
      <div style="background:rgba(234,179,8,.12);border:1px solid rgba(234,179,8,.3);color:#eab308;border-radius:20px;padding:4px 14px;font-size:12px;font-weight:700;">${warnCount} Warnings</div>
      <div style="background:rgba(148,163,184,.1);border:1px solid var(--border);color:var(--text-muted);border-radius:20px;padding:4px 14px;font-size:12px;">${count} Line Items Analyzed</div>
      ${suspect_rows.length > 0 ? `<div style="background:rgba(100,116,139,.1);border:1px solid var(--border);color:#64748b;border-radius:20px;padding:4px 14px;font-size:12px;">${suspect_rows.length} Quarantined</div>` : ''}
    </div>
  `;

  if (deduped.length === 0) {
    html += `<div class="audit-finding" style="border-left:3px solid var(--success);padding:16px;border-radius:0 8px 8px 0;">
      ✅ <strong>Clean Bill</strong> — All items within expected ranges. No anomalies detected.
    </div>`;
  } else {
    // ── STAGE 4: RANKING LAYER ──
    const rankedGroups = {
      critical:      { label: 'CRITICAL BILLING ERRORS',       color: '#ef4444', items: [] },
      overcharge:    { label: 'LIKELY OVERCHARGES',            color: '#f97316', items: [] },
      documentation: { label: 'DOCUMENTATION ISSUES',          color: '#3b82f6', items: [] },
      observation:   { label: 'LOW-CONFIDENCE OBSERVATIONS',   color: '#64748b', items: [] }
    };

    deduped.forEach(f => {
      if (f.type === 'danger' || ['arithmetic', 'duplicate', 'financial'].includes(f.category)) {
        rankedGroups.critical.items.push(f);
      } else if (f.category === 'benchmark' || f.category === 'consistency') {
        rankedGroups.overcharge.items.push(f);
      } else if (['completeness', 'modifier', 'POS'].includes(f.category)) {
        rankedGroups.documentation.items.push(f);
      } else {
        rankedGroups.observation.items.push(f);
      }
    });

    Object.values(rankedGroups).forEach(group => {
      if (group.items.length === 0) return;
      html += `
        <div style="margin-bottom:24px;">
          <div style="font-size:11px;font-weight:800;text-transform:uppercase;color:${group.color};letter-spacing:.1em;margin-bottom:12px;border-bottom:1px solid ${group.color}33;padding-bottom:4px;">${group.label}</div>
          ${group.items.map(f => {
            const borderColor = group.color;
            const bgColor     = group.color + '0a';
            const icon        = f.type === 'danger' ? '🚨' : '⚠️';
            const s           = (v) => window.sanitizeText(String(v || ''));
            const countBadge  = f._count > 1 ? `<span style="background:#64748b22;color:var(--text-muted);border-radius:10px;padding:1px 8px;font-size:10px;font-weight:700;margin-left:6px;">×${f._count}</span>` : '';
            return `
              <div class="audit-finding" style="border-left:4px solid ${borderColor};background:${bgColor};border-radius:0 8px 8px 0;padding:14px 16px;margin-bottom:10px;">
                <div style="display:flex;align-items:flex-start;gap:12px;">
                  <span style="font-size:16px;flex-shrink:0;">${icon}</span>
                  <div style="width:100%;">
                    <div style="font-weight:700;font-size:13px;margin-bottom:4px;color:var(--text-h);display:flex;align-items:center;flex-wrap:wrap;gap:4px;">
                      ${s(f.title)}${countBadge}${f.codeRef ? `<code style="background:var(--border);padding:1px 6px;border-radius:4px;font-size:10px;margin-left:8px;">${s(f.codeRef)}</code>` : ''}
                    </div>
                    <div style="font-size:12px;color:var(--text-muted);line-height:1.6;">${s(f.detail)}</div>
                  </div>
                </div>
              </div>`;
          }).join('')}
        </div>`;
    });
  }

  // Quarantine Disclosure
  if (suspect_rows.length > 0) {
    html += `
      <div style="margin-top:24px;background:rgba(100,116,139,0.05);border:1px dashed var(--border);border-radius:8px;padding:16px;">
        <div style="font-size:11px;font-weight:700;color:var(--text-muted);text-transform:uppercase;margin-bottom:8px;">🛡️ Quarantine Lane — ${suspect_rows.length} Items Parked</div>
        <p style="font-size:11px;color:var(--text-muted);margin-bottom:12px;">The following fragments were extracted but failed confidence anchors. They were excluded from the clinical audit to prevent false positives.</p>
        <div style="display:flex;flex-direction:column;gap:6px;">
          ${suspect_rows.map(s => `
            <div style="font-size:10px;padding:6px 10px;background:var(--bg-card);border-radius:4px;color:var(--text-muted);border:1px solid var(--border);">
              <b>${s.desc || 'Unknown Fragment'}</b>: ${s.quarantine_reason}
            </div>
          `).join('')}
        </div>
      </div>`;
  }

  // Export buttons
  html += `
    <div style="margin-top:20px;display:flex;gap:12px;flex-wrap:wrap;border-top:1px solid var(--border);padding-top:20px;">
      <button onclick="exportAuditCSV()" class="btn btn-ghost" style="font-size:12px;flex:1;min-width:120px;letter-spacing:0.02em;">Export CSV</button>
      <button onclick="handleAuditExport('summary')" class="btn btn-secondary" style="font-size:12px;flex:1;min-width:160px;background:var(--bg-card);color:var(--text-main);border:1px solid var(--border);font-weight:600;letter-spacing:0.02em;">Download Summary Report</button>
      <button onclick="handleAuditExport('dispute')" class="btn btn-primary" style="font-size:12px;flex:2;min-width:240px;font-weight:700;letter-spacing:0.03em;box-shadow:0 4px 12px rgba(0,0,0,0.1);">Generate Dispute Letter</button>
    </div>`;

  container.innerHTML = html;
}

window.renderCategorizedFindings = renderCategorizedFindings;

function clearAudit() {
  const pasteArea = document.getElementById('bill-text');
  const lineArea  = document.getElementById('line-items-text');
  const res       = document.getElementById('audit-results');
  if (pasteArea) pasteArea.value = '';
  if (lineArea)  lineArea.value  = '';
  if (res)       res.innerHTML   = '';
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
  const type  = forcedType || (modal ? modal.dataset.reportType : 'summary');

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

function renderDisputeLetter(doc, p, findings, savings) {
  doc.setFontSize(10);
  doc.text(new Date().toLocaleDateString(), 20, 20);
  doc.setFont('helvetica', 'bold');
  doc.text('TO: Billing Department / Claims Administrator', 20, 35);
  doc.text(`${p.hospital}`, 20, 40);

  doc.setFontSize(12);
  doc.text('RE: FORMAL BILLING DISPUTE & REQUEST FOR RECONSIDERATION', 20, 55);
  doc.setFontSize(10);
  doc.setFont('helvetica', 'normal');
  doc.text(`Patient Name: ${p.first} ${p.last}`, 20, 65);
  doc.text(`Account/Invoice: ${p.account} | Insurance ID: ${p.ins}`, 20, 70);
  doc.text(`Statement Date: ${p.date}`, 20, 75);

  let y = 90;
  const body = `I am writing to formally dispute the charges on the above-referenced invoice. I have identified several billing irregularities, referenced against specific CMS Medicare Claims Processing Manual chapters, that require immediate correction. Pursuant to 45 CFR §164.524, I request an itemized statement and all supporting documentation within 30 days.`;
  const splitBody = doc.splitTextToSize(body, 170);
  doc.text(splitBody, 20, y);
  y += (splitBody.length * 6) + 10;

  doc.setFont('helvetica', 'bold');
  doc.text('SPECIFIC REASONS FOR DISPUTE (CMS-REFERENCED):', 20, y);
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
    doc.text(`${(meta.label || cat).toUpperCase()}`, 20, y);
    y += 5;

    if (CITATION_MAP[cat]) {
      doc.setFont('helvetica', 'italic');
      doc.setFontSize(8.5);
      doc.setTextColor(80);
      const splitCite = doc.splitTextToSize(`📋 CMS Reference: ${CITATION_MAP[cat]}`, 160);
      doc.text(splitCite, 25, y);
      y += (splitCite.length * 4) + 4;
      doc.setTextColor(0);
    }

    doc.setFont('helvetica', 'normal');
    doc.setFontSize(10);
    items.forEach(f => {
      if (y > 270) { doc.addPage(); y = 20; }
      const line = `• ${f.title}: ${f.detail}`;
      const splitLine = doc.splitTextToSize(line, 165);
      doc.text(splitLine, 25, y);
      y += (splitLine.length * 5) + 3;
    });
    y += 6;
  });

  // Potential savings callout
  if (savings > 0) {
    if (y > 240) { doc.addPage(); y = 20; }
    doc.setFont('helvetica', 'bold');
    doc.setFontSize(11);
    doc.text(`ESTIMATED OVERCHARGE (POTENTIAL RECOVERY): $${savings.toFixed(2)}`, 20, y);
    y += 8;
    doc.setFont('helvetica', 'normal');
    doc.setFontSize(9);
    const savNote = doc.splitTextToSize('This figure is based on deduplicated, per-line-item savings calculations capped to each line\'s billed total. It represents a conservative estimate using CMS Medicare benchmark pricing where available.', 170);
    doc.text(savNote, 20, y);
    y += (savNote.length * 4) + 10;
  }

  y += 10;
  if (y > 260) { doc.addPage(); y = 20; }
  doc.setFont('helvetica', 'normal');
  doc.setFontSize(10);
  doc.text('I request a written response within 30 days identifying which errors will be corrected and the revised balance owed. Failure to respond may result in a complaint filed with your state insurance commissioner and/or the CMS Medicare Ombudsman.', 20, y);
  y += 20;
  doc.text('Sincerely,', 20, y + 20);
  doc.text(`${p.first} ${p.last}`, 20, y + 35);
}

function renderSummaryReport(doc, p, findings, savings) {
  doc.setFontSize(18);
  doc.setTextColor(34, 197, 94);
  doc.text('MediHelp Clinical Audit Summary', 20, 25);

  doc.setFontSize(10);
  doc.setTextColor(100);
  doc.text(`Patient: ${p.first} ${p.last} | Facility: ${p.hospital}`, 20, 35);
  doc.line(20, 40, 190, 40);

  // Deduplicate before summary table
  const seenKey = new Set();
  const tableData = findings
    .filter(f => {
      const key = `${f.category}|${f.title}`;
      if (seenKey.has(key)) return false;
      seenKey.add(key);
      return true;
    })
    .map(f => [f.category, f.title, f.detail.substring(0, 120)]);

  if (typeof doc.autoTable !== 'function') {
    console.error('MediHelp: autoTable plugin not loaded.');
    doc.text('Error: Table plugin not loaded.', 20, 55);
    return;
  }
  doc.autoTable({
    startY: 55,
    head: [['Category', 'Issue', 'Description']],
    body: tableData,
    theme: 'striped',
    headStyles: { fillColor: [34, 197, 94] }
  });

  const finalY = doc.lastAutoTable.finalY + 20;
  doc.setFontSize(14);
  doc.setFont('helvetica', 'bold');
  doc.setTextColor(0);
  doc.text(`Potential Recovery: $${savings.toFixed(2)} (deduplicated)`, 20, finalY);
}

window.exportAuditCSV = function() {
  const trs   = document.querySelectorAll('#workspace-body tr');
  const lines = ['Date,Code,Modifier,Description,Qty,Unit Price,Total Billed,Ins Paid,Pt Owed'];
  trs.forEach(tr => {
    const tds = tr.querySelectorAll('td');
    if (tds.length >= 9) {
      lines.push([
        tds[0].innerText, tds[1].innerText, tds[2].innerText,
        `\"${tds[3].innerText.replace(/\"/g,'\"\"')}\"`,
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

document.getElementById('btn-generate-final')?.addEventListener('click', generatePDF);