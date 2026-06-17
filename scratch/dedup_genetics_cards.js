const fs = require('fs');
const { geneticsRawCardsWithDupes } = require('./genetics_raw_cards_with_dupes.js');

console.log(`Original cards: ${geneticsRawCardsWithDupes.length}`);

const uniqueCards = [];
const seenQ = new Set();

geneticsRawCardsWithDupes.forEach(c => {
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
const outputContent = `const geneticsRawCards = ${JSON.stringify(uniqueCards, null, 2)};\nmodule.exports = { geneticsRawCards };\n`;
fs.writeFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/scratch/genetics_raw_cards.js', outputContent, 'utf8');
console.log('Successfully wrote to scratch/genetics_raw_cards.js');
