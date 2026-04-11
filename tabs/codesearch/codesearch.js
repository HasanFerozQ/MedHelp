let currentFilter = 'ALL';
let currentRegion = 'US'; // Default to US
let searchTimeout = null;

// Initialize
document.addEventListener('DOMContentLoaded', () => {
  setupEventListeners();
});

function setupEventListeners() {
  const searchInput = document.getElementById('code-search-input');
  const filterBtns = document.querySelectorAll('.filter-btn');
  const regionBtns = document.querySelectorAll('.region-pill');

  searchInput.addEventListener('input', (e) => {
    const query = e.target.value.trim();
    clearTimeout(searchTimeout);
    searchTimeout = setTimeout(() => {
      performSearch(query);
    }, 400); // 400ms debounce for network requests
  });

  filterBtns.forEach(btn => {
    btn.addEventListener('click', (e) => {
      filterBtns.forEach(b => b.classList.remove('active'));
      const clickedBtn = e.target;
      clickedBtn.classList.add('active');
      
      currentFilter = clickedBtn.dataset.filter;
      performSearch(searchInput.value.trim());
    });
  });

  regionBtns.forEach(btn => {
    btn.addEventListener('click', (e) => {
      regionBtns.forEach(b => b.classList.remove('active'));
      const clickedBtn = e.target;
      clickedBtn.classList.add('active');
      
      currentRegion = clickedBtn.dataset.region;
      performSearch(searchInput.value.trim());
    });
  });
}

