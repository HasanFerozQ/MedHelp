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
      // V2.5: Transparent Error Reporting
      const errStatus = response.status;
      let reason = "AI Offline";
      if (errStatus === 504) reason = "AI Timeout (Vercel 10s limit)";
      else if (errStatus === 500) reason = "AI Config Error (Check Keys)";
      else if (errStatus === 429) reason = "AI Rate Limit Exceeded";
      else if (errStatus === 404) reason = "AI Route Not Found (Deploying...)";

      if (status) status.innerHTML = `<span style="color:var(--warn); font-size:11px;">ℹ️ ${reason}. Running Deep Local Auditor...</span>`;
      
      const arrayBuffer = await file.arrayBuffer();
      const pdf = await pdfjsLib.getDocument({ data: arrayBuffer }).promise;
      let pageData = [];
      
      for (let i = 1; i <= pdf.numPages; i++) {
        const page = await pdf.getPage(i);
        const textContent = await page.getTextContent();
        
        // V2.5: Layout-Aware Capture (Extracting x, y, and string)
        const items = textContent.items.map(item => ({
          str: item.str,
          x: item.transform[4],
          y: item.transform[5],
          width: item.width,
          height: item.height
        }));
        pageData.push(items);
      }
      
      const structuredRows = reconstructRowsFromLayout(pageData);
      runAudit(structuredRows);
    }
  } catch (err) {
    if (overlay) overlay.style.display = 'none';
    console.error(err);
  }
}

// ── Interactive Audit Workspace (V2.3) ────────────────────────────────────
function runAudit(input) {
  const workspace = document.getElementById('audit-workspace-container');
  const results = document.getElementById('audit-results');
  if (!workspace || !results) return;

  const body = document.getElementById('workspace-body');
  body.innerHTML = '';
  results.innerHTML = '';

  let rows = [];
  if (Array.isArray(input)) {
    rows = input; // Structured rows from layout engine
  } else {
    rows = extractRowsFromText(input || ''); // Fallback to regex
  }

  workspace.style.display = 'block';
  
  if (rows.length === 0) {
    addWorkspaceRow();
    results.innerHTML = `<div class="audit-finding" style="text-align:center;"><p>No structured patterns found. Use the editor below to add line items.</p></div>`;
  } else {
    rows.forEach(r => addWorkspaceRow(r));
    reRunWorkspaceAudit();
  }
}

// ── V2.5 Layout-Aware Reconstruction Engine ──────────────────────────────
function reconstructRowsFromLayout(pages) {
  const allRows = [];
  
  pages.forEach(items => {
    // 1. Group items by Y coordinate (with 5px tolerance for shaky alignment)
    const yGroups = {};
    items.forEach(item => {
      if (item.str.trim() === '') return;
      const y = Math.round(item.y / 5) * 5;
      if (!yGroups[y]) yGroups[y] = [];
      yGroups[y].push(item);
    });

    // 2. Sort Y groups (top to bottom)
    const sortedY = Object.keys(yGroups).sort((a, b) => b - a);
    
    // 3. Process groups into rows
    sortedY.forEach(y => {
      const lineItems = yGroups[y].sort((a, b) => a.x - b.x);
      const lineText = lineItems.map(i => i.str).join(' ');
      
      // Use existing regex logic on the reconstructed line
      const extracted = extractRowsFromRawLine(lineText);
      if (extracted) allRows.push(extracted);
    });
  });
  
  return allRows;
}

