const denialInput = document.getElementById('denial-search-input');
const denialResults = document.getElementById('denial-results');

let denialTimeout = null;

denialInput.addEventListener('input', (e) => {
  const query = e.target.value.trim().toUpperCase();
  clearTimeout(denialTimeout);
  
  if (query.length < 2) {
    denialResults.innerHTML = '';
    return;
  }

  denialResults.innerHTML = '<div class="empty-state">Searching CARC/RARC codes...</div>';

  denialTimeout = setTimeout(() => {
    searchDenials(query);
  }, 500);
});

async function searchDenials(query) {
  if (!window.dbClient) {
    denialResults.innerHTML = '<div class="empty-state" style="color:var(--text-danger)">Database connection error.</div>';
    return;
  }

  try {
    // Search CARC codes
    const { data: carcData, error: carcErr } = await window.dbClient
      .from('carc_codes')
      .select('*')
      .ilike('code', `%${query}%`)
      .limit(5);

    // Search RARC codes
    const { data: rarcData, error: rarcErr } = await window.dbClient
      .from('rarc_codes')
      .select('*')
      .ilike('code', `%${query}%`)
      .limit(5);

    if (carcErr) throw carcErr;
    if (rarcErr) throw rarcErr;

    const merged = [
      ...(carcData || []).map(d => ({...d, type: 'CARC'})),
      ...(rarcData || []).map(d => ({...d, type: 'RARC'}))
    ];

    if (merged.length === 0) {
      denialResults.innerHTML = '<div class="empty-state">No matching denial codes found.</div>';
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
    div.innerHTML = `
      <div style="display: flex; justify-content: space-between; align-items: start; margin-bottom: 6px;">
        <div style="font-weight: 600; font-family: monospace; color: var(--text-dark); background: ${tagBg}15; color: ${tagBg}; padding: 2px 6px; border-radius: 4px;">
          ${item.code}
        </div>
        <div style="font-size: 11px; color: var(--text-muted);">
          Effective: ${item.effective_date || 'N/A'}
        </div>
      </div>
      <div style="font-size: 13px; color: var(--text-normal); line-height: 1.4;">
        ${item.description}
      </div>
    `;
    denialResults.appendChild(div);
  });
}
