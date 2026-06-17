const fs = require('fs');
const { pharmacologyRawCardsWithDupes } = require('./pharmacology_raw_cards_with_dupes.js');

console.log(`Original cards: ${pharmacologyRawCardsWithDupes.length}`);

const uniqueCards = [];
const seenQ = new Set();

pharmacologyRawCardsWithDupes.forEach(c => {
  const normQ = c.q.trim().toLowerCase().replace(/\s+/g, ' ');
  if (!seenQ.has(normQ)) {
    seenQ.add(normQ);
    uniqueCards.push(c);
  } else {
    // Find the existing card
    const existing = uniqueCards.find(x => x.q.trim().toLowerCase().replace(/\s+/g, ' ') === normQ);
    console.log(`Duplicate found for question: "${c.q}"`);
    console.log(`  Existing Answer: "${existing.a}"`);
    console.log(`  New Answer:      "${c.a}"`);
    // Keep the one with longer/more detailed answer if they differ
    if (c.a.length > existing.a.length) {
      console.log(`  -> Replacing with longer answer.`);
      existing.a = c.a;
    }
  }
});

console.log(`Deduplicated cards count: ${uniqueCards.length}`);

// Write unique cards
const outputContent = `const pharmacologyRawCards = ${JSON.stringify(uniqueCards, null, 2)};\nmodule.exports = { pharmacologyRawCards };\n`;
fs.writeFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/scratch/pharmacology_raw_cards.js', outputContent, 'utf8');
console.log('Successfully wrote to scratch/pharmacology_raw_cards.js');