function extractRowsFromRawLine(line) {
  const dateRegex = /\b(\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4})\b/;
  const codeRegex = /\b([0-9]{5}|[A-Z]{1}[0-9]{4}|[0-9]{4}[A-Z]{1})\b/;
  const moneyRegex = /(?:^|\s)\$?\s?(\d{1,7}(?:,\d{3})*(?:\.\d{2}))(?=\s|$)/g;

  const dates = line.match(dateRegex);
  const codes = line.match(codeRegex);
  const moneyMatches = [...line.matchAll(moneyRegex)];
  
  if (dates || codes || moneyMatches.length > 0) {
    const amounts = moneyMatches.map(m => parseFloat(m[1].replace(/,/g, '')));
    let price = 0, qty = 1, total = 0, paid = 0, owed = 0;
    
    if (amounts.length === 1) total = amounts[0];
    else if (amounts.length === 2) {
      if (amounts[0] < amounts[1]) { price = amounts[0]; total = amounts[1]; }
      else { total = amounts[0]; owed = amounts[1]; }
    } else if (amounts.length >= 3) {
      if (amounts[1] < 10 && amounts[0] * amounts[1] <= amounts[2] + 1) {
        price = amounts[0]; qty = amounts[1]; total = amounts[2];
      } else {
        total = amounts[0]; paid = amounts[1]; owed = amounts[2];
      }
    }

    let desc = line
      .replace(dateRegex, '')
      .replace(codeRegex, '')
      .replace(moneyRegex, '')
      .replace(/[|:,\-]/g, ' ')
      .replace(/\s+/g, ' ')
      .trim();

    if (desc.length > 60) desc = desc.substring(0, 57) + '...';
    if (!desc || desc.length < 2) desc = 'Medical Service';

    return {
      date: dates ? dates[0] : '',
      code: codes ? codes[0] : '',
      desc: desc,
      qty: qty || 1,
      price: price || (total / (qty || 1)),
      total: total,
      paid: paid,
      owed: owed
    };
  }
  return null;
}

function extractRowsFromText(text) {
  const lines = text.split('\n').filter(l => l.trim().length > 3);
  const rows = [];
  
  // High-fidelity Regex Patterns (V2.5)
  const dateRegex = /\b(\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4})\b/;
  const codeRegex = /\b([0-9]{5}|[A-Z]{1}[0-9]{4}|[0-9]{4}[A-Z]{1})\b/; // CPT, HCPCS, etc.
  const moneyRegex = /(?:^|\s)\$?\s?(\d{1,7}(?:,\d{3})*(?:\.\d{2}))(?=\s|$)/g;

  lines.forEach(line => {
    const dates = line.match(dateRegex);
    const codes = line.match(codeRegex);
    const moneyMatches = [...line.matchAll(moneyRegex)];
    
    if (dates || codes || moneyMatches.length > 0) {
      const amounts = moneyMatches.map(m => parseFloat(m[1].replace(/,/g, '')));
      let price = 0, qty = 1, total = 0, paid = 0, owed = 0;
      
      // Smart Heuristics for Amount Assignment
      if (amounts.length === 1) {
        total = amounts[0];
      } else if (amounts.length === 2) {
        // [Price, Total] or [Total, Paid] or [Paid, Owed]
        if (amounts[0] < amounts[1]) { price = amounts[0]; total = amounts[1]; }
        else { total = amounts[0]; owed = amounts[1]; }
      } else if (amounts.length >= 3) {
        // [Price, Qty, Total] or [Total, Paid, Owed]
        if (amounts[1] < 10 && amounts[0] * amounts[1] <= amounts[2] + 1) {
          price = amounts[0]; qty = amounts[1]; total = amounts[2];
        } else {
          total = amounts[0]; paid = amounts[1]; owed = amounts[2];
        }
      }

      // Semantic Scrubbing for Description
      let desc = line
        .replace(dateRegex, '')
        .replace(codeRegex, '')
        .replace(moneyRegex, '')
        .replace(/[|:,\-]/g, ' ')
        .replace(/\s+/g, ' ')
        .trim();

      if (desc.length > 60) desc = desc.substring(0, 57) + '...';
      if (!desc || desc.length < 2) desc = 'Medical Service';

      rows.push({
        date: dates ? dates[0] : '',
        code: codes ? codes[0] : '',
        desc: desc,
        qty: qty || 1,
        price: price || (total / (qty || 1)),
        total: total,
        paid: paid,
        owed: owed
      });
    }
  });
  return rows;
}


// Performance Guard: 250ms Debounced Auditor
const debouncedAudit = debounce(() => reRunWorkspaceAudit(), 250);

