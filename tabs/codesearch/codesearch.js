let fuse = null;
let currentFilter = 'ALL';

// Initialize Search on Load
async function initSearch() {
  try {
    const response = await fetch('../../data/icd10_cpt_codes.json');
    const data = await response.json();
    
    const FUSE_OPTIONS = {
      keys: [
        { name: 'code', weight: 0.4 },
        { name: 'description', weight: 0.6 }
      ],
      threshold: 0.35,
      minMatchCharLength: 2,
      includeScore: true
    };
    
    // fuse is loaded via script tag in popup.html before popup.js
    fuse = new Fuse(data, FUSE_OPTIONS);
    
    // Setup event listeners once data is loaded
    setupEventListeners();
  } catch (error) {
    console.error("Error loading mock data:", error);
  }
}

function setupEventListeners() {
  const searchInput = document.getElementById('code-search-input');
  const filterBtns = document.querySelectorAll('.filter-btn');

  searchInput.addEventListener('input', (e) => {
    performSearch(e.target.value);
  });

  filterBtns.forEach(btn => {
    btn.addEventListener('click', (e) => {
      // Manage active states
      filterBtns.forEach(b => b.classList.remove('active'));
      const clickedBtn = e.target;
      clickedBtn.classList.add('active');
      
      currentFilter = clickedBtn.dataset.filter;
      performSearch(searchInput.value);
    });
  });
}

function performSearch(query) {
  const listContainer = document.getElementById('search-results-list');
  
  if (!fuse || query.length < 2) {
    listContainer.innerHTML = '<div class="empty-state">Start typing to search thousands of medical codes instantly and offline.</div>';
    return;
  }

  let results = fuse.search(query, { limit: 20 });
  
  // Apply Filter
  if (currentFilter !== 'ALL') {
    results = results.filter(r => r.item.type === currentFilter);
  }

  renderResults(results);
}

function renderResults(results) {
  const listContainer = document.getElementById('search-results-list');
  
  if (results.length === 0) {
    listContainer.innerHTML = '<div class="empty-state">No matching codes found.</div>';
    return;
  }

  let html = '';
  results.forEach(r => {
    const item = r.item;
    html += `
      <div class="result-card">
        <div class="result-code-area">
          <span class="code-val">${item.code}</span>
          <span class="code-tag tag-${item.type}">${item.type.replace('ICD10', 'ICD-10')}</span>
        </div>
        <div class="result-desc">${item.description}</div>
        <button class="copy-btn" data-code="${item.code}" title="Copy to clipboard">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path></svg>
        </button>
      </div>
    `;
  });
  
  listContainer.innerHTML = html;

  // Add listener for copy buttons
  document.querySelectorAll('.copy-btn').forEach(btn => {
    btn.addEventListener('click', (e) => {
      const code = e.currentTarget.dataset.code;
      navigator.clipboard.writeText(code).then(() => {
        // Simple visual feedback
        const originalIcon = e.currentTarget.innerHTML;
        e.currentTarget.innerHTML = '<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#0d9488" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>';
        setTimeout(() => e.currentTarget.innerHTML = originalIcon, 1500);
      });
    });
  });
}

document.addEventListener('DOMContentLoaded', () => {
  initSearch();
});
