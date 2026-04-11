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
    // 1. Handle NCCI Edits separately (always eq check)
    if (currentFilter === 'NCCI') {
      const { data, error } = await window.dbClient
        .from('ncci_ptp_edits')
        .select('*')
        .eq('column1_code', cleanQ)
        .limit(30);
        
      if (error) throw error;
      renderNCCIResults(data);
      return;
    }

    // 2. Standard Medical Codes Lookup (ICD-10, CPT, HCPCS)
    let dbQuery = window.dbClient
      .from('medical_codes')
      .select('code, short_description, country, code_type');

    if (/^[A-Z0-9.]+$/i.test(cleanQ)) {
      // If it looks like a code, search by code or description
      // For codes, we strip the format to match the DB
      dbQuery = dbQuery.or(`code.ilike.${cleanQ}%,code.eq.${cleanQ},short_description.ilike.%${query}%`);
    } else {
      // If it looks like text, search for each word in description for better coverage
      const words = query.split(/\s+/).filter(w => w.length > 2);
      if (words.length > 0) {
        let filterStr = words.map(w => `short_description.ilike.%${w}%`).join(',');
        dbQuery = dbQuery.or(filterStr);
      } else {
        dbQuery = dbQuery.ilike('short_description', `%${query}%`);
      }
    }

    const { data, error, status, statusText } = await dbQuery.limit(150);
    
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

    // 4. Apply current region filter (if it's not ALL)
    let finalResults = Object.values(grouped);
    if (currentRegion !== 'ALL') {
      finalResults = finalResults.filter(r => r.regions.has(currentRegion));
    }

    // 5. Apply type filter
    if (currentFilter !== 'ALL') {
      finalResults = finalResults.filter(r => r.type === currentFilter);
    }

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

function renderNCCIResults(results) {
  const listContainer = document.getElementById('search-results-list');
  if (!results || results.length === 0) {
    listContainer.innerHTML = '<div class="empty-state">No NCCI bundling edits found for this code.</div>';
    return;
  }

  let html = '';
  results.forEach(item => {
    html += `
      <div class="result-card" style="border-left: 3px solid var(--tint-teal);">
        <div style="flex:1;">
          <div style="font-weight: 600; font-size: 13px; color: var(--text-dark);">
            Bundled: <span style="font-family: monospace;">${item.column2_code}</span>
          </div>
          <div style="font-size: 11px; color: var(--text-muted); margin-top: 2px;">
            Modifier Allowed: <strong>${item.modifier_allowed === '1' ? 'Yes' : 'No'}</strong>
            &bull; Effective: ${item.effective_date || '—'}
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