function addWorkspaceRow(data = {}) {
  const body = document.getElementById('workspace-body');
  if (!body) return;
  const row = document.createElement('tr');
  row.innerHTML = `
    <td contenteditable="true" oninput="debouncedAudit()" style="padding: 10px; border-bottom: 1px solid var(--border);">${data.date || ''}</td>
    <td contenteditable="true" oninput="debouncedAudit()" style="padding: 10px; border-bottom: 1px solid var(--border); font-family: monospace; font-weight: bold;">${data.code || ''}</td>
    <td contenteditable="true" oninput="debouncedAudit()" style="padding: 10px; border-bottom: 1px solid var(--border);">${data.desc || ''}</td>
    <td contenteditable="true" oninput="debouncedAudit()" style="padding: 10px; border-bottom: 1px solid var(--border); text-align: center;">${data.qty || 1}</td>
    <td contenteditable="true" oninput="debouncedAudit()" style="padding: 10px; border-bottom: 1px solid var(--border); text-align: right;">${data.price ? (Math.round(data.price * 100) / 100).toFixed(2) : '0.00'}</td>
    <td contenteditable="true" oninput="debouncedAudit()" style="padding: 10px; border-bottom: 1px solid var(--border); text-align: right; font-weight: bold;">${data.total ? (Math.round(data.total * 100) / 100).toFixed(2) : '0.00'}</td>
    <td contenteditable="true" oninput="debouncedAudit()" style="padding: 10px; border-bottom: 1px solid var(--border); text-align: right; color: #22c55e;">${data.paid ? (Math.round(data.paid * 100) / 100).toFixed(2) : '0.00'}</td>
    <td contenteditable="true" oninput="debouncedAudit()" style="padding: 10px; border-bottom: 1px solid var(--border); text-align: right; color: #ef4444;">${data.owed ? (Math.round(data.owed * 100) / 100).toFixed(2) : '0.00'}</td>
    <td style="padding: 10px; border-bottom: 1px solid var(--border); text-align: center;">
      <button onclick="this.parentElement.parentElement.remove(); debouncedAudit();" style="background:none; border:none; color:var(--danger); cursor:pointer;">✕</button>
    </td>
  `;
  body.appendChild(row);
}

function addCodeToAudit(code, desc) {
  const workspace = document.getElementById('audit-workspace-container');
  if (workspace) workspace.style.display = 'block';
  
  addWorkspaceRow({
    date: new Date().toLocaleDateString(),
    code: code,
    desc: desc,
    qty: 1,
    total: 0
  });

  // Switch to Audit Tab
  const btn = document.querySelector('.audit-tab') || document.querySelector('[onclick*="switchTab(\'pdf\'"]');
  switchTab('pdf', btn);
  
  // Highlight for feedback
  const trs = document.querySelectorAll('#workspace-body tr');
  const last = trs[trs.length - 1];
  if (last) {
    last.style.transition = 'background 0.5s';
    last.style.background = 'rgba(6, 182, 212, 0.15)';
    setTimeout(() => last.style.background = 'transparent', 2000);
  }
}

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
      qty: parseFloat(tds[3].innerText) || 0,
      price: parseFloat(tds[4].innerText) || 0,
      total: parseFloat(tds[5].innerText) || 0,
      paid: parseFloat(tds[6].innerText) || 0,
      owed: parseFloat(tds[7].innerText) || 0,
      raw: tr
    };
  });

  // Use BucketAuditor (V2.5 Modular Architecture)
  const engine = new BucketAuditor(rows);
  engine.runArithmetic();
  engine.runDuplicates();
  engine.runConsistency();
  engine.runSemantic();
  engine.runCompleteness();
  
  // V2.5 Asynchronous DB Check (Supabase Mapping)
  await engine.runDatabaseCheck();

  renderCategorizedFindings(engine.findings, results, rows.length);
}

class BucketAuditor {
  constructor(rows) {
    this.rows = rows;
    this.findings = [];
  }

  addFinding(category, title, detail, type = 'warn') {
    this.findings.push({ category, title, detail, type });
  }

  runArithmetic() {
    let lineSum = 0; let statedTotal = 0;
    this.rows.forEach(r => {
      r.raw.classList.remove('audit-row-error', 'audit-row-warn');
      
      // 1. Line Math
      const expected = Math.round(r.qty * r.price * 100) / 100;
      if (r.total > 0 && Math.abs(expected - r.total) > 0.05 && r.price > 0) {
        this.addFinding('arithmetic_error', 'Math Mismatch', `Row ${r.code || r.desc}: Unit Price × Qty ($${r.price.toFixed(2)} × ${r.qty}) isn't $${r.total.toFixed(2)}.`, 'danger');
        r.raw.classList.add('audit-row-error');
      }
      
      // 2. Patient Resp Sanity
      if (r.paid + r.owed > r.total + 0.1) {
        this.addFinding('arithmetic_error', 'Over-Responsibility', `Code ${r.code}: Paid+Owed ($${(r.paid+r.owed).toFixed(2)}) exceeds billed total ($${r.total}).`, 'danger');
        r.raw.classList.add('audit-row-error');
      }

      if (/total|subtotal|due|amount/i.test(r.desc)) statedTotal = Math.max(statedTotal, r.total);
      else lineSum += r.total;
    });

    if (statedTotal > 0 && Math.abs(lineSum - statedTotal) > 0.5) {
      this.addFinding('arithmetic_error', 'Invoice Sum Error', `Sum of items ($${lineSum.toFixed(2)}) doesn't match stated total ($${statedTotal.toFixed(2)}).`, 'danger');
    }
  }

