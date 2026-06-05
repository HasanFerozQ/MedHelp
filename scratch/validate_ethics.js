const fs = require('fs');
const path = require('path');
const file = path.join(__dirname, 'cards_ethics_principles.js');
const content = fs.readFileSync(file, 'utf8');
try {
  eval(content);
  console.log("Syntax is VALID!");
  console.log("Number of cards:", CARDS_ETHICS_PRINCIPLES.length);
  // Check if every card has q and a properties and correct formatting
  let ok = true;
  CARDS_ETHICS_PRINCIPLES.forEach((c, idx) => {
    if (!c.q || typeof c.q !== 'string') {
      console.log(`Card ${idx} has invalid or missing 'q'`);
      ok = false;
    }
    if (!c.a || typeof c.a !== 'string') {
      console.log(`Card ${idx} has invalid or missing 'a'`);
      ok = false;
    }
  });
  if (ok) {
    console.log("All cards have valid structure!");
  }
} catch (e) {
  console.error("Syntax ERROR:", e);
}
