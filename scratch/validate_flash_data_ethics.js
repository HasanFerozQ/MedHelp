// Extract and validate FLASH_DATA from flash-cards.html
const fs = require('fs');

const html = fs.readFileSync('flash-cards.html', 'utf-8');

// Find the FLASH_DATA assignment
const startMarker = 'const FLASH_DATA = {';
const startIdx = html.indexOf(startMarker);
if (startIdx === -1) {
    console.log('ERROR: FLASH_DATA not found');
    process.exit(1);
}

// Extract from the { to matching }
let depth = 0;
let inString = false;
let stringChar = '';
let escape = false;
let endIdx = -1;
const searchStart = html.indexOf('{', startIdx);

for (let i = searchStart; i < html.length; i++) {
    const c = html[i];
    
    if (escape) { escape = false; continue; }
    if (c === '\\' && inString) { escape = true; continue; }
    
    if (inString) {
        if (c === stringChar) inString = false;
        continue;
    }
    
    if (c === '"' || c === "'" || c === '`') {
        inString = true;
        stringChar = c;
        continue;
    }
    
    if (c === '{') depth++;
    else if (c === '}') {
        depth--;
        if (depth === 0) {
            endIdx = i + 1;
            break;
        }
    }
}

const dataStr = html.substring(searchStart, endIdx);
console.log(`Extracted FLASH_DATA: ${dataStr.length.toLocaleString()} chars`);

// Try to parse with eval (in a function context)
try {
    const data = eval('(' + dataStr + ')');
    console.log('FLASH_DATA parsed successfully!');
    
    // Check keys
    const keys = Object.keys(data);
    console.log('Keys:', keys.join(', '));
    
    // Check year4
    if (data.year4) {
        console.log(`year4 topics: ${data.year4.length}`);
        
        // Group by section
        const sections = {};
        data.year4.forEach(t => {
            if (!sections[t.section]) sections[t.section] = [];
            sections[t.section].push(t);
        });
        
        for (const [section, topics] of Object.entries(sections)) {
            const totalCards = topics.reduce((sum, t) => sum + t.cards.length, 0);
            console.log(`  ${section}: ${topics.length} topics, ${totalCards} cards`);
        }
    }
} catch (e) {
    console.log('PARSE ERROR:', e.message);
    // Find approximate error location
    const match = e.message.match(/position (\d+)/);
    if (match) {
        const pos = parseInt(match[1]);
        console.log('Near:', dataStr.substring(pos - 100, pos + 100));
    }
    process.exit(1);
}
