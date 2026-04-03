// CPT code regex (5-digits optionally followed by a dashed 2-char modifier)
const CPT_REGEX = /\b(\d{5})(?:-([A-Z0-9]{2}))?\b/g;
// Regex to catch dollar amounts optionally nearby
const DOLLAR_REGEX = /\$\s*(\d+(?:\.\d{2})?)/g;

let cptData = null;

async function loadCPTData() {
  try {
    const response = await fetch('../../data/cpt_medicare_prices.json');
    cptData = await response.json();
  } catch (error) {
    console.error("Failed to load CPT prices:", error);
  }
}

function extractCodesWithCharges(text) {
  const lines = text.split('\n');
  const results = [];
  
  lines.forEach(line => {
    // Reset regex index
    CPT_REGEX.lastIndex = 0;
    DOLLAR_REGEX.lastIndex = 0;
    
    let match;
    while ((match = CPT_REGEX.exec(line)) !== null) {
      const code = match[1];
      const modifier = match[2] || null;
      // Push the discovered code without a charge initially
      results.push({ code, modifier, charge: null, rawLine: line.trim() });
    }
    
    // Look for a dollar amount on this line
    const dMatch = DOLLAR_REGEX.exec(line);
    if (dMatch) {
      const charge = parseFloat(dMatch[1]);
      // Assign the dollar amount to the latest CPT code that doesn't have a charge yet
      for (let i = results.length - 1; i >= 0; i--) {
        if (results[i].charge === null) {
          results[i].charge = charge;
          break;
        }
      }
    }
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
  latestFindings = findings; // Store for inline updates
  const container = document.getElementById('audit-results');
  container.classList.remove('hidden');
  
  if (findings.length === 0) {
    container.innerHTML = '<div class="empty-state">No CPT medical codes found in your text.</div>';
    return;
  }
  
  let totalCharged = 0;
  let totalMedicare = 0;
  
  let html = '<div class="results-list">';
  
  findings.forEach((item, index) => {
    const priceInfo = item.code && cptData ? cptData[item.code] : null;
    
    let medicarePriceDisplay = 'N/A';
    let flagBadge = '';
    let chargeDisplay = '';
    
    if (priceInfo) {
      const medicarePrice = priceInfo.non_facility_price;
      medicarePriceDisplay = `$${medicarePrice.toFixed(2)}`;
      
      if (item.charge !== null) {
        totalCharged += item.charge;
        totalMedicare += medicarePrice;
        
        const flag = flagOvercharge(item.charge, medicarePrice);
        flagBadge = `<span class="code-tag" style="background-color: ${flag.color}20; color: ${flag.color}; margin-left: auto;">${flag.flag}</span>`;
        chargeDisplay = `$${item.charge.toFixed(2)}`;
      } else {
        // Fallback inline input for missing prices
        chargeDisplay = `<input type="number" class="inline-price-input" data-index="${index}" placeholder="Price $" step="0.01">`;
      }
    } else {
      chargeDisplay = '---';
    }

    // Upcoding warning
    let upcodeWarningHtml = '';
    if (item.code === '99214' || item.code === '99215') {
      upcodeWarningHtml = `
        <div class="upcode-warning">
          <strong>Upcoding Alert:</strong> ${item.code} is a high-severity code. Hospitals often use this to overcharge for simple 10-minute visits. Ensure your visit actually required complex medical decision making.
        </div>
      `;
    }
    
    html += `
      <div class="result-card" style="flex-direction: column;">
        <div style="display: flex; width: 100%; align-items: center;">
          <span class="code-val">${item.code}${item.modifier ? '-' + item.modifier : ''}</span>
          ${flagBadge}
        </div>
        <div class="result-desc">${priceInfo ? priceInfo.description : 'Unknown medical code'}</div>
        ${upcodeWarningHtml}
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
      a.download = 'MedHelp_Audit.csv';
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
