const fs = require('fs');
const path = require('path');

function getHtmlFiles(dir) {
  let results = [];
  const list = fs.readdirSync(dir);
  list.forEach(file => {
    const filePath = path.join(dir, file);
    const stat = fs.statSync(filePath);
    if (stat && stat.isDirectory()) {
      if (file !== 'node_modules' && file !== '.git' && file !== '__pycache__') {
        results = results.concat(getHtmlFiles(filePath));
      }
    } else if (file.endsWith('.html') && !file.includes('.bak')) {
      results.push(filePath);
    }
  });
  return results;
}

const htmlFiles = getHtmlFiles('.');
console.log(`Found ${htmlFiles.length} HTML files.`);

const ezoicHeaderBlock = `  <!-- Ezoic Privacy & Header Scripts -->
  <script data-cfasync="false" src="https://cmp.gatekeeperconsent.com/min.js"></script>
  <script data-cfasync="false" src="https://the.gatekeeperconsent.com/cmp.min.js"></script>
  <script async src="//www.ezojs.com/ezoic/sa.min.js"></script>
  <script>
    window.ezstandalone = window.ezstandalone || {};
    ezstandalone.cmd = ezstandalone.cmd || [];
  </script>
  <script src="//ezoanalytics.com/analytics.js"></script>`;

let updatedCount = 0;

htmlFiles.forEach(file => {
  let content = fs.readFileSync(file, 'utf8');
  const original = content;

  // Don't duplicate if already present
  if (!content.includes('sa.min.js') && !content.includes('gatekeeperconsent.com')) {
    if (content.includes('<head>')) {
      content = content.replace('<head>', `<head>\n${ezoicHeaderBlock}`);
      updatedCount++;
    } else if (/<head[^>]*>/i.test(content)) {
      content = content.replace(/<head[^>]*>/i, `$&\n${ezoicHeaderBlock}`);
      updatedCount++;
    }
  }

  if (content !== original) {
    fs.writeFileSync(file, content, 'utf8');
  }
});

console.log(`Successfully inserted Ezoic Privacy & Header scripts into ${updatedCount} HTML files.`);
