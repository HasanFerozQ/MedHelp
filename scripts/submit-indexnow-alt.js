const fs = require('fs');
const https = require('https');
const path = require('path');

const API_KEY = process.env.INDEXNOW_KEY || '60d19d6ca538448995707da3c61b8e6f';
const SITEMAP_PATH = path.join(__dirname, '../sitemap.xml');

function submit(hostToUse) {
  try {
    if (!fs.existsSync(SITEMAP_PATH)) return console.error('sitemap not found');
    const sitemapContent = fs.readFileSync(SITEMAP_PATH, 'utf8');
    const urlRegex = /<loc>(https?:\/\/[^<]+)<\/loc>/g;
    const urls = [];
    let m;
    while ((m = urlRegex.exec(sitemapContent)) !== null) urls.push(m[1]);
    if (!urls.length) return console.error('no urls');
    const uniqueUrls = [...new Set(urls)].map(u => u.replace('https://medihelp.live', 'https://www.medihelp.live'));
    const data = JSON.stringify({ host: hostToUse, key: API_KEY, urlList: uniqueUrls });
    const options = { hostname: 'www.bing.com', port: 443, path: '/indexnow', method: 'POST', headers: { 'Content-Type': 'application/json; charset=utf-8', 'Content-Length': Buffer.byteLength(data) } };
    const req = https.request(options, (res) => {
      console.log('Status Code:', res.statusCode);
      let resp = '';
      res.on('data', c => resp += c);
      res.on('end', () => console.log('Response:', resp));
    });
    req.on('error', e => console.error('err', e));
    req.write(data); req.end();
  } catch (e) { console.error(e); }
}

console.log('Submitting with host: medihelp.live');
submit('medihelp.live');
console.log('Submitting with host: www.medihelp.live');
submit('www.medihelp.live');
