const fs = require('fs');
const path = require('path');

const flashCardsPath = 'c:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html';
const scratchDir = 'c:/Users/Hasan-PC/Desktop/MedHelp/scratch';

const topicsConfig = [
  { file: 'cards_normal_labor.js', varName: 'CARDS_NORMAL_LABOR', topic: 'Normal labor, delivery & postpartum care', icon: 'baby' },
  { file: 'cards_high_risk_preg.js', varName: 'CARDS_HIGH_RISK_PREG', topic: 'High-risk pregnancy — pre-eclampsia, GDM, placenta previa', icon: 'alert-triangle' },
  { file: 'cards_fetal_mon_emerg.js', varName: 'CARDS_FETAL_MON_EMERG', topic: 'Fetal monitoring & obstetric emergencies', icon: 'activity' },
  { file: 'cards_gyn_malignancies.js', varName: 'CARDS_GYN_MALIGNANCIES', topic: 'Gynecological malignancies — cervical, uterine, ovarian', icon: 'shield-alert' },
  { file: 'cards_benign_gyn.js', varName: 'CARDS_BENIGN_GYN', topic: 'Benign gynecology — fibroids, endometriosis, PCOS', icon: 'clipboard' },
  { file: 'cards_contraception.js', varName: 'CARDS_CONTRACEPTION', topic: 'Contraception & family planning', icon: 'heart' },
  { file: 'cards_menstrual_infertility.js', varName: 'CARDS_MENSTRUAL_INFERTILITY', topic: 'Menstrual disorders & infertility basics', icon: 'calendar' },
  { file: 'cards_neonatology.js', varName: 'CARDS_NEONATOLOGY', topic: 'Neonatology & newborn resuscitation', icon: 'baby' }
];

// Load and evaluate the cards
const topicsData = [];
let totalCards = 0;
topicsConfig.forEach(cfg => {
  const filePath = path.join(scratchDir, cfg.file);
  if (!fs.existsSync(filePath)) {
    throw new Error(`File ${cfg.file} does not exist!`);
  }
  const fileContent = fs.readFileSync(filePath, 'utf8');
  const arr = eval(fileContent + '\n' + cfg.varName);
  topicsData.push({
    topicName: cfg.topic,
    icon: cfg.icon,
    cards: arr
  });
  totalCards += arr.length;
  const status = arr.length >= 120 ? 'OK' : 'LOW';
  console.log(`[${status}] ${cfg.file}: ${arr.length} cards -> "${cfg.topic}"`);
});
console.log(`\nTotal ObGyn cards to inject: ${totalCards}\n`);

// Format the new topic objects
function formatCards(cards) {
  return cards.map(c => {
    return `            { q: ${JSON.stringify(c.q)}, a: ${JSON.stringify(c.a)} }`;
  }).join(',\n');
}

const newObjectsFormatted = topicsData.map(t => {
  return `        {
          section: 'Obstetrics & Gynecology',
          topic: ${JSON.stringify(t.topicName)},
          icon: ${JSON.stringify(t.icon)},
          cards: [
${formatCards(t.cards)}
          ]
        }`;
}).join(',\n');

// Read the HTML file
let htmlContent = fs.readFileSync(flashCardsPath, 'utf8');

// Strategy: Find 'year4': [ and then find the LAST topic object's closing, 
// then append our new objects before the array's closing ].
// We'll use a regex approach to find the insertion point.

// First, check if ObGyn topics already exist to avoid duplicate injection
if (htmlContent.includes("section: 'Obstetrics & Gynecology'")) {
  console.log('WARNING: Obstetrics & Gynecology section already exists in flash-cards.html!');
  console.log('Skipping injection to avoid duplicates.');
  process.exit(0);
}

// Find 'year4': [
const year4Match = htmlContent.indexOf("'year4': [");
if (year4Match === -1) {
  throw new Error("Could not find 'year4': [ in flash-cards.html");
}
console.log(`Found 'year4' at char offset ${year4Match}`);

// Find the next major section marker after year4 to know where year4 ends
// The structure is: 'year4': [ ... ], 'year5': [ ... ] or similar
// Let's find the pattern "],\n" followed by a year key, or "]" + "}" for end of FLASH_DATA
// Actually, let's find the closing of the year4 array by looking for the pattern
// that marks end of year4: a line containing just "]," or "]" followed by 'year' or '}'

// More robust: find the next 'yearX': [ after year4, and the ] before it is year4's closing
const afterYear4 = htmlContent.substring(year4Match + 10);

