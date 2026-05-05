const fs = require('fs');
const content = fs.readFileSync('c:\\Users\\Hasan-PC\\Desktop\\MedHelp\\ent_laryngeal_disorders_caseblocks_50.sql', 'utf8');
const regex = /'\[(.*?)\]'/g;
let match;
let errors = [];
while ((match = regex.exec(content)) !== null) {
  try {
    JSON.parse('[' + match[1] + ']');
  } catch (e) {
    errors.push({ line: content.substring(0, match.index).split('\n').length, text: match[0], error: e.message });
  }
}
console.log(JSON.stringify(errors, null, 2));
