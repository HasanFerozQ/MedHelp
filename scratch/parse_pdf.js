const fs = require('fs');
const pdfjsLib = require('pdfjs-dist/legacy/build/pdf.js');

async function debugPDF(path) {
  const data = new Uint8Array(fs.readFileSync(path));
  const pdf = await pdfjsLib.getDocument({ data }).promise;
  const page = await pdf.getPage(1);
  const tc = await page.getTextContent();
  
  const yGroups = {};
  tc.items.forEach(item => {
    if (!item.str.trim()) return;
    const y = Math.round(item.transform[5] / 6) * 6;
    if (!yGroups[y]) yGroups[y] = [];
    yGroups[y].push({ str: item.str, x: item.transform[4] });
  });

  const sortedYs = Object.keys(yGroups).sort((a,b) => b - a);
  sortedYs.forEach(y => {
    const line = yGroups[y].sort((a,b) => a.x - b.x);
    console.log(`Y: ${y}`.padEnd(8) + '| ' + line.map(i => `[${Math.round(i.x)}: '${i.str}']`).join(' '));
  });
}

debugPDF('vision/FakeMedicalBill_WITH_ANOMALIES.pdf').catch(console.error);
