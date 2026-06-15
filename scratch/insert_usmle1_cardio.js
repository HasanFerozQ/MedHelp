const fs = require('fs');
const path = require('path');

const { cardioCards } = require('./usmle1_cards_output/cardio_physiology.js');

// ==============================
// 1. Load the HTML file
// ==============================
const htmlPath = 'C:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html';
let html = fs.readFileSync(htmlPath, 'utf8');
console.log(`Loaded HTML file: ${(html.length / 1024 / 1024).toFixed(2)} MB`);

// ==============================
// 2. Build the new topic object as a JS string
// ==============================
function escapeForJS(str) {
  // Escape backticks and backslashes NOT already escaped
  // We'll use JSON.stringify for proper escaping, then tweak
  return JSON.stringify(str);
}

function buildTopicString(topicName, icon, section, cards) {
  const cardLines = cards.map(card => {
    const q = JSON.stringify(card.q);
    const a = JSON.stringify(card.a);
    return `        { q: ${q}, a: ${a} }`;
  });

  const sectionStr = section ? JSON.stringify(section) : 'undefined';

  return `{
        section: ${sectionStr},
        topic: "Cardiovascular Physiology",
        icon: "heart",
        cards: [
${cardLines.join(',\n')}
        ]
      }`;
}

const topicString = buildTopicString(
  "Cardiovascular Physiology",
  "heart",
  "Physiology",
  cardioCards
);

console.log(`Built topic string: ${(topicString.length / 1024).toFixed(1)} KB`);
console.log(`Total cards: ${cardioCards.length}`);

// ==============================
// 3. Find the usmle1 insertion point
// ==============================
const u1Marker = "'usmle1': [";
const u1Idx = html.indexOf(u1Marker);
if (u1Idx < 0) {
  console.error("ERROR: Could not find 'usmle1': [ in HTML file");
  process.exit(1);
}

// Find the closing ] of usmle1 (which is followed by 'usmle2')
const insertionPoint = u1Idx + u1Marker.length;
const currentContent = html.substring(insertionPoint, insertionPoint + 50);
console.log(`Content after usmle1 marker: "${currentContent.substring(0, 50)}"`);

// ==============================
// 4. Backup and insert
// ==============================
const backupPath = htmlPath + '.bak_usmle1';
fs.copyFileSync(htmlPath, backupPath);
console.log(`Backup created: ${backupPath}`);

// Insert the new topic at the start of the usmle1 array
const newHtml = html.substring(0, insertionPoint) +
  '\n      ' + topicString + '\n      ' +
  html.substring(insertionPoint);

fs.writeFileSync(htmlPath, newHtml, 'utf8');
console.log(`\nWrote updated HTML: ${(newHtml.length / 1024 / 1024).toFixed(2)} MB`);

// ==============================
// 5. Verify
// ==============================
const verify = fs.readFileSync(htmlPath, 'utf8');
const u1v = verify.indexOf("'usmle1': [");
const u2v = verify.indexOf("'usmle2': [");
const u1block = verify.substring(u1v, u2v);
const topicCount = (u1block.match(/topic\s*:\s*"/g) || []).length;
const cardCount = (u1block.match(/\{\s*q\s*:/g) || []).length;

console.log(`\n=== Verification ===`);
console.log(`usmle1 topics: ${topicCount}`);
console.log(`usmle1 cards: ${cardCount}`);
console.log(`Expected cards: ${cardioCards.length}`);

if (cardCount === cardioCards.length) {
  console.log(`SUCCESS: All ${cardCount} cards inserted correctly.`);
} else {
  console.error(`MISMATCH: Expected ${cardioCards.length}, found ${cardCount}`);
}
