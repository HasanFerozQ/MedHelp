/**
 * MediHelp — app.js
 * Handles: Tab switching, Region toggle, Code Search, Denial Search,
 * Rx Search redirect, NPI Provider Search, and Bill Audit logic
 */

const SUPA_URL  = 'https://bisqgousuvljttesjkkm.supabase.co';
const SUPA_KEY  = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpc3Fnb3VzdXZsanR0ZXNqa2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMDQzMTksImV4cCI6MjA5MDg4MDMxOX0.FSsHfe3gfXc9Ch9oYjcTXm69SS1U2O8JNQcw637Eyy4';

let db = null;
let activeRegion = 'US';

document.addEventListener('DOMContentLoaded', () => {
  if (window.supabase) {
    db = window.supabase.createClient(SUPA_URL, SUPA_KEY);
  }

  // ── Hook up all inputs ──────────────────────────────────────────────────

  // 1. Code lookup (ICD-10 / global)
  bindSearch('codes-input', 'codes-results', searchCodes);

  // 2. Denial codes (CARC / RARC)
  bindSearch('denials-input', 'denials-results', searchDenials);

  // 3. Rx drug search (redirect to GoodRx)
  const rxInput = document.getElementById('rx-input');
  if (rxInput) {
    rxInput.addEventListener('keydown', (e) => {
      if (e.key === 'Enter' && rxInput.value.trim()) {
        const drug = encodeURIComponent(rxInput.value.trim());
        window.open(`https://www.goodrx.com/drugs/search?query=${drug}`, '_blank');
      }
    });
    // Also show hint
    rxInput.addEventListener('input', () => {
      const hint = document.getElementById('rx-hint');
      if (hint) hint.style.display = rxInput.value.trim() ? 'block' : 'none';
    });
  }

  // 4. NPI name input — trigger on Enter
  const npiName = document.getElementById('npi-name');
  if (npiName) {
    npiName.addEventListener('keydown', (e) => {
      if (e.key === 'Enter') searchNPI();
    });
  }

  // 5. Bill audit paste
  const billText = document.getElementById('bill-text');
  if (billText) {
    billText.addEventListener('keydown', (e) => {
      if (e.key === 'Enter' && e.ctrlKey) runAudit();
    });
  }
});

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
  // Re-run current search if any
  const inp = document.getElementById('codes-input');
  if (inp?.value.trim().length >= 2) searchCodes(inp.value.trim(), document.getElementById('codes-results'));
}

// ── Generic Debounced Search Binder ──────────────────────────────────────
function bindSearch(inputId, resultId, handler) {
  const input   = document.getElementById(inputId);
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
  if (!db) { container.innerHTML = '<p class="status-msg">Database unavailable. Please refresh.</p>'; return; }

  const qUpper = q.toUpperCase();
  container.innerHTML = `<p class="status-msg"><span class="spinner"></span>Searching 74,000+ codes in ${activeRegion} dataset…</p>`;

  try {
    let query = db
      .from('medical_codes')
      .select('code, short_description, country')
      .or(`code.ilike.%${qUpper}%,short_description.ilike.%${q}%`)
      .limit(15);

    // Apply region filter unless ALL selected
    if (activeRegion !== 'ALL') {
      query = query.eq('country', activeRegion);
    }

    const { data, error } = await query;
    if (error) throw error;

    if (!data || data.length === 0) {
      // Fallback: search without region filter to let user know
      const { data: fallback } = await db
        .from('medical_codes')
        .select('code, short_description, country')
        .or(`code.ilike.%${qUpper}%,short_description.ilike.%${q}%`)
        .limit(5);

      if (fallback?.length > 0) {
        container.innerHTML = `<p class="status-msg" style="color:var(--warning);">No results in <strong>${activeRegion}</strong> dataset. Showing global results:</p>`;
        container.innerHTML += fallback.map(r => renderCodeCard(r)).join('');
      } else {
        container.innerHTML = `<p class="status-msg">No codes found for "<strong>${q}</strong>" in the ${activeRegion} dataset.</p>`;
      }
      return;
    }

    container.innerHTML = data.map(r => renderCodeCard(r)).join('');
  } catch (e) {
    MediHelp.logError('searchCodes: ' + e.message);
    container.innerHTML = `<p class="status-msg" style="color:var(--danger);">Search failed. Please try again.</p>`;
  }
}

function renderCodeCard(r) {
  const regionColors = { US: 'icd', UK: 'uk', ME: 'me' };
  const badge = regionColors[r.country] || 'icd';
  return `
    <div class="result-card">
      <span class="result-code">${r.code}</span>
      <span class="result-desc">${r.short_description || '—'}</span>
      <span class="result-badge ${badge}">${r.country || 'US'}</span>
    </div>`;
}

