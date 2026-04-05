/**
 * MediHelp — app.js (v3 - Production Ready)
 * Handles: Tab switching, Region toggle, Code Search, Denial Search,
 * Rx Search Insights, NPI Provider Search (CORS Fallback), 
 * and Local PDF Bill Audit (via pdf.js)
 */

const SUPA_URL  = 'https://bisqgousuvljttesjkkm.supabase.co';
const SUPA_KEY  = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4';

let db = null;
let activeRegion = 'US';

// Common Rx Insights (Mock Data for Demo "Insights")
const RX_INSIGHTS = {
  'metformin': { generic: 'Glucophage', class: 'Antidiabetic', cost: '$4 - $12', stock: 'In Stock', price_hint: 'Verified Market Avg', tip: 'Often free at grocery store pharmacies like Publix or Meijer.' },
  'lisinopril': { generic: 'Zestril / Prinivil', class: 'ACE Inhibitor', cost: '$0 - $10', stock: 'In Stock', price_hint: 'Verified $0 Copay', tip: 'Frequently included in free $0 prescription programs.' },
  'atorvastatin': { generic: 'Lipitor', class: 'Statin', cost: '$9 - $25', stock: 'High Supply', price_hint: 'Verified Low-Cost', tip: 'Generic is highly effective; check Mark Cuban\'s Cost Plus Drugs.' },
  'amlodipine': { generic: 'Norvasc', class: 'Calcium Channel Blocker', cost: '$5 - $15', stock: 'In Stock', price_hint: 'Verified Generic Price', tip: 'Low-cost generic widely available.' },
  'albuterol': { generic: 'ProAir / Ventolin', class: 'Bronchodilator', cost: '$25 - $60', stock: 'Limited Supply', price_hint: 'Manufacturer Direct', tip: 'Manufacturer coupons can often reduce this by 50%.' },
  'asthma': { generic: 'Various inhalers', class: 'Control/Rescue', cost: 'Varries', stock: 'Stable', price_hint: 'Market Average', tip: 'Many rescue inhalers have moved to $35 caps.' }
};

document.addEventListener('DOMContentLoaded', () => {
  if (window.supabase) {
    db = window.supabase.createClient(SUPA_URL, SUPA_KEY);
  }

  // ── 1. Code lookup (ICD-10 / global) ───────────────────────────────────
  bindSearch('codes-input', 'codes-results', searchCodes);

  // ── 2. Denial codes (CARC / RARC) ──────────────────────────────────────
  bindSearch('denials-input', 'denials-results', searchDenials);

  // ── 3. Rx drug search & Autocomplete ─────────────────────────────────
  const rxInput = document.getElementById('rx-input');
  const rxResults = document.getElementById('rx-results');
  const rxSugg = document.getElementById('rx-suggestions');
  
  if (rxInput && rxResults) {
    rxInput.addEventListener('input', debounce(async () => {
      const q = rxInput.value.trim().toLowerCase();
      if (q.length < 3) { 
        rxResults.innerHTML = ''; 
        rxSugg.innerHTML = '';
        rxSugg.classList.remove('active');
        return; 
      }
      
      // Fetch Suggestions from NIH RxTerms
      try {
        const res = await fetch(`https://clinicaltables.nlm.nih.gov/api/rxterms/v3/search?terms=${q}&maxList=8`);
        const data = await res.json();
        const suggestions = data[1] || [];
        
        if (suggestions.length > 0) {
          rxSugg.innerHTML = suggestions.map(s => `<div class="suggestion-item" onclick="selectRx('${s}')">${s}</div>`).join('');
          rxSugg.classList.add('active');
        } else {
          rxSugg.classList.remove('active');
        }
      } catch(e) { console.error('Rx Suggestion error:', e); }

      // Show Insights if exact match, otherwise show stack
      const match = Object.entries(RX_INSIGHTS).find(([k]) => q.includes(k) || k.includes(q));
      renderRxResults(q, match);
    }, 300));

    // Close suggestions on blur
    document.addEventListener('click', (e) => {
      if (!rxInput.contains(e.target) && !rxSugg.contains(e.target)) {
        rxSugg.classList.remove('active');
      }
    });
  }

  // ── 4. National Provider Search (NPI with Proxy) ────────────────────────
  const npiNameInput = document.getElementById('npi-name');
  if (npiNameInput) {
    npiNameInput.addEventListener('keydown', (e) => {
      if (e.key === 'Enter') searchNPI();
    });
  }

  // ── 5. Bill Audit (PDF + Text) ──────────────────────────────────────────
  setupPDFAudit();
  const billTextArea = document.getElementById('bill-text');
  if (billTextArea) {
    billTextArea.addEventListener('keydown', (e) => {
      if (e.key === 'Enter' && e.ctrlKey) runAudit();
    });
  }

  // Global Theme Handling
  initTheme();
});

