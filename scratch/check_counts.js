const fs = require('fs');
const path = require('path');

const dir = 'c:/Users/Hasan-PC/Desktop/MedHelp/scratch/cards_output';
const files = fs.readdirSync(dir);

console.log('File Card Count Verification:');
files.forEach(file => {
  if (file.endsWith('.js')) {
    const filePath = path.join(dir, file);
    try {
      const content = require(filePath);
      console.log(`- ${file}: ${content.length} cards`);
    } catch (e) {
      console.log(`- ${file}: ERROR loading:`);
      console.error(e.stack || e);
    }
  }
});
