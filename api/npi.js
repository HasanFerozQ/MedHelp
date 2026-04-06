module.exports = async (req, res) => {
  const { number, first_name, last_name, organization_name, state } = req.query;

  // Build CMS NPPES API URL
  let url = 'https://npiregistry.cms.hhs.gov/api/?version=2.1&limit=15';

  if (number) url += `&number=${number}`;
  if (first_name) url += `&first_name=${encodeURIComponent(first_name)}`;
  if (last_name) url += `&last_name=${encodeURIComponent(last_name)}`;
  if (organization_name) url += `&organization_name=${encodeURIComponent(organization_name)}`;
  if (state) url += `&state=${encodeURIComponent(state)}`;

  try {
    const response = await fetch(url);
    if (!response.ok) {
      const errorText = await response.text();
      return res.status(response.status).json({ error: `CMS API error: ${response.status}`, details: errorText });
    }
    const data = await response.json();
    res.status(200).json(data);
  } catch (error) {
    console.error('Npi Proxy Error:', error);
    res.status(500).json({ error: 'Internal Server Error while proxying NPI search', details: error.message });
  }
};
