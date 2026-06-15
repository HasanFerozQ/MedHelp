const fs = require('fs');
const html = fs.readFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html', 'utf8');

const startIdx = html.indexOf("'usmle1': [");
const endIdx = html.indexOf("'usmle2': [", startIdx);
if (startIdx === -1 || endIdx === -1) {
  console.error("Could not find usmle1 or usmle2");
  process.exit(1);
}

let u1Block = html.substring(startIdx, endIdx).trim();
if (u1Block.endsWith(',')) {
  u1Block = u1Block.slice(0, -1);
}
const code = u1Block.replace("'usmle1':", "module.exports =");
const tempFile = 'C:/Users/Hasan-PC/Desktop/MedHelp/scratch/temp_u1.js';
fs.writeFileSync(tempFile, code, 'utf8');
try {
  const topics = require(tempFile);
  console.log(`Found ${topics.length} topics in usmle1:`);
  topics.forEach((t, idx) => {
    console.log(`${idx + 1}. ${t.topic} (${t.section}): ${t.cards.length} cards`);
  });
} catch (e) {
  console.error("Error requiring temp file:", e);
} finally {
  if (fs.existsSync(tempFile)) fs.unlinkSync(tempFile);
}
