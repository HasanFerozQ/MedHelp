const https = require('https');

module.exports = async (req, res) => {
  const {
    number,
    first_name,
    last_name,
    organization_name,
    state,
    authorized_official_first_name,
    authorized_official_last_name,
    taxonomy_code,
    city
  } = req.query;

  // Validate exact NPI number format before forwarding
  if (number && !/^\d{10}$/.test(number)) {
    return res.status(400).json({ error: 'Invalid NPI number format. Must be exactly 10 digits.' });
  }

  let url = 'https://npiregistry.cms.hhs.gov/api/?version=2.1&limit=20';

  if (number) {
    // Exact NPI lookup — number only, no enumeration_type, no other filters
    url += `&number=${encodeURIComponent(number)}`;
  } else if (authorized_official_first_name || authorized_official_last_name) {
    // Reverse lookup: find organizations by their authorized official name
    if (authorized_official_first_name) url += `&authorized_official_first_name=${encodeURIComponent(authorized_official_first_name)}`;
    if (authorized_official_last_name)  url += `&authorized_official_last_name=${encodeURIComponent(authorized_official_last_name)}`;
    url += '&enumeration_type=NPI-2'; // Always orgs for reverse lookup
  } else {
    if (first_name)        url += `&first_name=${encodeURIComponent(first_name)}`;
    if (last_name)         url += `&last_name=${encodeURIComponent(last_name)}`;
    if (organization_name) url += `&organization_name=${encodeURIComponent(organization_name)}`;
    if (state)             url += `&state=${encodeURIComponent(state)}`;
    if (taxonomy_code)     url += `&taxonomy_code=${encodeURIComponent(taxonomy_code)}`;
    if (city)              url += `&city=${encodeURIComponent(city)}`;

    if (organization_name && !first_name && !last_name) {
      url += '&enumeration_type=NPI-2';
    } else if (first_name || last_name) {
      url += '&enumeration_type=NPI-1';
    }
  }

  https.get(url, (cmsRes) => {
    let data = '';
    cmsRes.on('data', (chunk) => { data += chunk; });
    cmsRes.on('end', () => {
      try {
        const jsonData = JSON.parse(data);
        // Surface result count in header for easier debugging
        res.setHeader('X-Result-Count', jsonData.result_count ?? 0);
        res.status(200).json(jsonData);
      } catch (e) {
        res.status(500).json({ error: 'Failed to parse CMS response', details: e.message });
      }
    });
  }).on('error', (err) => {
    // Log the full URL on failure so you can reproduce it
    console.error('[NPI Proxy] Request failed:', url, err.message);
    res.status(500).json({ error: 'CMS API request failed', details: err.message });
  });
};
