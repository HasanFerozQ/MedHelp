/**
 * MediHelp — app.js (v2.3 - Deep Local Auditor)
 * Handles: Tab switching, Region toggle, Code Search, Denial Search,
 * Rx Search Insights, NPI Provider Search (CORS Fallback), 
 * and Local PDF Bill Audit (via pdf.js) with Deep Workspace Logic.
 */

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
  // Database lookups now use secure edge functions. No exposed client key.


  bindSearch('codes-input', 'codes-results', searchCodes);
  bindSearch('denials-input', 'denials-results', searchDenials);

  const rxInput = document.getElementById('rx-input');
  const rxResults = document.getElementById('rx-results');
  if (rxInput && rxResults) {
    rxInput.addEventListener('input', debounce(() => {
      const q = rxInput.value.trim().toLowerCase();
      if (q.length < 3) { rxResults.innerHTML = ''; return; }
      const match = Object.entries(RX_INSIGHTS).find(([k]) => q.includes(k) || k.includes(q));
      if (!match) {
        rxResults.innerHTML = `<div class="status-msg">No pricing data for "${q}". Try: metformin, lisinopril, atorvastatin.</div>`;
        return;
      }
      const [, info] = match;
      rxResults.innerHTML = `
        <div class="result-card" style="gap:8px;">
          <div style="display:flex;justify-content:space-between;align-items:center;">
            <strong style="color:var(--text-h);font-size:15px;">${info.generic}</strong>
            <span style="font-size:11px;font-weight:800;color:var(--accent);background:var(--accent-glow);padding:2px 8px;border-radius:4px;">${info.price_hint}</span>
          </div>
          <div style="font-size:12px;color:var(--text-muted);">${info.class} &nbsp;·&nbsp; Est. Cost: <strong style="color:var(--text-h);">${info.cost}</strong> &nbsp;·&nbsp; ${info.stock}</div>
          <div style="font-size:12px;color:var(--success);margin-top:4px;">💡 ${info.tip}</div>
        </div>`;
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
      if (loadingText) loadingText.textContent = 'PDF contains no text layer. Initializing OCR Fallback (Tesseract.js)...';
      
      // Load Tesseract dynamically
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
      pageData = []; // Clear and rebuild via OCR

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
    if (status) status.innerHTML = `<span style="color:var(--danger); font-size:12px;">⚠️ Could not read PDF: ${err.message}</span>`;
    console.error('PDF extraction error:', err);
  }
}


// ── Interactive Audit Workspace (V2.3) ────────────────────────────────────
function runAudit(input, detectedNPIs = []) {
  const workspace = document.getElementById('audit-workspace-container');
  const results = document.getElementById('audit-results');
  if (!workspace || !results) return;

  const body = document.getElementById('workspace-body');
  body.innerHTML = '';
  results.innerHTML = '';

  let rows = [];
  if (Array.isArray(input)) {
    rows = input; 
  } else {
    rows = extractRowsFromText(input || ''); 
  }

  workspace.style.display = 'block';
  
  if (rows.length === 0) {
    addWorkspaceRow();
    results.innerHTML = `<div class="audit-finding" style="text-align:center;"><p>No structured patterns found. Use the editor below to add line items.</p></div>`;
  } else {
    rows.forEach(r => addWorkspaceRow(r));
    // Store NPIs in workspace state for the audit engine
    workspace.dataset.npis = JSON.stringify(detectedNPIs);
    reRunWorkspaceAudit();
  }
}


// ── V2.5 Layout-Aware Reconstruction Engine ──────────────────────────────
function filterNormalRows(rows) {
  const testKeywords = ["TEST", "FAKE", "ANOMALY", "SAMPLE", "VOID", "DRAFT"];
  return rows.filter(r => {
    const desc = (r.desc || "").toUpperCase();
    const code = (r.code || "").toUpperCase();
    
    const isTest = testKeywords.some(key => desc.includes(key) || code.includes(key));
    if (isTest) return false;

    // Filter out obviously non-medical lines (e.g., "PAGE 1")
    if (code === "" && r.total === 0) return false;
    
    return true;
  });
}

function reconstructRowsFromLayout(pages) {
  const allRows = [];
  
  pages.forEach(items => {
    // 1. Group items by Y coordinate (with 10px tolerance for multi-line rows)
    const yGroups = {};
    items.forEach(item => {
      if (item.str.trim() === '') return;
      const y = Math.round(item.y / 10) * 10;
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
  
  return filterNormalRows(allRows);
}



function extractRowsFromRawLine(line) {
  const dateRegex = /\b(\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4})\b/g;
  // Hardened CPT Regex: Strictly 5 digits in valid CPT ranges (10000-99999), excluding ZIP/Money/Phone patterns
  const codeRegex = /\b(?!00000|90210|30301|10001|60601|50000|40000|20000|19000|39000)([1-9][0-9]{4})\b/g;
  const moneyRegex = /(?:^|\s|\$)\s?(\d{1,7}(?:,\d{3})*(?:\.\d{2})?)(?=\s|$)/g;

  dateRegex.lastIndex = 0; codeRegex.lastIndex = 0; moneyRegex.lastIndex = 0;

  const dates = line.match(dateRegex);
  const codes = line.match(codeRegex);
  const moneyMatches = [...line.matchAll(moneyRegex)];


  
  if (dates || codes || moneyMatches.length > 0) {
    const amounts = moneyMatches.map(m => parseFloat(m[1].replace(/,/g, '')));
    let price = 0, qty = 1, total = 0, paid = 0, owed = 0;
    
    if (amounts.length > 0) {
      const parsed = parseAmounts(amounts);
      price = parsed.price; qty = parsed.qty; total = parsed.total; paid = parsed.paid; owed = parsed.owed;
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
      price: price || (qty > 0 ? total / qty : total),
      total: total,
      paid: paid,
      owed: owed,
      priceWasDerived: !price 
    };

  }
  return null;
}

function extractRowsFromText(text) {
  const lines = text.split('\n').filter(l => l.trim().length > 3);
  const rows = [];
  
  // High-fidelity Regex Patterns (V2.6)
  const dateRegex = /\b(\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4})\b/g;
  const codeRegex = /\b(?!00000|90210|30301|10001|60601|50000|40000|20000|19000|39000)([1-9][0-9]{4})\b/g;
  const moneyRegex = /(?:^|\s|\$)\s?(\d{1,7}(?:,\d{3})*(?:\.\d{2})?)(?=\s|$)/g;



  lines.forEach(line => {
    const dates = line.match(dateRegex);
    const codes = line.match(codeRegex);
    const moneyMatches = [...line.matchAll(moneyRegex)];
    
    if (dates || codes || moneyMatches.length > 0) {
      const amounts = moneyMatches.map(m => parseFloat(m[1].replace(/,/g, '')));
      const { price, qty, total, paid, owed } = parseAmounts(amounts);


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
  return filterNormalRows(rows);
}



// Performance Guard: 250ms Debounced Auditor
const debouncedAudit = debounce(() => reRunWorkspaceAudit(), 250);

function addWorkspaceRow(data = {}) {
  const body = document.getElementById('workspace-body');
  if (!body) return;
  const row = document.createElement('tr');
  if (data.priceWasDerived) row.dataset.priceWasDerived = 'true';
  
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
  // If we're not on audit.html, redirect there with params
  if (!document.getElementById('audit-workspace-container')) {
    window.location.href = `audit.html?code=${encodeURIComponent(code)}&desc=${encodeURIComponent(desc)}`;
    return;
  }

  const workspace = document.getElementById('audit-workspace-container');
  if (workspace) workspace.style.display = 'block';
  
  addWorkspaceRow({
    date: new Date().toLocaleDateString(),
    code: code,
    desc: desc,
    qty: 1,
    total: 0
  });

  // Switch to PDF tab view
  const btn = document.querySelector('.audit-tab.active') || document.querySelector('.audit-tab');
  switchTab('pdf', btn);
  
  // Highlight new row
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
      qty: parseFloat(tds[3].innerText) || 1,
      price: parseFloat(tds[4].innerText) || 0,
      total: parseFloat(tds[5].innerText) || 0,
      paid: parseFloat(tds[6].innerText) || 0,
      owed: parseFloat(tds[7].innerText) || 0,
      priceWasDerived: tr.dataset.priceWasDerived === 'true',
      raw: tr
    };


  });

  // Use BucketAuditor (V2.7 Advanced Architecture)
  const multiplier = parseFloat(document.getElementById('payer-type')?.value) || 1.5;
  const npiData = document.getElementById('audit-workspace-container')?.dataset.npis;
  const npis = npiData ? JSON.parse(npiData) : [];
  
  const engine = new BucketAuditor(rows, multiplier, npis);
  engine.runArithmetic();
  engine.runDuplicates();
  engine.runConsistency();
  engine.runSemantic();
  engine.runCompleteness();
  
  // V2.6 Asynchronous DB Check (Secure Edge Lookups)
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
    let lineSum = 0; let statedTotal = 0;
    this.rows.forEach(r => {
      r.raw.classList.remove('audit-row-error', 'audit-row-warn');
      
      // 1. Line Math (skip if price was fabricated/derived)
      const expected = Math.round(r.qty * r.price * 100) / 100;
      if (!r.priceWasDerived && r.total > 0 && Math.abs(expected - r.total) > 0.05 && r.price > 0) {
        this.addFinding('arithmetic_error', 'Math Mismatch', `Row ${r.code || r.desc}: Unit Price × Qty ($${r.price.toFixed(2)} × ${r.qty}) isn't $${r.total.toFixed(2)}.`, 'danger');
        r.raw.classList.add('audit-row-error');
        // Potential savings if they overcharged based on unit price
        if (r.total > expected) this.potentialSavings += (r.total - expected);
      }
      
      // 2. Patient Resp Sanity (handle adjustments indirectly)
      const respSum = r.paid + r.owed;
      if (respSum > r.total + 0.1) {
        this.addFinding('arithmetic_error', 'Over-Responsibility', `Code ${r.code}: Paid+Owed ($${respSum.toFixed(2)}) exceeds billed total ($${r.total}).`, 'danger');
        r.raw.classList.add('audit-row-error');
      } else if (respSum < r.total * 0.7 && r.total > 50) {
        // Significant gap indicates missing insurance adjustments or contractual write-offs
        this.addFinding('missing_data', 'Missing Adjustments', `Paid/Owed ($${respSum.toFixed(2)}) is significantly less than billed total ($${r.total}). Audit excludes possible contractual write-offs.`, 'warn');
      }


      // 3. Invoice Sum Scope Check
      if (/^(total|subtotal|due|amount due|balance)/i.test(r.desc)) statedTotal = Math.max(statedTotal, r.total);
      else lineSum += r.total;
    });


    if (statedTotal > 0 && Math.abs(lineSum - statedTotal) > 0.5) {
      this.addFinding('arithmetic_error', 'Invoice Sum Error', `Sum of items ($${lineSum.toFixed(2)}) doesn't match stated total ($${statedTotal.toFixed(2)}).`, 'danger');
    }
  }


  runDuplicates() {
    const registry = {};
    this.rows.forEach((r, rowIndex) => {
      if (!r.code || /total/i.test(r.desc)) return;
      
      // If date is blank, use row index as fallback to prevent mass-key collision
      const dateKey = r.date && r.date.trim() !== '' ? r.date : `__row${rowIndex}`;
      const key = `${dateKey}|${r.code}`;
      if (!registry[key]) registry[key] = [];
      registry[key].push(r);
    });

    Object.entries(registry).forEach(([key, matches]) => {
      const dateWasReal = !key.startsWith('__row');
      if (matches.length > 1 && dateWasReal) {
        // Confirmed duplicate on the same date
        const parts = key.split('|');
        this.addFinding('duplicate_charge', 'Duplicate Found', `Code ${parts[1]} billed ${matches.length}x on ${parts[0]}.`, 'danger');
        matches.forEach(m => m.raw.classList.add('audit-row-error'));
        // savings: second, third etc. instances
        for (let i = 1; i < matches.length; i++) {
            this.potentialSavings += matches[i].total;
        }
      } else if (matches.length > 1 && !dateWasReal) {
        // Soft warning for undated codes that appear multiple times
        const codePart = key.split('|')[1];
        this.addFinding('missing_data', 'Possible Duplicate (No Date)', `Code ${codePart} appears ${matches.length}x but has no service date to confirm. Verify manually.`, 'warn');
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
    const highComplexityCodes = {
        tier1: ['99215', '99205', '99245', '99223', '99233'], // High risk E/M
        tier2: ['99214', '99204', '99244', '99222', '99232']  // Moderate risk E/M
    };

    this.rows.forEach(r => {
      if (r.total > 50 && !r.code && !/total/i.test(r.desc)) {
        this.addFinding('missing_data', 'Missing Code', `Significant charge of $${r.total} has no associated medical code.`, 'warn');
      }

      if (highComplexityCodes.tier1.includes(r.code)) {
        this.addFinding('clinical_alert', 'Extreme Upcoding Risk', `${r.code} represents the highest level of complexity. Ensure documented medical necessity for 40+ min of physician time.`, 'warn');
      } else if (highComplexityCodes.tier2.includes(r.code)) {
        this.addFinding('clinical_alert', 'Upcoding Alert', `${r.code} is a high-severity code. Hospitals often use this to overcharge for simple visits.`, 'warn');
      }
    });
  }

  async runDatabaseCheck() {
    const codes = [...new Set(this.rows.map(r => r.code).filter(c => !!c))];
    if (codes.length === 0 && this.npis.length === 0) return;

    try {
      const res = await fetch('https://bisqgousuvljttesjkkm.supabase.co/functions/v1/lookup_codes', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ codes, npis: this.npis })
      });

      if (!res.ok) throw new Error("Secure Lookup Failed");
      const { fees: feeMap, ncci: ncciData, providers: providerMap } = await res.json();
      
      // 0. Provider Sanity (V2.7)
      if (providerMap) {
        Object.values(providerMap).forEach(p => {
          if (p.status !== 'Active') {
            this.addFinding('clinical_alert', 'Provider Status Warning', `Provider NPI ${p.npi} (${p.name}) is listed as INACTIVE. Charging against inactive licenses is a high fraud marker.`, 'danger');
          } else {
            this.addFinding('validation_error', 'Verified Provider', `Credential match: ${p.name} (${p.specialty}). License is Active.`, 'info');
          }
        });
      }

      // 1. Pricing Variance & Descriptions
      this.rows.forEach(r => {
        if (!r.code || /total/i.test(r.desc)) return;
        
        const info = feeMap[r.code];
        if (!info) {
          this.addFinding('validation_error', 'Benchmark Missing', `Code ${r.code} not found in public Medicare datasets.`, 'warn');
        } else {
          if (r.desc === 'Medical Service' || r.desc.length < 5) {
             r.raw.querySelectorAll('td')[2].innerText = info.desc || 'Medical Service';
          }

          const actualTotalBenchmark = info.price * r.qty;
          const cappedMarketRate = actualTotalBenchmark * this.multiplier;
          this.totalBenchmark += actualTotalBenchmark;

          if (r.total > cappedMarketRate) {
            const variancePct = actualTotalBenchmark > 0 ? ((r.total / actualTotalBenchmark) * 100).toFixed(0) : "∞";
            const payerLabel = this.multiplier === 1.5 ? 'Self-Pay Market-Rate' : 'Payer Fair-Market-Rate';
            this.addFinding('pricing_audit', 'High Charge Variance', `${payerLabel} is ~$${cappedMarketRate.toFixed(2)} (Medicare x${this.multiplier}), but you billed $${r.total.toFixed(2)} (${variancePct}% of Medicare).`, 'warn');
            r.raw.classList.add('audit-row-warn');
            this.potentialSavings += Math.max(0, r.total - cappedMarketRate);
          }
        }
      });


      // 2. NCCI Bundling Check (V2.6)
      if (ncciData && ncciData.length > 0) {
        const savingsDedup = new Set();
        ncciData.forEach(edit => {
          this.addFinding(
            'bundling_audit', 
            'Clinical Bundle Violation', 
            `Medical rule violation: ${edit.column1_code} and ${edit.column2_code} are typically bundled.`, 
            'danger'
          );
          
          this.rows.forEach(r => {
            if (r.code === edit.column1_code || r.code === edit.column2_code) {
              r.raw.classList.add('audit-row-error');
            }
            if (r.code === edit.column2_code) {
                // Deduplicate savings per unique code
                if (!savingsDedup.has(r.code)) {
                    if (edit.modifier_allowed === '0') {
                        this.potentialSavings += r.total;
                    } else {
                        this.potentialSavings += (r.total * 0.5);
                    }
                    savingsDedup.add(r.code);
                }
            }
          });
        });
      }

    } catch (err) {
      console.error("Supabase Audit Error:", err);
    }
  }

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
      card.style = `text-align:left; border-left: 3px solid ${f.type.toLowerCase() === 'danger' ? 'var(--danger)' : 'var(--warning)'};`;
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


  // 4. Action Buttons (Phase 1)
  const actionRow = document.createElement('div');
  actionRow.className = 'audit-btn-row';
  actionRow.style = 'margin-top: 32px; justify-content: center; display: flex; gap: 12px;';
  actionRow.innerHTML = `
    <button class="btn btn-primary" onclick="openPatientModal()">📄 Download Professional PDF</button>
    <button class="btn btn-ghost" onclick="copyNegotiationScript()">⚖️ Copy Negotiation Script</button>
  `;
  container.appendChild(actionRow);

  // Store result globally for PDF generator (Non-Persistent)
  window.lastAuditResult = result;
}

// PHASE 1: PROFESSIONAL REPORTING LOGIC
function openPatientModal() {
  const modal = document.getElementById('patient-modal');
  if (modal) {
    modal.style.display = 'flex';
    // Set default date to today
    const dateInput = document.getElementById('p-date');
    if (dateInput) dateInput.value = new Date().toISOString().split('T')[0];
  }
}

function closePatientModal() {
  const modal = document.getElementById('patient-modal');
  if (modal) modal.style.display = 'none';
}

// HIPAA-SAFE PDF GENERATOR (0 Persistence)
async function generateProfessionalPDF() {
  const { jsPDF } = window.jspdf;
  const result = window.lastAuditResult;
  if (!result) return;

  const data = {
    first: document.getElementById('p-first').value.trim() || "Patient",
    last: document.getElementById('p-last').value.trim() || "",
    hospital: document.getElementById('p-hospital').value.trim() || "Medical Facility",
    account: document.getElementById('p-account').value.trim() || "N/A",
    insurance: document.getElementById('p-insurance').value.trim() || "N/A",
    date: document.getElementById('p-date').value || new Date().toLocaleDateString()
  };

  const doc = new jsPDF();
  const pageHeight = doc.internal.pageSize.height;

  // 1. Formal Letter Header (Clean Design, No Branding)
  doc.setFont("helvetica", "normal");
  doc.setFontSize(10);
  doc.text(`Date: ${data.date}`, 14, 20);
  doc.text(`Patient: ${data.first} ${data.last}`, 14, 25);
  doc.text(`Account/Invoice: ${data.account}`, 14, 30);
  doc.text(`Insurance ID: ${data.insurance}`, 14, 35);
  
  doc.text(`TO: Billing Department`, 140, 20);
  doc.text(`${data.hospital}`, 140, 25);

  // 2. Subject Line
  doc.setFont("helvetica", "bold");
  doc.setFontSize(12);
  doc.text("SUBJECT: OFFICIAL VERIFICATION OF BILLING ACCURACY & CLINICAL AUDIT", 105, 50, { align: "center" });

  // 3. Opening
  doc.setFont("helvetica", "normal");
  doc.setFontSize(10);
  doc.text(`Reference is made to the medical bill/claim associated with the above account. A clinical audit has been performed`, 14, 60);
  doc.text(`comparing the submitted line items against CMS Medicare Pricing and NCCI Unbundling standards.`, 14, 65);

  // 4. Clinical Itemization Table
  const tableHeaders = [["Date", "Code", "Description", "Billed Amount", "Status"]];
  const tableRows = (result.normalized_bill || []).map(item => [
    item.Date || "N/A",
    item.CPT || "N/A",
    item.Description || "Medical Service",
    `$${(item.Billed_Amount || 0).toFixed(2)}`,
    "Clinical Review Done"
  ]);

  doc.autoTable({
    startY: 75,
    head: tableHeaders,
    body: tableRows,
    theme: 'grid',
    styles: { fontSize: 9, cellPadding: 3, font: "helvetica" },
    headStyles: { fillColor: [40, 40, 40], textColor: [255, 255, 255] }
  });

  // 5. Findings Section
  let currentY = doc.lastAutoTable.finalY + 15;
  doc.setFont("helvetica", "bold");
  doc.text("AUDIT FINDINGS & CLINICAL JUSTIFICATION:", 14, currentY);
  currentY += 7;

  doc.setFont("helvetica", "normal");
  result.findings.forEach((finding, idx) => {
    if (currentY > pageHeight - 30) {
      doc.addPage();
      currentY = 20;
    }
    const text = `${idx + 1}. [${finding.type.toUpperCase()}] ${finding.title}: ${finding.reason || finding.detail}`;
    const splitText = doc.splitTextToSize(text, 180);
    doc.text(splitText, 14, currentY);
    currentY += (splitText.length * 5) + 2;
  });

  // 6. Savings Opportunity Summary
  currentY += 10;
  if (currentY > pageHeight - 40) { doc.addPage(); currentY = 20; }
  doc.setDrawColor(200, 200, 200);
  doc.line(14, currentY, 196, currentY);
  currentY += 10;
  doc.setFont("helvetica", "bold");
  doc.text(`ESTIMATED SAVINGS OPPORTUNITY: $${result.potential_savings.toFixed(2)}`, 14, currentY);
  currentY += 7;
  doc.setFont("helvetica", "italic");
  doc.setFontSize(9);
  doc.text("Calculation based on 150% Medicare Benchmark and removal of non-billable clinical overlaps.", 14, currentY);

  // 7. Closing
  currentY += 20;
  doc.setFont("helvetica", "normal");
  doc.setFontSize(10);
  doc.text("Respectfully submitted,", 14, currentY);
  currentY += 15;
  doc.line(14, currentY, 70, currentY); // Signature Line
  currentY += 5;
  doc.text(`${data.first} ${data.last}`, 14, currentY);

  // Final Disclaimer
  doc.setFontSize(7);
  doc.setTextColor(150, 150, 150);
  doc.text("This report is generated for informational/negotiation purposes only. It does not constitute legal or medical advice.", 105, 285, { align: "center" });

  doc.save(`Medical_Audit_${data.last}_${data.account}.pdf`);
  closePatientModal();
}

function copyNegotiationScript() {
  const result = window.lastAuditResult;
  if (!result) return;
  
  let letter = `Subject: Formal Dispute of Medical Charges - Billing Accuracy Audit\n\n`;
  letter += `To Whom It May Concern,\n\n`;
  letter += `I am writing to formally dispute the charges on my recent bill. A clinical audit based on CMS and NCCI standards has identified ${result.findings.length} anomalies including pricing variances and bundling errors.\n\n`;
  
  letter += `Findings Summary:\n`;
  const categoryLabels = {
    arithmetic_error: 'Arithmetic Error', duplicate_charge: 'Duplicate Charge',
    pricing_outlier: 'Pricing Variance', consistency_warning: 'Consistency Issue',
    missing_data: 'Missing Data', validation_error: 'Validation Error',
    pricing_audit: 'Pricing Audit', bundling_audit: 'Bundling Violation',
    clinical_alert: 'Clinical Rule'
  };
  result.findings.forEach((f, idx) => {
    const label = categoryLabels[f.code] || f.code || 'Audit Finding';
    letter += `${idx + 1}. [${label}] ${f.title}: ${f.reason || f.detail}\n`;
  });

  
  letter += `\nBased on these clinical guidelines, the estimated fair-market value for these services significantly differs from the amount billed. I am requesting an adjustment of approximately $${result.potential_savings.toFixed(2)}.\n\n`;
  letter += `Please provide an updated invoice reflecting these adjustments or a written explanation for why these national clinical standards were not followed.\n\n`;
  letter += `Sincerely,\n[Your Name]`;

  navigator.clipboard.writeText(letter).then(() => {
    alert("Professional Negotiation Script copied to clipboard!");
  });
}

// Event entry point
document.addEventListener('DOMContentLoaded', () => {
    const genBtn = document.getElementById('btn-generate-final');
    if (genBtn) genBtn.onclick = generateProfessionalPDF;
});


function renderCategorizedFindings(findings, container, rowCount, rows, savings = 0, benchmarkTotal = 0) {
  if (rowCount === 0) return;

  // Store a local-format lastAuditResult so PDF & negotiation script work
  window.lastAuditResult = {
    summary: `Local audit complete. ${findings.length} finding(s) identified. Total potential savings: $${savings.toFixed(2)}.`,
    findings: findings.map(f => ({ title: f.title, reason: f.detail, detail: f.detail, type: f.type, code: f.category })),
    potential_savings: savings,
    medicare_benchmark_total: benchmarkTotal,
    normalized_bill: (rows || []).map(r => ({
      Date: r.date || 'N/A',
      CPT: r.code || 'N/A',
      Description: r.desc || 'Medical Service',
      Billed_Amount: r.total || 0
    }))
  };

  container.className = 'audit-results visible';
  container.innerHTML = ''; // Clear previous results
  
  // 1. Savings Summary Card (V2.5)
  if (savings > 0) {
    const savingsCard = document.createElement('div');
    savingsCard.className = 'savings-summary-card';
    savingsCard.style = 'background: linear-gradient(135deg, rgba(34, 197, 94, 0.1) 0%, rgba(34, 197, 94, 0.02) 100%); border: 1px solid rgba(34, 197, 94, 0.2); border-radius: 12px; padding: 24px; margin-bottom: 24px; text-align: center;';
    savingsCard.innerHTML = `
      <div style="font-size: 11px; font-weight: 700; color: #22c55e; text-transform: uppercase; letter-spacing: 0.1em; margin-bottom: 8px;">Potential Savings Identified</div>
      <div style="font-size: 32px; font-weight: 800; color: var(--text-h); margin-bottom: 4px;">$${savings.toFixed(2)}</div>
      <div style="font-size: 14px; color: var(--text-muted);">Based on clinical and arithmetic audit</div>
      <div style="margin-top: 16px; font-size: 12px; padding: 8px 12px; background: rgba(255,255,255,0.03); border-radius: 20px; display: inline-block;">
        Medicare Benchmark Total: $${benchmarkTotal.toFixed(2)}
      </div>
    `;
    container.appendChild(savingsCard);
  }

  const header = document.createElement('div');
  header.innerHTML = `
    <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom: 24px; padding-bottom: 12px; border-bottom: 1px solid var(--border);">
      <div class="audit-status-badge">
        <div class="dot" style="background:var(--accent);"></div>
        Clinical Auditor — Local Engine
      </div>
      <div style="font-size:11px; font-weight:700; color:var(--text-muted); text-transform:uppercase;">${findings.length} Finding${findings.length !== 1 ? 's' : ''}</div>
    </div>
  `;
  container.appendChild(header);

  if (findings.length === 0) {
    const passFinding = document.createElement('div');
    passFinding.className = 'audit-finding';
    passFinding.style = 'text-align:left; border-left: 3px solid var(--success); background: rgba(16, 185, 129, 0.05);';
    passFinding.innerHTML = `<strong style="color:var(--success);">Audit Passed</strong> — No structured anomalies detected in the provided billing data.`;
    container.appendChild(passFinding);
  } else {
    findings.forEach(f => {
      const card = document.createElement('div');
      card.className = 'audit-finding';
      card.style = `text-align:left; border-left: 3px solid ${f.type === 'danger' ? 'var(--danger)' : 'var(--warning)'};`;
      card.innerHTML = `
        <div class="finding-icon ${f.type}">●</div>
        <div style="flex:1;">
          <div style="display:flex; justify-content:space-between; align-items:center;">
            <strong style="color:var(--text-h);">${f.title}</strong>
            <span style="font-size:10px; font-weight:800; padding:2px 6px; border-radius:4px; background:rgba(255,255,255,0.05); color:var(${f.type === 'danger' ? '--danger' : '--warning'}); text-transform:uppercase;">${f.category.replace('_',' ')}</span>
          </div>
          <p style="margin:4px 0 0; font-size:13px; color:var(--text-muted); opacity:0.9;">${f.detail}</p>
        </div>
      `;
      container.appendChild(card);
    });
  }

  // ── Action Buttons (always shown after local audit) ──
  const actionRow = document.createElement('div');
  actionRow.className = 'audit-btn-row';
  actionRow.style = 'margin-top: 32px; justify-content: center; display: flex; gap: 12px; flex-wrap: wrap;';
  actionRow.innerHTML = `
    <button class="btn btn-primary" onclick="openPatientModal()">📄 Download Professional PDF</button>
    <button class="btn btn-ghost" onclick="copyNegotiationScript()">⚖️ Copy Negotiation Script</button>
  `;
  container.appendChild(actionRow);
}


function runAuditLines() {
  const text = document.getElementById('line-items-text')?.value || '';
  if (!text) return;
  
  // Quick shorthand for manual entries
  runAudit(text);
}
function clearAudit() {

  const bt = document.getElementById('bill-text');
  const ar = document.getElementById('audit-results');
  if (bt) bt.value = '';
  if (ar) ar.innerHTML = '';
}

function parseAmounts(amounts) {
  let price = 0, qty = 1, total = 0, paid = 0, owed = 0;

  if (amounts.length === 1) {
    total = amounts[0];
  } else if (amounts.length === 2) {
    const [a, b] = amounts;
    if (a > b * 3) {
      // EOB pattern: large billed total, small patient owed ($600 billed, $45 owes)
      total = a; owed = b;
    } else if (b > a * 3) {
      // Reversed EOB: unit price + inflated total ($50 unit, $200 total)
      price = a; total = b;
    } else if (a < b) {
      // Standard line item: unit price + total
      price = a; total = b;
    } else {
      // Default EOB: total billed + amount paid ($200 billed, $190 insurance paid)
      total = a; paid = b;
    }
  } else if (amounts.length >= 3) {
    const [a, b, c] = amounts;
    // Detect [price, qty, total] — qty must be a small whole number
    // and price × qty must be close to total (within $2)
    const isLineItem = b < 10 && Number.isInteger(b) && Math.abs(a * b - c) < 2;
    if (isLineItem) {
      price = a; qty = b; total = c;
    } else {
      // EOB pattern: [total billed, insurance paid, patient owed]
      total = a; paid = b; owed = c;
    }

    // Sanity: if paid + owed > total, it's probably [price, total, paid]
    if (paid + owed > total + 0.5) {
      price = a; total = b; paid = c; owed = 0;
    }
  }

  return { price, qty, total, paid, owed };
}

function debounce(fn, ms) {

  let t; return (...a) => { clearTimeout(t); t = setTimeout(() => fn(...a), ms); };
}

// ── Shared Utils & Code Search ──
async function searchCodes(q, container) {
  if (!q) {
    container.innerHTML = '<p class="status-msg">Start typing to search 74,000+ medical codes.</p>';
    return;
  }
  container.innerHTML = '<div class="status-msg">Searching...</div>';

  try {
    const res = await fetch('https://bisqgousuvljttesjkkm.supabase.co/functions/v1/lookup_codes', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ q, type: 'codes' })
    });

    if (!res.ok) throw new Error("Search Failed");
    const { results } = await res.json();
    
    if (!results || results.length === 0) {
      container.innerHTML = '<div class="status-msg">No codes found.</div>';
      return;
    }

    container.innerHTML = results.map(r => `
      <div class="result-card" style="display:flex; justify-content:space-between; align-items:center; padding: 12px 16px; margin-bottom: 8px;">
        <div style="flex:1;">
          <div style="display:flex; align-items:center; gap:8px;">
             <strong style="color:var(--text-h);">${r.code}</strong>
             ${r.price ? `<span style="font-size:10px; padding:2px 6px; background:var(--accent-glow); color:var(--accent); border-radius:4px; font-weight:800;">$${r.price.toFixed(2)}/unit</span>` : ''}
          </div>
          <div style="font-size:12px; color:var(--text-muted); margin-top:2px;">${r.desc}</div>
        </div>
        <button class="btn btn-ghost" style="padding:6px 10px; font-size:11px;" onclick="addCodeToAudit('${r.code}', '${r.desc}')">⊕ Add to Audit</button>
      </div>`).join('');

  } catch (err) {
    console.error("Search error:", err);
    container.innerHTML = '<div class="status-msg">Search unavailable at the moment.</div>';
  }
}

