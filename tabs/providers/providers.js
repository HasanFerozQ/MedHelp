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
    div.className = 'result-card';
    div.innerHTML = `
      <div style="font-weight: 600; color: var(--text-dark); margin-bottom: 4px;">
        ${name} ${provider.basic.credential || ''}
      </div>
      <div style="font-size: 11px; color: var(--text-muted); margin-bottom: 6px;">
        NPI: <strong>${provider.number}</strong> &bull; Taxonomy: ${provider.taxonomies[0]?.desc || 'N/A'}
      </div>
      <div style="font-size: 12px;">
        ${provider.addresses[0]?.address_1}, ${provider.addresses[0]?.city}, ${provider.addresses[0]?.state}
      </div>
    `;
    npiResults.appendChild(div);
  });
}
