const fs = require('fs');
const { respiratoryCards } = require('./usmle1_cards_output/respiratory_physiology.js');

const htmlPath = 'C:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html';
let html = fs.readFileSync(htmlPath, 'utf8');
console.log(`Loaded: ${(html.length / 1024 / 1024).toFixed(2)} MB`);
console.log(`Total respiratory cards to insert: ${respiratoryCards.length}`);

// Build new topic object string
const cardLines = respiratoryCards.map(card => {
  const q = JSON.stringify(card.q);
  const a = JSON.stringify(card.a);
  return `        { q: ${q}, a: ${a} }`;
}).join(',\n');

const newTopic = `{
        section: "Physiology",
        topic: "Respiratory Physiology",
        icon: "wind",
        cards: [
${cardLines}
        ]
      }`;

// Find usmle1 array and insert new topic AFTER existing Cardiovascular topic
const u1Marker = "'usmle1': [";
const u1Idx = html.indexOf(u1Marker);
if (u1Idx < 0) { console.error("usmle1 not found"); process.exit(1); }

// Find the end of existing topic (closing } of the cardio topic object)
// then insert our new topic after it
const insertAfter = "'usmle1': [";
const insertPos = u1Idx + insertAfter.length;

// Find the end of the first topic object: look for }  followed by whitespace and then ] (end of usmle1)
// Strategy: find closing ']' of usmle1 array, insert before it
const u2Idx = html.indexOf("'usmle2': [", u1Idx);
const u1Block = html.substring(u1Idx, u2Idx);

// Find the last } before the closing ] of usmle1
const lastBrace = u1Block.lastIndexOf('}');
const insertAbsolute = u1Idx + lastBrace + 1;

console.log(`Inserting after position: ${insertAbsolute}`);
console.log(`Context: "${html.substring(insertAbsolute - 20, insertAbsolute + 30)}"`);

// Backup
const backupPath = htmlPath + '.bak_resp';
fs.copyFileSync(htmlPath, backupPath);
console.log(`Backup: ${backupPath}`);

const newHtml =
  html.substring(0, insertAbsolute) +
  ',\n      ' + newTopic + '\n      ' +
  html.substring(insertAbsolute);

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
console.log(`Expected: 182 (cardio) + ${respiratoryCards.length} (resp) = ${182 + respiratoryCards.length}`);

if (cardCount === 182 + respiratoryCards.length) {
  console.log(`SUCCESS: All ${cardCount} cards verified!`);
} else {
  console.warn(`NOTE: Found ${cardCount}`);
}
