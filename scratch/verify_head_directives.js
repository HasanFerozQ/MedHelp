const fs = require('fs');
const path = require('path');

const rootDir = path.join(__dirname, '..');

function getHtmlFiles(dir, files = []) {
  const list = fs.readdirSync(dir);
  for (const item of list) {
    const full = path.join(dir, item);
    if (fs.statSync(full).isDirectory()) {
      if (item !== 'node_modules' && item !== '.git' && item !== 'brain') {
        getHtmlFiles(full, files);
      }
    } else if (item.endsWith('.html') && !item.endsWith('.bak')) {
      files.push(full);
    }
  }
  return files;
}

const htmlFiles = getHtmlFiles(rootDir);
console.log(`Verifying ${htmlFiles.length} HTML files...`);

let failed = 0;
for (const file of htmlFiles) {
  const content = fs.readFileSync(file, 'utf8');
  const headMatch = content.match(/<head\b[^>]*>([\s\S]*?)<\/head>/i);
  if (!headMatch) continue;

  const head = headMatch[1];
  const firstScriptIdx = head.search(/<script\b/i);
  const titleIdx = head.search(/<title\b/i);
  const canonicalIdx = head.search(/<link\s+rel="canonical"/i);
  const hreflangIdx = head.search(/hreflang=/i);

  const baseName = path.basename(file);
  let fileOk = true;

  if (firstScriptIdx !== -1) {
    if (titleIdx !== -1 && titleIdx > firstScriptIdx) {
      console.log(`  FAIL [Title after script]: ${baseName}`);
      fileOk = false;
    }
    if (canonicalIdx !== -1 && canonicalIdx > firstScriptIdx) {
      console.log(`  FAIL [Canonical after script]: ${baseName}`);
      fileOk = false;
    }
    if (hreflangIdx !== -1 && hreflangIdx > firstScriptIdx) {
      console.log(`  FAIL [Hreflang after script]: ${baseName}`);
      fileOk = false;
    }
  }

  if (!fileOk) failed++;
}

console.log(`\nVerification finished: ${htmlFiles.length - failed}/${htmlFiles.length} files PASSED clean head ordering!`);
