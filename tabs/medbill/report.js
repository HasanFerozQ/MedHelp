// ── Stage 4: V8.0 Interactive Grid Reporting Synthesis ──

window.currentEngineFindings = [];
window.currentEngineSavings  = 0;

function renderResultCardsPerLineItem(rows, findings, container) {
  let html = '';
  
  rows.forEach((r, idx) => {
    // Exact or loose match based on line item code
    // Since some findings don't have codeRef, we might use rowIdx if BucketAuditor ever provided it.
    // For V8, codeRef is our strongest link.
    const relatedFindings = findings.filter(f => f.codeRef === r.code || (f.index === idx));
    
    // Determine overall color: danger > warn > success
    let color = 'var(--text-muted)';
    let border = 'var(--border)';
    let bg = 'rgba(255,255,255,0.02)';
    let statusText = 'No issues found';
    
    if (relatedFindings.some(f => f.type === 'danger' || ['arithmetic', 'duplicate'].includes(f.category))) {
       color = '#ef4444'; border = '#ef4444'; bg = 'rgba(239, 68, 68, 0.05)'; statusText = 'Critical Errors Detected';
    } else if (relatedFindings.length > 0) {
       color = '#eab308'; border = '#eab308'; bg = 'rgba(234, 179, 8, 0.05)'; statusText = 'Warnings Identified';
    } else {
       color = '#22c55e'; border = '#22c55e'; bg = 'rgba(34, 197, 94, 0.05)'; statusText = 'Clean Charge';
    }

    const s = (v) => window.sanitizeText(String(v || ''));

    html += `
      <div style="border-left: 4px solid ${border}; background: ${bg}; border-radius: 8px; padding: 14px 16px; display:flex; flex-direction:column; gap:8px;">
        <div style="display:flex; justify-content:space-between; align-items:center;">
          <div style="font-weight:800; color:var(--text-h); font-size:14px; font-family:monospace;">
            ${s(r.code) || 'Uncoded'}
            ${r.modifier ? `<span style="color:var(--accent); margin-left:4px;">-${s(r.modifier)}</span>` : ''}
            <span style="font-family:sans-serif; font-size:12px; font-weight:500; color:var(--text-muted); margin-left:12px;">
              Qty: ${r.qty} | Billed: $${parseFloat(r.total).toFixed(2)}
            </span>
          </div>
          <div style="font-size:10px; font-weight:800; color:${color}; text-transform:uppercase; letter-spacing:0.5px; border:1px solid ${border}44; padding:2px 8px; border-radius:12px;">${statusText}</div>
        </div>
        
        <div style="display:flex; flex-direction:column; gap:6px; margin-top:4px;">
          ${relatedFindings.length === 0 ? `<div style="font-size:12px; color:var(--text-muted); display:flex; align-items:center; gap:6px;">✅ <span>Charge is within standard limits and obeys NCCI bundling logic.</span></div>` : ''}
          ${relatedFindings.map(f => `
            <div style="font-size:12px; color:var(--text-h); display:flex; gap:8px; line-height:1.5;">
              <span style="flex-shrink:0;">${f.type === 'danger' ? '🚨' : '⚠️'}</span>
              <div>
                <strong>${s(f.title)}</strong>: <span style="color:var(--text-muted);">${s(f.detail)}</span>
              </div>
            </div>
          `).join('')}
        </div>
      </div>
    `;
  });
  
  container.innerHTML = html;
}

window.renderResultCardsPerLineItem = renderResultCardsPerLineItem;

function renderFinalSummary(savings, benchmark, container) {
  let html = `
    <!-- Savings Summary -->
    <div style="background:linear-gradient(135deg,rgba(34,197,94,.12),rgba(34,197,94,.04));border:1px solid rgba(34,197,94,.3);border-radius:12px;padding:24px;text-align:center;margin-top:20px;">
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
  const trs   = document.querySelectorAll('#grid-body tr');
  const lines = ['Date,Code,Modifier,ICD-10,Qty,Total Billed'];
  trs.forEach(tr => {
    const inputs = tr.querySelectorAll('input');
    if (inputs.length >= 6) {
      lines.push([
        inputs[0].value, inputs[1].value, inputs[2].value,
        `\"${inputs[3].value.replace(/\"/g,'\"\"')}\"`,
        inputs[4].value, inputs[5].value
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