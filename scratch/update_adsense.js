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

const newMetaTag = '<meta name="google-adsense-account" content="ca-pub-8367130148973046">';
let updatedCount = 0;

htmlFiles.forEach(file => {
  let content = fs.readFileSync(file, 'utf8');
  const original = content;

  // 1. Remove old AdSense script tags
  content = content.replace(/<script\s+async\s+src="https:\/\/pagead2\.googlesyndication\.com\/pagead\/js\/adsbygoogle\.js\?client=ca-pub-[0-9]+"[^>]*><\/script>\s*/gi, '');

  // 2. Remove old google-adsense-account meta tags if any exist
  content = content.replace(/<meta\s+name="google-adsense-account"\s+content="ca-pub-[0-9]+"\s*\/?>\s*/gi, '');

  // 3. Insert new meta tag into <head> if not already present
  if (!content.includes('ca-pub-8367130148973046')) {
    if (content.includes('<head>')) {
      content = content.replace('<head>', `<head>\n  ${newMetaTag}`);
      updatedCount++;
    } else if (/<head[^>]*>/i.test(content)) {
      content = content.replace(/<head[^>]*>/i, `$&\n  ${newMetaTag}`);
      updatedCount++;
    }
  }

  if (content !== original) {
    fs.writeFileSync(file, content, 'utf8');
  }
});

console.log(`Successfully updated ${updatedCount} HTML files with the new Google AdSense meta tag.`);
