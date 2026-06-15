const fs = require('fs');
const html = fs.readFileSync('C:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html', 'utf8');

const startIdx = html.indexOf('const FLASH_DATA = {');
const endIdx = html.indexOf('</script>', startIdx);
const jsSection = html.substring(startIdx, endIdx);

// Extract year4 block
const y4Start = jsSection.indexOf("'year4': [");
const y4End = jsSection.indexOf("'usmle1': [");
const y4Block = jsSection.substring(y4Start, y4End);

console.log('year4 block length:', y4Block.length, 'chars');

// Count topics by counting topic: " occurrences
const topicMatches = y4Block.match(/topic\s*:\s*"/g) || [];
console.log('Total topics in year4:', topicMatches.length);

// Find each topic name and card count
const topicPattern = /topic\s*:\s*"([^"]+)"[\s\S]*?cards\s*:\s*\[/g;
let m;
let topicNum = 0;
const topics = [];
while ((m = topicPattern.exec(y4Block)) !== null) {
  topicNum++;
  const topicName = m[1];
  const afterCards = y4Block.substring(m.index + m[0].length);
  // Count card objects up to next topic or end
  const nextTopic = afterCards.search(/topic\s*:\s*"/);
  const cardBlock = nextTopic > 0 ? afterCards.substring(0, nextTopic) : afterCards;
  const cardCount = (cardBlock.match(/\{\s*q\s*:/g) || []).length;
  topics.push({ num: topicNum, name: topicName, cards: cardCount });
}

console.log('\nTopic breakdown:');
for (const t of topics) {
  const flag = t.cards < 70 ? ' <<< LOW' : '';
  console.log(`${t.num}. ${t.name}: ${t.cards} cards${flag}`);
}
console.log('\nTotal topics:', topics.length);
console.log('Total cards:', topics.reduce((s, t) => s + t.cards, 0));
console.log('Topics < 70 cards:', topics.filter(t => t.cards < 70).length);
console.log('Topics >= 80 cards:', topics.filter(t => t.cards >= 80).length);
