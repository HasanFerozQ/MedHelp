const fs = require('fs');
const { biochemCards } = require('./usmle1_cards_output/biochem_molecular.js');

const htmlPath = 'C:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html';
let html = fs.readFileSync(htmlPath, 'utf8');
console.log(`Loaded: ${(html.length / 1024 / 1024).toFixed(2)} MB`);
console.log(`Total biochem cards to insert: ${biochemCards.length}`);

// Build card strings
const cardLines = biochemCards.map(card => {
  const q = JSON.stringify(card.q);
  const a = JSON.stringify(card.a);
  return `        { q: ${q}, a: ${a} }`;
}).join(',\n');

const newTopic = `{
        section: "Biochemistry",
        topic: "Biochemistry & Molecular Biology",
        icon: "flask",
        cards: [
${cardLines}
        ]
      }`;

// Find usmle1 array and insert after last existing topic
const u1Marker = "'usmle1': [";
const u1Idx = html.indexOf(u1Marker);
if (u1Idx < 0) { console.error("usmle1 not found"); process.exit(1); }

const u2Idx = html.indexOf("'usmle2': [", u1Idx);
const u1Block = html.substring(u1Idx, u2Idx);
const lastBrace = u1Block.lastIndexOf('}');
const insertAbsolute = u1Idx + lastBrace + 1;

console.log(`Inserting after position: ${insertAbsolute}`);

// Backup
const backupPath = htmlPath + '.bak_biochem';
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
console.log(`Expected: 385 (prev) + ${biochemCards.length} (new) = ${385 + biochemCards.length}`);

if (cardCount === 385 + biochemCards.length) {
  console.log(`SUCCESS!`);
} else {
  console.warn(`NOTE: Found ${cardCount}`);
}
