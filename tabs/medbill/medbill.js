const INLINE_BENCHMARK = {
  '99202': { price: 93.15,   desc: 'Office visit, new, low complexity' },
  '99203': { price: 134.24,  desc: 'Office visit, new, moderate complexity' },
  '99204': { price: 192.61,  desc: 'Office visit, new, moderate-high complexity' },
  '99205': { price: 244.01,  desc: 'Office visit, new, high complexity' },
  '99211': { price: 22.68,   desc: 'Office visit, established, minimal' },
  '99212': { price: 54.59,   desc: 'Office visit, established, low complexity' },
  '99213': { price: 92.81,   desc: 'Office visit, established, low-moderate' },
  '99214': { price: 134.39,  desc: 'Office visit, established, moderate complexity' },
  '99215': { price: 185.87,  desc: 'Office visit, established, high complexity' },
  '99221': { price: 74.82,   desc: 'Initial hospital care, low complexity (Facility)' },
  '99222': { price: 104.91,  desc: 'Initial hospital care, moderate complexity (Facility)' },
  '99223': { price: 154.63,  desc: 'Initial hospital care, high complexity (Facility)' },
  '99231': { price: 40.12,   desc: 'Subsequent hospital care, low complexity (Facility)' },
  '99232': { price: 62.18,   desc: 'Subsequent hospital care, moderate complexity (Facility)' },
  '99233': { price: 84.55,   desc: 'Subsequent hospital care, high complexity (Facility)' },
  '99283': { price: 65.40,   desc: 'ED visit, moderate severity (Facility)' },
  '99284': { price: 112.15,  desc: 'ED visit, high severity (Facility)' },
  '99285': { price: 178.42,  desc: 'ED visit, high severity/high risk (Facility)' },
  '99291': { price: 184.20,  desc: 'Critical care, first 30-74 min (Facility)' },
  '93000': { price: 16.58,   desc: 'Electrocardiogram with report (ECG)' },
  '93010': { price: 11.21,   desc: 'ECG interpretation and report' },
  '85025': { price: 7.27,    desc: 'Complete blood count (CBC) with auto diff' },
  '36415': { price: 3.09,    desc: 'Venipuncture (blood draw)' },
};

/** Precise NCCI Pairs for Simple Tab parity */
const NCCI_PAIRS = {
  '36415': new Set(['99202','99203','99204','99205','99211','99212','99213','99214','99215','99221','99222','99223','99281','99282','99283','99284','99285']),
  '94760': new Set(['99202','99203','99204','99205','99211','99212','99213','99214','99215']),
  '85025': new Set(['80048', '80053','99202','99203','99204','99205','99211','99212','99213','99214','99215']),
  '99070': new Set(['10000','12001','27447','27130','43239','45378','69210']),
};

/** Frequency Rules (MUE) for Simple Tab */
const MUE_LIMITS = {
  '90837': 1, '99214': 1, '99215': 1, '36415': 1, '94760': 1, '93000': 1,
};

const DRG_BASE_RATE = 10000;
const DRG_BENCHMARKS = {
  '470': { weight: 1.5,  desc: 'Major Joint Replacement' },
  '193': { weight: 0.9,  desc: 'Simple Pneumonia' },
  '392': { weight: 0.7,  desc: 'Esophagitis / Digestive Disorders' },
  '291': { weight: 1.1,  desc: 'Heart Failure' },
};

async function loadCPTData() {
  try {
    const res = await fetch('../../data/cpt_medicare_prices.json');
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    cptData = await res.json();
  } catch (err) {
    console.warn("Using inline benchmarks (offline fallback).");
  }
}

function getBenchmark(code) {
  if (cptData && cptData[code]) return { price: cptData[code].non_facility_price, desc: cptData[code].description };
  return INLINE_BENCHMARK[code] || null;
}

function isValidCPT(code) {
  const n = parseInt(code, 10);
  return n >= 10000 && n <= 99999;
}

