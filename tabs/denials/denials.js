const denialInput = document.getElementById('denial-search-input');
const denialSuggest = document.getElementById('denial-suggestions');
const denialResults = document.getElementById('denial-results');

let denialTimeout = null;

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
  // If query is alphanumeric like MA01, don't force hyphen unless it's a known group-carc format
  const normQ = q.match(/^(CO|PR|OA|PI|CR)(\d+)$/i) ? q.replace(/^(CO|PR|OA|PI|CR)(\d+)$/i, '$1-$2') : q;

  try {
    const { data } = await window.dbClient
      .from('carc_codes')
      .select('code, description')
      .or(`code.ilike.%${normQ}%,description.ilike.%${q}%`)
      .limit(3);

    if (!data || data.length === 0) {
      denialSuggest.innerHTML = '';
      return;
    }

    denialSuggest.innerHTML = data.map(item => `
      <div class="result-card suggestion-pill" data-code="${item.code}" style="cursor:pointer; border-style:dashed; margin-bottom:4px; padding:8px 12px;">
        <span style="font-weight:700; color:var(--tint-teal);">${item.code}</span>
        <span style="font-size:11px; margin-left:8px; opacity:0.8;">${item.description.substring(0, 30)}...</span>
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
  const normQ = qUpper.match(/^(CO|PR|OA|PI|CR)(\d+)$/i) ? qUpper.replace(/^(CO|PR|OA|PI|CR)(\d+)$/i, '$1-$2') : qUpper;

  denialResults.innerHTML = '<div class="empty-state">Decoding...</div>';

  try {
    const [carcRes, rarcRes] = await Promise.all([
      window.dbClient.from('carc_codes').select('*').or(`code.ilike.%${normQ}%,description.ilike.%${query}%`).limit(10),
      window.dbClient.from('rarc_codes').select('*').or(`code.ilike.%${normQ}%,description.ilike.%${query}%`).limit(10)
    ]);

    const merged = [
      ...(carcRes.data || []).map(d => ({...d, type: 'CARC'})),
      ...(rarcRes.data || []).map(d => ({...d, type: 'RARC'}))
    ];

    if (merged.length === 0) {
      denialResults.innerHTML = `<div class="empty-state">No matching denial codes for "${query}".</div>`;
      return;
    }

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
    
    return `
      <div class="result-card">
        <div class="result-header">
          <span class="code-val">${item.code}</span>
          <span class="code-tag tag-${tagClass}">${item.type}</span>
          
          <div class="region-badges">
             <span class="reg-badge" style="background: rgba(16,185,129,0.1); border-color: rgba(16,185,129,0.3); color: #10b981;">
               ● ACTIVE
             </span>
             ${item.effective_date ? `<span class="reg-badge" style="border:none; opacity:0.7;">Since ${new Date(item.effective_date).getFullYear()}</span>` : ''}
          </div>

          <button class="copy-btn" data-code="${item.code}" title="Copy to clipboard">
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
             ${item.description}
           </div>
        </div>
      </div>
    `;
  }).join('');
  
  // Bind copy buttons natively just like Codesearch does
  denialResults.querySelectorAll('.copy-btn').forEach(btn => {
    btn.addEventListener('click', () => {
      navigator.clipboard.writeText(btn.dataset.code);
      const originalHtml = btn.innerHTML;
      btn.innerHTML = `<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#10b981" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>`;
      setTimeout(() => btn.innerHTML = originalHtml, 1500);
    });
  });
}
