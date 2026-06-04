const fs = require('fs');
const h = fs.readFileSync('c:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html', 'utf8');

const startIdx = h.indexOf('const FLASH_DATA =');
if (startIdx === -1) { console.log('FAIL: no FLASH_DATA'); process.exit(1); }

const braceStart = h.indexOf('{', startIdx);
let bc = 0, inStr = false, sc = '', esc = false, endIdx = -1;

for (let i = braceStart; i < h.length; i++) {
  const c = h[i];
  if (esc) { esc = false; continue; }
  if (c === '\\') { esc = true; continue; }
  if (inStr) { if (c === sc) inStr = false; continue; }
  if (c === '"' || c === "'") { inStr = true; sc = c; continue; }
  if (c === '{') bc++;
  if (c === '}') { bc--; if (bc === 0) { endIdx = i + 1; break; } }
}

if (endIdx === -1) { console.log('FAIL: no closing brace'); process.exit(1); }

const decl = 'var FLASH_DATA = ' + h.substring(braceStart, endIdx);
try {
  eval(decl);
  console.log('FLASH_DATA eval: SUCCESS');
  
  const y4 = FLASH_DATA.year4;
  console.log('year4 topics:', y4.length);
  
  const obgyn = y4.filter(x => x.section === 'Obstetrics & Gynecology');
  console.log('ObGyn topics:', obgyn.length);
  
  let tot = 0;
  obgyn.forEach(t => {
    console.log('  ' + t.topic + ': ' + t.cards.length + ' cards');
    tot += t.cards.length;
  });
  console.log('Total ObGyn cards:', tot);
  
  // Validate other years too
  console.log('\nyear1 topics:', FLASH_DATA.year1.length);
  console.log('year2 topics:', FLASH_DATA.year2.length);
  console.log('year3 topics:', FLASH_DATA.year3.length);
  
  // Total card count
  let grandTotal = 0;
  Object.keys(FLASH_DATA).forEach(key => {
    const arr = FLASH_DATA[key];
    if (Array.isArray(arr)) {
      let keyTotal = 0;
      arr.forEach(t => { if (t.cards) keyTotal += t.cards.length; });
      grandTotal += keyTotal;
      console.log(key + ': ' + arr.length + ' topics, ' + keyTotal + ' cards');
    }
  });
  console.log('\nGRAND TOTAL: ' + grandTotal + ' cards across all years');
} catch(e) {
  console.log('EVAL FAIL:', e.message.substring(0, 500));
  process.exit(1);
}