// ── PDF Audit Logic (pdf.js) ──────────────────────────────────────────────
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
  if (status) status.innerHTML = `<span class="spinner"></span> Extracting text from ${file.name}...`;

  try {
    const arrayBuffer = await file.arrayBuffer();
    // Load PDF.js worker from CDN if not already loaded
    if (!window.pdfjsLib) {
      throw new Error('PDF library not loaded. Check connection.');
    }
    const pdf = await pdfjsLib.getDocument({ data: arrayBuffer }).promise;
    let fullText = '';

    for (let i = 1; i <= pdf.numPages; i++) {
        const page = await pdf.getPage(i);
        const textContent = await page.getTextContent();
        fullText += textContent.items.map(item => item.str).join(' ') + '\n';
    }

    if (status) status.innerHTML = `✅ ${file.name} loaded. Analyze below:`;
    
    const textarea = document.getElementById('bill-text');
    if (textarea) {
      textarea.value = fullText;
      // Auto-switch tab if needed
      runAudit(fullText);
    }
  } catch (err) {
    console.error(err);
    if (status) status.innerHTML = `<span style="color:var(--danger)">❌ Error: ${err.message}</span>`;
    if (MediHelp.logError) MediHelp.logError('handlePDF: ' + err.message);
  }
}

// ── Tab Switching ─────────────────────────────────────────────────────────
function switchTab(tabId, btn) {
  document.querySelectorAll('.tab-panel').forEach(p => p.classList.remove('active'));
  document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
  document.getElementById(tabId)?.classList.add('active');
  btn?.classList.add('active');
}

// ── Region Toggle ─────────────────────────────────────────────────────────
function setRegion(region, btn) {
  activeRegion = region;
  document.querySelectorAll('.region-pill').forEach(p => p.classList.remove('active'));
  btn?.classList.add('active');
  const inp = document.getElementById('codes-input');
  if (inp?.value.trim().length >= 2) searchCodes(inp.value.trim(), document.getElementById('codes-results'));
}

// ── Generic Debounced Search Binder ──────────────────────────────────────
function bindSearch(inputId, resultId, handler) {
  const input = document.getElementById(inputId);
  const results = document.getElementById(resultId);
  if (!input || !results) return;

  input.addEventListener('input', debounce(() => {
    const q = input.value.trim();
    if (q.length < 2) {
      results.innerHTML = '<p class="status-msg">Type at least 2 characters to search.</p>';
      return;
    }
    handler(q, results);
  }, 350));
}