// Look for patterns like "'year5': [" or "'year6': [" or end of FLASH_DATA object
const nextSectionMatch = afterYear4.match(/\n\s+'year\d+'\s*:\s*\[/);
let year4EndOffset;

if (nextSectionMatch) {
  // The year4 array closes before the next section
  // Find the "]" or "]," before this match
  const nextSectionStart = nextSectionMatch.index;
  const beforeNextSection = afterYear4.substring(0, nextSectionStart);
  const lastCloseBracket = beforeNextSection.lastIndexOf(']');
  if (lastCloseBracket === -1) {
    throw new Error('Could not find closing bracket for year4 array');
  }
  year4EndOffset = year4Match + 10 + lastCloseBracket;
} else {
  // year4 might be the last section; find the closing of FLASH_DATA
  // Look for "]" followed by "}" on a subsequent line
  const endMatch = afterYear4.match(/\]\s*\n\s*\}/);
  if (!endMatch) {
    throw new Error('Could not find end of year4 array (last section)');
  }
  year4EndOffset = year4Match + 10 + endMatch.index;
}

console.log(`Year4 array closing ']' at char offset ${year4EndOffset}`);

// The insertion point is right before the closing ']' of year4
// We need to:
// 1. Check if there's a trailing comma after the last topic object
// 2. Insert our new topics

const beforeClose = htmlContent.substring(0, year4EndOffset);
const afterClose = htmlContent.substring(year4EndOffset);

// Add comma if needed
let insertionText;
const lastNonWhitespace = beforeClose.trimEnd();
if (lastNonWhitespace.endsWith(',')) {
  insertionText = '\n' + newObjectsFormatted + '\n';
} else if (lastNonWhitespace.endsWith('}')) {
  insertionText = ',\n' + newObjectsFormatted + '\n';
} else {
  insertionText = ',\n' + newObjectsFormatted + '\n';
}

const updatedHtml = beforeClose + insertionText + afterClose;

// Write to temp file first for validation
const tempOut = path.join(scratchDir, 'temp_flash_cards_obgyn.html');
fs.writeFileSync(tempOut, updatedHtml, 'utf8');
console.log(`\nWrote temp file (${(updatedHtml.length / 1024 / 1024).toFixed(2)} MB)`);

// Validate by extracting FLASH_DATA
const match = updatedHtml.match(/const\s+FLASH_DATA\s*=\s*([\s\S]*?);\s*\n\s*(?:const|let|var|function|\/\/|\/\*|class|document|window)/);
if (!match) {
  // Fallback: try simpler match
  console.log('Using fallback FLASH_DATA extraction...');
  const startIdx = updatedHtml.indexOf('const FLASH_DATA =');
  if (startIdx === -1) throw new Error('Cannot find FLASH_DATA');
  
  // Find the matching closing brace by counting
  let braceCount = 0;
  let inString = false;
  let stringChar = '';
  let escaped = false;
  let endIdx = -1;
  
  for (let i = updatedHtml.indexOf('{', startIdx); i < updatedHtml.length; i++) {
    const ch = updatedHtml[i];
    if (escaped) { escaped = false; continue; }
    if (ch === '\\') { escaped = true; continue; }
    if (inString) {
      if (ch === stringChar) inString = false;
      continue;
    }
    if (ch === '"' || ch === "'") { inString = true; stringChar = ch; continue; }
    if (ch === '{') braceCount++;
    if (ch === '}') {
      braceCount--;
      if (braceCount === 0) { endIdx = i + 1; break; }
    }
  }
  
  if (endIdx === -1) throw new Error('Cannot find FLASH_DATA closing brace');
  
  const flashDataStr = updatedHtml.substring(startIdx, endIdx).replace('const FLASH_DATA =', 'var FLASH_DATA =');
  try {
    eval(flashDataStr);
  } catch(e) {
    throw new Error('FLASH_DATA eval failed: ' + e.message);
  }
} else {
  const flashDataStr = 'var FLASH_DATA = ' + match[1];
  try {
    eval(flashDataStr);
  } catch(e) {
    throw new Error('FLASH_DATA eval failed: ' + e.message);
  }
}

if (typeof FLASH_DATA !== 'undefined' && FLASH_DATA.year4) {
  const obgynTopics = FLASH_DATA.year4.filter(x => x.section === 'Obstetrics & Gynecology');
  console.log(`\nValidation PASSED! Found ${obgynTopics.length} ObGyn topics in year4:`);
  let obgynTotal = 0;
  obgynTopics.forEach(t => {
    console.log(`  ✓ "${t.topic}": ${t.cards.length} cards`);
    obgynTotal += t.cards.length;
  });
  console.log(`  Total ObGyn cards: ${obgynTotal}`);
  console.log(`  Total year4 topics: ${FLASH_DATA.year4.length}`);
} else {
  throw new Error('FLASH_DATA.year4 not found after eval!');
}

// All checks passed, overwrite flash-cards.html
fs.writeFileSync(flashCardsPath, updatedHtml, 'utf8');
console.log('\n✅ Successfully updated flash-cards.html with Obstetrics & Gynecology topics!');
