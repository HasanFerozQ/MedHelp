const fs = require('fs');
const { neuropharmacologyRawCardsWithDupes } = require('./neuropharmacology_raw_cards_with_dupes.js');

console.log(`Original cards: ${neuropharmacologyRawCardsWithDupes.length}`);

const uniqueCards = [];
const seenQ = new Set();

neuropharmacologyRawCardsWithDupes.forEach(card => {
  const key = card.q.toLowerCase().replace(/\s+/g, ' ').trim();
  if (!seenQ.has(key)) {
    seenQ.add(key);
    uniqueCards.push(card);
  }
});

console.log(`Unique cards: ${uniqueCards.length}`);
console.log(`Removed duplicates: ${neuropharmacologyRawCardsWithDupes.length - uniqueCards.length}`);

let out = 'const neuropharmacologyRawCards = [\n';
uniqueCards.forEach((c, i) => {
  const q = JSON.stringify(c.q);
  const a = JSON.stringify(c.a);
  out += `  { q: ${q}, a: ${a} }${i < uniqueCards.length - 1 ? ',' : ''}\n`;
});
out += '];\n\nmodule.exports = { neuropharmacologyRawCards };\n';

fs.writeFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/scratch/neuropharmacology_raw_cards.js', out, 'utf8');
console.log('Written to neuropharmacology_raw_cards.js');
