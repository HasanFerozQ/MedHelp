const denialInput = document.getElementById('denial-search-input');
const denialSuggest = document.getElementById('denial-suggestions');
const denialResults = document.getElementById('denial-results');


let denialTimeout = null;
let currentDenialSearchId = 0;

// Event Delegation for Copy Buttons
// [New] Search Optimization Helpers
const SYNONYMS = {
  'DED': 'DEDUCTIBLE',
  'DEDUCT': 'DEDUCTIBLE',
  'BAL': 'BALANCE',
  'DUP': 'DUPLICATE',
  'PROC': 'PROCEDURE',
  'SERV': 'SERVICE',
  'AUTH': 'AUTHORIZATION',
  'PRE': 'PREAUTHORIZATION',
  'REJ': 'REJECTED',
  'AMT': 'AMOUNT',
  'PAYM': 'PAYMENT',
  'ADJ': 'ADJUSTMENT'
};

function escapeRegExp(string) {
  return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

function highlightText(text, tokens) {
  if (!tokens || tokens.length === 0) return escapeHtml(text);
  
  // Sort tokens by length (descending) to avoid partial matches breaking longer ones
  const sortedTokens = [...tokens].sort((a, b) => b.length - a.length);
  let highlighted = escapeHtml(text);
  
  sortedTokens.forEach(token => {
    if (token.length < 2) return;
    const safeToken = escapeRegExp(escapeHtml(token));
    const re = new RegExp(`(${safeToken})`, 'gi');
    highlighted = highlighted.replace(re, '<mark>$1</mark>');
  });
  return highlighted;
}

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
  const query = e.target.value.trim();
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

  const cleanQ = q.replace(/[\-\s\.\,"']/g, '').toUpperCase();
  const match = cleanQ.match(/^(CO|PR|OA|PI|CR|MA|M|N)(\d+)$/i);
  const normQ = match ? `${match[1]}-${match[2]}` : cleanQ; 
  const safeDescQ = q.replace(/"/g, '').trim(); 
  
  const searchId = ++currentDenialSearchId; 
  try {
    const { data } = await window.dbClient
      .from('carc_codes')
      .select('code, description')
      .or(`code.ilike."${normQ}%",code.ilike."${cleanQ}%",description.ilike."%${safeDescQ}%"`)
      .limit(3);

    if (searchId !== currentDenialSearchId) return;

    if (!data || data.length === 0) {
      denialSuggest.innerHTML = '';
      return;
    }

    denialSuggest.innerHTML = data.map(item => `
      <div class="result-card suggestion-pill" data-code="${item.code}" style="cursor:pointer; border-style:dashed; margin-bottom:4px; padding:8px 12px;">
        <span style="font-weight:700; color:var(--tint-teal);">${escapeHtml(item.code)}</span>
        <span style="font-size:11px; margin-left:8px; opacity:0.8;">${escapeHtml(item.description.substring(0, 30))}...</span>
      </div>
    `).join('');

    denialSuggest.onclick = (e) => {
      const pill = e.target.closest('.suggestion-pill');
      if (pill) {
        denialInput.value = pill.dataset.code;
        denialSuggest.innerHTML = '';
        searchDenials(pill.dataset.code);
      }
    };
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
  const tokens = query.split(/\s+/).filter(t => t.length >= 2);
  const searchId = ++currentDenialSearchId; 
  
  denialResults.innerHTML = '<div class="empty-state">Decoding Registry...</div>';

  try {
    // [Smart] Code detection
    const cleanQ = qUpper.replace(/[\-\s\.\,"']/g, '');
    const codeMatch = cleanQ.match(/^(CO|PR|OA|PI|CR|MA|M|N)(\d+)$/i);
    const normQ = codeMatch ? `${codeMatch[1]}-${codeMatch[2]}` : cleanQ; 

    // Build the query
    let dbQueryCarc = window.dbClient.from('carc_codes').select('*');
    let dbQueryRarc = window.dbClient.from('rarc_codes').select('*');

    // Cross-field OR logic for all tokens + code variants
    const allOrs = new Set([`code.ilike."${normQ}%"`, `code.ilike."${cleanQ}%"`]);
    
    tokens.forEach(tok => {
      const t = tok.toUpperCase();
      allOrs.add(`description.ilike."%${tok}%"`);
      if (SYNONYMS[t]) allOrs.add(`description.ilike."%${SYNONYMS[t]}%"`);
    });

    const orCondition = Array.from(allOrs).join(',');

    const [carcRes, rarcRes] = await Promise.all([
      dbQueryCarc.or(orCondition).limit(100),
      dbQueryRarc.or(orCondition).limit(100)
    ]);

    if (searchId !== currentDenialSearchId) return;

    const merged = [
      ...(carcRes.data || []).map(d => ({...d, type: 'CARC'})),
      ...(rarcRes.data || []).map(d => ({...d, type: 'RARC'}))
    ];

    if (merged.length === 0) {
      denialResults.innerHTML = `<div class="empty-state">No matching codes for "${query}". <br><small style="opacity:0.6;">Try: CO-45, M15, or keywords like 'duplicate'.</small></div>`;
      return;
    }

    // [Smart] Hybrid Ranking
    merged.sort((a, b) => {
      const aCode = a.code.toUpperCase();
      const bCode = b.code.toUpperCase();
      const aDesc = a.description.toUpperCase();
      const bDesc = b.description.toUpperCase();
      const aCombined = `${aCode} ${aDesc}`;
      const bCombined = `${bCode} ${bDesc}`;

      // 1. Exact Code Match
      const aExact = a.code === normQ || a.code === cleanQ;
      const bExact = b.code === normQ || b.code === cleanQ;
      if (aExact && !bExact) return -1;
      if (bExact && !aExact) return 1;

      // 2. Multi-token "AND" match (All tokens present in COMBINED Code + Desc)
      const aMatchesAll = tokens.every(t => aCombined.includes(t.toUpperCase()));
      const bMatchesAll = tokens.every(t => bCombined.includes(t.toUpperCase()));
      if (aMatchesAll && !bMatchesAll) return -1;
      if (bMatchesAll && !aMatchesAll) return 1;

      // 3. Number of matching tokens in COMBINED
      const aTokenCount = tokens.filter(t => aCombined.includes(t.toUpperCase())).length;
      const bTokenCount = tokens.filter(t => bCombined.includes(t.toUpperCase())).length;
      if (aTokenCount !== bTokenCount) return bTokenCount - aTokenCount;

      return a.code.localeCompare(b.code);
    });

    displayDenials(merged, tokens);
  } catch (err) {
    console.error(err);
    denialResults.innerHTML = '<div class="empty-state" style="color:var(--text-danger)">Error searching database.</div>';
  }
}

function displayDenials(results, tokens) {
  const count = results.length;
  let html = `<div class="results-count" style="margin-left:2px; margin-bottom:12px; font-size:13px; color:var(--text-muted); font-weight:500;">
                Showing <b>${count}</b> matching denial codes
              </div>`;

  html += results.map(item => {
    const isCarc = item.type === 'CARC';
    const tagClass = item.type;
    const safeCode = escapeHtml(item.code);
    const safeType = escapeHtml(item.type);
    
    // Highlight the code and description based on query tokens
    const highlightedCode = highlightText(item.code, tokens);
    const highlightedDesc = highlightText(item.description, tokens);
    const safeDate = item.effective_date ? new Date(item.effective_date).getFullYear() : null;

    return `
      <div class="result-card">
        <div class="result-header">
          <span class="code-val">${highlightedCode}</span>
          <span class="code-tag tag-${tagClass}">${safeType}</span>
          
          <div class="region-badges">
             <span class="reg-badge" style="background: rgba(16,185,129,0.1); border-color: rgba(16,185,129,0.3); color: #10b981;">
               ● ACTIVE
             </span>
             ${safeDate ? `<span class="reg-badge" style="border:none; opacity:0.7;">Since ${safeDate}</span>` : ''}
          </div>

          <button class="copy-btn" data-code="${item.code}" title="Copy to clipboard">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path></svg>
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
             ${highlightedDesc}
           </div>
        </div>
      </div>
    `;
  }).join('');
  
  denialResults.innerHTML = html;
}

