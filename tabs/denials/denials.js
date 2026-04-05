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
  const normQ = q.match(/^([A-Z]{2})(\d+)$/) ? q.replace(/^([A-Z]{2})(\d+)$/, '$1-$2') : q;

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
  const normQ = qUpper.match(/^([A-Z]{2})(\d+)$/) ? qUpper.replace(/^([A-Z]{2})(\d+)$/, '$1-$2') : qUpper;

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
  denialResults.innerHTML = '';
  
  results.forEach(item => {
    const isCarc = item.type === 'CARC';
    const tagBg = isCarc ? 'var(--tint-red)' : 'var(--tint-blue)';
    
    const div = document.createElement('div');
    div.className = 'result-card';
    div.style.marginBottom = '10px';
    div.innerHTML = `
      <div style="display: flex; gap: 10px; align-items: center; margin-bottom: 8px;">
        <span style="font-size: 10px; font-weight: 800; padding: 2px 6px; border-radius: 4px; background: ${tagBg}15; color: ${tagBg}; border: 1px solid ${tagBg}40;">${item.type}</span>
        <span style="font-weight: 700; font-family: monospace; font-size: 14px; color: var(--text-dark);">${item.code}</span>
      </div>
      <div style="font-size: 12.5px; color: var(--text-normal); line-height: 1.5;">${item.description}</div>
    `;
    denialResults.appendChild(div);
  });
}