  runDuplicates() {
    const registry = {};
    this.rows.forEach(r => {
      if (!r.code || /total/i.test(r.desc)) return;
      const key = `${r.date}|${r.code}|${r.total}`;
      if (!registry[key]) registry[key] = [];
      registry[key].push(r.raw);
    });
    Object.entries(registry).forEach(([key, trs]) => {
      if (trs.length > 1) {
        const parts = key.split('|');
        this.addFinding('duplicate_charge', 'Duplicate Found', `Code ${parts[1]} billed ${trs.length} times on ${parts[0]}.`, 'danger');
        trs.forEach(tr => tr.classList.add('audit-row-error'));
      }
    });
  }

  runConsistency() {
    const codeMap = {};
    this.rows.forEach(r => {
      if (!r.code || /total/i.test(r.desc)) return;
      if (!codeMap[r.code]) codeMap[r.code] = [];
      codeMap[r.code].push(r);
    });
    Object.entries(codeMap).forEach(([code, instances]) => {
      if (instances.length > 1) {
        const prices = instances.map(i => i.price);
        const max = Math.max(...prices);
        const min = Math.min(...prices);
        if (max > min * 1.5) {
          this.addFinding('pricing_outlier', 'Price Variance', `Code ${code} prices vary significantly across the bill ($${min} vs $${max}).`, 'warn');
          instances.forEach(i => i.raw.classList.add('audit-row-warn'));
        }
      }
    });
  }

  runSemantic() {
    this.rows.forEach(r => {
      const d = r.desc.toLowerCase();
      if ((d.includes('denied') || d.includes('rejected')) && r.owed > 0) {
        this.addFinding('consistency_warning', 'Patient responsibility on Denied Claim', `Service is marked denied but you are still being charged $${r.owed}.`, 'warn');
      }
      if (d.includes('duplicate') && r.total > 0) {
        this.addFinding('consistency_warning', 'Charged for Duplicate', `Item marked as duplicate has an active charge.`, 'danger');
      }
    });
  }

  runCompleteness() {
    this.rows.forEach(r => {
      if (r.total > 50 && !r.code && !/total/i.test(r.desc)) {
        this.addFinding('missing_data', 'Missing Code', `Significant charge of $${r.total} has no associated medical code.`, 'warn');
      }
    });
  }