// ── Denial Code Search (CARC + RARC) ─────────────────────────────────────
async function searchDenials(q, container) {
  if (!db) { container.innerHTML = '<p class="status-msg">Database unavailable.</p>'; return; }

  const qUpper = q.toUpperCase();
  container.innerHTML = `<p class="status-msg"><span class="spinner"></span>Decoding denial codes…</p>`;

  try {
    const [carc, rarc] = await Promise.all([
      db.from('carc_codes').select('code, description').or(`code.ilike.%${qUpper}%,description.ilike.%${q}%`).limit(8),
      db.from('rarc_codes').select('code, description').or(`code.ilike.%${qUpper}%,description.ilike.%${q}%`).limit(8)
    ]);

    const results = [
      ...(carc.data || []).map(d => ({ ...d, type: 'CARC' })),
      ...(rarc.data || []).map(d => ({ ...d, type: 'RARC' }))
    ];

    if (results.length === 0) {
      container.innerHTML = `<p class="status-msg">No denial codes found for "<strong>${q}</strong>".</p>`;
      return;
    }

    container.innerHTML = results.map(r => `
      <div class="result-card">
        <span class="result-code">${r.code}</span>
        <span class="result-desc">${r.description || '—'}</span>
        <span class="result-badge ${r.type.toLowerCase()}">${r.type}</span>
      </div>`).join('');

  } catch (e) {
    MediHelp.logError('searchDenials: ' + e.message);
    container.innerHTML = `<p class="status-msg" style="color:var(--danger);">Search failed. Please try again.</p>`;
  }
}

// ── NPI Provider Search ───────────────────────────────────────────────────
async function searchNPI() {
  const nameInput  = document.getElementById('npi-name');
  const stateInput = document.getElementById('npi-state');
  const results    = document.getElementById('npi-results');
  if (!nameInput || !results) return;

  const q     = nameInput.value.trim();
  const state = stateInput?.value || '';

  if (q.length < 3) {
    results.innerHTML = '<p class="status-msg">Enter at least 3 characters to search.</p>';
    return;
  }

  results.innerHTML = `<p class="status-msg"><span class="spinner"></span>Querying CMS NPPES registry…</p>`;

  try {
    // Build NPI API URL — supports both NPI number and name
    let url = `https://npiregistry.cms.hhs.gov/api/?version=2.1&limit=10&pretty=true`;

    if (/^\d{10}$/.test(q)) {
      // 10-digit number → search by NPI
      url += `&number=${q}`;
    } else {
      // Split name into first/last
      const parts = q.split(/\s+/);
      if (parts.length >= 2) {
        url += `&first_name=${encodeURIComponent(parts[0])}&last_name=${encodeURIComponent(parts.slice(1).join(' '))}`;
      } else {
        url += `&organization_name=${encodeURIComponent(q)}`;
      }
      if (state) url += `&state=${state}`;
    }

    const res  = await fetch(url);
    const json = await res.json();
    const list = json.results || [];

    if (list.length === 0) {
      results.innerHTML = `<p class="status-msg">No providers found for "<strong>${q}</strong>". Try a different name or wider search.</p>`;
      return;
    }

    results.innerHTML = list.map(p => {
      const name = p.basic?.organization_name
        ? p.basic.organization_name
        : `${p.basic?.first_name || ''} ${p.basic?.middle_name ? p.basic.middle_name + ' ' : ''}${p.basic?.last_name || ''}`.trim();
      const specialty = p.taxonomies?.[0]?.desc || 'Unknown Specialty';
      const addr      = p.addresses?.[0];
      const addrStr   = addr ? `${addr.address_1}, ${addr.city}, ${addr.state} ${addr.postal_code}` : '—';
      const credential = p.basic?.credential || '';

      return `
        <div class="provider-card">
          <div style="display:flex; justify-content:space-between; align-items:start; gap:16px; flex-wrap:wrap;">
            <div>
              <div class="provider-name">${name}${credential ? `, ${credential}` : ''}</div>
              <div class="provider-npi">NPI: ${p.number}</div>
              <div class="provider-specialty">${specialty}</div>
            </div>
            <span class="result-badge icd" style="margin-top:4px;">${p.basic?.status === 'A' ? '✓ Active' : 'Inactive'}</span>
          </div>
          <div class="provider-address">📍 ${addrStr}</div>
        </div>`;
    }).join('');

  } catch (e) {
    MediHelp.logError('searchNPI: ' + e.message);
    results.innerHTML = `<p class="status-msg" style="color:var(--danger);">Provider search failed. The CMS registry may be temporarily unavailable. Try again shortly.</p>`;
  }
}

