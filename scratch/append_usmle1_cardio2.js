const fs = require('fs');
const { cardioCards2 } = require('./usmle1_cards_output/cardio_physiology2.js');

const htmlPath = 'C:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html';
let html = fs.readFileSync(htmlPath, 'utf8');
console.log(`Loaded: ${(html.length / 1024 / 1024).toFixed(2)} MB`);

// Find the existing usmle1 Cardiovascular Physiology topic
// and locate the end of its cards array to append new cards
const u1Idx = html.indexOf("'usmle1': [");
const u1End = html.indexOf("'usmle2': [", u1Idx);
const u1Block = html.substring(u1Idx, u1End);

// Find the closing of the cards array in the first (and only) topic
// Look for the last }   ] pattern before the topic closes
// The structure is: cards: [ {q:..., a:...}, ... ]
// We need to insert before the closing ] of the cards array

// Find "cards: [" inside u1 block
const cardsOpen = u1Block.lastIndexOf("cards: [");
if (cardsOpen < 0) {
  console.error("ERROR: Could not find 'cards: [' in usmle1 block");
  process.exit(1);
}

// Find the matching closing ] for the cards array
// We'll search from after cardsOpen for the pattern that ends the cards array
// The cards array ends at ] followed by whitespace and }  (end of topic object)
let depth = 0;
let cardsStartAbsolute = u1Idx + cardsOpen + 8; // 8 = length of "cards: ["
let pos = cardsStartAbsolute;
let cardsEndAbsolute = -1;

for (let i = pos; i < u1End + u1Idx; i++) {
  if (html[i] === '[' || html[i] === '{') depth++;
  if (html[i] === ']' || html[i] === '}') {
    if (depth === 0) {
      cardsEndAbsolute = i;
      break;
    }
    depth--;
  }
}

if (cardsEndAbsolute < 0) {
  console.error("ERROR: Could not find end of cards array");
  process.exit(1);
}

console.log(`Cards array end found at position: ${cardsEndAbsolute}`);
console.log(`Current cards end context: "${html.substring(cardsEndAbsolute - 30, cardsEndAbsolute + 30)}"`);

// Build new card entries string
const newCardLines = cardioCards2.map(card => {
  const q = JSON.stringify(card.q);
  const a = JSON.stringify(card.a);
  return `        { q: ${q}, a: ${a} }`;
}).join(',\n');

// Insert before the closing ]
const newHtml =
  html.substring(0, cardsEndAbsolute) +
  ',\n' + newCardLines + '\n        ' +
  html.substring(cardsEndAbsolute);

fs.writeFileSync(htmlPath, newHtml, 'utf8');
console.log(`\nWrote updated file: ${(newHtml.length / 1024 / 1024).toFixed(2)} MB`);

// Verify
const verify = fs.readFileSync(htmlPath, 'utf8');
const v1Idx = verify.indexOf("'usmle1': [");
const v1End = verify.indexOf("'usmle2': [", v1Idx);
const v1Block = verify.substring(v1Idx, v1End);
const cardCount = (v1Block.match(/\{\s*q\s*:/g) || []).length;

console.log(`\n=== Verification ===`);
console.log(`Total cards in usmle1 Cardiovascular Physiology: ${cardCount}`);
console.log(`Expected: 72 (existing) + ${cardioCards2.length} (new) = ${72 + cardioCards2.length}`);

if (cardCount === 72 + cardioCards2.length) {
  console.log(`SUCCESS: All ${cardCount} cards verified!`);
} else {
  console.warn(`NOTE: Found ${cardCount}, expected ${72 + cardioCards2.length}`);
}
