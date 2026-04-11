const denialInput = document.getElementById('denial-search-input');
const denialSuggest = document.getElementById('denial-suggestions');
const denialResults = document.getElementById('denial-results');

let denialTimeout = null;
let currentDenialSearchId = 0;

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

// Event Delegation for Copy Buttons
denialResults.addEventListener('click', (e) => {
  const btn = e.target.closest('.copy-btn');
  if (!btn) return;
  
  const code = btn.dataset.code;
  navigator.clipboard.writeText(code)
    .then(() => {
      const originalHtml = btn.innerHTML;
      btn.innerHTML = `<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#10b981" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>`;
      setTimeout(() => btn.innerHTML = originalHtml, 1500);
    })
    .catch(err => console.warn('Clipboard failed:', err));
});

denialInput.addEventListener('input', (e) => {
  const query = e.target.value.trim().toUpperCase();
  clearTimeout(denialTimeout);
  
  if (query.length < 1) {
    denialSuggest.innerHTML = '';
    denialResults.innerHTML = '';
    return;
  }

  denialTimeout = setTimeout(() => {
    // Show suggestions for small queries, full search for longer ones
    if (query.length < 3) {
      showSuggestions(query);
    } else {
      denialSuggest.innerHTML = '';
      searchDenials(query);
    }
  }, 400);
});

async function showSuggestions(q) {
  if (!window.dbClient) return;

  // Modern normalization:
  // 1. Strip hyphens/spaces for internal matching
  // 2. Detect common prefixes like CO, MA, M, N, PR, OA, PI, CR
  const cleanQ = q.replace(/[\-\s]/g, '').toUpperCase();
  const match = cleanQ.match(/^(CO|PR|OA|PI|CR|MA|M|N)(\d+)$/i);
  const normQ = match ? `${match[1]}-${match[2]}` : cleanQ;

  try {
    const { data } = await window.dbClient
      .from('carc_codes')
      .select('code, description')
      .or(`code.ilike.%${normQ}%,code.ilike.%${cleanQ}%,description.ilike.%${q}%`)
      .limit(3);

    if (!data || data.length === 0) {
      denialSuggest.innerHTML = '';
      return;
    }

    denialSuggest.innerHTML = data.map(item => `
      <div class="result-card suggestion-pill" data-code="${escapeHtml(item.code)}" style="cursor:pointer; border-style:dashed; margin-bottom:4px; padding:8px 12px;">
        <span style="font-weight:700; color:var(--tint-teal);">${escapeHtml(item.code)}</span>
        <span style="font-size:11px; margin-left:8px; opacity:0.8;">${escapeHtml(item.description.substring(0, 30))}...</span>
      </div>
    `).join('');

    document.querySelectorAll('.suggestion-pill').forEach(el => {
      el.addEventListener('click', () => {
        denialInput.value = el.dataset.code;
        denialSuggest.innerHTML = '';
        searchDenials(el.dataset.code);
      });
    });
  } catch (e) {
    denialSuggest.innerHTML = '';
  }
}

async function searchDenials(query) {
  if (!window.dbClient) {
    denialResults.innerHTML = '<div class="empty-state" style="color:var(--text-danger)">Database connection error.</div>';
    return;
  }

  const qUpper = query.toUpperCase();
  const cleanQ = qUpper.replace(/[\-\s]/g, '');
  const match = cleanQ.match(/^(CO|PR|OA|PI|CR|MA|M|N)(\d+)$/i);
  const searchId = ++currentDenialSearchId; 
  denialResults.innerHTML = '<div class="empty-state">Decoding Registry...</div>';

  try {
    const [carcRes, rarcRes] = await Promise.all([
      window.dbClient.from('carc_codes').select('*').or(`code.eq.${normQ},code.eq.${cleanQ},description.ilike.%${query}%`).limit(15),
      window.dbClient.from('rarc_codes').select('*').or(`code.eq.${normQ},code.eq.${cleanQ},description.ilike.%${query}%`).limit(15)
    ]);

    if (searchId !== currentDenialSearchId) return; // Race condition guard

    const merged = [
      ...(carcRes.data || []).map(d => ({...d, type: 'CARC'})),
      ...(rarcRes.data || []).map(d => ({...d, type: 'RARC'}))
    ];

    if (merged.length === 0) {
      denialResults.innerHTML = `<div class="empty-state">No matching codes for "${query}". <br><small style="opacity:0.6;">Try: CO-45, M15, or keywords like 'duplicate'.</small></div>`;
      return;
    }

    // Sort: Exact matches first
    merged.sort((a, b) => {
      const aMatch = a.code === normQ || a.code === cleanQ;
      const bMatch = b.code === normQ || b.code === cleanQ;
      if (aMatch && !bMatch) return -1;
      if (bMatch && !aMatch) return 1;
      return a.code.localeCompare(b.code);
    });

    displayDenials(merged);
  } catch (err) {
    console.error(err);
    denialResults.innerHTML = '<div class="empty-state" style="color:var(--text-danger)">Error searching database.</div>';
  }
}

function displayDenials(results) {
  denialResults.innerHTML = results.map(item => {
    const isCarc = item.type === 'CARC';
    const tagClass = item.type; // "CARC" or "RARC"
    
    // Escape all data components
    const safeCode = escapeHtml(item.code);
    const safeType = escapeHtml(item.type);
    const safeDesc = escapeHtml(item.description);
    const safeDate = item.effective_date ? new Date(item.effective_date).getFullYear() : null;

    return `
      <div class="result-card">
        <div class="result-header">
          <span class="code-val">${safeCode}</span>
          <span class="code-tag tag-${tagClass}">${safeType}</span>
          
          <div class="region-badges">
             <span class="reg-badge" style="background: rgba(16,185,129,0.1); border-color: rgba(16,185,129,0.3); color: #10b981;">
               ● ACTIVE
             </span>
             ${safeDate ? `<span class="reg-badge" style="border:none; opacity:0.7;">Since ${safeDate}</span>` : ''}
          </div>

          <button class="copy-btn" data-code="${safeCode}" title="Copy to clipboard">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path></svg>
          </button>
        </div>
        
        <div class="result-desc" style="display:flex; gap:12px; align-items:flex-start; margin-top:8px;">
           <div style="flex-shrink:0; margin-top:2px;">
             ${isCarc 
               ? `<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#f59e0b" stroke-width="2"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="8" x2="12" y2="12"></line><line x1="12" y1="16" x2="12.01" y2="16"></line></svg>`
               : `<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#10b981" stroke-width="2"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>`
             }
           </div>
           <div style="font-size: 14.5px; line-height: 1.5; color: var(--text-body);">
             ${safeDesc}
           </div>
        </div>
      </div>
    `;
  }).join('');
  
  // attachCopyListeners(); // DEPRECATED: Using event delegation now
}
