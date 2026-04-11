let currentFilter = 'ALL';
let currentRegion = 'US'; // Default to US
let searchTimeout = null;
let currentSearchId = 0; // Prevent race conditions
const MAX_WAIT_ATTEMPTS = 20; // 2 seconds max wait for DB init

// Security Helper: Escape dynamic data to prevent XSS
function escapeHtml(str) {
  if (!str) return '';
  return String(str)
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;');
}

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
      e.currentTarget.classList.add('active');
      
      currentFilter = e.currentTarget.dataset.filter;
      clearTimeout(searchTimeout); 
      performSearch(searchInput.value.trim());
    });
  });

  regionBtns.forEach(btn => {
    btn.addEventListener('click', (e) => {
      regionBtns.forEach(b => b.classList.remove('active'));
      e.currentTarget.classList.add('active');
      
      currentRegion = e.currentTarget.dataset.region;
      clearTimeout(searchTimeout); 
      performSearch(searchInput.value.trim());
    });
  });

  // Event Delegation for Copy Buttons (Optimized)
  const listContainer = document.getElementById('search-results-list');
  listContainer.addEventListener('click', (e) => {
    const btn = e.target.closest('.copy-btn');
    if (!btn) return;
    
    const code = btn.dataset.code;
    navigator.clipboard.writeText(code)
      .then(() => {
        const originalIcon = btn.innerHTML;
        btn.innerHTML = '<svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="#0d9488" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>';
        setTimeout(() => btn.innerHTML = originalIcon, 1500);
      })
      .catch(err => {
        console.warn('Clipboard failed:', err);
        // Fallback or user notification could go here
      });
  });
}

async function performSearch(query) {
  const listContainer = document.getElementById('search-results-list');
  
  if (query.length < 2) {
    listContainer.innerHTML = '<div class="empty-state">Start typing to search instantly...</div>';
    return;
  }

  // UI Feedback during DB initialization
  if (!window.dbClient) {
    listContainer.innerHTML = '<div class="empty-state"><span class="loading-dots">Initializing Secure Connection...</span></div>';
    for (let i = 0; i < MAX_WAIT_ATTEMPTS; i++) { 
        await new Promise(r => setTimeout(r, 100));
        if (window.dbClient) break;
    }
  }

  if (!window.dbClient) {
    listContainer.innerHTML = '<div class="empty-state" style="color:var(--text-danger)">Database connection error. Please refresh.</div>';
    return;
  }

  const searchId = ++currentSearchId; // [High] Move to top to cover ALL branches
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
      // [High] Add race guard to NCCI branch
      if (searchId !== currentSearchId) return;

      renderNCCIResults(data, cleanQ); // Pass query to highlight the match
      return;
    }

    // [Medium] Robust sanitization for safeQuery (dots are allowed for ICD-10)
    const safeQuery = query.replace(/[^a-zA-Z0-9\s\.\-]/g, '').trim();
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
    
    // [Medium] Increase limit for ALL region searches
    const fetchLimit = currentRegion === 'ALL' ? 300 : 150;
    const { data, error, status } = await dbQuery.limit(fetchLimit);
    
    // Race Condition Guard: If a newer search has started, discard this result
    if (searchId !== currentSearchId) {
        console.log('Stale search result discarded:', query);
        return;
    }
    
    if (error) {
        console.error('Search error:', error, 'Query:', cleanQ);
        listContainer.innerHTML = `<div class="empty-state" style="color:var(--text-danger)">
            <strong>Database Error [${status}]:</strong> ${escapeHtml(error.message) || 'Unknown error'}<br>
            <span style="font-size:10px; opacity:0.7;">Check console for query details</span>
        </div>`;
        return;
    }

    if (!data || data.length === 0) {
      renderResults([], 0, fetchLimit);
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

    // 4. (Converted map to array for sorting and rendering)
    let finalResults = Object.values(grouped);

    // 5. Sort by relevance (exact match first)
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

    renderResults(finalResults, data.length, fetchLimit);

  } catch(err) {
    console.error('Unexpected search failure:', err);
    listContainer.innerHTML = `<div class="empty-state" style="color:var(--text-danger)">Unexpected Error: ${escapeHtml(err.message) || 'Check connection'}</div>`;
  }
}