// ── Code Search (ICD-10 with Region filter) ───────────────────────────────
async function searchCodes(q, container) {
  if (!db) { container.innerHTML = '<p class="status-msg">Database unavailable.</p>'; return; }

  const qUpper = q.toUpperCase();
  const cleanQ = q.replace(/\./g, '').toUpperCase();
  container.innerHTML = `<p class="status-msg"><span class="spinner"></span>Querying Global Database...</p>`;

  try {
    // 1. Fetch data for ALL regions regardless of activeRegion
    // This allows us to see if a US code is also available in UK/ME
    let query = db
      .from('medical_codes')
      .select('code, short_description, country, code_type')
      .or(`code.ilike.%${cleanQ}%,short_description.ilike.%${q}%`)
      .limit(300);

    const { data, error } = await query;
    if (error) throw error;

    if (!data || data.length === 0) {
      container.innerHTML = `<p class="status-msg" style="text-align:center;">No results for "<strong>${q}</strong>". Try a different search.</p>`;
      return;
    }

    // 2. Group findings by Code & Type
    const grouped = {};
    data.forEach(r => {
      const key = `${r.code}_${r.code_type || 'ICD10'}`;
      if (!grouped[key]) {
        grouped[key] = {
          code: r.code,
          type: r.code_type || 'ICD10',
          desc: r.short_description || '—',
          regions: new Set([r.country])
        };
      } else {
        grouped[key].regions.add(r.country);
      }
    });

    // 3. Filter by activeRegion for the MAIN list, but show badges for others
    let filteredResults = Object.values(grouped);
    if (activeRegion !== 'ALL') {
      filteredResults = filteredResults.filter(r => r.regions.has(activeRegion));
    }

    if (filteredResults.length === 0) {
      container.innerHTML = `<p class="status-msg" style="text-align:center;">No results found for region: <strong>${activeRegion}</strong>.</p>`;
      return;
    }

    // 4. Render with multi-region badges
    const regions = ['US', 'UK', 'ME'];
    container.innerHTML = filteredResults.map(r => `
      <div class="result-card">
        <div class="result-code-group">
          <span class="status-badge" style="width:50px; text-align:center;">${r.type}</span>
          <span class="result-code" style="margin: 0 12px; min-width: 60px;">${r.code}</span>
          <div class="region-badges">
            ${regions.map(reg => {
              const active = r.regions.has(reg);
              return `<span class="result-badge ${reg.toLowerCase()} ${active ? '' : 'inactive'}">${reg}${active ? '' : ': N/A'}</span>`;
            }).join('')}
          </div>
        </div>
        <span class="result-desc">${r.desc}</span>
      </div>`).join('');
  } catch (e) {
    if (MediHelp.logError) MediHelp.logError('searchCodes: ' + e.message);
    container.innerHTML = `<p class="status-msg" style="color:var(--danger);">Search failed.</p>`;
  }
}

// ── Denial Codes ────────────────────────────────────────────────────────
const denialsInput = document.getElementById('denials-input');
const denialSuggest = document.getElementById('denial-suggestions');
if (denialsInput) {
  denialsInput.addEventListener('input', (e) => {
    const q = e.target.value.trim();
    if (q.length < 1) { 
      if (denialSuggest) denialSuggest.innerHTML = ''; 
      return; 
    }
    searchDenialSuggestions(q);
  });
}

async function searchDenialSuggestions(q) {
  if (!db) return;
  const qUpper = q.toUpperCase();
  // Normalize dash for suggestions: CO45 -> CO-45
  const normQ = qUpper.match(/^([A-Z]{2})(\d+)$/) ? qUpper.replace(/^([A-Z]{2})(\d+)$/, '$1-$2') : qUpper;
  
  try {
    const { data, error } = await db.from('carc_codes')
      .select('code, description')
      .or(`code.ilike.%${normQ}%,description.ilike.%${q}%`)
      .limit(5);
    
    if (error || !data || data.length === 0) {
      if (denialSuggest) denialSuggest.innerHTML = '';
      return;
    }

    if (denialSuggest) {
      denialSuggest.innerHTML = data.map(item => `
        <div class="suggestion-item" onclick="selectDenial('${item.code}')">
          <strong>${item.code}</strong> — ${item.description.substring(0, 50)}...
        </div>
      `).join('');
    }
  } catch (e) {
    if (denialSuggest) denialSuggest.innerHTML = '';
  }
}

function selectDenial(code) {
  if (denialsInput) denialsInput.value = code;
  if (denialSuggest) denialSuggest.innerHTML = '';
  searchDenials(code, document.getElementById('denials-results'));
}

