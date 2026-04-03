const RXNAV_BASE = 'https://rxnav.nlm.nih.gov/REST';

async function searchDrug(name) {
  try {
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
    
    return {
      found: true,
      rxcui,
      name: properName,
      costPlusPrice: null, // Note: We'd load cost_plus CSV here in real build
      outboundUrl: `https://www.goodrx.com/${encodeURIComponent(name.toLowerCase())}`
    };
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
      
      resultsContainer.innerHTML = `
        <div class="result-card" style="flex-direction: column;">
          <div style="font-weight: 600; font-size: 15px;">${result.name}</div>
          <div style="font-size: 12px; color: var(--text-muted); margin-top: 4px;">RXCUI: ${result.rxcui}</div>
          
          <div style="margin-top: 12px; padding: 12px; background: var(--bg-primary); border-radius: 6px; border: 1px solid var(--border-light);">
            <div style="font-size: 12px; font-weight: 500; margin-bottom: 8px;">Compare Prices</div>
            <a href="${result.outboundUrl}" target="_blank" class="primary-btn" style="display: block; text-align: center; text-decoration: none; padding: 8px;">Check GoodRx Deals ↗</a>
          </div>
          
          <div style="font-size: 10px; color: var(--text-muted); margin-top: 8px; text-align: center;">
            Disclaimer: Prices are reference only and vary by location and insurance.
          </div>
        </div>
      `;
    }, 600);
  });
});
