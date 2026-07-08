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

const DENIAL_INSIGHTS = {
  'CO-1': {
    plain: "This is your annual deductible. You are responsible for this amount until your yearly limit is met.",
    step: "Verify this amount against your insurance portal's 'Deductible Tracker'."
  },
  'PR-1': {
    plain: "Part of your deductible. Same as CO-1 but explicitly assigned to you by the provider.",
    step: "Check if you have reached your out-of-pocket maximum for the year."
  },
  'CO-45': {
    plain: "Contractual Adjustment. This is a pre-negotiated discount between your doctor and insurance.",
    step: "You DO NOT owe this amount. If the doctor bills you for this, it is called 'Balance Billing' and is often illegal."
  },
  'CO-16': {
    plain: "Missing Information. The insurance company needs more data from the doctor to process the payment.",
    step: "Contact the billing department of the provider and ask them to 'Identify and resubmit missing claim data'."
  },
  'CO-97': {
    plain: "Bundled Service. This procedure is considered part of another service performed on the same day.",
    step: "The doctor should not bill you separately for this. It is included in the main procedure fee."
  },
  'CO-18': {
    plain: "Duplicate Claim. This service was already submitted and processed under a different claim number.",
    step: "Ignore this if the first claim was paid. If both were denied, the doctor needs to reconcile their records."
  },
  'CO-216': {
    plain: "Denied by a review organization (e.g. utilization management). The payer determined the service was not medically necessary, lacked clinical documentation, or failed pre-authorization criteria.",
    step: "You DO NOT owe this amount. This is a contractual write-off — the provider must absorb it. If you were billed, contact the billing office immediately and cite CO-216."
  },
  'MA01': {
    plain: "Primary Insurance. This claim was processed as your primary coverage.",
    step: "If you have a secondary plan (like AARP or a spouse's plan), give them this EOB to pay the remaining balance."
  }
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

  // Scan ALL tokens for a code pattern — works whether the code is first, last, or middle
  // e.g. "CO-216 denial code" → token[0]="CO-216" ✅
  // e.g. "denial code CO-216" → token[2]="CO-216" ✅
  const qTokens = q.trim().split(/\s+/);
  let match = null;
  let cleanCode = null;
  for (const tok of qTokens) {
    const cleaned = tok.replace(/[\-\.\,"']/g, '').toUpperCase();
    const m = cleaned.match(/^(CO|PR|OA|PI|CR|MA|M|N)(\d+)$/i);
    if (m) { match = m; cleanCode = cleaned; break; }
  }
  // Fallback: use first token if no code pattern was found anywhere
  if (!cleanCode) cleanCode = qTokens[0].replace(/[\-\.\,"']/g, '').toUpperCase();
  const normQ = match ? `${match[1]}-${match[2]}` : cleanCode;
  const safeDescQ = q.replace(/"/g, '').trim();

  // Build OR parts: all code variants from the detected code token
  // + description keyword fallback from the full query
  // Never broadens to prefix-only (e.g. "CO") — only digits are used as bare variant
  const suggestOrParts = [
    `code.ilike."${normQ}%"`,
    `code.ilike."${cleanCode}%"`,
    `description.ilike."%${safeDescQ}%"`
  ];
  if (match) {
    const bareNum = match[2]; // e.g. "216" from "CO-216"
    suggestOrParts.push(`code.eq."${bareNum}"`);
    suggestOrParts.push(`code.ilike."${bareNum}%"`);
  }

  const searchId = ++currentDenialSearchId; 
  try {
    const { data } = await window.dbClient
      .from('carc_codes')
      .select('code, description')
      .or(suggestOrParts.join(','))
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
    denialResults.innerHTML = '<div class="empty-state"><span class="loading-dots">Initializing Secure Connection...</span></div>';
    for (let i = 0; i < 20; i++) { 
        await new Promise(r => setTimeout(r, 100));
        if (window.dbClient) break;
    }
  }

  if (!window.dbClient) {
    denialResults.innerHTML = '<div class="empty-state" style="color:var(--text-danger)">Database connection error. Please refresh.</div>';
    return;
  }

  const qUpper = query.toUpperCase();
  const tokens = query.split(/\s+/).filter(t => t.length >= 2);
  const searchId = ++currentDenialSearchId; 
  
  denialResults.innerHTML = '<div class="empty-state">Decoding Registry...</div>';

  try {
    // [Smart] Code detection — scan ALL tokens for a code pattern
    // Handles any position: "CO-216 denial code" OR "denial code CO-216" OR just "CO-216"
    const qTokens = query.trim().split(/\s+/);
    let codeMatch = null;
    let cleanCode = null;
    for (const tok of qTokens) {
      const cleaned = tok.replace(/[\-\.\,"']/g, '').toUpperCase();
      const m = cleaned.match(/^(CO|PR|OA|PI|CR|MA|M|N)(\d+)$/i);
      if (m) { codeMatch = m; cleanCode = cleaned; break; }
    }
    // Fallback: if no code found in any token, use first token as the search term
    if (!cleanCode) cleanCode = qTokens[0].replace(/[\-\.\,"']/g, '').toUpperCase();
    const normQ = codeMatch ? `${codeMatch[1]}-${codeMatch[2]}` : cleanCode;

    // Build the query
    let dbQueryCarc = window.dbClient.from('carc_codes').select('*');
    let dbQueryRarc = window.dbClient.from('rarc_codes').select('*');

    // Code variant OR conditions (never broadens to prefix-only like "CO")
    const allOrs = new Set([
      `code.ilike."${normQ}%"`,
      `code.ilike."${cleanCode}%"`
    ]);

    // Also match bare number if a prefixed code was found (e.g. "216" from "CO-216")
    if (codeMatch) {
      const bareNum = codeMatch[2];
      allOrs.add(`code.eq."${bareNum}"`);
      allOrs.add(`code.ilike."${bareNum}%"`);
    }

    tokens.forEach(tok => {
      const t = tok.toUpperCase();
      allOrs.add(`description.ilike."%${tok}%"`);
      if (SYNONYMS[t]) allOrs.add(`description.ilike."%${SYNONYMS[t]}%"`);
    });

    const orCondition = Array.from(allOrs).join(',');

    const searchPromise = Promise.all([
      dbQueryCarc.or(orCondition).limit(100),
      dbQueryRarc.or(orCondition).limit(100)
    ]);

    const timeoutPromise = new Promise((_, reject) => 
      setTimeout(() => reject(new Error('timeout')), 8000)
    );

    let carcRes, rarcRes;
    try {
      const [c, r] = await Promise.race([searchPromise, timeoutPromise]);
      carcRes = c;
      rarcRes = r;
    } catch (e) {
      if (e.message === 'timeout') {
        denialResults.innerHTML = '<div class="empty-state" style="color:var(--text-warning)">Search is taking longer than expected. Please refine your query or check your connection.</div>';
        return;
      }
      throw e;
    }

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
      const aExact = a.code === normQ || a.code === cleanCode;
      const bExact = b.code === normQ || b.code === cleanCode;
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
    
    // Check for "Smart" Insights
    const insight = DENIAL_INSIGHTS[item.code] || null;

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

          <button class="copy-btn" data-code="${safeCode} : ${escapeHtml(item.description)}" title="Copy to clipboard">
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

        ${insight ? `
        <div class="insight-box">
          <div class="insight-icon">💡</div>
          <div class="insight-content">
            <h4>MediHelp Insight</h4>
            <p>${insight.plain}</p>
            <div class="next-step">
              <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"><polyline points="9 18 15 12 9 6"></polyline></svg>
              NEXT STEP: ${insight.step}
            </div>
          </div>
        </div>
        ` : ''}
      </div>
    `;
  }).join('');
  
  denialResults.innerHTML = html;
}

// Parse query parameter on load to support direct SEO deep links
document.addEventListener('DOMContentLoaded', () => {
  const urlParams = new URLSearchParams(window.location.search);
  const initialQuery = urlParams.get('q') || urlParams.get('code');
  if (initialQuery && denialInput) {
    denialInput.value = initialQuery;
    searchDenials(initialQuery.trim());
  }
});

