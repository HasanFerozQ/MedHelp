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


function extractCodesWithCharges(text) {
  const lines = text.split('\n');
  const results = [];
  
  // Scoped regex to avoid global flag issues and lastIndex pollution
  const cptRegex = /\b(\d{5})(?:-([A-Z0-9]{2}))?\b/g;
  const dollarRegex = /\$\s*(\d+(?:\.\d{2})?)/g;

  lines.forEach(line => {
    // 1. Find all CPT codes on this line
    const cptsOnLine = [...line.matchAll(cptRegex)].map(m => ({
      code: m[1],
      modifier: m[2] || null,
      charge: null,
      rawLine: line.trim()
    }));

    // 2. Find all dollar amounts on this line
    const dollarsOnLine = [...line.matchAll(dollarRegex)].map(m => parseFloat(m[1]));

    // 3. Map amounts to codes (1-to-1 if possible, otherwise first-available)
    cptsOnLine.forEach((item, idx) => {
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
  if (ratio > 3.0) return { flag: 'EXTREME', color: '#dc2626' }; // Red
  if (ratio > 2.0) return { flag: 'HIGH', color: '#ea580c' }; // Orange
  if (ratio > 1.5) return { flag: 'MODERATE', color: '#ca8a04' }; // Yellow
  return { flag: 'FAIR', color: '#16a34a' }; // Green
}

let latestFindings = [];

function renderAuditResults(findings) {
  latestFindings = findings; 
  const container = document.getElementById('audit-results');
  container.classList.remove('hidden');
  
  if (findings.length === 0) {
    container.innerHTML = '<div class="empty-state">No CPT medical codes found in your text.</div>';
    return;
  }
  
  // Basic Rule Engine for Simple Tab
  const dupMap = {};
  findings.forEach(f => { if (f.code) dupMap[f.code] = (dupMap[f.code] || 0) + 1; });

  let totalCharged = 0;
  let totalMedicare = 0;
  let html = '<div class="results-list">';
  
  findings.forEach((item, index) => {
    const priceInfo = getBenchmark(item.code);
    let medicarePriceDisplay = 'N/A';
    let flagBadge = '';
    let chargeDisplay = '';
    
    if (priceInfo) {
      const medicarePrice = priceInfo.price;
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

    // Rules
    let warningsHtml = '';
    if (item.modifier === '59') {
      warningsHtml += `<div class="upcode-warning"><strong>Modifier -59:</strong> High unbundling risk. Ensure this service was truly separate.</div>`;
    }
    if (item.code && dupMap[item.code] > 1) {
      warningsHtml += `<div class="upcode-warning" style="background:#fee2e2; border-color:#fecaca;"><strong>Duplicate:</strong> This code appears multiple times in your text.</div>`;
    }
    if (item.code === '99214' || item.code === '99215') {
      warningsHtml += `<div class="upcode-warning"><strong>Upcoding Risk:</strong> ${item.code} is frequently overbilled for short visits.</div>`;
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
          <span><b>Charged:</b> ${chargeDisplay}</span>
          <span><b>Medicare:</b> ${medicarePriceDisplay}</span>
        </div>
      </div>
    `;
  });
  
  html += '</div>';
  
  // Add Gamified Header
  if (totalCharged > 0 && totalMedicare > 0) {
    const overcharge = totalCharged - totalMedicare;
    const isOver = overcharge > 0;
    const headerHtml = `
      <div style="background: var(--bg-secondary); border: 1px solid var(--border-light); border-radius: 12px; padding: 12px; margin-bottom: 12px; text-align: center; box-shadow: 0 2px 4px rgba(0,0,0,0.02);">
        <div style="font-size: 11px; color: var(--text-muted); text-transform: uppercase; font-weight: 600;">Estimated Discrepancy</div>
        <div style="font-size: 28px; font-weight: 700; color: ${isOver ? '#dc2626' : '#16a34a'}; margin: 4px 0;">
          ${isOver ? '+' : ''}$${overcharge.toFixed(2)}
        </div>
        <div style="font-size: 13px; color: var(--text-muted);">
          Billed: $${totalCharged.toFixed(2)} vs Medicare: $${totalMedicare.toFixed(2)}
        </div>
      </div>
      <div style="display: flex; gap: 8px; margin-bottom: 16px;">
        <button class="primary-btn" id="export-csv-btn" style="flex: 1; background-color: var(--bg-primary); color: var(--tint-teal); border: 1px solid var(--tint-teal);">Export to CSV</button>
        <button class="primary-btn" id="mock-dispute-btn" style="flex: 1; background-color: var(--text-main);">Dispute Letter ($9)</button>
      </div>
    `;
    html = headerHtml + html;
  }
  
  container.innerHTML = html;

  // Listeners for inline inputs
  document.querySelectorAll('.inline-price-input').forEach(input => {
    input.addEventListener('blur', handleInlinePrice);
    input.addEventListener('keydown', (e) => {
      if (e.key === 'Enter') handleInlinePrice(e);
    });
  });

  const exportBtn = document.getElementById('export-csv-btn');
  if (exportBtn) {
    exportBtn.addEventListener('click', () => {
      const csvLines = ['Code,Modifier,Description,Charged,Medicare_Price'];
      latestFindings.forEach(item => {
        const priceInfo = item.code && cptData ? cptData[item.code] : null;
        let p = priceInfo ? priceInfo.non_facility_price : 0;
        let desc = priceInfo ? `"${priceInfo.description.replace(/"/g, '""')}"` : '"Unknown"';
        csvLines.push(`${item.code},${item.modifier || ''},${desc},${item.charge || 0},${p}`);
      });
      const csvStr = csvLines.join('\n');
      const blob = new Blob([csvStr], { type: 'text/csv' });
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = 'MediHelp_Now_Audit.csv';
      a.click();
      URL.revokeObjectURL(url);
    });
  }

  const mockBtn = document.getElementById('mock-dispute-btn');
  if (mockBtn) {
    mockBtn.addEventListener('click', () => {
      alert("Mock Premium Feature: This would launch the jsPDF dispute letter generator and payment gateway.");
    });
  }
}

function handleInlinePrice(e) {
  const val = parseFloat(e.target.value);
  if (!isNaN(val)) {
    const idx = e.target.dataset.index;
    latestFindings[idx].charge = val;
    renderAuditResults(latestFindings);
  }
}

document.addEventListener('DOMContentLoaded', () => {
  loadCPTData();
  
  const pasteArea = document.getElementById('paste-area');
  const auditBtn = document.getElementById('audit-btn');
  
  auditBtn.addEventListener('click', () => {
    const text = pasteArea.value;
    if (!text.trim()) return;
    
    // Switch UI view
    document.querySelector('.audit-mode').style.display = 'none';
    
    const findings = extractCodesWithCharges(text);
    renderAuditResults(findings);
  });
});