function extractCodesWithCharges(text) {
  const lines = text.split('\n');
  const results = [];
  
  const codeRegex    = /\b([1-9]\d{4}|[1-9]\d{2})(?:-([A-Z0-9]{2}))?\b/g;
  const dollarRegex  = /\$\s*(\d+(?:\.\d{2})?)/g;
  const dateRegex    = /\b(\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4})\b/g;

  lines.forEach(line => {
    const dates = line.match(dateRegex);
    const codesOnLine = [...line.matchAll(codeRegex)]
      .map(m => ({
        code: m[1],
        modifier: m[2] || null,
        charge: null,
        date: dates ? dates[0] : 'UNDATED',
        isDRG: m[1].length === 3,
        rawLine: line.trim()
      }))
      // Elite Fix: Filter 5-digit codes that aren't in CPT range (ZIPs/Phone noise)
      .filter(it => it.isDRG || isValidCPT(it.code));

    const dollarsOnLine = [...line.matchAll(dollarRegex)].map(m => parseFloat(m[1]));

    codesOnLine.forEach((item, idx) => {
      if (dollarsOnLine[idx] !== undefined) {
        item.charge = dollarsOnLine[idx];
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
  container.classList.remove('hidden');
  
  if (findings.length === 0) {
    container.innerHTML = '<div class="empty-state">No CPT/DRG medical codes found in your text.</div>';
    return;
  }
  
  // Rule Registry
  const dupMap = {};
  const freqMap = {};
  findings.forEach(f => {
    const key = `${f.date}|${f.code}`;
    if (f.code && !f.isDRG) {
      dupMap[key] = (dupMap[key] || 0) + 1;
      freqMap[key] = (freqMap[key] || 0) + 1;
    }
  });

  let totalCharged = 0;
  let totalMedicare = 0;
  let html = '<div class="results-list">';
  
  findings.forEach((item, index) => {
    let priceInfo = null;
    let medicarePrice = 0;
    
    if (item.isDRG) {
      const db = DRG_BENCHMARKS[item.code] || { weight:1, desc: 'Hospital Service' };
      priceInfo = { desc: db.desc, price: DRG_BASE_RATE * db.weight };
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
        flagBadge = `<span class="code-tag" style="background-color: ${flag.color}20; color: ${flag.color}; margin-left: auto;">${flag.flag}</span>`;
        chargeDisplay = `$${item.charge.toFixed(2)}`;
      } else {
        chargeDisplay = `<input type="number" class="inline-price-input" data-index="${index}" placeholder="Price $" step="0.01">`;
      }
    } else {
      chargeDisplay = '---';
    }

    // Advanced Rule Logic (Sync with audit.js v3.4)
    let warningsHtml = '';
    
    // 1. Duplicates (Date-aware)
    const dKey = `${item.date}|${item.code}`;
    if (!item.isDRG && dupMap[dKey] > 1) {
      warningsHtml += `<div class="upcode-warning" style="background:#fee2e2; border-color:#fecaca;"><strong>Duplicate Alert:</strong> Multiple entries for ${item.code} on ${item.date}.</div>`;
    }

    // 2. NCCI Bundling
    if (!item.isDRG && NCCI_PAIRS[item.code]) {
      const pSet = NCCI_PAIRS[item.code];
      const hasPrimary = findings.some(other => other !== item && other.date === item.date && pSet.has(other.code));
      if (hasPrimary) {
        warningsHtml += `<div class="upcode-warning" style="background:#ffedd5; border-color:#fed7aa;"><strong>Bundling Alert:</strong> This service is typically included in the primary visit.</div>`;
      }
    }

    // 3. Frequency Limits (MUE)
    const limit = MUE_LIMITS[item.code];
    if (limit && freqMap[dKey] > limit) {
      warningsHtml += `<div class="upcode-warning" style="background:#fee2e2; border-color:#fecaca;"><strong>Frequency Error:</strong> Billed ${freqMap[dKey]}×. US guidelines limit CPT ${item.code} to ${limit}/day.</div>`;
    }

    // 4. E&M Upcoding
    if (item.code === '99214' || item.code === '99215' || item.code === '99285') {
       warningsHtml += `<div class="upcode-warning"><strong>Upcoding Risk:</strong> High-complexity visit level. Verify documentation supports duration.</div>`;
    }
    
    html += `
      <div class="result-card" style="flex-direction: column;">
        <div style="display: flex; width: 100%; align-items: center;">
          <span class="code-val">${item.code}${item.modifier ? '-' + item.modifier : ''}</span>
          ${flagBadge}
        </div>
        <div class="result-desc">${priceInfo ? priceInfo.desc : 'Unknown medical code'}</div>
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
      const csvLines = ['Code,Modifier,Description,Billed,Benchmark'];
      latestFindings.forEach(item => {
        const pInfo = item.isDRG ? { desc: 'Hospital', price: DRG_BASE_RATE } : getBenchmark(item.code);
        csvLines.push(`${item.code},${item.modifier || ''},"${(pInfo?.desc||'').replace(/"/g,'')}",${item.charge || 0},${pInfo?.price || 0}`);
      });
      const blob = new Blob([csvLines.join('\n')], { type: 'text/csv' });
      const url = URL.createObjectURL(blob);
      const a = Object.assign(document.createElement('a'), { href: url, download: 'MediHelp_Basic_Audit.csv' });
      a.click();
  });

  document.getElementById('full-audit-link')?.addEventListener('click', () => {
    const text = document.getElementById('paste-area').value;
    localStorage.setItem('mh_pending_audit', text);
    window.location.href = 'audit.html?action=advanced';
  });
}

function handleInlinePrice(e) {
  const val = parseFloat(e.target.value);
  if (!isNaN(val)) {
    latestFindings[e.target.dataset.index].charge = val;
    renderAuditResults(latestFindings);
  }
}

document.addEventListener('DOMContentLoaded', () => {
  loadCPTData();
  const pasteArea = document.getElementById('paste-area');
  const auditBtn = document.getElementById('audit-btn');
  if (auditBtn) {
    auditBtn.addEventListener('click', () => {
      if (!pasteArea.value.trim()) return;
      document.querySelector('.audit-mode').style.display = 'none';
      renderAuditResults(extractCodesWithCharges(pasteArea.value));
    });
  }
});
