/**
 * MediHelp — audit.js (v2.7)
 * Handles: PDF interaction, OCR fallback, Manual Workspace, and Clinical Bucket Auditor.
 */

document.addEventListener('DOMContentLoaded', () => {
  setupPDFAudit();
  
  // Listen for Enter in the manual text area
  const lineInput = document.getElementById('line-items-text');
  if (lineInput) {
    lineInput.addEventListener('keydown', (e) => {
      if (e.key === 'Enter' && e.ctrlKey) runAuditLines();
    });
  }
});

// ── PDF Audit Logic ──────────────────────────────────────────────
function setupPDFAudit() {
  const zone = document.getElementById('pdf-drop-zone');
  const input = document.getElementById('pdf-input');
  if (!zone || !input) return;

  zone.onclick = () => input.click();
  zone.ondragover = (e) => { e.preventDefault(); zone.classList.add('dragover'); };
  zone.ondragleave = () => zone.classList.remove('dragover');
  zone.ondrop = (e) => {
    e.preventDefault();
    zone.classList.remove('dragover');
    if (e.dataTransfer.files.length) handlePDF(e.dataTransfer.files[0]);
  };
  input.onchange = (e) => {
    if (e.target.files.length) handlePDF(e.target.files[0]);
  };
}

async function handlePDF(file) {
  const status = document.getElementById('pdf-status');
  const overlay = document.getElementById('ai-loading-overlay');
  const results = document.getElementById('audit-results');
  const loadingText = document.getElementById('ai-loading-text');

  if (overlay) overlay.style.display = 'block';
  if (results) results.innerHTML = '';
  if (status) status.innerHTML = '';

  try {
    const arrayBuffer = await file.arrayBuffer();
    const pdf = await pdfjsLib.getDocument({ data: arrayBuffer }).promise;
    let pageData = [];
    let detectedNPIs = [];
    const npiRegex = /\b[1-9][0-9]{9}\b/g;

    for (let i = 1; i <= pdf.numPages; i++) {
      const page = await pdf.getPage(i);
      const textContent = await page.getTextContent();
      
      const items = textContent.items.map(item => {
        const npiMatches = item.str.match(npiRegex);
        if (npiMatches) detectedNPIs.push(...npiMatches);
        return {
          str: item.str,
          x: item.transform[4],
          y: item.transform[5],
          width: item.width,
          height: item.height
        };
      });
      pageData.push(items);
    }

    // Hybrid OCR Fallback (V2.7)
    const totalWords = pageData.flat().reduce((acc, item) => acc + item.str.split(/\s+/).length, 0);
    if (totalWords < 20) {
      if (loadingText) loadingText.textContent = 'PDF contains no text layer. Initializing OCR Fallback...';
      
      if (!window.Tesseract) {
        await new Promise((resolve) => {
          const script = document.createElement('script');
          script.src = 'https://cdn.jsdelivr.net/npm/tesseract.js@5/dist/tesseract.min.js';
          script.onload = resolve;
          document.head.appendChild(script);
        });
      }

      const canvas = document.createElement('canvas');
      const ctx = canvas.getContext('2d');
      pageData = [];

      for (let i = 1; i <= pdf.numPages; i++) {
        const page = await pdf.getPage(i);
        const viewport = page.getViewport({ scale: 2.0 });
        canvas.width = viewport.width; canvas.height = viewport.height;
        await page.render({ canvasContext: ctx, viewport }).promise;
        
        const { data: { blocks } } = await Tesseract.recognize(canvas, 'eng');
        const ocrItems = blocks.flatMap(b => b.paragraphs.flatMap(p => p.lines.flatMap(l => l.words.map(w => {
           const npiMatches = w.text.match(npiRegex);
           if (npiMatches) detectedNPIs.push(...npiMatches);
           return {
             str: w.text,
             x: w.bbox.x0 / 2, 
             y: (viewport.height - w.bbox.y0) / 2,
             width: (w.bbox.x1 - w.bbox.x0) / 2,
             height: (w.bbox.y1 - w.bbox.y0) / 2
           };
        }))));
        pageData.push(ocrItems);
      }
    }

    if (overlay) overlay.style.display = 'none';
    if (status) status.innerHTML = `✅ Analyzed ${pdf.numPages} page(s) from <strong>${file.name}</strong>`;

    const structuredRows = reconstructRowsFromLayout(pageData);
    runAudit(structuredRows, detectedNPIs);

  } catch (err) {
    if (overlay) overlay.style.display = 'none';
    if (status) status.innerHTML = `<span style="color:var(--danger); font-size:12px;">⚠️ Error: ${err.message}</span>`;
  }
}

