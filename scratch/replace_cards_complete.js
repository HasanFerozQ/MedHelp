const fs = require('fs');
const path = require('path');

const htmlPath = 'c:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html';
const backupPath = 'c:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html.bak3';
const cardsOutputDir = 'c:/Users/Hasan-PC/Desktop/MedHelp/scratch/cards_output';

// 1. Read flash-cards.html
console.log('Reading flash-cards.html...');
const html = fs.readFileSync(htmlPath, 'utf8');

// 2. Extract and parse FLASH_DATA block
console.log('Extracting FLASH_DATA block...');
const match = html.match(/const\s+FLASH_DATA\s*=\s*([\s\S]*?});/);
if (!match) {
  console.error('ERROR: Could not find FLASH_DATA definition in HTML!');
  process.exit(1);
}

const flashDataJs = match[0].replace('const FLASH_DATA =', 'global.FLASH_DATA =');
try {
  eval(flashDataJs);
  console.log('Successfully parsed original FLASH_DATA.');
} catch (e) {
  console.error('ERROR parsing original FLASH_DATA:', e.message);
  process.exit(1);
}

const flashData = global.FLASH_DATA;
if (!flashData || !flashData.year4) {
  console.error('ERROR: year4 is missing from FLASH_DATA!');
  process.exit(1);
}

// 3. Define the file mapping for Topics 41 to 60 (indexes 40 to 59 in year4)
const mapping = [
  'step2ck_multisystem_vignettes.js',
  'step2ck_diagnostic_reasoning.js',
  'step2ck_pharmacotherapy.js',
  'step2ck_surgical_vs_medical.js',
  'step2ck_labs_imaging_biopsies.js',
  'geri_physiological_aging.js',
  'geri_falls_gait.js',
  'geri_delirium_dementia.js',
  'geri_urinary_incontinence.js',
  'geri_immobility_pressure_ulcers.js',
  'geri_malnutrition_weight_loss.js',
  'geri_polypharmacy_beers.js',
  'geri_cognitive_disorders.js',
  'geri_functional_assessment.js',
  'geri_osteoporosis.js',
  'geri_sensory_changes.js',
  'geri_cardiovascular_elderly.js',
  'geri_end_of_life.js',
  'geri_elder_abuse.js',
  'geri_social_determinants.js'
];

console.log('Updating last 20 topics with generated cards...');
for (let i = 0; i < 20; i++) {
  const topicIdx = 40 + i;
  const fileName = mapping[i];
  const filePath = path.join(cardsOutputDir, fileName);
  
  if (!fs.existsSync(filePath)) {
    console.error(`ERROR: File not found: ${filePath}`);
    process.exit(1);
  }
  
  console.log(`- Loading Topic ${topicIdx + 1} from ${fileName}...`);
  let cards;
  try {
    cards = require(filePath);
  } catch (e) {
    console.error(`ERROR loading ${fileName}:`, e.message);
    process.exit(1);
  }
  
  if (!Array.isArray(cards)) {
    console.error(`ERROR: ${fileName} did not export an array!`);
    process.exit(1);
  }
  
  if (cards.length < 80) {
    console.error(`ERROR: ${fileName} only has ${cards.length} cards (minimum 80 required)!`);
    process.exit(1);
  }
  
  // Update the cards in the FLASH_DATA object
  flashData.year4[topicIdx].cards = cards;
}

// 4. Validate all year4 topics have the required counts
console.log('\nValidating year4 card counts:');
let totalCards = 0;
flashData.year4.forEach((t, idx) => {
  console.log(`  Topic ${idx + 1}: ${t.topic} -> ${t.cards.length} cards`);
  totalCards += t.cards.length;
  if (idx >= 40 && t.cards.length < 80) {
    console.error(`ERROR: Topic ${idx + 1} has only ${t.cards.length} cards (expected >= 80)!`);
    process.exit(1);
  }
});
console.log(`Total cards in year4: ${totalCards}`);

// 5. Serialize the updated FLASH_DATA object back to JS code
console.log('\nSerializing updated FLASH_DATA...');
function serializeFlashData(fd) {
  let out = "const FLASH_DATA = {\n";
  const years = Object.keys(fd);
  years.forEach((year, yIdx) => {
    out += `      '${year}': [\n`;
    const topics = fd[year];
    topics.forEach((t, tIdx) => {
      out += `        {\n`;
      out += `          section: ${JSON.stringify(t.section)},\n`;
      out += `          topic: ${JSON.stringify(t.topic)},\n`;
      out += `          icon: ${JSON.stringify(t.icon)},\n`;
      out += `          cards: [\n`;
      t.cards.forEach((c, cIdx) => {
        out += `            { q: ${JSON.stringify(c.q)}, a: ${JSON.stringify(c.a)} }${cIdx < t.cards.length - 1 ? ',' : ''}\n`;
      });
      out += `          ]\n`;
      out += `        }${tIdx < topics.length - 1 ? ',' : ''}\n`;
    });
    out += `      ]${yIdx < years.length - 1 ? ',' : ''}\n`;
  });
  out += "    };";
  return out;
}

const serializedCode = serializeFlashData(flashData);

// Verify the serialized code compiles cleanly
try {
  const testEval = serializedCode.replace('const FLASH_DATA =', 'global.TEST_FLASH_DATA =');
  eval(testEval);
  console.log('Serialization verification: SUCCESS!');
} catch (e) {
  console.error('ERROR: Serialized code contains syntax errors!', e.message);
  process.exit(1);
}

// 6. Write back to flash-cards.html
console.log(`Creating backup of flash-cards.html at ${backupPath}...`);
fs.writeFileSync(backupPath, html, 'utf8');

console.log('Writing updated FLASH_DATA to flash-cards.html...');
const updatedHtml = html.replace(match[0], serializedCode);
fs.writeFileSync(htmlPath, updatedHtml, 'utf8');

console.log('Master merge and update successfully completed!');
