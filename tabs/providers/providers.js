const npiInput = document.getElementById('npi-search-input');
const npiResults = document.getElementById('npi-results');

let npiTimeout = null;

npiInput.addEventListener('input', (e) => {
  const query = e.target.value.trim();
  clearTimeout(npiTimeout);
  
  if (query.length < 3) {
    npiResults.innerHTML = '';
    return;
  }

  npiResults.innerHTML = '<div class="empty-state">Searching NPI Registry...</div>';

  npiTimeout = setTimeout(() => {
    searchNPI(query);
  }, 500);
});

async function searchNPI(query) {
  try {
    let url = 'https://npiregistry.cms.hhs.gov/api/?version=2.1&limit=10';
    
    // If it's a 10 digit number, search by NPI
    if (/^\d{10}$/.test(query)) {
      url += `&number=${query}`;
    } 
    // Otherwise try to search by organization name or last name
    else {
      url += `&organization_name=${encodeURIComponent(query)}*`;
    }

    const res = await fetch(url);
    const data = await res.json();

    if (!data.results || data.results.length === 0) {
      npiResults.innerHTML = '<div class="empty-state">No providers found.</div>';
      return;
    }

    displayNPI(data.results);
  } catch (err) {
    console.error(err);
    npiResults.innerHTML = '<div class="empty-state">Error fetching provider data.</div>';
  }
}

function displayNPI(results) {
  npiResults.innerHTML = '';
  
  results.forEach(provider => {
    const isOrg = provider.enumeration_type === 'NPI-2';
    const name = isOrg 
      ? provider.basic.organization_name 
      : `${provider.basic.first_name} ${provider.basic.last_name}`;
    
    const div = document.createElement('div');
    div.className = 'result-card provider-card';
    div.style.cssText = "display: flex; flex-direction: column; gap: 8px; padding: 16px; border-left: 4px solid var(--tint-teal); margin-bottom: 12px; background: white; border-radius: 8px; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05), 0 2px 4px -1px rgba(0, 0, 0, 0.03);";

    div.innerHTML = `
      <div style="display: flex; align-items: start; justify-content: space-between; gap: 12px;">
        <div style="font-weight: 700; font-size: 14px; color: #0f172a; line-height: 1.3;">
          ${name} <span style="font-weight: 500; font-size: 11px; color: var(--tint-teal); background: var(--tint-teal-light); padding: 2px 6px; border-radius: 12px; margin-left: 4px;">${provider.basic.credential || 'PRO'}</span>
        </div>
      </div>
      
      <div style="display: flex; flex-direction: column; gap: 4px;">
        <div style="font-size: 12px; color: #475569; display: flex; align-items: center; gap: 6px;">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="opacity:0.6"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
          <strong>NPI:</strong> <span style="font-family: monospace; font-size: 13px; background: #f1f5f9; padding: 2px 6px; border-radius: 4px;">${provider.number}</span>
        </div>
        
        <div style="font-size: 12px; color: #475569; display: flex; align-items: start; gap: 6px;">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="opacity:0.6; margin-top: 2px;"><rect x="2" y="7" width="20" height="14" rx="2" ry="2"></rect><path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path></svg>
          <span style="line-height: 1.4;">${provider.taxonomies[0]?.desc || 'Primary Taxonomy N/A'}</span>
        </div>

        <div style="font-size: 12px; color: #475569; display: flex; align-items: start; gap: 6px;">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="opacity:0.6; margin-top: 2px;"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
          <span style="line-height: 1.4;">${provider.addresses[0]?.address_1}, ${provider.addresses[0]?.city}, ${provider.addresses[0]?.state} ${provider.addresses[0]?.postal_code?.substring(0,5)}</span>
        </div>
      </div>
    `;
    npiResults.appendChild(div);
  });
}