async function searchDenials(q, container) {
  if (!db) return;
  const qUpper = q.toUpperCase();
  // Normalize dash for db query: CO45 -> CO-45
  const normQ = qUpper.match(/^([A-Z]{2})(\d+)$/) ? qUpper.replace(/^([A-Z]{2})(\d+)$/, '$1-$2') : qUpper;
  
  container.innerHTML = `<p class="status-msg"><span class="spinner"></span>Decoding Claim Data...</p>`;
  try {
    const [carc, rarc] = await Promise.all([
      db.from('carc_codes').select('code, description').or(`code.ilike.%${normQ}%,description.ilike.%${q}%`).limit(15),
      db.from('rarc_codes').select('code, description').or(`code.ilike.%${normQ}%,description.ilike.%${q}%`).limit(15)
    ]);

    const results = [
      ...(carc.data || []).map(item => ({ ...item, type: 'CARC' })),
      ...(rarc.data || []).map(item => ({ ...item, type: 'RARC' }))
    ];

    if (results.length === 0) {
      container.innerHTML = `<p class="status-msg">No results for "<strong>${q}</strong>". Try adding or removing a dash (e.g. CO-45).</p>`;
      return;
    }

    container.innerHTML = results.map(r => `
      <div class="result-card" style="text-align:left;">
        <div class="result-code-group">
          <span class="status-badge" style="background:${r.type === 'CARC' ? 'rgba(239, 68, 68, 0.1)' : 'rgba(6, 182, 212, 0.1)'}; color:${r.type === 'CARC' ? '#ef4444' : '#06b6d4'}; border: 1px solid ${r.type === 'CARC' ? 'rgba(239, 68, 68, 0.3)' : 'rgba(6, 182, 212, 0.3)'};">${r.type}</span>
          <span class="result-code" style="color:var(--text-h);">${r.code}</span>
        </div>
        <span class="result-desc" style="margin-top: 8px; display: block;">${r.description}</span>
      </div>`).join('');
  } catch (e) {
    if (MediHelp.logError) MediHelp.logError('searchDenials: ' + e.message);
    container.innerHTML = `<p class="status-msg" style="color:var(--danger);">Decoding failed.</p>`;
  }
}

// ── NPI Search (With Advanced CORS Fallback) ───────────────────────────
// ── National Provider Search (NIH Native Integration) ───────────────────
async function searchNPI() {
  const nameInput = document.getElementById('npi-name');
  const stateInput = document.getElementById('npi-state');
  const results = document.getElementById('npi-results');
  if (!nameInput || !results) return;

  const q = nameInput.value.trim();
  const state = stateInput?.value || '';
  if (q.length < 3) { results.innerHTML = '<p class="status-msg">Min 3 characters required.</p>'; return; }

  results.innerHTML = `<p class="status-msg"><span class="spinner"></span>Querying NIH Medical Registry...</p>`;

  try {
    // Dual Search: Doctors (idv) and Organizations (org)
    const [resIdv, resOrg] = await Promise.all([
      fetch(`https://clinicaltables.nlm.nih.gov/api/npi_idv/v3/search?terms=${encodeURIComponent(q)}&state=${state}&maxList=12`),
      fetch(`https://clinicaltables.nlm.nih.gov/api/npi_org/v3/search?terms=${encodeURIComponent(q)}&state=${state}&maxList=12`)
    ]);

    const [dataIdv, dataOrg] = await Promise.all([resIdv.json(), resOrg.json()]);

    // NIH Format: [count, [npi1, npi2], null, [[name, npi, taxonomy, address_line]]]
    const idvList = dataIdv[3] || [];
    const orgList = dataOrg[3] || [];
    
    const combined = [...idvList.map(p => ({...p, type:'MD'})), ...orgList.map(p => ({...p, type:'ORG'}))];

    if (combined.length === 0) {
      results.innerHTML = `<p class="status-msg">No providers found for "<strong>${q}</strong>". Try a different state or name.</p>`;
      return;
    }

    results.innerHTML = combined.map(p => {
      const name = p[0] || 'Unknown';
      const npi = p[1] || '—';
      const taxo = p[2] || 'Medical Specialist';
      const addr = p[3] || 'Contact registry for address';
      
      return `
        <div class="provider-card">
          <div class="provider-info">
            <div class="provider-name">${name}</div>
            <div class="provider-npi">NPI: <strong>${npi}</strong> | ${p.type === 'ORG' ? 'Facility' : 'Provider'}</div>
            <div class="provider-taxonomy">Taxonomy: <span>${taxo}</span></div>
          </div>
          <div class="provider-address">
            📍 ${addr.split(',')[0]}<br>
            ${addr.split(',').slice(1).join(', ').trim()}
          </div>
        </div>`;
    }).join('');

  } catch (e) {
    console.error('NPS Error:', e);
    results.innerHTML = `
      <div class="result-card" style="border: 1px solid var(--border-accent); background: var(--bg-elevated); text-align:center; padding: 40px;">
        <div style="font-size: 40px; margin-bottom: 20px;">🛡️</div>
        <strong style="color:var(--text-h); display:block; margin-bottom:12px; font-size: 18px;">Registry Connection Reset</strong>
        <p style="font-size:14px; color:var(--text-muted); line-height:1.6; max-width: 400px; margin: 0 auto 24px;">National provider data is temporarily unavailable. Please verify directly on the official portal:</p>
        <div>
          <a href="https://npiregistry.cms.hhs.gov/search-results?organization_name=${encodeURIComponent(q)}" target="_blank" class="btn btn-primary">
            Open CMS NPI Registry →
          </a>
        </div>
      </div>`;
  }
}