// ── Interactive Audit Workspace ────────────────────────────────────────────
function runAudit(input, detectedNPIs = []) {
  const workspace = document.getElementById('audit-workspace-container');
  const results = document.getElementById('audit-results');
  if (!workspace || !results) return;

  const body = document.getElementById('workspace-body');
  body.innerHTML = '';
  results.innerHTML = '';

  let rows = Array.isArray(input) ? input : extractRowsFromText(input || '');

  workspace.style.display = 'block';
  
  if (rows.length === 0) {
    addWorkspaceRow();
    results.innerHTML = `<div class="audit-finding" style="text-align:center;"><p>No items found. Add them manually below.</p></div>`;
  } else {
    rows.forEach(r => addWorkspaceRow(r));
    workspace.dataset.npis = JSON.stringify(detectedNPIs);
    reRunWorkspaceAudit();
  }
}

// ── Layout Reconstruction Engine ──────────────────────────────
function reconstructRowsFromLayout(pages) {
  const allRows = [];
  pages.forEach(items => {
    const yGroups = {};
    items.forEach(item => {
      if (item.str.trim() === '') return;
      const y = Math.round(item.y / 10) * 10;
      if (!yGroups[y]) yGroups[y] = [];
      yGroups[y].push(item);
    });

    const sortedY = Object.keys(yGroups).sort((a, b) => b - a);
    sortedY.forEach(y => {
      const lineItems = yGroups[y].sort((a, b) => a.x - b.x);
      const lineText = lineItems.map(i => i.str).join(' ');
      const extracted = extractRowsFromRawLine(lineText);
      if (extracted) allRows.push(extracted);
    });
  });
  return filterNormalRows(allRows);
}

function filterNormalRows(rows) {
  const testKeywords = ["TEST", "FAKE", "SAMPLE", "VOID"];
  return rows.filter(r => {
    const desc = (r.desc || "").toUpperCase();
    const isTest = testKeywords.some(key => desc.includes(key));
    if (isTest) return false;
    if (r.code === "" && r.total === 0) return false;
    return true;
  });
}

function extractRowsFromRawLine(line) {
  const dateRegex = /\b(\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4})\b/g;
  const codeRegex = /\b(?!00000|90210|10001)([1-9][0-9]{4})\b/g;
  const moneyRegex = /(?:^|\s|\$)\s?(\d{1,7}(?:,\d{3})*(?:\.\d{2})?)(?=\s|$)/g;

  const dates = line.match(dateRegex);
  const codes = line.match(codeRegex);
  const moneyMatches = [...line.matchAll(moneyRegex)];
  
  if (dates || codes || moneyMatches.length > 0) {
    const amounts = moneyMatches.map(m => parseFloat(m[1].replace(/,/g, '')));
    const { price, qty, total, paid, owed } = parseAmounts(amounts);

    let desc = line.replace(dateRegex, '').replace(codeRegex, '').replace(moneyRegex, '').replace(/[|:,\-]/g, ' ').replace(/\s+/g, ' ').trim();
    if (desc.length > 60) desc = desc.substring(0, 57) + '...';

    return { date: dates ? dates[0] : '', code: codes ? codes[0] : '', desc: desc || 'Medical Service', qty: qty || 1, price: price || (total / (qty || 1)), total, paid, owed };
  }
  return null;
}

function extractRowsFromText(text) {
  const lines = text.split('\n').filter(l => l.trim().length > 3);
  return lines.map(l => extractRowsFromRawLine(l)).filter(Boolean);
}

