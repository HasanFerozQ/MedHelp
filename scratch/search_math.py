const fs = require('fs');

const flashCardsPath = 'c:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html';
const htmlContent = fs.readFileSync(flashCardsPath, 'utf8');

const match = htmlContent.match(/const\s+FLASH_DATA\s*=\s*([\s\S]*?);\s*\n\s*(?:const|let|var|function|\/\/|\/\*|class|document|window)/);
let flashDataStr = '';
if (match) {
  flashDataStr = 'var FLASH_DATA = ' + match[1];
} else {
  const startIdx = htmlContent.indexOf('const FLASH_DATA =');
  let braceCount = 0;
  let inString = false;
  let stringChar = '';
  let escaped = false;
  let endIdx = -1;
  
  for (let i = htmlContent.indexOf('{', startIdx); i < htmlContent.length; i++) {
    const ch = htmlContent[i];
    if (escaped) { escaped = false; continue; }
    if (ch === '\\') { escaped = true; continue; }
    if (inString) {
      if (ch === stringChar) inString = false;
      continue;
    }
    if (ch === '"' || ch === "'") { inString = true; stringChar = ch; continue; }
    if (ch === '{') braceCount++;
    if (ch === '}') {
      braceCount--;
      if (braceCount === 0) { endIdx = i + 1; break; }
    }
  }
  flashDataStr = htmlContent.substring(startIdx, endIdx).replace('const FLASH_DATA =', 'var FLASH_DATA =');
}

eval(flashDataStr);

if (typeof FLASH_DATA !== 'undefined') {
  // Let's search all years except the year4 Obstetrics & Gynecology and Emergency Medicine we added
  for (const [year, topics] of Object.entries(FLASH_DATA)) {
    topics.forEach(t => {
      if (t.section === 'Obstetrics & Gynecology' || t.section === 'Emergency Medicine') {
        return; // skip
      }
      
      t.cards.forEach(c => {
        if (c.q.includes('$') || c.a.includes('$') || c.q.includes('\\') || c.a.includes('\\')) {
          console.log(`[${year}] "${t.topic}" has math/slash:`);
          console.log(`  q: ${c.q}`);
          console.log(`  a: ${c.a}`);
          console.log('-');
        }
      });
    });
  }
}
