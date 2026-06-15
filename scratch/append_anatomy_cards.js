const fs = require('fs');
const { anatomyAppendCards } = require('./usmle1_cards_output/anatomy_append.js');

const htmlPath = 'C:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html';
let html = fs.readFileSync(htmlPath, 'utf8');
console.log(`Loaded HTML: ${(html.length / 1024 / 1024).toFixed(2)} MB`);
console.log(`Cards to append: ${anatomyAppendCards.length}`);

// Find the Anatomy topic inside usmle1
const u1Idx = html.indexOf("'usmle1': [");
const u2Idx = html.indexOf("'usmle2': [", u1Idx);
const u1Block = html.substring(u1Idx, u2Idx);

// Find "Anatomy" topic within u1Block
const anatIdx = u1Block.indexOf('topic: "Anatomy"');
if (anatIdx < 0) { console.error('Anatomy topic not found'); process.exit(1); }

// From that point, find "cards: [" and then track to its closing "]"
const cardsStart = u1Block.indexOf('cards: [', anatIdx);
if (cardsStart < 0) { console.error('cards array not found'); process.exit(1); }

// Walk forward to find the matching closing "]" of this cards array
let depth = 0;
let i = cardsStart + 'cards: '.length; // position at "["
let cardsEnd = -1;
for (; i < u1Block.length; i++) {
  if (u1Block[i] === '[') depth++;
  else if (u1Block[i] === ']') {
    depth--;
    if (depth === 0) { cardsEnd = i; break; }
  }
}
if (cardsEnd < 0) { console.error('Could not find end of cards array'); process.exit(1); }

// The absolute position in html of the closing "]"
const absCardsEnd = u1Idx + cardsEnd;

// Build the new card lines
const newCardLines = anatomyAppendCards.map(card => {
  const q = JSON.stringify(card.q);
  const a = JSON.stringify(card.a);
  return `            { q: ${q}, a: ${a} }`;
}).join(',\n');

// Backup
const backupPath = htmlPath + '.bak_anatomy2';
fs.copyFileSync(htmlPath, backupPath);
console.log(`Backup: ${backupPath}`);

// Insert before the closing "]" of the cards array
const newHtml =
  html.substring(0, absCardsEnd) +
  ',\n' + newCardLines + '\n          ' +
  html.substring(absCardsEnd);

fs.writeFileSync(htmlPath, newHtml, 'utf8');
console.log(`Wrote: ${(newHtml.length / 1024 / 1024).toFixed(2)} MB`);

// Verify
const verify = fs.readFileSync(htmlPath, 'utf8');
const v1Idx = verify.indexOf("'usmle1': [");
const v2Idx = verify.indexOf("'usmle2': [", v1Idx);
const v1Block = verify.substring(v1Idx, v2Idx);
const topicCount = (v1Block.match(/topic\s*:\s*"/g) || []).length;
const cardCount = (v1Block.match(/\{\s*q\s*:/g) || []).length;

console.log(`\n=== Verification ===`);
console.log(`Topics in usmle1: ${topicCount}`);
console.log(`Total cards in usmle1: ${cardCount}`);
const prev = 1892;
const expected = prev + anatomyAppendCards.length;
console.log(`Expected: ${prev} + ${anatomyAppendCards.length} = ${expected}`);

if (cardCount === expected) {
  console.log(`✅ SUCCESS!`);
} else {
  console.warn(`⚠️ Mismatch: found ${cardCount}, expected ${expected}`);
}
