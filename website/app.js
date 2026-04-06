/**
 * MediHelp — app.js (v2.3 - Deep Local Auditor)
 * Handles: Tab switching, Region toggle, Code Search, Denial Search,
 * Rx Search Insights, NPI Provider Search (CORS Fallback), 
 * and Local PDF Bill Audit (via pdf.js) with Deep Workspace Logic.
 */

const SUPA_URL  = 'https://bisqgousuvljttesjkkm.supabase.co';
const SUPA_KEY  = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdWxnanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4';

let db = null;
let activeRegion = 'US';

// Common Rx Insights
const RX_INSIGHTS = {
  'metformin': { generic: 'Glucophage', class: 'Antidiabetic', cost: '$4 - $12', stock: 'In Stock', price_hint: 'Verified Market Avg', tip: 'Often free at grocery store pharmacies like Publix or Meijer.' },
  'lisinopril': { generic: 'Zestril / Prinivil', class: 'ACE Inhibitor', cost: '$0 - $10', stock: 'In Stock', price_hint: 'Verified $0 Copay', tip: 'Frequently included in free $0 prescription programs.' },
  'atorvastatin': { generic: 'Lipitor', class: 'Statin', cost: '$9 - $25', stock: 'High Supply', price_hint: 'Verified Low-Cost', tip: 'Generic is highly effective; check Mark Cuban\'s Cost Plus Drugs.' },
  'amlodipine': { generic: 'Norvasc', class: 'Calcium Channel Blocker', cost: '$5 - $15', stock: 'In Stock', price_hint: 'Verified Generic Price', tip: 'Low-cost generic widely available.' },
  'albuterol': { generic: 'ProAir / Ventolin', class: 'Bronchodilator', cost: '$25 - $60', stock: 'Limited Supply', price_hint: 'Manufacturer Direct', tip: 'Manufacturer coupons can often reduce this by 50%.' }
};

document.addEventListener('DOMContentLoaded', () => {
  if (window.supabase) {
    db = window.supabase.createClient(SUPA_URL, SUPA_KEY);
  }

  bindSearch('codes-input', 'codes-results', searchCodes);
  bindSearch('denials-input', 'denials-results', searchDenials);

  const rxInput = document.getElementById('rx-input');
  if (rxInput) {
    rxInput.addEventListener('input', debounce(async () => {
      const q = rxInput.value.trim().toLowerCase();
      if (q.length < 3) return;
      const match = Object.entries(RX_INSIGHTS).find(([k]) => q.includes(k) || k.includes(q));
      renderRxResults(q, match);
    }, 300));
  }

  setupPDFAudit();
});

// ── PDF Audit Logic ──────────────────────────────────────────────
function setupPDFAudit() {
  const zone = document.getElementById('pdf-drop-zone');
  const input = document.getElementById('pdf-input');
  if (!zone || !input) return;

  zone.onclick = () => input.click();
  zone.ondrop = (e) => {
    e.preventDefault();
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
  
  if (overlay) overlay.style.display = 'block';
  if (results) results.innerHTML = '';

  try {
    const formData = new FormData();
    formData.append('bill', file);

    const response = await fetch('/api/audit-bill', { method: 'POST', body: formData });
    
    if (overlay) overlay.style.display = 'none';

    if (response.ok) {
      const data = await response.json();
      renderAuditJSON(data.result);
      if (status) status.innerHTML = `✅ AI Analysis Complete for ${file.name}`;
    } else {
      // Offline Fallback
      if (status) status.innerHTML = `ℹ️ AI Offline. Running Deep Local Auditor...`;
      const arrayBuffer = await file.arrayBuffer();
      const pdf = await pdfjsLib.getDocument({ data: arrayBuffer }).promise;
      let fullText = '';
      for (let i = 1; i <= pdf.numPages; i++) {
        const page = await pdf.getPage(i);
        const textContent = await page.getTextContent();
        fullText += textContent.items.map(s => s.str).join(' ') + '\n';
      }
      runAudit(fullText);
    }
  } catch (err) {
    if (overlay) overlay.style.display = 'none';
    console.error(err);
  }
}

// ── Interactive Audit Workspace (V2.3) ────────────────────────────────────
function runAudit(text) {
  const workspace = document.getElementById('audit-workspace-container');
  const results = document.getElementById('audit-results');
  if (!workspace || !results) return;

  const body = document.getElementById('workspace-body');
  body.innerHTML = '';
  results.innerHTML = '';

  const rows = extractRowsFromText(text || '');
  workspace.style.display = 'block';
  
  if (rows.length === 0) {
    addWorkspaceRow();
    results.innerHTML = `<div class="audit-finding" style="text-align:center;"><p>No structured patterns found. Use the editor below to add line items.</p></div>`;
  } else {
    rows.forEach(r => addWorkspaceRow(r));
    reRunWorkspaceAudit();
  }
}

function extractRowsFromText(text) {
  const lines = text.split('\n').filter(l => l.trim().length > 5);
  const rows = [];
  const dateRegex = /\b(\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4})\b/;
  const codeRegex = /\b(\d{5}|[A-Z]\d{4})\b/;
  const moneyRegex = /\$?\d{1,7}\.\d{2}/g;

  lines.forEach(line => {
    const dates = line.match(dateRegex);
    const codes = line.match(codeRegex);
    const money = line.match(moneyRegex) || [];
    
    if (dates || codes || money.length > 0) {
      const amounts = money.map(m => parseFloat(m.replace(/[^0-9.]/g, '')));
      let price = 0, qty = 1, total = 0, paid = 0, owed = 0;
      
      // Smart Inference for EOBs (V2.3)
      if (amounts.length === 1) {
        total = amounts[0];
      } else if (amounts.length === 2) {
        price = amounts[0]; total = amounts[1];
      } else if (amounts.length === 3) {
        // [Qty, Price, Total] or [Total, Paid, Owed]
        if (amounts[0] < 10) { qty = amounts[0]; price = amounts[1]; total = amounts[2]; }
        else { total = amounts[0]; paid = amounts[1]; owed = amounts[2]; }
      } else if (amounts.length >= 4) {
        // High density (EOB style): Billed, Allowed, Paid, Owed
        total = amounts[0];
        paid = amounts[amounts.length - 2];
        owed = amounts[amounts.length - 1];
      }

      rows.push({
        date: dates ? dates[0] : '',
        code: codes ? codes[0] : '',
        desc: line.substring(0, 50).replace(dateRegex, '').replace(codeRegex, '').replace(moneyRegex, '').trim(),
        qty: qty,
        price: price || (total / qty),
        total: total,
        paid: paid,
        owed: owed
      });
    }
  });
  return rows;
}

