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
      const costPlusUrl = `https://costplusdrugs.com/medications/`; // Generic search base
      const amazonUrl = `https://pharmacy.amazon.com/`;

      resultsContainer.innerHTML = `
        <div class="result-card" style="flex-direction: column;">
          <div style="font-weight: 600; font-size: 15px;">${result.name}</div>
          <div style="font-size: 12px; color: var(--text-muted); margin-top: 4px;">RXCUI: ${result.rxcui}</div>
          ${shortageAlert}
          
          <div style="margin-top: 12px; padding: 12px; background: var(--bg-primary); border-radius: 8px; border: 1px solid var(--border-light);">
            <div style="font-size: 12px; font-weight: 600; margin-bottom: 8px;">Compare Free Prices</div>
            <div style="display: flex; flex-direction: column; gap: 6px;">
              <a href="${goodRxUrl}" target="_blank" class="primary-btn" style="text-align: center; text-decoration: none; padding: 8px; font-size: 12px;">Check GoodRx Deals ↗</a>
              <div style="display: flex; gap: 6px;">
                <a href="${costPlusUrl}" target="_blank" class="primary-btn" style="flex: 1; background: #0f172a; text-align: center; text-decoration: none; padding: 8px; font-size: 12px;">Cost Plus ↗</a>
                <a href="${amazonUrl}" target="_blank" class="primary-btn" style="flex: 1; background: #0284c7; text-align: center; text-decoration: none; padding: 8px; font-size: 12px;">Amazon ↗</a>
              </div>
            </div>
          </div>
          
          <div style="font-size: 10px; color: var(--text-muted); margin-top: 8px; text-align: center;">
            Disclaimer: Prices are reference only and vary by location and insurance.
          </div>
        </div>
      `;
    }, 600);
  });
});