function addWorkspaceRow(data = {}) {
  const body = document.getElementById('workspace-body');
  if (!body) return;
  const row = document.createElement('tr');
  
  row.innerHTML = `
    <td contenteditable="true" oninput="debouncedAudit()">${data.date || ''}</td>
    <td contenteditable="true" oninput="debouncedAudit()" style="font-family:monospace;font-weight:bold;">${data.code || ''}</td>
    <td contenteditable="true" oninput="debouncedAudit()">${data.desc || ''}</td>
    <td contenteditable="true" oninput="debouncedAudit()" style="text-align:center;">${data.qty || 1}</td>
    <td contenteditable="true" oninput="debouncedAudit()" style="text-align:right;">${(data.price || 0).toFixed(2)}</td>
    <td contenteditable="true" oninput="debouncedAudit()" style="text-align:right;font-weight:bold;">${(data.total || 0).toFixed(2)}</td>
    <td contenteditable="true" oninput="debouncedAudit()" style="text-align:right;color:#22c55e;">${(data.paid || 0).toFixed(2)}</td>
    <td contenteditable="true" oninput="debouncedAudit()" style="text-align:right;color:#ef4444;">${(data.owed || 0).toFixed(2)}</td>
    <td style="text-align:center;"><button onclick="this.parentElement.parentElement.remove(); debouncedAudit();" style="background:none; border:none; color:var(--danger); cursor:pointer;">✕</button></td>
  `;
  body.appendChild(row);
}

const debouncedAudit = window.debounce(() => reRunWorkspaceAudit(), 250);
window.debouncedAudit = debouncedAudit;

async function reRunWorkspaceAudit() {
  const trs = document.querySelectorAll('#workspace-body tr');
  const results = document.getElementById('audit-results');
  if (!results) return;

  const rows = Array.from(trs).map(tr => {
    const tds = tr.querySelectorAll('td');
    return {
      date: tds[0].innerText.trim(),
      code: tds[1].innerText.trim(),
      desc: tds[2].innerText.trim(),
      qty: parseFloat(tds[3].innerText) || 1,
      price: parseFloat(tds[4].innerText) || 0,
      total: parseFloat(tds[5].innerText) || 0,
      paid: parseFloat(tds[6].innerText) || 0,
      owed: parseFloat(tds[7].innerText) || 0,
      raw: tr
    };
  });

  const multiplier = parseFloat(document.getElementById('payer-type')?.value) || 1.5;
  const npiData = document.getElementById('audit-workspace-container')?.dataset.npis;
  const npis = npiData ? JSON.parse(npiData) : [];
  
  const engine = new BucketAuditor(rows, multiplier, npis);
  engine.runArithmetic();
  engine.runDuplicates();
  engine.runConsistency();
  engine.runSemantic();
  engine.runCompleteness();
  
  await engine.runDatabaseCheck();
  renderCategorizedFindings(engine.findings, results, rows.length, rows, engine.potentialSavings, engine.totalBenchmark);
}

class BucketAuditor {
  constructor(rows, multiplier = 1.5, npis = []) {
    this.rows = rows;
    this.multiplier = multiplier;
    this.npis = npis;
    this.findings = [];
    this.potentialSavings = 0;
    this.totalBenchmark = 0;
  }

  addFinding(category, title, detail, type = 'warn') {
    this.findings.push({ category, title, detail, type });
  }

  runArithmetic() {
    this.rows.forEach(r => {
      r.raw.classList.remove('audit-row-error', 'audit-row-warn');
      const expected = Math.round(r.qty * r.price * 100) / 100;
      if (r.total > 0 && Math.abs(expected - r.total) > 0.1 && r.price > 0) {
        this.addFinding('arithmetic_error', 'Math Mismatch', `Line ${r.code || r.desc}: Expected $${expected.toFixed(2)}, billed $${r.total.toFixed(2)}.`, 'danger');
        r.raw.classList.add('audit-row-error');
        if (r.total > expected) this.potentialSavings += (r.total - expected);
      }
    });
  }

  runDuplicates() {
    const registry = {};
    this.rows.forEach(r => {
      if (!r.code || /total/i.test(r.desc)) return;
      const key = `${r.date}|${r.code}|${r.total}`;
      if (!registry[key]) registry[key] = [];
      registry[key].push(r);
    });

    Object.values(registry).forEach(matches => {
      if (matches.length > 1) {
        this.addFinding('duplicate_charge', 'Possible Duplicate', `Charge for ${matches[0].code} appears ${matches.length}x.`, 'danger');
        matches.forEach(m => m.raw.classList.add('audit-row-error'));
        for (let i = 1; i < matches.length; i++) this.potentialSavings += matches[i].total;
      }
    });
  }

