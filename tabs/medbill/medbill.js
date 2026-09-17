/** 
 * MediHelp — medbill.js (v4.0 Simple Tab)
 * Lightweight extractor for the landing page quick-audit.
 * Logic is synced with constants.js for engine parity.
 */

let cptData = null; // Fix: Explicit declaration (Issue #14)

async function loadCPTData() {
  try {
    const res = await fetch('../../data/cpt_medicare_prices.json');
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    cptData = await res.json();
  } catch (err) {
    console.warn("MediHelp: Using inline benchmarks (offline fallback).");
  }
}

function getBenchmark(code) {
  if (cptData && cptData[code]) return { price: cptData[code].non_facility_price, desc: cptData[code].description };
  // Access global constants published by constants.js
  const bench = (window.INLINE_BENCHMARK || {})[code];
  return bench ? { price: bench.price, desc: bench.desc } : null;
}

function extractCodesWithCharges(text) {
  const lines = text.split('\n');
  const results = [];
  
  const codeRegex    = /\b([1-9]\d{4}|[A-Z]\d{4})(?:-([A-Z0-9]{2}))?\b/g;
  const drgRegex     = /\b([1-9]\d{2})\b/g;
  const dollarRegex  = /\$\s*(\d+(?:\.\d{2})?)/g;
  const dateRegex    = /\b(\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4})\b/g;

  lines.forEach(line => {
    const dates = line.match(dateRegex);
    const cptHcpcs = [...line.matchAll(codeRegex)]
      .map(m => ({
        code: m[1],
        modifier: m[2] || null,
        qty: parseInt((line.match(/(?:qty|units?)[:\s]+(\d+)/i) || [null, '1'])[1], 10),
        charge: null,
        date: dates ? dates[0] : 'UNDATED',
        isDRG: m[1].length === 3 && !!((window.MH_CONSTANTS?.DRG_BENCHMARKS || {})[m[1]]),
        rawLine: line.trim()
      }))
      .filter(it => window.isValidCPT?.(it.code) || /^[A-Z]\d{4}$/.test(it.code) || /\d{5}/.test(it.code));

    const drgMatches = [...line.matchAll(drgRegex)]
      .map(m => m[1])
      .filter(code => !!((window.MH_CONSTANTS?.DRG_BENCHMARKS || {})[code]))
      .map(code => ({
        code,
        modifier: null,
        qty: parseInt((line.match(/(?:qty|units?)[:\s]+(\d+)/i) || [null, '1'])[1], 10),
        charge: null,
        date: dates ? dates[0] : 'UNDATED',
        isDRG: true,
        rawLine: line.trim()
      }));

    const codesOnLine = [...cptHcpcs, ...drgMatches];

    const dollarsOnLine = [...line.matchAll(dollarRegex)].map(m => ({
      value: parseFloat(m[1]),
      index: m.index || 0
    }));

    codesOnLine.forEach((item, idx) => {
      const codePos = (line.indexOf(item.code) >= 0 ? line.indexOf(item.code) : idx * 8);
      let nearest = null;
      dollarsOnLine.forEach((d) => {
        if (!Number.isFinite(d.value)) return;
        const dist = Math.abs(d.index - codePos);
        if (!nearest || dist < nearest.dist) nearest = { dist, value: d.value };
      });
      if (nearest) {
        item.charge = nearest.value;
      }
      results.push(item);
    });
  });
  
  return results;
}

function flagOvercharge(charged, medicare) {
  if (!charged || !medicare) return { flag: 'UNKNOWN', color: '#64748b' };
  const ratio = charged / medicare;
  if (ratio > 3.0) return { flag: 'EXTREME', color: '#dc2626' };
  if (ratio > 2.0) return { flag: 'HIGH', color: '#ea580c' };
  if (ratio > 1.5) return { flag: 'MODERATE', color: '#ca8a04' };
  return { flag: 'FAIR', color: '#16a34a' };
}

let latestFindings = [];

