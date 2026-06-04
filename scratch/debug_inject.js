const fs = require('fs');

const flashCardsPath = 'c:/Users/Hasan-PC/Desktop/MedHelp/flash-cards.html';
const htmlContent = fs.readFileSync(flashCardsPath, 'utf8');

const searchStr = "'year4': [";
const year4Match = htmlContent.indexOf(searchStr);
if (year4Match === -1) {
  console.log("Could not find 'year4': [");
  process.exit(1);
}

console.log("Year4 block starts around:", htmlContent.substring(year4Match, year4Match + 200));

// Find where "Emergency Medicine" is in the file
const emIndex = htmlContent.indexOf("section: 'Emergency Medicine'");
if (emIndex === -1) {
  console.log("Could not find section: 'Emergency Medicine' in the file!");
} else {
  console.log("Found 'Emergency Medicine' at char index", emIndex);
  console.log("Context around 'Emergency Medicine':");
  console.log(htmlContent.substring(emIndex - 200, emIndex + 300));
}

// Let's print the end of the year4 block
const afterYear4 = htmlContent.substring(year4Match + 10);
const nextSectionMatch = afterYear4.match(/\n\s+'year\d+'\s*:\s*\[/);
if (nextSectionMatch) {
  const nextSectionStart = nextSectionMatch.index;
  console.log("Next section starts at offset:", nextSectionStart);
  console.log("End of year4 block looks like:");
  console.log(afterYear4.substring(nextSectionStart - 300, nextSectionStart + 200));
} else {
  console.log("Could not find next section match!");
}
