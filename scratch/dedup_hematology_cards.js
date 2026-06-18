const fs = require('fs');
const { hematologyRawCardsWithDupes } = require('./hematology_raw_cards_with_dupes.js');

console.log(`Original cards: ${hematologyRawCardsWithDupes.length}`);

const uniqueCards = [];
const seenQ = new Set();

hematologyRawCardsWithDupes.forEach(card => {
  const key = card.q.toLowerCase().replace(/\s+/g, ' ').trim();
  if (!seenQ.has(key)) {
    seenQ.add(key);
    uniqueCards.push(card);
  }
});

console.log(`Unique cards: ${uniqueCards.length}`);
console.log(`Removed duplicates: ${hematologyRawCardsWithDupes.length - uniqueCards.length}`);

// Write the deduplicated file
let out = 'const hematologyRawCards = [\n';
uniqueCards.forEach((c, i) => {
  const q = JSON.stringify(c.q);
  const a = JSON.stringify(c.a);
  out += `  { q: ${q}, a: ${a} }${i < uniqueCards.length - 1 ? ',' : ''}\n`;
});
out += '];\n\nmodule.exports = { hematologyRawCards };\n';

fs.writeFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/scratch/hematology_raw_cards.js', out, 'utf8');
console.log('Written to hematology_raw_cards.js');
