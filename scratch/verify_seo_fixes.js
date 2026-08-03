const esCalculator = require('../api/es-calculator.js');
const healthStats = require('../api/health-stats.js');
const blogApi = require('../api/blog.js');

function callHandler(handler, url, query = {}) {
  return new Promise((resolve) => {
    let statusCode = 200;
    let headers = {};
    let body = '';

    const req = {
      url: url,
      query: query
    };

    const res = {
      status(code) {
        statusCode = code;
        return this;
      },
      setHeader(key, val) {
        headers[key] = val;
      },
      send(data) {
        body = data;
        resolve({ statusCode, headers, body });
      },
      end() {
        resolve({ statusCode, headers, body });
      }
    };

    handler(req, res);
  });
}

async function runTests() {
  console.log('--- STARTING SEO VERIFICATION TESTS ---\n');

  // Test 1: Spanish Medical Calculator
  console.log('Test 1: Testing /es/medical-calculator API Handler...');
  const r1 = await callHandler(esCalculator, '/es/medical-calculator');
  console.log('  Status:', r1.statusCode);
  const canonicalMatch1 = r1.body.match(/<link rel="canonical" href="([^"]+)"/);
  const esHreflangMatch1 = r1.body.match(/<link rel="alternate" hreflang="es" href="([^"]+)"/);
  console.log('  Canonical Tag:', canonicalMatch1 ? canonicalMatch1[1] : 'MISSING');
  console.log('  Hreflang es:', esHreflangMatch1 ? esHreflangMatch1[1] : 'MISSING');
  console.log('  Asset check (/styles.css):', r1.body.includes('href="/styles.css"') ? 'PASS' : 'FAIL');
  console.log('  Asset check (/tabs/calculator/units.js):', r1.body.includes('src="/tabs/calculator/units.js') ? 'PASS' : 'FAIL');

  // Test 2: Spanish Sub-calculator
  console.log('\nTest 2: Testing /es/calculators/bmi-calculator API Handler...');
  const r2 = await callHandler(esCalculator, '/es/calculators/bmi-calculator');
  console.log('  Status:', r2.statusCode);
  const canonicalMatch2 = r2.body.match(/<link rel="canonical" href="([^"]+)"/);
  console.log('  Canonical Tag:', canonicalMatch2 ? canonicalMatch2[1] : 'MISSING');

  // Test 3: Health Stats - Cholera
  console.log('\nTest 3: Testing /global-health-statistics/cholera-statistics-2026...');
  const r3 = await callHandler(healthStats, '/global-health-statistics/cholera-statistics-2026', { category: 'cholera-statistics-2026' });
  const title3 = r3.body.match(/<title>([^<]+)<\/title>/);
  const desc3 = r3.body.match(/<meta name="description"[^>]*content="([^"]+)"/);
  console.log('  Title:', title3 ? title3[1] : 'MISSING');
  console.log('  Desc Length:', desc3 ? desc3[1].length : 0);
  console.log('  Desc:', desc3 ? desc3[1] : 'MISSING');

  // Test 4: Health Stats - Obesity
  console.log('\nTest 4: Testing /global-health-statistics/obesity-statistics-2026...');
  const r4 = await callHandler(healthStats, '/global-health-statistics/obesity-statistics-2026', { category: 'obesity-statistics-2026' });
  const title4 = r4.body.match(/<title>([^<]+)<\/title>/);
  const desc4 = r4.body.match(/<meta name="description"[^>]*content="([^"]+)"/);
  console.log('  Title:', title4 ? title4[1] : 'MISSING');
  console.log('  Desc Length:', desc4 ? desc4[1].length : 0);
  console.log('  Desc:', desc4 ? desc4[1] : 'MISSING');
  console.log('  Unique vs Cholera?:', desc3[1] !== desc4[1] ? 'PASS (UNIQUE)' : 'FAIL (DUPLICATE)');

  // Test 5: Blog Post
  console.log('\nTest 5: Testing /blog/Hantavirus_Another_Pandemic...');
  const r5 = await callHandler(blogApi, '/blog/Hantavirus_Another_Pandemic', { slug: 'Hantavirus_Another_Pandemic' });
  const title5 = r5.body.match(/<title>([^<]+)<\/title>/);
  const desc5 = r5.body.match(/<meta name="description"[^>]*content="([^"]+)"/);
  console.log('  Title:', title5 ? title5[1] : 'MISSING');
  console.log('  Desc Length:', desc5 ? desc5[1].length : 0);
  console.log('  Desc:', desc5 ? desc5[1] : 'MISSING');

  console.log('\n--- VERIFICATION COMPLETED ---');
}

runTests();