async function performSearch(query) {
  const listContainer = document.getElementById('search-results-list');
  
  if (query.length < 2) {
    listContainer.innerHTML = '<div class="empty-state">Start typing to search instantly...</div>';
    return;
  }

  // Wait for dbClient if it's currently null (handles slow CDN/init race conditions)
  if (!window.dbClient) {
    console.log('Database client not ready, waiting...');
    for (let i = 0; i < 10; i++) {
        await new Promise(r => setTimeout(r, 100)); // Wait 100ms
        if (window.dbClient) break;
    }
  }

  if (!window.dbClient) {
    listContainer.innerHTML = '<div class="empty-state" style="color:var(--text-danger)">Database connection error. Please refresh.</div>';
    return;
  }

  const cleanQ = query.replace(/[\.\-\s]/g, '').toUpperCase();
  listContainer.innerHTML = '<div class="empty-state">Querying Global Registry...</div>';

  try {
    // 1. Handle NCCI Edits separately (check both comprehensive and component columns)
    if (currentFilter === 'NCCI') {
      const { data, error } = await window.dbClient
        .from('ncci_ptp_edits')
        .select('*')
        .or(`column1_code.eq.${cleanQ},column2_code.eq.${cleanQ}`)
        .limit(50);
        
      if (error) throw error;
      renderNCCIResults(data, cleanQ); // Pass query to highlight the match
      return;
    }

    const safeQuery = query.replace(/[",]/g, '');
    const isCodeLikely = /^[A-Z0-9.]+$/i.test(query.trim()) && query.trim().length < 10;
    const isPhrase = query.trim().includes(' ');

    let dbQuery = window.dbClient
      .from('medical_codes')
      .select('code, short_description, country, code_type');

    if (currentRegion !== 'ALL') {
      dbQuery = dbQuery.eq('country', currentRegion);
    }
    if (currentFilter !== 'ALL') {
      dbQuery = dbQuery.eq('code_type', currentFilter);
    }

    if (isCodeLikely && !isPhrase) {
      // Code-style search: match code prefix OR description contains the term
      dbQuery = dbQuery.or(`code.ilike.${cleanQ}%,short_description.ilike.%${safeQuery}%`);
    } else {
      // Phrase/word search
      const words = query.split(/\s+/).filter(w => w.length >= 2);
      if (words.length > 0) {
        // Match any word OR the full phrase — no quotes, no word-boundary tricks
        const wordFilters = words.map(w => `short_description.ilike.%${w}%`);
        const fullPhrase = `short_description.ilike.%${safeQuery}%`;
        dbQuery = dbQuery.or([...wordFilters, fullPhrase].join(','));
      } else {
        dbQuery = dbQuery.ilike('short_description', `%${safeQuery}%`);
      }
    }
    
    // NCCI already handled above, so we can skip the duplicate block if it existed

    const { data, error, status } = await dbQuery.limit(150);
    
    if (error) {
        console.error('Search error:', error);
        listContainer.innerHTML = `<div class="empty-state" style="color:var(--text-danger)">
            <strong>Database Error [${status}]:</strong> ${error.message || 'Unknown error'}<br>
            <span style="font-size:10px; opacity:0.7;">Query: ${cleanQ}</span>
        </div>`;
        return;
    }

    if (!data || data.length === 0) {
      renderResults([]);
      return;
    }

    // 3. Group by Code & Type
    const grouped = {};
    data.forEach(r => {
      const type = r.code_type || 'HCPCS';
      const key = `${r.code}_${type}`;
      if (!grouped[key]) {
        grouped[key] = {
          code: r.code,
          type: type,
          desc: r.short_description || '—',
          regions: new Set([r.country || 'US'])
        };
      } else {
        grouped[key].regions.add(r.country || 'US');
      }
    });

    // 4. (Deprecated client-side filters, kept as fallback)
    let finalResults = Object.values(grouped);

    // 6. Sort by relevance (exact match first)
    finalResults.sort((a, b) => {
      const aExact = a.code === cleanQ;
      const bExact = b.code === cleanQ;
      if (aExact && !bExact) return -1;
      if (bExact && !aExact) return 1;
      
      const aStarts = a.code.startsWith(cleanQ);
      const bStarts = b.code.startsWith(cleanQ);
      if (aStarts && !bStarts) return -1;
      if (bStarts && !aStarts) return 1;
      
      return a.code.localeCompare(b.code);
    });

    renderResults(finalResults);

  } catch(err) {
    console.error('Unexpected search failure:', err);
    listContainer.innerHTML = `<div class="empty-state" style="color:var(--text-danger)">Unexpected Error: ${err.message || 'Check connection'}</div>`;
  }
}

function renderResults(results) {
  const listContainer = document.getElementById('search-results-list');
  
  if (!results || results.length === 0) {
    listContainer.innerHTML = '<div class="empty-state">No matching codes found in database.</div>';
    return;
  }

  const regionList = ['US', 'UK', 'ME'];
  let html = '';
  
  results.forEach(item => {
    let tagClass = `tag-${item.type}`;
    let displayType = item.type.replace('ICD10', 'ICD-10');
    
    html += `
      <div class="result-card">
        <div class="result-main-area">
          <div class="result-header">
            <span class="code-val">${item.code}</span>
            <span class="code-tag ${tagClass}">${displayType}</span>
            <div class="region-badges">
              ${regionList.map(reg => {
                const active = item.regions.has(reg);
                return `<span class="reg-badge ${reg.toLowerCase()} ${active ? '' : 'inactive'}">${reg}${active ? '' : ': N/A'}</span>`;
              }).join('')}
            </div>
            <button class="copy-btn" data-code="${item.code}" title="Copy to clipboard">
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path></svg>
            </button>
          </div>
          <div class="result-desc">${item.desc}</div>
        </div>
      </div>
    `;
  });
  
  listContainer.innerHTML = html;
  attachCopyListeners();
}

function renderNCCIResults(results, queryCode) {
  const listContainer = document.getElementById('search-results-list');
  if (!results || results.length === 0) {
    listContainer.innerHTML = `<div class="empty-state">No NCCI bundling edits found for "${queryCode}".</div>`;
    return;
  }

  let html = `<div style="padding: 10px; font-size: 12px; color: var(--text-muted); border-bottom: 1px solid var(--border); margin-bottom: 12px;">
                Found labels where <strong>${queryCode}</strong> is either the Comprehensive or Component code.
              </div>`;
              
  results.forEach(item => {
    const isCol1 = item.column1_code === queryCode;
    const otherCode = isCol1 ? item.column2_code : item.column1_code;
    const relationship = isCol1 ? 'Bundles component' : 'Is bundled into';
    
    html += `
      <div class="result-card" style="border-left: 3px solid ${isCol1 ? 'var(--tint-teal)' : 'var(--text-danger)'};">
        <div style="flex:1;">
          <div style="font-weight: 600; font-size: 13px; color: var(--text-dark);">
            <span style="opacity:0.6;">${relationship}:</span> 
            <span style="font-family: monospace; background: rgba(0,0,0,0.05); padding: 2px 4px; border-radius: 4px;">${otherCode}</span>
          </div>
          <div style="font-size: 11px; color: var(--text-muted); margin-top: 4px;">
            Modifier Allowed: <strong style="color:var(--text-dark)">${item.modifier_allowed === '1' ? 'Yes' : 'No'}</strong>
            &bull; NCCI Category: PTP
          </div>
        </div>
      </div>
    `;
  });
  listContainer.innerHTML = html;
}

function attachCopyListeners() {
  document.querySelectorAll('.copy-btn').forEach(btn => {
    btn.addEventListener('click', (e) => {
      const code = e.currentTarget.dataset.code;
      navigator.clipboard.writeText(code).then(() => {
        const originalIcon = e.currentTarget.innerHTML;
        e.currentTarget.innerHTML = '<svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="#0d9488" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>';
        setTimeout(() => e.currentTarget.innerHTML = originalIcon, 1500);
      });
    });
  });
}
