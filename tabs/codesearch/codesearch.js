let currentFilter = 'ALL';
let searchTimeout = null;

// Initialize
document.addEventListener('DOMContentLoaded', () => {
  setupEventListeners();
});

function setupEventListeners() {
  const searchInput = document.getElementById('code-search-input');
  const filterBtns = document.querySelectorAll('.filter-btn');

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
}

async function performSearch(query) {
  const listContainer = document.getElementById('search-results-list');
  
  if (query.length < 2) {
    listContainer.innerHTML = '<div class="empty-state">Start typing to search instantly...</div>';
    return;
  }

  if (!window.dbClient) {
    listContainer.innerHTML = '<div class="empty-state" style="color:var(--text-danger)">Database connection error.</div>';
    return;
  }

  listContainer.innerHTML = '<div class="empty-state">Querying Supabase database...</div>';

  try {
    // Branch 1: NCCI Edits Lookup
    if (currentFilter === 'NCCI') {
      const { data, error } = await window.dbClient
        .from('ncci_edits')
        .select('*')
        .eq('primary_code', query.toUpperCase())
        .limit(20);
        
      if (error) throw error;
      renderNCCIResults(data);
      return;
    }

    // Branch 2: Standard Medical Codes Lookup (ICD-10, CPT, HCPCS)
    let dbQuery = window.dbClient
      .from('medical_codes')
      .select('*')
      .or(`code.ilike.%${query}%,short_description.ilike.%${query}%`)
      .limit(20);

    if (currentFilter !== 'ALL') {
      dbQuery = dbQuery.eq('code_type', currentFilter);
    }

    const { data, error } = await dbQuery;
    
    if (error) throw error;
    renderResults(data);

  } catch(err) {
    console.error(err);
    listContainer.innerHTML = '<div class="empty-state" style="color:var(--text-danger)">Error fetching code data.</div>';
  }
}

function renderResults(results) {
  const listContainer = document.getElementById('search-results-list');
  
  if (!results || results.length === 0) {
    listContainer.innerHTML = '<div class="empty-state">No matching codes found in database.</div>';
    return;
  }

  let html = '';
  results.forEach(item => {
    // Map internal types to user-friendly tags
    let tagClass = `tag-${item.code_type || 'HCPCS'}`;
    let displayType = (item.code_type || 'HCPCS').replace('ICD10', 'ICD-10');
    
    html += `
      <div class="result-card">
        <div class="result-code-area">
          <span class="code-val">${item.code}</span>
          <span class="code-tag ${tagClass}">${displayType}</span>
        </div>
        <div class="result-desc">${item.short_description || item.long_description}</div>
        <button class="copy-btn" data-code="${item.code}" title="Copy to clipboard">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path></svg>
        </button>
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
        <div style="font-weight: 500; color: var(--text-dark); margin-bottom: 4px;">
          Bundled with: <span style="font-family: monospace; font-weight: 600;">${item.secondary_code}</span>
        </div>
        <div style="font-size: 11px; color: var(--text-muted);">
          Modifier Allowed: <strong>${item.modifier_allowed === '1' ? 'Yes' : 'No'}</strong>
          ${item.effective_date ? `&bull; Effective: ${item.effective_date}` : ''}
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
        e.currentTarget.innerHTML = '<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#0d9488" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>';
        setTimeout(() => e.currentTarget.innerHTML = originalIcon, 1500);
      });
    });
  });
}
