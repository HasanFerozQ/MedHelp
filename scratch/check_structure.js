const fs = require('fs');
const html = fs.readFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html', 'utf8');

// Find the FLASH_DATA object
const startIdx = html.indexOf('const FLASH_DATA = {');
if (startIdx < 0) {
  console.log('ERROR: FLASH_DATA not found!');
  process.exit(1);
}

// Search for year-like keys inside JS section (up to 50MB)
const endIdx = html.indexOf('</script>', startIdx);
const jsSection = html.substring(startIdx, endIdx);

console.log('JS section length:', jsSection.length);
console.log('File size:', (html.length / 1024 / 1024).toFixed(2), 'MB');

// Find all top-level keys by looking for patterns like 'key': [ or "key": [
const keyMatches = jsSection.match(/^\s{0,6}['"]?(\w+)['"]?\s*:\s*\[/gm);
if (keyMatches) {
  console.log('Top-level keys found:', [...new Set(keyMatches)].map(s => s.trim()));
} else {
  console.log('No top-level array keys found');
}

// Count topics per year
const years = ['year1', 'year2', 'year3', 'year4', 'usmle1', 'usmle2', 'usmle3'];
for (const yr of years) {
  const re = new RegExp("'" + yr + "'\\s*:\\s*\\[|\"" + yr + "\"\\s*:\\s*\\[", 'g');
  const m = jsSection.match(re);
  if (m) {
    // Count topic objects inside
    const yrStart = jsSection.search(new RegExp("'" + yr + "'|\"" + yr + "\""));
    const snippet = jsSection.substring(yrStart, yrStart + 100);
    console.log(yr + ' found at offset ' + yrStart + ': ' + snippet.substring(0, 80));
  }
}
