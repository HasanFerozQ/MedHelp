const fs = require('fs');
const html = fs.readFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html', 'utf8');

// Check for math rendering libraries
const hasMathJax = html.includes('mathjax') || html.includes('MathJax');
const hasKaTeX = html.includes('katex') || html.includes('KaTeX');
console.log('MathJax:', hasMathJax, '| KaTeX:', hasKaTeX);

// Check current usmle1 content
const u1idx = html.indexOf("'usmle1': [");
const u1end = html.indexOf("'usmle2': [", u1idx);
const u1block = html.substring(u1idx, Math.min(u1idx + 500, u1end > 0 ? u1end : u1idx + 500));
console.log('usmle1 found at:', u1idx);
console.log('usmle2 found at:', u1end);
console.log('usmle1 block snippet:', u1block.substring(0, 400));

// Check how many topics/cards in usmle1
const u1full = html.substring(u1idx, u1end > 0 ? u1end : u1idx + 5000);
const topicCount = (u1full.match(/topic\s*:\s*"/g) || []).length;
const cardCount = (u1full.match(/\{\s*q\s*:/g) || []).length;
console.log('Current usmle1 topics:', topicCount, '| cards:', cardCount);