function addWorkspaceRow(data = {}) {
  const body = document.getElementById('workspace-body');
  if (!body) return;
  const row = document.createElement('tr');
  row.innerHTML = `
    <td contenteditable="true" style="padding: 10px; border-bottom: 1px solid var(--border);">${data.date || ''}</td>
    <td contenteditable="true" style="padding: 10px; border-bottom: 1px solid var(--border); font-family: monospace; font-weight: bold;">${data.code || ''}</td>
    <td contenteditable="true" style="padding: 10px; border-bottom: 1px solid var(--border);">${data.desc || ''}</td>
    <td contenteditable="true" style="padding: 10px; border-bottom: 1px solid var(--border); text-align: center;">${data.qty || 1}</td>
    <td contenteditable="true" style="padding: 10px; border-bottom: 1px solid var(--border); text-align: right;">${data.price ? data.price.toFixed(2) : '0.00'}</td>
    <td contenteditable="true" style="padding: 10px; border-bottom: 1px solid var(--border); text-align: right; font-weight: bold;">${data.total ? data.total.toFixed(2) : '0.00'}</td>
    <td contenteditable="true" style="padding: 10px; border-bottom: 1px solid var(--border); text-align: right; color: #22c55e;">${data.paid ? data.paid.toFixed(2) : '0.00'}</td>
    <td contenteditable="true" style="padding: 10px; border-bottom: 1px solid var(--border); text-align: right; color: #ef4444;">${data.owed ? data.owed.toFixed(2) : '0.00'}</td>
    <td style="padding: 10px; border-bottom: 1px solid var(--border); text-align: center;">
      <button onclick="this.parentElement.parentElement.remove(); reRunWorkspaceAudit();" style="background:none; border:none; color:var(--danger); cursor:pointer;">✕</button>
    </td>
  `;
  body.appendChild(row);
}

function reRunWorkspaceAudit() {
  const trs = document.querySelectorAll('#workspace-body tr');
  const results = document.getElementById('audit-results');
  const rows = Array.from(trs).map(tr => {
    const tds = tr.querySelectorAll('td');
    return {
      date: tds[0].innerText.trim(),
      code: tds[1].innerText.trim(),
      desc: tds[2].innerText.trim(),
      qty: parseFloat(tds[3].innerText) || 0,
      price: parseFloat(tds[4].innerText) || 0,
      total: parseFloat(tds[5].innerText) || 0,
      paid: parseFloat(tds[6].innerText) || 0,
      owed: parseFloat(tds[7].innerText) || 0,
      raw: tr
    };
  });

  const findings = [];
  runArithmeticRules(rows, findings);
  runDuplicateRules(rows, findings);
  runConsistencyRules(rows, findings);
  runCompletenessRules(rows, findings);
  runSemanticRules(rows, findings);

  renderCategorizedFindings(findings, results, rows.length);
}

