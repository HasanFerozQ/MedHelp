const https = require('https');

module.exports = async (req, res) => {
  const { number, first_name, last_name, organization_name, state } = req.query;

  // Build CMS NPPES API URL
  let url = 'https://npiregistry.cms.hhs.gov/api/?version=2.1&limit=20';

  if (number) {
    url += `&number=${number}`;
  } else {
    if (first_name) url += `&first_name=${encodeURIComponent(first_name)}`;
    if (last_name) url += `&last_name=${encodeURIComponent(last_name)}`;
    if (organization_name) url += `&organization_name=${encodeURIComponent(organization_name)}`;
    if (state) url += `&state=${encodeURIComponent(state)}`;
    
    // Heuristic for enumeration type
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
        res.status(200).json(jsonData);
      } catch (e) {
        res.status(500).json({ error: 'Failed to parse CMS response', details: e.message });
      }
    });
  }).on('error', (err) => {
    res.status(500).json({ error: 'CMS API request failed', details: err.message });
  });
};
