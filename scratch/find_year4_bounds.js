const fs = require('fs');

const htmlPath = 'c:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html';
const html = fs.readFileSync(htmlPath, 'utf8');

// Let's locate 'year4': [
const startIdx = html.indexOf("'year4': [");
if (startIdx === -1) {
  console.log("Could not find 'year4': [");
  process.exit(1);
}

console.log(`'year4': [ starts at index: ${startIdx}`);

// Let's find 'usmle1': [
const endIdx = html.indexOf("'usmle1': [", startIdx);
if (endIdx === -1) {
  console.log("Could not find 'usmle1': [ after year4");
  process.exit(1);
}
console.log(`'usmle1': [ starts at index: ${endIdx}`);

// Let's print the segment of html around the start and end of year4
console.log('\n--- START OF year4 SEGMENT ---');
console.log(html.substring(startIdx, startIdx + 300));

console.log('\n--- END OF year4 SEGMENT ---');
console.log(html.substring(endIdx - 300, endIdx + 100));