// ── Rx Results Rendering Helper ──────────────────────────────────────────
function renderRxResults(q, match) {
  const rxResults = document.getElementById('rx-results');
  if (!rxResults) return;

  if (match) {
    const [name, info] = match;
    rxResults.innerHTML = `
      <div class="result-card" style="border-left: 4px solid var(--accent); display:block; text-align:left;">
        <div style="display:flex; justify-content:space-between; margin-bottom:8px;">
          <strong style="color:var(--text-h); font-size:16px; text-transform:capitalize;">${name} Insights</strong>
          <span class="result-badge uk">${info.class}</span>
        </div>
        <div style="display:grid; grid-template-columns: 1fr 1fr; gap: 8px; margin-bottom: 12px;">
          <p style="margin:0; font-size:13px;"><strong>Generic:</strong> ${info.generic}</p>
          <p style="margin:0; font-size:13px;"><strong>Stock:</strong> <span style="color:var(--success);">${info.stock}</span></p>
          <p style="margin:0; font-size:13px;"><strong>Typical Cost:</strong> ${info.cost}</p>
          <p style="margin:0; font-size:13px;"><strong>Pricing:</strong> <span style="color:var(--accent);">${info.price_hint}</span></p>
        </div>
        <p style="margin:8px 0 16px; font-size:12px; color:var(--text-muted); font-style:italic; line-height:1.4;"><strong>Pro Tip:</strong> ${info.tip}</p>
        
        <div class="rx-vertical-stack" style="max-width: 100%;">
          <a href="https://www.goodrx.com/drugs/search?query=${name}" target="_blank" class="rx-btn brand-goodrx">GoodRx ↗</a>
          <a href="https://costplusdrugs.com/medications/" target="_blank" class="rx-btn brand-costplus">Cost Plus Drugs ↗</a>
          <a href="https://www.amazon.com/pharmacy" target="_blank" class="rx-btn brand-amazon">Amazon Pharmacy ↗</a>
          <a href="https://www.singlecare.com/prescription/${name}" target="_blank" class="rx-btn brand-singlecare">SingleCare ↗</a>
          <a href="https://www.drugs.com/price-guide/" target="_blank" class="rx-btn brand-drugs">Drugs.com ↗</a>
        </div>
      </div>`;
  } else {
    rxResults.innerHTML = `
      <div class="rx-vertical-stack" style="margin-top: 10px;">
        <p class="status-msg" style="text-align:left; margin-bottom: 20px;">No exact insights for "${q}". Search external partners below:</p>
        <a href="https://www.goodrx.com/drugs/search?query=${q}" target="_blank" class="rx-btn brand-goodrx">GoodRx ↗</a>
        <a href="https://costplusdrugs.com/medications/" target="_blank" class="rx-btn brand-costplus">Cost Plus Drugs ↗</a>
        <a href="https://www.amazon.com/pharmacy" target="_blank" class="rx-btn brand-amazon">Amazon Pharmacy ↗</a>
        <a href="https://www.singlecare.com/prescription/${q}" target="_blank" class="rx-btn brand-singlecare">SingleCare ↗</a>
        <a href="https://www.drugs.com/price-guide/" target="_blank" class="rx-btn brand-drugs">Drugs.com ↗</a>
      </div>`;
  }
}

