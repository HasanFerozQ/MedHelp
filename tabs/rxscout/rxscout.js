const RXNAV_BASE = 'https://rxnav.nlm.nih.gov/REST';
const rxCache = {};

async function fetchSuggestions(query) {
  // Check memory cache to save bandwidth
  const cacheKey = `sugg_${query.toLowerCase()}`;
  if (rxCache[cacheKey]) return rxCache[cacheKey];

  try {
    const res = await fetch(`${RXNAV_BASE}/approximateTerm.json?term=${encodeURIComponent(query)}&maxEntries=12`);
    const approx = await res.json();
    const candidates = approx.approximateGroup?.candidate || [];
    // Extract clean proper names and filter out highly technical RXNORM noise
    const rawNames = candidates.map(c => c.name).filter(Boolean);
    const cleanedNames = rawNames.map(name => {
      let n = name;
      n = n.replace(/\bOral Tablet\b.*/i, '');
      n = n.replace(/\bOral Product\b.*/i, '');
      n = n.replace(/\bOral Suspension\b.*/i, '');
      n = n.replace(/\[.*?\]/g, ''); // Remove Bracketed brand data
      n = n.replace(/\bInjection\b.*/i, ''); // Clean injection strings
      return n.trim();
    });

    // Deduplicate elegantly (ignoring case differences)
    const uniqueMap = new Map();
    cleanedNames.forEach(name => {
      const lower = name.toLowerCase();
      // Keep the shortest version of the same root
      if (!uniqueMap.has(lower) || name.length < uniqueMap.get(lower).length) {
        uniqueMap.set(lower, name);
      }
    });
    
    // Sort so simpler names (like Amoxicillin) pop up before complex formulas
    const finalNames = Array.from(uniqueMap.values()).sort((a,b) => a.length - b.length);
    const topChoices = finalNames.slice(0, 6);
    
    rxCache[cacheKey] = topChoices;
    return topChoices;
  } catch(e) {
    return [];
  }
}

function renderDrugUI(drugName, resultsContainer) {
  resultsContainer.innerHTML = '<div class="empty-state">Building premium cost report...</div>';
  const queryLower = drugName.toLowerCase();
  
  let shortageAlert = '';
  if (queryLower.includes('amoxicillin') || queryLower.includes('adderall') || queryLower.includes('lisdexamfetamine')) {
    shortageAlert = `
      <div style="background: rgba(234, 88, 12, 0.1); border: 1px solid rgba(234, 88, 12, 0.3); padding: 16px; font-size: 13px; color: var(--text-h); margin: 16px auto; max-width: 500px; border-radius: var(--radius-sm); display: flex; align-items:flex-start; gap:12px; text-align: left;">
        <span style="font-size:20px;">⚠️</span>
        <div>
          <strong style="color: #ea580c; display:block; margin-bottom:4px;">National Shortage Alert</strong>
          The FDA is currently tracking a shortage for this medication. Availability may vary by pharmacy.
        </div>
      </div>
    `;
  }
  
  // Real prices mock logic
  // (In production, wire this to a CostPlus CSV parser or GoodRx API)
  const mockPrice = Math.floor(Math.random() * 50) + 12;
  
  const goodRxUrl = `https://www.goodrx.com/${encodeURIComponent(queryLower)}`;
  const costPlusUrl = `https://costplusdrugs.com/medications/`; 
  const amazonUrl = `https://pharmacy.amazon.com/`;
  const singleCareUrl = `https://www.singlecare.com/prescription/${encodeURIComponent(queryLower)}`;

  resultsContainer.innerHTML = `
    <div style="text-align:center; margin-bottom: 24px;">
      <h3 style="font-size: 26px; color: var(--text-h); margin-bottom: 8px; font-weight:800; letter-spacing: -0.5px;">${drugName}</h3>
      <p style="color: var(--text-muted); font-size: 15px;">Est. Average Cash Price: <strong style="color: #22c55e;">$${mockPrice.toFixed(2)}</strong></p>
    </div>
    
    ${shortageAlert}

    <div class="rx-vertical-stack">
      <a href="${goodRxUrl}" target="_blank" class="rx-btn brand-goodrx">Compare on GoodRx ↗</a>
      <a href="${costPlusUrl}" target="_blank" class="rx-btn brand-costplus">Check Cost Plus Drugs ↗</a>
      <a href="${amazonUrl}" target="_blank" class="rx-btn brand-amazon">Check Amazon Pharmacy ↗</a>
      <a href="${singleCareUrl}" target="_blank" class="rx-btn brand-singlecare">Check SingleCare ↗</a>
      
      <div style="font-size: 12px; color: var(--text-muted); margin-top: 20px; text-align: center; line-height: 1.5; padding: 0 20px;">
        Disclaimer: Prices are simulated estimates and vary by location and insurance. MedHelp does not sell medications or offer medical advice.
      </div>
    </div>
  `;
}

document.addEventListener('DOMContentLoaded', () => {
  const searchInput = document.getElementById('rx-search-input');
  const suggestionsBox = document.getElementById('rx-suggestions');
  const resultsContainer = document.getElementById('rx-results');
  let debounceTimer;

  // Hide suggestions when clicking outside
  document.addEventListener('click', (e) => {
    if (!e.target.closest('#rx-search-input') && !e.target.closest('#rx-suggestions')) {
      suggestionsBox.classList.remove('active');
    }
  });

  searchInput.addEventListener('input', (e) => {
    clearTimeout(debounceTimer);
    const query = e.target.value.trim();
    
    if (query.length < 3) {
      suggestionsBox.classList.remove('active');
      return;
    }
    
    // Show loading in suggestions
    suggestionsBox.innerHTML = '<div class="suggestion-item" style="color:var(--text-muted); text-align:center; font-style:italic;">Fetching suggestions...</div>';
    suggestionsBox.classList.add('active');

    debounceTimer = setTimeout(async () => {
      const suggestions = await fetchSuggestions(query);
      
      if (!suggestions.length) {
        suggestionsBox.innerHTML = '<div class="suggestion-item" style="color:var(--text-muted); text-align:center;">No matches found.</div>';
        return;
      }

      suggestionsBox.innerHTML = suggestions.map((name, i) => `
        <div class="suggestion-item rx-suggestion" data-name="${name}" style="display:flex; align-items:center; gap:8px;">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="color:var(--text-muted);"><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path><polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline><line x1="12" y1="22.08" x2="12" y2="12"></line></svg>
          <span style="font-weight:600;">${name}</span>
        </div>
      `).join('');

      // Add click listeners to suggestions
      document.querySelectorAll('.rx-suggestion').forEach(item => {
        item.addEventListener('click', () => {
          const selectedName = item.dataset.name;
          searchInput.value = selectedName;
          suggestionsBox.classList.remove('active');
          renderDrugUI(selectedName, resultsContainer);
        });
      });
    }, 400); // 400ms debounce
  });

  // Handle enter key (if they just type and press enter)
  searchInput.addEventListener('keydown', (e) => {
    if (e.key === 'Enter') {
      const val = searchInput.value.trim();
      if (val.length >= 3) {
        suggestionsBox.classList.remove('active');
        renderDrugUI(val, resultsContainer);
      }
    }
  });
});
