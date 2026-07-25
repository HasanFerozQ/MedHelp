const fs = require('fs');
const path = require('path');

function getHtmlFiles(dir) {
  let results = [];
  const list = fs.readdirSync(dir);
  list.forEach(file => {
    const filePath = path.join(dir, file);
    const stat = fs.statSync(filePath);
    if (stat && stat.isDirectory()) {
      if (file !== 'node_modules' && file !== '.git' && file !== '__pycache__') {
        results = results.concat(getHtmlFiles(filePath));
      }
    } else if (file.endsWith('.html') && !file.includes('.bak')) {
      results.push(filePath);
    }
  });
  return results;
}

const htmlFiles = getHtmlFiles('.');
console.log(`Found ${htmlFiles.length} HTML files.`);

const ezoicPlacementSnippet = `  <!-- Ezoic Ad Placement -->
  <script>
    ezstandalone.cmd.push(function () {
      ezstandalone.showAds({});
    });
  </script>`;

let updatedCount = 0;

htmlFiles.forEach(file => {
  let content = fs.readFileSync(file, 'utf8');
  const original = content;

  // Check if placement snippet is already added
  if (!content.includes('ezstandalone.showAds')) {
    // Insert after navbar or right before </body> or inside top banner container
    if (content.includes('highperformanceformat.com')) {
      content = content.replace(/<script\s+src="https:\/\/www\.highperformanceformat\.com\/[^"]+\/invoke\.js"><\/script>/gi, `$&\n${ezoicPlacementSnippet}`);
      updatedCount++;
    } else if (content.includes('</body>')) {
      content = content.replace('</body>', `${ezoicPlacementSnippet}\n</body>`);
      updatedCount++;
    }
  }

  if (content !== original) {
    fs.writeFileSync(file, content, 'utf8');
  }
});

console.log(`Successfully added Ezoic placement snippet to ${updatedCount} HTML files.`);