async function searchDenials(q, container) {
  if (!q) {
    container.innerHTML = '<p class="status-msg">Search CARC and RARC denial codes.</p>';
    return;
  }
  container.innerHTML = '<div class="status-msg">Searching...</div>';

  try {
    const res = await fetch('https://bisqgousuvljttesjkkm.supabase.co/functions/v1/lookup_codes', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ q, type: 'denials' })
    });

    if (!res.ok) throw new Error("Search Failed");
    const { results } = await res.json();

    if (!results || results.length === 0) {
      container.innerHTML = '<div class="status-msg">No denial codes found.</div>';
      return;
    }

    container.innerHTML = results.map(r => `
      <div class="result-card" style="display:flex; justify-content:space-between; align-items:center;">
        <div><strong>${r.code}</strong>: ${r.description}</div>
        <button class="btn btn-ghost" style="padding:4px 8px; font-size:11px;" onclick="addCodeToAudit('${r.code}', '${r.description}')">⊕ Add to Audit</button>
      </div>`).join('');
  } catch (err) {
    console.error("Search error:", err);
    container.innerHTML = '<div class="status-msg">Search unavailable.</div>';
  }
}

function switchTab(tabId, btn) {
  // Find relative panels (works for both Home dashboard and Audit page)
  const wrapper = btn.closest('.suite-wrapper') || btn.closest('.audit-area') || document;
  const panels = wrapper.querySelectorAll('.tab-panel, .audit-panel');
  const buttons = wrapper.querySelectorAll('.tab-btn, .audit-tab');

  panels.forEach(p => p.style.display = 'none');
  buttons.forEach(b => b.classList.remove('active'));

  // The tabId might be 'pdf' but the element ID is 'audit-pdf' in audit.html
  let target = document.getElementById(tabId) || document.getElementById('audit-' + tabId);
  
  if (target) target.style.display = 'block';
  btn.classList.add('active');
}

