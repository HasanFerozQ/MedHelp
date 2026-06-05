// More detailed error finding for FLASH_DATA
const fs = require('fs');

const html = fs.readFileSync('flash-cards.html', 'utf-8');

// Find year4 ethics section specifically
const ethicsStart = html.indexOf("section: 'Ethics, Law & Health Systems'");
if (ethicsStart === -1) {
    console.log('Ethics section not found!');
    process.exit(1);
}

console.log('Ethics section found at index:', ethicsStart);

// Try just the first ethics topic block
// Go back to find the opening {
let blockStart = ethicsStart;
while (blockStart > 0 && html[blockStart] !== '{') blockStart--;

// Find matching close
let depth = 0;
let blockEnd = blockStart;
let inStr = false;
let strChar = '';
let esc = false;
for (let i = blockStart; i < html.length; i++) {
    const c = html[i];
    if (esc) { esc = false; continue; }
    if (c === '\\' && inStr) { esc = true; continue; }
    if (inStr) {
        if (c === strChar) inStr = false;
        continue;
    }
    if (c === '"' || c === "'" || c === '`') {
        inStr = true;
        strChar = c;
        continue;
    }
    if (c === '{') depth++;
    else if (c === '}') {
        depth--;
        if (depth === 0) {
            blockEnd = i + 1;
            break;
        }
    }
}

const firstBlock = html.substring(blockStart, blockEnd);
console.log('First ethics topic block length:', firstBlock.length);

// Try to eval just this block
try {
    eval('(' + firstBlock + ')');
    console.log('First ethics topic block: VALID');
} catch(e) {
    console.log('First ethics topic block ERROR:', e.message);
    // Show the problematic area
    const lines = firstBlock.split('\n');
    console.log('Total lines:', lines.length);
    // Try line by line to find error
    let partial = '';
    for (let i = 0; i < lines.length; i++) {
        partial += lines[i] + '\n';
        try {
            eval('(' + partial + '})'); // try closing it
        } catch(e2) {
            if (e2.message.includes('Unexpected')) {
                // Only report if it's not just an incomplete object
                if (i > 5 && !e2.message.includes('end of input')) {
                    console.log(`Error near line ${i}: ${lines[i].substring(0, 120)}`);
                    console.log(`  ${e2.message}`);
                    break;
                }
            }
        }
    }
}

// Also try the existing (pre-ethics) data to see if the error is pre-existing
const usmle1 = html.indexOf("'usmle1'");
const year4Start = html.indexOf("'year4'", html.indexOf('const FLASH_DATA'));
console.log('\n--- Testing year4 section before Ethics ---');
const preEthicsEnd = ethicsStart;
// Find the topic before Ethics
let prevTopicEnd = preEthicsEnd;
// Search backwards for },
while (prevTopicEnd > year4Start) {
    if (html.substring(prevTopicEnd-2, prevTopicEnd) === '},') break;
    prevTopicEnd--;
}
console.log('Prev topic ends at:', prevTopicEnd);
console.log('Context around prev topic end:', JSON.stringify(html.substring(prevTopicEnd-50, prevTopicEnd+50)));