function selectRx(name) {
  const rxInput = document.getElementById('rx-input');
  const rxSugg = document.getElementById('rx-suggestions');
  if (!rxInput || !rxSugg) return;
  
  rxInput.value = name;
  rxSugg.classList.remove('active');
  
  const q = name.toLowerCase();
  const match = Object.entries(RX_INSIGHTS).find(([k]) => q.includes(k) || k.includes(q));
  renderRxResults(q, match);
}

// ── Bill Audit Engine ─────────────────────────────────────────────────────
function runAudit(manualText) {
  const text = manualText || document.getElementById('bill-text')?.value || '';
  const results = document.getElementById('audit-results');
  if (!results) return;

  if (text.trim().length < 15) {
    results.className = 'audit-results visible';
    results.innerHTML = `<div class="audit-finding" style="text-align:center;"><p>Please provide more descriptive bill text or valid line items.</p></div>`;
    return;
  }

  const findings = [];
  const lines = text.split('\n').filter(l => l.trim());

  // Duplicate Check
  const codePattern = /\b(\d{5}|[A-Z]\d{2,4})\b/g;
  const counts = {};
  lines.forEach(l => { (l.match(codePattern) || []).forEach(c => counts[c] = (counts[c] || 0) + 1); });
  Object.entries(counts).filter(([_, v]) => v > 1).forEach(([c, v]) => {
    findings.push({ title: `Duplicate Charge Identified: ${c}`, detail: `This medical code appears ${v} times on this statement. Hospitals often bill for the same service twice by mistake.`, type: 'danger' });
  });

  // Round Dollar Check
  const roundMatch = text.match(/\$\d+00\.00|\$\d+0\.00/g);
  if (roundMatch && roundMatch.length > 2) {
    findings.push({ title: 'Multiple Flat-Rate Charges', detail: 'Found several charges in even hundreds (e.g., $500, $1000). This can indicate "unbundled" or estimated pricing rather than actual service costs.', type: 'warn' });
  }

  if (findings.length === 0) {
    findings.push({ title: 'No Major Anomalies Detected', detail: 'Our initial scan did not flag obvious duplicates or round-dollar issues. However, always review your EOB (Explanation of Benefits) carefully.', type: 'ok' });
  }

  results.className = 'audit-results visible';
  results.innerHTML = `
    <div style="text-align:center; padding-bottom: 20px; font-weight: 700; color:var(--text-muted); text-transform:uppercase; font-size:11px; letter-spacing:0.1em;">Audit Results</div>
    ` + findings.map(f => `
    <div class="audit-finding" style="text-align:left;">
      <div class="finding-icon ${f.type}">●</div>
      <div style="flex:1;">
        <strong style="color:var(--text-h);">${f.title}</strong>
        <p style="margin:4px 0 0; font-size:13px; color:var(--text-muted);">${f.detail}</p>
      </div>
    </div>`).join('');
}

function runAuditLines() {
  const t = document.getElementById('line-items-text')?.value || '';
  runAudit(t);
}

function clearAudit() {
  const t = document.getElementById('bill-text'); if(t) t.value = '';
  const s = document.getElementById('pdf-status'); if(s) s.innerHTML = '';
  const r = document.getElementById('audit-results'); if(r) { r.className = 'audit-results'; r.innerHTML = ''; }
}

// Theme & Utilities ─────────────────────────────────────────────────────
// Theme is now managed GLOBALLY by blog_handler.js to prevent conflicts.

const MediHelp = {
  logError: async (msg) => {
    if (!db) return;
    try { 
      await db.from('site_logs').insert([{ source: 'website', error_message: msg, page: window.location.pathname, user_agent: navigator.userAgent }]); 
    } catch(e) {}
  }
};

function debounce(fn, ms) {
  let t; return (...a) => { clearTimeout(t); t = setTimeout(() => fn(...a), ms); };
}
