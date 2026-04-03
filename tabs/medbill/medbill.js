// CPT code regex (5-digits optionally followed by a 2-char modifier)
const CPT_REGEX = /\b(\d{5})([-]?[A-Z0-9]{2})?\b/g;
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
      const modifier = match[2] ? match[2].replace('-', '') : null;
      
      // Look for a dollar amount on the same line
      let charge = null;
      const dMatch = DOLLAR_REGEX.exec(line);
      if (dMatch) {
         charge = parseFloat(dMatch[1]);
      }
      
      results.push({ code, modifier, charge, rawLine: line.trim() });
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

function renderAuditResults(findings) {
  const container = document.getElementById('audit-results');
  container.classList.remove('hidden');
  
  if (findings.length === 0) {
    container.innerHTML = '<div class="empty-state">No CPT medical codes found in your text.</div>';
    return;
  }
  
  let totalCharged = 0;
  let totalMedicare = 0;
  
  let html = '<div class="results-list">';
  
  findings.forEach(item => {
    const priceInfo = item.code && cptData ? cptData[item.code] : null;
    
    let medicarePriceDisplay = 'N/A';
    let flagBadge = '';
    
    if (priceInfo) {
      const medicarePrice = priceInfo.non_facility_price;
      medicarePriceDisplay = `$${medicarePrice.toFixed(2)}`;
      
      if (item.charge) {
        totalCharged += item.charge;
        totalMedicare += medicarePrice;
        
        const flag = flagOvercharge(item.charge, medicarePrice);
        flagBadge = `<span class="code-tag" style="background-color: ${flag.color}20; color: ${flag.color}; margin-left: auto;">${flag.flag}</span>`;
      }
    }
    
    html += `
      <div class="result-card" style="flex-direction: column;">
        <div style="display: flex; width: 100%; align-items: center;">
          <span class="code-val">${item.code}${item.modifier ? '-' + item.modifier : ''}</span>
          ${flagBadge}
        </div>
        <div class="result-desc">${priceInfo ? priceInfo.description : 'Unknown medical code'}</div>
        <div style="display: flex; justify-content: space-between; margin-top: 8px; font-size: 12px; border-top: 1px solid var(--border-light); padding-top: 8px; width: 100%;">
          <span><b>Charged:</b> ${item.charge ? '$'+item.charge.toFixed(2) : '---'}</span>
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
      <div style="background: var(--bg-secondary); border: 1px solid var(--border-light); border-radius: 8px; padding: 12px; margin-bottom: 12px; text-align: center;">
        <div style="font-size: 11px; color: var(--text-muted); text-transform: uppercase; font-weight: 600;">Estimated Discrepancy</div>
        <div style="font-size: 24px; font-weight: 600; color: ${isOver ? '#dc2626' : '#16a34a'}; margin: 4px 0;">
          ${isOver ? '+' : ''}$${overcharge.toFixed(2)}
        </div>
        <div style="font-size: 12px; color: var(--text-muted);">
          Billed: $${totalCharged.toFixed(2)} vs Medicare: $${totalMedicare.toFixed(2)}
        </div>
      </div>
      <button class="primary-btn" id="mock-dispute-btn" style="width: 100%; margin-bottom: 16px; background-color: var(--text-main);">Generate PDF Dispute Letter ($9)</button>
    `;
    html = headerHtml + html;
  }
  
  container.innerHTML = html;

  // Add click listener to mock dispute
  const mockBtn = document.getElementById('mock-dispute-btn');
  if (mockBtn) {
    mockBtn.addEventListener('click', () => {
      alert("Mock Premium Feature: This would launch the jsPDF dispute letter generator and payment gateway.");
    });
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
