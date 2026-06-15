const { embryoRawCards } = require('./embryo_raw_cards.js');

console.log('Total raw cards:', embryoRawCards.length);

const brCards = [];
const dashCards = [];
const arrowCards = [];

embryoRawCards.forEach((c, idx) => {
  if (c.a.includes('<br>')) {
    brCards.push({ idx, q: c.q, a: c.a });
  }
  if (c.a.includes('—')) {
    dashCards.push({ idx, q: c.q, a: c.a });
  }
  if (c.a.includes('→')) {
    arrowCards.push({ idx, q: c.q, a: c.a });
  }
});

console.log('\n--- Cards with <br> ---');
brCards.forEach(c => console.log(`[${c.idx}] Q: ${c.q}\n    A: ${c.a}`));

console.log('\n--- Cards with — ---');
dashCards.forEach(c => console.log(`[${c.idx}] Q: ${c.q}\n    A: ${c.a}`));

console.log('\n--- Cards with → ---');
arrowCards.forEach(c => console.log(`[${c.idx}] Q: ${c.q}\n    A: ${c.a}`));