function runArithmeticRules(rows, findings) {
  let lineSum = 0; let statedTotal = 0;
  rows.forEach(r => {
    // 1. Math check
    const expected = Math.round(r.qty * r.price * 100) / 100;
    if (Math.abs(expected - r.total) > 0.05 && r.total !== 0) {
      findings.push({ category: 'arithmetic_error', title: 'Math Mismatch', detail: `Row ${r.code}: $${r.price} × ${r.qty} isn't $${r.total}.`, type: 'danger' });
      r.raw.style.backgroundColor = 'rgba(239, 68, 68, 0.05)';
    } else { r.raw.style.backgroundColor = 'transparent'; }
    
    // 2. Patient Responsibility Sanity (V2.3)
    if (r.paid + r.owed > r.total + 0.1) {
      findings.push({ category: 'arithmetic_error', title: 'Over-Responsibility', detail: `Code ${r.code}: Paid+Owed ($${(r.paid+r.owed).toFixed(2)}) is more than the total billed ($${r.total}).`, type: 'danger' });
    }

    if (/total|subtotal|due/i.test(r.desc)) statedTotal = Math.max(statedTotal, r.total);
    else lineSum += r.total;
  });
  if (statedTotal > 0 && Math.abs(lineSum - statedTotal) > 0.5) {
    findings.push({ category: 'arithmetic_error', title: 'Invoice Sum Error', detail: `Sum of items ($${lineSum.toFixed(2)}) doesn't match total ($${statedTotal.toFixed(2)}).`, type: 'danger' });
  }
}

function runDuplicateRules(rows, findings) {
  const sigs = {};
  rows.forEach(r => {
    if (!r.code || /total/i.test(r.desc)) return;
    const sig = `${r.date}|${r.code}|${r.total}`;
    sigs[sig] = (sigs[sig] || 0) + 1;
  });
  Object.entries(sigs).forEach(([sig, count]) => {
    if (count > 1) findings.push({ category: 'duplicate_charge', title: 'Duplicate Found', detail: `Item ${sig.split('|')[1]} billed ${count} times on ${sig.split('|')[0]}.`, type: 'danger' });
  });
}

function runConsistencyRules(rows, findings) {
  const codePrices = {};
  rows.forEach(r => {
    if (!r.code || /total/i.test(r.desc)) return;
    if (!codePrices[r.code]) codePrices[r.code] = [];
    codePrices[r.code].push(r.price);
  });
  Object.entries(codePrices).forEach(([code, prices]) => {
    if (Math.max(...prices) > Math.min(...prices) * 2) {
      findings.push({ category: 'pricing_outlier', title: 'Price Variance', detail: `Code ${code} has inconsistent base prices.`, type: 'warn' });
    }
  });
}

function runCompletenessRules(rows, findings) {
  rows.forEach(r => {
    if (r.total > 0 && !r.code && !/total/i.test(r.desc)) {
      findings.push({ category: 'missing_data', title: 'Missing Code', detail: `Charge of $${r.total} has no CPT code.`, type: 'warn' });
    }
  });
}

function runSemanticRules(rows, findings) {
  rows.forEach(r => {
    const d = r.desc.toLowerCase();
    if (d.includes('denied') && r.total > 0) findings.push({ category: 'consistency_warning', title: 'Denied but Charged', detail: `Service is marked denied but carries a cost.`, type: 'warn' });
  });
}

function renderCategorizedFindings(findings, container, rowCount) {
  if (rowCount === 0) return;
  container.className = 'audit-results visible';
  if (findings.length === 0) {
    container.innerHTML = `<div class="audit-finding" style="text-align:left;"><strong style="color:var(--success);">Pass</strong> - No anomalies found.</div>`;
    return;
  }
  const html = findings.map(f => `
    <div class="audit-finding" style="text-align:left; border-left: 3px solid var(--border);">
      <div class="finding-icon ${f.type}">●</div>
      <div style="flex:1;">
        <strong style="color:var(--text-h);">${f.title}</strong>
        <p style="margin:4px 0 0; font-size:13px; color:var(--text-muted);">${f.detail}</p>
      </div>
    </div>
  `).join('');
  container.innerHTML = `<div style="text-align:center; padding-bottom: 20px; font-weight: 700; color:var(--text-muted); text-transform:uppercase; font-size:11px; letter-spacing:0.1em;">Deep Offline Audit (V2.3)</div>` + html;
}

function runAuditLines() {
  const text = document.getElementById('line-items-text')?.value || '';
  if (text) runAudit(text);
}

function clearAudit() {
  document.getElementById('bill-text').value = '';
  document.getElementById('audit-results').innerHTML = '';
}

function debounce(fn, ms) {
  let t; return (...a) => { clearTimeout(t); t = setTimeout(() => fn(...a), ms); };
}

// ── Shared Utils & Code Search ──
async function searchCodes(q, container) {
  if (!db) return;
  const { data } = await db.from('medical_codes').select('code, short_description').ilike('code', `%${q}%`).limit(10);
  container.innerHTML = data.map(r => `<div class="result-card"><strong>${r.code}</strong>: ${r.short_description}</div>`).join('');
}

async function searchDenials(q, container) {
  if (!db) return;
  const { data } = await db.from('carc_codes').select('code, description').ilike('code', `%${q}%`).limit(10);
  container.innerHTML = data.map(r => `<div class="result-card"><strong>${r.code}</strong>: ${r.description}</div>`).join('');
}

function bindSearch(inputId, resultId, handler) {
  const input = document.getElementById(inputId);
  if (input) input.addEventListener('input', debounce(() => handler(input.value.trim(), document.getElementById(resultId)), 350));
}