function renderAuditResults(findings) {
  latestFindings = findings; 
  const container = document.getElementById('audit-results');
  if (!container) return;
  container.classList.remove('hidden');
  
  if (findings.length === 0) {
    container.innerHTML = '<div class="empty-state">No valid medical codes found in your text.</div>';
    return;
  }
  
  // Rule Registry - Sync with MH_CONSTANTS
  const C = window.MH_CONSTANTS || {};
  const dupMap = {};
  const freqMap = {};
  findings.forEach(f => {
    const dKey = `${f.date}|${f.code}`;
    const key = `${f.date}|${f.code}|${f.modifier || ''}`;
    dupMap[key] = (dupMap[key] || 0) + 1;
    freqMap[dKey] = (freqMap[dKey] || 0) + (parseInt(f.qty) || 1);
  });

  let totalCharged = 0;
  let totalMedicare = 0;
  let html = '<div class="results-list">';
  
  findings.forEach((item, index) => {
    let priceInfo = null;
    let medicarePrice = 0;
    
    if (item.isDRG) {
      const db = (C.DRG_BENCHMARKS || {})[item.code] || { weight:1, desc: 'Hospital Service' };
      priceInfo = { desc: db.desc, price: (C.DRG_BASE_RATE || 10400) * db.weight };
    } else {
      priceInfo = getBenchmark(item.code);
    }

    let medicarePriceDisplay = 'N/A';
    let flagBadge = '';
    let chargeDisplay = '';
    
    if (priceInfo) {
      medicarePrice = priceInfo.price;
      medicarePriceDisplay = `$${medicarePrice.toFixed(2)}`;
      if (item.charge !== null) {
        totalCharged += item.charge;
        totalMedicare += medicarePrice;
        const flag = flagOvercharge(item.charge, medicarePrice);
        flagBadge = `<span class="code-tag flag-badge" data-index="${index}" style="background-color: ${flag.color}20; color: ${flag.color}; margin-left: auto;">${flag.flag}</span>`;
        chargeDisplay = `<span class="billed-display" data-index="${index}">$${item.charge.toFixed(2)}</span>`;
      } else {
        chargeDisplay = `<input type="number" class="inline-price-input" data-index="${index}" placeholder="Price $" step="0.01">`;
      }
    } else {
      chargeDisplay = '---';
    }

    let warningsHtml = '';
    const dKey = `${item.date}|${item.code}`;
    const key = `${item.date}|${item.code}|${item.modifier || ''}`;
    
    if (!item.isDRG && dupMap[key] > 1) {
      warningsHtml += `<div class="upcode-warning" style="background:#fee2e2; border-color:#fecaca;"><strong>Duplicate Alert:</strong> Multiple entries for ${item.code} detected on ${item.date}.</div>`;
    }

    const pSet = (C.NCCI_PAIRS || {})[item.code];
    if (!item.isDRG && pSet) {
      const hasPrimary = findings.some(other => other !== item && other.date === item.date && !!pSet[other.code]);
      if (hasPrimary) {
        warningsHtml += `<div class="upcode-warning" style="background:#ffedd5; border-color:#fed7aa;"><strong>Bundling Alert:</strong> This service is typically included in the primary visit or metabolic panel.</div>`;
      }
    }

    const limit = (C.MUE_LIMITS || {})[item.code];
    if (limit && freqMap[dKey] > limit) {
      warningsHtml += `<div class="upcode-warning" style="background:#fee2e2; border-color:#fecaca;"><strong>Frequency Limit:</strong> Billed ${freqMap[dKey]}× units. Medicare typically limits ${item.code} to ${limit}/day.</div>`;
    }

    if (window.isEMCode && window.isEMCode(item.code) && (item.code.endsWith('5') || item.code.endsWith('4'))) {
       warningsHtml += `<div class="upcode-warning"><strong>Review Required:</strong> High-complexity level. Verify documentation supports duration.</div>`;
    }
    
    html += `
      <div class="result-card" data-index="${index}" style="flex-direction: column;">
        <div style="display: flex; width: 100%; align-items: center;">
          <span class="code-val">${window.sanitizeText(item.code)}${item.modifier ? '-' + window.sanitizeText(item.modifier) : ''}</span>
          ${flagBadge}
        </div>
        <div class="result-desc">${priceInfo ? window.sanitizeText(priceInfo.desc) : 'Unknown medical code'}</div>
        ${warningsHtml}
        <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 8px; font-size: 12px; border-top: 1px solid var(--border-light); padding-top: 8px; width: 100%;">
          <span><b>Billed:</b> ${chargeDisplay}</span>
          <span><b>Benchmark:</b> ${medicarePriceDisplay}</span>
        </div>
      </div>
    `;
  });
  
  html += '</div>';
  
  if (totalCharged > 0 && totalMedicare > 0) {
    const overcharge = totalCharged - totalMedicare;
    const isOver = overcharge > 0;
    const headerHtml = `
      <div style="background: var(--bg-secondary); border: 1px solid var(--border-light); border-radius: 12px; padding: 12px; margin-bottom: 12px; text-align: center; box-shadow: 0 2px 4px rgba(0,0,0,0.02);">
        <div style="font-size: 11px; color: var(--text-muted); text-transform: uppercase; font-weight: 600;">System Audit Result</div>
        <div style="font-size: 28px; font-weight: 700; color: ${isOver ? '#dc2626' : '#16a34a'}; margin: 4px 0;">
          ${isOver ? '+' : ''}$${overcharge.toFixed(2)}
        </div>
        <div style="font-size: 13px; color: var(--text-muted);">
          Billed: $${totalCharged.toFixed(2)} | Benchmark: $${totalMedicare.toFixed(2)}
        </div>
      </div>
      <div style="display: flex; gap: 8px; margin-bottom: 24px; padding: 0 4px;">
        <button class="primary-btn" id="export-csv-btn" style="flex: 1; height: 42px; border-radius: 8px; background-color: var(--bg-primary); color: var(--text-main); border: 1px solid var(--border); font-size: 13px; font-weight: 600;">Download CSV</button>
        <button class="primary-btn" id="full-audit-link" style="flex: 2; height: 42px; border-radius: 8px; background-color: var(--text-main); color: #fff; border: none; font-size: 13px; font-weight: 700;">Start Advanced Audit</button>
      </div>
    `;
    html = headerHtml + html;
  }
  
  container.innerHTML = html;

  document.querySelectorAll('.inline-price-input').forEach(input => {
    input.addEventListener('blur', handleInlinePrice);
    input.addEventListener('keydown', (e) => { if (e.key === 'Enter') handleInlinePrice(e); });
  });

  document.getElementById('export-csv-btn')?.addEventListener('click', () => {
      const constants = window.MH_CONSTANTS || {};
      const csvLines = ['Code,Modifier,Description,Billed,Benchmark'];
      latestFindings.forEach(item => {
        const pInfo = item.isDRG ? { desc: 'Hospital', price: (constants.DRG_BASE_RATE || 10400) } : getBenchmark(item.code);
        csvLines.push(`${item.code},${item.modifier || ''},"${(pInfo?.desc||'').replace(/"/g,'')}",${item.charge || 0},${pInfo?.price || 0}`);
      });
      const blob = new Blob([csvLines.join('\n')], { type: 'text/csv' });
      const url = URL.createObjectURL(blob);
      const a = Object.assign(document.createElement('a'), { href: url, download: 'MediHelp_Basic_Audit.csv' });
      a.click();
  });

  document.getElementById('full-audit-link')?.addEventListener('click', () => {
    const text = document.getElementById('paste-area')?.value || '';
    sessionStorage.setItem('mh_pending_audit', text);
    window.location.href = '/medical-bill-audit?action=advanced';
  });
}

