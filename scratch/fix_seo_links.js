const fs = require('fs');
const path = require('path');

const projectDir = 'c:\\Users\\Hasan-PC\\Desktop\\MedHelp';
const htmlFiles = fs.readdirSync(projectDir)
  .filter(file => file.endsWith('.html'))
  .map(file => path.join(projectDir, file));

function processFile(filePath) {
  let content = fs.readFileSync(filePath, 'utf8');
  let originalContent = content;

  // Fix internal links, handling optional leading slash and optional query params / hash
  // Matches href="index.html", href="/index.html", href="blog-post.html?slug=...", href="/audit.html#suite"
  content = content.replace(/href="\/?([a-zA-Z0-9-]+)\.html([?#][^"]*)?"/g, (match, pageName, suffix) => {
    suffix = suffix || '';
    if (pageName === 'index') {
      return `href="/${suffix}"`;
    }
    return `href="/${pageName}${suffix}"`;
  });

  if (content !== originalContent) {
    fs.writeFileSync(filePath, content, 'utf8');
    console.log(`Updated: ${path.basename(filePath)}`);
  } else {
    console.log(`No changes needed: ${path.basename(filePath)}`);
  }
}

htmlFiles.forEach(processFile);

// Also check popup.html
const popupHtml = path.join(projectDir, 'popup', 'popup.html');
if (fs.existsSync(popupHtml)) {
  let content = fs.readFileSync(popupHtml, 'utf8');
  let newContent = content.replace(/https:\/\/medihelp\.live\/([a-zA-Z0-9-]+)\.html/g, 'https://www.medihelp.live/$1');
  if (content !== newContent) {
    fs.writeFileSync(popupHtml, newContent, 'utf8');
    console.log('Updated: popup.html');
  }
}

console.log('Done processing HTML files.');
