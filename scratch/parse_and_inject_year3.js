const fs = require('fs');
const path = require('path');

const flashCardsPath = 'c:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html';
const scratchDir = 'c:/Users/Hasan-PC/Desktop/MedHelp/scratch';

const topicsConfig = [
  { file: 'cards_history_pe.js', varName: 'CARDS_HISTORY_PE', topic: 'History taking & physical examination' },
  { file: 'cards_ecg.js', varName: 'CARDS_ECG', topic: 'ECG interpretation' },
  { file: 'cards_cxr.js', varName: 'CARDS_CXR', topic: 'Chest X-ray & basic radiology reading' },
  { file: 'cards_abg.js', varName: 'CARDS_ABG', topic: 'ABG interpretation' },
  { file: 'cards_labs.js', varName: 'CARDS_LABS', topic: 'Common lab interpretation (CBC, CMP, LFTs)' },
  { file: 'cards_clinical_reasoning.js', varName: 'CARDS_CLINICAL_REASONING', topic: 'Clinical reasoning & differential diagnosis' }
];

// Load and evaluate the cards
const topicsData = [];
topicsConfig.forEach(cfg => {
  const filePath = path.join(scratchDir, cfg.file);
  const fileContent = fs.readFileSync(filePath, 'utf8');
  const arr = eval(fileContent + '\n' + cfg.varName);
  topicsData.push({
    topicName: cfg.topic,
    cards: arr
  });
  console.log(`Loaded ${arr.length} cards for topic: "${cfg.topic}"`);
});

// Format the replacements
const blocks = topicsData.map((t, idx) => {
  const cardsFormatted = t.cards.map(c => {
    return `            { q: ${JSON.stringify(c.q)}, a: ${JSON.stringify(c.a)} }`;
  }).join(',\n');

  return `{
          section: 'Clinical Skills & Diagnostics',
          topic: ${JSON.stringify(t.topicName)},
          icon: 'stethoscope',
          cards: [
${cardsFormatted}
          ]
        }`;
}).join(',\n        ');

// Read the original html file
const htmlContent = fs.readFileSync(flashCardsPath, 'utf8');
const lines = htmlContent.split(/\r?\n/);

// Find the target lines to replace
// We want to replace from:
// {
//           section: 'Clinical Skills & Diagnostics',
// ...
// to the end of the Clinical Skills & Diagnostics topics.
// Let's find line index for line 34401 (0-indexed 34400) and line 34574 (0-indexed 34573).

const startPattern = "section: 'Clinical Skills & Diagnostics'";
const endPattern = "Framingham criteria."; // From the last card of the last topic

let startIndex = -1;
let endIndex = -1;

for (let i = 34000; i < Math.min(34800, lines.length); i++) {
  if (lines[i].includes(startPattern) && startIndex === -1) {
    // Back up to find the opening bracket '{' of this object
    let j = i;
    while (j >= 34000) {
      if (lines[j].trim() === '{') {
        startIndex = j;
        break;
      }
      j--;
    }
  }
  if (lines[i].includes(endPattern)) {
    // Look forward to find the closing bracket '}' of the topic object
    let j = i;
    while (j < lines.length) {
      if (lines[j].trim() === '}') {
        endIndex = j;
        break;
      }
      j++;
    }
  }
}

if (startIndex === -1 || endIndex === -1) {
  throw new Error(`Could not find the target replacement region in flash-cards.html (startIndex: ${startIndex}, endIndex: ${endIndex})`);
}

console.log(`Target region found in flash-cards.html: line ${startIndex + 1} to line ${endIndex + 1}`);

// Perform replacement
const newLines = [
  ...lines.slice(0, startIndex),
  blocks,
  ...lines.slice(endIndex + 1)
];

const updatedHtml = newLines.join('\n');

// Write out to a temporary file first
const tempOut = path.join(scratchDir, 'temp_flash_cards.html');
fs.writeFileSync(tempOut, updatedHtml, 'utf8');
console.log('Wrote temporary updated file to temp_flash_cards.html');

// Validate the syntax of the generated file
// To validate, we want to extract the FLASH_DATA script part and verify it evaluates correctly in Node.
const match = updatedHtml.match(/const\s+FLASH_DATA\s*=\s*[\s\S]*?};/);
if (!match) {
  throw new Error('Could not find FLASH_DATA definition in the updated file!');
}

try {
  const flashDataDeclaration = match[0].replace('const FLASH_DATA =', 'var FLASH_DATA =') + ';';
  // evaluate it
  eval(flashDataDeclaration);
  console.log('FLASH_DATA syntax validation: SUCCESS!');
  if (typeof FLASH_DATA !== 'undefined' && FLASH_DATA.year3) {
    const clinicalSection = FLASH_DATA.year3.filter(x => x.section === 'Clinical Skills & Diagnostics');
    console.log(`Validation details: Found ${clinicalSection.length} topics in Clinical Skills & Diagnostics.`);
    clinicalSection.forEach(t => {
      console.log(`  - "${t.topic}": ${t.cards.length} cards`);
    });
  } else {
    throw new Error('FLASH_DATA is undefined or lacks year3!');
  }
} catch (e) {
  throw new Error(`FLASH_DATA validation failed: ${e.message}\nDeclaration snippet:\n${match[0].slice(0, 500)}`);
}

// All checks passed, overwrite flash-cards.html
fs.writeFileSync(flashCardsPath, updatedHtml, 'utf8');
console.log('Successfully updated flash-cards.html!');
