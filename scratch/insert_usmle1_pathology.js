const fs = require('fs');
const { pathologyCards } = require('./usmle1_cards_output/pathology.js');

const htmlPath = 'C:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html';
let html = fs.readFileSync(htmlPath, 'utf8');
console.log(`Loaded HTML: ${(html.length/1024/1024).toFixed(2)} MB | Cards to insert: ${pathologyCards.length}`);

const cardLines = pathologyCards.map(c =>
  `            { q: ${JSON.stringify(c.q)}, a: ${JSON.stringify(c.a)} }`
).join(',\n');

const newTopic = `{
          section: "Basic Sciences",
          topic: "Pathology",
          icon: "microscope",
          cards: [
${cardLines}
          ]
        }`;

const u1Idx = html.indexOf("'usmle1': [");
const u2Idx = html.indexOf("'usmle2': [", u1Idx);
const u1Block = html.substring(u1Idx, u2Idx);
const lastBrace = u1Block.lastIndexOf('}');
const insertAt = u1Idx + lastBrace + 1;

fs.copyFileSync(htmlPath, htmlPath + '.bak_pathology');
console.log(`Backup: ${htmlPath}.bak_pathology`);

const newHtml = html.substring(0, insertAt) + ',\n        ' + newTopic + '\n        ' + html.substring(insertAt);
fs.writeFileSync(htmlPath, newHtml, 'utf8');
console.log(`Wrote: ${(newHtml.length/1024/1024).toFixed(2)} MB`);

// Verify
const v = fs.readFileSync(htmlPath, 'utf8');
const vi1 = v.indexOf("'usmle1': ["), vi2 = v.indexOf("'usmle2': [", vi1);
const vBlock = v.substring(vi1, vi2);
const topics = (vBlock.match(/topic\s*:\s*"/g)||[]).length;
const cards  = (vBlock.match(/\{\s*q\s*:/g)||[]).length;
const prev = 1966, expected = prev + pathologyCards.length;
console.log(`\n=== Verification ===\nTopics: ${topics} | Cards: ${cards}\nExpected: ${prev} + ${pathologyCards.length} = ${expected}`);
console.log(cards === expected ? '✅ SUCCESS!' : `⚠️ Mismatch: found ${cards}`);
