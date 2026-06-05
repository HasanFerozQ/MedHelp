const fs = require('fs');
const path = require('path');

const htmlPath = 'c:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html';
const html = fs.readFileSync(htmlPath, 'utf8');

// Find all script blocks
const regex = /<script>([\s\S]*?)<\/script>/g;
let match;
let flashDataFound = false;

while ((match = regex.exec(html)) !== null) {
  const scriptContent = match[1];
  if (scriptContent.includes('const FLASH_DATA =')) {
    // We found the script block containing FLASH_DATA.
    // Let's execute it in a sandbox or via eval.
    // To do this safely, we can wrap it or just eval it in node.
    // Since FLASH_DATA might be const, let's replace const with var or global.
    let codeToRun = scriptContent.replace('const FLASH_DATA =', 'global.FLASH_DATA =');
    
    // Also mock DOM elements/API if the script tries to run DOM code.
    // Actually, we can just cut everything after the FLASH_DATA definition.
    const endOfDataIdx = codeToRun.indexOf('let currentTab =');
    if (endOfDataIdx !== -1) {
      codeToRun = codeToRun.substring(0, endOfDataIdx);
    }
    
    try {
      eval(codeToRun);
      flashDataFound = true;
      break;
    } catch (e) {
      console.log('Error evaluating FLASH_DATA block:', e.message);
    }
  }
}

if (!flashDataFound) {
  console.log('Could not find or evaluate FLASH_DATA in flash-cards.html');
  process.exit(1);
}

// Print stats
console.log('FLASH_DATA successfully loaded!');
Object.keys(global.FLASH_DATA).forEach(year => {
  const topics = global.FLASH_DATA[year];
  console.log(`\n=== ${year} ===`);
  console.log(`Number of topics: ${topics.length}`);
  let totalCards = 0;
  topics.forEach((t, idx) => {
    console.log(`  Topic ${idx + 1}: [${t.section}] ${t.topic} -> ${t.cards.length} cards`);
    totalCards += t.cards.length;
  });
  console.log(`Total cards in ${year}: ${totalCards}`);
});