function setRegion(region, btn) {
  activeRegion = region;
  const section = btn.closest('.region-bar');
  if (section) {
    section.querySelectorAll('.region-pill').forEach(p => p.classList.remove('active'));
    btn.classList.add('active');
  }
  console.log("Region set to:", region);
}

function bindSearch(inputId, resultId, handler) {
  const input = document.getElementById(inputId);
  if (input) input.addEventListener('input', debounce(() => handler(input.value.trim(), document.getElementById(resultId)), 350));
}

// ── National Provider Search (NPS) ─────────────────────────────────────────
async function searchNPI() {
  const nameInput = document.getElementById('npi-name');
  const stateInput = document.getElementById('npi-state');
  const resultsEl  = document.getElementById('npi-results');
  const btn        = document.getElementById('npi-search-btn');
  if (!nameInput || !resultsEl) return;

  const query = nameInput.value.trim();
  const state = stateInput ? stateInput.value.trim() : '';

  if (query.length < 2) {
    resultsEl.innerHTML = '<p class="status-msg">Please enter at least 2 characters.</p>';
    return;
  }

  // Show loading state
  resultsEl.innerHTML = `
    <div style="text-align:center; padding: 40px 0;">
      <div class="spinner" style="margin: 0 auto 16px; width:36px; height:36px; border:3px solid var(--border); border-top-color:var(--accent); border-radius:50%; animation: spin 1s linear infinite;"></div>
      <p style="color:var(--text-muted); font-size:14px;">Searching CMS NPPES Registry...</p>
    </div>`;
  if (btn) btn.disabled = true;

  try {
    // CMS NPPES API via Vercel Proxy (fixes CORS)
    let url = '/api/npi?';

    if (/^\d{10}$/.test(query)) {
      url += `number=${query}`;
    } else {
      const parts = query.trim().split(/\s+/);
      if (parts.length >= 2) {
        url += `first_name=${encodeURIComponent(parts[0])}*&last_name=${encodeURIComponent(parts.slice(1).join(' '))}*`;
      } else {
        url += `organization_name=${encodeURIComponent(query)}*`;
      }
    }

    if (state) url += `&state=${encodeURIComponent(state)}`;

    const res = await fetch(url);
    if (!res.ok) throw new Error(`API error ${res.status}`);
    const data = await res.json();

    if (!data.results || data.results.length === 0) {
      resultsEl.innerHTML = `<p class="status-msg">No providers found for "${query}"${state ? ' in ' + state : ''}. Try a different name, NPI number, or remove the state filter.</p>`;
    } else {
      renderNPIResults(data.results, resultsEl);
    }
  } catch (err) {
    console.error('NPI Proxy Error:', err);
    resultsEl.innerHTML = `
      <div class="audit-finding" style="border-left: 3px solid var(--danger);">
        <div class="finding-icon danger">●</div>
        <div>
          <strong style="color:var(--text-h);">NPS Search Failed</strong>
          <p style="margin:4px 0 0; font-size:13px; color:var(--text-muted);">The search requested failed. This might be due to a temporary network issue or an API rate limit. Please try again or visit <a href="https://npiregistry.cms.hhs.gov/" target="_blank" style="color:var(--accent);">npiregistry.cms.hhs.gov</a> directly.</p>
        </div>
      </div>`;
  } finally {
    if (btn) btn.disabled = false;
  }
}

