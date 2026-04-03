const RXNAV_BASE = 'https://rxnav.nlm.nih.gov/REST';

async function searchDrug(name) {
  try {
    const cacheKey = `rx_${name.toLowerCase()}`;
    const cached = await new Promise(resolve => chrome.storage.local.get(cacheKey, resolve));
    if (cached[cacheKey]) return cached[cacheKey];

    // 1. Get RxNorm concept ID
    const approxRes = await fetch(`${RXNAV_BASE}/approximateTerm.json?term=${encodeURIComponent(name)}&maxEntries=5`);
    const approx = await approxRes.json();
    
    const candidates = approx.approximateGroup?.candidate || [];
    if (!candidates.length) return { found: false };
    
    const rxcui = candidates[0].rxcui;
    
    // 2. Get properties
    const propsRes = await fetch(`${RXNAV_BASE}/rxcui/${rxcui}/property.json?propName=RxNorm+Name`);
    const details = await propsRes.json();
    
    const properName = details.propConceptGroup?.propConcept?.[0]?.propValue || name;
    
    const result = {
      found: true,
      rxcui,
      name: properName,
      costPlusPrice: null, // Note: We'd load cost_plus CSV here in real build
      outboundUrl: `https://www.goodrx.com/${encodeURIComponent(name.toLowerCase())}`
    };

    // Save to cache
    chrome.storage.local.set({ [cacheKey]: result });
    return result;
  } catch (error) {
    console.error("RxNav API Error:", error);
    return { found: false, error: true };
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const searchInput = document.getElementById('rx-search-input');
  const resultsContainer = document.getElementById('rx-results');
  
  let debounceTimer;
  
  searchInput.addEventListener('input', (e) => {
    clearTimeout(debounceTimer);
    const query = e.target.value.trim();
    
    if (query.length < 3) {
      resultsContainer.innerHTML = '';
      return;
    }
    
    resultsContainer.innerHTML = '<div class="empty-state">Searching national databases...</div>';
    
    debounceTimer = setTimeout(async () => {
      const result = await searchDrug(query);
      
      if (!result.found) {
        resultsContainer.innerHTML = `
          <div class="empty-state" style="color: var(--text-muted);">
            No drug found matching "${query}".
          </div>`;
        return;
      }
      
      let shortageAlert = '';
      const queryLower = query.toLowerCase();
      // Dummy logic for shortage alert
      if (queryLower.includes('amoxicillin') || queryLower.includes('adderall') || queryLower.includes('lisdexamfetamine')) {
        shortageAlert = `
          <div style="background: #fff7ed; border-left: 3px solid #ea580c; padding: 8px; font-size: 11px; color: #9a3412; margin-top: 8px; border-radius: 0 4px 4px 0;">
            <strong>⚠️ National Shortage Alert:</strong> The FDA is currently tracking a shortage for this medication. Availability may vary by pharmacy.
          </div>
        `;
      }
      
      const goodRxUrl = `https://www.goodrx.com/${encodeURIComponent(queryLower)}`;
      const costPlusUrl = `https://costplusdrugs.com/medications/`; 
      const amazonUrl = `https://pharmacy.amazon.com/`;
      const singleCareUrl = `https://www.singlecare.com/prescription/${encodeURIComponent(queryLower)}`;
      const drugsComUrl = `https://www.drugs.com/price-guide/${encodeURIComponent(queryLower)}`;

      resultsContainer.innerHTML = `
        <div class="result-card" style="flex-direction: column;">
          <div style="font-weight: 600; font-size: 15px;">${result.name}</div>
          <div style="font-size: 12px; color: var(--text-muted); margin-top: 4px;">RXCUI: ${result.rxcui}</div>
          ${shortageAlert}
          
          <div style="margin-top: 12px; padding: 12px; background: var(--bg-primary); border-radius: 8px; border: 1px solid var(--border-light); width: 100%; box-sizing: border-box;">
            <div style="font-size: 12px; font-weight: 600; margin-bottom: 8px;">Compare Free Prices</div>
            <div style="display: flex; flex-direction: column; gap: 8px; width: 100%;">
              <a href="${goodRxUrl}" target="_blank" class="primary-btn" style="width: 100%; box-sizing: border-box; text-align: center; text-decoration: none; padding: 10px; font-size: 13px; background: #004d40;">GoodRx ↗</a>
              <a href="${costPlusUrl}" target="_blank" class="primary-btn" style="width: 100%; box-sizing: border-box; text-align: center; text-decoration: none; padding: 10px; font-size: 13px; background: #0f172a;">Cost Plus Drugs ↗</a>
              <a href="${amazonUrl}" target="_blank" class="primary-btn" style="width: 100%; box-sizing: border-box; text-align: center; text-decoration: none; padding: 10px; font-size: 13px; background: #0284c7;">Amazon Pharmacy ↗</a>
              <a href="${singleCareUrl}" target="_blank" class="primary-btn" style="width: 100%; box-sizing: border-box; text-align: center; text-decoration: none; padding: 10px; font-size: 13px; background: #ea580c;">SingleCare ↗</a>
              <a href="${drugsComUrl}" target="_blank" class="primary-btn" style="width: 100%; box-sizing: border-box; text-align: center; text-decoration: none; padding: 10px; font-size: 13px; background: #475569;">Drugs.com ↗</a>
            </div>
          </div>
          
          <div style="font-size: 10px; color: var(--text-muted); margin-top: 10px; text-align: center;">
            Disclaimer: Prices are reference only and vary by location and insurance.
          </div>
        </div>
      `;
    }, 600);
  });
});
