const fs = require('fs');
const path = require('path');
const healthStats = require('../api/health-stats.js');

function callHandler(handler, url, query = {}) {
  return new Promise((resolve) => {
    let statusCode = 200;
    let headers = {};
    let body = '';

    const req = { url, query };
    const res = {
      status(code) { statusCode = code; return this; },
      setHeader(key, val) { headers[key] = val; },
      send(data) { body = data; resolve({ statusCode, headers, body }); },
      end() { resolve({ statusCode, headers, body }); }
    };

    handler(req, res);
  });
}

async function runTests() {
  console.log('=== STARTING NEW ISSUES VERIFICATION SUITE ===\n');

  // Test 1: Check meta charset byte offset in main HTML files
  console.log('Test 1: Checking <meta charset> byte offset (< 1024 bytes)...');
  const filesToCheck = ['index.html', 'flash-cards.html', 'blog-post.html', 'global-health-statistics-detail.html', 'medical-calculator.html'];
  let allCharsetPass = true;
  for (const f of filesToCheck) {
    const p = path.join(__dirname, '..', f);
    if (fs.existsSync(p)) {
      const content = fs.readFileSync(p, 'utf8');
      const idx = content.indexOf('<meta charset=');
      const offset = idx !== -1 ? Buffer.byteLength(content.slice(0, idx)) : -1;
      const pass = offset !== -1 && offset < 1024;
      if (!pass) allCharsetPass = false;
      console.log(`  ${f}: Offset = ${offset} bytes -> ${pass ? 'PASS' : 'FAIL'}`);
    }
  }
  console.log('  Charset Placement Result:', allCharsetPass ? 'PASS' : 'FAIL');

  // Test 2: Check flash-cards.html file size
  console.log('\nTest 2: Checking flash-cards.html file size (< 2MB)...');
  const fcPath = path.join(__dirname, '..', 'flash-cards.html');
  const fcStats = fs.statSync(fcPath);
  const sizeKB = (fcStats.size / 1024).toFixed(2);
  const sizeMB = (fcStats.size / (1024 * 1024)).toFixed(2);
  console.log(`  flash-cards.html Size: ${sizeKB} KB (${sizeMB} MB)`);
  console.log(`  Document Size Result (< 2MB): ${fcStats.size < 2000000 ? 'PASS' : 'FAIL'}`);

  // Test 3: Check missing H1 on health stats detail categories
  console.log('\nTest 3: Checking static/SSR <h1> tags on health statistics categories...');
  const categories = [
    'hepatitis-b-statistics-2026',
    'cancer-statistics-2026',
    'obesity-statistics-2026',
    'diabetes-statistics-2026',
    'cholera-statistics-2026',
    'malaria-statistics-2026',
    'heart-disease-statistics-2026',
    'stroke-statistics-2026',
    'covid19-statistics-2026',
    'hypertension-statistics-2026',
    'tuberculosis-statistics-2026',
    'kidney-disease-statistics-2026',
    'tobacco-statistics-2026',
    'hiv-aids-statistics-2026',
    'mental-health-statistics-2026'
  ];
  let allH1Pass = true;
  for (const cat of categories) {
    const res = await callHandler(healthStats, `/global-health-statistics/${cat}`, { category: cat });
    const hasH1 = /<h1[^>]*>.*?<\/h1>/i.test(res.body);
    if (!hasH1) allH1Pass = false;
  }
  console.log(`  Checked ${categories.length} Health Statistics Categories for H1 tags.`);
  console.log('  H1 Presence Result:', allH1Pass ? 'PASS' : 'FAIL');

  // Test 4: Check title & description length on index.html
  console.log('\nTest 4: Checking index.html Title & Description length...');
  const indexPath = path.join(__dirname, '..', 'index.html');
  const indexHtml = fs.readFileSync(indexPath, 'utf8');
  const titleMatch = indexHtml.match(/<title>([^<]+)<\/title>/);
  const descMatch = indexHtml.match(/<meta name="description" content="([^"]+)"/);
  const title = titleMatch ? titleMatch[1] : '';
  const desc = descMatch ? descMatch[1] : '';
  console.log(`  Title (${title.length} chars): "${title}"`);
  console.log(`  Description (${desc.length} chars): "${desc}"`);
  const titleOk = title.length <= 60;
  const descOk = desc.length >= 140 && desc.length <= 160;
  console.log('  Title & Description Length Result:', (titleOk && descOk) ? 'PASS' : 'FAIL');

  // Test 5: Check Accessibility styles in styles.css
  console.log('\nTest 5: Checking Accessibility helpers in styles.css...');
  const cssPath = path.join(__dirname, '..', 'styles.css');
  const css = fs.readFileSync(cssPath, 'utf8');
  const hasSkip = css.includes('.skip-to-content');
  const hasSrOnly = css.includes('.sr-only');
  console.log('  Accessibility Helpers Result:', (hasSkip && hasSrOnly) ? 'PASS' : 'FAIL');

  console.log('\n=== ALL NEW ISSUES VERIFICATION COMPLETED ===');
}

runTests();