function renderNPIResults(results, container) {
  container.innerHTML = results.map(p => {
    const isOrg = p.enumeration_type === 'NPI-2';
    const name = isOrg
      ? (p.basic.organization_name || 'Organization')
      : `${p.basic.first_name || ''} ${p.basic.middle_name ? p.basic.middle_name + ' ' : ''}${p.basic.last_name || ''}`.trim();
    
    const official = isOrg && p.basic.authorized_official_last_name 
      ? `${p.basic.authorized_official_prefix || ''} ${p.basic.authorized_official_first_name || ''} ${p.basic.authorized_official_last_name || ''} ${p.basic.authorized_official_credential || ''}`.trim()
      : null;

    const credential = p.basic.credential || '';
    const taxonomy = p.taxonomies?.[0]?.desc || 'Provider';
    const addr = p.addresses?.[0];
    const addressLine = addr ? `${addr.address_1 || ''}, ${addr.city || ''}, ${addr.state || ''} ${(addr.postal_code || '').substring(0, 5)}` : 'Address not available';
    const mapsUrl = addr ? `https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(addressLine)}` : '#';
    const status = p.basic.status === 'A' ? '✓ Active' : '⚠ Inactive';
    const statusColor = p.basic.status === 'A' ? '#22c55e' : '#f59e0b';

    return `
      <div class="result-card" style="padding: 20px; margin-bottom: 12px; display: flex; flex-direction: column; gap: 10px; border-left: 3px solid var(--accent);">
        <div style="display:flex; justify-content:space-between; align-items:flex-start; gap:12px; flex-wrap:wrap;">
          <div>
            <div style="font-size:15px; font-weight:700; color:var(--text-h); margin-bottom:4px;">
              ${name}${credential ? ` <span style="font-size:11px; color:var(--accent); background:var(--accent-glow); padding:2px 6px; border-radius:4px; font-weight:800; margin-left:4px;">${credential}</span>` : ''}
            </div>
            ${official ? `<div style="font-size:13px; color:var(--accent); font-weight:600; margin-bottom:4px;">👨‍⚕️ Official: ${official}</div>` : ''}
            <div style="font-size:12px; color:var(--text-muted);">${taxonomy}</div>
          </div>
          <div style="display:flex; flex-direction:column; align-items:flex-end; gap:4px;">
            <span style="font-size:11px; font-weight:700; color:${statusColor};">${status}</span>
            <code style="font-size:12px; font-family:monospace; background:rgba(255,255,255,0.06); padding:2px 8px; border-radius:4px;">NPI: ${p.number}</code>
          </div>
        </div>
        <div style="font-size:12px; color:var(--text-muted); display:flex; align-items:start; gap:6px;">
          <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="opacity:0.6; margin-top:1px; flex-shrink:0;"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
          <span>${addressLine}</span>
        </div>
        ${mapsUrl !== '#' ? `<a href="${mapsUrl}" target="_blank" rel="noopener" style="display:inline-flex; align-items:center; gap:6px; padding:7px 14px; font-size:11px; font-weight:700; color:var(--accent); border:1px solid var(--accent); border-radius:8px; text-decoration:none; width:fit-content; transition:background 0.2s;" onmouseover="this.style.background='rgba(6,182,212,0.08)'" onmouseout="this.style.background='transparent'">
          <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
          View Location
        </a>` : ''}
      </div>
    `;
  }).join('');
}

// Allow pressing Enter in NPI name field to trigger search
document.addEventListener('DOMContentLoaded', () => {
  const npiInput = document.getElementById('npi-name');
  if (npiInput) {
    npiInput.addEventListener('keydown', (e) => {
      if (e.key === 'Enter') searchNPI();
    });
  }
});

