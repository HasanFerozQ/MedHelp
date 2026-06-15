const fs = require('fs');
const { renalCards } = require('./usmle1_cards_output/renal_physiology.js');

const htmlPath = 'C:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html';
let html = fs.readFileSync(htmlPath, 'utf8');
console.log(`Loaded HTML size: ${(html.length / 1024 / 1024).toFixed(2)} MB`);
console.log(`Total renal cards to insert: ${renalCards.length}`);

// Build card strings
const cardLines = renalCards.map(card => {
  const q = JSON.stringify(card.q);
  const a = JSON.stringify(card.a);
  return `            { q: ${q}, a: ${a} }`;
}).join(',\n');

const newTopic = `{
          section: "Physiology",
          topic: "Renal Physiology",
          icon: "droplet",
          cards: [
${cardLines}
          ]
        }`;

// Find usmle1 array and insert after last existing topic (which is Biochemistry)
const u1Marker = "'usmle1': [";
const u1Idx = html.indexOf(u1Marker);
if (u1Idx < 0) {
  console.error("usmle1 array not found");
  process.exit(1);
}

const u2Idx = html.indexOf("'usmle2': [", u1Idx);
if (u2Idx < 0) {
  console.error("usmle2 array not found");
  process.exit(1);
}

const u1Block = html.substring(u1Idx, u2Idx);
const lastBrace = u1Block.lastIndexOf('}');
if (lastBrace < 0) {
  console.error("No topics found inside usmle1 block");
  process.exit(1);
}
const insertAbsolute = u1Idx + lastBrace + 1;

console.log(`Inserting at index: ${insertAbsolute}`);

// Backup
const backupPath = htmlPath + '.bak_renal';
fs.copyFileSync(htmlPath, backupPath);
console.log(`Backup saved to: ${backupPath}`);

const newHtml =
  html.substring(0, insertAbsolute) +
  ',\n        ' + newTopic + '\n        ' +
  html.substring(insertAbsolute);

fs.writeFileSync(htmlPath, newHtml, 'utf8');
console.log(`Wrote new HTML size: ${(newHtml.length / 1024 / 1024).toFixed(2)} MB`);

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
console.log(`Expected topics: 4 (Cardio, Respiratory, Biochem, Renal)`);
console.log(`Expected cards: 479 (prev) + ${renalCards.length} (new) = ${479 + renalCards.length}`);

if (cardCount === 479 + renalCards.length) {
  console.log(`SUCCESS!`);
} else {
  console.warn(`WARNING: Card count mismatch. Found ${cardCount}`);
}