  async runDatabaseCheck() {
    if (!db) return;
    
    // Batch unique codes for efficiency
    const codes = [...new Set(this.rows.map(r => r.code).filter(c => !!c))];
    if (codes.length === 0) return;

    try {
      // 1. Pricing & Description Lookup
      const { data: feeData, error: feeErr } = await db
        .from('cpt_medicare_fees')
        .select('cpt_code, base_price, description')
        .in('cpt_code', codes);

      if (feeErr) throw feeErr;

      const feeMap = (feeData || []).reduce((acc, f) => {
        acc[f.cpt_code] = f;
        return acc;
      }, {});
      
      this.rows.forEach(r => {
        if (!r.code || /total/i.test(r.desc)) return;
        
        const info = feeMap[r.code];
        if (!info) {
          this.addFinding('validation_error', 'Benchmark Missing', `Code ${r.code} not found in public Medicare datasets. Verify code accuracy.`, 'warn');
        } else {
          // Update description if it's generic
          if (r.desc === 'Medical Service' || r.desc.length < 5) {
             r.raw.querySelectorAll('td')[2].innerText = info.description;
          }

          // Pricing Variance Check
          if (r.total > (info.base_price * r.qty * 2.0)) {
            this.addFinding('pricing_audit', 'High Charge Variance', `Benchmark is ~$${info.base_price.toFixed(2)}, but you billed $${r.total.toFixed(2)}. This is ${((r.total / (info.base_price * r.qty)) * 100).toFixed(0)}% of Medicare.`, 'warn');
            r.raw.classList.add('audit-row-warn');
          }
        }
      });

      // 2. NCCI Bundling Check (V2.5) — Same-Date Logic
      const rowsByDate = this.rows.reduce((acc, r) => {
        if (!acc[r.date]) acc[r.date] = [];
        acc[r.date].push(r);
        return acc;
      }, {});

      for (const date in rowsByDate) {
        const dateRows = rowsByDate[date].filter(r => r.code && r.code.length >= 5);
        if (dateRows.length < 2) continue;

        const dateCodes = dateRows.map(r => r.code);
        const { data: ncciData } = await db
          .from('ncci_ptp_edits')
          .select('column1_code, column2_code, modifier_allowed')
          .in('column1_code', dateCodes)
          .in('column2_code', dateCodes);

        if (ncciData && ncciData.length > 0) {
          ncciData.forEach(edit => {
            this.addFinding(
              'bundling_audit', 
              'Clinical Bundle Violation', 
              `Codes ${edit.column1_code} and ${edit.column2_code} are typically bundled on the same date per CMS clinical rules.`, 
              'danger'
            );
            
            // Highlight both rows
            this.rows.forEach(r => {
              if (r.code === edit.column1_code || r.code === edit.column2_code) {
                r.raw.classList.add('audit-row-error');
              }
            });
          });
        }
      }
    } catch (err) {
      console.error("Supabase Audit Error:", err);
    }
  }
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



function renderAuditJSON(result) {
  const container = document.getElementById('audit-results');
  if (!container) return;
  container.className = 'audit-results visible';
  container.innerHTML = '';

  // 1. Savings Summary Card
  if (result.potential_savings > 0) {
    const savingsCard = document.createElement('div');
    savingsCard.className = 'savings-summary-card';
    savingsCard.style = 'background: linear-gradient(135deg, rgba(34, 197, 94, 0.1) 0%, rgba(34, 197, 94, 0.02) 100%); border: 1px solid rgba(34, 197, 94, 0.2); border-radius: 12px; padding: 24px; margin-bottom: 24px; text-align: center;';
    savingsCard.innerHTML = `
      <div style="font-size: 11px; font-weight: 700; color: #22c55e; text-transform: uppercase; letter-spacing: 0.1em; margin-bottom: 8px;">Audit Insight</div>
      <div style="font-size: 32px; font-weight: 800; color: var(--text-h); margin-bottom: 4px;">$${result.potential_savings.toFixed(2)}</div>
      <div style="font-size: 14px; color: var(--text-muted);">Estimated Potential Savings</div>
      <div style="margin-top: 16px; font-size: 12px; padding: 8px 12px; background: rgba(255,255,255,0.03); border-radius: 20px; display: inline-block;">
        Medicare Benchmark Total: $${result.medicare_benchmark_total?.toFixed(2) || '0.00'}
      </div>
    `;
    container.appendChild(savingsCard);
  }

  // 2. Summary Text
  const summaryHeader = document.createElement('div');
  summaryHeader.style = 'margin-bottom: 20px; padding: 0 4px;';
  summaryHeader.innerHTML = `
    <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom: 12px;">
      <div class="audit-status-badge">
        <div class="dot" style="background:#22c55e;"></div>
        AI Clinical Engine Active
      </div>
      <div style="font-size:11px; font-weight:700; color:var(--text-muted); text-transform:uppercase;">${result.findings.length} Anomalies</div>
    </div>
    <p style="font-size: 14px; color: var(--text-muted); line-height: 1.5;">${result.summary}</p>
  `;
  container.appendChild(summaryHeader);

  // 3. Render Findings
  if (result.findings.length === 0) {
    const successFinding = document.createElement('div');
    successFinding.className = 'audit-finding';
    successFinding.style = 'border-left: 3px solid var(--success); background: rgba(16, 185, 129, 0.05);';
    successFinding.innerHTML = `<strong style="color:var(--success);">Clinical Audit Passed</strong> — All line items match national clinical benchmarks.`;
    container.appendChild(successFinding);
  } else {
    result.findings.forEach(f => {
      const card = document.createElement('div');
      card.className = 'audit-finding';
      card.style = `text-align:left; border-left: 3px solid ${f.type === 'Danger' ? 'var(--danger)' : 'var(--warning)'};`;
      const typeClass = f.type.toLowerCase();
      card.innerHTML = `
        <div class="finding-icon ${typeClass}">●</div>
        <div style="flex:1;">
          <div style="display:flex; justify-content:space-between; align-items:center;">
            <strong style="color:var(--text-h);">${f.title}</strong>
            <span style="font-size:10px; font-weight:800; padding:2px 6px; border-radius:4px; background:rgba(255,255,255,0.05); color:var(${typeClass === 'danger' ? '--danger' : '--warning'}); text-transform:uppercase;">${f.code || 'AUDIT'}</span>
          </div>
          <p style="margin:4px 0 0; font-size:13px; color:var(--text-muted); opacity:0.9;">${f.reason || f.detail}</p>
        </div>
      `;
      container.appendChild(card);
    });
  }
}

function renderCategorizedFindings(findings, container, rowCount) {
  if (rowCount === 0) return;
  container.className = 'audit-results visible';
  
  const header = `
    <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom: 24px; padding-bottom: 12px; border-bottom: 1px solid var(--border);">
      <div class="audit-status-badge">
        <div class="dot"></div>
        Deep Local Auditor (V2.4 Fallback)
      </div>
      <div style="font-size:11px; font-weight:700; color:var(--text-muted); text-transform:uppercase;">${findings.length} Findings</div>
    </div>
  `;

  if (findings.length === 0) {
    container.innerHTML = header + `<div class="audit-finding" style="text-align:left; border-left: 3px solid var(--success); background: rgba(16, 185, 129, 0.05);"><strong style="color:var(--success);">Audit Passed</strong> — No structured anomalies detected in the provided billing data.</div>`;
    return;
  }

  const html = findings.map(f => `
    <div class="audit-finding" style="text-align:left; border-left: 3px solid ${f.type === 'danger' ? 'var(--danger)' : 'var(--warning)'};">
      <div class="finding-icon ${f.type}">●</div>
      <div style="flex:1;">
        <div style="display:flex; justify-content:space-between; align-items:center;">
          <strong style="color:var(--text-h);">${f.title}</strong>
          <span style="font-size:10px; font-weight:800; padding:2px 6px; border-radius:4px; background:rgba(255,255,255,0.05); color:var(${f.type === 'danger' ? '--danger' : '--warning'}); text-transform:uppercase;">${f.category.replace('_',' ')}</span>
        </div>
        <p style="margin:4px 0 0; font-size:13px; color:var(--text-muted); opacity:0.9;">${f.detail}</p>
      </div>
    </div>
  `).join('');

  container.innerHTML = header + html;
}

function runAuditLines() {
  const text = document.getElementById('line-items-text')?.value || '';
  if (!text) return;
  
  // Quick shorthand for manual entries
  runAudit(text);
}

function switchTab(id, btn) {
  // Handles both top-level and audit-specific tabs
  const prefix = id.includes('audit-') ? '' : 'audit-';
  const targetId = id.startsWith('audit-') ? id : 'audit-' + id;
  
  document.querySelectorAll('.audit-panel').forEach(p => p.style.display = 'none');
  document.querySelectorAll('.audit-tab').forEach(b => b.classList.remove('active'));
  
  const target = document.getElementById(targetId);
  if (target) target.style.display = 'block';
  if (btn) btn.classList.add('active');
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
  container.innerHTML = data.map(r => `
    <div class="result-card" style="display:flex; justify-content:space-between; align-items:center;">
      <div><strong>${r.code}</strong>: ${r.short_description}</div>
      <button class="btn btn-ghost" style="padding:4px 8px; font-size:11px;" onclick="addCodeToAudit('${r.code}', '${r.short_description}')">⊕ Add to Audit</button>
    </div>`).join('');
}

async function searchDenials(q, container) {
  if (!db) return;
  const { data } = await db.from('carc_codes').select('code, description').ilike('code', `%${q}%`).limit(10);
  container.innerHTML = data.map(r => `
    <div class="result-card" style="display:flex; justify-content:space-between; align-items:center;">
      <div><strong>${r.code}</strong>: ${r.description}</div>
      <button class="btn btn-ghost" style="padding:4px 8px; font-size:11px;" onclick="addCodeToAudit('${r.code}', '${r.description}')">⊕ Add to Audit</button>
    </div>`).join('');
}

function bindSearch(inputId, resultId, handler) {
  const input = document.getElementById(inputId);
  if (input) input.addEventListener('input', debounce(() => handler(input.value.trim(), document.getElementById(resultId)), 350));
}