// ── Bill Audit Engine ─────────────────────────────────────────────────────
function runAudit() {
  const text    = document.getElementById('bill-text')?.value || '';
  const results = document.getElementById('audit-results');
  if (!results) return;

  if (text.trim().length < 10) {
    results.className = 'audit-results visible';
    results.innerHTML = `<div class="audit-finding">
      <div class="finding-icon warn">⚠️</div>
      <div><strong style="color:var(--text-h);">No Bill Detected</strong><p style="margin:4px 0 0; font-size:13px; color:var(--text-muted);">Please paste more text from your bill or EOB statement.</p></div>
    </div>`;
    return;
  }

  const findings = [];
  const lines    = text.split('\n').filter(l => l.trim());

  // Check 1: Duplicate Codes
  const codePattern = /\b(\d{5}|\d{2}[A-Z]\d{2}|[A-Z]\d{2}\.?\d{0,2})\b/g;
  const codeCounts  = {};
  lines.forEach(line => {
    const matches = line.match(codePattern) || [];
    matches.forEach(code => { codeCounts[code] = (codeCounts[code] || 0) + 1; });
  });
  const dupes = Object.entries(codeCounts).filter(([, count]) => count > 1);
  dupes.forEach(([code, count]) => {
    findings.push({ type: 'danger', icon: '🔴', title: `Possible Duplicate Charge: ${code}`, detail: `This code appears ${count} times. Duplicate billing for the same service on the same date is a common error worth verifying.` });
  });

  // Check 2: Round Dollar Amounts (potential flag)
  const dollarPattern = /\$(\d+)\.00/g;
  let dollarMatch;
  const roundDollars = [];
  while ((dollarMatch = dollarPattern.exec(text)) !== null) {
    const amount = parseInt(dollarMatch[1]);
    if (amount > 0 && amount % 100 === 0) roundDollars.push(`$${amount}.00`);
  }
  if (roundDollars.length >= 3) {
    findings.push({ type: 'warn', icon: '⚠️', title: 'Many Round-Dollar Charges Detected', detail: `Found ${roundDollars.length} charges in even round hundreds (${roundDollars.slice(0,3).join(', ')}…). This can sometimes indicate estimated or placeholder pricing — worth verifying against your EOB.` });
  }

  // Check 3: Look for common denial keywords
  const denialKeywords = ['denied', 'denial', 'not covered', 'non-covered', 'excluded', 'patient responsibility'];
  denialKeywords.forEach(kw => {
    if (text.toLowerCase().includes(kw)) {
      findings.push({ type: 'warn', icon: '⚠️', title: `Denial Indicator: "${kw}"`, detail: `Your bill contains the term "${kw}". Use our Claim Denials search to find out exactly why this was flagged.` });
    }
  });

  // Check 4: All-clear message
  if (findings.length === 0) {
    findings.push({ type: 'ok', icon: '✅', title: 'No Obvious Issues Found', detail: 'Our basic scan did not detect duplicate codes, round-dollar anomalies, or denial keywords. This does not guarantee your bill is error-free — consider a professional review for large amounts.' });
  }

  results.className = 'audit-results visible';
  results.innerHTML = `
    <div style="font-size:13px; font-weight:700; letter-spacing:0.1em; text-transform:uppercase; color:var(--text-muted); margin-bottom:20px;">
      Audit Complete — ${findings.length} Finding${findings.length !== 1 ? 's' : ''}
    </div>` +
    findings.map(f => `
      <div class="audit-finding">
        <div class="finding-icon ${f.type}" style="font-size:18px;">${f.icon}</div>
        <div style="flex:1;">
          <strong style="color:var(--text-h); font-size:15px;">${f.title}</strong>
          <p style="margin:6px 0 0; font-size:13px; color:var(--text-muted); line-height:1.6;">${f.detail}</p>
        </div>
      </div>`).join('');
}

function runAuditLines() {
  const linesText = document.getElementById('line-items-text')?.value || '';
  // Inject into the paste textarea and run
  const textarea = document.getElementById('bill-text');
  if (textarea) textarea.value = linesText;
  runAudit();
}

function clearAudit() {
  const t = document.getElementById('bill-text');
  if (t) t.value = '';
  const r = document.getElementById('audit-results');
  if (r) { r.className = 'audit-results'; r.innerHTML = ''; }
}

// ── Utility: Debounce ─────────────────────────────────────────────────────
function debounce(fn, ms) {
  let timer;
  return (...args) => {
    clearTimeout(timer);
    timer = setTimeout(() => fn(...args), ms);
  };
}
