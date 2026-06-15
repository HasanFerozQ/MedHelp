const fs = require('fs');
const html = fs.readFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html', 'utf8');
const u1idx = html.indexOf("'usmle1': [");
const u1end = html.indexOf("'usmle2': [", u1idx);
const u1block = html.substring(u1idx, u1end);

const lines = u1block.split('\n');
const matches = [];
for (const line of lines) {
  if (line.toLowerCase().includes('ectoderm')) {
    matches.push(line.trim());
  }
}
console.log(matches);
