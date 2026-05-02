const fs = require('fs');
const https = require('https');
const path = require('path');

require('dotenv').config();

const API_KEY = process.env.INDEXNOW_KEY || '60d19d6ca538448995707da3c61b8e6f';
const HOST = process.env.SITE_HOST || 'www.medihelp.live';
const KEY_LOCATION = `https://${HOST}/${API_KEY}.txt`;
const SITEMAP_PATH = path.join(__dirname, '../sitemap.xml');

async function submitToIndexNow() {
  try {
    if (!fs.existsSync(SITEMAP_PATH)) {
      console.error(`Sitemap not found at: ${SITEMAP_PATH}`);
      return;
    }

    const sitemapContent = fs.readFileSync(SITEMAP_PATH, 'utf8');
    const urlRegex = /<loc>(https?:\/\/[^<]+)<\/loc>/g;
    const urls = [];
    let match;

    while ((match = urlRegex.exec(sitemapContent)) !== null) {
      urls.push(match[1]);
    }

    if (urls.length === 0) {
      console.error('No URLs found in sitemap.xml');
      return;
    }

    // Filter out potential duplicates and ensure unique URLs
    const uniqueUrls = [...new Set(urls)];

    console.log(`Found ${uniqueUrls.length} unique URLs. Submitting to IndexNow...`);

    const data = JSON.stringify({
      host: HOST,
      key: API_KEY,
      keyLocation: KEY_LOCATION,
      urlList: uniqueUrls,
    });

    const options = {
      hostname: 'api.indexnow.org',
      port: 443,
      path: '/IndexNow',
      method: 'POST',
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Content-Length': Buffer.byteLength(data),
      },
    };

    const req = https.request(options, (res) => {
      console.log(`Status Code: ${res.statusCode}`);
      
      let responseBody = '';
      res.on('data', (chunk) => {
        responseBody += chunk;
      });

      res.on('end', () => {
        if (res.statusCode === 200 || res.statusCode === 202) {
          console.log(`Success: URLs submitted successfully (Status: ${res.statusCode}).`);
        } else {
          console.error(`Error: Received status code ${res.statusCode}`);
          console.error('Response:', responseBody);
          console.log('\nTip: If you just deployed, wait 2-3 minutes for the verification file to be indexed by search engines.');
        }
      });
    });

    req.on('error', (error) => {
      console.error('Error submitting to IndexNow:', error);
    });

    req.write(data);
    req.end();
  } catch (error) {
    console.error('Failed to read sitemap or submit URLs:', error);
  }
}

submitToIndexNow();