function handleInlinePrice(e) {
  const val = parseFloat(e.target.value);
  const idx = Number(e.target.dataset.index);
  if (!Number.isInteger(idx) || !latestFindings[idx]) return;
  if (!isNaN(val)) {
    const prev = Number(latestFindings[idx].charge);
    if (Number.isFinite(prev) && Math.abs(prev - val) < 0.001) return;
    latestFindings[idx].charge = val;

    const item = latestFindings[idx];
    const constants = window.MH_CONSTANTS || {};
    const benchmark = item.isDRG
      ? ((constants.DRG_BASE_RATE || 10400) * (((constants.DRG_BENCHMARKS || {})[item.code]?.weight) || 1))
      : (getBenchmark(item.code)?.price || null);

    const rowCard = document.querySelector(`.result-card[data-index="${idx}"]`);
    if (!rowCard) return;
    const billedInput = rowCard.querySelector(`.inline-price-input[data-index="${idx}"]`);
    if (billedInput) {
      const billedSpan = document.createElement('span');
      billedSpan.className = 'billed-display';
      billedSpan.dataset.index = String(idx);
      billedSpan.textContent = `$${val.toFixed(2)}`;
      billedInput.replaceWith(billedSpan);
    } else {
      const existing = rowCard.querySelector(`.billed-display[data-index="${idx}"]`);
      if (existing) existing.textContent = `$${val.toFixed(2)}`;
    }

    if (Number.isFinite(benchmark) && benchmark > 0) {
      const flag = flagOvercharge(val, benchmark);
      let badge = rowCard.querySelector(`.flag-badge[data-index="${idx}"]`);
      if (!badge) {
        const header = rowCard.querySelector('div');
        if (header) {
          badge = document.createElement('span');
          badge.className = 'code-tag flag-badge';
          badge.dataset.index = String(idx);
          badge.style.marginLeft = 'auto';
          header.appendChild(badge);
        }
      }
      if (badge) {
        badge.textContent = flag.flag;
        badge.style.backgroundColor = `${flag.color}20`;
        badge.style.color = flag.color;
      }
    }
  }
}

document.addEventListener('DOMContentLoaded', () => {
  loadCPTData();
  const pasteArea = document.getElementById('paste-area');
  const auditBtn = document.getElementById('audit-btn');
  if (auditBtn) {
    auditBtn.addEventListener('click', () => {
      if (!pasteArea.value.trim()) return;
      const results = extractCodesWithCharges(pasteArea.value);
      const modeEl = document.querySelector('.audit-mode');
      if (modeEl) modeEl.style.display = 'none';
      renderAuditResults(results);
    });
  }
});