  runConsistency() { /* No-op in v2.7 lite */ }
  runSemantic() { /* No-op in v2.7 lite */ }
  runCompleteness() {
     this.rows.forEach(r => {
       if (r.total > 100 && !r.code && !/total/i.test(r.desc)) {
         this.addFinding('missing_data', 'Missing Code', `Charge of $${r.total} has no specific code.`, 'warn');
       }
     });
  }

  async runDatabaseCheck() {
    if (!window.dbClient) return;
    const codes = [...new Set(this.rows.map(r => r.code).filter(c => !!c))];
    if (codes.length === 0) return;

    try {
      const res = await fetch('https://bisqgousuvljttesjkkm.supabase.co/functions/v1/lookup_codes', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ codes, npis: this.npis })
      });
      if (!res.ok) return;
      const { fees: feeMap } = await res.json();
      
      this.rows.forEach(r => {
        const info = feeMap[r.code];
        if (info) {
          const benchmark = info.price * r.qty;
          const capped = benchmark * this.multiplier;
          if (r.total > capped) {
            this.addFinding('pricing_audit', 'High Variance', `${r.code} billed $${r.total} vs Benchmark $${capped.toFixed(2)}.`, 'warn');
            r.raw.classList.add('audit-row-warn');
            this.potentialSavings += Math.max(0, r.total - capped);
          }
        }
      });
    } catch (e) {}
  }
}

// ── Shared Helper: Amount Parser ───────────────────────────
function parseAmounts(amounts) {
  let price = 0, qty = 1, total = 0, paid = 0, owed = 0;
  if (amounts.length === 1) { total = amounts[0]; }
  else if (amounts.length === 2) {
    if (amounts[0] > amounts[1] * 3) { total = amounts[0]; owed = amounts[1]; }
    else { price = amounts[0]; total = amounts[1]; }
  } else if (amounts.length >= 3) {
    if (Math.abs(amounts[0] * amounts[1] - amounts[2]) < 2) { price = amounts[0]; qty = amounts[1]; total = amounts[2]; }
    else { total = amounts[0]; paid = amounts[1]; owed = amounts[2]; }
  }
  return { price, qty, total, paid, owed };
}

// Global hooks for HTML events
window.runAuditLines = () => {
  const text = document.getElementById('line-items-text')?.value;
  if (text) runAudit(text);
};
window.clearAudit = () => {
  const area = document.getElementById('line-items-text');
  const res = document.getElementById('audit-results');
  if (area) area.value = '';
  if (res) res.innerHTML = '';
};
window.openPatientModal = () => document.getElementById('patient-modal').style.display = 'flex';
window.closePatientModal = () => document.getElementById('patient-modal').style.display = 'none';

function renderCategorizedFindings(findings, container, count, rows, savings, benchmark) {
  container.className = 'audit-results visible';
  let html = `
    <div class="savings-summary-card" style="background:var(--accent-glow);border:1px solid var(--border-accent);padding:24px;border-radius:12px;text-align:center;margin-bottom:24px;">
      <div style="font-size:32px;font-weight:800;color:var(--text-h);">$${savings.toFixed(2)}</div>
      <div style="font-size:14px;color:var(--text-muted);">Potential Savings Detected</div>
    </div>
    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:12px;">
      <div class="audit-status-badge"><div class="dot"></div>AI Engine Active</div>
      <div style="font-size:11px;font-weight:700;color:var(--text-muted);">${findings.length} Anomalies found</div>
    </div>
  `;
  
  if (findings.length === 0) {
    html += `<div class="audit-finding" style="border-left:3px solid var(--success);">✅ All items within expected ranges.</div>`;
  } else {
    findings.forEach(f => {
      const type = f.type === 'danger' ? 'danger' : 'warn';
      html += `
        <div class="audit-finding" style="border-left:3px solid var(--${type});">
          <div class="finding-icon ${type}">●</div>
          <div><strong>${f.title}</strong><p>${f.detail}</p></div>
        </div>`;
    });
  }
  container.innerHTML = html;
}