function renderResults(results, rawCount = 0, rawFetchLimit = 150) {
  const listContainer = document.getElementById('search-results-list');
  
  if (!results || results.length === 0) {
    listContainer.innerHTML = '<div class="empty-state">No matching codes found in database.</div>';
    return;
  }

  const regionList = ['US', 'UK', 'ME'];
  let html = '';

  // [Low] Show result count based on raw DB record threshold
  const count = results.length;
  const isCapped = rawCount >= rawFetchLimit; 
  html += `<div class="results-count">Showing <b>${count}</b> unique codes${isCapped ? ' (Limit reached, narrow query)' : ''}</div>`;
  
  results.forEach(item => {
    let tagClass = `tag-${escapeHtml(item.type)}`;
    let displayType = item.type.replace('ICD10', 'ICD-10');
    
    html += `
      <div class="result-card">
        <div class="result-main-area">
          <div class="result-header">
            <span class="code-val">${escapeHtml(item.code)}</span>
            <span class="code-tag ${tagClass}">${escapeHtml(displayType)}</span>
            <div class="region-badges">
              ${regionList.map(reg => {
                const active = item.regions.has(reg);
                return `<span class="reg-badge ${reg.toLowerCase()} ${active ? '' : 'inactive'}">${reg}${active ? '' : ': N/A'}</span>`;
              }).join('')}
            </div>
            <button class="copy-btn" data-code="${escapeHtml(item.code)}" title="Copy to clipboard">
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path></svg>
            </button>
          </div>
          <div class="result-desc">${escapeHtml(item.desc)}</div>
        </div>
      </div>
    `;
  });
  
  listContainer.innerHTML = html;
}

function renderNCCIResults(results, queryCode) {
  const listContainer = document.getElementById('search-results-list');
  if (!results || results.length === 0) {
    listContainer.innerHTML = `<div class="empty-state">No NCCI bundling edits found for "${escapeHtml(queryCode)}".</div>`;
    return;
  }

  let html = `<div class="ncci-summary-header">
                NCCI Bundling Policy: Found records where <strong>${escapeHtml(queryCode)}</strong> is restricted.
              </div>`;
              
  results.forEach(item => {
    const isCol1 = item.column1_code === queryCode.toUpperCase();
    const otherCode = isCol1 ? item.column2_code : item.column1_code;
    const colNum = isCol1 ? "Column 1 (Comprehensive)" : "Column 2 (Component)";
    const relevanceClass = isCol1 ? "ncci-high-relevance" : "ncci-low-relevance";
    
    // Sanitized data for display
    const safeColNum = escapeHtml(colNum);
    const safeCol1 = escapeHtml(item.column1_code);
    const safeCol2 = escapeHtml(item.column2_code);
    const safeOther = escapeHtml(otherCode);
    
    html += `
      <div class="ncci-card ${relevanceClass}">
        <div class="ncci-header">Bundle Relationship • ${safeColNum}</div>
        <div class="result-code-group">
          <span class="ncci-code-block">${safeCol1}</span>
          <span class="ncci-separator">+</span>
          <span class="ncci-code-block">${safeCol2}</span>
          <button class="copy-btn" data-code="${safeOther}" title="Copy Conflict Code">
            <svg width="14" height="14" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z"></path></svg>
          </button>
          ${item.modifier_allowed ? `<span class="result-badge">Mod Allowed: ${escapeHtml(item.modifier_allowed === '1' ? 'Yes' : 'No')}</span>` : ''}
        </div>
        <div class="result-desc">
          <strong>Clinical Rule:</strong> These codes are clinically bundled. 
          ${item.modifier_allowed === '1' ? 'A modifier (e.g., -59) may bypass this edit if performed at a separate site/session.' : 'No modifier bypass is permitted for this specific pair.'}
        </div>
      </div>
    `;
  });
  listContainer.innerHTML = html;
}

